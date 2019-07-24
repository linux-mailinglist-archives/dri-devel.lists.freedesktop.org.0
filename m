Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AE272EB8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 14:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48FF76E52A;
	Wed, 24 Jul 2019 12:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067746E528
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 11:41:56 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jul 2019 04:41:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,302,1559545200"; d="scan'208";a="160538152"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
 by orsmga007.jf.intel.com with ESMTP; 24 Jul 2019 04:41:52 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hqFeZ-0006Bz-1K; Wed, 24 Jul 2019 14:41:51 +0300
Date: Wed, 24 Jul 2019 14:41:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v3 7/7] backlight: gpio: use a helper variable for
 &pdev->dev
Message-ID: <20190724114151.GW9224@smile.fi.intel.com>
References: <20190724082508.27617-1-brgl@bgdev.pl>
 <20190724082508.27617-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724082508.27617-8-brgl@bgdev.pl>
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

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMTA6MjU6MDhBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5
bGlicmUuY29tPgo+IAo+IEluc3RlYWQgb2YgZGVyZWZlcmVuY2luZyBwZGV2IGVhY2ggdGltZSwg
dXNlIGEgaGVscGVyIHZhcmlhYmxlIGZvcgo+IHRoZSBhc3NvY2lhdGVkIGRldmljZSBwb2ludGVy
LgoKUmV2aWV3ZWQtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXgu
aW50ZWwuY29tPgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29s
YXN6ZXdza2lAYmF5bGlicmUuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9n
cGlvX2JhY2tsaWdodC5jIHwgMTkgKysrKysrKysrLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyBiL2RyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKPiBpbmRleCBjZDZhNzViY2E5Y2MuLjdkYzRmOTBkOTI2
YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5j
Cj4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwo+IEBAIC01
NCwyOSArNTQsMjkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBiYWNrbGlnaHRfb3BzIGdwaW9fYmFj
a2xpZ2h0X29wcyA9IHsKPiAgCj4gIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgewo+IC0Jc3RydWN0IGdwaW9fYmFja2xpZ2h0
X3BsYXRmb3JtX2RhdGEgKnBkYXRhID0KPiAtCQlkZXZfZ2V0X3BsYXRkYXRhKCZwZGV2LT5kZXYp
Owo+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiArCXN0cnVjdCBncGlvX2Jh
Y2tsaWdodF9wbGF0Zm9ybV9kYXRhICpwZGF0YSA9IGRldl9nZXRfcGxhdGRhdGEoZGV2KTsKPiAg
CXN0cnVjdCBiYWNrbGlnaHRfcHJvcGVydGllcyBwcm9wczsKPiAgCXN0cnVjdCBiYWNrbGlnaHRf
ZGV2aWNlICpibDsKPiAgCXN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsOwo+ICAJZW51bSBncGlv
ZF9mbGFncyBmbGFnczsKPiAgCWludCByZXQsIGRlZl92YWx1ZTsKPiAgCj4gLQlnYmwgPSBkZXZt
X2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpnYmwpLCBHRlBfS0VSTkVMKTsKPiArCWdibCA9
IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqZ2JsKSwgR0ZQX0tFUk5FTCk7Cj4gIAlpZiAoZ2Js
ID09IE5VTEwpCj4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gIAo+ICAJaWYgKHBkYXRhKQo+ICAJCWdi
bC0+ZmJkZXYgPSBwZGF0YS0+ZmJkZXY7Cj4gIAo+IC0JZGVmX3ZhbHVlID0gZGV2aWNlX3Byb3Bl
cnR5X3JlYWRfYm9vbCgmcGRldi0+ZGV2LCAiZGVmYXVsdC1vbiIpOwo+ICsJZGVmX3ZhbHVlID0g
ZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsICJkZWZhdWx0LW9uIik7Cj4gIAlmbGFncyA9
IGRlZl92YWx1ZSA/IEdQSU9EX09VVF9ISUdIIDogR1BJT0RfT1VUX0xPVzsKPiAgCj4gLQlnYmwt
PmdwaW9kID0gZGV2bV9ncGlvZF9nZXQoJnBkZXYtPmRldiwgTlVMTCwgZmxhZ3MpOwo+ICsJZ2Js
LT5ncGlvZCA9IGRldm1fZ3Bpb2RfZ2V0KGRldiwgTlVMTCwgZmxhZ3MpOwo+ICAJaWYgKElTX0VS
UihnYmwtPmdwaW9kKSkgewo+ICAJCXJldCA9IFBUUl9FUlIoZ2JsLT5ncGlvZCk7Cj4gIAkJaWYg
KHJldCAhPSAtRVBST0JFX0RFRkVSKSB7Cj4gLQkJCWRldl9lcnIoJnBkZXYtPmRldiwKPiArCQkJ
ZGV2X2VycihkZXYsCj4gIAkJCQkiRXJyb3I6IFRoZSBncGlvcyBwYXJhbWV0ZXIgaXMgbWlzc2lu
ZyBvciBpbnZhbGlkLlxuIik7Cj4gIAkJfQo+ICAJCXJldHVybiByZXQ7Cj4gQEAgLTg1LDExICs4
NSwxMCBAQCBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCj4gIAltZW1zZXQoJnByb3BzLCAwLCBzaXplb2YocHJvcHMpKTsKPiAgCXBy
b3BzLnR5cGUgPSBCQUNLTElHSFRfUkFXOwo+ICAJcHJvcHMubWF4X2JyaWdodG5lc3MgPSAxOwo+
IC0JYmwgPSBkZXZtX2JhY2tsaWdodF9kZXZpY2VfcmVnaXN0ZXIoJnBkZXYtPmRldiwgZGV2X25h
bWUoJnBkZXYtPmRldiksCj4gLQkJCQkJJnBkZXYtPmRldiwgZ2JsLCAmZ3Bpb19iYWNrbGlnaHRf
b3BzLAo+IC0JCQkJCSZwcm9wcyk7Cj4gKwlibCA9IGRldm1fYmFja2xpZ2h0X2RldmljZV9yZWdp
c3RlcihkZXYsIGRldl9uYW1lKGRldiksIGRldiwgZ2JsLAo+ICsJCQkJCSAgICAmZ3Bpb19iYWNr
bGlnaHRfb3BzLCAmcHJvcHMpOwo+ICAJaWYgKElTX0VSUihibCkpIHsKPiAtCQlkZXZfZXJyKCZw
ZGV2LT5kZXYsICJmYWlsZWQgdG8gcmVnaXN0ZXIgYmFja2xpZ2h0XG4iKTsKPiArCQlkZXZfZXJy
KGRldiwgImZhaWxlZCB0byByZWdpc3RlciBiYWNrbGlnaHRcbiIpOwo+ICAJCXJldHVybiBQVFJf
RVJSKGJsKTsKPiAgCX0KPiAgCj4gLS0gCj4gMi4yMS4wCj4gCgotLSAKV2l0aCBCZXN0IFJlZ2Fy
ZHMsCkFuZHkgU2hldmNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
