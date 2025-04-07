Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2504BA7ECE9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 21:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7980F10E551;
	Mon,  7 Apr 2025 19:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Gi+8MJKk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BA510E551;
 Mon,  7 Apr 2025 19:27:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37D604421F;
 Mon,  7 Apr 2025 19:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744054065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cjEt/IPzaAdKLiLHC8nJ5ihJ1fjZFnzeMJstnBzp7XQ=;
 b=Gi+8MJKk54bvu0U11jHOJw08NvtnpAzunZzJXO4mlFlnzsLVy8DFQIv5f1cwemOl31f/in
 yXq1Um8EF62nuW+7K5/FANGhJKfIDt3FpxkAeF2Uw52NGHGgsgSLt5hId5UF1i3v6U7LiQ
 QV71SvnJzRB4Bv9Y0pBT6LtPqcjAci3aXj9uPyPUUIhwMeK2lXlaYCBe0svd+nHK7Htak4
 /9HotCk7aCwdmAu+N82j0bdVIG/9XNextLdkUXD3MPHCRUDF3rNzBb5f+B2kzx0rN1agcB
 y2M7EU6B7HGxiOcK1BDKg9fGTg+UZIk8/GVGNr8AJuzWT4pQ2/Cw+JF6m2DEKA==
Date: Mon, 7 Apr 2025 21:27:39 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
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
 Kozlowski <krzk@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Anusha Srivatsa <asrivats@redhat.com>, Paul
 Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 =?UTF-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, LKML
 <linux-kernel@vger.kernel.org>, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hans de Goede
 <hdegoede@redhat.com>
Subject: Re: [PATCH 02/34] platform: arm64: acer-aspire1-ec: convert to
 devm_drm_bridge_alloc() API
Message-ID: <20250407212739.1e991b6a@booty>
In-Reply-To: <a9000632-a6d1-d369-c317-9ee73aa645dc@linux.intel.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-2-42113ff8d9c0@bootlin.com>
 <a9000632-a6d1-d369-c317-9ee73aa645dc@linux.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvddtuedtfefgueehiefhjeeiffekudfhgfdtledvffekhfegteduieejveevteehnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeefpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigr
 dhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
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

Hello Ilpo,

On Mon, 7 Apr 2025 19:46:59 +0300 (EEST)
Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> wrote:

> On Mon, 7 Apr 2025, Luca Ceresoli wrote:
>=20
> > This is the new API for allocating DRM bridges.
> >=20
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >=20
> > ---
> >=20
> > Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
> > Cc: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > ---
> >  drivers/platform/arm64/acer-aspire1-ec.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/platform/arm64/acer-aspire1-ec.c b/drivers/platfor=
m/arm64/acer-aspire1-ec.c
> > index 958fe1bf5f85bb69ac7962f217de9f0b40cde9a1..438532a047e68799ac53a16=
a4c813fc16be997b9 100644
> > --- a/drivers/platform/arm64/acer-aspire1-ec.c
> > +++ b/drivers/platform/arm64/acer-aspire1-ec.c
> > @@ -452,9 +452,9 @@ static int aspire_ec_probe(struct i2c_client *clien=
t)
> >  	int ret;
> >  	u8 tmp;
> > =20
> > -	ec =3D devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> > -	if (!ec)
> > -		return -ENOMEM;
> > +	ec =3D devm_drm_bridge_alloc(dev, struct aspire_ec, bridge, &aspire_e=
c_bridge_funcs);
> > +	if (IS_ERR(ec))
> > +		return PTR_ERR(ec);
> > =20
> >  	ec->client =3D client;
> >  	i2c_set_clientdata(client, ec);
> > @@ -497,7 +497,6 @@ static int aspire_ec_probe(struct i2c_client *clien=
t)
> >  	fwnode =3D device_get_named_child_node(dev, "connector");
> >  	if (fwnode) {
> >  		INIT_WORK(&ec->work, aspire_ec_bridge_update_hpd_work);
> > -		ec->bridge.funcs =3D &aspire_ec_bridge_funcs;
> >  		ec->bridge.of_node =3D to_of_node(fwnode);
> >  		ec->bridge.ops =3D DRM_BRIDGE_OP_HPD;
> >  		ec->bridge.type =3D DRM_MODE_CONNECTOR_USB; =20
>=20
> Hi Luca,
>=20
> It took a while to locate where the code for the new helper is. I suggest=
=20
> if you need send another version of the series directly linking to the=20
> commit in the cover letter so that it won't take multiple hoops to find i=
t=20
> if one wants to review the code and is not having all drm trees easily at=
=20
> hand. Here it is for the benefit of other pdx86 people:
>=20
> https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b=
715ea3d1ba537ef2da95eec

Apologies, indeed you have a good point. I added the link to the cover
letter so it will be in v2, if any.

> Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

Thanks!

> I assume you want this to go through the drm tree where the helper alread=
y=20
> is?

MY best guess is that drm-misc-next is the appropriate branch, and it
is where the helper is already present, but I'll let maintainers decide
what is most appropriate.

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
