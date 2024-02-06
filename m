Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DC084BC0D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 18:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9B7112D10;
	Tue,  6 Feb 2024 17:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="L2xZfaVh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BA4112C73
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 17:35:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22DE240008;
 Tue,  6 Feb 2024 17:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1707240923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xaoA+WDat1FJlr5cBeBddcywk0i1Oklt1CF1ajVk3kM=;
 b=L2xZfaVhIHa26kVoZAs1UG/T1TeVIT5oX04AE6DGkHNL1za2UbistMzqLYaIIxVNm0CJ/n
 emHEOFg1uXnVr6famrQDH1v0K3ggxD28JjNSWSwb96rVRvNd3M/WKOzcE1UchoBl+Zb5sE
 wIl9l5fkr2RdOLgPs4+9HCWrlkQydC4pv+vUvTT5YGxGAMUnRfu6bOZLrdsu2MZ7o70fzQ
 KLphmSosUipkmfglqar4JYTOAT476ic+DoKCc5Cw7plSJd63GKv66gtOQO8krLixVGpnt5
 u/QbJA/otO9hh+ODyrC5glCdsSgqkn1VJPWpqX/RjLEDqYH+nN5sLRMa/kFx7Q==
Date: Tue, 6 Feb 2024 18:35:17 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, marex@denx.de,
 alexander.stein@ew.tq-group.com, frieder.schrempf@kontron.de, Lucas Stach
 <l.stach@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Liu Ying
 <victor.liu@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH V8 02/12] phy: freescale: add Samsung HDMI PHY
Message-ID: <20240206183517.2b9dfb07@booty>
In-Reply-To: <20240203165307.7806-3-aford173@gmail.com>
References: <20240203165307.7806-1-aford173@gmail.com>
 <20240203165307.7806-3-aford173@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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

On Sat,  3 Feb 2024 10:52:42 -0600
Adam Ford <aford173@gmail.com> wrote:

> From: Lucas Stach <l.stach@pengutronix.de>
> 
> This adds the driver for the Samsung HDMI PHY found on the
> i.MX8MP SoC.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

[...]

> +#define PHY_REG_33		0x84
> +#define  REG33_MODE_SET_DONE	BIT(7)
> +#define  REG33_FIX_DA		BIT(1)
> +
> +#define PHY_REG_34		0x88
> +#define  REG34_PHY_READY	BIT(7)
> +#define  REG34_PLL_LOCK		BIT(6)
> +#define  REG34_PHY_CLK_READY	BIT(5)
> +
> +

Nitpick: only one empty line here.

> +#define PHY_PLL_REGS_NUM 48

[...]

> +static int phy_clk_register(struct fsl_samsung_hdmi_phy *phy)
> +{
> +	struct device *dev = phy->dev;
> +	struct device_node *np = dev->of_node;
> +	struct clk_init_data init;
> +	const char *parent_name;
> +	struct clk *phyclk;
> +	int ret;
> +
> +	parent_name = __clk_get_name(phy->refclk);
> +
> +	init.parent_names = &parent_name;
> +	init.num_parents = 1;
> +	init.flags = 0;
> +	init.name = "hdmi_pclk";
> +	init.ops = &phy_clk_ops;
> +
> +	phy->hw.init = &init;
> +
> +	phyclk = devm_clk_register(dev, &phy->hw);
> +	if (IS_ERR(phyclk))
> +		return dev_err_probe(dev, PTR_ERR(phyclk),
> +				     "failed to register clock\n");
> +
> +	ret = of_clk_add_provider(np, of_clk_src_simple_get, phyclk);

Ouch:

> This function is *deprecated*. Use of_clk_add_hw_provider() instead.

Appears as an easy replacement though.

Otherwise looks good.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
