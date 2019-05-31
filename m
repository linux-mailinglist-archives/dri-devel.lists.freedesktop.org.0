Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D4B30EEC
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 15:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E4B89395;
	Fri, 31 May 2019 13:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E58B89395
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 13:35:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 77D14284F2D
Message-ID: <58407c4af8e08aa756c245ac571f12a80ede5f35.camel@collabora.com>
Subject: Re: [PATCH] drm/panfrost: make devfreq optional again
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>, robh@kernel.org, 
 tomeu.vizoso@collabora.com
Date: Fri, 31 May 2019 10:34:59 -0300
In-Reply-To: <20190531123746.613-1-narmstrong@baylibre.com>
References: <20190531123746.613-1-narmstrong@baylibre.com>
Organization: Collabora
User-Agent: Evolution 3.30.5-1 
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
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA1LTMxIGF0IDE0OjM3ICswMjAwLCBOZWlsIEFybXN0cm9uZyB3cm90ZToK
PiBEZXZmcmVxIHJ1bnRpbWUgdXNhZ2Ugd2FzIG1hZGUgbWFuZGF0b3J5LCB0aHVzIG1ha2luZyBw
YW5mcm9zdCBmYWlsIHRvIHByb2JlCj4gb24gQW1sb2dpYyBTOTEyIFNvQ3MgbWlzc2luIHRoZSAi
b3BlcmF0aW5nLXBvaW50cy12MiIgcHJvcGVydHkuCj4gTWFrZSBpdCBvcHRpb25hbCBhZ2Fpbiwg
bGVhdmluZyBQTV9ERVZGUkVRIGlzIHNlbGVjdGVkIGJ5IGRlZmF1bHQuCj4gCj4gRml4ZXM6IGYz
NjE3YjQ0OWQgKCJkcm0vcGFuZnJvc3Q6IFNlbGVjdCBkZXZmcmVxIikKPiBTaWduZWQtb2ZmLWJ5
OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgfCAxMyArKysrKysrKysrKyst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCj4gaW5kZXggMjlm
Y2ZmZGYyZDU3Li5kYzc1Zjk5YWQ1M2IgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9kZXZmcmVxLmMKPiBAQCAtMTQwLDcgKzE0MCw5IEBAIGludCBwYW5mcm9zdF9k
ZXZmcmVxX2luaXQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCj4gIAkJcmV0dXJuIDA7
Cj4gIAo+ICAJcmV0ID0gZGV2X3BtX29wcF9vZl9hZGRfdGFibGUoJnBmZGV2LT5wZGV2LT5kZXYp
Owo+IC0JaWYgKHJldCkKPiArCWlmIChyZXQgPT0gLUVOT0RFVikgLyogT3B0aW9uYWwsIGNvbnRp
bnVlIHdpdGhvdXQgZGV2ZnJlcSAqLwo+ICsJCXJldHVybiAwOwo+ICsJZWxzZQo+ICAJCXJldHVy
biByZXQ7Cj4gIAo+ICAJcGFuZnJvc3RfZGV2ZnJlcV9yZXNldChwZmRldik7Cj4gQEAgLTE3MCw2
ICsxNzIsOSBAQCB2b2lkIHBhbmZyb3N0X2RldmZyZXFfcmVzdW1lKHN0cnVjdCBwYW5mcm9zdF9k
ZXZpY2UgKnBmZGV2KQo+ICB7Cj4gIAlpbnQgaTsKPiAgCj4gKwlpZiAoIXBmZGV2LT5kZXZmcmVx
LmRldmZyZXEpCj4gKwkJcmV0dXJuOwo+ICsKPiAgCXBhbmZyb3N0X2RldmZyZXFfcmVzZXQocGZk
ZXYpOwo+ICAJZm9yIChpID0gMDsgaSA8IE5VTV9KT0JfU0xPVFM7IGkrKykKPiAgCQlwZmRldi0+
ZGV2ZnJlcS5zbG90W2ldLmJ1c3kgPSBmYWxzZTsKPiBAQCAtMTc5LDYgKzE4NCw5IEBAIHZvaWQg
cGFuZnJvc3RfZGV2ZnJlcV9yZXN1bWUoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCj4g
IAo+ICB2b2lkIHBhbmZyb3N0X2RldmZyZXFfc3VzcGVuZChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNl
ICpwZmRldikKPiAgewo+ICsJaWYgKCFwZmRldi0+ZGV2ZnJlcS5kZXZmcmVxKQo+ICsJCXJldHVy
bjsKPiArCj4gIAlkZXZmcmVxX3N1c3BlbmRfZGV2aWNlKHBmZGV2LT5kZXZmcmVxLmRldmZyZXEp
Owo+ICB9Cj4gIAo+IEBAIC0xODgsNiArMTk2LDkgQEAgc3RhdGljIHZvaWQgcGFuZnJvc3RfZGV2
ZnJlcV91cGRhdGVfdXRpbGl6YXRpb24oc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYsIGkK
PiAgCWt0aW1lX3Qgbm93Owo+ICAJa3RpbWVfdCBsYXN0Owo+ICAKPiArCWlmICghcGZkZXYtPmRl
dmZyZXEuZGV2ZnJlcSkKPiArCQlyZXR1cm47Cj4gKwo+ICAJbm93ID0ga3RpbWVfZ2V0KCk7Cj4g
IAlsYXN0ID0gcGZkZXYtPmRldmZyZXEuc2xvdFtzbG90XS50aW1lX2xhc3RfdXBkYXRlOwo+ICAK
ClRoaXMgcGF0Y2ggc2hvdWxkIGFsc28gZml4IFJLMzI4OCBwbGF0Zm9ybXMsIHdoaWNoIGF0IHRo
ZSBtb21lbnQgYXJlIGJyb2tlbgphcyB3ZWxsIGJ5IG15IHBhdGNoLgoKSSB3aWxsIHRlc3QgYW5k
IGNvbmZpcm0gbmV4dCB3ZWVrLgoKVGhhbmtzIGZvciB0aGUgZml4LApFemVxdWllbCAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
