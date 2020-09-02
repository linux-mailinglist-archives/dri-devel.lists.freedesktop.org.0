Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B0A25BDC9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 10:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46CD6E4DD;
	Thu,  3 Sep 2020 08:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs3.siol.net [185.57.226.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B646E936
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 16:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 5D25E52676B;
 Wed,  2 Sep 2020 18:46:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id ORtNQRatnqJ9; Wed,  2 Sep 2020 18:46:43 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id E90D752676F;
 Wed,  2 Sep 2020 18:46:42 +0200 (CEST)
Received: from kista.localnet (cpe1-5-97.cable.triera.net [213.161.5.97])
 (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id DB01552676B;
 Wed,  2 Sep 2020 18:46:40 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [PATCH] drm/sun4i: Fix DE2 YVU handling
Date: Wed, 02 Sep 2020 18:51:15 +0200
Message-ID: <10671571.W45mMbEh4O@kista>
In-Reply-To: <CAGphcdnT4U8AztL_B_B2HYskQSAYKRgCQcnO3Q8Qj+UFO082hQ@mail.gmail.com>
References: <20200901220305.6809-1-jernej.skrabec@siol.net>
 <CAGphcdnT4U8AztL_B_B2HYskQSAYKRgCQcnO3Q8Qj+UFO082hQ@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 03 Sep 2020 08:50:07 +0000
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
Cc: irlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG5lIHNyZWRhLCAwMi4gc2VwdGVtYmVyIDIwMjAgb2IgMDk6MDE6MTcgQ0VTVCBqZSBSb21hbiBT
dHJhdGlpZW5rbyAKbmFwaXNhbChhKToKPiDRgdGALCAyINGB0LXQvdGCLiAyMDIwINCzLiDQsiAw
MDo1OCwgSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQHNpb2wubmV0PjoKPiA+IEZ1bmN0
aW9uIHN1bjhpX3ZpX2xheWVyX2dldF9jc2NfbW9kZSgpIGlzIHN1cHBvc2VkIHRvIHJldHVybiBD
U0MgbW9kZQo+ID4gYnV0IGR1ZSB0byBpbnByb3BlciByZXR1cm4gdHlwZSAoYm9vbCBpbnN0ZWFk
IG9mIHUzMikgaXQgcmV0dXJucyBqdXN0IDAKPiA+IG9yIDEuIENvbG9ycyBhcmUgd3JvbmcgZm9y
IFlWVSBmb3JtYXRzIGJlY2F1c2Ugb2YgdGhhdC4KPiA+IAo+ID4gRml4ZXM6IGRhYWIzZDBlOGUy
YiAoImRybS9zdW40aTogZGUyOiBjc2NfbW9kZSBpbiBkZTIgZm9ybWF0IHN0cnVjdCBpcwo+ID4g
bW9zdGx5IHJlZHVuZGFudCIpIFJlcG9ydGVkLWJ5OiBSb21hbiBTdHJhdGlpZW5rbwo+ID4gPHIu
c3RyYXRpaWVua29AZ21haWwuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogSmVybmVqIFNrcmFiZWMg
PGplcm5lai5za3JhYmVjQHNpb2wubmV0Pgo+ID4gLS0tCj4gPiAKPiA+ICBkcml2ZXJzL2dwdS9k
cm0vc3VuNGkvc3VuOGlfdmlfbGF5ZXIuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9zdW40aS9zdW44aV92aV9sYXllci5jCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9zdW40
aS9zdW44aV92aV9sYXllci5jIGluZGV4IDIyYzhjNTM3NWQwZC4uYzAxNDdhZjZhODQwCj4gPiAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV92aV9sYXllci5jCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfdmlfbGF5ZXIuYwo+ID4gQEAgLTIx
MSw3ICsyMTEsNyBAQCBzdGF0aWMgaW50IHN1bjhpX3ZpX2xheWVyX3VwZGF0ZV9jb29yZChzdHJ1
Y3QKPiA+IHN1bjhpX21peGVyICptaXhlciwgaW50IGNoYW5uZWwsPiAKPiA+ICAgICAgICAgcmV0
dXJuIDA7Cj4gPiAgCj4gPiAgfQo+ID4gCj4gPiAtc3RhdGljIGJvb2wgc3VuOGlfdmlfbGF5ZXJf
Z2V0X2NzY19tb2RlKGNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8KPiA+ICpmb3JtYXQpICtz
dGF0aWMgdTMyIHN1bjhpX3ZpX2xheWVyX2dldF9jc2NfbW9kZShjb25zdCBzdHJ1Y3QKPiA+IGRy
bV9mb3JtYXRfaW5mbyAqZm9ybWF0KT4gCj4gPiAgewo+ID4gIAo+ID4gICAgICAgICBpZiAoIWZv
cm1hdC0+aXNfeXV2KQo+ID4gICAgICAgICAKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gU1VO
OElfQ1NDX01PREVfT0ZGOwo+ID4gCj4gPiAtLQo+ID4gMi4yOC4wCj4gCj4gSGkgSmVybmVqLAo+
IAo+IFRoYW5rIHlvdSBmb3IgdGhlIGZpeC4KPiBJIGNhbiBjb25maXJtIHRoaXMgcGF0Y2ggZml4
ZXMgdGhlIGlzc3VlIHdpdGggd3JvbmcgY29sb3JzLgoKVGhhbmtzISBDYW4gSSBhc3N1bWUgdGhh
dCB0aGlzIG1lYW5zIHlvdXIgVGVzdGVkLWJ5IHRhZyBjYW4gYmUgYWRkZWQ/Cgo+IAo+IExldCBt
ZSBzaGFyZSBteSB0aG91Z2h0czoKPiBJJ3ZlIGxvb2tlZCBpbnRvIGNzYyBjb2RlLCBhbmQgaXQg
c2VlbXMgdG8gbWUgcmVvcmRlcmluZyBVLCBWIG9mZnNldHMKPiBzaG91bGQgYmUgYSBtdWNoIHNp
bXBsZXIgc29sdXRpb24gdGhhbiBhcHBseWluZwo+IGNvbG9yIHRyYW5zZm9ybWF0aW9uIG1hdHJp
Y2VzLkl0IHNob3VsZCBhbHNvIHNpbXBsaWZ5IGFkZGluZyBtb3JlCj4gY29sb3IgZW5jb2Rpbmdz
IGluIHRoZSBmdXR1cmUuCgpTd2l0Y2hpbmcgb2Zmc2V0cyBhc3N1bWVzIHRoYXQgeW91IGhhdmUg
c2VwYXJhdGUgcGxhbmVzIGZvciBVIGFuZCBWIHdoaWNoIG1heSAKbm90IGJlIHRydWUgaW4gdGhl
IGZ1dHVyZS4gSSBhZ3JlZSB0aGF0IENTQyBtYXRyaWNlcyBhcmUgbmVlZGxlc3NseSBkdXBsaWNh
dGVkIApmb3IgaGFuZGxpbmcgVS9WIHN3aXRjaC4gSSBoYXZlIGEgcGF0Y2ggd2hpY2ggcmVvcmdh
bml6ZSBtYXRyaXggb24gdGhlIGZseSB3aGVuIApjb2VmZmljaWVudHMgYXJlIHdyaXR0ZW4gaW4g
cmVnaXN0ZXJzIGJ1dCBzaW5jZSBpdCdzIGEgcGFydCBvZiBhIGJpZ2dlciwgCnVuZmluaXNoZWQg
c2VyaWVzLCBJIGRpZG4ndCBzZW50IGl0IG91dCB5ZXQuIE9ubHkgZGlmZmVyZW5jZSBpbiBZVVYg
YW5kIFlWVSBDU0MgCm1hdHJpY2VzIGFyZSBzd2l0Y2hlZCAybmQgYW5kIDNyZCBjb2x1bW4uCgpC
ZXN0IHJlZ2FyZHMsCkplcm5lagoKPiAKPiBSZWdhcmRzLAo+IFJvbWFuCgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
