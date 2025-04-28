Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE35A9F3F9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 17:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6749D10E552;
	Mon, 28 Apr 2025 15:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="cTAHqyDf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4C310E584;
 Mon, 28 Apr 2025 15:00:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F84F4397F;
 Mon, 28 Apr 2025 15:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745852455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l/KM50XoeWonitoxoMaOHFeoOtZjamWkVO4Sfztxz2s=;
 b=cTAHqyDfWqZQRajnA0jCJJTRWgntMZ9qCGKU473NOxESwutCLvKkGP9L3GMlUIUf1TVfoJ
 rSml0e13bS9W5xL7vpWnRG/Gf8DwWyNIkXZ07glmnEui2hZC2Xoq/8/xjrvJp5r3ePSFuU
 njtoTq8LUpcrENa9NLXi3tWAr4COusan12TyNUvMZQZfaHrdfuVf/DcDoxsqC3HUZd6Oxa
 xFrGUT/PhDw09LZJgn+fTcnrJMlbI4kHX39u8mbqL16gwmh6HE2DuFmuNLvVbhBpuVI1WK
 hOs5l7kG8ZpIdaFhDwnEIRvdHjqsZaRpzN9lTpgipOlJKjv7cuiqF1qRk9Zf2g==
Date: Mon, 28 Apr 2025 17:00:45 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Andy Yan" <andyshrk@163.com>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Douglas
 Anderson" <dianders@chromium.org>, "Chun-Kuang Hu"
 <chunkuang.hu@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Anusha
 Srivatsa" <asrivats@redhat.com>, "Paul Kocialkowski" <paulk@sys-base.io>,
 "Dmitry Baryshkov" <lumag@kernel.org>, "Hui Pu" <Hui.Pu@gehealthcare.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 "Adam Ford" <aford173@gmail.com>, "Adrien Grassein"
 <adrien.grassein@gmail.com>, "Aleksandr Mishin" <amishin@t-argos.ru>, "Andy
 Yan" <andy.yan@rock-chips.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Benson Leung"
 <bleung@chromium.org>, "Biju Das" <biju.das.jz@bp.renesas.com>, "Christoph
 Fritz" <chf.fritz@googlemail.com>, "Cristian Ciocaltea"
 <cristian.ciocaltea@collabora.com>, "Detlev Casanova"
 <detlev.casanova@collabora.com>, "Dharma Balasubiramani"
 <dharma.b@microchip.com>, "Guenter Roeck" <groeck@chromium.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Jani Nikula" <jani.nikula@intel.com>, "Janne
 Grunau" <j@jannau.net>, "Jerome Brunet" <jbrunet@baylibre.com>, "Jesse Van
 Gavere" <jesseevg@gmail.com>, "Kevin Hilman" <khilman@baylibre.com>,
 "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Liu Ying"
 <victor.liu@nxp.com>, "Manikandan Muralidharan"
 <manikandan.m@microchip.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Phong
 LE" <ple@baylibre.com>, "Sasha Finkelstein" <fnkl.kernel@gmail.com>, "Sugar
 Zhang" <sugar.zhang@rock-chips.com>, "Sui Jingfeng"
 <sui.jingfeng@linux.dev>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Vitalii Mordan"
 <mordan@ispras.ru>
Subject: Re: [PATCH v2 01/34] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
Message-ID: <20250428170045.5ca315ce@booty>
In-Reply-To: <656e493e.a551.1967c6d0c53.Coremail.andyshrk@163.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
 <656e493e.a551.1967c6d0c53.Coremail.andyshrk@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepieelpdhrtghpthhtoheprghnugihshhhrhhkseduieefrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhg
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

Hallo Andy,

On Mon, 28 Apr 2025 20:44:03 +0800 (CST)
"Andy Yan" <andyshrk@163.com> wrote:

> Hi ,
> 
> At 2025-04-25 02:59:08, "Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:
> >devm_drm_bridge_alloc() is the new API to be used for allocating (and
> >partially initializing) a private driver struct embedding a struct
> >drm_bridge.
> >
> >For many drivers having a simple code flow in the probe function, this
> >commit does a mass conversion automatically with the following semantic
> >patch. The changes have been reviewed manually for correctness as well as
> >to find any false positives.
> >
> >  @@
> >  type T;
> >  identifier C;
> >  identifier BR;
> >  expression DEV;
> >  expression FUNCS;
> >  @@
> >  -T *C;
> >  +T *C;
> >   ...
> >  (
> >  -C = devm_kzalloc(DEV, ...);
> >  -if (!C)
> >  -    return -ENOMEM;
> >  +C = devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
> >  +if (IS_ERR(C))
> >  +     return PTR_ERR(C);
> >  |
> >  -C = devm_kzalloc(DEV, ...);
> >  -if (!C)
> >  -    return ERR_PTR(-ENOMEM);
> >  +C = devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
> >  +if (IS_ERR(C))
> >  +     return PTR_ERR(C);
> >  )
> >   ...
> >  -C->BR.funcs = FUNCS;
> >
> >Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

[...]

> >diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> >index 5e5f8c2f95be1f5c4633f1093b17a00f9425bb37..9b1dfdb5e7ee528c876c01916c9821d550cad679 100644
> >--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> >+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> >@@ -1045,9 +1045,10 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
> > 		return ERR_PTR(-ENODEV);
> > 	}
> > 
> >-	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> >-	if (!hdmi)
> >-		return ERR_PTR(-ENOMEM);
> >+	hdmi = devm_drm_bridge_alloc(dev, struct dw_hdmi_qp, bridge,
> >+				     &dw_hdmi_qp_bridge_funcs);
> >+	if (IS_ERR(hdmi))
> >+		return PTR_ERR(hdmi);  
> 
>            This should return hdmi or ERR_CAST(hdmi);

Indeed, thanks!

My coccinelle patch is clearly not clever enough. I'll see whether I
can fix it, otherwise I'll handle these 3 special cases manually, along
with another similar one (imx/imx-legacy-bridge.c) I just spotted after
your report.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
