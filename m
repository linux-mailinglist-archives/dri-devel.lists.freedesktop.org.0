Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC856FB9A7
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 23:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1EB110E2FA;
	Mon,  8 May 2023 21:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA62C10E2FA
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 21:28:24 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-55a5e0f5b1aso48019357b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 14:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683581304; x=1686173304;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wX39yT2wbPEXqhXbtvNDzhgN+Xs4H/C0OIhg+3hztTI=;
 b=m/CYRgdq2dBkpFW4z/bT+o2LoBRNAVnnUYugDPgWvmTxdepuXvA4jJOimRupVQcFL2
 G8gZlt2+PPHd5gJJjR2xAZ1SYTEELx+AM5ZM2UzpEIUnP/nwGu/qSnqQ6Qe82+gd55py
 OywnDgCGIqUZE6yc3BDUpDPvFSo/ZNIFDFN65pc2dI1kVo0NVuMZp42uEwA60ncQUbN/
 Jy/w3whm5r+6gbxqk4h52P/jiNFwngAT5MpT1rqU/WQ8ErLHogo06zxPZr3PBoDp+BRP
 AqZZxJhHoAFvqvWV3X+FqqPYj+98CpsyNOOasrjll8yOi5IAC9vdzMgvchUT0Y8NqDlF
 R6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683581304; x=1686173304;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wX39yT2wbPEXqhXbtvNDzhgN+Xs4H/C0OIhg+3hztTI=;
 b=LEiKXdAiRy2GpKV9XMiaKXIrYTgsVkcbkaX7/9PIkIE3DNRkR4KMPQUIsxgQ1Os81e
 GGd3ph1Qqkf+E3jpeDF4H/05R4p8YBdK5oPwGk4d+ogH5dgdku/rMo+74D2nisk8zFJ+
 4QuKH6TJ13PcXK3Ja97GEdU/32F2K/5dGy3gBdLTSW+uqicCxst+To7dczxdDD11Va9h
 vcJnP/vulwMYRbztU4zi77bOj0pKxwlFbWiQZ23zFhn51MOxsU1O7cLU++UGnnMmwuev
 d4+SRTiHMrP9amATjoJZjCF8tua/xwV48Jsud1LaICTaNu75gnpA4k+QRpi+eoRBO2AJ
 3Epw==
X-Gm-Message-State: AC+VfDySThclLqfkjwABwaBodz6vs14J2lw4YB1fg4adcQ4qFJvH4+bH
 6NEazryC3OUaBvxG1ehryveQ+9Mg9vhPU8MSmfv/YQ==
X-Google-Smtp-Source: ACHHUZ66w4x3Oj+W//CdKVXHR1RfBdoq9r0l7en1E+lsaBczgPEck7bAPv7q2ndrw1oeCZN0a1tiKTRdU1k/NFqyLGU=
X-Received: by 2002:a81:84d0:0:b0:55a:1f2:ef6 with SMTP id
 u199-20020a8184d0000000b0055a01f20ef6mr12314719ywf.9.1683581303797; 
 Mon, 08 May 2023 14:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230430-nokia770-regression-v3-0-a6d0a89ffa8b@linaro.org>
 <20230430-nokia770-regression-v3-3-a6d0a89ffa8b@linaro.org>
 <ZFkSiM9GRfN5n7n4@surfacebook>
In-Reply-To: <ZFkSiM9GRfN5n7n4@surfacebook>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 May 2023 23:28:12 +0200
Message-ID: <CACRpkdbk0b8e7M4DNjAnF3c466suLHeiRp9L3zDnbCUB=J8=FA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] ARM: omap1: Fix up the Nokia 770 board device IRQs
To: andy.shevchenko@gmail.com
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Tony Lindgren <tony@atomide.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Helge Deller <deller@gmx.de>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Andreas Kemnade <andreas@kemnade.info>, linux-input@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-spi@vger.kernel.org,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 8, 2023 at 5:17=E2=80=AFPM <andy.shevchenko@gmail.com> wrote:

> > +             GPIO_LOOKUP("gpio-32-47", 8, "tahvo_irq",
> > +                         GPIO_ACTIVE_HIGH),
>
> Missing terminator.

Darn I missed this comment in v4, I have fixed it in my tree, I will see if
there are more comments for v4 before I resend.

Yours,
Linus Walleij
