Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF884FAF88
	for <lists+dri-devel@lfdr.de>; Sun, 10 Apr 2022 20:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7524C10E997;
	Sun, 10 Apr 2022 18:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164D210E997
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 18:12:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BDBE482;
 Sun, 10 Apr 2022 20:12:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1649614356;
 bh=jX5Le6TCB9q6490TZDhc0xzt6OcdxmfvhJ4v0itjJg0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VldgW/moPWOythTuBPC5xGILucTXvchs1S+SzHc+XewE9FS4bpMGqz4LMJBWCT8rD
 bsdB8fodo/WycYgazUmkG7xeUub+SpFgkcyQxnXDQSEpOXo/U9E7QniIgd3prhTSPb
 sdKF3FdU9F7D1eshmFt6myXZdPI5eODsxnQfD4S4=
Date: Sun, 10 Apr 2022 21:12:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 10/11] dt-bindings: display: exynos: dsim: Add NXP
 i.MX8MM support
Message-ID: <YlMeEqhkQ6HuCKFE@pendragon.ideasonboard.com>
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
 <20220408162108.184583-11-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220408162108.184583-11-jagan@amarulasolutions.com>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

Thank you for the patch.

On Fri, Apr 08, 2022 at 09:51:07PM +0530, Jagan Teki wrote:
> Samsung MIPI DSIM bridge can also be found in i.MX8MM/i.MX8MN SoC.
> 
> Add dt-bingings for it.
> 
> v1:
> * new patch
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> index be377786e8cd..5133d4d39190 100644
> --- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> +++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> @@ -7,6 +7,7 @@ Required properties:

May I try and ask you to convert the DT bindings to YAML as part of this
series ? :-)

>  		"samsung,exynos5410-mipi-dsi" /* for Exynos5410/5420/5440 SoCs */
>  		"samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
>  		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
> +		"fsl,imx8mm-mipi-dsim" /* for i.MX8M Mini/Nano SoCs */

Should we have two different compatible strings for i.MX8MM and i.MX8MN
?

>    - reg: physical base address and length of the registers set for the device
>    - interrupts: should contain DSI interrupt
>    - clocks: list of clock specifiers, must contain an entry for each required

-- 
Regards,

Laurent Pinchart
