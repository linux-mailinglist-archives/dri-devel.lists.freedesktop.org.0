Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE58272EB2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 14:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4456E528;
	Wed, 24 Jul 2019 12:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4756E528
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 11:44:15 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jul 2019 04:44:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,302,1559545200"; d="scan'208";a="253579928"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
 by orsmga001.jf.intel.com with ESMTP; 24 Jul 2019 04:44:11 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hqFgo-0006Dw-8S; Wed, 24 Jul 2019 14:44:10 +0300
Date: Wed, 24 Jul 2019 14:44:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v3 2/7] backlight: gpio: simplify the platform data
 handling
Message-ID: <20190724114410.GX9224@smile.fi.intel.com>
References: <20190724082508.27617-1-brgl@bgdev.pl>
 <20190724082508.27617-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724082508.27617-3-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 24 Jul 2019 12:20:46 +0000
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMTA6MjU6MDNBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5
bGlicmUuY29tPgo+IAo+IE5vdyB0aGF0IHRoZSBsYXN0IHVzZXIgb2YgcGxhdGZvcm0gZGF0YSAo
c2ggZWNvdmVjMjQpIGRlZmluZXMgYSBwcm9wZXIKPiBHUElPIGxvb2t1cCBhbmQgc2V0cyB0aGUg
J2RlZmF1bHQtb24nIGRldmljZSBwcm9wZXJ0eSwgd2UgY2FuIGRyb3AgdGhlCj4gcGxhdGZvcm1f
ZGF0YS1zcGVjaWZpYyBHUElPIGhhbmRsaW5nIGFuZCB1bmlmeSBhIGJpZyBjaHVuayBvZiBjb2Rl
Lgo+IAo+IFRoZSBvbmx5IGZpZWxkIHVzZWQgZnJvbSB0aGUgcGxhdGZvcm0gZGF0YSBpcyBub3cg
dGhlIGZiZGV2IHBvaW50ZXIuCgpSZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXku
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3og
R29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgfCA2NCArKysrKy0tLS0tLS0tLS0tLS0t
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDUxIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdo
dC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwo+IGluZGV4IGU4
NGYzMDg3ZTI5Zi4uMDEyNjIxODZmYTFlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9n
cGlvX2JhY2tsaWdodC5jCj4gQEAgLTU1LDMwICs1NSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
YmFja2xpZ2h0X29wcyBncGlvX2JhY2tsaWdodF9vcHMgPSB7Cj4gIAkuY2hlY2tfZmIJPSBncGlv
X2JhY2tsaWdodF9jaGVja19mYiwKPiAgfTsKPiAgCj4gLXN0YXRpYyBpbnQgZ3Bpb19iYWNrbGln
aHRfcHJvYmVfZHQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKPiAtCQkJCSAgIHN0cnVj
dCBncGlvX2JhY2tsaWdodCAqZ2JsKQo+IC17Cj4gLQlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRl
di0+ZGV2Owo+IC0JZW51bSBncGlvZF9mbGFncyBmbGFnczsKPiAtCWludCByZXQ7Cj4gLQo+IC0J
Z2JsLT5kZWZfdmFsdWUgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29sKGRldiwgImRlZmF1bHQt
b24iKTsKPiAtCWZsYWdzID0gZ2JsLT5kZWZfdmFsdWUgPyBHUElPRF9PVVRfSElHSCA6IEdQSU9E
X09VVF9MT1c7Cj4gLQo+IC0JZ2JsLT5ncGlvZCA9IGRldm1fZ3Bpb2RfZ2V0KGRldiwgTlVMTCwg
ZmxhZ3MpOwo+IC0JaWYgKElTX0VSUihnYmwtPmdwaW9kKSkgewo+IC0JCXJldCA9IFBUUl9FUlIo
Z2JsLT5ncGlvZCk7Cj4gLQo+IC0JCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikgewo+IC0JCQlk
ZXZfZXJyKGRldiwKPiAtCQkJCSJFcnJvcjogVGhlIGdwaW9zIHBhcmFtZXRlciBpcyBtaXNzaW5n
IG9yIGludmFsaWQuXG4iKTsKPiAtCQl9Cj4gLQkJcmV0dXJuIHJldDsKPiAtCX0KPiAtCj4gLQly
ZXR1cm4gMDsKPiAtfQo+IC0KPiAgc3RhdGljIGludCBncGlvX2JhY2tsaWdodF9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICB7Cj4gIAlzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHRf
cGxhdGZvcm1fZGF0YSAqcGRhdGEgPQo+IEBAIC04Niw2ICs2Miw3IEBAIHN0YXRpYyBpbnQgZ3Bp
b19iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCXN0cnVj
dCBiYWNrbGlnaHRfcHJvcGVydGllcyBwcm9wczsKPiAgCXN0cnVjdCBiYWNrbGlnaHRfZGV2aWNl
ICpibDsKPiAgCXN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsOwo+ICsJZW51bSBncGlvZF9mbGFn
cyBmbGFnczsKPiAgCWludCByZXQ7Cj4gIAo+ICAJZ2JsID0gZGV2bV9remFsbG9jKCZwZGV2LT5k
ZXYsIHNpemVvZigqZ2JsKSwgR0ZQX0tFUk5FTCk7Cj4gQEAgLTk0LDM1ICs3MSwyMCBAQCBzdGF0
aWMgaW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4gIAo+ICAJZ2JsLT5kZXYgPSAmcGRldi0+ZGV2Owo+ICAKPiAtCWlmIChwZGV2LT5kZXYuZndu
b2RlKSB7Cj4gLQkJcmV0ID0gZ3Bpb19iYWNrbGlnaHRfcHJvYmVfZHQocGRldiwgZ2JsKTsKPiAt
CQlpZiAocmV0KQo+IC0JCQlyZXR1cm4gcmV0Owo+IC0JfSBlbHNlIGlmIChwZGF0YSkgewo+IC0J
CS8qCj4gLQkJICogTGVnYWN5IHBsYXRmb3JtIGRhdGEgR1BJTyByZXRyaWV2ZWFsLiBEbyBub3Qg
ZXhwYW5kCj4gLQkJICogdGhlIHVzZSBvZiB0aGlzIGNvZGUgcGF0aCwgY3VycmVudGx5IG9ubHkg
dXNlZCBieSBvbmUKPiAtCQkgKiBTSCBib2FyZC4KPiAtCQkgKi8KPiAtCQl1bnNpZ25lZCBsb25n
IGZsYWdzID0gR1BJT0ZfRElSX09VVDsKPiAtCj4gKwlpZiAocGRhdGEpCj4gIAkJZ2JsLT5mYmRl
diA9IHBkYXRhLT5mYmRldjsKPiAtCQlnYmwtPmRlZl92YWx1ZSA9IHBkYXRhLT5kZWZfdmFsdWU7
Cj4gLQkJZmxhZ3MgfD0gZ2JsLT5kZWZfdmFsdWUgPyBHUElPRl9JTklUX0hJR0ggOiBHUElPRl9J
TklUX0xPVzsKPiAtCj4gLQkJcmV0ID0gZGV2bV9ncGlvX3JlcXVlc3Rfb25lKGdibC0+ZGV2LCBw
ZGF0YS0+Z3BpbywgZmxhZ3MsCj4gLQkJCQkJICAgIHBkYXRhID8gcGRhdGEtPm5hbWUgOiAiYmFj
a2xpZ2h0Iik7Cj4gLQkJaWYgKHJldCA8IDApIHsKPiAtCQkJZGV2X2VycigmcGRldi0+ZGV2LCAi
dW5hYmxlIHRvIHJlcXVlc3QgR1BJT1xuIik7Cj4gLQkJCXJldHVybiByZXQ7Cj4gKwo+ICsJZ2Js
LT5kZWZfdmFsdWUgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29sKCZwZGV2LT5kZXYsICJkZWZh
dWx0LW9uIik7Cj4gKwlmbGFncyA9IGdibC0+ZGVmX3ZhbHVlID8gR1BJT0RfT1VUX0hJR0ggOiBH
UElPRF9PVVRfTE9XOwo+ICsKPiArCWdibC0+Z3Bpb2QgPSBkZXZtX2dwaW9kX2dldCgmcGRldi0+
ZGV2LCBOVUxMLCBmbGFncyk7Cj4gKwlpZiAoSVNfRVJSKGdibC0+Z3Bpb2QpKSB7Cj4gKwkJcmV0
ID0gUFRSX0VSUihnYmwtPmdwaW9kKTsKPiArCQlpZiAocmV0ICE9IC1FUFJPQkVfREVGRVIpIHsK
PiArCQkJZGV2X2VycigmcGRldi0+ZGV2LAo+ICsJCQkJIkVycm9yOiBUaGUgZ3Bpb3MgcGFyYW1l
dGVyIGlzIG1pc3Npbmcgb3IgaW52YWxpZC5cbiIpOwo+ICAJCX0KPiAtCQlnYmwtPmdwaW9kID0g
Z3Bpb190b19kZXNjKHBkYXRhLT5ncGlvKTsKPiAtCQlpZiAoIWdibC0+Z3Bpb2QpCj4gLQkJCXJl
dHVybiAtRUlOVkFMOwo+IC0JfSBlbHNlIHsKPiAtCQlkZXZfZXJyKCZwZGV2LT5kZXYsCj4gLQkJ
CSJmYWlsZWQgdG8gZmluZCBwbGF0Zm9ybSBkYXRhIG9yIGRldmljZSB0cmVlIG5vZGUuXG4iKTsK
PiAtCQlyZXR1cm4gLUVOT0RFVjsKPiArCQlyZXR1cm4gcmV0Owo+ICAJfQo+ICAKPiAgCW1lbXNl
dCgmcHJvcHMsIDAsIHNpemVvZihwcm9wcykpOwo+IC0tIAo+IDIuMjEuMAo+IAoKLS0gCldpdGgg
QmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
