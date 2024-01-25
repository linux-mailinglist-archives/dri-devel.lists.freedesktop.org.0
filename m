Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A35483CD7E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 21:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DD810E97F;
	Thu, 25 Jan 2024 20:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626F110E97F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 20:32:34 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rT6M4-0007oq-4x; Thu, 25 Jan 2024 21:29:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rT6Ly-002MWh-9O; Thu, 25 Jan 2024 21:29:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rT6Ly-0087Xo-0R;
 Thu, 25 Jan 2024 21:29:38 +0100
Date: Thu, 25 Jan 2024 21:29:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH v5 003/111] pwm: Provide a macro to get the parent device
 of a given chip
Message-ID: <e3xeos2rtfydqj3hz3ql7xkon3aa3aingww7q5lpb3xa4arqrs@6jgwfrgay4le>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <1cae6f73264ab313205eaa9483251f7aaf259cb4.1706182805.git.u.kleine-koenig@pengutronix.de>
 <c89cbecf-253d-4a2c-8782-304b7b620175@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qxr7wcriw2tz34lp"
Content-Disposition: inline
In-Reply-To: <c89cbecf-253d-4a2c-8782-304b7b620175@broadcom.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Douglas Anderson <dianders@chromium.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-amlogic@lists.infradead.org,
 Guenter Roeck <groeck@chromium.org>, linux-riscv@lists.infradead.org,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-staging@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-mips@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Johan Hovold <johan@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 greybus-dev@lists.linaro.org, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Benson Leung <bleung@chromium.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Alex Elder <elder@kernel.org>,
 Scott Branden <sbranden@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qxr7wcriw2tz34lp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 11:32:47AM -0800, Florian Fainelli wrote:
> On 1/25/24 04:08, Uwe Kleine-K=F6nig wrote:
> > Currently a pwm_chip stores in its struct device *dev member a pointer
> > to the parent device. Preparing a change that embeds a full struct
> > device in struct pwm_chip, this accessor macro should be used in all
> > drivers directly accessing chip->dev now. This way struct pwm_chip and
> > this macro can be changed without having to touch all drivers in the
> > same change set.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Nit: this is not a macro but an inline function.

Oh right, it used to be a macro, but I changed that. I made the commit
log read:

    pwm: Provide an inline function to get the parent device of a given chip

    Currently a pwm_chip stores in its struct device *dev member a pointer
    to the parent device. Preparing a change that embeds a full struct
    device in struct pwm_chip, this accessor function should be used in all
    drivers directly accessing chip->dev now. This way struct pwm_chip and
    this new function can be changed without having to touch all drivers in
    the same change set.

Thanks,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qxr7wcriw2tz34lp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWyxLEACgkQj4D7WH0S
/k5nkwf9F+1G1rrz7HMmMk0kkol6Q/0nb8baCUPdKhCcHXWnUrkFf+l8BvLEafhy
6D5c/214tles7OGu5Mgkku0rW4Ae8+sq9Ho2OEJEpVsSuULPwv3+L44VQzZgsjD6
ULcEcc1vul0iOpwJ0bTHeMqX+P3OENhi72tUDh+NQNnml8ZgePsTI2Ef8agexXAb
7GLAE/AnRbi3bqcn5XzmIjskyMJfwOT4AvyHWPzzM1sGWfGPOiDp8e2cQXNsUywY
IZ1X1op4Eax4/Yg/DB2uED0doQLAwJct5JLN/G+Dfx6EReTyA39z64IHPuxNmCXA
REKDvLe8LO4A9v/JIUQuiwXHBcbjLQ==
=k1zn
-----END PGP SIGNATURE-----

--qxr7wcriw2tz34lp--
