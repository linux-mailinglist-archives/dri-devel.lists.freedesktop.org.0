Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7103BABC838
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 22:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE5810E552;
	Mon, 19 May 2025 20:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="LhMjZc/h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEBC10E503
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 20:15:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 421C043A33;
 Mon, 19 May 2025 20:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1747685703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VWHzGM/W/wjUc/bgNZxqSEV2qgSI0H1pzntZFKFd7BY=;
 b=LhMjZc/hapeY3aN86R6FVZcQDp0vt8PRhYvnTZTktXkVbot+0eOGtK4PfH2gPUXl3/Qh8l
 zbPcnPS8ygiwADYj+PqSW4e7pOYTY35aPxxNwXyLMedfvirVXKv4vw5dNTop9m8hLIY5vS
 K6Oo83ObW3B39uuxiM/AVQqf9uEhr0ICppOas2ruivqerSTa7zALhqDZNCXYL/X4R/VHxU
 Lc7zj60lQNMpgE3N30trodZ1mikpXEtqtYhy3UXDRk5sTWf1rMA7YUhlaGE//Gcm0VgBNu
 9y0PJosTR4MjU63bWvswM2o5GdB1ZoC7ZMFOZwP9XdsxNt+7a0wCGkjV20m2kw==
Date: Mon, 19 May 2025 22:15:00 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, Jingoo
 Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, Tony Lindgren
 <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>, Jean-Jacques Hiblot
 <jjhiblot@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Saravana Kannan
 <saravanak@google.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>
Subject: Re: [PATCH v5] backlight: led-backlight: add devlink to supplier LEDs
Message-ID: <20250519221500.1796d4be@booty>
In-Reply-To: <20250519174729.44fa1f7b@bootlin.com>
References: <20250519-led-backlight-add-devlink-to-supplier-class-device-v5-1-76d6fd4aeb2f@bootlin.com>
 <20250519174729.44fa1f7b@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddvfeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfetudeugfehheeliefhjeejuddvledtuddttdevledthfehgeeugfetheekgfffnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghltheskhgvrhhnvghlrdhorhhgpdhrtghpt
 hhtohepjhhinhhgohhohhgrnhdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvlhhlvghrsehgmhigrdguvgdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomhdprhgtphhtthhopehprghvvghlsehutgifrdgtiidprhgtphhtthhopehjjhhhihgslhhothesthhirdgtohhm
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

Hi Herv=C3=A9,

On Mon, 19 May 2025 17:47:29 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi Luca,
>=20
> On Mon, 19 May 2025 17:16:39 +0200
> Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>=20
> ...
>=20
> > diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight=
/led_bl.c
> > index d2db157b2c290adc3a159023e9e2394fc877388c..8fe645b5b75447d009e1045=
dcf0c62d3bbc5425e 100644
> > --- a/drivers/video/backlight/led_bl.c
> > +++ b/drivers/video/backlight/led_bl.c
> > @@ -209,6 +209,19 @@ static int led_bl_probe(struct platform_device *pd=
ev)
> >  		return PTR_ERR(priv->bl_dev);
> >  	}
> > =20
> > +	for (i =3D 0; i < priv->nb_leds; i++) {
> > +		struct device_link *link;
> > +
> > +		link =3D device_link_add(&pdev->dev, priv->leds[0]->dev->parent, =20
>=20
> It should be priv->leds[i]->dev->parent instead of leds[0], shouldn't it?

Ah, well spotted, thanks!

My led-backlight device only uses one LED, so I hadn't noticed during
testing.

v6 on its way.

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
