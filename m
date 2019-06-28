Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E16995983D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 12:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877896E8C0;
	Fri, 28 Jun 2019 10:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D996E8C0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:15:23 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r9so5430974ljg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 03:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kuj/HA5ST1YfjCjqjIBhZNTXDUSb6xW7P1aCaiPqrgA=;
 b=JPQT4eydrG+jCUAps/i/QIVxiZIqvNSyAZsAYoW6QW3RxH2/K7l5AWMilidzQlzj3E
 s45/vbyRHYlwBA7RzON5rVZmn8M+ST1fZrRQO8goLCVfytb4Yxc1NuSAPqJIQ2I3a1oh
 juvKFhJt3sKdVpAypC5BDOlW/2tSWtK1qoOe1PHwtfk57g9jwa8/Krmp4Nfw+dNgnDcI
 Nispo5PIVPif+F/PIpDvp2BjxNkaW3awTZ+7W8392VRejw+DSVO9wX+oFCkOHzXz4KkF
 cK6mLuVFqpILFIlS/pkcYVvdy96A7xYG8I2Y/4tVMSBidWIyIuaLeloat0u2WJSSvbJA
 9YHA==
X-Gm-Message-State: APjAAAWL37oEfrCqOAN3eGRV06NZpNzU5iY/XyxK9bBi5RY03oGy0X0S
 D/CvTp5WvFytu+xWy9nXy1dVSnrrL/6s4MytXZn/PA==
X-Google-Smtp-Source: APXvYqwYZ2VwFJZSHzxzSaLF/aTvHeHNBwJGW3yg8YND+7cFBk+h9mUEiXw+n8bOv+ARb6mtvZlpXB0Ri+mSjhURIAs=
X-Received: by 2002:a2e:8756:: with SMTP id q22mr5837692ljj.108.1561716922174; 
 Fri, 28 Jun 2019 03:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190628100253.8385-1-brgl@bgdev.pl>
In-Reply-To: <20190628100253.8385-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Jun 2019 11:15:10 +0100
Message-ID: <CACRpkdZqsgXoZcHv9z+7oVrf=i9WPSHG=93qhfA=0SkR0Mdfxg@mail.gmail.com>
Subject: Re: [PATCH RFT 0/4] backlight: gpio: simplify the driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Kuj/HA5ST1YfjCjqjIBhZNTXDUSb6xW7P1aCaiPqrgA=;
 b=r6dSQpzyJ15l8/BZOerGnIC0wmlXFFxfmCNPswk98awd0aKKD/xz4DYIkFnrcpARwc
 9sdvqCgd+viVCqOoqV5DsJAzOBUhUf/9nizOab/W05hGnZ+aRPgxYSIvNp/etvsf0Bd5
 7F4BrgRgXu1c9aYrUgEPX1eF/7LB/YoDreIZpGZnd2Ti3SaiRfgp05yGFCfRpyUWgepa
 oLODrZ7ssyKN4rbX8g59LuC3JvntLy+gjzULgxNHEHNn3QTm6v/wkO5hDsKGyWISADOz
 7bVhqeEKt5MJ2n98pVYGCrxjEj6/99R06YIrx9A8E2D83Zm2PoCJRlDWEY6NInkGexOX
 pB2g==
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTE6MDMgQU0gQmFydG9zeiBHb2xhc3pld3NraSA8YnJn
bEBiZ2Rldi5wbD4gd3JvdGU6Cgo+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pl
d3NraUBiYXlsaWJyZS5jb20+Cj4KPiBXaGlsZSB3b3JraW5nIG9uIG15IG90aGVyIHNlcmllcyBy
ZWxhdGVkIHRvIGdwaW8tYmFja2xpZ2h0WzFdIEkgbm90aWNlZAo+IHRoYXQgd2UgY291bGQgc2lt
cGxpZnkgdGhlIGRyaXZlciBpZiB3ZSBtYWRlIHRoZSBvbmx5IHVzZXIgb2YgcGxhdGZvcm0KPiBk
YXRhIHVzZSBHUElPIGxvb2t1cHMgYW5kIGRldmljZSBwcm9wZXJ0aWVzLiBUaGlzIHNlcmllcyB0
cmllcyB0byBkbwo+IHRoYXQuCj4KPiBUaGUgZmlyc3QgcGF0Y2ggc2V0cyB1cCBhbGwgdGhlIHJl
cXVpcmVkIHN0cnVjdHVyZXMgaW4gdGhlIGJvYXJkIGZpbGUsCj4gdGhlIHNlY29uZCBtb2RpZmll
cyB0aGUgYmFja2xpZ2h0IGRyaXZlciwgdGhlIHRoaXJkIGFuZCBmb3VydGggcmVtb3ZlCj4gdGhl
IGxlZnRvdmVycy4KPgo+IFRoaXMgc2VyaWVzIGRlcGVuZHMgb24gdGhlIHRocmVlIGZpcnN0IHBh
dGNoZXMgZnJvbSBbMV0uCj4KPiBJIGRvbid0IGhhdmUgYWNjZXNzIHRvIHRoaXMgSFcgYnV0IGhv
cGVmdWxseSB0aGlzIHdvcmtzLiBPbmx5IGNvbXBpbGUKPiB0ZXN0ZWQuCgpUaGlzIHNlcmllczoK
UmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCkV4
Y2VsbGVudCB3b3JrIQoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
