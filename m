Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B3A757CA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 21:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB46D6E822;
	Thu, 25 Jul 2019 19:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 043EB6E822
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 19:25:13 +0000 (UTC)
Received: from localhost (p5486CDF3.dip0.t-ipconnect.de [84.134.205.243])
 by pokefinder.org (Postfix) with ESMTPSA id 8B57C4A1209;
 Thu, 25 Jul 2019 21:25:11 +0200 (CEST)
Date: Thu, 25 Jul 2019 21:25:11 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v3 2/7] drivers: Introduce device lookup variants by
 of_node
Message-ID: <20190725192510.GA1440@kunai>
References: <20190723221838.12024-1-suzuki.poulose@arm.com>
 <20190723221838.12024-3-suzuki.poulose@arm.com>
MIME-Version: 1.0
In-Reply-To: <20190723221838.12024-3-suzuki.poulose@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Andrew Lunn <andrew@lunn.ch>, Thor Thayer <thor.thayer@linux.intel.com>,
 rafael@kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-fpga@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-rockchip@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, David Airlie <airlied@linux.ie>,
 Jiri Slaby <jslaby@suse.com>, devicetree@vger.kernel.org,
 Alan Tull <atull@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, gregkh@linuxfoundation.org,
 Takashi Iwai <tiwai@suse.com>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Peter Rosin <peda@axentia.se>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: multipart/mixed; boundary="===============0504195354=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0504195354==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2019 at 11:18:33PM +0100, Suzuki K Poulose wrote:
> Introduce wrappers for {bus/driver/class}_find_device() to
> locate devices by its of_node.
>=20
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: devicetree@vger.kernel.org
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-spi@vger.kernel.org
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Alan Tull <atull@kernel.org>
> Cc: Moritz Fischer <mdf@kernel.org>
> Cc: linux-fpga@vger.kernel.org
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Heiner Kallweit <hkallweit1@gmail.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Thor Thayer <thor.thayer@linux.intel.com>
> Cc: Jiri Slaby <jslaby@suse.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Peter Rosin <peda@axentia.se>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  - Dropped the reviewed-by tags from Thor, Mark, Andrew and Peter as the
>    patches are mereged, though there are no functional changes.

Acked-by: Wolfram Sang <wsa@the-dreams.de> # I2C part


--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl06AhIACgkQFA3kzBSg
KbZNIA/9HLsMnNVbTacVYltjXILzMKZYQ0kihekXpZMQbl+jlUgeNb0ge8XrGl47
3ssjlN6wpc7uMNy9T6ScDTjzESHgvFKzKssjfoJ5fp+MDd3KFChbvSmLmm5vVOGc
VjnjK+ls5meWoG4XdmJuqzlYbdnHOBI/7di4xhfzgN5TvJOjs83YHr7peNVJQgjv
gTYT2flkrgONnfGKofDGJ4Bk60xOOT/w6oYY3CkzLxbKkaUd5BiIJriXCcKYVNXd
uLLv5bw/yoU6Smilkgaq8ZdKSbid6VUbXul2Xi6/EEaxQX4Isvx3XNlplBogeAsB
Jy39hEz2I+UEQHfWNKAIVJJSWyMH/HxwuGYeHB6e9pLqF93rBbXZla+/Uu+u00yW
BzThKuVHqdQ4FDSbeLz69vJgjvStNgDG/XcYn9PbGtkPiSIrIDJbH1Wq8Wk/PKLX
XvYAUkM5O/PYp0K4oS6G+7SmDPMLoCCem1PGJsN9QkWfV4b05MtFQFRvRE/voO7Z
IeUCD1KiM4RUDNd6f9n7DM25OxMtwknJIbT7wuLjDe2KvPvF8/FTI2u2pY0GMaJe
QZ1uZsSqL7qIUxud5DdTNEyIHgjJDybwyYs/abejIwxMK/tbyl3CiKC2ozg7pc0y
myVXYa1A9Ecw3n86cwAqQON/rD/j1Bw+dQ/I85BaWBgSb1rPjzI=
=uZDa
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--

--===============0504195354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0504195354==--
