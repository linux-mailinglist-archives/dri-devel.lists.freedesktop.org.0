Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F01567087
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 15:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180F56E062;
	Fri, 12 Jul 2019 13:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B866E062;
 Fri, 12 Jul 2019 13:51:17 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17249253-1500050 for multiple; Fri, 12 Jul 2019 14:51:14 +0100
MIME-Version: 1.0
To: Daniel Vetter <daniel.vetter@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <CAKMK7uGiwnRkCT_A6NJB+aQaXy5A-TT-qUBDmBVsLogyXK7v5g@mail.gmail.com>
References: <20190712120147.29830-1-chris@chris-wilson.co.uk>
 <CAKMK7uGiwnRkCT_A6NJB+aQaXy5A-TT-qUBDmBVsLogyXK7v5g@mail.gmail.com>
Message-ID: <156293947348.15207.10151084861839274186@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/vgem: Reclassify buffer creation debug message
Date: Fri, 12 Jul 2019 14:51:13 +0100
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTA3LTEyIDEzOjUxOjU4KQo+IE9uIEZyaSwgSnVs
IDEyLCAyMDE5IGF0IDI6MDEgUE0gQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28u
dWs+IHdyb3RlOgo+ID4KPiA+IEEgYnVmZmVyIGlzIGNyZWF0ZWQgaW4gcmVzcG9uc2UgdG8gdGhl
IHVzZXIgaW9jdGwsIGl0IHNob3VsZCB0aGVyZWZvcmUKPiA+IGJlIGEgcGxhaW4gRFJNX0RFQlVH
KCkgbWVzc2FnZSB0byByZWZsZWN0IGl0IGJlaW5nIGEgdXNlciBpbnZva2VkCj4gPiByZXNwb25z
ZSBhbmQgbm90IGEgZHJpdmVyIGNvbnN0cnVjdC4KPiA+Cj4gPiBUaGlzIGlzIGp1c3QgdG8gbWFr
ZSB0aGUgY29tbW9ucGxhY2UgZHJtLmRlYnVnPVsyNmVdIHF1aWV0ZXIgd2hlbgo+ID4gcnVubmlu
ZyB3aXRoIHZnZW0uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0Bj
aHJpcy13aWxzb24uY28udWs+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBm
ZndsbC5jaD4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2LmMgfCAy
ICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2LmMgYi9kcml2
ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5jCj4gPiBpbmRleCAzODZlZmMzYjU4NDMuLjc2ZDk1
YjVlMjg5YyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2LmMK
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2LmMKPiA+IEBAIC0yMTQsNyAr
MjE0LDcgQEAgc3RhdGljIGludCB2Z2VtX2dlbV9kdW1iX2NyZWF0ZShzdHJ1Y3QgZHJtX2ZpbGUg
KmZpbGUsIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gPiAgICAgICAgIGFyZ3MtPnNpemUgPSBn
ZW1fb2JqZWN0LT5zaXplOwo+ID4gICAgICAgICBhcmdzLT5waXRjaCA9IHBpdGNoOwo+ID4KPiA+
IC0gICAgICAgRFJNX0RFQlVHX0RSSVZFUigiQ3JlYXRlZCBvYmplY3Qgb2Ygc2l6ZSAlbGxkXG4i
LCBzaXplKTsKPiA+ICsgICAgICAgRFJNX0RFQlVHKCJDcmVhdGVkIG9iamVjdCBvZiBzaXplICVs
bGRcbiIsIHNpemUpOwo+IAo+IEhtLCBJIGhvbmVzdGx5IGR1bm5vIHdoYXQgRFJNX0RFQlVHIGlz
IGZvciwgZXhjZXB0IGdlbmVyYXRpbmcgbm9pc2UuCj4gTWF5YmUgYWxzbyBkaXRjaCB0aGlzIG91
dHJpZ2h0LiBFaXRoZXIgYXBwcm9hY2ggZ2V0cyBteQoKTm9pc2UgdGhhdCBzb21ldGltZXMgbWF5
IGJlIHVzZWZ1bCBpbiBkZXNwZXJhdGlvbi4gSXMgaXQgbW9yZSB1c2VmdWwKdGhhbiB0aGUgaW9j
dGwgcmVwb3J0aW5nIDA/IEEgdGlueSBiaXQgbW9yZSBjb252aW5jaW5nL3JlYXNzdXJpbmcgdGhh
dAp0aGUgZHJpdmVyIGlzIGRvaW5nIHdoYXQgeW91IGFza2VkLgoKSWYgd2UgZXZlciBnZXQgYSBk
eW5hbWljIHBlci11c2VyL2NsaWVudCBkZWJ1ZyBsb2csIHRoaXMgaXMgY2VydGFpbmx5IGEKZ29v
ZCBjYW5kaWRhdGUuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
