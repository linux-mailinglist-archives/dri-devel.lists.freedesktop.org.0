Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CB8AB674
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 12:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69E26E247;
	Fri,  6 Sep 2019 10:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D8F6E247
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 10:55:36 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1i6Btv-0005Mu-HN; Fri, 06 Sep 2019 12:55:35 +0200
Message-ID: <86049d234394fca91d571e624ec93d2302fd6c82.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] drm/etnaviv: print MMU exception cause
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, 
 dri-devel@lists.freedesktop.org
Date: Fri, 06 Sep 2019 12:55:35 +0200
In-Reply-To: <20190906100308.15341-2-christian.gmeiner@gmail.com>
References: <20190906100308.15341-1-christian.gmeiner@gmail.com>
 <20190906100308.15341-2-christian.gmeiner@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
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
Cc: etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnIsIDIwMTktMDktMDYgYXQgMTI6MDMgKzAyMDAsIENocmlzdGlhbiBHbWVpbmVyIHdyb3Rl
Ogo+IE1pZ2h0IGJlIHVzZWZ1bCB3aGVuIGRlYnVnZ2luZyBNTVUgZXhjZXB0aW9ucy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gR21laW5lciA8Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwu
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jIHwgMjYK
PiArKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2
X2dwdS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jCj4gaW5kZXgg
ZDQ3ZDFhOGUwMjE5Li5hYTg3OGRkMDU4NjAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2V0bmF2aXYvZXRuYXZpdl9ncHUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0
bmF2aXZfZ3B1LmMKPiBAQCAtMTM2NCwxMCArMTM2NCwzNiBAQCBzdGF0aWMgdm9pZCBkdW1wX21t
dV9mYXVsdChzdHJ1Y3QgZXRuYXZpdl9ncHUKPiAqZ3B1KQo+ICAKPiAgCWZvciAoaSA9IDA7IGkg
PCA0OyBpKyspIHsKPiAgCQl1MzIgYWRkcmVzc19yZWc7Cj4gKwkJY29uc3QgY2hhciAqZXJyb3I7
Cj4gIAo+ICAJCWlmICghKHN0YXR1cyAmIChWSVZTX01NVXYyX1NUQVRVU19FWENFUFRJT04wX19N
QVNLIDw8Cj4gKGkgKiA0KSkpKQo+ICAJCQljb250aW51ZTsKPiAgCj4gKwkJc3dpdGNoIChzdGF0
dXMpIHsKPiArCQljYXNlIE1NVV9FWENFUFRJT05fU0xBVkVfTk9UX1BSRVNFTlQ6Cj4gKwkJCWVy
cm9yID0gInNsYXZlIG5vdCBwcmVzZW50IjsKPiArCQkJYnJlYWs7Cj4gKwkJY2FzZSBNTVVfRVhD
RVBUSU9OX1BBR0VfTk9UX1BSRVNFTlQ6Cj4gKwkJCWVycm9yID0gInBhZ2Ugbm90IHByZXNlbnQi
Owo+ICsJCQlicmVhazsKPiArCQljYXNlIE1NVV9FWENFUFRJT05fV1JJVEVfVklPTEFUSU9OOgo+
ICsJCQllcnJvciA9ICJ3cml0ZSB2aW9sYXRpb24iOwo+ICsJCQlicmVhazsKPiArCQljYXNlIE1N
VV9FWENFUFRJT05fT1VUX09GX0JPVU5EOgo+ICsJCQllcnJvciA9ICJvdXQgb2YgYm91bmQiOwo+
ICsJCQlicmVhazsKPiArCQljYXNlIE1NVV9FWENFUFRJT05fUkVBRF9TRUNVUklUWV9WSU9MQVRJ
T046Cj4gKwkJCWVycm9yID0gInJlYWQgc2VjdXJpdHkgdmlvbGF0aW9uIjsKPiArCQkJYnJlYWs7
Cj4gKwkJY2FzZSBNTVVfRVhDRVBUSU9OX1dSSVRFX1NFQ1VSSVRZX1ZJT0xBVElPTjoKPiArCQkJ
ZXJyb3IgPSAid3JpdGUgc2VjdXJpdHkgdmlvbGF0aW9uIjsKPiArCQkJYnJlYWs7Cj4gKwkJZGVm
YXVsdDoKPiArCQkJZXJyb3IgPSAidW5rbm93biBzdGF0ZSI7Cj4gKwkJCWJyZWFrOwo+ICsJCX0K
CkFzIHRoZSBleGNlcHRpb24gc3RhdHVzIGlzIGEgbmljZSBjb250aWd1b3VzIHNldCBvZiBiaXRz
LCBJIHRoaW5rIHRoaXMKY291bGQgYmUgc2ltcGxpZmllZCBpbnRvIGEgc3RhdGljIGFycmF5IG9m
IHN0cmluZ3MuIFRoZSBlcnJvciBtZXNzYWdlCmNvdWxkIHRoZW4ganVzdCB1c2UgdGhlIGJpdCBw
b3NpdGlvbiB0byBpbmRleCBpbnRvIHRoZSBhcnJheS4KClJlZ2FyZHMsCkx1Y2FzCgo+ICsJCWRl
dl9lcnJfcmF0ZWxpbWl0ZWQoZ3B1LT5kZXYsICJNTVUgJWQgJXNcbiIsIGksIGVycm9yKTsKPiAr
Cj4gIAkJaWYgKGdwdS0+c2VjX21vZGUgPT0gRVROQV9TRUNfTk9ORSkKPiAgCQkJYWRkcmVzc19y
ZWcgPSBWSVZTX01NVXYyX0VYQ0VQVElPTl9BRERSKGkpOwo+ICAJCWVsc2UKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
