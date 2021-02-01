Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F4D30A378
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 09:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039DC6E48D;
	Mon,  1 Feb 2021 08:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6639B6E44D;
 Mon,  1 Feb 2021 08:41:28 +0000 (UTC)
IronPort-SDR: ZpMgWm6kOWzFu/ENzX6WbdewOCUYy/arlcWBZ68jjP6E74GtMofzlq2XjBpxIU5sh9fPiQcUD7
 RCfnJSQ4ZGLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="265484973"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; d="scan'208";a="265484973"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 00:41:28 -0800
IronPort-SDR: D3F9IwH0PrxoCa/YmhD9O1i17haxEnaYFO7foNRaM3WtDszJ5pUmn4ZUnwn9oQdLU2cxuC14kX
 Hlve2jY67RoQ==
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; d="scan'208";a="369331898"
Received: from wehmschu-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.52.115])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 00:41:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Joe Perches <joe@perches.com>, Jiri Kosina <trivial@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 10/29] drm/i915: Avoid comma separated statements
In-Reply-To: <719e0f14852d132a6649dbd5791fca17f251cb8e.camel@perches.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1598331148.git.joe@perches.com>
 <d687691df8f9978c7b2362c18d77a16b49be76b0.1598331148.git.joe@perches.com>
 <719e0f14852d132a6649dbd5791fca17f251cb8e.camel@perches.com>
Date: Mon, 01 Feb 2021 10:41:21 +0200
Message-ID: <875z3ci3im.fsf@intel.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAzMCBKYW4gMjAyMSwgSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4gd3JvdGU6
Cj4gT24gTW9uLCAyMDIwLTA4LTI0IGF0IDIxOjU2IC0wNzAwLCBKb2UgUGVyY2hlcyB3cm90ZToK
Pj4gVXNlIHNlbWljb2xvbnMgYW5kIGJyYWNlcy4KPgo+IFBpbmc/CgpTZWVtcyB0byBoYXZlIGZh
bGxlbiBiZXR3ZWVuIHRoZSBjcmFja3MuCgpUaGUgZmlyc3QgdHdvIGh1bmtzIGhhdmUgYmVlbiBm
aXhlZCwgdGhlIGxhc3QgdHdvIGFyZSBzdGlsbCB0aGVyZS4gQ2FyZQp0byByZXNwaW4gYW5kIHJl
YmFzZSBhZ2FpbnN0IGRybS10aXAgKG9yIGxpbnV4LW5leHQpIHBsZWFzZT8KCkJSLApKYW5pLgoK
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKb2UgUGVyY2hlcyA8am9lQHBlcmNoZXMuY29tPgo+PiAtLS0K
Pj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9nZW44X3BwZ3R0LmMgICAgICAgICAgIHwgOCAr
KysrKy0tLQo+PiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X3JlcXVlc3RzLmMg
ICAgfCA2ICsrKystLQo+PiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3NlbGZ0ZXN0X3dvcmth
cm91bmRzLmMgfCA2ICsrKystLQo+PiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3J1bnRp
bWVfcG0uYyAgICAgICAgfCA2ICsrKystLQo+PiDCoDQgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0
aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndC9nZW44X3BwZ3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9nZW44X3Bw
Z3R0LmMKPj4gaW5kZXggNjk5MTI1OTI4MjcyLi4xMTRjMTMyODVmZjEgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2dlbjhfcHBndHQuYwo+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndC9nZW44X3BwZ3R0LmMKPj4gQEAgLTMyMywxMCArMzIzLDEyIEBAIHN0YXRp
YyBpbnQgX19nZW44X3BwZ3R0X2FsbG9jKHN0cnVjdCBpOTE1X2FkZHJlc3Nfc3BhY2UgKiBjb25z
dCB2bSwKPj4gwqAJCQl9Cj4+IMKgCj4+IAo+PiDCoAkJCXNwaW5fbG9jaygmcGQtPmxvY2spOwo+
PiAtCQkJaWYgKGxpa2VseSghcGQtPmVudHJ5W2lkeF0pKQo+PiArCQkJaWYgKGxpa2VseSghcGQt
PmVudHJ5W2lkeF0pKSB7Cj4+IMKgCQkJCXNldF9wZF9lbnRyeShwZCwgaWR4LCBwdCk7Cj4+IC0J
CQllbHNlCj4+IC0JCQkJYWxsb2MgPSBwdCwgcHQgPSBwZC0+ZW50cnlbaWR4XTsKPj4gKwkJCX0g
ZWxzZSB7Cj4+ICsJCQkJYWxsb2MgPSBwdDsKPj4gKwkJCQlwdCA9IHBkLT5lbnRyeVtpZHhdOwo+
PiArCQkJfQo+PiDCoAkJfQo+PiDCoAo+PiAKPj4gwqAJCWlmIChsdmwpIHsKPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X3JlcXVlc3RzLmMgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ndF9yZXF1ZXN0cy5jCj4+IGluZGV4IDY2ZmNiZjlkMGZk
ZC4uNTQ0MDhkMGI1ZTZlIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9p
bnRlbF9ndF9yZXF1ZXN0cy5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVs
X2d0X3JlcXVlc3RzLmMKPj4gQEAgLTEzOSw4ICsxMzksMTAgQEAgbG9uZyBpbnRlbF9ndF9yZXRp
cmVfcmVxdWVzdHNfdGltZW91dChzdHJ1Y3QgaW50ZWxfZ3QgKmd0LCBsb25nIHRpbWVvdXQpCj4+
IMKgCUxJU1RfSEVBRChmcmVlKTsKPj4gwqAKPj4gCj4+IMKgCWludGVycnVwdGlibGUgPSB0cnVl
Owo+PiAtCWlmICh1bmxpa2VseSh0aW1lb3V0IDwgMCkpCj4+IC0JCXRpbWVvdXQgPSAtdGltZW91
dCwgaW50ZXJydXB0aWJsZSA9IGZhbHNlOwo+PiArCWlmICh1bmxpa2VseSh0aW1lb3V0IDwgMCkp
IHsKPj4gKwkJdGltZW91dCA9IC10aW1lb3V0Owo+PiArCQlpbnRlcnJ1cHRpYmxlID0gZmFsc2U7
Cj4+ICsJfQo+PiDCoAo+PiAKPj4gwqAJZmx1c2hfc3VibWlzc2lvbihndCwgdGltZW91dCk7IC8q
IGtpY2sgdGhlIGtzb2Z0aXJxZCB0YXNrbGV0cyAqLwo+PiDCoAlzcGluX2xvY2soJnRpbWVsaW5l
cy0+bG9jayk7Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9zZWxmdGVz
dF93b3JrYXJvdW5kcy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRlc3Rfd29ya2Fy
b3VuZHMuYwo+PiBpbmRleCBmZWJjOWU2NjkyYmEuLjNlNGNiZWVkMjBiZCAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRlc3Rfd29ya2Fyb3VuZHMuYwo+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9zZWxmdGVzdF93b3JrYXJvdW5kcy5jCj4+IEBAIC01
MjEsOCArNTIxLDEwIEBAIHN0YXRpYyBpbnQgY2hlY2tfZGlydHlfd2hpdGVsaXN0KHN0cnVjdCBp
bnRlbF9jb250ZXh0ICpjZSkKPj4gwqAKPj4gCj4+IMKgCQlzcm0gPSBNSV9TVE9SRV9SRUdJU1RF
Ul9NRU07Cj4+IMKgCQlscm0gPSBNSV9MT0FEX1JFR0lTVEVSX01FTTsKPj4gLQkJaWYgKElOVEVM
X0dFTihlbmdpbmUtPmk5MTUpID49IDgpCj4+IC0JCQlscm0rKywgc3JtKys7Cj4+ICsJCWlmIChJ
TlRFTF9HRU4oZW5naW5lLT5pOTE1KSA+PSA4KSB7Cj4+ICsJCQlscm0rKzsKPj4gKwkJCXNybSsr
Owo+PiArCQl9Cj4+IMKgCj4+IAo+PiDCoAkJcHJfZGVidWcoIiVzOiBXcml0aW5nIGdhcmJhZ2Ug
dG8gJXhcbiIsCj4+IMKgCQkJIGVuZ2luZS0+bmFtZSwgcmVnKTsKPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3J1bnRpbWVfcG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2ludGVsX3J1bnRpbWVfcG0uYwo+PiBpbmRleCAxNTNjYTllNjUzODIuLmY0OThmMWM4MDc1
NSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcnVudGltZV9wbS5j
Cj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3J1bnRpbWVfcG0uYwo+PiBAQCAt
MjAxLDggKzIwMSwxMCBAQCBfX3ByaW50X2ludGVsX3J1bnRpbWVfcG1fd2FrZXJlZihzdHJ1Y3Qg
ZHJtX3ByaW50ZXIgKnAsCj4+IMKgCQl1bnNpZ25lZCBsb25nIHJlcDsKPj4gwqAKPj4gCj4+IMKg
CQlyZXAgPSAxOwo+PiAtCQl3aGlsZSAoaSArIDEgPCBkYmctPmNvdW50ICYmIGRiZy0+b3duZXJz
W2kgKyAxXSA9PSBzdGFjaykKPj4gLQkJCXJlcCsrLCBpKys7Cj4+ICsJCXdoaWxlIChpICsgMSA8
IGRiZy0+Y291bnQgJiYgZGJnLT5vd25lcnNbaSArIDFdID09IHN0YWNrKSB7Cj4+ICsJCQlyZXAr
KzsKPj4gKwkJCWkrKzsKPj4gKwkJfQo+PiDCoAkJX19wcmludF9kZXBvdF9zdGFjayhzdGFjaywg
YnVmLCBQQUdFX1NJWkUsIDIpOwo+PiDCoAkJZHJtX3ByaW50ZihwLCAiV2FrZXJlZiB4JWx1IHRh
a2VuIGF0OlxuJXMiLCByZXAsIGJ1Zik7Cj4+IMKgCX0KPgo+CgotLSAKSmFuaSBOaWt1bGEsIElu
dGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
