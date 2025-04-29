Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA54AA0414
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 09:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2509210E304;
	Tue, 29 Apr 2025 07:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fcJKYscB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124C110E2E8;
 Tue, 29 Apr 2025 07:08:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22CA543A5D;
 Tue, 29 Apr 2025 07:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745910488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kd3lI03kG0Wm60ssPsZRZZBpZE8tAduMDQ2Hf34LlN8=;
 b=fcJKYscBr/b/jTAU/vdTWM1YVAZaQiKZf9U4AtTZtpc5ho823NHoDeZMuLwHQVD5ogMz4d
 l4pHVstABt7F5anu7rX+Is4pzCVclLJyVW2RUnk7sXHFitWtcyzJ1ZDZppcaYxqIMmzxD2
 Sfc1sxFBGdTgBwDEHAPbC2rd0KV+kllYzYprQVDyppacSAp3Fkyy+/iDCZutuZh3ARu+US
 34h4mqj6xj55AWEBMBTArFMS0lwr+TdUdaA1KbDVw07BZOaEQry3xl1MPhcnU/8hzfGqQG
 6tTsndglheT+XJYQtJe0j1GjXXfJp3D7sz7UMZVYzpF8m9ZxqhKhClOsZxv+aQ==
Date: Tue, 29 Apr 2025 09:07:59 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, Paul
 Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui
 Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 chrome-platform@lists.linux.dev, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, Adam Ford <aford173@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>, Aleksandr Mishin
 <amishin@t-argos.ru>, Andy Yan <andy.yan@rock-chips.com>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>, Benson Leung
 <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, Christoph
 Fritz <chf.fritz@googlemail.com>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Detlev Casanova
 <detlev.casanova@collabora.com>, Dharma Balasubiramani
 <dharma.b@microchip.com>, Guenter Roeck <groeck@chromium.org>, Heiko
 Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>, Janne
 Grunau <j@jannau.net>, Jerome Brunet <jbrunet@baylibre.com>, Jesse Van
 Gavere <jesseevg@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Kieran
 Bingham <kieran.bingham+renesas@ideasonboard.com>, Manikandan Muralidharan
 <manikandan.m@microchip.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Phong LE
 <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, Sugar Zhang
 <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, Tomi
 Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Vitalii Mordan
 <mordan@ispras.ru>
Subject: Re: [PATCH v2 01/34] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
Message-ID: <20250429090759.3a6e87bc@booty>
In-Reply-To: <810dc089-4789-4efb-a88f-4ab8da1519d4@nxp.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
 <810dc089-4789-4efb-a88f-4ab8da1519d4@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepieekpdhrtghpthhtohepvhhitghtohhrrdhlihhusehngihprdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Hello Liu,

On Tue, 29 Apr 2025 10:19:27 +0800
Liu Ying <victor.liu@nxp.com> wrote:

[...]

> > diff --git a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
> > index f072c6ed39ef183b10518b43bd6d979bc89e36f9..8069c4881e9058f5462f99116799b589bd52b19e 100644
> > --- a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
> > +++ b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
> > @@ -59,9 +59,10 @@ struct drm_bridge *devm_imx_drm_legacy_bridge(struct device *dev,
> >  	struct imx_legacy_bridge *imx_bridge;
> >  	int ret;
> >  
> > -	imx_bridge = devm_kzalloc(dev, sizeof(*imx_bridge), GFP_KERNEL);
> > -	if (!imx_bridge)
> > -		return ERR_PTR(-ENOMEM);
> > +	imx_bridge = devm_drm_bridge_alloc(dev, struct imx_legacy_bridge,
> > +					   base, &imx_legacy_bridge_funcs);
> > +	if (IS_ERR(imx_bridge))
> > +		return PTR_ERR(imx_bridge);
> >  
> >  	ret = of_get_drm_display_mode(np,
> >  				      &imx_bridge->mode,
> > @@ -71,8 +72,6 @@ struct drm_bridge *devm_imx_drm_legacy_bridge(struct device *dev,
> >  		return ERR_PTR(ret);
> >  
> >  	imx_bridge->mode.type |= DRM_MODE_TYPE_DRIVER;
> > -  
> 
> Nit: Can you please leave this blank line undeleted?  And I see similar
> situations where lines are unnecessarily deleted by this patch, so this applies
> to the entire patch.

I agree some empty lines removals are not nice in this patch. However I
have no idea how to avoid that with spatch, so I'd have to redo [a part
of] the changes manually to avoid it. :-(

Anyway, those I spotted look quite innocuous. So I'll assume it is "OK
enough" as is, unless there are strong requests to do differently.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
