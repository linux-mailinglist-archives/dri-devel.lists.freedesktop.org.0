Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D14DA1ABAC4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 10:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0CF6EB21;
	Thu, 16 Apr 2020 08:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C126EB21
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 08:04:27 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id z26so6725362ljz.11
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 01:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sHJ12tcYNsSfgttEUfr+8K97RYYeru+HfS3132z1u6U=;
 b=X0/ss7BsABjV0v58eUDRQHcZuoc6jZGR8QlxXHm4iMm2jIobcqWr46sIwdS9XtZxjv
 J6lyowndGnsjJ2T09ZLAXy4vuLLuNuWfByvI3ZL89WC2FPNAxvWKs0UVVQzT5Ee2llor
 wzSBTCJVOBt2+9Ohb9KBSlvOhscZ+OiUHUnMWxgzt6ZDO9PVTPdpvuxMydg2t99gu6wZ
 oj37Ec/BUycHap9z0+LYieFHR2fzSSCOI+l9sq7xxfebteYGbDW3WPgbMFAteqOk2bKf
 K6q0mR7VNoF30yy9UA6z33ozE8ZHcOBMgzyIRBgLhkAceDqUT6mHxhpEYBOQpImmHhPe
 fohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sHJ12tcYNsSfgttEUfr+8K97RYYeru+HfS3132z1u6U=;
 b=DJYGeU8zQvEUb4pTpdvNxcFxHmsfqXkqzfF54sg1HMNGork1O0Z3QRqlwMJnVvI+2T
 mtgC4sbP+MZqndBO4wsdhdJswDXI7McA9tdYv97VqonPdxtK0KYQfuWvsYtkJY3MElTB
 /MwJ2J/o4Ykp7cbLm5GgKx5vnAp639QV1dAhZCpqb9Ul4Dn/QdhONbnMJTq6Oj87SdZv
 fiow3IqY/OTSaNBeDizderBWsK/X10+4QKpPbJyDXLevJ9IkjM3VhdHf3+rmTDl3NHvB
 IMDKv5y5X7IeT/pzJtKy4KmJNSYDLFUum+G6oaU0xjlyEDYcselPUp8kjfKcp0bt3OfU
 zg7g==
X-Gm-Message-State: AGi0PuYqaXL2f1mPpCGy6jDNufOXr+JR93QrFSZKrMIFUga/ilI/sD4Q
 8Ex12NzL4U0w8a+Gcvy5N0yko1BGcPH8L6rLKTJvWQ==
X-Google-Smtp-Source: APiQypJa0ViiE/ZtKOxobDklTprFmqZh7Nrc1Zappo4GrzOsZZrJysLNIrOKRtQLmBogZMZaiR9WSbvdJtt5f/9aPuw=
X-Received: by 2002:a2e:9ad9:: with SMTP id p25mr5793355ljj.39.1587024265660; 
 Thu, 16 Apr 2020 01:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200416005549.9683-1-robh@kernel.org>
 <20200416005549.9683-2-robh@kernel.org>
In-Reply-To: <20200416005549.9683-2-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Apr 2020 10:04:14 +0200
Message-ID: <CACRpkdYDrytCL3ZX9YeW39t2mb4M8KbCfCFm0Ba67oPpshckLw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: Remove cases of 'allOf' containing a
 '$ref'
To: Rob Herring <robh@kernel.org>
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
 Sam Ravnborg <sam@ravnborg.org>, linux-pwm@vger.kernel.org,
 linux-iio <linux-iio@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>,
 linux-remoteproc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-i2c <linux-i2c@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
 linux-riscv@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, linux-rtc@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Linux Input <linux-input@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, linux-can@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
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

On Thu, Apr 16, 2020 at 2:55 AM Rob Herring <robh@kernel.org> wrote:

> json-schema versions draft7 and earlier have a weird behavior in that
> any keywords combined with a '$ref' are ignored (silently). The correct
> form was to put a '$ref' under an 'allOf'. This behavior is now changed
> in the 2019-09 json-schema spec and '$ref' can be mixed with other
> keywords. The json-schema library doesn't yet support this, but the
> tooling now does a fixup for this and either way works.
>
> This has been a constant source of review comments, so let's change this
> treewide so everyone copies the simpler syntax.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for fixing this!
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
