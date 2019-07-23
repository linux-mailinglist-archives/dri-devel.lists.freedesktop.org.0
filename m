Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 106F571284
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592878986D;
	Tue, 23 Jul 2019 07:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6DE89E0D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 06:28:12 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id h6so79414665iom.7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 23:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0GXgbin1wM5tD9QHab0bjxqBxoyIQnKJbxMwrdj3eAo=;
 b=BJZf63YsTBxi80IKxhD+E341zEA9I4cc6y1XELaBtmrnNxNl/AQMBrfRUJE7puvtqZ
 lplLrUMB/nJFv+LEqINvp2au7NLZg/W8yrUqq2/N5F4V72kjJTWxYTtGIL+Ow2nPyeF1
 Hvx3D2cunfRwqmV/a9mdAWCmxgRoWF6zIc9JSweV9nSqCv6z/vUd8TQqPlc+O2INLGg9
 IlVlXrzKfpoOqgHEopsjw5zNec57lGTx0/HcvOhcH4OI8QGvm/eTOB/9Xf3TDXVGveRw
 7+irAqlb1MYYw1uegoYsO6xz5b7gU1S7qtX/Rsw9B3Qu2Zi0ShcvGbLyn+Lt1KJeVezf
 Ekkg==
X-Gm-Message-State: APjAAAXYNecaCb87nzdT8yZxb5Z3mcTs1qcdZNNTNm8uGgt7KysfxoOZ
 QtIU9kDmlfr0i5lJH2fo4vn/fTFedgTX5S1Ncdk=
X-Google-Smtp-Source: APXvYqz6WM6llZIcZ4uWt1BEXw5VYzdaK/anRXzoGyvRQ8j3uF6YDTFTrHInVfg3NOC4vy7BIyJLo2b2xJVTaI/v58A=
X-Received: by 2002:a5d:9c46:: with SMTP id 6mr9784584iof.6.1563863291632;
 Mon, 22 Jul 2019 23:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190722150302.29526-1-brgl@bgdev.pl>
 <20190722150302.29526-3-brgl@bgdev.pl>
 <20190722160603.GY9224@smile.fi.intel.com>
In-Reply-To: <20190722160603.GY9224@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 23 Jul 2019 08:28:00 +0200
Message-ID: <CAMRc=Mfuvh6byfPhPdB51dy_YbAS5scJQT3n3pL_5VZLCjB3Hw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] backlight: gpio: simplify the platform data
 handling
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0GXgbin1wM5tD9QHab0bjxqBxoyIQnKJbxMwrdj3eAo=;
 b=AkGT7f1yp79PR71yxcX0rmm7mn9Z79r5K4cPrbEDACL9FDwSVMGs0ASUkteU8pEZyU
 V2uPiHHOlPEy05sWQhcen9i60a5WApuQkPTvMdbhNfXCScSJlWK5Ftvpo+KwtQ+IvVMx
 EH6BFUQyBsKwbnYnkRjGakuqODnMf9YNpP9paDvwbtk5bL8j0ruMNJygjLDmdLea83BR
 +vt0S97OasXyEI0jhBs81RbiaJWlYLS70TSoZyzpaN5TF0VnDN5dCgHJtsnshqKIYXcn
 YUeR6wczHn3AYJNWm3IeS7Uv/hmywYMSI4GjP5nHCeDNmaSAaymEU2cLJUBNAEpfmavs
 lvjg==
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

cG9uLiwgMjIgbGlwIDIwMTkgbyAxODowNiBBbmR5IFNoZXZjaGVua28KPGFuZHJpeS5zaGV2Y2hl
bmtvQGxpbnV4LmludGVsLmNvbT4gbmFwaXNhxYIoYSk6Cj4KPiBPbiBNb24sIEp1bCAyMiwgMjAx
OSBhdCAwNTowMjo1N1BNICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJv
bTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KPiA+Cj4g
PiBOb3cgdGhhdCB0aGUgbGFzdCB1c2VyIG9mIHBsYXRmb3JtIGRhdGEgKHNoIGVjb3ZlYzI0KSBk
ZWZpbmVzIGEgcHJvcGVyCj4gPiBHUElPIGxvb2t1cCBhbmQgc2V0cyB0aGUgJ2RlZmF1bHQtb24n
IGRldmljZSBwcm9wZXJ0eSwgd2UgY2FuIGRyb3AgdGhlCj4gPiBwbGF0Zm9ybV9kYXRhLXNwZWNp
ZmljIEdQSU8gaGFuZGxpbmcgYW5kIHVuaWZ5IGEgYmlnIGNodW5rIG9mIGNvZGUuCj4gPgo+ID4g
VGhlIG9ubHkgZmllbGQgdXNlZCBmcm9tIHRoZSBwbGF0Zm9ybSBkYXRhIGlzIG5vdyB0aGUgZmJk
ZXYgcG9pbnRlci4KPgo+ID4gLXN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJvYmVfZHQoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsKQo+ID4gLXsKPiA+IC0gICAgIHN0cnVj
dCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4gPiAtICAgICBlbnVtIGdwaW9kX2ZsYWdzIGZs
YWdzOwo+ID4gLSAgICAgaW50IHJldDsKPiA+IC0KPiA+IC0gICAgIGdibC0+ZGVmX3ZhbHVlID0g
ZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsICJkZWZhdWx0LW9uIik7Cj4gPiAtICAgICBm
bGFncyA9IGdibC0+ZGVmX3ZhbHVlID8gR1BJT0RfT1VUX0hJR0ggOiBHUElPRF9PVVRfTE9XOwo+
ID4gLQo+ID4gLSAgICAgZ2JsLT5ncGlvZCA9IGRldm1fZ3Bpb2RfZ2V0KGRldiwgTlVMTCwgZmxh
Z3MpOwo+ID4gLSAgICAgaWYgKElTX0VSUihnYmwtPmdwaW9kKSkgewo+ID4gLSAgICAgICAgICAg
ICByZXQgPSBQVFJfRVJSKGdibC0+Z3Bpb2QpOwo+ID4gLQo+ID4gLSAgICAgICAgICAgICBpZiAo
cmV0ICE9IC1FUFJPQkVfREVGRVIpIHsKPiA+IC0gICAgICAgICAgICAgICAgICAgICBkZXZfZXJy
KGRldiwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICJFcnJvcjogVGhlIGdwaW9z
IHBhcmFtZXRlciBpcyBtaXNzaW5nIG9yIGludmFsaWQuXG4iKTsKPiA+IC0gICAgICAgICAgICAg
fQo+ID4gLSAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gLSAgICAgfQo+ID4gLQo+ID4gLSAg
ICAgcmV0dXJuIDA7Cj4gPiAtfQo+Cj4gV2h5IG5vdCBsZWF2ZSB0aGlzIGZ1bmN0aW9uIChwZXJo
YXBzIHdpdGggZGlmZmVyZW50IG5hbWUpPwo+Cj4gLS0KPiBXaXRoIEJlc3QgUmVnYXJkcywKPiBB
bmR5IFNoZXZjaGVua28KPgo+CgpXaHkgd291bGQgd2UgZG8gdGhhdCBpZiB0aGUgZW50aXJlIHBy
b2JlKCkgZnVuY3Rpb24gaXMgbm93IGxlc3MgdGhhbgo1MCBsaW5lcyBsb25nPyBBbHNvOiBpdCBn
ZXRzIGlubGluZWQgYnkgdGhlIGNvbXBpbGVyIGFueXdheS4gSXQKZG9lc24ndCBtYWtlIHNlbnNl
IElNTy4KCkJhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
