Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E579EA429
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 02:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2F810E371;
	Tue, 10 Dec 2024 01:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LPvwdiyC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C6C10E371
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 01:19:02 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-540215984f0so1304732e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 17:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733793540; x=1734398340; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hwOz/3s+5rB6IRZt+uNZZmxy+vjj4hk+TORJT/mIsZw=;
 b=LPvwdiyC4Pn/Q/iAdPvZpxS1WpjGvR/w6KcNr7HN2bv/OA/MjnZFLr1ZlmIYSxaDj2
 L6uIWTfzz8dI8bLAFHStyuo6a5bniYCZBEZ5nlzF23E3PWM0pMceGJYoirmNBkhEI/rD
 hVtxl97ckCxVXxjSitxX7RQoK7OPkL4iYcimmFh1BpqJ3ioebiYcreTqaiW5BTlkRNDW
 zNuQNlMB0qV9gfw2+WHJDRwdLlE2dI/yo5uMdtXRqPBCm831W/afdoaZaOBDtgdjfkpf
 /5EjNJ9JXjwCMDRabCMHfRFM5bBF4DCKz2BnAVfXXyMJW4uzCSRuMtpm0pxi03TaOnIt
 QPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733793540; x=1734398340;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hwOz/3s+5rB6IRZt+uNZZmxy+vjj4hk+TORJT/mIsZw=;
 b=wT4lbnHeIHlIsgEM8sMBInq98vS7yNKzvMz0rftHVI97uxZyCsSy56JMfq2OhfPaJR
 zrtZtlZYdEhVTFEfns55jSfod9Fl74kqasK0RIXqNVEue8p9Z+nMSovze7GpB7nP3QvI
 EqL01/1GGyG+gSj3JucM+LwtLdIZ2PPmpdeDbZylciGSqJewGO9ty+ubz6+40CNAOiTJ
 oCQtOAC5Q+289DXdgBBv/W53oyd8HXi3TYrim/e3D3T242WaHwhKSfEwGErnH8UeLpQ1
 j+KWbj7wm935/1RfHa8QGwK8wXFpzslTb/YLG5Yt4vWmeeDDouZdELVpCSVG/Un4EGoz
 LleQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDIbdb+krwxNBHLENLYrpN1fPK1XmTBqo25at0q97Da9V/rO2T23c1ZlQhSPFxbJIpytnkss8VAyc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8/KBFlU1zAYpslurOAG3+1D4IoBsHkNUR9Df0gjUEhZObGUg6
 s3WnDSqi8zt3flCSm5125xh6QrWkwUvb6E0jvwh2ovK4up5w5WMTZTFka1MSMx8=
X-Gm-Gg: ASbGnctJekpUoHiSeuyzlS2v2uF3ve18886xWPw/71txJkgSBiICFsMJV9Rv+SwiCVm
 NbkvPrlRqd4+TzG+ZiA/ExX1PfNFvE3taBwiv04N/dRT0lN4aISZnlkfxane/rG/6wyRsyS//TM
 yxYjsgU4oj/pdLVhqWGImB4TLmoFNoPK29NIHB7xl9EBKiqOxTwO+pfBTDUGfacjsRHRvbJV2Mi
 GUxZFoGyITG8s+9OMqkmYLOq0J6JvRNI3e+SlefDJwa9olLUf/AXAsMOQi/iQ19RSy4dOq21BBb
 pS30vyf7qH9bDQmSDP65JGIPXxmI88mTdg==
X-Google-Smtp-Source: AGHT+IFhrbfBVLvwS8JtxYQvsf4ft/BOKHf1cBzqWj4YWhQkk8IVityumdfo4WZxOv1As/yfkbavcA==
X-Received: by 2002:a05:6512:b96:b0:53f:8c46:42b6 with SMTP id
 2adb3069b0e04-5402402ea2dmr922627e87.0.1733793540153; 
 Mon, 09 Dec 2024 17:19:00 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e3847565csm1090292e87.190.2024.12.09.17.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 17:18:58 -0800 (PST)
Date: Tue, 10 Dec 2024 03:18:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrej Picej <andrej.picej@norik.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, marex@denx.de, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
Subject: Re: [PATCH v4 2/3] drm/bridge: ti-sn65dsi83: Add ti,lvds-vod-swing
 optional properties
Message-ID: <xkrk3vdw7yhj22ornqog7wovqctgrolfcxbl43u7ddgstjqsbl@h22hxlld6zqg>
References: <20241205134021.2592013-1-andrej.picej@norik.com>
 <20241205134021.2592013-3-andrej.picej@norik.com>
 <nbumcptoi5hwehjbrynf6dh2wrz7a4ugqblrjxyswvj7udkf3u@6qikclizqfjr>
 <e420579f-25b2-41ca-9627-130d67c51541@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e420579f-25b2-41ca-9627-130d67c51541@norik.com>
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

On Mon, Dec 09, 2024 at 08:56:29AM +0100, Andrej Picej wrote:
> Hi Dmitry,
> 
> On 5. 12. 24 23:48, Dmitry Baryshkov wrote:
> > On Thu, Dec 05, 2024 at 02:40:20PM +0100, Andrej Picej wrote:
> > > Add a optional properties to change LVDS output voltage. This should not
> > > be static as this depends mainly on the connected display voltage
> > > requirement. We have three properties:
> > > - "ti,lvds-termination-ohms", which sets near end termination,
> > > - "ti,lvds-vod-swing-data-microvolt" and
> > > - "ti,lvds-vod-swing-clock-microvolt" which both set LVDS differential
> > > output voltage for data and clock lanes. They are defined as an array
> > > with min and max values. The appropriate bitfield will be set if
> > > selected constraints can be met.
> > > 
> > > If "ti,lvds-termination-ohms" is not defined the default of 200 Ohm near
> > > end termination will be used. Selecting only one:
> > > "ti,lvds-vod-swing-data-microvolt" or
> > > "ti,lvds-vod-swing-clock-microvolt" can be done, but the output voltage
> > > constraint for only data/clock lanes will be met. Setting both is
> > > recommended.
> > > 
> > > Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> > > ---
> > > Changes in v4:
> > > - fix typo in commit message bitfiled -> bitfield
> > > - use arrays (lvds_vod_swing_conf and lvds_term_conf) in private data, instead
> > > of separate variables for channel A/B
> > > - add more checks on return value of "of_property_read_u32_array"
> > > Changes in v3:
> > > - use microvolts for default array values 1000 mV -> 1000000 uV.
> > > Changes in v2:
> > > - use datasheet tables to get the proper configuration
> > > - since major change was done change the authorship to myself
> > > ---
> > >   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 147 +++++++++++++++++++++++++-
> > >   1 file changed, 144 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > index 57a7ed13f996..f724d2a6777b 100644
> > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > @@ -132,6 +132,16 @@
> > >   #define  REG_IRQ_STAT_CHA_SOT_BIT_ERR		BIT(2)
> > >   #define  REG_IRQ_STAT_CHA_PLL_UNLOCK		BIT(0)
> > > +enum sn65dsi83_channel {
> > > +	CHANNEL_A,
> > > +	CHANNEL_B
> > > +};
> > > +
> > > +enum sn65dsi83_lvds_term {
> > > +	OHM_100,
> > > +	OHM_200
> > > +};
> > > +
> > >   enum sn65dsi83_model {
> > >   	MODEL_SN65DSI83,
> > >   	MODEL_SN65DSI84,
> > > @@ -147,6 +157,8 @@ struct sn65dsi83 {
> > >   	struct regulator		*vcc;
> > >   	bool				lvds_dual_link;
> > >   	bool				lvds_dual_link_even_odd_swap;
> > > +	int				lvds_vod_swing_conf[2];
> > > +	int				lvds_term_conf[2];
> > >   };
> > >   static const struct regmap_range sn65dsi83_readable_ranges[] = {
> > > @@ -237,6 +249,36 @@ static const struct regmap_config sn65dsi83_regmap_config = {
> > >   	.max_register = REG_IRQ_STAT,
> > >   };
> > > +static const int lvds_vod_swing_data_table[2][4][2] = {
> > > +	{	/* 100 Ohm */
> > > +		{ 180000, 313000 },
> > > +		{ 215000, 372000 },
> > > +		{ 250000, 430000 },
> > > +		{ 290000, 488000 },
> > > +	},
> > > +	{	/* 200 Ohm */
> > > +		{ 150000, 261000 },
> > > +		{ 200000, 346000 },
> > > +		{ 250000, 428000 },
> > > +		{ 300000, 511000 },
> > > +	},
> > > +};
> > > +
> > > +static const int lvds_vod_swing_clock_table[2][4][2] = {
> > > +	{	/* 100 Ohm */
> > > +		{ 140000, 244000 },
> > > +		{ 168000, 290000 },
> > > +		{ 195000, 335000 },
> > > +		{ 226000, 381000 },
> > > +	},
> > > +	{	/* 200 Ohm */
> > > +		{ 117000, 204000 },
> > > +		{ 156000, 270000 },
> > > +		{ 195000, 334000 },
> > > +		{ 234000, 399000 },
> > > +	},
> > > +};
> > > +
> > >   static struct sn65dsi83 *bridge_to_sn65dsi83(struct drm_bridge *bridge)
> > >   {
> > >   	return container_of(bridge, struct sn65dsi83, bridge);
> > > @@ -435,12 +477,16 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
> > >   		val |= REG_LVDS_FMT_LVDS_LINK_CFG;
> > >   	regmap_write(ctx->regmap, REG_LVDS_FMT, val);
> > > -	regmap_write(ctx->regmap, REG_LVDS_VCOM, 0x05);
> > > +	regmap_write(ctx->regmap, REG_LVDS_VCOM,
> > > +			REG_LVDS_VCOM_CHA_LVDS_VOD_SWING(ctx->lvds_vod_swing_conf[CHANNEL_A]) |
> > > +			REG_LVDS_VCOM_CHB_LVDS_VOD_SWING(ctx->lvds_vod_swing_conf[CHANNEL_B]));
> > >   	regmap_write(ctx->regmap, REG_LVDS_LANE,
> > >   		     (ctx->lvds_dual_link_even_odd_swap ?
> > >   		      REG_LVDS_LANE_EVEN_ODD_SWAP : 0) |
> > > -		     REG_LVDS_LANE_CHA_LVDS_TERM |
> > > -		     REG_LVDS_LANE_CHB_LVDS_TERM);
> > > +		     (ctx->lvds_term_conf[CHANNEL_A] ?
> > > +			  REG_LVDS_LANE_CHA_LVDS_TERM : 0) |
> > > +		     (ctx->lvds_term_conf[CHANNEL_B] ?
> > > +			  REG_LVDS_LANE_CHB_LVDS_TERM : 0));
> > >   	regmap_write(ctx->regmap, REG_LVDS_CM, 0x00);
> > >   	le16val = cpu_to_le16(mode->hdisplay);
> > > @@ -576,10 +622,101 @@ static const struct drm_bridge_funcs sn65dsi83_funcs = {
> > >   	.atomic_get_input_bus_fmts = sn65dsi83_atomic_get_input_bus_fmts,
> > >   };
> > > +static int sn65dsi83_select_lvds_vod_swing(struct device *dev,
> > > +	u32 lvds_vod_swing_data[2], u32 lvds_vod_swing_clk[2], u8 lvds_term)
> > > +{
> > > +	int i;
> > > +
> > > +	for (i = 0; i <= 3; i++) {
> > > +		if (lvds_vod_swing_data_table[lvds_term][i][0] >= lvds_vod_swing_data[0] &&
> > > +		lvds_vod_swing_data_table[lvds_term][i][1] <= lvds_vod_swing_data[1] &&
> > > +		lvds_vod_swing_clock_table[lvds_term][i][0] >= lvds_vod_swing_clk[0] &&
> > > +		lvds_vod_swing_clock_table[lvds_term][i][1] <= lvds_vod_swing_clk[1])
> > > +			return i;
> > > +	}
> > > +
> > > +	dev_err(dev, "failed to find appropriate LVDS_VOD_SWING configuration\n");
> > > +	return -EINVAL;
> > > +}
> > > +
> > > +static int sn65dsi83_parse_lvds_endpoint(struct sn65dsi83 *ctx, int channel)
> > > +{
> > > +	struct device *dev = ctx->dev;
> > > +	struct device_node *endpoint;
> > > +	/* Set so the property can be freely selected if not defined */
> > > +	u32 lvds_vod_swing_data[2] = { 0, 1000000 };
> > > +	u32 lvds_vod_swing_clk[2] = { 0, 1000000 };
> > > +	u32 lvds_term = 200;
> > > +	u8 lvds_term_conf;
> > > +	int endpoint_reg;
> > > +	int lvds_vod_swing_conf;
> > > +	int ret = 0;
> > > +	int ret_data;
> > > +	int ret_clock;
> > > +
> > > +	if (channel == CHANNEL_A)
> > > +		endpoint_reg = 2;
> > > +	else
> > > +		endpoint_reg = 3;
> > > +
> > > +	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, endpoint_reg, -1);
> > > +	of_property_read_u32(endpoint, "ti,lvds-termination-ohms", &lvds_term);
> > > +
> > > +	if (lvds_term == 200)
> > > +		lvds_term_conf = OHM_200;
> > > +	else
> > > +		lvds_term_conf = OHM_100;
> > > +
> > > +	ctx->lvds_term_conf[channel] = lvds_term_conf;
> > > +
> > > +	ret_data = of_property_read_u32_array(endpoint,
> > > +			"ti,lvds-vod-swing-data-microvolt", lvds_vod_swing_data,
> > > +			ARRAY_SIZE(lvds_vod_swing_data));
> > > +	if (ret_data != 0 && ret_data != -EINVAL) {
> > > +		ret = ret_data;
> > > +		goto exit;
> > > +	}
> > > +
> > > +	ret_clock = of_property_read_u32_array(endpoint,
> > > +			"ti,lvds-vod-swing-clock-microvolt", lvds_vod_swing_clk,
> > > +			ARRAY_SIZE(lvds_vod_swing_clk));
> > > +	if (ret_clock != 0 && ret_clock != -EINVAL) {
> > > +		ret = ret_clock;
> > > +		goto exit;
> > > +	}
> > > +
> > > +	/* If any of the two properties is defined. */
> > > +	if (!ret_data || !ret_clock) {
> > > +		lvds_vod_swing_conf = sn65dsi83_select_lvds_vod_swing(dev,
> > > +			lvds_vod_swing_data, lvds_vod_swing_clk,
> > > +			lvds_term_conf);
> > > +		if (lvds_vod_swing_conf < 0) {
> > > +			ret = lvds_vod_swing_conf;
> > > +			goto exit;
> > > +		}
> > > +
> > > +		ctx->lvds_vod_swing_conf[channel] = lvds_vod_swing_conf;
> > > +	}
> > > +	ret = 0;
> > > +exit:
> > > +	of_node_put(endpoint);
> > > +	return ret;
> > > +}
> > > +
> > >   static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
> > >   {
> > >   	struct drm_bridge *panel_bridge;
> > >   	struct device *dev = ctx->dev;
> > > +	int ret;
> > > +
> > > +	ctx->lvds_vod_swing_conf[CHANNEL_A] = 0x1;
> > > +	ctx->lvds_vod_swing_conf[CHANNEL_B] = 0x1;
> > > +	ctx->lvds_term_conf[CHANNEL_A] = 0x1;
> > > +	ctx->lvds_term_conf[CHANNEL_B] = 0x1;
> > 
> > These match the defaults in sn65dsi83_parse_lvds_endpoint(). Do we
> > really need those?
> 
> Yes, I think we do. This ensures that defaults are used even when property
> is not defined/LVDS channel is not used. So also LVDS channel B defaults are
> set even for sn65dsi83 (single LVDS output). Keeping the same reg values as
> before these changes.

You can move sn65dsi83_parse_lvds_endpoint() out of the if() and get the
same result. Duplicating data (or code) is a bad idea, because it's easy
to update one point and miss another point. And then usually one has a
nice debugging session, trying to understand why their changes didn't
work out.

> 
> Best regards,
> Andrej
> 
> 
> > 
> > > +
> > > +	ret = sn65dsi83_parse_lvds_endpoint(ctx, CHANNEL_A);
> > > +	if (ret < 0)
> > > +		return ret;
> > >   	ctx->lvds_dual_link = false;
> > >   	ctx->lvds_dual_link_even_odd_swap = false;
> > > @@ -587,6 +724,10 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
> > >   		struct device_node *port2, *port3;
> > >   		int dual_link;
> > > +		ret = sn65dsi83_parse_lvds_endpoint(ctx, CHANNEL_B);
> > > +		if (ret < 0)
> > > +			return ret;
> > > +
> > >   		port2 = of_graph_get_port_by_id(dev->of_node, 2);
> > >   		port3 = of_graph_get_port_by_id(dev->of_node, 3);
> > >   		dual_link = drm_of_lvds_get_dual_link_pixel_order(port2, port3);
> > > -- 
> > > 2.34.1
> > > 
> > 

-- 
With best wishes
Dmitry
