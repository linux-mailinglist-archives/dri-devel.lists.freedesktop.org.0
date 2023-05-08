Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 515286FB98A
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 23:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A9B10E2FB;
	Mon,  8 May 2023 21:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181E310E2F7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 21:25:00 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-64395e2a715so4964846b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 14:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683581099; x=1686173099;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lY7XNuYMi6d2HpAXFIV2eIcbCwEXTGxuVFXmla1j3I0=;
 b=ldNC1OSRN/AiwY6BBBbtAdCSbMbXQnIYQR4qsbC4raWEeRgeENnMRyFj20zl6m6WFL
 Q6KoS616XvezA0CqW46e0Uf91lNFkKzVnmwaje2Xx+hnQi7x1fesRbLXVe1/62T280Tc
 sDNRIrVPzNkaQzyFwh5aikHQSV0+4+e9iFMDlURjhfyMlfSwz/jRaW+gCMpLu54FNZjV
 QpPe5Oz9noUeKtmAnQwynUBQsUf4AEcllT/v+uN9OpbX9vg2d7fOVF5bcnsfmrHi3UoK
 ZGjOQ027L7W1gSJP3C8+Zy+hTcT84BnPbB2sF6y4GidtBDmcoDg2kCx/mZOzINb0v3ot
 fQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683581099; x=1686173099;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lY7XNuYMi6d2HpAXFIV2eIcbCwEXTGxuVFXmla1j3I0=;
 b=bx5iUippinxwB0tM6vscfa0PCkRYDTc+F7CbwIDjmymqlKBrYLdoA4I/pNJuphQr/a
 CzTE6UGigkuMzXBY8vIiliVt/upphdspKKiaYHScQJx0GHbvR196RlOKOF/PKQn8SXnP
 dwnD8C4CAjgaYsTw7GRmfpYJEbAMOJDy3fyv//FXO23DWx5I7vSZWnJsUCsVWVjcgz/t
 9SwQNPusDTcymjsZbC3ACa/E6Zq3zH9CKBa6dte65h24v6ZE4TmihcblHL2SaTwQMbdE
 052dgU76HG2bjIQSmUPg1oCEPv7sqWT+f3NBQqsnKyapolcxm7T5osBwfqZE72PHwa0S
 1NuQ==
X-Gm-Message-State: AC+VfDzE2LPBSOSKp5yC3PvHAwrAaetyMKuFbjQaacyyvkpMPiI0hDRr
 2ynaMIcqpAIH+gnyCoEvwGo=
X-Google-Smtp-Source: ACHHUZ7+bYJ7TcN4WYYGelZV6DAfXOpZUn5DOVtNMVxidcDjp5pAkqw6xFDgud9wDkc0Wljg420qMg==
X-Received: by 2002:a05:6a00:ad0:b0:63b:8a91:e641 with SMTP id
 c16-20020a056a000ad000b0063b8a91e641mr14966335pfl.11.1683581099188; 
 Mon, 08 May 2023 14:24:59 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4d1:db5a:dbba:cd34])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a62ab08000000b0064394c2a1d0sm354851pff.209.2023.05.08.14.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 14:24:58 -0700 (PDT)
Date: Mon, 8 May 2023 14:24:54 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/4] Input: ads7846 - Convert to use software nodes
Message-ID: <ZFloppofNNcrQtgv@google.com>
References: <20230430-nokia770-regression-v4-0-9b6dc5536b17@linaro.org>
 <20230430-nokia770-regression-v4-1-9b6dc5536b17@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430-nokia770-regression-v4-1-9b6dc5536b17@linaro.org>
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
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-spi@vger.kernel.org, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 08, 2023 at 11:20:06PM +0200, Linus Walleij wrote:
> The Nokia 770 is using GPIOs from the global numberspace on the
> CBUS node to pass down to the LCD controller. This regresses when we
> let the OMAP GPIO driver use dynamic GPIO base.
> 
> The Nokia 770 now has dynamic allocation of IRQ numbers, so this
> needs to be fixed for it to work.
> 
> As this is the only user of LCD MIPID we can easily augment the
> driver to use a GPIO descriptor instead and resolve the issue.
> 
> The platform data .shutdown() callback wasn't even used in the
> code, but we encode a shutdown asserting RESET in the remove()
> callback for completeness sake.
> 
> The CBUS also has the ADS7846 touchscreen attached.
> 
> Populate the devices on the Nokia 770 CBUS I2C using software
> nodes instead of platform data quirks. This includes the LCD
> and the ADS7846 touchscreen so the conversion just brings the LCD
> along with it as software nodes is an all-or-nothing design
> pattern.
> 
> The ADS7846 has some limited support for using GPIO descriptors,
> let's convert it over completely to using device properties and then
> fix all remaining boardfile users to provide all platform data using
> software nodes.
> 
> Dump the of includes and of_match_ptr() in the ADS7846 driver as part
> of the job.
> 
> Since we have to move ADS7846 over to obtaining the GPIOs it is
> using exclusively from descriptors, we provide descriptor tables
> for the two remaining in-kernel boardfiles using ADS7846:
> 
> - PXA Spitz
> - MIPS Alchemy DB1000 development board
> 
> It was too hard for me to include software node conversion of
> these two remaining users at this time: the spitz is using a
> hscync callback in the platform data that would require further
> GPIO descriptor conversion of the Spitz, and moving the hsync
> callback down into the driver: it will just become too big of
> a job, but it can be done separately.
> 
> The MIPS Alchemy DB1000 is simply something I cannot test, so take
> the easier approach of just providing some GPIO descriptors in
> this case as I don't want the patch to grow too intrusive.
> 
> As we see that several device trees have incorrect polarity flags
> and just expect to bypass the gpiolib polarity handling, fix up
> all device trees too, in a separate patch.
> 
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Fixes: 92bf78b33b0b ("gpio: omap: use dynamic allocation of base")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v3->v4:
> - Fix all board file polarity flags to be active low, because
>   this pendown signal is active low.
> - Fix all erroneous device trees too.
> - Drop some unnecessary commas.
> ChangeLog v2->v3:
> - Drop leftover OF ifdefs no longer needed and causing compile
>   errors.
> ---
>  arch/arm/mach-omap1/board-nokia770.c    |  98 +++++++++++++++++----------
>  arch/arm/mach-pxa/spitz.c               |  11 +++-
>  arch/mips/alchemy/devboards/db1000.c    |  11 +++-
>  drivers/input/touchscreen/ads7846.c     | 113 ++++++++++++--------------------

For input:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

In general:

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
