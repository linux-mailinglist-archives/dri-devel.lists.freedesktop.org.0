Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B783848C6D
	for <lists+dri-devel@lfdr.de>; Sun,  4 Feb 2024 10:23:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B3310F837;
	Sun,  4 Feb 2024 09:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eWQvSFGP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092C710F837
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Feb 2024 09:23:14 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dc6de8a699dso2887211276.3
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Feb 2024 01:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707038593; x=1707643393; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/jpuYG+EdQLizy4QqBGZn07wougvdBXcN1e2Mr1rzhc=;
 b=eWQvSFGPAV1i29HOjjRhJFBkoHQZaGmhbBL6xrParA9h30S4swxq5H+aZTqrmQLFWD
 3HtgS0wrNMpI+efFitQ9B6pV6VVbbjbQSrJhmu4ksijd/Sgv/AJwZFslu0ddLPyM8Os4
 Fv/qVK+F7Bkye6c1tLkTFs0ino5DtH6gcvbHn9M/dW4Z3K3pfAmiXdDgcOfAXrigv09K
 a9RYuHjqd0aXNNIqWMbA7HOwS/+2mo+8eeAcVTyfNw6h+3Xz6Zl5LoXtvK1/zyRWF3sL
 jlbI+YsjQDxt3kiWwoKb+dx8pi4XzGdPUXC9U21uOohk402z5nCth6ZQfUz3BiT0b879
 zL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707038593; x=1707643393;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/jpuYG+EdQLizy4QqBGZn07wougvdBXcN1e2Mr1rzhc=;
 b=U3Son1f3BcOedHfZpQebCBe/CjNLNLcv5sxPDpw9AcN4O5k0Vu5iZoqmWftHUQOctR
 tHlisqR5UshuKS2KPkTNaZvDTU0c+ibyEe3N/fqE+8orDI+yYnnBvT8PHuAw9dTzperW
 yILpZKaXNEr1J80Ohtzck1rJy/KOirRskNtJfFV6brMbkzqioXrIy/H9xpcepz4sYqFL
 bByp14CvxJTxzp1ziHUcpw0QjLMxjyqkOsxKP/72cX8ZIbOHtCUNsA9fphhoPXZYWrX+
 +yUrHJGrE9f4qzc+9OPS5VCfzI1MjeqHsR97ASFlL0GfUxWgahsZRXBpVsP9VRBBFCAv
 GTPw==
X-Gm-Message-State: AOJu0Yy8h3K3Y6D7JFq4FnHtMV5n6SLNn1oP2JAl64KX50h7EE4/seXJ
 VB4hFfhQYR5f08IOktVrIRV20RBiQWUPuKIh+LCFIfdH2Sr+83CYydpxtcSvD4DpQQT4AnLIm+C
 taU+Ul1Y0COJk4ja2Ry7q7lzGufrv9J8cWJzRoA==
X-Google-Smtp-Source: AGHT+IH+6aIPxyRh3mvo8zj6LoCTEA2WezKPM1eVxvYBfHARq8vhSf+rEtZZT+MgFJeC0Ki4LzPESO32enuMKM5VVA0=
X-Received: by 2002:a25:210:0:b0:dc2:48af:bf0c with SMTP id
 16-20020a250210000000b00dc248afbf0cmr10544490ybc.63.1707038593547; Sun, 04
 Feb 2024 01:23:13 -0800 (PST)
MIME-Version: 1.0
References: <20240203165307.7806-1-aford173@gmail.com>
 <20240203165307.7806-3-aford173@gmail.com>
In-Reply-To: <20240203165307.7806-3-aford173@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 4 Feb 2024 10:23:02 +0100
Message-ID: <CAA8EJpo4omXogg48urEMzxQ+CA7DNTSf66pA6hoO8wpmtn_-MQ@mail.gmail.com>
Subject: Re: [PATCH V8 02/12] phy: freescale: add Samsung HDMI PHY
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, marex@denx.de, 
 alexander.stein@ew.tq-group.com, frieder.schrempf@kontron.de, 
 Lucas Stach <l.stach@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Liu Ying <victor.liu@nxp.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 3 Feb 2024 at 17:53, Adam Ford <aford173@gmail.com> wrote:
>
> From: Lucas Stach <l.stach@pengutronix.de>
>
> This adds the driver for the Samsung HDMI PHY found on the
> i.MX8MP SoC.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> V4:  Make lookup table hex values lower case.
>
> V3:  Re-order the Makefile to keep it alphabetical
>      Remove unused defines
>
> V2:  Fixed some whitespace found from checkpatch
>      Change error handling when enabling apbclk to use dev_err_probe
>      Rebase on Linux-Next
>
>      I (Adam) tried to help move this along, so I took Lucas' patch and
>      attempted to apply fixes based on feedback.  I don't have
>      all the history, so apologies for that.
> ---
>  drivers/phy/freescale/Kconfig                |    6 +
>  drivers/phy/freescale/Makefile               |    1 +
>  drivers/phy/freescale/phy-fsl-samsung-hdmi.c | 1075 ++++++++++++++++++
>  3 files changed, 1082 insertions(+)
>  create mode 100644 drivers/phy/freescale/phy-fsl-samsung-hdmi.c
>
> diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
> index 853958fb2c06..5c2b73042dfc 100644
> --- a/drivers/phy/freescale/Kconfig
> +++ b/drivers/phy/freescale/Kconfig
> @@ -35,6 +35,12 @@ config PHY_FSL_IMX8M_PCIE
>           Enable this to add support for the PCIE PHY as found on
>           i.MX8M family of SOCs.
>
> +config PHY_FSL_SAMSUNG_HDMI_PHY
> +       tristate "Samsung HDMI PHY support"
> +       depends on OF && HAS_IOMEM
> +       help
> +         Enable this to add support for the Samsung HDMI PHY in i.MX8MP.
> +
>  endif
>
>  config PHY_FSL_LYNX_28G
> diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Makefile
> index cedb328bc4d2..79e5f16d3ce8 100644
> --- a/drivers/phy/freescale/Makefile
> +++ b/drivers/phy/freescale/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_PHY_MIXEL_LVDS_PHY)        += phy-fsl-imx8qm-lvds-phy.o
>  obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)      += phy-fsl-imx8-mipi-dphy.o
>  obj-$(CONFIG_PHY_FSL_IMX8M_PCIE)       += phy-fsl-imx8m-pcie.o
>  obj-$(CONFIG_PHY_FSL_LYNX_28G)         += phy-fsl-lynx-28g.o
> +obj-$(CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY)  += phy-fsl-samsung-hdmi.o
> diff --git a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
> new file mode 100644
> index 000000000000..bf0e2299d00f
> --- /dev/null
> +++ b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
> @@ -0,0 +1,1075 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2020 NXP
> + * Copyright 2022 Pengutronix, Lucas Stach <kernel@pengutronix.de>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#define PHY_REG_33             0x84
> +#define  REG33_MODE_SET_DONE   BIT(7)
> +#define  REG33_FIX_DA          BIT(1)
> +
> +#define PHY_REG_34             0x88
> +#define  REG34_PHY_READY       BIT(7)
> +#define  REG34_PLL_LOCK                BIT(6)
> +#define  REG34_PHY_CLK_READY   BIT(5)
> +
> +
> +#define PHY_PLL_REGS_NUM 48
> +
> +struct phy_config {
> +       u32     clk_rate;
> +       u8 regs[PHY_PLL_REGS_NUM];
> +};
> +
> +const struct phy_config phy_pll_cfg[] = {
> +       {       22250000, {
> +                       0x00, 0xd1, 0x4b, 0xf1, 0x89, 0x88, 0x80, 0x40,
> +                       0x4f, 0x30, 0x33, 0x65, 0x00, 0x15, 0x25, 0x80,
> +                       0x6c, 0xf2, 0x67, 0x00, 0x10, 0x8f, 0x30, 0x32,
> +                       0x60, 0x8f, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,
> +                       0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +                       0x00, 0xe0, 0x83, 0x0f, 0x3e, 0xf8, 0x00, 0x00,
> +               },
> +       }, {
> +               23750000, {
> +                       0x00, 0xd1, 0x50, 0xf1, 0x86, 0x85, 0x80, 0x40,
> +                       0x4f, 0x30, 0x33, 0x65, 0x00, 0x03, 0x25, 0x80,
> +                       0x6c, 0xf2, 0x67, 0x00, 0x10, 0x8f, 0x30, 0x32,
> +                       0x60, 0x8f, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,
> +                       0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +                       0x00, 0xe0, 0x83, 0x0f, 0x3e, 0xf8, 0x00, 0x00,
> +               },

Generally I see that these entries contain a high level of duplication.
Could you please extract the common part and a rate-dependent part.
Next, it would be best if instead of writing the register values via
the rate LUT, the driver could calculate those values.
This allows us to support other HDMI modes if the need arises at some point.

> +       }, {
> +               24000000, {
> +                       0x00, 0xd1, 0x50, 0xf0, 0x00, 0x00, 0x80, 0x00,
> +                       0x4f, 0x30, 0x33, 0x65, 0x00, 0x01, 0x25, 0x80,
> +                       0x6c, 0xf2, 0x67, 0x00, 0x10, 0x8f, 0x30, 0x32,
> +                       0x60, 0x8f, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,
> +                       0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +                       0x00, 0xe0, 0x83, 0x0f, 0x3e, 0xf8, 0x00, 0x00,
> +               },


-- 
With best wishes
Dmitry
