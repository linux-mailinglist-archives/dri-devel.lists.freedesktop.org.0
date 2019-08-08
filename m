Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F706862D6
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 15:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345476E831;
	Thu,  8 Aug 2019 13:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477626E831
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 13:17:35 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hviIP-00038G-I1; Thu, 08 Aug 2019 15:17:33 +0200
Message-ID: <1565270253.3656.11.camel@pengutronix.de>
Subject: Re: [PATCH 14/21] drm/dp: Use drm_dp_aux_rd_interval()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Date: Thu, 08 Aug 2019 15:17:33 +0200
In-Reply-To: <20190805122350.8838-14-thierry.reding@gmail.com>
References: <20190805122350.8838-1-thierry.reding@gmail.com>
 <20190805122350.8838-14-thierry.reding@gmail.com>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA4LTA1IGF0IDE0OjIzICswMjAwLCBUaGllcnJ5IFJlZGluZyB3cm90ZToK
PiBGcm9tOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IE1ha2UgdXNl
IG9mIHRoZSBuZXdseSBhZGRlZCBkcm1fZHBfYXV4X3JkX2ludGVydmFsKCkgaGVscGVyIGluIGV4
aXN0aW5nCj4gRFAgbGluayB0cmFpbmluZyBoZWxwZXJzIGFuZCBhZGQgY29tbWVudHMgYWJvdXQg
bWluaW11bSByZXF1aXJlZCBkZWxheXMKPiBtYW5kYXRlZCBieSB0aGUgRFAgc3BlY2lmaWNhdGlv
bi4KClRoaXMgcGF0Y2ggZG9lcyBub3QgYWRkIGFueSBjb21tZW50czoKCj4gCj4gU2lnbmVkLW9m
Zi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyB8IDI2ICsrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9kcF9oZWxwZXIuYwo+IGluZGV4IDM0NGY4ODdmZWYyYy4uMWZiM2MyN2NkMDEy
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCj4gQEAgLTEyMiwxNyArMTIyLDcgQEAgRVhQ
T1JUX1NZTUJPTChkcm1fZHBfZ2V0X2FkanVzdF9yZXF1ZXN0X3ByZV9lbXBoYXNpcyk7Cj4gIAo+
ICB2b2lkIGRybV9kcF9saW5rX3RyYWluX2Nsb2NrX3JlY292ZXJ5X2RlbGF5KGNvbnN0IHU4IGRw
Y2RbRFBfUkVDRUlWRVJfQ0FQX1NJWkVdKQo+ICB7Cj4gLQl1bnNpZ25lZCBpbnQgcmRfaW50ZXJ2
YWwgPSBkcGNkW0RQX1RSQUlOSU5HX0FVWF9SRF9JTlRFUlZBTF0gJgo+IC0JCQkJCURQX1RSQUlO
SU5HX0FVWF9SRF9NQVNLOwo+IC0KPiAtCWlmIChyZF9pbnRlcnZhbCA+IDQpCj4gLQkJRFJNX0RF
QlVHX0tNUygiQVVYIGludGVydmFsICV1LCBvdXQgb2YgcmFuZ2UgKG1heCA0KVxuIiwKPiAtCQkJ
ICAgICAgcmRfaW50ZXJ2YWwpOwo+IC0KPiAtCWlmIChyZF9pbnRlcnZhbCA9PSAwIHx8IGRwY2Rb
RFBfRFBDRF9SRVZdID49IERQX0RQQ0RfUkVWXzE0KQo+IC0JCXJkX2ludGVydmFsID0gMTAwOwo+
IC0JZWxzZQo+IC0JCXJkX2ludGVydmFsICo9IDQ7Cj4gKwl1bnNpZ25lZCBpbnQgcmRfaW50ZXJ2
YWwgPSBkcm1fZHBfYXV4X3JkX2ludGVydmFsKGRwY2QpOwo+ICAKPiAgCXVzbGVlcF9yYW5nZShy
ZF9pbnRlcnZhbCwgcmRfaW50ZXJ2YWwgKiAyKTsKPiAgfQo+IEBAIC0xNDAsMTkgKzEzMCw5IEBA
IEVYUE9SVF9TWU1CT0woZHJtX2RwX2xpbmtfdHJhaW5fY2xvY2tfcmVjb3ZlcnlfZGVsYXkpOwo+
ICAKPiAgdm9pZCBkcm1fZHBfbGlua190cmFpbl9jaGFubmVsX2VxX2RlbGF5KGNvbnN0IHU4IGRw
Y2RbRFBfUkVDRUlWRVJfQ0FQX1NJWkVdKQo+ICB7Cj4gLQl1bnNpZ25lZCBpbnQgcmRfaW50ZXJ2
YWwgPSBkcGNkW0RQX1RSQUlOSU5HX0FVWF9SRF9JTlRFUlZBTF0gJgo+IC0JCQkJCURQX1RSQUlO
SU5HX0FVWF9SRF9NQVNLOwo+IC0KPiAtCWlmIChyZF9pbnRlcnZhbCA+IDQpCj4gLQkJRFJNX0RF
QlVHX0tNUygiQVVYIGludGVydmFsICV1LCBvdXQgb2YgcmFuZ2UgKG1heCA0KVxuIiwKPiAtCQkJ
ICAgICAgcmRfaW50ZXJ2YWwpOwo+ICsJdW5zaWduZWQgaW50IG1pbiA9IGRybV9kcF9hdXhfcmRf
aW50ZXJ2YWwoZHBjZCk7Cj4gIAo+IC0JaWYgKHJkX2ludGVydmFsID09IDApCj4gLQkJcmRfaW50
ZXJ2YWwgPSA0MDA7Cj4gLQllbHNlCj4gLQkJcmRfaW50ZXJ2YWwgKj0gNDsKPiAtCj4gLQl1c2xl
ZXBfcmFuZ2UocmRfaW50ZXJ2YWwsIHJkX2ludGVydmFsICogMik7Cj4gKwl1c2xlZXBfcmFuZ2Uo
bWluLCBtaW4gKiAyKTsKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKGRybV9kcF9saW5rX3RyYWluX2No
YW5uZWxfZXFfZGVsYXkpOwo+ICAKCnJlZ2FyZHMKUGhpbGlwcApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
