Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4A79EAABC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 09:32:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B1710E81F;
	Tue, 10 Dec 2024 08:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lkIaCSTG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C8010E81F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 08:32:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AD5B2A40C04;
 Tue, 10 Dec 2024 08:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B399C4CED6;
 Tue, 10 Dec 2024 08:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733819538;
 bh=vMDpWY8p1Mqt7CgYt7jryIgWQ2wJWWPZrL2HtUX3z2E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lkIaCSTGYzo4zU95T5u+1DqU8HhBs53wnUxKl5n9cSwEPeuxdcjlvJI1sCYKGBXJd
 v61HLwDBs1fbBsowu9sMe8o1QTXCHX8cm1N8GvJE4gsLEewzBH43uil/aziCkVXaxz
 3yl/M2l9dJvVhZG8tOPBbWc9om0xtmE2LtGFvn3oceS0YtqMDRRxPetRAGoHs/gAKQ
 5IvAEZBzFoJqNY+f8vGN+cl/UrMxXO8cALywzuBjfINN39BkvZnv7Xz/J4BF8/M4ek
 7fle9PAGaBe4lvN9xmXJFKWQjmCf1masNH/wOMGDlAnVeCuVw54Bj1wajCyGCvIXUS
 6nXp4psFP6BbQ==
Date: Tue, 10 Dec 2024 09:32:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Helge Deller <deller@gmx.de>, 
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
Message-ID: <w5niokvjfwajnzz3muccb45jsvqzg7lql7g5tg5s6iat3mtqkk@qu2a5zcp3rs7>
References: <20241209075908.140014-1-towinchenmi@gmail.com>
 <20241209075908.140014-3-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241209075908.140014-3-towinchenmi@gmail.com>
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

On Mon, Dec 09, 2024 at 03:58:34PM +0800, Nick Chan wrote:
> Add driver for backlight controllers attached via Apple DWI 2-wire
> interface, which is found on some Apple iPhones, iPads and iPod touches
> with a LCD display.
> 

Nothing improved here.

> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  drivers/video/backlight/Kconfig  |  12 +++
>  drivers/video/backlight/Makefile |   1 +
>  drivers/video/backlight/dwi_bl.c | 126 +++++++++++++++++++++++++++++++
>  3 files changed, 139 insertions(+)
>  create mode 100644 drivers/video/backlight/dwi_bl.c
> 
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 3614a5d29c71..e64cc3d51ac5 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -166,6 +166,18 @@ config BACKLIGHT_EP93XX
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called ep93xx_bl.
>  
> +config BACKLIGHT_APPLE_DWI
> +	tristate "Apple DWI 2-Wire Interface Backlight Driver"
> +	depends on ARCH_APPLE || COMPILE_TEST
> +	default y
> +	help
> +          Say Y to enable the backlight driver for backlight controllers
> +          attached via the Apple DWI 2-wire interface which is found in some
> +          Apple iPhones, iPads and iPod touches.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called dwi_bl.
> +
>  config BACKLIGHT_IPAQ_MICRO
>  	tristate "iPAQ microcontroller backlight driver"
>  	depends on MFD_IPAQ_MICRO
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> index 8fc98f760a8a..0a569d7f0210 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
>  obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
>  obj-$(CONFIG_BACKLIGHT_DA903X)		+= da903x_bl.o
>  obj-$(CONFIG_BACKLIGHT_DA9052)		+= da9052_bl.o
> +obj-$(CONFIG_BACKLIGHT_APPLE_DWI)	+= dwi_bl.o

Nothing improved here.

Best regards,
Krzysztof

