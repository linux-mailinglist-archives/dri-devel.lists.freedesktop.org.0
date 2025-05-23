Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C7AAC23BA
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 15:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CAB610E7E1;
	Fri, 23 May 2025 13:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mZbEGMe2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E7510E7E1;
 Fri, 23 May 2025 13:23:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80E3043E92;
 Fri, 23 May 2025 13:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1748006596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PdDU2oRP8k2jUeSve/BOd06ch34w47FFumvJv+pxA64=;
 b=mZbEGMe25lkA6a1/A5PYNbESnCSL60bu6GbmptADGVwaEkiGNBcHGN8VrT72jRA/+HNkP4
 O/QwRUKwwl3xkt4gQ3Mrs7lKrRaKRz4fTUwt/DbNDv7ugEEzoi1dGDejSURTrPhZAOKVZL
 UYuYChVv7ASMlrgAyMynb3Hu9Ovs5zXPwNEjo60hL8sbBVmrDkv74b2ln1iasNoULv1Ksw
 tA2Y1gP38lTQKZNvYVM6ebTePuQP8PIROVBEJmhCXewn1NVtuepbzztVtobDhFgEQBqe6V
 8LOSAQYNXvNBh9HNPCzuX8wiU0bL+1nw3VrunFS4/yawaszCy5VqLmvRqmwd3g==
Date: Fri, 23 May 2025 15:23:04 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Inki Dae <daeinki@gmail.com>
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
 Kozlowski <krzk@kernel.org>, Liu Ying <victor.liu@nxp.com>, Anusha Srivatsa
 <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, Dmitry
 Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 chrome-platform@lists.linux.dev, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, Louis Chauvet
 <louis.chauvet@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Seung-Woo Kim
 <sw0312.kim@samsung.com>, Manikandan Muralidharan
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
Message-ID: <20250523152304.5c66e195@booty>
In-Reply-To: <CAAQKjZPX3iQgNhEydDZXMyC9BRuep7kL-XYEsjnkCxSt_1UsQg@mail.gmail.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250521162216.79dd3290@booty>
 <CAAQKjZPX3iQgNhEydDZXMyC9BRuep7kL-XYEsjnkCxSt_1UsQg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdekleeiucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvddtuedtfefgueehiefhjeeiffekudfhgfdtledvffekhfegteduieejveevteehnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepleehpdhrtghpthhtohepuggrvghinhhkihesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhin
 hhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
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

Hello Inki,

On Fri, 23 May 2025 00:11:24 +0900
Inki Dae <daeinki@gmail.com> wrote:

> Hello Luca Ceresoli,
>=20
> 2025=EB=85=84 5=EC=9B=94 21=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 11:23=
, Luca Ceresoli <luca.ceresoli@bootlin.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
> >
> > Hello Maxime, Shawn, Liu, all,
> >
> > On Fri, 09 May 2025 15:53:26 +0200
> > Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> > =20
> > > devm_drm_bridge_alloc() [0] is the new API to allocate and initialize=
 a DRM
> > > bridge, and the only one supported from now on. It is the first miles=
tone
> > > towards removal of bridges from a still existing DRM pipeline without
> > > use-after-free. =20
> >
> > I applied on drm-misc-next patches 3-17,20-21 as they match all the
> > criteria:
> >  - At least a Acked-by (or R-by maintainers)
> >  - patch is for drm-misc
> >
> > Being my very first commits to drm-misc, I tried to be careful, and
> > double checked all the patches with Louis (thanks!).
> >
> > Here are the pending questions and plan for the remaining patches.
> > =20
> > >       Revert "drm/exynos: mic: convert to devm_drm_bridge_alloc() API=
" =20
> >
> > This reverts the commit applied my mistake:
> > https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/91c5c7b5bb2dd09=
b43b025bce6d790d3c79f4518
> >
> > Neither the  original patch nor the revert has been reviewed/acked.
> >
> > As the commit was a mistake, I'm applying the revert by the end of this
> > week (i.e. on Friday) unless there are better instructions. =20
>=20
> Really sorry for late. I was made aware of it later through a
> colleague's remark. There is no need to proceed with the revert.
> Acked-by : Inki Dae <inki.dae@samsung.com>

Thanks for the feedback. As agreed with Maxime and approved by you, I'm
leaving the commit as is, without reverting and reapplying. Your
Acked-by is in the records anyway, so somehow reachable in case of need.

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
