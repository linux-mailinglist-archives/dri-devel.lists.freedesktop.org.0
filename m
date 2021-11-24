Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F0145CEE6
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 22:29:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7DF6E7D9;
	Wed, 24 Nov 2021 21:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F4A6E7D9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 21:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637789325;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=xop8XlZAoTl1OV6De+uWk96yVRTl49IvEavBZ+QQ5D8=;
 b=Uwz7zEyjAeqLxi9rLNp+UFq4MsyxKzi7QkPnpc2pGHFiO8JhKtRdo8wp2o13YFoKBq
 37cJ53heBEu6lWTok97mTx4G+cBK+wHHGw3hS+PPlLrVO3bhsdz/optzLemsZ/xE83PL
 RzKZpdRE8vk+pLu38IQmJnMSq91MI0SPjo7nYUF1R/j8IFzFYyP888YYfszhH1l3RvRk
 hlxOx+fKSDd0SNhm9hVh0oz7OaniTAEvrGV2nHXPcnenkd9F+S9U6eRy1Ug93Y0c/J4z
 1bPDa4+oO/3jLqTDVIsIy+pFwodt/Q7ob47mCdqYN1NC+Ew9J4+EoZ7TdIoqRy5F5+t6
 6Euw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3jsN+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.34.10 DYNA|AUTH)
 with ESMTPSA id e05ed8xAOLSi5Al
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 24 Nov 2021 22:28:44 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v8 4/8] drm/ingenic: Add dw-hdmi driver for jz4780
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <DIA33R.QE29K7RKLI2C1@crapouillou.net>
Date: Wed, 24 Nov 2021 22:28:43 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <D5272A7B-8943-4AB9-8705-1EC4E9891C1D@goldelico.com>
References: <cover.1637691240.git.hns@goldelico.com>
 <64c6ab288d4d7159f633c860f1b23b3395491ae1.1637691240.git.hns@goldelico.com>
 <GTJ13R.RSQAWZX83DUZ2@crapouillou.net>
 <016973B0-B7F0-4E63-BF4F-2643611A6351@goldelico.com>
 <DIA33R.QE29K7RKLI2C1@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,


>>> You probably should disable the regulator (if not NULL) here.
>> Indeed. Would it be ok to make struct regulator *regulator static
>> or do we need dynamically allocated memory?
>=20
> static non-const is almost always a bad idea, so avoid it.

Well some years ago it was a perfectly simple solution that still =
works...
But I asked because I had a lot of doubt.

>=20
> You can either:
>=20
> - create a "ingenic_dw_hdmi" struct that will contain a pointer to =
dw_hdmi and a pointer to the regulator. Instanciate it in the probe with =
devm_kzalloc() and set the pointers, then set it as the driver data =
(platform_set_drvdata). In the remove function you can then obtain the =
pointer to your ingenic_dw_hdmi struct with platform_get_drvdata(), and =
you can remove the dw_hdmi and unregister the regulator.
>=20
> - register cleanup functions, using devm_add_action_or_reset(dev, f, =
priv). When it's time to cleanup, the kernel core will call f(priv) =
automatically. So you can add a small wrapper around dw_hdmi_remove() =
and another one around regulator_disable(), and those will be called =
automatically if your probe function fails, or when the driver is =
removed. Then you can completely remove the ".remove" callback. There =
are a few examples of these in the ingenic-drm-drv.c if you want to take =
a look.

The second one turned out to be cleaner to handle special cases like if =
there is no regulator. We just register the disabler only if there is a =
regulator and enable succeeds.

So v9 is coming now.

BR and thanks,
Nikolaus

