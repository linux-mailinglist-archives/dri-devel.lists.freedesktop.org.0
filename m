Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C116872EAC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 14:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A60D6E527;
	Wed, 24 Jul 2019 12:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CE36E4AA
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 08:26:57 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id s7so87672465iob.11
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 01:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CBhO//b1Mv8t3fldT3hg9NFY3tt50vLM1dbfXQdhvjw=;
 b=Ibw/bNWBJB16kttTs8B8HF7K2o9X/b7EjuDWVVuwtJPQbFto7F0V7IL4lc972bUORe
 pyKRoOudFJqWAjlq7AFUS7jKwH4va6BQdluUi3DgPRP/Z8r6mWjNfNUpE+2OrBC9PpYQ
 vxSQo3H9yitEfYlFzuRokLeZFJuSmZ+XtJ244e3WpMZirfyubsRkUOQ4/Nyg6rCHckvx
 QY4Zq1B0P310W2FaJIA+vu24dRaTEjB4fjv8AXIcopPw32C5lZzaxMMn2QHCG6rd17WC
 KXrExg48aeNAH3/EiYpmldbQnQLt03mlQzBotlx7/SmlKLFVu+1Fc88vRIPRXutlpAuS
 cY3g==
X-Gm-Message-State: APjAAAWdW2qnP1vcdVCBxyVfQnnHpwJSoA5K81TtgwSLsE8yyK9TIN3S
 gY7joFJsAQVChm12+MEE/NuVd7INi+pMBTkcX2c=
X-Google-Smtp-Source: APXvYqzlFH3wxV7Lz03vd2PrLc6bLm/+Ylj+di1LyWBQl8Ph0JepWk9jenk2cbZdUGaXiz8cH9/q3mMFct7ATpMadlg=
X-Received: by 2002:a05:6638:cf:: with SMTP id
 w15mr5664293jao.136.1563956816689; 
 Wed, 24 Jul 2019 01:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190722150302.29526-1-brgl@bgdev.pl>
 <20190722150302.29526-3-brgl@bgdev.pl>
 <20190722160603.GY9224@smile.fi.intel.com>
 <CAMRc=Mfuvh6byfPhPdB51dy_YbAS5scJQT3n3pL_5VZLCjB3Hw@mail.gmail.com>
 <20190723153250.GK9224@smile.fi.intel.com>
In-Reply-To: <20190723153250.GK9224@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Jul 2019 10:26:45 +0200
Message-ID: <CAMRc=Mf9MZRkvK5bvqsQuqwcUe5Wmsk+D7jwg2wMEK_cYVfe+Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] backlight: gpio: simplify the platform data
 handling
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailman-Approved-At: Wed, 24 Jul 2019 12:20:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CBhO//b1Mv8t3fldT3hg9NFY3tt50vLM1dbfXQdhvjw=;
 b=D0p3Mc071pUEefJy2mzeuN0fKTpYKSow5oJhq50h2fxfnYdBwxnbUByQp3g8PS83e6
 At7iFoflnUuJh+x4blgGMFTDiVc0kOXTzjnwcF+UCwUbiShrIpTOhE2XIL+BqznqbY5t
 +UAaGLNmoaxWHHuN17Y2UBuy+pjgtYRocCvE6Pfbw2iZq2+TEm2nP9ucMiKLMGc2qfTj
 ApBqGrOuZB7kDqflOss8X2lqwBRr/6pPdg0uYWFVB6uU0l/UtHPv4aQgbs82rjmWgZgl
 c/Jb3D2O/z3w7jJXdLE43+asiU+OaAbLv/vy1SFRD6SfPJtk52VMMqvVHF7Yusk1djdr
 hCXg==
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

d3QuLCAyMyBsaXAgMjAxOSBvIDE3OjMyIEFuZHkgU2hldmNoZW5rbwo8YW5kcml5LnNoZXZjaGVu
a29AbGludXguaW50ZWwuY29tPiBuYXBpc2HFgihhKToKPgo+IE9uIFR1ZSwgSnVsIDIzLCAyMDE5
IGF0IDA4OjI4OjAwQU0gKzAyMDAsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gPiBwb24u
LCAyMiBsaXAgMjAxOSBvIDE4OjA2IEFuZHkgU2hldmNoZW5rbwo+ID4gPGFuZHJpeS5zaGV2Y2hl
bmtvQGxpbnV4LmludGVsLmNvbT4gbmFwaXNhxYIoYSk6Cj4gPiA+Cj4gPiA+IE9uIE1vbiwgSnVs
IDIyLCAyMDE5IGF0IDA1OjAyOjU3UE0gKzAyMDAsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6
Cj4gPiA+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJl
LmNvbT4KPiA+ID4gPgo+ID4gPiA+IE5vdyB0aGF0IHRoZSBsYXN0IHVzZXIgb2YgcGxhdGZvcm0g
ZGF0YSAoc2ggZWNvdmVjMjQpIGRlZmluZXMgYSBwcm9wZXIKPiA+ID4gPiBHUElPIGxvb2t1cCBh
bmQgc2V0cyB0aGUgJ2RlZmF1bHQtb24nIGRldmljZSBwcm9wZXJ0eSwgd2UgY2FuIGRyb3AgdGhl
Cj4gPiA+ID4gcGxhdGZvcm1fZGF0YS1zcGVjaWZpYyBHUElPIGhhbmRsaW5nIGFuZCB1bmlmeSBh
IGJpZyBjaHVuayBvZiBjb2RlLgo+ID4gPiA+Cj4gPiA+ID4gVGhlIG9ubHkgZmllbGQgdXNlZCBm
cm9tIHRoZSBwbGF0Zm9ybSBkYXRhIGlzIG5vdyB0aGUgZmJkZXYgcG9pbnRlci4KPiA+ID4KPiA+
ID4gPiAtc3RhdGljIGludCBncGlvX2JhY2tsaWdodF9wcm9iZV9kdChzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2LAo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsKQo+ID4gPiA+IC17Cj4gPiA+ID4gLSAgICAgc3RydWN0
IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiA+ID4gPiAtICAgICBlbnVtIGdwaW9kX2ZsYWdz
IGZsYWdzOwo+ID4gPiA+IC0gICAgIGludCByZXQ7Cj4gPiA+ID4gLQo+ID4gPiA+IC0gICAgIGdi
bC0+ZGVmX3ZhbHVlID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsICJkZWZhdWx0LW9u
Iik7Cj4gPiA+ID4gLSAgICAgZmxhZ3MgPSBnYmwtPmRlZl92YWx1ZSA/IEdQSU9EX09VVF9ISUdI
IDogR1BJT0RfT1VUX0xPVzsKPiA+ID4gPiAtCj4gPiA+ID4gLSAgICAgZ2JsLT5ncGlvZCA9IGRl
dm1fZ3Bpb2RfZ2V0KGRldiwgTlVMTCwgZmxhZ3MpOwo+ID4gPiA+IC0gICAgIGlmIChJU19FUlIo
Z2JsLT5ncGlvZCkpIHsKPiA+ID4gPiAtICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIoZ2JsLT5n
cGlvZCk7Cj4gPiA+ID4gLQo+ID4gPiA+IC0gICAgICAgICAgICAgaWYgKHJldCAhPSAtRVBST0JF
X0RFRkVSKSB7Cj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LAo+ID4g
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICJFcnJvcjogVGhlIGdwaW9zIHBhcmFt
ZXRlciBpcyBtaXNzaW5nIG9yIGludmFsaWQuXG4iKTsKPiA+ID4gPiAtICAgICAgICAgICAgIH0K
PiA+ID4gPiAtICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiA+ID4gLSAgICAgfQo+ID4gPiA+
IC0KPiA+ID4gPiAtICAgICByZXR1cm4gMDsKPiA+ID4gPiAtfQo+ID4gPgo+ID4gPiBXaHkgbm90
IGxlYXZlIHRoaXMgZnVuY3Rpb24gKHBlcmhhcHMgd2l0aCBkaWZmZXJlbnQgbmFtZSk/Cj4gPgo+
ID4gV2h5IHdvdWxkIHdlIGRvIHRoYXQgaWYgdGhlIGVudGlyZSBwcm9iZSgpIGZ1bmN0aW9uIGlz
IG5vdyBsZXNzIHRoYW4KPiA+IDUwIGxpbmVzIGxvbmc/IEFsc286IGl0IGdldHMgaW5saW5lZCBi
eSB0aGUgY29tcGlsZXIgYW55d2F5LiBJdAo+ID4gZG9lc24ndCBtYWtlIHNlbnNlIElNTy4KPgo+
IEknbSBub3QgYWdhaW5zdCB0aGlzLCBwZXJoYXBzLCBkcm9wcGluZyBhbmQgbW92aW5nIGNhbiBi
ZSBzcGxpdCB0byB0d28gY2hhbmdlcy4KPgoKVGhpcyByZWFsbHkgaXMgdW5uZWNlc3NhcnkgLSB3
ZSBjYW4gZG8gaXQgaW4gYSBzaW5nbGUgcGF0Y2ggYWxyaWdodC4KCkJhcnQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
