Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 248CE623CCB
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 08:39:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C0B10E0B6;
	Thu, 10 Nov 2022 07:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EAC10E0B6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 07:38:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3353461DAF;
 Thu, 10 Nov 2022 07:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5653C433D6;
 Thu, 10 Nov 2022 07:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668065934;
 bh=6Hb2huiH9obJz8hEtiwK2CxoxvD5BS2sJQTW/SKbV94=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fNROmp4QzpH/0wd7m2KVyaEQkF1PH1v9rBx/33WDmatJhUyBU72xBYfXXGn3Q+lbb
 PuzzAUOqpzUu83xcd8+xdXrsjlOXINvMaisx+X8VjON/B7A5UqNNm2cSuOft/1oQwI
 CWMUQdH0gfeOTSwjANuZ7QfAmapqZ6MwiUNW9X6SFJTmurHlxOZDXyUBJ9QBnZ9IXs
 1tXI7rgxHo+eynssNYel1i2UQduMABsE/TtLtnYp8oJecVnJw86NbPoAJx+GIEjalV
 XOydKfjQqyjAszjwoPAo4r1noj5hc0taTYOIi1FhRz2vyMXlhhCf4itl4yzuFTlhpZ
 pHMyC1byEwuuQ==
Date: Thu, 10 Nov 2022 13:08:50 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Subject: Re: [PATCH v3 04/10] phy: Add HDMI configuration options
Message-ID: <Y2yqiuk13Jjbokum@matsya>
References: <cover.1667911321.git.Sandor.yu@nxp.com>
 <3edf9db8261e7f59dcd84a61a492d2483b1e9970.1667911321.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3edf9db8261e7f59dcd84a61a492d2483b1e9970.1667911321.git.Sandor.yu@nxp.com>
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
Cc: andrzej.hajda@intel.com, penguin-kernel@i-love.sakura.ne.jp,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 sam@ravnborg.org, javierm@redhat.com, jernej.skrabec@gmail.com,
 linux-imx@nxp.com, devicetree@vger.kernel.org, kernel@pengutronix.de,
 jonas@kwiboo.se, jani.nikula@intel.com, s.hauer@pengutronix.de,
 robh+dt@kernel.org, maxime@cerno.tech, linux-arm-kernel@lists.infradead.org,
 oliver.brown@nxp.com, neil.armstrong@linaro.org, linux-kernel@vger.kernel.org,
 robert.foss@linaro.org, tzimmermann@suse.de, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08-11-22, 21:00, Sandor Yu wrote:
> Allow HDMI PHYs to be configured through the generic
> functions through a custom structure added to the generic union.
> 
> The parameters added here are based on HDMI PHY
> implementation practices.  The current set of parameters
> should cover the potential users.

Is there any dpendency b/w phy and hdmi, I dont see anything in cover..

Pls consider splitting the phy series ..

> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>  include/linux/phy/phy-hdmi.h | 33 +++++++++++++++++++++++++++++++++
>  include/linux/phy/phy.h      |  7 ++++++-
>  2 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 include/linux/phy/phy-hdmi.h
> 
> diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
> new file mode 100644
> index 000000000000..73a32eb535b0
> --- /dev/null
> +++ b/include/linux/phy/phy-hdmi.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2022 NXP
> + */
> +
> +#ifndef __PHY_HDMI_H_
> +#define __PHY_HDMI_H_
> +
> +enum hdmi_phy_colorspace {
> +	HDMI_PHY_COLORSPACE_RGB,
> +	HDMI_PHY_COLORSPACE_YUV422,
> +	HDMI_PHY_COLORSPACE_YUV444,
> +	HDMI_PHY_COLORSPACE_YUV420,
> +	HDMI_PHY_COLORSPACE_RESERVED4,
> +	HDMI_PHY_COLORSPACE_RESERVED5,
> +	HDMI_PHY_COLORSPACE_RESERVED6,
> +};

kernel-doc style comments here too please

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
> index b1413757fcc3..6f6873ea7270 100644
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
