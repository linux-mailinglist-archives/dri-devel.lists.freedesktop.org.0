Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BB2ABF7AE
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 16:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813E210E96A;
	Wed, 21 May 2025 14:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fYSLMVVs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A43210E98A;
 Wed, 21 May 2025 14:22:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FD7443B3F;
 Wed, 21 May 2025 14:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1747837350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vyPpXbcuqSIPDBMFEqspo4iXigHvW7uXfydpRN7Xbhk=;
 b=fYSLMVVsQYfpq0UfcQjtXHhEeq5bfCS6ZfFtSy9WALjrRzfOI1oCmQiRh9/p/2Tov1lqL6
 6hd7ysvk/ltTNuZ3CAlJ8hxNJb1U4hh9oDe0vFEV7Qmtyyl2jnGS6vHAh+CJjT02k5hPnx
 /8mrP78Ua2u8o332sEOuGFEL01a6KTHTgbKtJYOaO92+nm28+YzX+fKLT5azjlVWA6wd7P
 QGZK2iH33WbGHOFi2Bk+4Ix+bA6ASPEQH4bi0kJlvRry4ViIVwFyHbkOYow1fiiPEcPty3
 9UYIHe6MjbBN6AI7Wu+J/2jCVZHKny42qJOnl6aqWr/VeHDBSzrL8xxwzk+UAA==
Date: Wed, 21 May 2025 16:22:16 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
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
 Kozlowski <krzk@kernel.org>, Liu Ying <victor.liu@nxp.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski
 <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Louis Chauvet <louis.chauvet@bootlin.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Inki Dae <inki.dae@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>, Adam Ford
 <aford173@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>,
 Aleksandr Mishin <amishin@t-argos.ru>, Andy Yan <andy.yan@rock-chips.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Christoph Fritz <chf.fritz@googlemail.com>, Cristian Ciocaltea
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
Message-ID: <20250521162216.79dd3290@booty>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeffedtucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheelfeevlefgkeekvdffveehudeihfdtjefhieehgfejveduieffgffhjeejleevnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdhkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelhedprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhto
 hepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrgh
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

Hello Maxime, Shawn, Liu, all,

On Fri, 09 May 2025 15:53:26 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> devm_drm_bridge_alloc() [0] is the new API to allocate and initialize a DRM
> bridge, and the only one supported from now on. It is the first milestone
> towards removal of bridges from a still existing DRM pipeline without
> use-after-free.

I applied on drm-misc-next patches 3-17,20-21 as they match all the
criteria:
 - At least a Acked-by (or R-by maintainers)
 - patch is for drm-misc

Being my very first commits to drm-misc, I tried to be careful, and
double checked all the patches with Louis (thanks!).

Here are the pending questions and plan for the remaining patches.

>       Revert "drm/exynos: mic: convert to devm_drm_bridge_alloc() API"

This reverts the commit applied my mistake:
https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/91c5c7b5bb2dd09b43b025bce6d790d3c79f4518

Neither the  original patch nor the revert has been reviewed/acked.

As the commit was a mistake, I'm applying the revert by the end of this
week (i.e. on Friday) unless there are better instructions.

>       drm: convert many bridge drivers from devm_kzalloc() to devm_drm_bridge_alloc() API

This patch affects multiple drivers. Running get_maintainers.pl
points at Shawn Guo's repository. After reviewing the MAINTAINERS file,
this looks like due to the 'N:' line in:

ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
M:	Shawn Guo <shawnguo@kernel.org>
M:	Sascha Hauer <s.hauer@pengutronix.de>
R:	Pengutronix Kernel Team <kernel@pengutronix.de>
...
T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
N:	imx
...

(https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/MAINTAINERS?ref_type=heads#L2511-2528)

Here 'imx' matches the 'drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c'
file that is touched by the patch. That regexp appears overly generic to me.

Shawn, can it be fixed by making it less generic?

If not, can we at least add a band-aid 'X:' entry for
drivers/gpu/drm/bridge/imx?

I think the other matching entry is the one to consider:

DRM DRIVERS FOR FREESCALE IMX BRIDGE
M:	Liu Ying <victor.liu@nxp.com>
L:	dri-devel@lists.freedesktop.org
S:	Maintained
F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
F:	drivers/gpu/drm/bridge/imx/

(https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/MAINTAINERS?ref_type=heads#L7940-7948)

However it does not list any trees. I _guess_ drm-misc applies here as
a fallback as well as common sense.

Liu, should this entry have a 'T:' line for drm/misc?

>       drm/bridge: imx8qxp-pixel-combiner: convert to devm_drm_bridge_alloc() API

Not acked/reviewed, some discussion happened. I am resending it in v4,
possibly with updates based on the discussion.

But it has the same issue discussed above, with get_maintiners.pl
pointing at Shawn Guo's tree, so in the future I'm assuming this goes
to drm-misc unless there are news about that.

>       drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API

No feedback, resending in v4.

>       drm/todo: add entry to remove devm_drm_put_bridge()

This involves documentation maintained on another tree. Where should it
be applied? There are two matching entries in MAINTAINERS:

 * DRM DRIVERS -> the drm tree
 * DRM DRIVERS AND MISC GPU PATCHES -> the drm-misc tree

To me it looks like the second is obviously the closest match as we are
dealing with DRM bridges, so I'm applying this as well on Friday unless
there are better instructions.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
