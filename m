Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 663CF7036D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 17:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7715789078;
	Mon, 22 Jul 2019 15:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBEA89078
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 15:17:27 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f17so35717224wme.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 08:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GbAfGOTx5uPd3P7pdI3V2Y+OXjJAt27xs5pTCM/ndWc=;
 b=MknCMuHdE0JXb4QEqK/wFGpTGfcD4AfW9Bzx9oi2ZzGqbfdNj7YayN79sybSR+lwNJ
 MAaUsZYg40c5+F46+Vg2N5kjrOUytYMhCrcarsty77q8ID7Y0XtwhmTBW4fGa9RRW3s7
 MLytFiA5oXjI3e0vJi9hT/o/WUx+l1zCAMOZCRIM4Uwm9ae0QHm8SyzEyenGCIOB0QJb
 sfg7BjHrhw32pYu3JPPMbpgok98ZUCNSSVD/E6PyeCOtSpfaIjNV6UEtIABh6ig9Y+c7
 Ea5OuKEJr9eHHU4ynGCdehZD1SZGMeH5WAWz4ZkSXgB8kfQecBdc6nzj6en3W7aPJjE+
 i8Zw==
X-Gm-Message-State: APjAAAUtkKivz3cVMxGwILO/g+oLy93cNMXvC9eLxJr1IJWw7GpJTi3I
 Zw5RT0Z2IkaDKBk8RGN8SwDZTg==
X-Google-Smtp-Source: APXvYqy42hWTID0bFA3QzP8fzY5mWnSbZYD2/zRcCvPejKXa4LoD8z4hz4WNCVE/zW2BaDMan2yWng==
X-Received: by 2002:a1c:f409:: with SMTP id z9mr57053507wma.176.1563808645564; 
 Mon, 22 Jul 2019 08:17:25 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id z19sm28648885wmi.7.2019.07.22.08.17.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 08:17:24 -0700 (PDT)
Date: Mon, 22 Jul 2019 16:17:23 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 2/7] backlight: gpio: simplify the platform data
 handling
Message-ID: <20190722151723.cfvlphcw2dtwsa7z@holly.lan>
References: <20190722150302.29526-1-brgl@bgdev.pl>
 <20190722150302.29526-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722150302.29526-3-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GbAfGOTx5uPd3P7pdI3V2Y+OXjJAt27xs5pTCM/ndWc=;
 b=MgpdRRFk8scefg+/0pPZIHcbPXO1LH97uDm4TTqToX4GmOnbDelZiPNUu7+lBa/Cr4
 t8OrNQ97pctTIdzl1RUUUAJbFrqgF0YDr0MYUdgKUYsMvfhCJkRbjPEVvPstNRhwkjDU
 zhglpgLVpQwMtSTwF3OO8YUfbQwIhDZJCxw7ldDzAGxolEKzTZ19xSBuSeVjOg6XA3b1
 oUx7eCEKAH8x8NNKJUJlb5wg6RWueukCXwkiyDMzLXnCaGRcgT4D0Rg/SSD0lT7ZEB4z
 oXgavso/ntpSoOkFf8uS0F1sXIjOMi/wQU19YhLmp/V24kAwtW3QsKEzy3DhcdpopgjP
 xRcw==
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDU6MDI6NTdQTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5
bGlicmUuY29tPgo+IAo+IE5vdyB0aGF0IHRoZSBsYXN0IHVzZXIgb2YgcGxhdGZvcm0gZGF0YSAo
c2ggZWNvdmVjMjQpIGRlZmluZXMgYSBwcm9wZXIKPiBHUElPIGxvb2t1cCBhbmQgc2V0cyB0aGUg
J2RlZmF1bHQtb24nIGRldmljZSBwcm9wZXJ0eSwgd2UgY2FuIGRyb3AgdGhlCj4gcGxhdGZvcm1f
ZGF0YS1zcGVjaWZpYyBHUElPIGhhbmRsaW5nIGFuZCB1bmlmeSBhIGJpZyBjaHVuayBvZiBjb2Rl
Lgo+IAo+IFRoZSBvbmx5IGZpZWxkIHVzZWQgZnJvbSB0aGUgcGxhdGZvcm0gZGF0YSBpcyBub3cg
dGhlIGZiZGV2IHBvaW50ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3Nr
aSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBz
b24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgoKCj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8v
YmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgfCA2NCArKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDUxIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jIGIv
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwo+IGluZGV4IGU4NGYzMDg3
ZTI5Zi4uMDEyNjIxODZmYTFlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0
L2dwaW9fYmFja2xpZ2h0LmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2Jh
Y2tsaWdodC5jCj4gQEAgLTU1LDMwICs1NSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYmFja2xp
Z2h0X29wcyBncGlvX2JhY2tsaWdodF9vcHMgPSB7Cj4gIAkuY2hlY2tfZmIJPSBncGlvX2JhY2ts
aWdodF9jaGVja19mYiwKPiAgfTsKPiAgCj4gLXN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJv
YmVfZHQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKPiAtCQkJCSAgIHN0cnVjdCBncGlv
X2JhY2tsaWdodCAqZ2JsKQo+IC17Cj4gLQlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2
Owo+IC0JZW51bSBncGlvZF9mbGFncyBmbGFnczsKPiAtCWludCByZXQ7Cj4gLQo+IC0JZ2JsLT5k
ZWZfdmFsdWUgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29sKGRldiwgImRlZmF1bHQtb24iKTsK
PiAtCWZsYWdzID0gZ2JsLT5kZWZfdmFsdWUgPyBHUElPRF9PVVRfSElHSCA6IEdQSU9EX09VVF9M
T1c7Cj4gLQo+IC0JZ2JsLT5ncGlvZCA9IGRldm1fZ3Bpb2RfZ2V0KGRldiwgTlVMTCwgZmxhZ3Mp
Owo+IC0JaWYgKElTX0VSUihnYmwtPmdwaW9kKSkgewo+IC0JCXJldCA9IFBUUl9FUlIoZ2JsLT5n
cGlvZCk7Cj4gLQo+IC0JCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikgewo+IC0JCQlkZXZfZXJy
KGRldiwKPiAtCQkJCSJFcnJvcjogVGhlIGdwaW9zIHBhcmFtZXRlciBpcyBtaXNzaW5nIG9yIGlu
dmFsaWQuXG4iKTsKPiAtCQl9Cj4gLQkJcmV0dXJuIHJldDsKPiAtCX0KPiAtCj4gLQlyZXR1cm4g
MDsKPiAtfQo+IC0KPiAgc3RhdGljIGludCBncGlvX2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ICB7Cj4gIAlzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHRfcGxhdGZv
cm1fZGF0YSAqcGRhdGEgPQo+IEBAIC04Niw2ICs2Miw3IEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNr
bGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCXN0cnVjdCBiYWNr
bGlnaHRfcHJvcGVydGllcyBwcm9wczsKPiAgCXN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpibDsK
PiAgCXN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsOwo+ICsJZW51bSBncGlvZF9mbGFncyBmbGFn
czsKPiAgCWludCByZXQ7Cj4gIAo+ICAJZ2JsID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNp
emVvZigqZ2JsKSwgR0ZQX0tFUk5FTCk7Cj4gQEAgLTk0LDM1ICs3MSwyMCBAQCBzdGF0aWMgaW50
IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAo+
ICAJZ2JsLT5kZXYgPSAmcGRldi0+ZGV2Owo+ICAKPiAtCWlmIChwZGV2LT5kZXYuZndub2RlKSB7
Cj4gLQkJcmV0ID0gZ3Bpb19iYWNrbGlnaHRfcHJvYmVfZHQocGRldiwgZ2JsKTsKPiAtCQlpZiAo
cmV0KQo+IC0JCQlyZXR1cm4gcmV0Owo+IC0JfSBlbHNlIGlmIChwZGF0YSkgewo+IC0JCS8qCj4g
LQkJICogTGVnYWN5IHBsYXRmb3JtIGRhdGEgR1BJTyByZXRyaWV2ZWFsLiBEbyBub3QgZXhwYW5k
Cj4gLQkJICogdGhlIHVzZSBvZiB0aGlzIGNvZGUgcGF0aCwgY3VycmVudGx5IG9ubHkgdXNlZCBi
eSBvbmUKPiAtCQkgKiBTSCBib2FyZC4KPiAtCQkgKi8KPiAtCQl1bnNpZ25lZCBsb25nIGZsYWdz
ID0gR1BJT0ZfRElSX09VVDsKPiAtCj4gKwlpZiAocGRhdGEpCj4gIAkJZ2JsLT5mYmRldiA9IHBk
YXRhLT5mYmRldjsKPiAtCQlnYmwtPmRlZl92YWx1ZSA9IHBkYXRhLT5kZWZfdmFsdWU7Cj4gLQkJ
ZmxhZ3MgfD0gZ2JsLT5kZWZfdmFsdWUgPyBHUElPRl9JTklUX0hJR0ggOiBHUElPRl9JTklUX0xP
VzsKPiAtCj4gLQkJcmV0ID0gZGV2bV9ncGlvX3JlcXVlc3Rfb25lKGdibC0+ZGV2LCBwZGF0YS0+
Z3BpbywgZmxhZ3MsCj4gLQkJCQkJICAgIHBkYXRhID8gcGRhdGEtPm5hbWUgOiAiYmFja2xpZ2h0
Iik7Cj4gLQkJaWYgKHJldCA8IDApIHsKPiAtCQkJZGV2X2VycigmcGRldi0+ZGV2LCAidW5hYmxl
IHRvIHJlcXVlc3QgR1BJT1xuIik7Cj4gLQkJCXJldHVybiByZXQ7Cj4gKwo+ICsJZ2JsLT5kZWZf
dmFsdWUgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29sKCZwZGV2LT5kZXYsICJkZWZhdWx0LW9u
Iik7Cj4gKwlmbGFncyA9IGdibC0+ZGVmX3ZhbHVlID8gR1BJT0RfT1VUX0hJR0ggOiBHUElPRF9P
VVRfTE9XOwo+ICsKPiArCWdibC0+Z3Bpb2QgPSBkZXZtX2dwaW9kX2dldCgmcGRldi0+ZGV2LCBO
VUxMLCBmbGFncyk7Cj4gKwlpZiAoSVNfRVJSKGdibC0+Z3Bpb2QpKSB7Cj4gKwkJcmV0ID0gUFRS
X0VSUihnYmwtPmdwaW9kKTsKPiArCQlpZiAocmV0ICE9IC1FUFJPQkVfREVGRVIpIHsKPiArCQkJ
ZGV2X2VycigmcGRldi0+ZGV2LAo+ICsJCQkJIkVycm9yOiBUaGUgZ3Bpb3MgcGFyYW1ldGVyIGlz
IG1pc3Npbmcgb3IgaW52YWxpZC5cbiIpOwo+ICAJCX0KPiAtCQlnYmwtPmdwaW9kID0gZ3Bpb190
b19kZXNjKHBkYXRhLT5ncGlvKTsKPiAtCQlpZiAoIWdibC0+Z3Bpb2QpCj4gLQkJCXJldHVybiAt
RUlOVkFMOwo+IC0JfSBlbHNlIHsKPiAtCQlkZXZfZXJyKCZwZGV2LT5kZXYsCj4gLQkJCSJmYWls
ZWQgdG8gZmluZCBwbGF0Zm9ybSBkYXRhIG9yIGRldmljZSB0cmVlIG5vZGUuXG4iKTsKPiAtCQly
ZXR1cm4gLUVOT0RFVjsKPiArCQlyZXR1cm4gcmV0Owo+ICAJfQo+ICAKPiAgCW1lbXNldCgmcHJv
cHMsIDAsIHNpemVvZihwcm9wcykpOwo+IC0tIAo+IDIuMjEuMAo+IApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
