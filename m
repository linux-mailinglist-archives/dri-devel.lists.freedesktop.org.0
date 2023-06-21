Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B815738249
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 13:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D84510E05A;
	Wed, 21 Jun 2023 11:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28ACB10E05A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 11:22:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5AD94614E7;
 Wed, 21 Jun 2023 11:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E0AC433C8;
 Wed, 21 Jun 2023 11:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687346534;
 bh=TPtp/wBNq5coEnbHykNNDWOE6xUuBP/0q5gXk4+rsY4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nxTqnwdbXoT8DkVcRS4i4H0Ibozx37ElkVB/qSX6mTww6Ue9LAASeRLoHCJPWiE4F
 DNxBd13MEuaW4As7pvYV7xGqhVm5JL8+JpupyEkZ2VLP50wJn9e/yr+OWzaFEY//gh
 bhpskCHYr7NJd4fFHF0j80PDyCXcHsyYYiNCeo1qMyPBtmTiRJ1lnGuwli29CqAoIN
 yB1w7SKKGwV/zFjoMYjh2uY6uMY4CxrMes+ZVWb+gS8MhpXNjrmNIr+IE7855MRNpl
 o7j7deh9IrqJPaRQJX+WKE4zPsWhRtk5KxTyNKXDY1HITMpavOqouExopRIJdq0sL9
 UThAhgcivvEtw==
Date: Wed, 21 Jun 2023 16:52:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Subject: Re: [PATCH v6 4/8] phy: Add HDMI configuration options
Message-ID: <ZJLdYlhnLVgK8J8r@matsya>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
 <cec469206a166c4b070fd7d7bbf89a8df656ccc6.1686729444.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cec469206a166c4b070fd7d7bbf89a8df656ccc6.1686729444.git.Sandor.yu@nxp.com>
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
Cc: dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org,
 oliver.brown@nxp.com, krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se,
 shawnguo@kernel.org, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
 robert.foss@linaro.org, andrzej.hajda@intel.com, linux-phy@lists.infradead.org,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15-06-23, 09:38, Sandor Yu wrote:
> Allow HDMI PHYs to be configured through the generic
> functions through a custom structure added to the generic union.
> 
> The parameters added here are based on HDMI PHY
> implementation practices.  The current set of parameters
> should cover the potential users.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>  include/linux/phy/phy-hdmi.h | 38 ++++++++++++++++++++++++++++++++++++
>  include/linux/phy/phy.h      |  7 ++++++-
>  2 files changed, 44 insertions(+), 1 deletion(-)
>  create mode 100644 include/linux/phy/phy-hdmi.h
> 
> diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
> new file mode 100644
> index 000000000000..5765aa5bc175
> --- /dev/null
> +++ b/include/linux/phy/phy-hdmi.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2022 NXP
> + */
> +
> +#ifndef __PHY_HDMI_H_
> +#define __PHY_HDMI_H_
> +
> +/**
> + * Pixel Encoding as HDMI Specification
> + * RGB, YUV422, YUV444:HDMI Specification 1.4a Section 6.5
> + * YUV420: HDMI Specification 2.a Section 7.1
> + */
> +enum hdmi_phy_colorspace {
> +	HDMI_PHY_COLORSPACE_RGB,        /* RGB 4:4:4 */
> +	HDMI_PHY_COLORSPACE_YUV422,     /* YCbCr 4:2:2 */
> +	HDMI_PHY_COLORSPACE_YUV444,     /* YCbCr 4:4:4 */
> +	HDMI_PHY_COLORSPACE_YUV420,     /* YCbCr 4:2:0 */

Better add this comments and above one as expected by kernel-doc for
enum..

> +	HDMI_PHY_COLORSPACE_RESERVED4,
> +	HDMI_PHY_COLORSPACE_RESERVED5,
> +	HDMI_PHY_COLORSPACE_RESERVED6,
> +};
> +
> +/**
> + * struct phy_configure_opts_hdmi - HDMI configuration set
> + * @pixel_clk_rate:	Pixel clock of video modes in KHz.
> + * @bpc: Maximum bits per color channel.
> + * @color_space: Colorspace in enum hdmi_phy_colorspace.
> + *
> + * This structure is used to represent the configuration state of a HDMI phy.
> + */
> +struct phy_configure_opts_hdmi {
> +	unsigned int pixel_clk_rate;
> +	unsigned int bpc;
> +	enum hdmi_phy_colorspace color_space;
> +};
> +
> +#endif /* __PHY_HDMI_H_ */
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index 3a570bc59fc7..93d77d45b1d4 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -17,6 +17,7 @@
>  #include <linux/regulator/consumer.h>
>  
>  #include <linux/phy/phy-dp.h>
> +#include <linux/phy/phy-hdmi.h>
>  #include <linux/phy/phy-lvds.h>
>  #include <linux/phy/phy-mipi-dphy.h>
>  
> @@ -42,7 +43,8 @@ enum phy_mode {
>  	PHY_MODE_MIPI_DPHY,
>  	PHY_MODE_SATA,
>  	PHY_MODE_LVDS,
> -	PHY_MODE_DP
> +	PHY_MODE_DP,
> +	PHY_MODE_HDMI,
>  };
>  
>  enum phy_media {
> @@ -60,11 +62,14 @@ enum phy_media {
>   *		the DisplayPort protocol.
>   * @lvds:	Configuration set applicable for phys supporting
>   *		the LVDS phy mode.
> + * @hdmi:	Configuration set applicable for phys supporting
> + *		the HDMI phy mode.
>   */
>  union phy_configure_opts {
>  	struct phy_configure_opts_mipi_dphy	mipi_dphy;
>  	struct phy_configure_opts_dp		dp;
>  	struct phy_configure_opts_lvds		lvds;
> +	struct phy_configure_opts_hdmi		hdmi;
>  };
>  
>  /**
> -- 
> 2.34.1

-- 
~Vinod
