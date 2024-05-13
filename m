Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E75F8C42F2
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 16:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1883F10E121;
	Mon, 13 May 2024 14:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XJO9XN5Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E675910E121
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 14:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=jlJa
 l8SYd2i17p2UBb9eq6fm30hJKgO/pZI9iWerNak=; b=XJO9XN5Q7CPiPUGC4vat
 Lb8eZwOYw9kdc26MrFtTkkddag0HFeyIJ7qNTNsuz0+tt45Nd6puxrxtmLarm8xl
 wlen9O8o8gtZQdvfnptxz0ngAZrpR+w2RVk//4X4HORXsj/+81kap2ns++XrNg0D
 GyvZTHhI4kotws5rPjEXXn7qVSYh5loHD+pKWSifW2snnrD25lprGF6kF1Rz98ec
 2Izw5FblLRz4e3w2RTlJFHiTHrrMeWYcG1E2OMmjNw1yGN9H1cCbYGq2BJegSQim
 XmCFhMdKCVJEPNJ25Jaz0Kxs7rElzBYeNXysARUWQHT4LPGo2ucWb3+7XyjKoufW
 cQ==
Received: (qmail 2174713 invoked from network); 13 May 2024 16:14:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 13 May 2024 16:14:01 +0200
X-UD-Smtp-Session: l3s3148p1@ino7f1YYqLZehhtP
Date: Mon, 13 May 2024 16:14:00 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
 Peter Korsgaard <peter.korsgaard@barco.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Vadim Pasternak <vadimp@nvidia.com>, Michael Shych <michaelsh@nvidia.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 linux-media@vger.kernel.org,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] i2c: mux: Remove class argument from i2c_mux_add_adapter()
Message-ID: <20240513141400.xgpy3euacuxj5i4b@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
 Peter Korsgaard <peter.korsgaard@barco.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Vadim Pasternak <vadimp@nvidia.com>,
 Michael Shych <michaelsh@nvidia.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 linux-media@vger.kernel.org,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <17145dc5-e68e-4566-bedf-251bebe36ebb@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6wk7u7gqu25scqer"
Content-Disposition: inline
In-Reply-To: <17145dc5-e68e-4566-bedf-251bebe36ebb@gmail.com>
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


--6wk7u7gqu25scqer
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 10:55:39PM +0200, Heiner Kallweit wrote:
> 99a741aa7a2d ("i2c: mux: gpio: remove support for class-based device
> instantiation") removed the last call to i2c_mux_add_adapter() with a
> non-null class argument. Therefore the class argument can be removed.
>=20
> Note: Class-based device instantiation is a legacy mechanism which
> shouldn't be used in new code, so we can rule out that this argument
> may be needed again in the future.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next (meaning for 6.10), thanks!


--6wk7u7gqu25scqer
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZCICgACgkQFA3kzBSg
Kbbe8w//cwbm6f8+HGi4nQvOvL3JrgaLg4ZnhG9F8mVOVa0qOigbq9Xm63XB+Bwb
eWOWzDsFfN5Pew2UN93LWZJ3hkdZE8swa5XePLn8N70E0nXGM6LtDdeWLp0Bcov6
fhIHD7GumaCgsmE2Cb3Scl9W0RoGkd2SKhcglPZirYVHhzq+uxoESEf4+Xu4DuTS
yUJymE20haysSkWQ0IU52CCl6O/ydL4TO8lhVFH2PtpMtsLfM4ABUHbFuYV9eObI
I3kO4WDHRpw9YpBolhVL8gqolwYPvviv+ry9v7XuGmlZWCOty+gngCA42pvE5+Ns
aenK/c5Q/eQ99qjZgbZr0Zg+NbsCyHW4/Ye+3AlkcwoGYXweaxEwssvpeODwoGLC
Txjs1XzzE+c7OPPmjlLcLh0Hq9jKlqRzbFyF5834yLVb/Rqkx8eohrFDP5TSLlE2
Lw1NoLgqYyXjX+OpU2ZWIl/rxM4EB1RAOgW2yaV5x+B+dAQwuKY7ilapSNNQQOGl
bHKpuF462TB2eyrixx2Ns+IBT7CaCLYmxzV/QAW9VW9VPWSpjM5x8SiOSs/cE4zf
w7FskHexCXqEMau+UCXP0htz+haZ2cZSdIVOYphXgNNzhRb/i0EQu9HMiDBBRZns
gh4yy9eGV31++lc+iD8wFODnmjkbw+vDEvv980jTG7G2W7xqC+c=
=dQwU
-----END PGP SIGNATURE-----

--6wk7u7gqu25scqer--
