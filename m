Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDEFAC05EC
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 09:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E249B315;
	Thu, 22 May 2025 07:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Ib3yNxEs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1EAC9E6AF;
 Thu, 22 May 2025 07:28:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A22DF43B77;
 Thu, 22 May 2025 07:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1747898917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4JY0tOi4vZjkrIAmVNhcdxDZ/2M98xTujKUJaASQzHI=;
 b=Ib3yNxEs/5s44AFOE1RwGqaQ3/C/qZgn2d71AFEvZWt7k9cSiTL6woWNrw80/K+W6/Z/V7
 kPpQoV2bzFWLRmpCywhJlPQUEg2FXlo+1nPIaf5l0cpBMiAzN9raixCTiTWtHG2MAT2dvw
 sQ/zOcBmUvR5DU4gtyDa+MzbOlcDIse1XjwVI+yIroFSWP+dFmY21GxXL7/XktKyaWOIPe
 yff37LPcs4+KyUCuNN9KOzfcxdlETTCBb1PO57HImPoi3YGPlPgcnozmejJeah9bwmPEng
 p+dHgqDtnYmeAW4q5nFCbFmQTz/G7k6Pz/kBamcKo+eZpnfao0DUC72lv/PdQQ==
Date: Thu, 22 May 2025 09:28:24 +0200
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
 linux-stm32@st-md-mailman.stormreply.com, Louis Chauvet
 <louis.chauvet@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, Inki
 Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Manikandan Muralidharan
 <manikandan.m@microchip.com>, Adam Ford <aford173@gmail.com>, Adrien
 Grassein <adrien.grassein@gmail.com>, Aleksandr Mishin
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
 Bingham <kieran.bingham+renesas@ideasonboard.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Phong LE
 <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, Sugar Zhang
 <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, Tomi
 Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Vitalii Mordan
 <mordan@ispras.ru>, "Rob Herring (Arm)" <robh@kernel.org>, Hsin-Te Yuan
 <yuanhsinte@chromium.org>, Pin-yen Lin <treapking@chromium.org>, Xin Ji
 <xji@analogixsemi.com>, Aradhya Bhatia <a-bhatia1@ti.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Peter Senna Tschudin
 <peter.senna@gmail.com>, Helge Deller <deller@gmx.de>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Michal Simek
 <michal.simek@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 00/22] drm: convert all bridges to
 devm_drm_bridge_alloc()
Message-ID: <20250522092824.421e766c@booty>
In-Reply-To: <36ade269-a590-4243-889c-006f37d9ae6e@nxp.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250521162216.79dd3290@booty>
 <36ade269-a590-4243-889c-006f37d9ae6e@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehfeeiucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeetffdtleehgefhffffudekhfdujeeuvdefhfetleeftefgffekjeetjedtvdevnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepleehpdhrtghpthhtohepvhhitghtohhrrdhlihhusehngihprdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidri
 hhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhg
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

On Thu, 22 May 2025 11:20:17 +0800
Liu Ying <victor.liu@nxp.com> wrote:

> > If not, can we at least add a band-aid 'X:' entry for
> > drivers/gpu/drm/bridge/imx?
> > 
> > I think the other matching entry is the one to consider:
> > 
> > DRM DRIVERS FOR FREESCALE IMX BRIDGE
> > M:	Liu Ying <victor.liu@nxp.com>
> > L:	dri-devel@lists.freedesktop.org
> > S:	Maintained
> > F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> > F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> > F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
> > F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
> > F:	drivers/gpu/drm/bridge/imx/
> > 
> > (https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/MAINTAINERS?ref_type=heads#L7940-7948)
> > 
> > However it does not list any trees. I _guess_ drm-misc applies here as
> > a fallback as well as common sense.
> > 
> > Liu, should this entry have a 'T:' line for drm/misc?  
> 
> These bridge drivers also don't have a 'T:' line:
> 
> DRM DRIVER FOR CHIPONE ICN6211 MIPI-DSI to RGB CONVERTER BRIDGE
> DRM DRIVER FOR PARADE PS8640 BRIDGE CHIP
> DRM DRIVER FOR TI DLPC3433 MIPI DSI TO DMD BRIDGE
> DRM DRIVER FOR TI SN65DSI86 BRIDGE CHIP
> LONTIUM LT8912B MIPI TO HDMI BRIDGE
> MEGACHIPS STDPXXXX-GE-B850V3-FW LVDS/DP++ BRIDGES
> MICROCHIP SAM9x7-COMPATIBLE LVDS CONTROLLER
> 
> I think that they fallback to drm-misc since "DRM DRIVERS FOR BRIDGE CHIPS"
> covers them.  I don't have strong opinion on adding a "T" line to them, at
> least to "DRM DRIVERS FOR FREESCALE IMX BRIDGE".  Anyway, it would be good
> to know comments from maintainers for "DRM DRIVERS FOR BRIDGE CHIPS" and
> "DRM DRIVERS".

I agree the fallback seems OK for this MAINTAINERS entry.

The other entry (ARM/FREESCALE IMX / MXC ARM ARCHITECTURE) is another
story.

> >>       drm/bridge: imx8qxp-pixel-combiner: convert to devm_drm_bridge_alloc() API  
> > 
> > Not acked/reviewed, some discussion happened. I am resending it in v4,
> > possibly with updates based on the discussion.  
> 
> I still think the main structures in imx8qxp-pixel-combiner.c and imx*-ldb.c
> should have the same lifetime with the allocated bridges.  I added a new
> comment on this driver in v2 just now.

Thanks, let's continue the conversation there.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
