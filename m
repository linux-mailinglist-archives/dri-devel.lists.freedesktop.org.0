Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBC799B727
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 23:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8578E10E0FE;
	Sat, 12 Oct 2024 21:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="G9P03NsD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A11410E0FE
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 21:25:59 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 767F388B11;
 Sat, 12 Oct 2024 23:25:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728768357;
 bh=BP45u0ssYzJkTPgwj3CsIlqMPzwYXzDkvjYBgk+9DGQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=G9P03NsDnej4WwV74DoVZCkWXjLFl+P+CgceGJKpW9dg+rtgbGbcQfeiB0YhtCSrU
 gYtZ/jMdEuXQQlCL8TvrkiI0ceGTIGm0bZZHrnxY+VlrxjP9vG5HahCOBWgASvcAQ4
 mlhzrgnQh3tY8VCJBHeMpegrdL6qe0Vf+ednlOL/GS4J0sWjTWwCT8VLSarAHOixb1
 +JJxppQqmePdL85cMVUpKE/Ah+l351/MznirNDJqczxjCf4kH3HYWLtdS+aZlC8yqz
 0OYBsmy1um9VONCtN4BDG0fTXACxkThAZurnNFva4Iho8xiQdqPb5A0sJBHXNOV0TR
 zG0AOVXzeaJGg==
Message-ID: <51ec54bd-92cf-4d66-9e7d-5cabe3e210dc@denx.de>
Date: Sat, 12 Oct 2024 22:34:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] arm64: dts: imx8mp-phyboard-pollux-rdk: Add
 panel-timing node to panel-lvds node
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 o.rempel@pengutronix.de, y.moog@phytec.de, isaac.scott@ideasonboard.com,
 biju.das.jz@bp.renesas.com
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-3-victor.liu@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241012073543.1388069-3-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

On 10/12/24 9:35 AM, Liu Ying wrote:
> Add a panel-timing node to panel-lvds node to override any fixed
> display modes written in a panel driver.  This way, 74.25MHz clock
> frequency specified in panel-timing node may accommodate 7-fold
> 519.75MHz "media_ldb" clock which is derived from 1.0395GHz
> "video_pll1" clock.
> 
> This should suppress this LDB driver warning:
> [   17.923709] fsl-ldb 32ec0000.blk-ctrl:bridge@5c: Configured LDB clock (72400000 Hz) does not match requested LVDS clock: 506800000 Hz
> 
> This also makes the display mode used by the panel pass mode validation
> against pixel clock rate and "media_ldb" clock rate in a certain display
> driver.
> 
> Fixes: 326d86e197fc ("arm64: dts: imx8mp-phyboard-pollux-rdk: add etml panel support")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2:
> * No change.
> 
>   .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts  | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
> index 50debe821c42..20cb5363cccb 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
> @@ -37,6 +37,21 @@ panel1_lvds: panel-lvds {
>   		backlight = <&backlight_lvds>;
>   		power-supply = <&reg_vcc_3v3_sw>;
>   
> +		panel-timing {
> +			clock-frequency = <74250000>;
> +			hactive = <1280>;
> +			vactive = <800>;
> +			hfront-porch = <72>;
> +			hback-porch = <86>;
> +			hsync-len = <2>;
> +			vfront-porch = <15>;
> +			vback-porch = <21>;
> +			vsync-len = <2>;
> +			hsync-active = <0>;
> +			vsync-active = <0>;
> +			de-active = <1>;
> +		};
There is an existing entry for this panel in panel-simple.c , please do 
not duplicate timings in the DT:

drivers/gpu/drm/panel/panel-simple.c:static const struct panel_desc 
edt_etml1010g3dra = {
drivers/gpu/drm/panel/panel-simple.c:   .timings = 
&edt_etml1010g3dra_timing,
drivers/gpu/drm/panel/panel-simple.c:           .compatible = 
"edt,etml1010g3dra",
