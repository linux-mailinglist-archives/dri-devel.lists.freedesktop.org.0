Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5989F9367
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 14:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C55410E04A;
	Fri, 20 Dec 2024 13:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cGtBT/5K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DF510E04A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 13:40:57 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-54025432becso2049577e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 05:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734702056; x=1735306856;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wb7iNHmEf3kwk8PZ83J0Vflb2+dZOrkblrsPmP2Xs6k=;
 b=cGtBT/5KOqpghsoXmzbP+zi61F1zIwZAGAS1QGoo1JWEJnrPb74zntwSKskbe8RZHC
 fWZgdOzMQF0Mf95lPvMDggY8WBFwh/qVChvAhVVjfp76nYbc1lIouMOixOpI3ZxeQqE1
 zOtKpfPGXi/4ZuiPVXZdGYL9hTlTAir1Ryp6aW5qS5/jGxPzlzA2+eikWdEPli6AqFYh
 xgx/4OtickPntCvS1vy7SMy7zCuFhTXq6TL1SqnRG/I0iZpPSy1MH9udYXxh7fFvC8i8
 AD72xh8jj7nucpixr9gIc1d7bHkR2e+RKNwoGMIgxVhscjMXRT92TNUbnbLa+JQ59rok
 W+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734702056; x=1735306856;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wb7iNHmEf3kwk8PZ83J0Vflb2+dZOrkblrsPmP2Xs6k=;
 b=vlEWvb2Y4nbpiTqQXmIoXR8PhpBrBY8/YP2LFbq6FqobFzmOhvoJRPZM2hdtyxs5Km
 gNxMRYdPpA5M2Koyn2C8xpw1zi5cc+l4qFQXll2N4uqCeZuwweZPd73HysTMGCrHR0MV
 tQxbfNV0Oi6mSuc6svmIoWfoIDbt0fIfTAr4iqBdXlBFzYlq7frH1cv6Rq9wRAQz/LWU
 PSTeTr/gH4eHMh/NI/wQ6eHSTd2WugsKK4s1aDGDfUlolilB5DSXSWVbQP6DEBuTjibh
 Yga4AeGgHp9N2SUe4jIM9CipZAy9eb/n55pg+KryJ42gZ5SyJFxUokerucgTutfAImGW
 0LjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjQXTBBMnANzWtwOKziMTVhwJN+cIIcQAV5xdXa4y4EMaZXzh3turgLUxxqenM4XSG3x++96AOAY4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy75KI7oBrhQYYpvWWNf5pAgJitaLbvzzEaHG2XR2NPdRO9QSTi
 JArDzGv9KCdpSoIIVq4bsLpcDKH5XgHvVGKIohjrIVkq8EpPFmjjh06wKF8aH0h+txPLUyAAtWJ
 oeOz6B6JwgbOa/7O95EE6w2RXsjHFGUBvupdX6g==
X-Gm-Gg: ASbGncuia7428jwIEdGld1j7GWJmevDkdcglZ3Dpvmra3MV7vTaRi4jN3zw8cNS7mrh
 iJrbtVLbV7OPUHFXfg8s8/TlDVTSJAXsYCh9nUe8Awi4KBJYxfN1Rf+9+tALYbn8+RD/x/g==
X-Google-Smtp-Source: AGHT+IEMcr6UeakjvG9LcaBj7crEG/f7t7TlT4cYf0tYtIrj73ltbIs/soNZTMABMCsyh5ylcV4ql8R8oH3XQgmpM/I=
X-Received: by 2002:a05:6512:398d:b0:540:1a40:ab0f with SMTP id
 2adb3069b0e04-5422954b160mr821931e87.27.1734702055700; Fri, 20 Dec 2024
 05:40:55 -0800 (PST)
MIME-Version: 1.0
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
 <20241212-dt-bcm2712-fixes-v3-3-44a7f3390331@raspberrypi.com>
 <CACRpkdaB9kqcjmhaXd5RxpYvqdSVMZkj0wHAtEgdqDs03+wzJg@mail.gmail.com>
 <CAPY8ntBJqukSJs7VUXvUFAsiKqNWknL8VjgtQG_VAEmw576EPQ@mail.gmail.com>
In-Reply-To: <CAPY8ntBJqukSJs7VUXvUFAsiKqNWknL8VjgtQG_VAEmw576EPQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 20 Dec 2024 14:40:44 +0100
Message-ID: <CAMRc=McmtEuc06YdEOXho8hkW30hYEYOtbOR3+mttmg4yrzrxg@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: gpio: brcmstb: permit gpio-line-names
 property
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Eric Anholt <eric@anholt.net>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Stefan Wahren <wahrenst@gmx.net>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Florian Fainelli <f.fainelli@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 20, 2024 at 2:02=E2=80=AFPM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Linus
>
> On Fri, 20 Dec 2024 at 12:50, Linus Walleij <linus.walleij@linaro.org> wr=
ote:
> >
> > On Thu, Dec 12, 2024 at 7:36=E2=80=AFPM Dave Stevenson
> > <dave.stevenson@raspberrypi.com> wrote:
> >
> > > gpio-line-names is a generic property that can be supported by any
> > > GPIO controller, so permit it through the binding.
> > >
> > > It is permitted to have a variable number of GPIOs per node based
> > > on brcm,gpio-bank-widths, so define an arbitrary maximum number of
> > > items based on current users.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Thank you.
>
> > Perhaps Bartosz can just apply this one patch separately?
>
> I believe he already has, but commented against the cover letter
> rather than this patch -
> https://lore.kernel.org/linux-arm-kernel/173434013318.38429.8084137212485=
42013.b4-ty@linaro.org/
>

Ah, this is how b4 works. Even if you apply a single patch, it
responds to the cover letter (or the first patch in the series if
there's no cover letter).

Bart
