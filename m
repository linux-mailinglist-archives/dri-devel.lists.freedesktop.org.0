Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1B3AA51D6
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 18:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC8310E7F6;
	Wed, 30 Apr 2025 16:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="R78+NOp5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CA810E7F6;
 Wed, 30 Apr 2025 16:42:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BA1E43B4C;
 Wed, 30 Apr 2025 16:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1746031343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bpjn8puFQ4rZGChqXBtSZDUYu+Gnq25CP/ziHwcqLbg=;
 b=R78+NOp5gZIYtuRu5VllzkmYwx7C4ExRP6oGMuj+y1Pous6ww+7Ql2UM7ZVR3eAlcgxjhe
 EL8gclRNV+2dQKCHLAwdz+o8e56pdOmAiN7cV69NhlIZ1Qg0rsw+h7L9j1342ejfKdHVKD
 uE60s+5+nsGoETsCeR1S1VmV/agvwj5nqxaJnNF7Lp4/7VVVRHJA5YBJi9V4npOFPIuj/Y
 GYnhX6Vi++Zo8p3uGplK/jU12s6/vcqsRHpTUVKPOD8igRoMeiILoeJRB7IcyZ7wXP/otR
 dWt4vNk84a/q5dbz7ZmTEiiyrfsjSALHZCtQKQ9krgHLd9WIsAwh58D1xVRdnQ==
Date: Wed, 30 Apr 2025 18:42:14 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Anusha
 Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
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
 <mordan@ispras.ru>
Subject: Re: [PATCH v2 01/34] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
Message-ID: <20250430184214.0b53dc6b@booty>
In-Reply-To: <CAD=FV=UBFhCGOUuwtCtdT75nCu_7EzM-SVY-=6Xh6UxUuxKCMw@mail.gmail.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
 <CAD=FV=VmV5yb0HWWGTiKyyC8+WNPJpM7vE9PQGh5_=KPk6+HCg@mail.gmail.com>
 <20250430123557.3d8b1de4@booty>
 <CAD=FV=UBFhCGOUuwtCtdT75nCu_7EzM-SVY-=6Xh6UxUuxKCMw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfetudeugfehheeliefhjeejuddvledtuddttdevledthfehgeeugfetheekgfffnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepieekpdhrtghpthhtohepughirghnuggvrhhssegthhhrohhmihhumhdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghru
 geskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
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

Hello Doug,

On Wed, 30 Apr 2025 08:51:52 -0700
Doug Anderson <dianders@chromium.org> wrote:

> Hi,
>=20
> On Wed, Apr 30, 2025 at 3:36=E2=80=AFAM Luca Ceresoli <luca.ceresoli@boot=
lin.com> wrote:
> >
> > Hello Doug,
> >
> > On Mon, 28 Apr 2025 13:59:50 -0700
> > Doug Anderson <dianders@chromium.org> wrote:
> >
> > [...]
> > =20
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640
> > > Tested-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640 =
=20
> >
> > Thank you for your review!
> >
> > However I'll be sending v3 with some differences w.r.t. v2, in order to
> > fix the 3 bugs reported by Andy Yan plus a similar one I spotted. The
> > fix just is replacing PTR_ERR() with ERR_CAST() in the 4 cases where the
> > involved function is returning a pointer instead of an int.
> >
> > Your review/test tags appear global to the whole patch, thus being the
> > patch different I think I cannot include your tags in v3.
> >
> > Let me know if you think I should do differently.
> >
> > Sorry about that. =20
>=20
> It's fine if you want to drop my tag. I didn't have time to review the
> whole thing but I felt like I should at least review the drivers I'm
> signed up as a reviewer for. That being said, I'm not counting tags or
> anything so I'm not offended if they're dropped.
>=20
> My understanding is that the hashtag at the end is at least a
> semi-standard way to say that my tag only applies to a small part of
> the patch, so it seems like it would be OK to carry it, though...

Oh dear. I was so stupid. I had not seen the comment in your tag
lines... :-|

So it's fine, I'll keep your tags as the parade driver is not modified
in v3.

Sorry about the noise.

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
