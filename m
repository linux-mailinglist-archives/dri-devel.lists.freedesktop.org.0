Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBBE13D5DF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 09:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E476EC31;
	Thu, 16 Jan 2020 08:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584FC6EBD1;
 Thu, 16 Jan 2020 04:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g2O7+C2E3x8zMqGkIw0J+Ras/2kPdtJrH6vgSjyfjdU=; b=NXF7ATWhl9Aw2V28PadqBdwiM
 iXCRnWTOLEqkb6iR6GP2N9wOodWZ/vQo7OhCCZ8EHbSv21XkYtW3TRWIphD8XxL7hZGYHI09msyq6
 KTy1yiNKpbpY4/cpfsP3+P+HoyL4kHRmDdV8qfmw3t74RDjuzaZNJSQzSAvLo6/xTgEnHI00GIeML
 5Sin0Rqj6Jbt1Dj51zrqiead+yqS1hwcse2NG4G4kRFktXWxebKuoIf3RZePVRZOzd4KpyeX2R6Pw
 CW59VNdb5HSVGjLgaOA1bDp9V6CZyHpeJxpG4R4FP59j5SGQ6dfTM6gktyp1yPM6sH2dssKRjbj3u
 evVlYRzEQ==;
Received: from [2601:1c0:6280:3f0::ed68]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irxF8-0008N7-4e; Thu, 16 Jan 2020 04:58:54 +0000
Subject: Re: [PATCH] drm/amdgpu/display: Use u64 divide macro for round up
 division
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 mikita.lipski@amd.com
References: <20200113132042.25717-1-mikita.lipski@amd.com>
 <20200113170722.GS13686@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <99a19537-11ad-6723-40e1-a2d355903f5b@infradead.org>
Date: Wed, 15 Jan 2020 20:58:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200113170722.GS13686@intel.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 16 Jan 2020 08:21:03 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Alexander.Deucher@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMS8xMy8yMCA5OjA3IEFNLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gT24gTW9uLCBKYW4g
MTMsIDIwMjAgYXQgMDg6MjA6NDJBTSAtMDUwMCwgbWlraXRhLmxpcHNraUBhbWQuY29tIHdyb3Rl
Ogo+PiBGcm9tOiBNaWtpdGEgTGlwc2tpIDxtaWtpdGEubGlwc2tpQGFtZC5jb20+Cj4+Cj4+IFt3
aHldCj4+IEZpeCBjb21waWxhdGlvbiB3YXJuaW5ncyBvbiBpMzg2IGFyY2hpdGVjdHVyZToKPj4g
dW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX191ZGl2ZGkzJwo+PiBbaG93XQo+PiBTd2l0Y2ggRElW
X1JPVU5EX1VQIHRvIERJVjY0X1U2NF9ST1VORF9VUAo+Pgo+PiBSZXBvcnRlZC1ieTogUmFuZHkg
RHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+Cj4+IFNpZ25lZC1vZmYtYnk6IE1pa2l0YSBM
aXBza2kgPG1pa2l0YS5saXBza2lAYW1kLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYyB8IDIgKy0KPj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0
X3R5cGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bV9tc3RfdHlwZXMuYwo+PiBpbmRleCA1MmZiMjA3MzkzZWYuLjk2YjM5MWU0YjNlNyAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1f
bXN0X3R5cGVzLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG1fbXN0X3R5cGVzLmMKPj4gQEAgLTUzNCw3ICs1MzQsNyBAQCBzdGF0aWMgaW50
IGticHNfdG9fcGVha19wYm4oaW50IGticHMpCj4+ICAKPj4gIAlwZWFrX2ticHMgKj0gMTAwNjsK
Pj4gIAlwZWFrX2ticHMgPSBkaXZfdTY0KHBlYWtfa2JwcywgMTAwMCk7Cj4+IC0JcmV0dXJuIChp
bnQpIERJVl9ST1VORF9VUChwZWFrX2ticHMgKiA2NCwgKDU0ICogOCAqIDEwMDApKTsKPj4gKwly
ZXR1cm4gKGludCkgRElWNjRfVTY0X1JPVU5EX1VQKHBlYWtfa2JwcyAqIDY0LCAoNTQgKiA4ICog
MTAwMCkpOwoKdGhhdCBidWlsZHMgZmluZS4KCj4gRElWX1JPVU5EX1VQX1VMTCgpIHdvdWxkIHNl
ZW0gdG8gc3VmZmljZSBmb3IgdGhpcyBkaXZpc29yLgoKYW5kIHNvIGRvZXMgdGhhdCBvbmUuCgpU
aGFua3MuCgpGb3IgZWl0aGVyIHBhdGNoOgpBY2tlZC1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFw
QGluZnJhZGVhZC5vcmc+ICMgYnVpbGQtdGVzdGVkCgoKIAo+PiAgfQo+PiAgCj4+ICBzdGF0aWMg
dm9pZCBzZXRfZHNjX2NvbmZpZ3NfZnJvbV9mYWlybmVzc192YXJzKHN0cnVjdCBkc2NfbXN0X2Zh
aXJuZXNzX3BhcmFtcyAqcGFyYW1zLAo+PiAtLSAKCgotLSAKflJhbmR5CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
