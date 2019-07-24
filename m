Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1582072D19
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 13:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AF06E51C;
	Wed, 24 Jul 2019 11:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D846E51C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 11:13:24 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p17so46497385wrf.11
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 04:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NvtrvMV4Nt63Balca848q6E3+ZhiwJtTkFp748N0uOg=;
 b=ku1fcGPPzxIJAHfEd8coFFzqiYq4yDvc0nM7WSUs5LqyaZBeRzSZixhowuR/el+NDq
 ZAcDnoSAfFCwaYTNL2/oDEbNwERK6hYH8IEzzVDSYZtXTDJ3Nu4no/hvdZ44bJjchc26
 EOLHxpWQRSP57bfYqjEOUbS26FACPBvKrq1kv+H1QZf3jo3onyWwkfAKBXN49JNK1T6I
 0N+6Ac8n8AP1pZWLtl/QnlU9f2OnyEUalsBnk324NhAZYCnNcC+xBR+v0W3NwNu2wj4J
 TQ50fTrAoVRyWd00zhD/ZlbrIUdL8h2KluVZRAnsBzoMs4WalB4JK40puyVWZpYLc8li
 GiOA==
X-Gm-Message-State: APjAAAUoHjGeZuYNGn+JhmyHxU8rPqy19z4wO9w1b94iJdh18CWSfINy
 fKomyLtYyAFvG51AOOqnPAiU1Q==
X-Google-Smtp-Source: APXvYqx/dJQm29UHdXc22ek+l/R3WZ8DvlqPT7fB+ZSBlOpP1Vt6kKQ09cwEg8JrNSUsNUX8cyM6bw==
X-Received: by 2002:adf:ed4a:: with SMTP id u10mr93203495wro.284.1563966802936; 
 Wed, 24 Jul 2019 04:13:22 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id c30sm80678542wrb.15.2019.07.24.04.13.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 04:13:22 -0700 (PDT)
Date: Wed, 24 Jul 2019 12:13:20 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v3 6/7] backlight: gpio: remove def_value from struct
 gpio_backlight
Message-ID: <20190724111320.wqcquhmlylgfkv6f@holly.lan>
References: <20190724082508.27617-1-brgl@bgdev.pl>
 <20190724082508.27617-7-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724082508.27617-7-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NvtrvMV4Nt63Balca848q6E3+ZhiwJtTkFp748N0uOg=;
 b=KNjXtO5njYFUIck/ozHOGMIWJ6z+FSABuu2c1L59UTM9K87f1GzdoroCF41tDBxyrR
 7k+3fRTPUuhaq3B9Hijc4O3kz+rsb715JXcHhmvy1cm/35kj00R/EzG/AUcxC0wYxppv
 iBNLNR0Qu5clqaICWCeBMs7+LCiY7oa2wyFkQ4Nr6JaJiBv0yc9XgOn8jvykpYj4jW3W
 V7sQmX8uE7OD2tdKkFLBFOh541lVAexffqWUb9dR4X2gRStG/Mh45aD1PUGXtyWMOwnB
 /9zrSd3j+rQ0U9jRbeOYdTkoQdGX8XweZvzgaNJlPlXtjl8+spgMq1rkvRyuwBZuvav9
 Bcfw==
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

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMTA6MjU6MDdBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5
bGlicmUuY29tPgo+IAo+IFRoaXMgZmllbGQgaXMgdW51c2VkIG91dHNpZGUgb2YgcHJvYmUoKS4g
VGhlcmUncyBubyBuZWVkIHRvIHN0b3JlIGl0Lgo+IFdlIGNhbiBtYWtlIGl0IGludG8gYSBsb2Nh
bCB2YXJpYWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29s
YXN6ZXdza2lAYmF5bGlicmUuY29tPgo+IFJldmlld2VkLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFu
ZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KClJldmlld2VkLWJ5OiBEYW5pZWwgVGhv
bXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jIHwgOSArKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyBiL2RyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKPiBpbmRleCA3MDg4MjU1NmYwNDcuLmNkNmE3NWJjYTlj
YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5j
Cj4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwo+IEBAIC0y
MSw3ICsyMSw2IEBACj4gIHN0cnVjdCBncGlvX2JhY2tsaWdodCB7Cj4gIAlzdHJ1Y3QgZGV2aWNl
ICpmYmRldjsKPiAgCXN0cnVjdCBncGlvX2Rlc2MgKmdwaW9kOwo+IC0JaW50IGRlZl92YWx1ZTsK
PiAgfTsKPiAgCj4gIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfdXBkYXRlX3N0YXR1cyhzdHJ1
Y3QgYmFja2xpZ2h0X2RldmljZSAqYmwpCj4gQEAgLTYxLDcgKzYwLDcgQEAgc3RhdGljIGludCBn
cGlvX2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJc3Ry
dWN0IGJhY2tsaWdodF9kZXZpY2UgKmJsOwo+ICAJc3RydWN0IGdwaW9fYmFja2xpZ2h0ICpnYmw7
Cj4gIAllbnVtIGdwaW9kX2ZsYWdzIGZsYWdzOwo+IC0JaW50IHJldDsKPiArCWludCByZXQsIGRl
Zl92YWx1ZTsKPiAgCj4gIAlnYmwgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpn
YmwpLCBHRlBfS0VSTkVMKTsKPiAgCWlmIChnYmwgPT0gTlVMTCkKPiBAQCAtNzAsOCArNjksOCBA
QCBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCj4gIAlpZiAocGRhdGEpCj4gIAkJZ2JsLT5mYmRldiA9IHBkYXRhLT5mYmRldjsKPiAg
Cj4gLQlnYmwtPmRlZl92YWx1ZSA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woJnBkZXYtPmRl
diwgImRlZmF1bHQtb24iKTsKPiAtCWZsYWdzID0gZ2JsLT5kZWZfdmFsdWUgPyBHUElPRF9PVVRf
SElHSCA6IEdQSU9EX09VVF9MT1c7Cj4gKwlkZWZfdmFsdWUgPSBkZXZpY2VfcHJvcGVydHlfcmVh
ZF9ib29sKCZwZGV2LT5kZXYsICJkZWZhdWx0LW9uIik7Cj4gKwlmbGFncyA9IGRlZl92YWx1ZSA/
IEdQSU9EX09VVF9ISUdIIDogR1BJT0RfT1VUX0xPVzsKPiAgCj4gIAlnYmwtPmdwaW9kID0gZGV2
bV9ncGlvZF9nZXQoJnBkZXYtPmRldiwgTlVMTCwgZmxhZ3MpOwo+ICAJaWYgKElTX0VSUihnYmwt
PmdwaW9kKSkgewo+IEBAIC05NCw3ICs5Myw3IEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCQlyZXR1cm4gUFRSX0VSUihi
bCk7Cj4gIAl9Cj4gIAo+IC0JYmwtPnByb3BzLmJyaWdodG5lc3MgPSBnYmwtPmRlZl92YWx1ZTsK
PiArCWJsLT5wcm9wcy5icmlnaHRuZXNzID0gZGVmX3ZhbHVlOwo+ICAJYmFja2xpZ2h0X3VwZGF0
ZV9zdGF0dXMoYmwpOwo+ICAKPiAgCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGJsKTsKPiAt
LSAKPiAyLjIxLjAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
