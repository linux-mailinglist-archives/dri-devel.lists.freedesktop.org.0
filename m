Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAAC815ED
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 11:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D746E3A4;
	Mon,  5 Aug 2019 09:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3325F6E3A4
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 09:53:18 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id b17so57432290lff.7
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 02:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yhFhmYD1XCmoTjeTnvzGsODetc1XqqaQE8oBpm4W4vQ=;
 b=BWb3Ag7/3M0L2vOMI61XQJSGeog2Ltk9U7IjtZ6LC60AwEfvxtaQF0hj5H0ABXyijf
 b6B6M/Z7G45LDy+NNGfvXBfg1n6HwsGhq9ZrjSTUojDSvfjHwevZIH0XOCn+Eib+zP3Q
 nwqol2vCwhg8Ma0x44Q4IFZqV/FPPmXynYA4KuYzNlPWja8xQoYeecDHDzPPf6Q1k9nu
 glPfLLx/8190rXuqZfQMA1utlbxtjUVmhPF6/NXoXlcwSl4+WUjfE35I2QS2F/GFs/ku
 6vLlVhJZc7os2pcAGAuHg5eBdtvVqL1yKFyvEEll7UQQ92S3sxdqyN4jmhybpHEMiKFJ
 nXZg==
X-Gm-Message-State: APjAAAXRK7hbGASk7rOseUO0t7gshY/IP9jYLpZQ9rhJoZl4RMBPCDns
 TL9l9ZAay9KQTu0Dqo/lGw1/2jJe6hVaKu+IhMunfw==
X-Google-Smtp-Source: APXvYqznj+OyBQxOK0qX1ZGixNtwr50nmLElXsC7qnFS3oH2+cAja/iMhd5ozIzmb9vouUkDfKjemRMc1Gv/14GZ9L0=
X-Received: by 2002:ac2:4c07:: with SMTP id t7mr1288145lfq.152.1564998796491; 
 Mon, 05 Aug 2019 02:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190722150302.29526-1-brgl@bgdev.pl>
 <20190722150302.29526-2-brgl@bgdev.pl>
In-Reply-To: <20190722150302.29526-2-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2019 11:53:04 +0200
Message-ID: <CACRpkdYexsXR=n+t1iVb1QMZc9U1FeKdyHy3w4VnfPy4B=xeiA@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] sh: ecovec24: add additional properties to the
 backlight device
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=yhFhmYD1XCmoTjeTnvzGsODetc1XqqaQE8oBpm4W4vQ=;
 b=K0B7/O1SMz4RHGXSXodAVa9L8sFoa6UoXKns2dJR1JyKOU2c6furolEA7Q5allCkl0
 hz3utRt5xZzsleYc5j96GSG5SHJEN9qRmcnlBwZ5Hbwn+fft/iuWyPYdhkJXD/m3jjk7
 jrqz4dcI6wnABAMB/2cejuK/mx5zUZuzGuS867Iji3hw8OpOMM0EX1haB0kh4NotBmOv
 TnrXt+nPzDsghutAkYvsNt/760Kmcu8ed+WXy1lumUgqOtf+HKx+P7IjgQ1X5X3F7qkT
 B41DImoEkIRtZUYYGgcCoKd1jS/rYluUTw2JPsGDWnr8wMsUgYyBHWgFNW3+ViFzuyiM
 iwUg==
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgNTowMyBQTSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmds
QGJnZGV2LnBsPiB3cm90ZToKCj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3
c2tpQGJheWxpYnJlLmNvbT4KPgo+IEFkZCBhIEdQSU8gbG9va3VwIGVudHJ5IGFuZCBhIGRldmlj
ZSBwcm9wZXJ0eSBmb3IgR1BJTyBiYWNrbGlnaHQgdG8gdGhlCj4gYm9hcmQgZmlsZS4gVGllIHRo
ZW0gdG8gdGhlIHBsYXRmb3JtIGRldmljZSB3aGljaCBpcyBub3cgcmVnaXN0ZXJlZCB1c2luZwo+
IHBsYXRmb3JtX2RldmljZV9yZWdpc3Rlcl9mdWxsKCkgYmVjYXVzZSBvZiB0aGUgcHJvcGVydGll
cy4gVGhlc2UgY2hhbmdlcwo+IGFyZSBpbmFjdGl2ZSBub3cgYnV0IHdpbGwgYmUgdXNlZCBvbmNl
IHRoZSBncGlvIGJhY2tsaWdodCBkcml2ZXIgaXMKPiBtb2RpZmllZC4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+CgpDbGV2
ZXIhIEkgbXVzdCBhbHNvIHVzZSB0aGVzZSBkeW5hbWljIHByb3BlcnRpZXMgbm93LgoKUmV2aWV3
ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApM
aW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
