Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA844A9FC7C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 23:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E0410E29E;
	Mon, 28 Apr 2025 21:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="LV0tZSB6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB2210E115;
 Mon, 28 Apr 2025 15:25:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC76741E0D;
 Mon, 28 Apr 2025 15:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745853912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hN9Ynenyf1lRwHEK1Ce+hj/6WjWz5+RthwslvM5GjFo=;
 b=LV0tZSB62q9TVFOERPpjO3INFWfz2QMz0oWE+LlhDcLv9EgOWZ7NQ5eLzpn3F8Mzrgl1e3
 nNK9OtTJ1ht4xvXuIW7jZkttywFk7xJK1wXH6DeT9gKSLK2Iyur1Jw275KFjuE/jAOm7BB
 cCMTHsvVHX4v2dGFMoRyVfT4/iThms1irlOHZt3KTM9ytNFzFkn6gljWTBL7iqNte8EpZ4
 SfF39hJSM8ArCDoKhd8wPfZUWZ2CTfqqjd0JKkWt49+2kE4Y9h8iMDRWSwQDWeEgqA0jhC
 H8khpWMEI7piNFV0f0373e9AG1/Pz9kSsOS/Q/sXMeefskBk4KQMnNoOb4YfMQ==
Date: Mon, 28 Apr 2025 17:24:57 +0200
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
 Kozlowski <krzk@kernel.org>
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
 Adam Ford <aford173@gmail.com>, Adrien Grassein
 <adrien.grassein@gmail.com>, Aleksandr Mishin <amishin@t-argos.ru>, Andy
 Yan <andy.yan@rock-chips.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benson Leung
 <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, Christoph
 Fritz <chf.fritz@googlemail.com>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Detlev Casanova
 <detlev.casanova@collabora.com>, Dharma Balasubiramani
 <dharma.b@microchip.com>, Guenter Roeck <groeck@chromium.org>, Heiko
 Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>, Janne
 Grunau <j@jannau.net>, Jerome Brunet <jbrunet@baylibre.com>, Jesse Van
 Gavere <jesseevg@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Kieran
 Bingham <kieran.bingham+renesas@ideasonboard.com>, Liu Ying
 <victor.liu@nxp.com>, Manikandan Muralidharan <manikandan.m@microchip.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Phong LE
 <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, Sugar Zhang
 <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, Tomi
 Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Vitalii Mordan
 <mordan@ispras.ru>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Hans de Goede <hdegoede@redhat.com>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>, Dmitry
 Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Rob Herring (Arm)"
 <robh@kernel.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>, Pin-yen Lin
 <treapking@chromium.org>, Xin Ji <xji@analogixsemi.com>, Aradhya Bhatia
 <a-bhatia1@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Ian
 Ray <ian.ray@ge.com>, Martyn Welch <martyn.welch@collabora.co.uk>, Peter
 Senna Tschudin <peter.senna@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Herve Codina <herve.codina@bootlin.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Inki Dae <inki.dae@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Helge Deller
 <deller@gmx.de>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mcanal@igalia.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v2 00/34] drm: convert all bridges to
 devm_drm_bridge_alloc()
Message-ID: <20250428172457.23e23df5@booty>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddviedufedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvddtuedtfefgueehiefhjeeiffekudfhgfdtledvffekhfegteduieejveevteehnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtkedprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgp
 dhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Approved-At: Mon, 28 Apr 2025 21:45:29 +0000
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

Hi Maxime, other DRM maintainers,

On Thu, 24 Apr 2025 20:59:07 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> devm_drm_bridge_alloc() [0] is the new API to allocate and initialize a D=
RM
> bridge, and the only one supported from now on. It is also necessary for
> implementing reference counting and thus needed to support removal of
> bridges from a still existing DRM pipeline without use-after-free.
>=20
> This series converts all DRM bridges to the new API.
>=20
> Patch 1 uses a coccinelle semantic patch to mass-convert some of those
> drivers -- thanks Maxime for having suggested the patch that served as a
> starting point for me. I was unable to come up with a better patch
> converting more drivers though, so I converted all others manually. Most =
of
> them were trivial. I left the non-trivial ones at the end of the series to
> help reviewers know where to look at more carefully.
>=20
> Due to the large number of touched files, the list of recipients generated
> by get_maintainers (b4 actually) was huge, 60~70 people (not counting
> mailing lists), so I took the liberty of trimming the list as reasonably =
as
> I could to DRM maintainers and frequent contributors, and added all other
> recipients individually per-patch. I hope this is fine. Don't hesitate to
> suggest more people which should be Cc-ed in a future series, or a better
> Cc policy.
>=20
> Current plan and status of the DRM bridge refcounting work:
>=20
>  A. =E2=9C=94 add new alloc API and refcounting -> (now in drm-misc-next)
>  B. =E2=9E=9C convert all bridge drivers to new API (this series)
>  C. =E2=80=A6 documentation, kunit tests, debugfs improvements (v1 under =
discussion)
>  D. after (B), add get/put to drm_bridge_add/remove() + attach/detech()
>  E. after (B), convert accessors; this is a large work and can be done
>     in chunks
>=20
> Luca
>=20
> [0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e=
629b715ea3d1ba537ef2da95eec
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Maintaining this long series is quite painful. Do you think at least
patches with a R-by or T-by tag could be merged before I send v3, so we
can relieve the maintenance effort, mail servers, and everybody's
inboxes?

Otherwise I could split this series in parts somewhat arbitrarily, but
that is an additional work on its own and is not a perfect solution as
it would not provide the big picture.

Best regards,
Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
