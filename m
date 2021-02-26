Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19230326228
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 12:52:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B1E6E2C7;
	Fri, 26 Feb 2021 11:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E5A6E2C7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 11:52:50 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id o6so5939041pjf.5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 03:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MboCJTnSVOsg8iDl/Ytx71C/vRtXv8vtcexDfc3Ue6Q=;
 b=ciW/AiXB8i8nLGP934iHFFnQEtqDN6xDF/7p7P/mEe1/XJTnSNexLZkPm7joRF7lOY
 cE0Cn3WHbKC1oskCjNIdD3Q/H/oWQt2cmsos27FAty4Wy+708ZaO2bywYURhJ4iZk5Cf
 ChaYps5qpb7yT8MlORTSqv+Iopb920EhqN7aUJo0SxaXLb1OvvCp/pMuglMoEOKDwLGr
 QuIqIrpUcduiuRCusADGM62Yu1pgizOs1+tM8TeFc40pirsqAg9i7tgVfF6V3zjNlckO
 qPDssRfGEHO5OYRvqGw2PQazlGsdTR/IZDwqQ0aymVuO0tEfRZTyaleLAH78Tlpjkig/
 YYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MboCJTnSVOsg8iDl/Ytx71C/vRtXv8vtcexDfc3Ue6Q=;
 b=ZPieEo6ogtIMH385xS4Y4bHd/GY5fore728SMyJP8OF3tZH+QPPUIpZ3HtIgalO8fX
 PlMFhzeeibERmqMKTjjuXr6jitadElbMIZ7AKzqmjcn7PMT2G+GbCgivzfE7BOoEI3q5
 1b+PT1GDJcScgH2Zr940vvIgcFoSw3Bu/bDl4Fiv5C4RYtEsnUgje1g5BMn/dW1aTEzL
 id+j7ueYoad3/Gh9pFcudCo2XG4CBH4vcwuYATKXb5cjfphIO262XBDmYeQ6T2tyaM+v
 yf/IJCYOgOkRt6Mq8GdUWuhPl1zyRaW5Ou3zZDoqMlI+/7C3kQ1sEDiM9RnRcK8nh0Dz
 jJ2w==
X-Gm-Message-State: AOAM5313B1iPJoZ1G2ds5Yms4NKe4iNSxZgPStre5aW3MfVbPkH/F3tV
 8LrN0Miu96wg9g4xuhyLTGbzePQyH8UysszBm/+BEg==
X-Google-Smtp-Source: ABdhPJwXRb71oswV+DAkAJmkVpFsBDgs0LQFkzICKAIYFYSo49YWbwL95uo+mAX/yk0mnI/bxGguPfEj3sfTIkzCrdo=
X-Received: by 2002:a17:90b:1b52:: with SMTP id
 nv18mr3187467pjb.19.1614340369882; 
 Fri, 26 Feb 2021 03:52:49 -0800 (PST)
MIME-Version: 1.0
References: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
 <1613619715-28785-2-git-send-email-victor.liu@nxp.com>
In-Reply-To: <1613619715-28785-2-git-send-email-victor.liu@nxp.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 26 Feb 2021 12:52:39 +0100
Message-ID: <CAG3jFyskt5ottSuGVe2VgR-rvbieauaFZFhXg5sYJxqwxgKawA@mail.gmail.com>
Subject: Re: [PATCH v4 01/14] phy: Add LVDS configuration options
To: Liu Ying <victor.liu@nxp.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 s.hauer@pengutronix.de, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, kishon@ti.com,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-imx@nxp.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>, shawnguo@kernel.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Liu,

Thanks for submitting this series.

This patch looks good to me.
Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Thu, 18 Feb 2021 at 04:56, Liu Ying <victor.liu@nxp.com> wrote:
>
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
> v3->v4:
> * No change.
>
> v2->v3:
> * No change.
>
> v1->v2:
> * No change.
>
>  include/linux/phy/phy-lvds.h | 48 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/phy/phy.h      |  4 ++++
>  2 files changed, 52 insertions(+)
>  create mode 100644 include/linux/phy/phy-lvds.h
>
> diff --git a/include/linux/phy/phy-lvds.h b/include/linux/phy/phy-lvds.h
> new file mode 100644
> index 00000000..1b5b9d6
> --- /dev/null
> +++ b/include/linux/phy/phy-lvds.h
> @@ -0,0 +1,48 @@
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
> + *
> + * This structure is used to represent the configuration state of a
> + * LVDS phy.
> + */
> +struct phy_configure_opts_lvds {
> +       /**
> +        * @bits_per_lane_and_dclk_cycle:
> +        *
> +        * Number of bits per data lane and differential clock cycle.
> +        */
> +       unsigned int bits_per_lane_and_dclk_cycle;
> +
> +       /**
> +        * @differential_clk_rate:
> +        *
> +        * Clock rate, in Hertz, of the LVDS differential clock.
> +        */
> +       unsigned long differential_clk_rate;
> +
> +       /**
> +        * @lanes:
> +        *
> +        * Number of active, consecutive, data lanes, starting from
> +        * lane 0, used for the transmissions.
> +        */
> +       unsigned int lanes;
> +
> +       /**
> +        * @is_slave:
> +        *
> +        * Boolean, true if the phy is a slave which works together
> +        * with a master phy to support dual link transmission,
> +        * otherwise a regular phy or a master phy.
> +        */
> +       bool is_slave;
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
>   *             the MIPI_DPHY phy mode.
>   * @dp:                Configuration set applicable for phys supporting
>   *             the DisplayPort protocol.
> + * @lvds:      Configuration set applicable for phys supporting
> + *             the LVDS phy mode.
>   */
>  union phy_configure_opts {
>         struct phy_configure_opts_mipi_dphy     mipi_dphy;
>         struct phy_configure_opts_dp            dp;
> +       struct phy_configure_opts_lvds          lvds;
>  };
>
>  /**
> --
> 2.7.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
