Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CA2CC52D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 23:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A876EA99;
	Fri,  4 Oct 2019 21:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07C46EA99
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 21:47:59 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y23so7901395lje.9
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2019 14:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=96jk8p/6XP5ut+JBHE0IBsdTmxOUR/fsv3ZcRWDzMOg=;
 b=rbxs2HJehHHiorneqn1e/12pwvA5zRmf5tK3G8E7g4FA7xGV5H2jTinqmGpOcwl6lm
 j7B8As7Gt4d+E/R9YBLBvSrTzFIqf4e2qlCuSCnbE0HCAc8+rA5HK6kPSEp3hQ1TtrU+
 2KmNHT/+yjHoDaWF/GqkDTTvJ85hBnCK3135Cu4ejppeti4iGXisR1Ac/73nUFcoPBX2
 BwrbODqJHkZe5wf1RsTdQtfHMLaQXpgI9EmjlcQhTbhbc+sGpZbnXta23J5wLvvicKp8
 a74HisrfWV5bgUKlz2HzqNBMKttOjV2aWSq7EOvRV5g6UmiQ/FKxgyMpxcHHtmau85gD
 jKQw==
X-Gm-Message-State: APjAAAUnGvFKP/Na7DE+2uB0Vs8vB+5rQsOOYY0VyzjwdDIKNrH0oJLi
 ZyIyXA4qQxSZ9/WAdGVKWKusIJlukm6vtBiSVVmGJg==
X-Google-Smtp-Source: APXvYqxdZOCfwMC4ckXG//o/o4H8hELcsXHe3EoTOHIYVBOebIobkD8VaGs1KQIIBFvGy9ppesFAq6cvMyUvfIsKzS0=
X-Received: by 2002:a2e:6344:: with SMTP id x65mr10670505ljb.59.1570225678386; 
 Fri, 04 Oct 2019 14:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20191001125837.4472-1-brgl@bgdev.pl>
 <20191001125837.4472-2-brgl@bgdev.pl>
In-Reply-To: <20191001125837.4472-2-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Oct 2019 23:47:47 +0200
Message-ID: <CACRpkdbnkMvcSOoLGWi9nSfcpcNT0T28kFX=gyk6jSZ4UWG3gQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] backlight: gpio: remove unneeded include
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=96jk8p/6XP5ut+JBHE0IBsdTmxOUR/fsv3ZcRWDzMOg=;
 b=hboFmV/U4IcPI89MtzDp+OzE5KwsWErja8LOnkuuLwv0fksWiRpqJQZRis7rFIeVPP
 Ooj27rcXns2Y4feoVEtg49n8CryY2RaGyouBUeaqk2ra5EWaVF1b9SJCzpbS0ccPcx6o
 OKGdwKxr435NLGf2rhVWgjPumSWR2SHoXx0hKGzQWcUyTo9N2UXJEk48l4i2HhDZs/lk
 /w5UDGdeyD3/r3JdKqYvjgprnF2+BDf/24afsGx6mveKIokPtaSJGfI7WbyMW88ICvUl
 cpiuvmH0N+uNxhDXRpNNofDROfjzaePmP13ERqR66MmREXUZCh8g2+gPv00qpvzL0Kk7
 +7fA==
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
 Jingoo Han <jingoohan1@gmail.com>, Linux-sh list <linux-sh@vger.kernel.org>,
 Jacopo Mondi <jacopo@jmondi.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMSwgMjAxOSBhdCAyOjU5IFBNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xA
YmdkZXYucGw+IHdyb3RlOgoKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdz
a2lAYmF5bGlicmUuY29tPgo+Cj4gV2Ugbm8gbG9uZ2VyIHVzZSBhbnkgc3ltYm9scyBmcm9tIG9m
X2dwaW8uaC4gUmVtb3ZlIHRoaXMgaW5jbHVkZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3og
R29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+CgpSZXZpZXdlZC1ieTogTGlu
dXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKVGhhbmtzIEJhcnRvc3osCkxp
bnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
