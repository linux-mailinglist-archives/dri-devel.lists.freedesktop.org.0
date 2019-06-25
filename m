Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D917559E2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 23:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2B76E248;
	Tue, 25 Jun 2019 21:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB05F6E248
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 21:24:23 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A082580335;
 Tue, 25 Jun 2019 23:24:20 +0200 (CEST)
Date: Tue, 25 Jun 2019 23:24:19 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH 4/4] drm/panel: jh057n0090: Add regulator support
Message-ID: <20190625212419.GB20625@ravnborg.org>
References: <cover.1561482165.git.agx@sigxcpu.org>
 <b239f1db7a1f67988a9bd1ed62f6a1cf1dce944c.1561482165.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b239f1db7a1f67988a9bd1ed62f6a1cf1dce944c.1561482165.git.agx@sigxcpu.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=ze386MxoAAAA:8
 a=7gkXJVJtAAAA:8 a=7rRW2WbpIZ4stnZHryMA:9 a=wPNLvfGTeEIA:10
 a=iBZjaW-pnkserzjvUTHh:22 a=E9Po1WZjFZOl8hwRPBS3:22
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

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDc6MDU6MTlQTSArMDIwMCwgR3VpZG8gR8O8bnRoZXIg
d3JvdGU6Cj4gQWxsb3cgdG8gc3BlY2lmeSByZWd1bGF0b3JzIGZvciB2Y2MgYW5kIGlvdmNjLiBB
Y2NvcmRpbmcgdG8gdGhlIGRhdGEKPiBzaGVldCB0aGUgcGFuZWwgd2FudHMgdmNjICgyLjhWKSBh
bmQgaW92Y2MgKDEuOFYpIGFuZCB0aGVyZSdzIG5vIHN0YXJ0dXAKPiBkZXBlbmRlbmN5IGJldHdl
ZW4gdGhlIHR3by4Kcy9qaDA1N24wMDkwL2poMDU3bjAwOTAwCgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+Cj4gLS0tCj4gIC4uLi9kcm0vcGFuZWwv
cGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAuYyAgICB8IDE5ICsrKysrKysrKysrKysrKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAwLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAuYwo+IGluZGV4IGI4YTA2
OTA1NWZiYy4uZjhmNmYwODdiOWJjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAwLmMKPiBAQCAtMTUsNiArMTUsNyBAQAo+ICAj
aW5jbHVkZSA8bGludXgvZ3Bpby9jb25zdW1lci5oPgo+ICAjaW5jbHVkZSA8bGludXgvbWVkaWEt
YnVzLWZvcm1hdC5oPgo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gKyNpbmNsdWRlIDxs
aW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4KPiAgI2luY2x1ZGUgPHZpZGVvL2Rpc3BsYXlfdGlt
aW5nLmg+Cj4gICNpbmNsdWRlIDx2aWRlby9taXBpX2Rpc3BsYXkuaD4KPiAgCj4gQEAgLTQ3LDYg
KzQ4LDggQEAgc3RydWN0IGpoMDU3biB7Cj4gIAlzdHJ1Y3QgZHJtX3BhbmVsIHBhbmVsOwo+ICAJ
c3RydWN0IGdwaW9fZGVzYyAqcmVzZXRfZ3BpbzsKPiAgCXN0cnVjdCBiYWNrbGlnaHRfZGV2aWNl
ICpiYWNrbGlnaHQ7Cj4gKwlzdHJ1Y3QgcmVndWxhdG9yICp2Y2M7Cj4gKwlzdHJ1Y3QgcmVndWxh
dG9yICppb3ZjYzsKPiAgCWJvb2wgcHJlcGFyZWQ7Cj4gIAo+ICAJc3RydWN0IGRlbnRyeSAqZGVi
dWdmczsKPiBAQCAtMTYwLDYgKzE2Myw4IEBAIHN0YXRpYyBpbnQgamgwNTduX3VucHJlcGFyZShz
dHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKPiAgCQlyZXR1cm4gMDsKPiAgCj4gIAltaXBpX2RzaV9k
Y3Nfc2V0X2Rpc3BsYXlfb2ZmKGRzaSk7Cj4gKwlyZWd1bGF0b3JfZGlzYWJsZShjdHgtPmlvdmNj
KTsKPiArCXJlZ3VsYXRvcl9kaXNhYmxlKGN0eC0+dmNjKTsKPiAgCWN0eC0+cHJlcGFyZWQgPSBm
YWxzZTsKPiAgCj4gIAlyZXR1cm4gMDsKPiBAQCAtMTc0LDYgKzE3OSwxMyBAQCBzdGF0aWMgaW50
IGpoMDU3bl9wcmVwYXJlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQo+ICAJCXJldHVybiAwOwo+
ICAKPiAgCURSTV9ERVZfREVCVUdfRFJJVkVSKGN0eC0+ZGV2LCAiUmVzZXR0aW5nIHRoZSBwYW5l
bFxuIik7Cj4gKwlyZXQgPSByZWd1bGF0b3JfZW5hYmxlKGN0eC0+dmNjKTsKPiArCWlmIChyZXQg
PCAwKQo+ICsJCXJldHVybiByZXQ7Cj4gKwlyZXQgPSByZWd1bGF0b3JfZW5hYmxlKGN0eC0+aW92
Y2MpOwo+ICsJaWYgKHJldCA8IDApCj4gKwkJcmV0dXJuIHJldDsKPiArCj4gIAlncGlvZF9zZXRf
dmFsdWVfY2Fuc2xlZXAoY3R4LT5yZXNldF9ncGlvLCAxKTsKPiAgCXVzbGVlcF9yYW5nZSgyMCwg
NDApOwo+ICAJZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVwKGN0eC0+cmVzZXRfZ3BpbywgMCk7Cj4g
QEAgLTMwMSw2ICszMTMsMTMgQEAgc3RhdGljIGludCBqaDA1N25fcHJvYmUoc3RydWN0IG1pcGlf
ZHNpX2RldmljZSAqZHNpKQo+ICAJaWYgKElTX0VSUihjdHgtPmJhY2tsaWdodCkpCj4gIAkJcmV0
dXJuIFBUUl9FUlIoY3R4LT5iYWNrbGlnaHQpOwo+ICAKPiArCWN0eC0+dmNjID0gZGV2bV9yZWd1
bGF0b3JfZ2V0KGRldiwgInZjYyIpOwo+ICsJaWYgKElTX0VSUihjdHgtPnZjYykpCj4gKwkJcmV0
dXJuIFBUUl9FUlIoY3R4LT52Y2MpOwo+ICsJY3R4LT5pb3ZjYyA9IGRldm1fcmVndWxhdG9yX2dl
dChkZXYsICJpb3ZjYyIpOwo+ICsJaWYgKElTX0VSUihjdHgtPmlvdmNjKSkKPiArCQlyZXR1cm4g
UFRSX0VSUihjdHgtPmlvdmNjKTsKPiArCkNvbnNpZGVyIHRvIHdyaXRlIGFuIGVycm9yIG1lc3Nh
Z2UuClRoZSByZWd1bGF0b3JzIGFyZSBub3cgbWFuZGF0b3J5LCBidXQgdGhleSBiZSBtaXNzaW5n
IGluIHNvbWUgZGV2aWNlCnRyZWVzLiBTbyBpdCB3b3VsZCBiZSBnb29kIHRvIGhlbHAgdGhlbSB0
byB1bmRlcnN0YW5kIHdoeSBpdCBmYWlscy4KCldpdGggdGhpcyBjb25zaWRlcmVkOgpSZXZpZXdl
ZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgoKCVNhbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
