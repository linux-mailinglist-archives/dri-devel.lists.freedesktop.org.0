Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84808288460
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 10:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D6E6EC72;
	Fri,  9 Oct 2020 08:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EFD6EC72
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 08:01:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 94CB6AC7D;
 Fri,  9 Oct 2020 08:01:09 +0000 (UTC)
Subject: Re: [PATCH 04/21] drm/aspeed: Set driver CMA functions with
 DRM_GEM_CMA_DRIVER_OPS
To: Joel Stanley <joel@jms.id.au>
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-5-tzimmermann@suse.de>
 <CACPK8XcGOAjocCMp9ubgQpfiBaqSj61i_frSU7ZdiKO_uSt-hQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <3df12a74-d8f3-d607-78ff-5a0f21e86cb9@suse.de>
Date: Fri, 9 Oct 2020 10:01:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcGOAjocCMp9ubgQpfiBaqSj61i_frSU7ZdiKO_uSt-hQ@mail.gmail.com>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, narmstrong@baylibre.com,
 David Airlie <airlied@linux.ie>, liviu.dudau@arm.com, philippe.cornu@st.com,
 paul@crapouillou.net, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 mihail.atanassov@arm.com, Sam Ravnborg <sam@ravnborg.org>,
 alexandre.torgue@st.com, Marek Vasut <marex@denx.de>, abrodkin@synopsys.com,
 Ludovic Desroches <ludovic.desroches@microchip.com>, xinliang.liu@linaro.org,
 kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com, james.qian.wang@arm.com,
 NXP Linux Team <linux-imx@nxp.com>, puck.chen@hisilicon.com,
 Sascha Hauer <s.hauer@pengutronix.de>, alison.wang@nxp.com, jsarha@ti.com,
 Chen-Yu Tsai <wens@csie.org>, vincent.abriou@st.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 yannick.fertre@st.com, kieran.bingham+renesas@ideasonboard.com,
 Kevin Hilman <khilman@baylibre.com>, zourongrong@gmail.com,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: multipart/mixed; boundary="===============1438274093=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1438274093==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="kEU4Rxxajn4ZvbdCL0rTaKlQlc7wSHFrL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kEU4Rxxajn4ZvbdCL0rTaKlQlc7wSHFrL
Content-Type: multipart/mixed; boundary="CDUXDnhrvNpujlj9uJXMumh8LxM8mJo5z";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Joel Stanley <joel@jms.id.au>
Cc: abrodkin@synopsys.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, james.qian.wang@arm.com,
 liviu.dudau@arm.com, mihail.atanassov@arm.com, brian.starkey@arm.com,
 Andrew Jeffery <andrew@aj.id.au>, Sam Ravnborg <sam@ravnborg.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, mripard@kernel.org,
 stefan@agner.ch, alison.wang@nxp.com, xinliang.liu@linaro.org,
 zourongrong@gmail.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 paul@crapouillou.net, Linus Walleij <linus.walleij@linaro.org>,
 narmstrong@baylibre.com, Kevin Hilman <khilman@baylibre.com>,
 Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 kieran.bingham+renesas@ideasonboard.com, benjamin.gaignard@linaro.org,
 vincent.abriou@st.com, yannick.fertre@st.com, philippe.cornu@st.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, alexandre.torgue@st.com,
 Chen-Yu Tsai <wens@csie.org>, jsarha@ti.com, tomi.valkeinen@ti.com,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, linux-aspeed
 <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Message-ID: <3df12a74-d8f3-d607-78ff-5a0f21e86cb9@suse.de>
Subject: Re: [PATCH 04/21] drm/aspeed: Set driver CMA functions with
 DRM_GEM_CMA_DRIVER_OPS
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-5-tzimmermann@suse.de>
 <CACPK8XcGOAjocCMp9ubgQpfiBaqSj61i_frSU7ZdiKO_uSt-hQ@mail.gmail.com>
In-Reply-To: <CACPK8XcGOAjocCMp9ubgQpfiBaqSj61i_frSU7ZdiKO_uSt-hQ@mail.gmail.com>

--CDUXDnhrvNpujlj9uJXMumh8LxM8mJo5z
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 09.10.20 um 09:54 schrieb Joel Stanley:
> On Fri, 22 May 2020 at 13:52, Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
>>
>> DRM_GEM_CMA_DRIVER_OPS sets the functions in struct drm_driver
>> to their defaults. No functional changes are made.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> I just found this in my inbox. I assume it has not been applied as you
> were after a review.

The patchset as a whole got an A-b and was merged a while ago.

>=20
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Nevertheless thanks for taking a look at the patch.

Best regards
Thomas

>=20
> I will apply it to drm-misc-next.
>=20
> Cheers,
>=20
> Joel
>=20
>> ---
>>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 7 +------
>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm=
/aspeed/aspeed_gfx_drv.c
>> index 6b27242b9ee3c..1167ff78e24a3 100644
>> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
>> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
>> @@ -188,12 +188,7 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
>>
>>  static struct drm_driver aspeed_gfx_driver =3D {
>>         .driver_features        =3D DRIVER_GEM | DRIVER_MODESET | DRIV=
ER_ATOMIC,
>> -       .gem_create_object      =3D drm_cma_gem_create_object_default_=
funcs,
>> -       .dumb_create            =3D drm_gem_cma_dumb_create,
>> -       .prime_handle_to_fd     =3D drm_gem_prime_handle_to_fd,
>> -       .prime_fd_to_handle     =3D drm_gem_prime_fd_to_handle,
>> -       .gem_prime_import_sg_table =3D drm_gem_cma_prime_import_sg_tab=
le,
>> -       .gem_prime_mmap         =3D drm_gem_prime_mmap,
>> +       DRM_GEM_CMA_DRIVER_OPS,
>>         .fops =3D &fops,
>>         .name =3D "aspeed-gfx-drm",
>>         .desc =3D "ASPEED GFX DRM",
>> --
>> 2.26.2
>>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--CDUXDnhrvNpujlj9uJXMumh8LxM8mJo5z--

--kEU4Rxxajn4ZvbdCL0rTaKlQlc7wSHFrL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl+AGMAUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPV+gf9FkOWZ4AJ4Ex25mOfleuQ49aLGMOY
bj6WHni0jINbT0azrK1LFXLA47JBitwcvYGleGaHIb09+Kk4PsiKBeMsCbaD+GRy
jP9AU6oKYsrw2BTC9z70XowgVQnZaiV5QD7cD5n+luZwlYPA/n6hp3FPXRb7uxER
Tiht1E7F/YV6TI0xA7OZwStI7ukX5/EJ1DNNFZx9j1aEYsvNtMBM41YiHUbONZqi
HKOToBxBlG8l3VaRwYX4QvXBzI7hdPxE1Z9OpkYIDChJCslOm/gh5EIaoLzN0iTh
0Q8rT/VLxbnbUTDGrYVdDfzav2fjWo/Cm7vE5PLbCPOYrHtMunMH53HzAA==
=TVfp
-----END PGP SIGNATURE-----

--kEU4Rxxajn4ZvbdCL0rTaKlQlc7wSHFrL--

--===============1438274093==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1438274093==--
