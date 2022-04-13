Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 273C04FEF69
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 08:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BA71121F1;
	Wed, 13 Apr 2022 06:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9728C1121F1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 06:11:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B0351B8210C;
 Wed, 13 Apr 2022 06:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95EEC385A6;
 Wed, 13 Apr 2022 06:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649830306;
 bh=LgHIzY7EW2JlZQiFNPaNQv1hWKib1EqgqFQRnlXmey4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RezEm1vbs11Llplocc8D3OaWU+c1yhnGJOfEbnETpVea3VNvjoPljMe2/N0dDkM4o
 yf1AV+O11eVhbWzrMnAx7OTuTtbIgd1AJvTCSsPPCaV1t0PDpOYRQLQpWWufQG3Jcp
 9bBGNGPi0453X/iWefV2qMhdPIAPTELOAK3BSN7jHmVwHhprxQJeYVW1dWcr9Q5XER
 7+Ts+h8kGcOjwvyDUpxua5NpusWUbThWEDlT1dm2UVUwF/GVj0EzXY4d8cTb9TqOV2
 vO0MnGSXnq6nkIs+mO93KtakTf1TX8uQUkIaYdaHfYDmitTBcktJb/ax2c1l6Demiv
 i9UayJ92OaoAg==
Date: Wed, 13 Apr 2022 11:41:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v6 resend 2/5] phy: Add LVDS configuration options
Message-ID: <YlZpnrKt9NbHZv26@matsya>
References: <20220402052451.2517469-1-victor.liu@nxp.com>
 <20220402052451.2517469-3-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220402052451.2517469-3-victor.liu@nxp.com>
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, agx@sigxcpu.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, linux-phy@lists.infradead.org,
 martin.kepplinger@puri.sm, jernej.skrabec@gmail.com, kishon@ti.com,
 linux-imx@nxp.com, robert.chiras@nxp.com, devicetree@vger.kernel.org,
 kernel@pengutronix.de, jonas@kwiboo.se, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02-04-22, 13:24, Liu Ying wrote:
> This patch allows LVDS PHYs to be configured through
> the generic functions and through a custom structure
> added to the generic union.
> 
> The parameters added here are based on common LVDS PHY
> implementation practices.  The set of parameters
> should cover all potential users.
> 
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v5->v6:
> * Rebase upon v5.17-rc1.
> 
> v4->v5:
> * Align kernel-doc style to include/linux/phy/phy.h. (Vinod)
> * Trivial tweaks.
> * Drop Robert's R-b tag.
> 
> v3->v4:
> * Add Robert's R-b tag.
> 
> v2->v3:
> * No change.
> 
> v1->v2:
> * No change.
> 
>  include/linux/phy/phy-lvds.h | 32 ++++++++++++++++++++++++++++++++
>  include/linux/phy/phy.h      |  4 ++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 include/linux/phy/phy-lvds.h
> 
> diff --git a/include/linux/phy/phy-lvds.h b/include/linux/phy/phy-lvds.h
> new file mode 100644
> index 000000000000..7a2f4747f624
> --- /dev/null
> +++ b/include/linux/phy/phy-lvds.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2020 NXP

2022 now

> + */
> +
> +#ifndef __PHY_LVDS_H_
> +#define __PHY_LVDS_H_
> +
> +/**
> + * struct phy_configure_opts_lvds - LVDS configuration set
> + * @bits_per_lane_and_dclk_cycle:	Number of bits per data lane and
> + *					differential clock cycle.

What does it mean by bits per data lane and differential clock cycle?

> + * @differential_clk_rate:		Clock rate, in Hertz, of the LVDS
> + *					differential clock.
> + * @lanes:				Number of active, consecutive,
> + *					data lanes, starting from lane 0,
> + *					used for the transmissions.
> + * @is_slave:				Boolean, true if the phy is a slave
> + *					which works together with a master
> + *					phy to support dual link transmission,
> + *					otherwise a regular phy or a master phy.
> + *
> + * This structure is used to represent the configuration state of a LVDS phy.
> + */
> +struct phy_configure_opts_lvds {
> +	unsigned int	bits_per_lane_and_dclk_cycle;
> +	unsigned long	differential_clk_rate;
> +	unsigned int	lanes;
> +	bool		is_slave;
> +};

Where is the user of this new configuration? Can you post that patch for
reference as well please

-- 
~Vinod
