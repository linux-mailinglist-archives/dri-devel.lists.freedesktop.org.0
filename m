Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5BF86338
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 15:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DD68984C;
	Thu,  8 Aug 2019 13:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E238984C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 13:33:29 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hviXn-00051I-LP; Thu, 08 Aug 2019 15:33:27 +0200
Message-ID: <1565271207.3656.17.camel@pengutronix.de>
Subject: Re: [PATCH 13/21] drm/dp: Do not busy-loop during link training
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Date: Thu, 08 Aug 2019 15:33:27 +0200
In-Reply-To: <20190805122350.8838-13-thierry.reding@gmail.com>
References: <20190805122350.8838-1-thierry.reding@gmail.com>
 <20190805122350.8838-13-thierry.reding@gmail.com>
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
PiBGcm9tOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IFVzZSBtaWNy
b3NlY29uZCBzbGVlcHMgZm9yIHRoZSBjbG9jayByZWNvdmVyeSBhbmQgY2hhbm5lbCBlcXVhbGl6
YXRpb24KPiBkZWxheXMgZHVyaW5nIGxpbmsgdHJhaW5pbmcuIFRoZSBkdXJhdGlvbiBvZiB0aGVz
ZSBkZWxheXMgY2FuIGJlIGZyb20KPiAxMDAgdXMgdXAgdG8gMTYgbXMuIEl0IGlzIHJ1ZGUgdG8g
YnVzeS1sb29wIGZvciB0aGF0IGFtb3VudCBvZiB0aW1lLgo+IAo+IFdoaWxlIGF0IGl0LCBhbHNv
IGNvbnZlcnQgdG8gc3RhbmRhcmQgY29kaW5nIHN0eWxlIGJ5IHB1dHRpbmcgdGhlCj4gb3Blbmlu
ZyBicmFjZXMgaW4gYSBmdW5jdGlvbiBkZWZpbml0aW9uIG9uIGEgbmV3IGxpbmUuCj4gCj4gU2ln
bmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyB8IDMwICsrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCj4gaW5kZXggNDExMjU3MGRiZTY3Li4z
NDRmODg3ZmVmMmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKPiBAQCAtMTIwLDMzICsx
MjAsMzkgQEAgdTggZHJtX2RwX2dldF9hZGp1c3RfcmVxdWVzdF9wcmVfZW1waGFzaXMoY29uc3Qg
dTggbGlua19zdGF0dXNbRFBfTElOS19TVEFUVVNfU0kKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKGRy
bV9kcF9nZXRfYWRqdXN0X3JlcXVlc3RfcHJlX2VtcGhhc2lzKTsKPiAgCj4gLXZvaWQgZHJtX2Rw
X2xpbmtfdHJhaW5fY2xvY2tfcmVjb3ZlcnlfZGVsYXkoY29uc3QgdTggZHBjZFtEUF9SRUNFSVZF
Ul9DQVBfU0laRV0pIHsKPiAtCWludCByZF9pbnRlcnZhbCA9IGRwY2RbRFBfVFJBSU5JTkdfQVVY
X1JEX0lOVEVSVkFMXSAmCj4gLQkJCSAgRFBfVFJBSU5JTkdfQVVYX1JEX01BU0s7Cj4gK3ZvaWQg
ZHJtX2RwX2xpbmtfdHJhaW5fY2xvY2tfcmVjb3ZlcnlfZGVsYXkoY29uc3QgdTggZHBjZFtEUF9S
RUNFSVZFUl9DQVBfU0laRV0pCj4gK3sKPiArCXVuc2lnbmVkIGludCByZF9pbnRlcnZhbCA9IGRw
Y2RbRFBfVFJBSU5JTkdfQVVYX1JEX0lOVEVSVkFMXSAmCj4gKwkJCQkJRFBfVFJBSU5JTkdfQVVY
X1JEX01BU0s7Cj4gIAo+ICAJaWYgKHJkX2ludGVydmFsID4gNCkKPiAtCQlEUk1fREVCVUdfS01T
KCJBVVggaW50ZXJ2YWwgJWQsIG91dCBvZiByYW5nZSAobWF4IDQpXG4iLAo+ICsJCURSTV9ERUJV
R19LTVMoIkFVWCBpbnRlcnZhbCAldSwgb3V0IG9mIHJhbmdlIChtYXggNClcbiIsCj4gIAkJCSAg
ICAgIHJkX2ludGVydmFsKTsKPiAgCj4gIAlpZiAocmRfaW50ZXJ2YWwgPT0gMCB8fCBkcGNkW0RQ
X0RQQ0RfUkVWXSA+PSBEUF9EUENEX1JFVl8xNCkKPiAtCQl1ZGVsYXkoMTAwKTsKPiArCQlyZF9p
bnRlcnZhbCA9IDEwMDsKPiAgCWVsc2UKPiAtCQltZGVsYXkocmRfaW50ZXJ2YWwgKiA0KTsKCnJk
X2ludGVydmFsIHdhcyBpbiB1bml0cyBvZiA0IG1zLgoKPiArCQlyZF9pbnRlcnZhbCAqPSA0OwoK
VGhpcyBzaG91bGQgYmUgKj0gNDAwMCBzaW5jZSB0aGUgcmVzdWx0IGlzIGZlZCBpbnRvIHVzbGVl
cF9yYW5nZSBpbnN0ZWFkCm9mIG1kZWxheS4KCj4gKwo+ICsJdXNsZWVwX3JhbmdlKHJkX2ludGVy
dmFsLCByZF9pbnRlcnZhbCAqIDIpOwo+ICB9Cj4gIEVYUE9SVF9TWU1CT0woZHJtX2RwX2xpbmtf
dHJhaW5fY2xvY2tfcmVjb3ZlcnlfZGVsYXkpOwo+ICAKPiAtdm9pZCBkcm1fZHBfbGlua190cmFp
bl9jaGFubmVsX2VxX2RlbGF5KGNvbnN0IHU4IGRwY2RbRFBfUkVDRUlWRVJfQ0FQX1NJWkVdKSB7
Cj4gLQlpbnQgcmRfaW50ZXJ2YWwgPSBkcGNkW0RQX1RSQUlOSU5HX0FVWF9SRF9JTlRFUlZBTF0g
Jgo+IC0JCQkgIERQX1RSQUlOSU5HX0FVWF9SRF9NQVNLOwo+ICt2b2lkIGRybV9kcF9saW5rX3Ry
YWluX2NoYW5uZWxfZXFfZGVsYXkoY29uc3QgdTggZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0laRV0p
Cj4gK3sKPiArCXVuc2lnbmVkIGludCByZF9pbnRlcnZhbCA9IGRwY2RbRFBfVFJBSU5JTkdfQVVY
X1JEX0lOVEVSVkFMXSAmCj4gKwkJCQkJRFBfVFJBSU5JTkdfQVVYX1JEX01BU0s7Cj4gIAo+ICAJ
aWYgKHJkX2ludGVydmFsID4gNCkKPiAtCQlEUk1fREVCVUdfS01TKCJBVVggaW50ZXJ2YWwgJWQs
IG91dCBvZiByYW5nZSAobWF4IDQpXG4iLAo+ICsJCURSTV9ERUJVR19LTVMoIkFVWCBpbnRlcnZh
bCAldSwgb3V0IG9mIHJhbmdlIChtYXggNClcbiIsCj4gIAkJCSAgICAgIHJkX2ludGVydmFsKTsK
PiAgCj4gIAlpZiAocmRfaW50ZXJ2YWwgPT0gMCkKPiAtCQl1ZGVsYXkoNDAwKTsKPiArCQlyZF9p
bnRlcnZhbCA9IDQwMDsKPiAgCWVsc2UKPiAtCQltZGVsYXkocmRfaW50ZXJ2YWwgKiA0KTsKPiAr
CQlyZF9pbnRlcnZhbCAqPSA0OwoKU2FtZSBhcyBhYm92ZS4KCj4gKwo+ICsJdXNsZWVwX3Jhbmdl
KHJkX2ludGVydmFsLCByZF9pbnRlcnZhbCAqIDIpOwo+ICB9Cj4gIEVYUE9SVF9TWU1CT0woZHJt
X2RwX2xpbmtfdHJhaW5fY2hhbm5lbF9lcV9kZWxheSk7Cj4gIAoKcmVnYXJkcwpQaGlsaXBwCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
