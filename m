Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50EAE4844
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 12:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62556E962;
	Fri, 25 Oct 2019 10:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927896E962
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 10:12:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,228,1569276000"; d="scan'208";a="408167341"
Received: from portablejulia.rsr.lip6.fr ([132.227.76.63])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 12:12:22 +0200
Date: Fri, 25 Oct 2019 12:12:23 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [Outreachy kernel] [Outreachy][PATCH] drm: use DIV_ROUND_UP
 helper macro for calculations
In-Reply-To: <20191025094907.3582-1-wambui.karugax@gmail.com>
Message-ID: <alpine.DEB.2.21.1910251212070.3307@hadrien>
References: <20191025094907.3582-1-wambui.karugax@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiBGcmksIDI1IE9jdCAyMDE5LCBXYW1idWkgS2FydWdhIHdyb3RlOgoKPiBSZXBsYWNlIG9w
ZW4gY29kZWQgZGl2aXNvciBjYWxjdWxhdGlvbnMgd2l0aCB0aGUgRElWX1JPVU5EX1VQIGtlcm5l
bAo+IG1hY3JvIGZvciBiZXR0ZXIgcmVhZGFiaWxpdHkuCj4gSXNzdWUgZm91bmQgdXNpbmcgY29j
Y2luZWxsZToKPiBAQAo+IGV4cHJlc3Npb24gbixkOwo+IEBACj4gKAo+IC0gKChuICsgZCAtIDEp
IC8gZCkKPiArIERJVl9ST1VORF9VUChuLGQpCj4gfAo+IC0gKChuICsgKGQgLSAxKSkgLyBkKQo+
ICsgRElWX1JPVU5EX1VQKG4sZCkKPiApCj4KPiBTaWduZWQtb2ZmLWJ5OiBXYW1idWkgS2FydWdh
IDx3YW1idWkua2FydWdheEBnbWFpbC5jb20+CgpBY2tlZC1ieTogSnVsaWEgTGF3YWxsIDxqdWxp
YS5sYXdhbGxAbGlwNi5mcj4KCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2FncHN1cHBv
cnQuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYWdwc3VwcG9ydC5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9hZ3BzdXBwb3J0LmMKPiBpbmRleCA2ZTA5ZjI3ZmQ5ZDYu
LjRjN2FkNDZmZGQyMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2FncHN1cHBv
cnQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYWdwc3VwcG9ydC5jCj4gQEAgLTIxMiw3
ICsyMTIsNyBAQCBpbnQgZHJtX2FncF9hbGxvYyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1
Y3QgZHJtX2FncF9idWZmZXIgKnJlcXVlc3QpCj4gIAlpZiAoIWVudHJ5KQo+ICAJCXJldHVybiAt
RU5PTUVNOwo+Cj4gLQlwYWdlcyA9IChyZXF1ZXN0LT5zaXplICsgUEFHRV9TSVpFIC0gMSkgLyBQ
QUdFX1NJWkU7Cj4gKwlwYWdlcyA9IERJVl9ST1VORF9VUChyZXF1ZXN0LT5zaXplLCBQQUdFX1NJ
WkUpOwo+ICAJdHlwZSA9ICh1MzIpIHJlcXVlc3QtPnR5cGU7Cj4gIAltZW1vcnkgPSBhZ3BfYWxs
b2NhdGVfbWVtb3J5KGRldi0+YWdwLT5icmlkZ2UsIHBhZ2VzLCB0eXBlKTsKPiAgCWlmICghbWVt
b3J5KSB7Cj4gQEAgLTMyNSw3ICszMjUsNyBAQCBpbnQgZHJtX2FncF9iaW5kKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fYWdwX2JpbmRpbmcgKnJlcXVlc3QpCj4gIAllbnRyeSA9
IGRybV9hZ3BfbG9va3VwX2VudHJ5KGRldiwgcmVxdWVzdC0+aGFuZGxlKTsKPiAgCWlmICghZW50
cnkgfHwgZW50cnktPmJvdW5kKQo+ICAJCXJldHVybiAtRUlOVkFMOwo+IC0JcGFnZSA9IChyZXF1
ZXN0LT5vZmZzZXQgKyBQQUdFX1NJWkUgLSAxKSAvIFBBR0VfU0laRTsKPiArCXBhZ2UgPSBESVZf
Uk9VTkRfVVAocmVxdWVzdC0+b2Zmc2V0LCBQQUdFX1NJWkUpOwo+ICAJcmV0Y29kZSA9IGRybV9i
aW5kX2FncChlbnRyeS0+bWVtb3J5LCBwYWdlKTsKPiAgCWlmIChyZXRjb2RlKQo+ICAJCXJldHVy
biByZXRjb2RlOwo+IC0tCj4gMi4yMy4wCj4KPiAtLQo+IFlvdSByZWNlaXZlZCB0aGlzIG1lc3Nh
Z2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNjcmliZWQgdG8gdGhlIEdvb2dsZSBHcm91cHMgIm91dHJl
YWNoeS1rZXJuZWwiIGdyb3VwLgo+IFRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBncm91cCBhbmQg
c3RvcCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNlbmQgYW4gZW1haWwgdG8gb3V0cmVhY2h5
LWtlcm5lbCt1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tLgo+IFRvIHZpZXcgdGhpcyBkaXNj
dXNzaW9uIG9uIHRoZSB3ZWIgdmlzaXQgaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lk
L291dHJlYWNoeS1rZXJuZWwvMjAxOTEwMjUwOTQ5MDcuMzU4Mi0xLXdhbWJ1aS5rYXJ1Z2F4JTQw
Z21haWwuY29tLgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
