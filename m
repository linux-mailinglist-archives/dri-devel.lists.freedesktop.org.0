Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C08C1AB8F7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 08:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587526EAE8;
	Thu, 16 Apr 2020 06:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9C96EAC6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 06:42:53 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id BE3AB7D6;
 Thu, 16 Apr 2020 02:42:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 16 Apr 2020 02:42:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=qCRyzl00MQBivzL68vkel39NEbd
 7kC6dFuyLRxBAey0=; b=Mz6xjOhoyl6u3JLJF3XNH/WDRWC0mCT6w/uiIwB8GXd
 UpxsH9oudz3X48RMKQfGJbGVDAHug8ZXney1LdfZdZRq90LqW1W0/A6iVYMtK1mN
 EU59olTzwMNiYltMNJBPysQF0H63fbn5e/tsDm+LApzpl9Y1Sw18AZHKdzIsmaEf
 9+M1vvWOyW669ZVwQQ7awZo8Cj7vc6UYa6yBhQm8s+v3rqgHnFf6xakj6sV5HtJy
 j8vNj53XWuWvnoqroGZji7jvJbTKs9v3cgxRMfEEZdJgii7uQdjwtKHH0A6lf3I6
 8ffKsfT/ph6VFQvi+fA3JKKLi4LFnglOMoqGVSlscBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qCRyzl
 00MQBivzL68vkel39NEbd7kC6dFuyLRxBAey0=; b=eMPRhPF78n2AJHUnF3n8N7
 nDj6R2uaCMywF1zqUJb8H41DWXRLIqM1X1ixKQ+5du5Sep0O62e5Zg70DW4miS5c
 q+6UZlgUneRQ5zBCZRQTn2+qXHpcWSINUMIVtTQcMv4fBlmNQ0cDxvod+yis2IMy
 Qn9LgZrrIPxvZU1tIvrIvajwPmKsY2XzJGObIt+ux8BDMn9VQLisIuN1sQagIjTc
 2yVfkg9fn7+7uqJ5UWxMBZLYc2drb5gpFG/CrUVannsfz1vkv8nOhZz7tV+2yvw0
 Ini85WXCVW9bOz1VY1ANTmk22DTeHV41NcnSM3ax/Ybs4KlWFUPVQUigEqOYYq4Q
 ==
X-ME-Sender: <xms:ZP6XXpgBOuLk6y78w-8QXnLsPxfPb8tJCQV-nhCw3w9E3J6Z_6umzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeeggdduudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ZP6XXlHUnHhPoyiEoNq4uvG-eeIU9F7rJ3L8YM4tBAlhX9jwZlg92Q>
 <xmx:ZP6XXgxO_UPW-eCgOnJDSb4q6E6_zvBdAp-UhPR4OHFshAivUQ-klg>
 <xmx:ZP6XXkq3F6zITJzf5EbL-eKRftc0jlz2H_3d673Bq8y2Zr17XFw4_g>
 <xmx:Z_6XXi9WoWOt_JDiBWjK2eTP19mseq86rp4c8pS9eo_D669xJmpieNKZPV8>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 59AE0328005E;
 Thu, 16 Apr 2020 02:42:44 -0400 (EDT)
Date: Thu, 16 Apr 2020 08:42:42 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: Clean-up schema indentation formatting
Message-ID: <20200416064242.azdjulo76ymwgpfq@gilmour.lan>
References: <20200416005549.9683-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200416005549.9683-1-robh@kernel.org>
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 linux-riscv@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, alsa-devel@alsa-project.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Content-Type: multipart/mixed; boundary="===============0230517782=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0230517782==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s675c5ai5d6avmtq"
Content-Disposition: inline


--s675c5ai5d6avmtq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2020 at 07:55:48PM -0500, Rob Herring wrote:
> Fix various inconsistencies in schema indentation. Most of these are
> list indentation which should be 2 spaces more than the start of the
> enclosing keyword. This doesn't matter functionally, but affects running
> scripts which do transforms on the schema files.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

For allwinner,
Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--s675c5ai5d6avmtq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXpf+YgAKCRDj7w1vZxhR
xZmqAPwLCqvPnd6KBgcsRgWmwe8BxcsE0xhduyc59wNSaliiHQEAhUMizDtya0EL
yGrmpfvuS8/nRsvbMHGM2twyMWfc6QE=
=F+e6
-----END PGP SIGNATURE-----

--s675c5ai5d6avmtq--

--===============0230517782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0230517782==--
