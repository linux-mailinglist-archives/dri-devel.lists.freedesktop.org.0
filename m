Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8F197DEC2
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 22:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F24710E1AA;
	Sat, 21 Sep 2024 20:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xvyErH5P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAC410E1AA
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 20:28:26 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2f752d9ab62so32038151fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 13:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726950505; x=1727555305; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DvDX+Qkf6ul5sVNd1hp47xzf2SFXNZFnERGsXMXc2Jc=;
 b=xvyErH5Pyj8ssDSIAppXYPpibIc7edNQ/iQvkKwRJPh/fBTUY3cYGtXvl3tx+HA0rz
 8wpFY0Dm16NF8SZZKOY3I1vCFJThPMskCyshN7iPC+CKii5O0X3o22p1Jz2Th7plA/oQ
 I4tJ/4hG4A4qwVC/3Ntg9humYIWA6b/qVw6eaKfkdnCbssuqAWOReCpStYQwA1+l/BgT
 LwP4ljD0z5RB6xnD8/9Z2FBMmHkK5N73z1JMwNDaBjXG4htPiCgb7ZdMS4B5omzKAdQh
 U6xE+jzNgOSAPfT6VfBoI3v9ktyqgGWjfkXoPo/Hx9XuRPdS6UTYt8oiTfGiWX+myS3g
 tU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726950505; x=1727555305;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DvDX+Qkf6ul5sVNd1hp47xzf2SFXNZFnERGsXMXc2Jc=;
 b=tI/pf56+FslJ+ZGAXnu40HseF6kCDwl2SHNq97QEirYjKXf//UJKSgMdgtXjFnZ8wy
 jBH1ZwGt+wwEn5BD//QyZSoBwEXDuYV9zLmtEQMYLh3txDD9U8ZwLyIVio0hPvdQj5Bs
 FcGoP6NLYqGAIMdI7MpLKlLwZu9+yVXWAXV15iE6PGDVp1s/7rSCUcw/fyQPCJO+cNbH
 lCAYDHN+B8wbD73z7QSVaMv9G8H5sZzfvXqAgqJw0c3G8HZebbv/dIFyqH/wRuIq1zbi
 UvO/GtS2JJsO4Q8N1GjUxSRizmpASww/MCehkbAgkFO5T/ZD+TRBbnCQgXgJSDtI2iVd
 H+HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVovgshQK0MzTQun8F3w2bBH6p5q5e8rkq7ABmFz+jLFi7ZZ3GlUmayq3hTMW38Q3Klcg1ihm/EHHs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuXbWm0uaU0mdrGrdl/avc0zFwJGaPBSQePYDjmvyA3rDxTVTq
 mOL7iuKTFkQ+iLmG1CtiHVOML3SBfQbEWqZ0nhsf6UD2Qv45s8B4NmyK9V9D2ZU=
X-Google-Smtp-Source: AGHT+IFhPIT+q2MyB5RN+pnWTfR+TceVTQH7kIiLDuOrDILRvZI3ajKI2nahwHEWM6RNEd8Ms9wrXg==
X-Received: by 2002:a05:6512:acb:b0:536:a4e9:9cf7 with SMTP id
 2adb3069b0e04-536ac3400e3mr3783318e87.56.1726950504875; 
 Sat, 21 Sep 2024 13:28:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53691d62993sm2264292e87.269.2024.09.21.13.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 13:28:23 -0700 (PDT)
Date: Sat, 21 Sep 2024 23:28:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sandor Yu <Sandor.yu@nxp.com>, vkoul@kernel.org, mripard@kernel.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, 
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, mripard@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com, oliver.brown@nxp.com, 
 alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: Re: [PATCH v16 2/8] phy: Add HDMI configuration options
Message-ID: <5bn3qcbzyyudjh34y76jj2r5j2p7mzpig4xntmjjlneznoipjw@ca7sbco5ceyk>
References: <cover.1719903904.git.Sandor.yu@nxp.com>
 <b1acbd48470d41b53b359d27fa2ea9358a037324.1719903904.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1acbd48470d41b53b359d27fa2ea9358a037324.1719903904.git.Sandor.yu@nxp.com>
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

On Tue, Jul 02, 2024 at 08:22:34PM GMT, Sandor Yu wrote:
> Allow HDMI PHYs to be configured through the generic
> functions through a custom structure added to the generic union.
> 
> The parameters added here are based on HDMI PHY
> implementation practices.  The current set of parameters
> should cover the potential users.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
> v15->v16:
> - Remove pixel_clk_rate, bpc and color_space fields from struct
>   phy_configure_opts_hdmi, they were replaced by unsigned long long tmds_char_rate.
> - Remove r-b and a-c tags because this patch have important change.
> 
> v9->v15:
>  *No change.
> 
>  include/linux/phy/phy-hdmi.h | 20 ++++++++++++++++++++
>  include/linux/phy/phy.h      |  7 ++++++-
>  2 files changed, 26 insertions(+), 1 deletion(-)
>  create mode 100644 include/linux/phy/phy-hdmi.h
> 
> diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
> new file mode 100644
> index 000000000000..dd923e19d17c
> --- /dev/null
> +++ b/include/linux/phy/phy-hdmi.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2022 NXP
> + */
> +
> +#ifndef __PHY_HDMI_H_
> +#define __PHY_HDMI_H_
> +
> +#include <linux/hdmi.h>

This header is not neccessary anymore. With it removed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Maxime, is this patch fine with you?

Vinod, could you please pick up this patch for 6.13 and possibly provide
an immutable tag for it? I see drm drivers using bad workarounds because
we don't have this in the API yet.

> +/**
> + * struct phy_configure_opts_hdmi - HDMI configuration set
> + * @tmds_char_rate: HDMI TMDS Character Rate in Hertz.
> + *
> + * This structure is used to represent the configuration state of a HDMI phy.
> + */
> +struct phy_configure_opts_hdmi {
> +	unsigned long long tmds_char_rate;
> +};
> +
> +#endif /* __PHY_HDMI_H_ */
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index 03cd5bae92d3..4ac486b101fe 100644
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
> 

-- 
With best wishes
Dmitry
