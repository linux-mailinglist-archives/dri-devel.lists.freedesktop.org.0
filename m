Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8A856705
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 12:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060188918A;
	Wed, 26 Jun 2019 10:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21138918A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 10:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id DE6ACFB03;
 Wed, 26 Jun 2019 12:40:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ERi-EqMGy_Mt; Wed, 26 Jun 2019 12:40:27 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 72BD248EAB; Wed, 26 Jun 2019 12:40:27 +0200 (CEST)
Date: Wed, 26 Jun 2019 12:40:27 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 4/4] drm/panel: jh057n0090: Add regulator support
Message-ID: <20190626104027.GA12710@bogon.m.sigxcpu.org>
References: <cover.1561482165.git.agx@sigxcpu.org>
 <b239f1db7a1f67988a9bd1ed62f6a1cf1dce944c.1561482165.git.agx@sigxcpu.org>
 <20190625212419.GB20625@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625212419.GB20625@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Purism Kernel Team <kernel@puri.sm>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLApPbiBUdWUsIEp1biAyNSwgMjAxOSBhdCAxMToyNDoxOVBNICswMjAwLCBTYW0gUmF2
bmJvcmcgd3JvdGU6Cj4gT24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDc6MDU6MTlQTSArMDIwMCwg
R3VpZG8gR8O8bnRoZXIgd3JvdGU6Cj4gPiBBbGxvdyB0byBzcGVjaWZ5IHJlZ3VsYXRvcnMgZm9y
IHZjYyBhbmQgaW92Y2MuIEFjY29yZGluZyB0byB0aGUgZGF0YQo+ID4gc2hlZXQgdGhlIHBhbmVs
IHdhbnRzIHZjYyAoMi44VikgYW5kIGlvdmNjICgxLjhWKSBhbmQgdGhlcmUncyBubyBzdGFydHVw
Cj4gPiBkZXBlbmRlbmN5IGJldHdlZW4gdGhlIHR3by4KPiBzL2poMDU3bjAwOTAvamgwNTduMDA5
MDAKPiAKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1
Lm9yZz4KPiA+IC0tLQo+ID4gIC4uLi9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTduMDA5
MDAuYyAgICB8IDE5ICsrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTkg
aW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAwLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtcm9ja3RlY2gtamgwNTduMDA5MDAuYwo+ID4gaW5kZXggYjhhMDY5MDU1ZmJjLi5mOGY2ZjA4
N2I5YmMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3Rl
Y2gtamgwNTduMDA5MDAuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJv
Y2t0ZWNoLWpoMDU3bjAwOTAwLmMKPiA+IEBAIC0xNSw2ICsxNSw3IEBACj4gPiAgI2luY2x1ZGUg
PGxpbnV4L2dwaW8vY29uc3VtZXIuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvbWVkaWEtYnVzLWZv
cm1hdC5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiA+ICsjaW5jbHVkZSA8bGlu
dXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+Cj4gPiAgI2luY2x1ZGUgPHZpZGVvL2Rpc3BsYXlfdGlt
aW5nLmg+Cj4gPiAgI2luY2x1ZGUgPHZpZGVvL21pcGlfZGlzcGxheS5oPgo+ID4gIAo+ID4gQEAg
LTQ3LDYgKzQ4LDggQEAgc3RydWN0IGpoMDU3biB7Cj4gPiAgCXN0cnVjdCBkcm1fcGFuZWwgcGFu
ZWw7Cj4gPiAgCXN0cnVjdCBncGlvX2Rlc2MgKnJlc2V0X2dwaW87Cj4gPiAgCXN0cnVjdCBiYWNr
bGlnaHRfZGV2aWNlICpiYWNrbGlnaHQ7Cj4gPiArCXN0cnVjdCByZWd1bGF0b3IgKnZjYzsKPiA+
ICsJc3RydWN0IHJlZ3VsYXRvciAqaW92Y2M7Cj4gPiAgCWJvb2wgcHJlcGFyZWQ7Cj4gPiAgCj4g
PiAgCXN0cnVjdCBkZW50cnkgKmRlYnVnZnM7Cj4gPiBAQCAtMTYwLDYgKzE2Myw4IEBAIHN0YXRp
YyBpbnQgamgwNTduX3VucHJlcGFyZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKPiA+ICAJCXJl
dHVybiAwOwo+ID4gIAo+ID4gIAltaXBpX2RzaV9kY3Nfc2V0X2Rpc3BsYXlfb2ZmKGRzaSk7Cj4g
PiArCXJlZ3VsYXRvcl9kaXNhYmxlKGN0eC0+aW92Y2MpOwo+ID4gKwlyZWd1bGF0b3JfZGlzYWJs
ZShjdHgtPnZjYyk7Cj4gPiAgCWN0eC0+cHJlcGFyZWQgPSBmYWxzZTsKPiA+ICAKPiA+ICAJcmV0
dXJuIDA7Cj4gPiBAQCAtMTc0LDYgKzE3OSwxMyBAQCBzdGF0aWMgaW50IGpoMDU3bl9wcmVwYXJl
KHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQo+ID4gIAkJcmV0dXJuIDA7Cj4gPiAgCj4gPiAgCURS
TV9ERVZfREVCVUdfRFJJVkVSKGN0eC0+ZGV2LCAiUmVzZXR0aW5nIHRoZSBwYW5lbFxuIik7Cj4g
PiArCXJldCA9IHJlZ3VsYXRvcl9lbmFibGUoY3R4LT52Y2MpOwo+ID4gKwlpZiAocmV0IDwgMCkK
PiA+ICsJCXJldHVybiByZXQ7Cj4gPiArCXJldCA9IHJlZ3VsYXRvcl9lbmFibGUoY3R4LT5pb3Zj
Yyk7Cj4gPiArCWlmIChyZXQgPCAwKQo+ID4gKwkJcmV0dXJuIHJldDsKPiA+ICsKPiA+ICAJZ3Bp
b2Rfc2V0X3ZhbHVlX2NhbnNsZWVwKGN0eC0+cmVzZXRfZ3BpbywgMSk7Cj4gPiAgCXVzbGVlcF9y
YW5nZSgyMCwgNDApOwo+ID4gIAlncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAoY3R4LT5yZXNldF9n
cGlvLCAwKTsKPiA+IEBAIC0zMDEsNiArMzEzLDEzIEBAIHN0YXRpYyBpbnQgamgwNTduX3Byb2Jl
KHN0cnVjdCBtaXBpX2RzaV9kZXZpY2UgKmRzaSkKPiA+ICAJaWYgKElTX0VSUihjdHgtPmJhY2ts
aWdodCkpCj4gPiAgCQlyZXR1cm4gUFRSX0VSUihjdHgtPmJhY2tsaWdodCk7Cj4gPiAgCj4gPiAr
CWN0eC0+dmNjID0gZGV2bV9yZWd1bGF0b3JfZ2V0KGRldiwgInZjYyIpOwo+ID4gKwlpZiAoSVNf
RVJSKGN0eC0+dmNjKSkKPiA+ICsJCXJldHVybiBQVFJfRVJSKGN0eC0+dmNjKTsKPiA+ICsJY3R4
LT5pb3ZjYyA9IGRldm1fcmVndWxhdG9yX2dldChkZXYsICJpb3ZjYyIpOwo+ID4gKwlpZiAoSVNf
RVJSKGN0eC0+aW92Y2MpKQo+ID4gKwkJcmV0dXJuIFBUUl9FUlIoY3R4LT5pb3ZjYyk7Cj4gPiAr
Cj4gQ29uc2lkZXIgdG8gd3JpdGUgYW4gZXJyb3IgbWVzc2FnZS4KPiBUaGUgcmVndWxhdG9ycyBh
cmUgbm93IG1hbmRhdG9yeSwgYnV0IHRoZXkgYmUgbWlzc2luZyBpbiBzb21lIGRldmljZQo+IHRy
ZWVzLiBTbyBpdCB3b3VsZCBiZSBnb29kIHRvIGhlbHAgdGhlbSB0byB1bmRlcnN0YW5kIHdoeSBp
dCBmYWlscy4KCkkndmUgZml4ZWQgdGhpcyBhbmQgeW91ciBvdGhlciBjb21tZW50cyBpbiB2Mi4K
PiAKPiBXaXRoIHRoaXMgY29uc2lkZXJlZDoKPiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgoKVGhhbmtzISBJJ3ZlIG5vdCBhZGRlZCB0aGlzIHlldCBzaW5jZSBJ
IG1hZGUgdHdvIG1vcmUgY2hhbmdlczoKCi0gYWxzbyBwcmludCBhbiBlcnJvciB3aGVuIHJlZ3Vs
YXRvcl9lbmFibGUoKSBmYWlscwotIGRpc2FibGUgdmNjIGlmIGVuYWJsaW5nIGlvdmNjIGZhaWxz
IGFmdGVyd2FyZHMKCkhvcGUgdGhpcyBsb29rcyBzYW5lIG5vdy4KCkNoZWVycywKIC0tIEd1aWRv
Cgo+IAo+IAlTYW0KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
