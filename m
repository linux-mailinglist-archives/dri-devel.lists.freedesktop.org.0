Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0021099861
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 17:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776A96E514;
	Thu, 22 Aug 2019 15:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B066E508
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 15:45:06 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0CA4228BBBB;
 Thu, 22 Aug 2019 16:45:05 +0100 (BST)
Date: Thu, 22 Aug 2019 17:45:01 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 09/50] drm/bridge: simple-bridge: Add support for
 enable GPIO
Message-ID: <20190822174501.1ebebda4@collabora.com>
In-Reply-To: <20190820011721.30136-10-laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-10-laurent.pinchart@ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMCBBdWcgMjAxOSAwNDoxNjo0MCArMDMwMApMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgoKPiBJZiBhbiBlbmFibGUgR1BJ
TyBpcyBkZWNsYXJlZCBpbiB0aGUgZmlybXdhcmUsIGFzc2VydCBpdCB3aGVuIGVuYWJsaW5nCj4g
dGhlIGJyaWRnZSBhbmQgZGVhc3NlcnQgaXQgd2hlbiBkaXNhYmxpbmcgaXQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPgo+IFJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgo+
IFJldmlld2VkLWJ5OiBTdGVmYW4gQWduZXIgPHN0ZWZhbkBhZ25lci5jaD4KClJldmlld2VkLWJ5
OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgoKPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaW1wbGUtYnJpZGdlLmMgfCAyMiArKysrKysrKysr
KysrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbXBsZS1i
cmlkZ2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2ltcGxlLWJyaWRnZS5jCj4gaW5kZXgg
ODVhYTg1MmVhZmI0Li4zZTUwMzE4MzMzNjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9zaW1wbGUtYnJpZGdlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Np
bXBsZS1icmlkZ2UuYwo+IEBAIC02LDYgKzYsNyBAQAo+ICAgKiBNYXhpbWUgUmlwYXJkIDxtYXhp
bWUucmlwYXJkQGZyZWUtZWxlY3Ryb25zLmNvbT4KPiAgICovCj4gIAo+ICsjaW5jbHVkZSA8bGlu
dXgvZ3Bpby9jb25zdW1lci5oPgo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gICNpbmNs
dWRlIDxsaW51eC9vZl9kZXZpY2UuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L29mX2dyYXBoLmg+Cj4g
QEAgLTI5LDYgKzMwLDcgQEAgc3RydWN0IHNpbXBsZV9icmlkZ2Ugewo+ICAKPiAgCXN0cnVjdCBp
MmNfYWRhcHRlcgkqZGRjOwo+ICAJc3RydWN0IHJlZ3VsYXRvcgkqdmRkOwo+ICsJc3RydWN0IGdw
aW9fZGVzYwkqZW5hYmxlOwo+ICB9Owo+ICAKPiAgc3RhdGljIGlubGluZSBzdHJ1Y3Qgc2ltcGxl
X2JyaWRnZSAqCj4gQEAgLTE0MCwxOSArMTQyLDIzIEBAIHN0YXRpYyBpbnQgc2ltcGxlX2JyaWRn
ZV9hdHRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiAgc3RhdGljIHZvaWQgc2ltcGxl
X2JyaWRnZV9lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKPiAgewo+ICAJc3RydWN0
IHNpbXBsZV9icmlkZ2UgKnNicmlkZ2UgPSBkcm1fYnJpZGdlX3RvX3NpbXBsZV9icmlkZ2UoYnJp
ZGdlKTsKPiAtCWludCByZXQgPSAwOwo+ICsJaW50IHJldDsKPiAgCj4gLQlpZiAoc2JyaWRnZS0+
dmRkKQo+ICsJaWYgKHNicmlkZ2UtPnZkZCkgewo+ICAJCXJldCA9IHJlZ3VsYXRvcl9lbmFibGUo
c2JyaWRnZS0+dmRkKTsKPiArCQlpZiAocmV0KQo+ICsJCQlEUk1fRVJST1IoIkZhaWxlZCB0byBl
bmFibGUgdmRkIHJlZ3VsYXRvcjogJWRcbiIsIHJldCk7Cj4gKwl9Cj4gIAo+IC0JaWYgKHJldCkK
PiAtCQlEUk1fRVJST1IoIkZhaWxlZCB0byBlbmFibGUgdmRkIHJlZ3VsYXRvcjogJWRcbiIsIHJl
dCk7Cj4gKwlncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAoc2JyaWRnZS0+ZW5hYmxlLCAxKTsKPiAg
fQo+ICAKPiAgc3RhdGljIHZvaWQgc2ltcGxlX2JyaWRnZV9kaXNhYmxlKHN0cnVjdCBkcm1fYnJp
ZGdlICpicmlkZ2UpCj4gIHsKPiAgCXN0cnVjdCBzaW1wbGVfYnJpZGdlICpzYnJpZGdlID0gZHJt
X2JyaWRnZV90b19zaW1wbGVfYnJpZGdlKGJyaWRnZSk7Cj4gIAo+ICsJZ3Bpb2Rfc2V0X3ZhbHVl
X2NhbnNsZWVwKHNicmlkZ2UtPmVuYWJsZSwgMCk7Cj4gKwo+ICAJaWYgKHNicmlkZ2UtPnZkZCkK
PiAgCQlyZWd1bGF0b3JfZGlzYWJsZShzYnJpZGdlLT52ZGQpOwo+ICB9Cj4gQEAgLTIwNSw2ICsy
MTEsMTQgQEAgc3RhdGljIGludCBzaW1wbGVfYnJpZGdlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCj4gIAkJZGV2X2RiZygmcGRldi0+ZGV2LCAiTm8gdmRkIHJlZ3VsYXRvciBm
b3VuZDogJWRcbiIsIHJldCk7Cj4gIAl9Cj4gIAo+ICsJc2JyaWRnZS0+ZW5hYmxlID0gZGV2bV9n
cGlvZF9nZXRfb3B0aW9uYWwoJnBkZXYtPmRldiwgImVuYWJsZSIsCj4gKwkJCQkJCSAgR1BJT0Rf
T1VUX0xPVyk7Cj4gKwlpZiAoSVNfRVJSKHNicmlkZ2UtPmVuYWJsZSkpIHsKPiArCQlpZiAoUFRS
X0VSUihzYnJpZGdlLT5lbmFibGUpICE9IC1FUFJPQkVfREVGRVIpCj4gKwkJCWRldl9lcnIoJnBk
ZXYtPmRldiwgIlVuYWJsZSB0byByZXRyaWV2ZSBlbmFibGUgR1BJT1xuIik7Cj4gKwkJcmV0dXJu
IFBUUl9FUlIoc2JyaWRnZS0+ZW5hYmxlKTsKPiArCX0KPiArCj4gIAlzYnJpZGdlLT5kZGMgPSBz
aW1wbGVfYnJpZGdlX3JldHJpZXZlX2RkYygmcGRldi0+ZGV2KTsKPiAgCWlmIChJU19FUlIoc2Jy
aWRnZS0+ZGRjKSkgewo+ICAJCWlmIChQVFJfRVJSKHNicmlkZ2UtPmRkYykgPT0gLUVOT0RFVikg
ewoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
