Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CF62909A7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 18:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1184F6EE36;
	Fri, 16 Oct 2020 16:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8AA6EE36
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 16:26:00 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 4DB4E80608;
 Fri, 16 Oct 2020 18:25:55 +0200 (CEST)
Date: Fri, 16 Oct 2020 18:25:53 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [RFC][PATCH] drm/bridge: lvds-codec: Add support for pixel data
 sampling edge select
Message-ID: <20201016162553.GA1333109@ravnborg.org>
References: <20201002230823.242147-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201002230823.242147-1-marex@denx.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=8b9GpE9nAAAA:8 a=hD80L64hAAAA:8 a=yC-0_ovQAAAA:8
 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8 a=JfrnYn6hAAAA:8
 a=phlkwaE_AAAA:8 a=e5mUnYsNAAAA:8 a=6CZSjis6Rq6xaZBMZBsA:9
 a=lKBsp2zljbJEqnF_:21 a=AoBWwtdSRskkJ9Z_:21 a=CjuIK1q_8ugA:10
 a=T3LWEMljR5ZiDmsYVIUa:22 a=QsnFDINu91a9xkgZirup:22
 a=D0XLA9XvdZm18NrgonBM:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=uKTQOUHymn4LaG7oTSIC:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>,
 Antonio Borneo <antonio.borneo@st.com>, Philippe Cornu <philippe.cornu@st.com>,
 dri-devel@lists.freedesktop.org, Yannick Fertre <yannick.fertre@st.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek.

On Sat, Oct 03, 2020 at 01:08:23AM +0200, Marek Vasut wrote:
> The OnSemi FIN3385 Parallel-to-LVDS encoder has a dedicated input line to
> select input pixel data sampling edge. Add DT property "pixelclk-active",
> same as the one used by display timings, and configure bus flags based on
> this DT property.

Why is it that this information cannot come from the panel driver?
The property tell when data are sampled and the FIN3385 Parallel-to-LVDS
is the one that transmit the data - not then one that samples the data.
Correct?

	Sam

> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Antonio Borneo <antonio.borneo@st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Philippe Cornu <philippe.cornu@st.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Vincent Abriou <vincent.abriou@st.com>
> Cc: Yannick Fertre <yannick.fertre@st.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/lvds-codec.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> index f52ccffc1bd1..bc941d4fb5b9 100644
> --- a/drivers/gpu/drm/bridge/lvds-codec.c
> +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> @@ -19,6 +19,7 @@ struct lvds_codec {
>  	struct device *dev;
>  	struct drm_bridge bridge;
>  	struct drm_bridge *panel_bridge;
> +	struct drm_bridge_timings timings;
>  	struct regulator *vcc;
>  	struct gpio_desc *powerdown_gpio;
>  	u32 connector_type;
> @@ -80,6 +81,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
>  	struct device_node *panel_node;
>  	struct drm_panel *panel;
>  	struct lvds_codec *lvds_codec;
> +	u32 val;
>  	int ret;
>  
>  	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
> @@ -124,6 +126,12 @@ static int lvds_codec_probe(struct platform_device *pdev)
>  	if (IS_ERR(lvds_codec->panel_bridge))
>  		return PTR_ERR(lvds_codec->panel_bridge);
>  
> +	if (!of_property_read_u32(dev->of_node, "pixelclk-active", &val)) {
> +		lvds_codec->timings.input_bus_flags = val ?
> +			DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE :
> +			DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE;
> +	}
> +
>  	/*
>  	 * The panel_bridge bridge is attached to the panel's of_node,
>  	 * but we need a bridge attached to our of_node for our user
> @@ -131,6 +139,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
>  	 */
>  	lvds_codec->bridge.of_node = dev->of_node;
>  	lvds_codec->bridge.funcs = &funcs;
> +	lvds_codec->bridge.timings = &lvds_codec->timings;
>  	drm_bridge_add(&lvds_codec->bridge);
>  
>  	platform_set_drvdata(pdev, lvds_codec);
> -- 
> 2.28.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
