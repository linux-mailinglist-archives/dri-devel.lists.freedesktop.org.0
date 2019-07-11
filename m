Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC7F65DD4
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 18:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B226E264;
	Thu, 11 Jul 2019 16:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5158C6E264
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 16:49:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (softbank126163157105.bbtec.net
 [126.163.157.105])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9128F31C;
 Thu, 11 Jul 2019 18:49:35 +0200 (CEST)
Date: Thu, 11 Jul 2019 19:49:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: use dev name for debugfs
Message-ID: <20190711164908.GO5247@pendragon.ideasonboard.com>
References: <20190706203105.7810-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190706203105.7810-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562863776;
 bh=LoR2g2XS7GgKN9XWxIyf9Qtnhr3+f3A2ozL+HHxPIyo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QVwtxWHK5+cwWwak52s3iKytaDhY6/SeGYNM/YrTlepIBisZT4ki2OESwB5BrjmZB
 J4Doki+FWESXM5ScBEol/URQP9HFIMIAgMZrq3FwTYaEEv57iHhtxPAXKjB0itFkkq
 qY2PoKLZYCa7baYnCUnnem7b/TaIT4WYkey8EqBc=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBTYXQsIEp1bCAwNiwgMjAxOSBh
dCAwMTozMTowMlBNIC0wNzAwLCBSb2IgQ2xhcmsgd3JvdGU6Cj4gRnJvbTogUm9iIENsYXJrIDxy
b2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+IAo+IFRoaXMgc2hvdWxkIGJlIG1vcmUgZnV0dXJlLXBy
b29mIGlmIHdlIGV2ZXIgZW5jb3VudGVyIGEgZGV2aWNlIHdpdGggdHdvCj4gb2YgdGhlc2UgYnJp
ZGdlcy4KPiAKPiBTdWdnZXN0ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFy
a0BjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRz
aTg2LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4
Ni5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYwo+IGluZGV4IGM4ZmI0
NWU3YjA2ZC4uOWY0ZmY4OGQ0YTEwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvdGktc242NWRzaTg2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVk
c2k4Ni5jCj4gQEAgLTIwNCw3ICsyMDQsNyBAQCBERUZJTkVfU0hPV19BVFRSSUJVVEUoc3RhdHVz
KTsKPiAgCj4gIHN0YXRpYyB2b2lkIHRpX3NuX2RlYnVnZnNfaW5pdChzdHJ1Y3QgdGlfc25fYnJp
ZGdlICpwZGF0YSkKPiAgewo+IC0JcGRhdGEtPmRlYnVnZnMgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIo
InRpX3NuNjVkc2k4NiIsIE5VTEwpOwo+ICsJcGRhdGEtPmRlYnVnZnMgPSBkZWJ1Z2ZzX2NyZWF0
ZV9kaXIoZGV2X25hbWUocGRhdGEtPmRldiksIE5VTEwpOwoKVGhhdCBzaG91bGQgd29yaywgYnV0
IHdvbid0IGl0IGJlY29tZSBxdWl0ZSBjb25mdXNpbmcgZm9yIHVzZXJzID8gSQp3b25kZXIgaWYg
dGhlIGRpcmVjdG9yeSBuYW1lIHNob3VsZG4ndCBiZSBwcmVmaXhlZCB3aXRoIHRoZSBkcml2ZXIg
bmFtZS4KU29tZXRoaW5nIGxpa2UgInRpX3NuNjVkc2k4NjolcyIsIGRldl9uYW1lKHBkYXRhLT5k
ZXYpLgoKPiAgCWRlYnVnZnNfY3JlYXRlX2ZpbGUoInN0YXR1cyIsIDA2MDAsIHBkYXRhLT5kZWJ1
Z2ZzLCBwZGF0YSwKPiAgCQkJJnN0YXR1c19mb3BzKTsKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQ
aW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
