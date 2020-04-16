Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF751AC42B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 15:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514406E0FA;
	Thu, 16 Apr 2020 13:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492DE6E0FC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 13:55:34 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D91322203
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 13:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587045334;
 bh=lAG6zzq1Sqen9mJhj5pG0jXwK1qfgmptfKCYtqRavfc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OJtBap6gxkn7B64p6YI3gTyfG+37GXhLma2wex7puLnTvEPVIckcw2EWyHIlGxpbU
 axCPq/uLuHBCHTtrTyk9e9F01ZRfk1h5UwSfOVyg7KnEYG4Mh0g9CUMFFZUUhlg6Dn
 cKIhtKmwFJOdPx1PSLWhEzhafdvl/OQ5lWzBbqUw=
Received: by mail-qv1-f52.google.com with SMTP id y19so1821857qvv.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 06:55:34 -0700 (PDT)
X-Gm-Message-State: AGi0PuZyJRxcYabZnvd0y+KAvw2RsH4l5VBxvXKK0J6CkPt4e+KNcryx
 ZtoaUOowMFeJRnqmlDgL1a0060+Aov3CDB8IsQ==
X-Google-Smtp-Source: APiQypJP5/uECHnZPqCD8aDFNOvB3C1OTKaRvvNdGUWUD6LvJ9HnhAL59x+YqONzfmAtrwzd6yqnrOF4qnSJIJfw8nM=
X-Received: by 2002:a05:6214:a8a:: with SMTP id
 ev10mr9484527qvb.20.1587045333124; 
 Thu, 16 Apr 2020 06:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200416005549.9683-1-robh@kernel.org>
 <20200416005549.9683-2-robh@kernel.org>
 <d93f90bbcc99967ed5ba458ba99d7e73de12e3b2.camel@perches.com>
In-Reply-To: <d93f90bbcc99967ed5ba458ba99d7e73de12e3b2.camel@perches.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 16 Apr 2020 08:55:21 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLcJrFow_+-o2CxoPRCv4U-ELb2FHSbUgG=Mzt8PFn_CA@mail.gmail.com>
Message-ID: <CAL_JsqLcJrFow_+-o2CxoPRCv4U-ELb2FHSbUgG=Mzt8PFn_CA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: Remove cases of 'allOf' containing a
 '$ref'
To: Joe Perches <joe@perches.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 PCI <linux-pci@vger.kernel.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Lee Jones <lee.jones@linaro.org>, linux-clk <linux-clk@vger.kernel.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Linux Input <linux-input@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, linux-can@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux HWMON List <linux-hwmon@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Amit Kucheria <amit.kucheria@linaro.org>,
 linux-spi <linux-spi@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 netdev <netdev@vger.kernel.org>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 16, 2020 at 1:52 AM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2020-04-15 at 19:55 -0500, Rob Herring wrote:
> > json-schema versions draft7 and earlier have a weird behavior in that
> > any keywords combined with a '$ref' are ignored (silently). The correct
> > form was to put a '$ref' under an 'allOf'. This behavior is now changed
> > in the 2019-09 json-schema spec and '$ref' can be mixed with other
> > keywords. The json-schema library doesn't yet support this, but the
> > tooling now does a fixup for this and either way works.
> >
> > This has been a constant source of review comments, so let's change this
> > treewide so everyone copies the simpler syntax.
>
> This is a large change.
>
> Was this done manually or by some script?

Scripted with python ruamel yaml, but then I had to filter out all the
re-formatting (hence the first patch to cut down some of that).

> If it was done manually, how likely is it there are defects
> in the conversion?

Either way, the schemas still have to pass the meta-schema checks.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
