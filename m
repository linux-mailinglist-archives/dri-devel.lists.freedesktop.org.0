Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C80350554
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 19:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DCA6EB20;
	Wed, 31 Mar 2021 17:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 371 seconds by postgrey-1.36 at gabe;
 Wed, 31 Mar 2021 13:38:59 UTC
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CDD6E1EC
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 13:38:59 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12VDWbfT128296;
 Wed, 31 Mar 2021 08:32:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1617197557;
 bh=YYcWMd00SGs3crRbWxcFqADJOgyNtBSyyx4h5FCJOLU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=zESha82xuGVQgBYnpa0qk9GVYZ7gXXdsuOh/KJKx82e6XU/CIjU6lCoMF/ZNlz7TL
 sw4UyFR0i0hWIxSEOImDpLNTnk/c1N2rb2vdgxUr/MujIUlexmNjjd9COB7g0qT4+x
 Ar4nkUtW6HYrk/8Iyv+0FoJF+eGQVpYRJ6dqJ09o=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12VDWbc2119028
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 31 Mar 2021 08:32:37 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 31
 Mar 2021 08:32:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 31 Mar 2021 08:32:36 -0500
Received: from [10.250.234.114] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12VDWUVw091817;
 Wed, 31 Mar 2021 08:32:30 -0500
Subject: Re: [PATCH v5 2/5] phy: Add LVDS configuration options
To: Liu Ying <victor.liu@nxp.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>
References: <1616662832-27048-1-git-send-email-victor.liu@nxp.com>
 <1616662832-27048-3-git-send-email-victor.liu@nxp.com>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <f078a133-de32-0e08-2d87-f2dde7c240ec@ti.com>
Date: Wed, 31 Mar 2021 19:02:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1616662832-27048-3-git-send-email-victor.liu@nxp.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Wed, 31 Mar 2021 17:21:40 +0000
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
Cc: martin.kepplinger@puri.sm, jernej.skrabec@siol.net, kernel@pengutronix.de,
 jonas@kwiboo.se, airlied@linux.ie, s.hauer@pengutronix.de,
 narmstrong@baylibre.com, robert.foss@linaro.org, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 robert.chiras@nxp.com, shawnguo@kernel.org, agx@sigxcpu.org, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 25/03/21 2:30 pm, Liu Ying wrote:
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
> index 00000000..7a2f474
> --- /dev/null
> +++ b/include/linux/phy/phy-lvds.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2020 NXP
> + */
> +
> +#ifndef __PHY_LVDS_H_
> +#define __PHY_LVDS_H_
> +
> +/**
> + * struct phy_configure_opts_lvds - LVDS configuration set
> + * @bits_per_lane_and_dclk_cycle:	Number of bits per data lane and
> + *					differential clock cycle.

phy_set_bus_width() instead?
> + * @differential_clk_rate:		Clock rate, in Hertz, of the LVDS
> + *					differential clock.

Please use clk API's to get rate.
> + * @lanes:				Number of active, consecutive,
> + *					data lanes, starting from lane 0,
> + *					used for the transmissions.
> + * @is_slave:				Boolean, true if the phy is a slave
> + *					which works together with a master
> + *					phy to support dual link transmission,
> + *					otherwise a regular phy or a master phy.

For parameters that are known at design time, it doesn't have to be
passed from consumer driver. So all these parameters do they really have
to be passed at runtime?

Thanks
Kishon
> + *
> + * This structure is used to represent the configuration state of a LVDS phy.
> + */
> +struct phy_configure_opts_lvds {
> +	unsigned int	bits_per_lane_and_dclk_cycle;
> +	unsigned long	differential_clk_rate;
> +	unsigned int	lanes;
> +	bool		is_slave;
> +};
> +
> +#endif /* __PHY_LVDS_H_ */
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index e435bdb..d450b44 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -17,6 +17,7 @@
>  #include <linux/regulator/consumer.h>
>  
>  #include <linux/phy/phy-dp.h>
> +#include <linux/phy/phy-lvds.h>
>  #include <linux/phy/phy-mipi-dphy.h>
>  
>  struct phy;
> @@ -51,10 +52,13 @@ enum phy_mode {
>   *		the MIPI_DPHY phy mode.
>   * @dp:		Configuration set applicable for phys supporting
>   *		the DisplayPort protocol.
> + * @lvds:	Configuration set applicable for phys supporting
> + *		the LVDS phy mode.
>   */
>  union phy_configure_opts {
>  	struct phy_configure_opts_mipi_dphy	mipi_dphy;
>  	struct phy_configure_opts_dp		dp;
> +	struct phy_configure_opts_lvds		lvds;
>  };
>  
>  /**
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
