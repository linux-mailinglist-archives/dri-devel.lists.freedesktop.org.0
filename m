Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9D32CA11F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 12:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E41B89E86;
	Tue,  1 Dec 2020 11:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891E389E69
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 11:20:28 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1kk3hl-00063f-Ft; Tue, 01 Dec 2020 12:20:21 +0100
Message-ID: <0a7f2c0e8618f89c1e2eede661cf5a59d68cecad.camel@pengutronix.de>
Subject: Re: [PATCH] drm: mxsfb: Add interconnect path request
From: Lucas Stach <l.stach@pengutronix.de>
To: Martin Kepplinger <martin.kepplinger@puri.sm>, marex@denx.de, 
 stefan@agner.ch, airlied@linux.ie, daniel@ffwll.ch, shawnguo@kernel.org
Date: Tue, 01 Dec 2020 12:20:18 +0100
In-Reply-To: <20201201103757.32165-1-martin.kepplinger@puri.sm>
References: <20201201103757.32165-1-martin.kepplinger@puri.sm>
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRGllbnN0YWcsIGRlbiAwMS4xMi4yMDIwLCAxMTozNyArMDEwMCBzY2hyaWViIE1hcnRpbiBL
ZXBwbGluZ2VyOgo+IEFkZCBpbnRlcmNvbm5lY3Qgc3VwcG9ydCB0byBteHNmYiBzbyB0aGF0IGl0
IGlzIGFibGUgdG8gcmVxdWVzdCBlbm91Z2gKPiBiYW5kd2lkdGggdG8gRERSIGZvciBkaXNwbGF5
IG91dHB1dCB0byB3b3JrLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcnRpbiBLZXBwbGluZ2VyIDxt
YXJ0aW4ua2VwcGxpbmdlckBwdXJpLnNtPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL214c2Zi
L214c2ZiX2Rydi5jIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+IMKgZHJp
dmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5oIHwgIDIgKysKPiDCoGRyaXZlcnMvZ3B1L2Ry
bS9teHNmYi9teHNmYl9rbXMuYyB8IDEzICsrKysrKysrKysrKwo+IMKgMyBmaWxlcyBjaGFuZ2Vk
LCA0OCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9teHNm
Yi9teHNmYl9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuYwo+IGluZGV4
IDZmYWYxN2I2NDA4ZC4uYjA1ZThlNWYxZTM4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9teHNmYi9teHNmYl9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9k
cnYuYwo+IEBAIC0xNSw2ICsxNSw3IEBACj4gwqAjaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+
Cj4gwqAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gwqAjaW5jbHVkZSA8bGlu
dXgvcG1fcnVudGltZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvaW50ZXJjb25uZWN0Lmg+Cj4gwqAK
PiAKPiAKPiAKPiDCoCNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4KPiDCoCNpbmNs
dWRlIDxkcm0vZHJtX2JyaWRnZS5oPgo+IEBAIC0zMTEsNiArMzEyLDM0IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG14c2ZiX2R0X2lkc1tdID0gewo+IMKgfTsKPiDCoE1PRFVM
RV9ERVZJQ0VfVEFCTEUob2YsIG14c2ZiX2R0X2lkcyk7Cj4gCj4gKwo+ICtzdGF0aWMgaW50IG14
c2ZiX2luaXRfaWNjKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gK3sKPiArCXN0cnVj
dCBkcm1fZGV2aWNlICpkcm0gPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKPiArCXN0cnVj
dCBteHNmYl9kcm1fcHJpdmF0ZSAqbXhzZmIgPSBkcm0tPmRldl9wcml2YXRlOwo+ICsJaW50IHJl
dDsKPiArCj4gKwkvKiBPcHRpb25hbCBpbnRlcmNvbm5lY3QgcmVxdWVzdCAqLwo+ICsJbXhzZmIt
PmljY19wYXRoID0gZGV2bV9vZl9pY2NfZ2V0KCZwZGV2LT5kZXYsICJsY2RpZi1kcmFtIik7Cj4g
KwlpZiAoSVNfRVJSKG14c2ZiLT5pY2NfcGF0aCkpIHsKPiArCQlyZXQgPSBQVFJfRVJSKG14c2Zi
LT5pY2NfcGF0aCk7Cj4gKwkJaWYgKHJldCA9PSAtRVBST0JFX0RFRkVSKQo+ICsJCQlyZXR1cm4g
cmV0Owo+ICsKPiArCQlteHNmYi0+aWNjX3BhdGggPSBOVUxMOwo+ICsJCWRldl9kYmcoZHJtLT5k
ZXYsCj4gKwkJCSJObyBpbnRlcmNvbm5lY3QgbWF5IGNhdXNlIGRpc3BsYXkgdW5kZXJmbG93cyFc
biIpOwo+ICsJfQo+ICsKPiArCXJldCA9IGljY19zZXRfYncobXhzZmItPmljY19wYXRoLCAwLCBN
QnBzX3RvX2ljYyg3MDApKTsKClNob3VsZG4ndCB0aGlzIGJlIHByb3BvcnRpb25hbCB0byB0aGUg
Y3VycmVudCBtb2RlLCBpbnN0ZWFkIG9mIGEgZml4ZWQKdmFsdWU/IDcwME1CIGxvb2tzIGxpa2Ug
MTA4MHBANjBIekAzMmJwcCB3aXRoIGEgYml0IG9mIGhlYWRyb29tLCBidXQKdGhlcmUgYXJlIG1h
bnkgdmFsaWQgdXNlLWNhc2VzIHdoZXJlIHNpZ25pZmljYW50bHkgc21hbGxlciBkaXNwbGF5cyBh
cmUKY29ubmVjdGVkIHRvIHRoZSBlTENESUYuIEFsc28gaXQgZG9lc24ndCBjb3ZlciB0aGUgY2Fz
ZSB3aGVyZSBhbgpvdmVybGF5IGlzIGFjdGl2ZSwgd2hpY2ggbmVlZHMgYWRkaXRpb25hbCBiYW5k
d2lkdGguCgo+ICsJaWYgKHJldCkgewo+ICsJCWRldl9lcnIoZHJtLT5kZXYsICIlczogaWNjX3Nl
dF9idyBmYWlsZWQ6ICVkXG4iLCBfX2Z1bmNfXywgcmV0KTsKPiArCQlyZXR1cm4gcmV0Owo+ICsJ
fQo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwpbLi4uXQo+IMKgI2luY2x1ZGUgPGRybS9kcm1f
YXRvbWljLmg+Cj4gwqAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+Cj4gQEAgLTMx
MCw2ICszMTEsMTIgQEAgc3RhdGljIHZvaWQgbXhzZmJfY3J0Y19hdG9taWNfZW5hYmxlKHN0cnVj
dCBkcm1fY3J0YyAqY3J0YywKPiDCoAlzdHJ1Y3QgbXhzZmJfZHJtX3ByaXZhdGUgKm14c2ZiID0g
dG9fbXhzZmJfZHJtX3ByaXZhdGUoY3J0Yy0+ZGV2KTsKPiDCoAlzdHJ1Y3QgZHJtX2RldmljZSAq
ZHJtID0gbXhzZmItPmRybTsKPiDCoAlkbWFfYWRkcl90IHBhZGRyOwo+ICsJaW50IHJldDsKPiAr
Cj4gKwlyZXQgPSBpY2NfZW5hYmxlKG14c2ZiLT5pY2NfcGF0aCk7Cj4gKwlpZiAocmV0KQo+ICsJ
CWRldl9lcnJfcmF0ZWxpbWl0ZWQoZHJtLT5kZXYsICIlczogaWNjX2VuYWJsZSBmYWlsZWQ6ICVk
XG4iLAo+ICsJCQkJICAgIF9fZnVuY19fLCByZXQpOwoKV2h5IHJhdGVsaW1pdGVkPyBJIHdvdWxk
bid0IGV4cGVjdCBhdG9taWMgZW5hYmxlL2Rpc2FibGUgdG8gYmUgY2FsbGVkCm9mdGVuIGVub3Vn
aCBmb3IgdGhpcyB0byBtYWtlIGFueSBkaWZmZXJlbmNlLgoKUmVnYXJkcywKTHVjYXMKCj4gCj4g
wqAJcG1fcnVudGltZV9nZXRfc3luYyhkcm0tPmRldik7Cj4gwqAJbXhzZmJfZW5hYmxlX2F4aV9j
bGsobXhzZmIpOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
