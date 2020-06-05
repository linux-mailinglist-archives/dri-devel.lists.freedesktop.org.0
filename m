Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2F31EFF77
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 19:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A956E46C;
	Fri,  5 Jun 2020 17:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D861F6E46C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 17:57:10 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id a25so12820701ljp.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jun 2020 10:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YYnGgbB/yUYHLwRnIgeOB2yfvVDg5PB29KwRpcC2gN4=;
 b=HWlIvo8Gx/GfSgNGX7LbvmwrB8R2/UprUCF6ZpGdTm5eFaUvsIhs/YyhRxIi6C0Bgu
 eKvjCs9vk7Z007hp+pg8+29RTakK0BG4LfZ6KfTBUENIJULV/m/bqBnWIrwsUs1JUM8/
 1/NGt2NwWfaMLuXqDXVe3Io4BwZBxhMbAeR1RevZ7FRe6WgNb1P0/6bzp39+eac5SSI0
 IJ2t/onuc/NeLjFksiSRP+9/3pOoJpsXpFqF1xvY2lFz/Ngtj3zgOT8AEn6f/pRSyZwx
 xSg9J8jx/18GSu+o8jK2uEzV4XTjjcqiZW53KhDmRBA/9Xatc7A9DzNlyF1ysAUOFHM0
 xEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YYnGgbB/yUYHLwRnIgeOB2yfvVDg5PB29KwRpcC2gN4=;
 b=WsO1QqJAS1ollPA9p69Ufm2Ltkvr1rg8B5Lh0TpC99+pz7FXYeO/Hcy1cBd2qQ9zOC
 KdtAUucPnD8kWhK778WVJuU2rD9IyeErBJ0jIoPr0ORWtducFRtEBcSdroBpdJR3jpBX
 2r4qwR9W03cYIX4Y0xAX76rEEZjx3rfFT4f2HCAF7TLkXLWOPw1yWyu6JYoeSqs+35Px
 3drWPSHScEIDFFljv/QKj4DwthNfTcU6s/DFNnPXjhyBp3H/f7XWbrbL/TlAFCSWuju8
 dX5NCsMlReduYYuSach+OuRmvnGYjc6J+5Jb0esNue+QOWC4hZ3cNcxkh1EixdusoHB1
 KSzA==
X-Gm-Message-State: AOAM530DvuXX7zrrBDj2Xev9Eki3FH9rCCj7q45t8wvxjR+J61vuS/h5
 QlAU7wpZFZyx1f5WTNWpetXWhCl9ajaNunbC4lnCyg==
X-Google-Smtp-Source: ABdhPJz1QchXGicuq/e4UbyBXjj2+Lh2IaK3OLii9lagU/34toEvTJek1PSUAitdFBhMHfD0XxPR6jfp824v8PIIWqE=
X-Received: by 2002:a2e:8705:: with SMTP id m5mr5176522lji.269.1591379829143; 
 Fri, 05 Jun 2020 10:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <6615a61b8af240e3d10f8890e4b2462ccdaac9b9.1590594512.git-series.maxime@cerno.tech>
In-Reply-To: <6615a61b8af240e3d10f8890e4b2462ccdaac9b9.1590594512.git-series.maxime@cerno.tech>
From: Eric Anholt <eric@anholt.net>
Date: Fri, 5 Jun 2020 10:56:58 -0700
Message-ID: <CADaigPUOJMwR0y6CjVpu5+nPAvejbCvEQNLEC+EKq9haBaQynw@mail.gmail.com>
Subject: Re: [PATCH v3 004/105] clk: bcm: Add BCM2711 DVP driver
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-clk@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 8:49 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The HDMI block has a block that controls clocks and reset signals to the
> HDMI0 and HDMI1 controllers.
>
> Let's expose that through a clock driver implementing a clock and reset
> provider.
>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/bcm/Kconfig           |  11 +++-
>  drivers/clk/bcm/Makefile          |   1 +-
>  drivers/clk/bcm/clk-bcm2711-dvp.c | 127 +++++++++++++++++++++++++++++++-
>  3 files changed, 139 insertions(+)
>  create mode 100644 drivers/clk/bcm/clk-bcm2711-dvp.c
>
> diff --git a/drivers/clk/bcm/Kconfig b/drivers/clk/bcm/Kconfig
> index 8c83977a7dc4..784f12c72365 100644
> --- a/drivers/clk/bcm/Kconfig
> +++ b/drivers/clk/bcm/Kconfig
> @@ -1,4 +1,15 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +
> +config CLK_BCM2711_DVP
> +       tristate "Broadcom BCM2711 DVP support"
> +       depends on ARCH_BCM2835 ||COMPILE_TEST
> +       depends on COMMON_CLK
> +       default ARCH_BCM2835
> +       select RESET_SIMPLE
> +       help
> +         Enable common clock framework support for the Broadcom BCM2711
> +         DVP Controller.
> +
>  config CLK_BCM2835
>         bool "Broadcom BCM2835 clock support"
>         depends on ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST
> diff --git a/drivers/clk/bcm/Makefile b/drivers/clk/bcm/Makefile
> index 0070ddf6cdd2..2c1349062147 100644
> --- a/drivers/clk/bcm/Makefile
> +++ b/drivers/clk/bcm/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_CLK_BCM_KONA)      += clk-kona-setup.o
>  obj-$(CONFIG_CLK_BCM_KONA)     += clk-bcm281xx.o
>  obj-$(CONFIG_CLK_BCM_KONA)     += clk-bcm21664.o
>  obj-$(CONFIG_COMMON_CLK_IPROC) += clk-iproc-armpll.o clk-iproc-pll.o clk-iproc-asiu.o
> +obj-$(CONFIG_CLK_BCM2835)      += clk-bcm2711-dvp.o
>  obj-$(CONFIG_CLK_BCM2835)      += clk-bcm2835.o
>  obj-$(CONFIG_CLK_BCM2835)      += clk-bcm2835-aux.o
>  obj-$(CONFIG_CLK_RASPBERRYPI)  += clk-raspberrypi.o

I do think that single driver is the right model here, but I noticed
that you're not using your new CONFIG_ symbol.  With that fixed, r-b
from me.

(though I'd also recommend devm_platform_get_and_ioremap_resource and
devm_reset_controller_register())
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
