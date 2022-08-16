Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8005D59591A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 12:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533F712ABE8;
	Tue, 16 Aug 2022 10:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBD495898
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 10:59:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ACE7D6106F;
 Tue, 16 Aug 2022 10:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50996C433D6;
 Tue, 16 Aug 2022 10:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660647563;
 bh=Q14GK1ttq7bdP+vgMrGUxvdBjHDjlBElsRQ7/2qJ/QA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uy9Qbv1B+24CwNtwFT1jyubs/ylb9Egk9oGGmnFC+8IwME7fZgoLOETAICQIA3h2U
 ihGW4+ir2mvRyUlIsHeVK0lf9kqCcqU2p7oPskknfJIdUivw86e3YWm2tUX8gydppB
 LcfrRmcRQ8SQ1IBrjEv/ZdlahjM7/fsGSMywUcSu4uMZYnkIg7UL/A03zMoyLw3mu2
 P0WGFiHpiVfJ8dH6A8Bi8wtoWIKgKqKulvVtG8g2anDE9bO+p4QJGnEr6qYRaGWrNv
 O91BqmZ/HNK8e9h/qF8ptHxuIrX0IytbM6w9EMS7TvEi3IEGnxXVP4Zhal/weNUa37
 xgbPTSdQhylMA==
Date: Tue, 16 Aug 2022 12:59:19 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 0/6] i2c: Make remove callback return void
Message-ID: <Yvt4h3L8oPBGOIs9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-i2c@vger.kernel.org, kernel@pengutronix.de,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Pavel Machek <pavel@ucw.cz>,
 linux-leds@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 Sekhar Nori <nsekhar@ti.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Matt Johnston <matt@codeconstruct.com.au>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Crt Mori <cmo@melexis.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 Petr Machata <petrm@nvidia.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Luca Ceresoli <luca@lucaceresoli.net>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ajay Gupta <ajayg@nvidia.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Peter Rosin <peda@axentia.se>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Jean Delvare <jdelvare@suse.de>,
 Corey Minyard <cninyard@mvista.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
References: <20220815080230.37408-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0fosoJa+IeyaZHMB"
Content-Disposition: inline
In-Reply-To: <20220815080230.37408-1-u.kleine-koenig@pengutronix.de>
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
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Crt Mori <cmo@melexis.com>,
 Ajay Gupta <ajayg@nvidia.com>, David Airlie <airlied@linux.ie>,
 Peter Senna Tschudin <peter.senna@gmail.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, linux-i2c@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>,
 Matt Johnston <matt@codeconstruct.com.au>, Corey Minyard <cninyard@mvista.com>,
 linux-leds@vger.kernel.org, Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, kernel@pengutronix.de,
 Jean Delvare <jdelvare@suse.de>, Luca Ceresoli <luca@lucaceresoli.net>,
 Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Petr Machata <petrm@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Vladimir Oltean <olteanv@gmail.com>,
 Maximilian Luz <luzmaximilian@gmail.com>, Peter Rosin <peda@axentia.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--0fosoJa+IeyaZHMB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> As some conflicts are expected I sent this early after -rc1 such that it
> can be included early into next and be put on an immutable branch for
> subsystems to resolve merge conflicts.

I pushed the series out now, so it should hit -next tomorrow.

The immutable branch is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/make_remove_callback_void-immutable

Enjoy!


--0fosoJa+IeyaZHMB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL7eIMACgkQFA3kzBSg
KbaSSg//ZLEFXJ2AC4iQCquvREXL77sq8aBYuMF1drDpCKCcirvajM+cix8mBAAv
1RyNuz86FIJts0gipoB3pI5sWJFZUbyzrEe63PIS9ZJgoaXrhfpNnWtI7HS5dVpm
lY5AbbbG8lNBpzqjdSOrVYBgK7V4xgez/RPqHGM+zaStX2Hsfyqi1nk+qVhsBmhp
5ZrnP6Ccw6jjOaJCB9f1uuMLbqXY87PC++y6Dl9voZEfPJuW7Abv821n/sYhXc2Y
bdwh9f8eVbW7ImBR2pDcAUNKrTHT1QzRROkumB9uKQ+Tlljf7NhHleKjTuIsJJyL
GXaxTOcD0SEE71cuEmIKBeL3aKRFLGrklpKPiWtG6F5nuKFYeynOZf7cc/jBEF7Y
f7LtnW0yS9/oZEsLY2lbUW/OzzBF4Dk+CoqDV9TFcZgyPbpMuupDQa9soCE8P0MW
pRu7FCGH+zASyoerYPZ/HHEg9Y6v0VfhsBm71+utgP6HPEfBbLn/yE3xLvalbN58
bt7zDI5nyWScDcOHDwBqI4qwbYCrNPetiVVUoic2sl7ASDVNZe3jGcnr0fTpljSj
693qZgMk/tqzS2EI0eabivGDzXl/zp1qubjTqZJOsL/Nu1nIq5jIGFTfuo2LbnQb
2vw3h55QjleuUINeAkulhjcKtHGf1AS9A1vAJ9rB7skoivdhvWI=
=phI+
-----END PGP SIGNATURE-----

--0fosoJa+IeyaZHMB--
