Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DA09EE302
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 10:28:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0833410ED13;
	Thu, 12 Dec 2024 09:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OL6XONrD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D122C10ED13
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 09:28:10 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb7so410900e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 01:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733995689; x=1734600489; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=v5iP5AU3SA0S+hiA5JyXG9Ea3JabKZiFBzzi/FEYEOg=;
 b=OL6XONrDVK5ySqFQ7VPtav0dyeu0E0ZHvc5oLIg2b5vFndoaK9Njuotb4i8skmLCtL
 WDDaStitKym/pVCU3gFHOm5Z96qRBuxnBLdlg9GddNRnLvq9KlOc5+WsvpTCNzcWOO3d
 BCRCEBLRq6IKpvG7l6nXYL/xPTy9WcAxPhERk/hNR1b7+ccH1h0K3bNiIj8PkhSt3FZr
 T1MqUscodqiS6KtwzknD1DUg04TnrSyi/Ma/sfpY2klHzroB6TdiZj0mVuTkCAMzKCeV
 NvhgXPK5wQviMNuHVMDy8vkn0bc6SANo17hW3xpf4lFvrH5YNeEIu4UedmpBmeNunCJM
 10gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733995689; x=1734600489;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v5iP5AU3SA0S+hiA5JyXG9Ea3JabKZiFBzzi/FEYEOg=;
 b=Oi/ysAM3ijkbhW2HmS/FJPNK8rJbQ0S9gEGWPbTtqVflNS5DlaGVlk7FKMvdoEkKl0
 JFukKfXaH0/Ydt6sSEYhExn2U8AoXTghQoC7fS30z66TAQHKbm8mW9TZqskb5j9Qw3OL
 iEbwUclVujYRGaypf6PqrmYUSxGp5dHj51WzBKI5etCgLEIu1Oju9QURf1GvkV0VDXZc
 xgKp9whsSyJWHgsHg+KBEN+uXyXteH/mwiSGVmHYsaQioDMvjV3MF6poYFZgr/QNLZYN
 C13u9pVpCjW/LveEGNk/iJUEPLg5SKkYKQaXU6K8JMiMRVATyalNdSmLo1psfrK8NYrL
 /M2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgKl26swtpEuX0VYJON7u9cdydvIF3dfOQDzOMGYQCqi6RjHTcBjgH43WZaRvYL5s4noGJzFUc7gA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZ3Uyf+4Hb6a1Tizs79z7zZ1V3bMpreaLC42SnqiFVHq5G1hqN
 zWN43u2eCoVq+ERUBTLCyLMxR0cTzxk0cEQ/tclLUxztfOfr6vEror76riqN+VA=
X-Gm-Gg: ASbGncs67WQE3rU4jz0USkBnzVLwLi6xsnqUUK30eazMvmJYCOJXxeMGS+lpLEP4XdM
 frsjtRKDromRKTMH8wp1TUg3vPKEtAxf+9gZg4quQlR2pT2MOz24aljL9r0H9PAFh8dix6tLLOZ
 VbcqsGDGgQVnH6OegbqwaXpMCR6/0Adn9DPGH/yGkLo0jp2MvsAFDWVmqU+jrtNH/NwtLD+H6Nl
 VVRPE+Gdc2ACX+sqsVL48FHCr4W6QNapZYEiVSXffcqKVQpEHoJLEbn4Uq15so8rkqpINjjHG5u
 /5WilOzVN5EMW3gPuNn0bsmm8KANPibYH4lM
X-Google-Smtp-Source: AGHT+IE/c4vmh6Af7M2ezdVQBUbGSoAXhcgHS6YHWy6ChO5TB4L/GFRn3bRfqOKlrST4WI+JDw4ang==
X-Received: by 2002:a05:6512:3984:b0:540:21d6:d679 with SMTP id
 2adb3069b0e04-54032c3b44bmr214346e87.31.1733995689018; 
 Thu, 12 Dec 2024 01:28:09 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401a3bc85asm1518271e87.206.2024.12.12.01.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 01:28:07 -0800 (PST)
Date: Thu, 12 Dec 2024 11:28:05 +0200
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
Subject: Re: [PATCH v5 2/3] drm/bridge: ti-sn65dsi83: Add ti,lvds-vod-swing
 optional properties
Message-ID: <roxosjotsh65dkecrwhhtlhkhqseezkj7ydk532shc27irzmd3@xry3ggjdq4uo>
References: <20241210091901.83028-1-andrej.picej@norik.com>
 <20241210091901.83028-3-andrej.picej@norik.com>
 <irpmhq7vxjra6vhmdh7p63ajj57n3h2c4br3ija2jmwtoewist@zyxfmx6k5m4e>
 <aa2de99d-21f4-4843-83b7-5d2db78be86f@norik.com>
 <qhmsobin3fsmoc7ic2jtancowfscoauyroruxdpwhmqwlogtkz@6by3s2ruwzwp>
 <519cc025-0782-4f96-a169-1fe87b280173@norik.com>
 <rputm4gnjj6nb66ix7dqbxr2janltia6rlb6zunhf7x3mgooxw@o3lblnyp5cci>
 <ad8843d6-e5a3-437a-af4d-f2248b247a65@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad8843d6-e5a3-437a-af4d-f2248b247a65@norik.com>
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

On Thu, Dec 12, 2024 at 09:08:03AM +0100, Andrej Picej wrote:
> 
> 
> On 12. 12. 24 00:04, Dmitry Baryshkov wrote:
> > On Wed, Dec 11, 2024 at 08:57:17AM +0100, Andrej Picej wrote:
> > > 
> > > 
> > > On 10. 12. 24 14:59, Dmitry Baryshkov wrote:
> > > > On Tue, Dec 10, 2024 at 02:41:01PM +0100, Andrej Picej wrote:
> > > > > 
> > > > > 
> > > > > On 10. 12. 24 12:43, Dmitry Baryshkov wrote:
> > > > > > On Tue, Dec 10, 2024 at 10:19:00AM +0100, Andrej Picej wrote:
> > > > > > > Add a optional properties to change LVDS output voltage. This should not
> > > > > > > be static as this depends mainly on the connected display voltage
> > > > > > > requirement. We have three properties:
> > > > > > > - "ti,lvds-termination-ohms", which sets near end termination,
> > > > > > > - "ti,lvds-vod-swing-data-microvolt" and
> > > > > > > - "ti,lvds-vod-swing-clock-microvolt" which both set LVDS differential
> > > > > > > output voltage for data and clock lanes. They are defined as an array
> > > > > > > with min and max values. The appropriate bitfield will be set if
> > > > > > > selected constraints can be met.
> > > > > > > 
> > > > > > > If "ti,lvds-termination-ohms" is not defined the default of 200 Ohm near
> > > > > > > end termination will be used. Selecting only one:
> > > > > > > "ti,lvds-vod-swing-data-microvolt" or
> > > > > > > "ti,lvds-vod-swing-clock-microvolt" can be done, but the output voltage
> > > > > > > constraint for only data/clock lanes will be met. Setting both is
> > > > > > > recommended.
> > > > > > > 
> > > > > > > Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> > > > > > > ---
> > > > > > > Changes in v5:
> > > > > > > - specify default values in sn65dsi83_parse_lvds_endpoint,
> > > > > > > - move sn65dsi83_parse_lvds_endpoint for channel B up, outside if,
> > > > > > > Changes in v4:
> > > > > > > - fix typo in commit message bitfiled -> bitfield
> > > > > > > - use arrays (lvds_vod_swing_conf and lvds_term_conf) in private data, instead
> > > > > > > of separate variables for channel A/B
> > > > > > > - add more checks on return value of "of_property_read_u32_array"
> > > > > > > Changes in v3:
> > > > > > > - use microvolts for default array values 1000 mV -> 1000000 uV.
> > > > > > > Changes in v2:
> > > > > > > - use datasheet tables to get the proper configuration
> > > > > > > - since major change was done change the authorship to myself
> > > > > > > ---
> > > > > > >     drivers/gpu/drm/bridge/ti-sn65dsi83.c | 142 +++++++++++++++++++++++++-
> > > > > > >     1 file changed, 139 insertions(+), 3 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > > > > > index 57a7ed13f996..f9578b38da28 100644
> > > > > > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > > > > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > > > > > @@ -132,6 +132,16 @@
> > > > > > >     #define  REG_IRQ_STAT_CHA_SOT_BIT_ERR		BIT(2)
> > > > > > >     #define  REG_IRQ_STAT_CHA_PLL_UNLOCK		BIT(0)
> > > > > > > +enum sn65dsi83_channel {
> > > > > > > +	CHANNEL_A,
> > > > > > > +	CHANNEL_B
> > > > > > > +};
> > > > > > > +
> > > > > > > +enum sn65dsi83_lvds_term {
> > > > > > > +	OHM_100,
> > > > > > > +	OHM_200
> > > > > > > +};
> > > > > > > +
> > > > > > >     enum sn65dsi83_model {
> > > > > > >     	MODEL_SN65DSI83,
> > > > > > >     	MODEL_SN65DSI84,
> > > > > > > @@ -147,6 +157,8 @@ struct sn65dsi83 {
> > > > > > >     	struct regulator		*vcc;
> > > > > > >     	bool				lvds_dual_link;
> > > > > > >     	bool				lvds_dual_link_even_odd_swap;
> > > > > > > +	int				lvds_vod_swing_conf[2];
> > > > > > > +	int				lvds_term_conf[2];
> > > > > > >     };
> > > > > > >     static const struct regmap_range sn65dsi83_readable_ranges[] = {
> > > > > > > @@ -237,6 +249,36 @@ static const struct regmap_config sn65dsi83_regmap_config = {
> > > > > > >     	.max_register = REG_IRQ_STAT,
> > > > > > >     };
> > > > > > > +static const int lvds_vod_swing_data_table[2][4][2] = {
> > > > > > > +	{	/* 100 Ohm */
> > > > > > > +		{ 180000, 313000 },
> > > > > > > +		{ 215000, 372000 },
> > > > > > > +		{ 250000, 430000 },
> > > > > > > +		{ 290000, 488000 },
> > > > > > > +	},
> > > > > > > +	{	/* 200 Ohm */
> > > > > > > +		{ 150000, 261000 },
> > > > > > > +		{ 200000, 346000 },
> > > > > > > +		{ 250000, 428000 },
> > > > > > > +		{ 300000, 511000 },
> > > > > > > +	},
> > > > > > > +};
> > > > > > > +
> > > > > > > +static const int lvds_vod_swing_clock_table[2][4][2] = {
> > > > > > > +	{	/* 100 Ohm */
> > > > > > > +		{ 140000, 244000 },
> > > > > > > +		{ 168000, 290000 },
> > > > > > > +		{ 195000, 335000 },
> > > > > > > +		{ 226000, 381000 },
> > > > > > > +	},
> > > > > > > +	{	/* 200 Ohm */
> > > > > > > +		{ 117000, 204000 },
> > > > > > > +		{ 156000, 270000 },
> > > > > > > +		{ 195000, 334000 },
> > > > > > > +		{ 234000, 399000 },
> > > > > > > +	},
> > > > > > > +};
> > > > > > > +
> > > > > > >     static struct sn65dsi83 *bridge_to_sn65dsi83(struct drm_bridge *bridge)
> > > > > > >     {
> > > > > > >     	return container_of(bridge, struct sn65dsi83, bridge);
> > > > > > > @@ -435,12 +477,16 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
> > > > > > >     		val |= REG_LVDS_FMT_LVDS_LINK_CFG;
> > > > > > >     	regmap_write(ctx->regmap, REG_LVDS_FMT, val);
> > > > > > > -	regmap_write(ctx->regmap, REG_LVDS_VCOM, 0x05);
> > > > > > > +	regmap_write(ctx->regmap, REG_LVDS_VCOM,
> > > > > > > +			REG_LVDS_VCOM_CHA_LVDS_VOD_SWING(ctx->lvds_vod_swing_conf[CHANNEL_A]) |
> > > > > > > +			REG_LVDS_VCOM_CHB_LVDS_VOD_SWING(ctx->lvds_vod_swing_conf[CHANNEL_B]));
> > > > > > >     	regmap_write(ctx->regmap, REG_LVDS_LANE,
> > > > > > >     		     (ctx->lvds_dual_link_even_odd_swap ?
> > > > > > >     		      REG_LVDS_LANE_EVEN_ODD_SWAP : 0) |
> > > > > > > -		     REG_LVDS_LANE_CHA_LVDS_TERM |
> > > > > > > -		     REG_LVDS_LANE_CHB_LVDS_TERM);
> > > > > > > +		     (ctx->lvds_term_conf[CHANNEL_A] ?
> > > > > > > +			  REG_LVDS_LANE_CHA_LVDS_TERM : 0) |
> > > > > > > +		     (ctx->lvds_term_conf[CHANNEL_B] ?
> > > > > > > +			  REG_LVDS_LANE_CHB_LVDS_TERM : 0));
> > > > > > >     	regmap_write(ctx->regmap, REG_LVDS_CM, 0x00);
> > > > > > >     	le16val = cpu_to_le16(mode->hdisplay);
> > > > > > > @@ -576,10 +622,100 @@ static const struct drm_bridge_funcs sn65dsi83_funcs = {
> > > > > > >     	.atomic_get_input_bus_fmts = sn65dsi83_atomic_get_input_bus_fmts,
> > > > > > >     };
> > > > > > > +static int sn65dsi83_select_lvds_vod_swing(struct device *dev,
> > > > > > > +	u32 lvds_vod_swing_data[2], u32 lvds_vod_swing_clk[2], u8 lvds_term)
> > > > > > > +{
> > > > > > > +	int i;
> > > > > > > +
> > > > > > > +	for (i = 0; i <= 3; i++) {
> > > > > > > +		if (lvds_vod_swing_data_table[lvds_term][i][0] >= lvds_vod_swing_data[0] &&
> > > > > > > +		lvds_vod_swing_data_table[lvds_term][i][1] <= lvds_vod_swing_data[1] &&
> > > > > > > +		lvds_vod_swing_clock_table[lvds_term][i][0] >= lvds_vod_swing_clk[0] &&
> > > > > > > +		lvds_vod_swing_clock_table[lvds_term][i][1] <= lvds_vod_swing_clk[1])
> > > > > > > +			return i;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	dev_err(dev, "failed to find appropriate LVDS_VOD_SWING configuration\n");
> > > > > > > +	return -EINVAL;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int sn65dsi83_parse_lvds_endpoint(struct sn65dsi83 *ctx, int channel)
> > > > > > > +{
> > > > > > > +	struct device *dev = ctx->dev;
> > > > > > > +	struct device_node *endpoint;
> > > > > > > +	int endpoint_reg;
> > > > > > > +	/* Set so the property can be freely selected if not defined */
> > > > > > > +	u32 lvds_vod_swing_data[2] = { 0, 1000000 };
> > > > > > > +	u32 lvds_vod_swing_clk[2] = { 0, 1000000 };
> > > > > > > +	u32 lvds_term;
> > > > > > > +	u8 lvds_term_conf = 0x1;
> > > > > > > +	int lvds_vod_swing_conf = 0x1;
> > > > > > 
> > > > > > Magic values
> > > > > 
> > > > > Can you please elaborate.
> > > > > 
> > > > > I can use:
> > > > > u8 lvds_term_conf = OHM_200;
> > > > > 
> > > > > What about lvds_vod_swing_conf? Should I create additional define for it?
> > > > > But this doesn't solve a hidden meaning? Maybe additional comment above?
> > > > > Would like to avoid using voltages for it, since then we are reverse
> > > > > engineering the table in datasheet to match the default reg value.
> > > > 
> > > > I think the following example solves both problems:
> > > > 
> > > > lvds_term = 200;
> > > > of_property_read_u32(..., &lvds_term);
> > > > 
> > > > if (lvds_term == 100)
> > > > 	ctx->lvds_term_conf[channel] = OHM_100;
> > > > else if (lvds_term == 200)
> > > > 	ctx->lvds_term_conf[channel] = OHM_200;
> > > > else
> > > > 	return -EINVAL;
> > > > 
> > > > The same approach can be applied to lvds_vod_swing_conf, resulting in
> > > > removal of magic values.
> > > 
> > > Sorry, but I think it is not that easy when it comes to the
> > > lvds_vod_swing_conf. We should assign default value if
> > > "ti,lvds-vod-swing-data-microvolt" and "ti,lvds-vod-swing-clock-microvolt"
> > > are not defined. Default value of the lvds_vod_swing_conf is 0x1, but this
> > > doesn't have any straight forward meaning like OHM_200 for example.
> > > 
> > > What we can do in that case is that we copy the values from defined
> > > datasheet tables to the "lvds_vod_swing_data[2]" and "lvds_vod_swing_clk[2]"
> > > arrays and then run the
> > > sn65dsi83_select_lvds_vod_swing with it, which will return the default value
> > > (0x1).
> > > 
> > > /* If both properties are not defined assign default limits */
> > > if (ret_data && ret_clock) {
> > > 	memcpy(lvds_vod_swing_data,
> > > 	     lvds_vod_swing_data_table[ctx->lvds_term_conf[channel]][1],
> > > 	     sizeof(lvds_vod_swing_data));
> > > 	memcpy(lvds_vod_swing_clk,
> > > 	    lvds_vod_swing_clock_table[ctx->lvds_term_conf[channel]][1],
> > > 	    sizeof(lvds_vod_swing_clk));
> > > }
> > > lvds_vod_swing_conf = sn65dsi83_select_lvds_vod_swing(dev,
> > > 	lvds_vod_swing_data, lvds_vod_swing_clk,
> > > 	ctx->lvds_term_conf[channel]);
> > > if (lvds_vod_swing_conf < 0) {
> > > 	ret = lvds_vod_swing_conf;
> > > 	goto exit;
> > > }
> > > 
> > > ctx->lvds_vod_swing_conf[channel] = lvds_vod_swing_conf;
> > > 
> > > I'm not sure if using this approach gets rid of the problem with magic
> > > values.
> > > Or maybe I'm not seeing the obvious solution so please bear with me.
> > 
> > Yes, the defaults (0..1000000) should be fixed to result in the same
> > value (0x01) as if the property wasn't specified at all
> 
> The defaults (0..1000000) is selected because in case if only one property
> is defined in dts (ti,lvds-vod-swing-data-microvolt or
> ti,lvds-vod-swing-clock-microvolt) the other array values don't effect the
> decision which "lvds_vod_swing_conf" is selected. That's why we initialized
> the array to be out off bounds of the datasheet tables, all values in the
> table match the not defined property, so lvds_vod_swing_conf is selected
> purely on the basis of the defined property.

I see, thanks for the explanation.

> 
> Example:
> DTS
> ti,lvds-vod-swing-data-microvolt = <250000 428000>;
> //ti,lvds-vod-swing-clock-microvolt NOT DEFINED;
> 
> After parsing the devicetree we will get:
> lvds_vod_swing_data = [ 250000, 428000 ]
> lvds_vod_swing_clk = [ 0, 1000000 ]
> 
> In sn65dsi83_select_lvds_vod_swing lvds_vod_swing_clk[] values don't effect
> the decision making since
> 
> lvds_vod_swing_clock_table[lvds_term][i][0] >= lvds_vod_swing_clk[0] &&
> lvds_vod_swing_clock_table[lvds_term][i][1] <= lvds_vod_swing_clk[1]
> 
> is always true.
> 
> > 
> > I think the following should work:
> > 
> > 	/* artifical values to select the defaults in both cases */
> > 	u32 lvds_vod_swing_data[2] = { 190000, 330000 };
> > 	u32 lvds_vod_swing_clk[2] = { 150000, 250000 };
> 
> This sets the default to 0x0. It should be:
> u32 lvds_vod_swing_data[2] = { 200000, 372000 };
> u32 lvds_vod_swing_clk[2] = { 156000, 290000 };
> This selects the default 0x1 in both cases, if termination is 100 or 200
> Ohms.
> 
> Nevertheless I think I got your point. But I would still like to give the
> user the freedom to only specify one property if maybe connected panel only
> has limits on data lanes/clock lane.
> So maybe set the arrays lvds_vod_swing_data/clk to [0, 1000000] if
> of_property_read_u32_array returns -EINVAL (property does not exist).
> What do you say?

After your explanation, I think it might be better to explicitly set the
value to 0x1, but not at the top of the function, but next to a check
that both properties are (not) set.

> 
> > 
> > Yes, they are artificial, as stated in the comment. Yes, I think it's
> > better than special-casing in the property handling.
> > 

-- 
With best wishes
Dmitry
