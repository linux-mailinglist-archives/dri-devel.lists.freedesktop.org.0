Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1667E327
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 21:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C63B36E792;
	Thu,  1 Aug 2019 19:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937096E791
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 19:14:01 +0000 (UTC)
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:45346 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1htGWV-0029bI-1B; Thu, 01 Aug 2019 15:13:59 -0400
Subject: Re: [PATCH 3/4] drm/tiny/mi0283qt: Move driver to panel-ilitek-ili9341
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20190801135249.28803-1-noralf@tronnes.org>
 <20190801135249.28803-4-noralf@tronnes.org>
From: David Lechner <david@lechnology.com>
Message-ID: <8ea8d09a-e057-d089-02de-d3ac48c16334@lechnology.com>
Date: Thu, 1 Aug 2019 14:13:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190801135249.28803-4-noralf@tronnes.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fQaDyV94vvezlZb4EOGl95QNncesxtLpCGeijAibEoI=; b=ljxosUjbe0W+8BpnIEjB0ITiFU
 NDmVSTioAofvclQ9TUcVvS6WwyMP/AW1VVYvI+9AxAtAnyMqI2Vls8wpei0SBl1tF00XGC6OBJyNf
 ln7CgcNtgaqZ7jKi6ODpBDs6HQBZMnvatfiITzFvkpbWYAmdH6GjhAWs6/LZBS20WGcY6P4sH7s8K
 WF+rL/47lAgxqlh7OzlTvqEG7FUwe9AlyNB0YqgBFJhQBLlvP33r6V3hRs4QGvEwFV8reEqLRzunQ
 S776AfJNUPgXOpilPEGDx7hJOvAugNoz/kMnX1tg5eb23Qm7Tsrc9hnMMjP9SYkgue1e8jvP309p8
 In3/qL1w==;
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
Cc: daniel.vetter@ffwll.ch, emil.l.velikov@gmail.com, josef@lusticky.cz,
 thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, sam@ravnborg.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8xLzE5IDg6NTIgQU0sIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPiBUaGUgTUkwMjgzUVQg
cGFuZWxzIHVzZSBhIElMSTkzNDEgY29udHJvbGxlciBzbyBpdCBtYWtlcyBzZW5zZSB0byBtZXJn
ZQo+IGl0IHdpdGggdGhlIG90aGVyIGlsaTkzNDEgY29kZS4KPiAKPiBUaGUgRFJNIGRyaXZlciBu
YW1lIGlzIEFCSSwgc28gdGhhdCBpcyByZXRhaW5lZC4KPiAKPiBDYzogRGF2aWQgTGVjaG5lciA8
ZGF2aWRAbGVjaG5vbG9neS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTm9yYWxmIFRyw7hubmVzIDxu
b3JhbGZAdHJvbm5lcy5vcmc+Cj4gLS0tCgouLi4KCj4gQEAgLTIxNiw2ICszMzksMTAgQEAgc3Rh
dGljIGludCBpbGk5MzQxX3Byb2JlKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpCj4gICAJCXJldHVy
biBQVFJfRVJSKGRjKTsKPiAgIAl9Cj4gICAKPiArCWlsaS0+cmVndWxhdG9yID0gZGV2bV9yZWd1
bGF0b3JfZ2V0KGRldiwgInBvd2VyIik7Cj4gKwlpZiAoSVNfRVJSKGlsaS0+cmVndWxhdG9yKSkK
PiArCQlyZXR1cm4gUFRSX0VSUihpbGktPnJlZ3VsYXRvcik7Cj4gKwo+ICAgCWlsaS0+YmFja2xp
Z2h0ID0gZGV2bV9vZl9maW5kX2JhY2tsaWdodChkZXYpOwo+ICAgCWlmIChJU19FUlIoaWxpLT5i
YWNrbGlnaHQpKQo+ICAgCQlyZXR1cm4gUFRSX0VSUihpbGktPmJhY2tsaWdodCk7Cj4gQEAgLTIz
MCw3ICszNTcsMTIgQEAgc3RhdGljIGludCBpbGk5MzQxX3Byb2JlKHN0cnVjdCBzcGlfZGV2aWNl
ICpzcGkpCj4gICAJaWxpLT5wYW5lbC5kZXYgPSBkZXY7Cj4gICAJaWxpLT5wYW5lbC5mdW5jcyA9
IGlsaS0+Y29uZi0+ZnVuY3M7Cj4gICAKClNob3VsZCBwcm9iYWJseSBhZGQgYSBjb21tZW50IGhl
cmUgdGhhdCB0aGlzIGlzIGZvciBiYWNrd2FyZHMKY29tcGF0aWJpbGl0eSBvZiB0aGUgZHJpdmVy
IG5hbWUgc28gdGhhdCBubyBvbmUgaXMgdGVtcHRlZCB0bwp0byBhZGQgbW9yZSBkcml2ZXIgc3Ry
dWN0cyB3aGVuIGFkZGluZyBuZXcgcGFuZWxzLgoKPiAtCXJldHVybiBkcm1fbWlwaV9kYmlfcGFu
ZWxfcmVnaXN0ZXIoJmlsaS0+cGFuZWwsICZpbGktPmRiaWRldiwgJmlsaTkzNDFfZHJtX2RyaXZl
ciwKPiArCWlmIChpbGktPmNvbmYgPT0gJm1pMDI4M3F0X2RhdGEpCj4gKwkJZHJpdmVyID0gJm1p
MDI4M3F0X2RybV9kcml2ZXI7Cj4gKwllbHNlCj4gKwkJZHJpdmVyID0gJmlsaTkzNDFfZHJtX2Ry
aXZlcjsKPiArCj4gKwlyZXR1cm4gZHJtX21pcGlfZGJpX3BhbmVsX3JlZ2lzdGVyKCZpbGktPnBh
bmVsLCAmaWxpLT5kYmlkZXYsIGRyaXZlciwKPiAgIAkJCQkJICAgaWxpLT5jb25mLT5tb2RlLCBy
b3RhdGlvbik7Cj4gICB9Cj4gICAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
