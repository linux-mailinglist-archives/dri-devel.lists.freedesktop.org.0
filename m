Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E2328852B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 10:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891A36E17E;
	Fri,  9 Oct 2020 08:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF15E6E17E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 08:26:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 60324AC7D;
 Fri,  9 Oct 2020 08:26:32 +0000 (UTC)
Subject: Re: [PATCH 04/21] drm/aspeed: Set driver CMA functions with
 DRM_GEM_CMA_DRIVER_OPS
To: Joel Stanley <joel@jms.id.au>
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-5-tzimmermann@suse.de>
 <CACPK8XcGOAjocCMp9ubgQpfiBaqSj61i_frSU7ZdiKO_uSt-hQ@mail.gmail.com>
 <3df12a74-d8f3-d607-78ff-5a0f21e86cb9@suse.de>
 <CACPK8XcAXrf6ySuWo4izjD4EU6tMSULs0tP4cy-+TA35PSOUgw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <c3419660-770c-dadd-21bd-9a6dc0e10a8d@suse.de>
Date: Fri, 9 Oct 2020 10:26:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcAXrf6ySuWo4izjD4EU6tMSULs0tP4cy-+TA35PSOUgw@mail.gmail.com>
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
 David Airlie <airlied@linux.ie>, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 paul@crapouillou.net, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 mihail.atanassov@arm.com, Sam Ravnborg <sam@ravnborg.org>,
 Marek Vasut <marex@denx.de>, Kevin Hilman <khilman@baylibre.com>,
 abrodkin@synopsys.com, kong.kongxinwei@hisilicon.com, xinliang.liu@linaro.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>, tomi.valkeinen@ti.com,
 james.qian.wang@arm.com, NXP Linux Team <linux-imx@nxp.com>,
 alexandre.torgue@st.com, puck.chen@hisilicon.com,
 Sascha Hauer <s.hauer@pengutronix.de>, alison.wang@nxp.com, jsarha@ti.com,
 Chen-Yu Tsai <wens@csie.org>, vincent.abriou@st.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 philippe.cornu@st.com, yannick.fertre@st.com,
 kieran.bingham+renesas@ideasonboard.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, zourongrong@gmail.com,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: multipart/mixed; boundary="===============0609344643=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0609344643==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3NZ5fJma6mDQhYsP8VYxGv9CRTuE4whb9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3NZ5fJma6mDQhYsP8VYxGv9CRTuE4whb9
Content-Type: multipart/mixed; boundary="Z5Wc12G6gwcrcp5NSPk7lxmplwNJheQ3L";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Joel Stanley <joel@jms.id.au>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, narmstrong@baylibre.com,
 David Airlie <airlied@linux.ie>, liviu.dudau@arm.com, philippe.cornu@st.com,
 paul@crapouillou.net, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 mihail.atanassov@arm.com, Sam Ravnborg <sam@ravnborg.org>,
 alexandre.torgue@st.com, Marek Vasut <marex@denx.de>, abrodkin@synopsys.com,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com,
 tomi.valkeinen@ti.com, james.qian.wang@arm.com,
 NXP Linux Team <linux-imx@nxp.com>, puck.chen@hisilicon.com,
 Sascha Hauer <s.hauer@pengutronix.de>, alison.wang@nxp.com, jsarha@ti.com,
 Chen-Yu Tsai <wens@csie.org>, vincent.abriou@st.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 dri-devel@lists.freedesktop.org, Nicolas Ferre
 <nicolas.ferre@microchip.com>, yannick.fertre@st.com,
 kieran.bingham+renesas@ideasonboard.com, Kevin Hilman
 <khilman@baylibre.com>, zourongrong@gmail.com,
 Shawn Guo <shawnguo@kernel.org>
Message-ID: <c3419660-770c-dadd-21bd-9a6dc0e10a8d@suse.de>
Subject: Re: [PATCH 04/21] drm/aspeed: Set driver CMA functions with
 DRM_GEM_CMA_DRIVER_OPS
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-5-tzimmermann@suse.de>
 <CACPK8XcGOAjocCMp9ubgQpfiBaqSj61i_frSU7ZdiKO_uSt-hQ@mail.gmail.com>
 <3df12a74-d8f3-d607-78ff-5a0f21e86cb9@suse.de>
 <CACPK8XcAXrf6ySuWo4izjD4EU6tMSULs0tP4cy-+TA35PSOUgw@mail.gmail.com>
In-Reply-To: <CACPK8XcAXrf6ySuWo4izjD4EU6tMSULs0tP4cy-+TA35PSOUgw@mail.gmail.com>

--Z5Wc12G6gwcrcp5NSPk7lxmplwNJheQ3L
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 09.10.20 um 10:06 schrieb Joel Stanley:
> On Fri, 9 Oct 2020 at 08:01, Thomas Zimmermann <tzimmermann@suse.de> wr=
ote:
>>
>> Hi
>>
>> Am 09.10.20 um 09:54 schrieb Joel Stanley:
>>> On Fri, 22 May 2020 at 13:52, Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>>>
>>>> DRM_GEM_CMA_DRIVER_OPS sets the functions in struct drm_driver
>>>> to their defaults. No functional changes are made.
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>
>>> I just found this in my inbox. I assume it has not been applied as yo=
u
>>> were after a review.
>>
>> The patchset as a whole got an A-b and was merged a while ago.
>=20
> I'm a bit confused, I couldn't see it in any tree. The aspeed one
> seemed to have been skipped when applying the series.
>=20
> I looked at today's linux-next and drm-misc-next.

Indeed. The other patches are in drm-misc-next, but not this one. I must
have lost it during the merge process.

>=20
>>>
>>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>>
>> Nevertheless thanks for taking a look at the patch.
>>
>> Best regards
>> Thomas
>>
>>>
>>> I will apply it to drm-misc-next.

So please ahead and apply it. There's also an ack by Emil, which you may
want to add as well.

  Acked-by: Emil Velikov <emil.velikov@collabora.com>

Sorry about missing the patch and thanks for taking care.

Best regards
Thomas

>>>
>>> Cheers,
>>>
>>> Joel
>>>
>>>> ---
>>>>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 7 +------
>>>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/d=
rm/aspeed/aspeed_gfx_drv.c
>>>> index 6b27242b9ee3c..1167ff78e24a3 100644
>>>> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
>>>> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
>>>> @@ -188,12 +188,7 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
>>>>
>>>>  static struct drm_driver aspeed_gfx_driver =3D {
>>>>         .driver_features        =3D DRIVER_GEM | DRIVER_MODESET | DR=
IVER_ATOMIC,
>>>> -       .gem_create_object      =3D drm_cma_gem_create_object_defaul=
t_funcs,
>>>> -       .dumb_create            =3D drm_gem_cma_dumb_create,
>>>> -       .prime_handle_to_fd     =3D drm_gem_prime_handle_to_fd,
>>>> -       .prime_fd_to_handle     =3D drm_gem_prime_fd_to_handle,
>>>> -       .gem_prime_import_sg_table =3D drm_gem_cma_prime_import_sg_t=
able,
>>>> -       .gem_prime_mmap         =3D drm_gem_prime_mmap,
>>>> +       DRM_GEM_CMA_DRIVER_OPS,
>>>>         .fops =3D &fops,
>>>>         .name =3D "aspeed-gfx-drm",
>>>>         .desc =3D "ASPEED GFX DRM",
>>>> --
>>>> 2.26.2
>>>>
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Z5Wc12G6gwcrcp5NSPk7lxmplwNJheQ3L--

--3NZ5fJma6mDQhYsP8VYxGv9CRTuE4whb9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl+AHrIUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOU+wf+P5W3+dc0jDTl0AiCOL4N0qLFx3Fs
XTIAatTuGsBmMT6yTLTBdNAWTpUAL25z69khX3IEv9wYfNTZmbausswgZcKFgZH/
7wJ3rK5Ed6aiQq+GPjYzgCzHtOU1FNMTamym7/W4+Rr65QOFmq4YNrI782ricH2U
BK1dS5DCuvFkKLacwlNOgFvzW8JNzHC8lwj4RJiSE319Pr3YsiFwdFGZAsqm/7m0
tesYrOlCgy1LMkUEw15zHMkVAPNtVff3ahJdYG5U2Ib9VmLiOxIpdIlOFg/lb6fK
UmxnRgwSfrQf0RGt9TFnojFh1od71TjRCOKrlXJwhYsSc0JqB+F/Srfi4g==
=imUz
-----END PGP SIGNATURE-----

--3NZ5fJma6mDQhYsP8VYxGv9CRTuE4whb9--

--===============0609344643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0609344643==--
