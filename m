Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 402CC32ED9E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 16:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789DB6EB54;
	Fri,  5 Mar 2021 15:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1D36EB54
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 15:03:21 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id n10so1553892pgl.10
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 07:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2mlYSW9obf6ZHWc89hkL3cxC+hIY8OuKOPTUYIiFH0A=;
 b=J6MTCpdKN6RbHYeZCKONYiDSec9HN6g5MOD48exdVQl9rBzpoKxe/fXU+ub+InlwI9
 /C/O5SHDUrqEQzJLItBfA2St18/8xW4RlUw2Vdiq6eImAdMCgIT0yqEX7IQhpqQI2vFL
 wkpDjHAah8KBj+GLj5hxch3CWWG6By1Ccf9ydjZK3219BeHiOumA8j/3qN97VUW/L05V
 52imTqTtuj3UId+UJKsPtoBYPeCQD2C/OmCtRG2e5c//Thl94OKaJ9m3pDzQGcUEUgzU
 PF4V3iTv0FNO9x5d71GxoWw8s2s1gdCsB3D8ww4Bly8RJ3Q0Mt89b9ZbdKlKlCvBG6JK
 IuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2mlYSW9obf6ZHWc89hkL3cxC+hIY8OuKOPTUYIiFH0A=;
 b=E26IQWoeKGeEIXjLAHdHxxhsZXoTTeuHqNMPPtuwBpwYqeVXZBREt8y1DiCi817KsL
 GNnzpSKK/gT6SERGB3Dtfuy14jztklOjjyQQ4FxBKOhRGLYIt2sVzV80bxH+M5rkjuHT
 W/BHUNga52MhEdhxjF0tMcW+rRbxyGl8nOModvf9mMtf8rmMMOmjV+rUOp+qd4Nk4lI8
 5v9dVySywM7yNbp7TxwtZxD4qU5V4ZoRm15rIi/XdjuZFVqp0Xa43FTitsWbnoj8FdnD
 /F40blurU/P68nSIdkbNBNPLZOymZ9wLDEZU0w8Y72s38XkpkVHbSq5agLvzLvEBj7BQ
 sq5g==
X-Gm-Message-State: AOAM530P1TwV0h4t2l2g63FtFG6dizRahHLm7oHI6L9aTtM3QGMgmbex
 z8OJIkotpUqJU0UTM/Bl+11lo1plwC45cRId4ZGaFg==
X-Google-Smtp-Source: ABdhPJx2AsMoIAD1vR1ykd/0xY4yQ2cyON9Ui1Hcd4m8KbzbgFcFYC24pz+4T8epFidgoa72a1Ero5G2nRWHf8lhQ54=
X-Received: by 2002:a63:ee4b:: with SMTP id n11mr9173347pgk.265.1614956601438; 
 Fri, 05 Mar 2021 07:03:21 -0800 (PST)
MIME-Version: 1.0
References: <1607651182-12307-1-git-send-email-victor.liu@nxp.com>
 <1607651182-12307-3-git-send-email-victor.liu@nxp.com>
In-Reply-To: <1607651182-12307-3-git-send-email-victor.liu@nxp.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 5 Mar 2021 16:03:10 +0100
Message-ID: <CAG3jFyvJZkVRs4NnDmPmGk-Qkr0voyvf3JNvKFAKDyxcCNR3Cw@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] phy: Add LVDS configuration options
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 agx@sigxcpu.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 martin.kepplinger@puri.sm, kishon@ti.com, linux-imx@nxp.com,
 robert.chiras@nxp.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 s.hauer@pengutronix.de, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 kernel@pengutronix.de, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Liu,

This patch seems to be included in both this series and the "Add some
DRM bridge drivers support for i.MX8qm/qxp SoCs" series. Instead of
having the two series have a conflict I would suggest either merging
them (if that makes sense) or removing this patch from one of them and
explicitly stating that there is a dependency on the other series.

(the patch itself still looks good though :) )

On Fri, 11 Dec 2020 at 02:56, Liu Ying <victor.liu@nxp.com> wrote:
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
