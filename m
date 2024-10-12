Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3D899B724
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 23:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8F510E064;
	Sat, 12 Oct 2024 21:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="SChqKvAi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDC310E064
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 21:25:58 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AA3DA88A1C;
 Sat, 12 Oct 2024 23:25:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728768355;
 bh=D/0NXLlVjCKoU8ERDheF+eCP+jOOO+P9lmqbc6AqhSQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SChqKvAiVOTrjHXhlaeeP1kWBOtrn8ykmw3KUofl9Ce1sEwX7p+cmPC4nIezgfDsV
 FQgUlEFW92+YbsUMORoH18LHdROdSQ+vHCtEe7GTZlMk6l6yoj0ttudutfcK2jyjBa
 X1v82kzdUb31xUZAqObPqAwNXfwrpIowUFrKXBNzjqwa3Iqjar1/nOjXyjZgP7kaKL
 tZYYspyhu5zz6Fozu72034Qd3Vwvej4xono1hmreR4GBKJmL81eqfXL06ZC5zs2JBk
 gNpV5L0kOG0yxSqeMfCKbPvS6z04Xh1RwdQpQYl3HGgtRukDqaNANM/JVPww404Vz0
 NSFFgZ4d9tSug==
Message-ID: <17caacb0-379f-47b4-a7b9-f3eccc327783@denx.de>
Date: Sat, 12 Oct 2024 22:33:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] arm64: dts: imx8mp-skov-revb-mi1010ait-1cp1: Add
 panel-timing node to panel node
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
 <20241012073543.1388069-2-victor.liu@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241012073543.1388069-2-victor.liu@nxp.com>
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
> Add a panel-timing node to panel node to override any fixed display
> modes written in a panel driver.  This way, 68.9MHz clock frequency
> specified in panel-timing node may accommodate 7-fold 482.3MHz
> "media_ldb" clock which is derived from 964.6MHz "video_pll1" clock.
> The above clock frequencies align to the clock rates assigned in the
> lvds_bridge node and media_blk_ctrl node in this DT file.
> 
> This should be able to suppress this LDB driver warning:
> [   17.206644] fsl-ldb 32ec0000.blk-ctrl:bridge@5c: Configured LDB clock (70000000 Hz) does not match requested LVDS clock: 490000000 Hz
> 
> This also makes the display mode used by the panel pass mode validation
> against pixel clock rate and "media_ldb" clock rate in a certain display
> driver.
> 
> Fixes: 6d382d51d979 ("arm64: dts: freescale: Add SKOV IMX8MP CPU revB board")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2:
> * No change.
> 
>   .../freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts
> index 3c2efdc59bfa..4e9f76de7462 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts
> @@ -13,6 +13,21 @@ panel {
>   		backlight = <&backlight>;
>   		power-supply = <&reg_tft_vcom>;
>   
> +		panel-timing {
> +			clock-frequency = <68900000>;
> +			hactive = <1280>;
> +			vactive = <800>;
> +			hfront-porch = <30>;
> +			hback-porch = <30>;
> +			hsync-len = <10>;
> +			vfront-porch = <5>;
> +			vback-porch = <5>;
> +			vsync-len = <5>;
> +			hsync-active = <0>;
> +			vsync-active = <0>;
> +			de-active = <1>;
> +		};
There is an existing entry for this panel in panel-simple.c , please do 
not duplicate timings in the DT:

drivers/gpu/drm/panel/panel-simple.c:   .timings = 
&multi_inno_mi1010ait_1cp_timing,
drivers/gpu/drm/panel/panel-simple.c:           .compatible = 
"multi-inno,mi1010ait-1cp",
drivers/gpu/drm/panel/panel-simple.c:           .data = 
&multi_inno_mi1010ait_1cp,
