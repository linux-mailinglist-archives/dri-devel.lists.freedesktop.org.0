Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D55C17D9C9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 08:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499336E11A;
	Mon,  9 Mar 2020 07:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BAFD6E11A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 07:24:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 998B8B19E;
 Mon,  9 Mar 2020 07:24:19 +0000 (UTC)
Subject: Re: [PATCH 00/22] drm: Convert drivers to drm_simple_encoder_init()
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200305155950.2705-1-tzimmermann@suse.de>
 <20200306142212.GF4878@pendragon.ideasonboard.com>
 <bccc380a-8925-81a7-34fe-5a1744a766d0@suse.de>
 <20200307200813.GA15363@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <f2db1418-5c97-dcef-667e-715d838dd42b@suse.de>
Date: Mon, 9 Mar 2020 08:24:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200307200813.GA15363@ravnborg.org>
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
Cc: hamohammed.sa@gmail.com, alexandre.belloni@bootlin.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, sebastian.reichel@collabora.com,
 paul@crapouillou.net, matthias.bgg@gmail.com, thierry.reding@gmail.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 abrodkin@synopsys.com, linux@armlinux.org.uk, krzk@kernel.org,
 jonathanh@nvidia.com, linux-rockchip@lists.infradead.org,
 ludovic.desroches@microchip.com, tomi.valkeinen@ti.com, linux-imx@nxp.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com,
 virtualization@lists.linux-foundation.org, nicolas.ferre@microchip.com,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de, alison.wang@nxp.com,
 jsarha@ti.com, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 wens@csie.org, jernej.skrabec@siol.net, rodrigosiqueiramelo@gmail.com,
 bbrezillon@kernel.org, jingoohan1@gmail.com, sw0312.kim@samsung.com,
 hjc@rock-chips.com, kyungmin.park@samsung.com,
 kieran.bingham+renesas@ideasonboard.com, kgene@kernel.org,
 kernel@pengutronix.de, zourongrong@gmail.com, shawnguo@kernel.org,
 kraxel@redhat.com
Content-Type: multipart/mixed; boundary="===============0014563412=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0014563412==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0o1gLC99UZ6MblS6ftokgGpAQCE791IVd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0o1gLC99UZ6MblS6ftokgGpAQCE791IVd
Content-Type: multipart/mixed; boundary="kHuwg0qrcMYaHYPq8aj4tX3yyCOu5dGOV";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: ludovic.desroches@microchip.com, hamohammed.sa@gmail.com,
 alexandre.belloni@bootlin.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux@armlinux.org.uk,
 paul@crapouillou.net, linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 hjc@rock-chips.com, abrodkin@synopsys.com, sebastian.reichel@collabora.com,
 krzk@kernel.org, jonathanh@nvidia.com, linux-rockchip@lists.infradead.org,
 wens@csie.org, tomi.valkeinen@ti.com, linux-imx@nxp.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de, alison.wang@nxp.com,
 jsarha@ti.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 virtualization@lists.linux-foundation.org, jernej.skrabec@siol.net,
 rodrigosiqueiramelo@gmail.com, bbrezillon@kernel.org, jingoohan1@gmail.com,
 sw0312.kim@samsung.com, nicolas.ferre@microchip.com,
 kyungmin.park@samsung.com, kieran.bingham+renesas@ideasonboard.com,
 kgene@kernel.org, kernel@pengutronix.de, zourongrong@gmail.com,
 shawnguo@kernel.org, kraxel@redhat.com
Message-ID: <f2db1418-5c97-dcef-667e-715d838dd42b@suse.de>
Subject: Re: [PATCH 00/22] drm: Convert drivers to drm_simple_encoder_init()
References: <20200305155950.2705-1-tzimmermann@suse.de>
 <20200306142212.GF4878@pendragon.ideasonboard.com>
 <bccc380a-8925-81a7-34fe-5a1744a766d0@suse.de>
 <20200307200813.GA15363@ravnborg.org>
In-Reply-To: <20200307200813.GA15363@ravnborg.org>

--kHuwg0qrcMYaHYPq8aj4tX3yyCOu5dGOV
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 07.03.20 um 21:08 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> On Fri, Mar 06, 2020 at 04:18:52PM +0100, Thomas Zimmermann wrote:
>> Hi Laurent
>>
>> Am 06.03.20 um 15:22 schrieb Laurent Pinchart:
>>> Hi Thomas,
>>>
>>> Thank you for the patch.
>>>
>>> On Thu, Mar 05, 2020 at 04:59:28PM +0100, Thomas Zimmermann wrote:
>>>> A call to drm_simple_encoder_init() initializes an encoder without
>>>> further functionality. It only provides the destroy callback to
>>>> cleanup the encoder's state. Only few drivers implement more
>>>> sophisticated encoders than that. Most drivers implement such a
>>>> simple encoder and can use drm_simple_encoder_init() instead.
>>>>
>>>> The patchset converts drivers where the encoder's instance is
>>>> embedded in a larger data structure. The driver releases the
>>>> memory during cleanup. Each patch replaces drm_encoder_init() with
>>>> drm_simple_encoder_init() and removes the (now unused) driver's
>>>> encoder functions.
>>>>
>>>> While the patchset is fairly large, the indiviual patches are self-
>>>> contained and can be merged independently from each other. The
>>>> simple-encoder functionality is currently in drm-misc-next, where
>>>> these patches could go as well.
>>>
>>> I've reviewed the whole series, including verifying that the few
>>> instances of struct drm_encoder_funcs that were not declared const we=
re
>>> not modified somewhere to add more function pointers.
>>>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> Thanks for the detailed review.
>>
>>>
>>> for all the patches.
>>>
>>> However, I'd like to note that drm_simple_encoder_init() is a bit of =
a
>>> misnommer here. Several of the encoders in those drivers to implement=

>>> additional functionality. They just expose them through
>>> drm_encoder_helper_funcs, not drm_encoder_funcs.
>>
>> True. It's called 'simple encoder' for the lack of a better name. It's=

>> part of the simple KMS helpers, so the name's at least consistent. OTO=
H
>> I always find drm_simple_display_pipe a bad name.
>>
>> We can still rename the simple-encoder function without much effort. I=
'm
>> open for suggestions.
>=20
> IMO this does not belong in drm_simple_kms - but in drm_encoder.
> This only occurs to me after looking a bit more on the patches,
> you would have loved to get this feedback earlier.

Well, the simple-encoder functionality used to be located in the encoder
code, but Daniel mentioned this is more of a helper and asked me to move
it out of the core. [1] So it ended up with the simple-KMS helpers.

Best regards
Thomas

[1] https://patchwork.freedesktop.org/patch/352370/?series=3D73130&rev=3D=
1

>=20
> Most users do not need their owm drm_encoder_funcs definition,
> and would be happy with the default as provided by drm_simple_*
>=20
> As the cleanup is handled automatically when the drm device
> is teared down (in mode_config_rest()) I considered if we could here
> use the drmm_ namespace - but that felt wrong.
>=20
> My proposal is the following:
> - Move the implementation to drm_encoder.c
> - Name it drm_encoder_init_nofuncs()
>=20
> The patches posted in this thread would be a little simpler
> as they would loose the added include file.
> And the three drivers using the current infrastructure would need a
> small update.
>=20
> I you decide to keep the current approach where the
> functions are in drm_simple_* then the full series is:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>=20
> But I think moving it to drm_encoder.c would be the approach that would=

> make it simpler to understand/follow. So that get my (biased) vote.
>=20
> 	Sam
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


--kHuwg0qrcMYaHYPq8aj4tX3yyCOu5dGOV--

--0o1gLC99UZ6MblS6ftokgGpAQCE791IVd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5l7xwACgkQaA3BHVML
eiNvogf/X7mT5FK9zeyGvttt382VuO7LI5DPLmioQNnsCV8djdNkvDMa1QgoizMR
+rBcr2HpJvGPYJADgdIjElZ1PdBbA2uy3fD18UsA9J3We6dLqWwFJGd63FiVgUEk
3cz68wtYxo/158n1EKjdjRZLNrqmUpY7eIH8l5HmHzJiZA2BuxYNLPiasnn8/4fx
ZIueyDVkit4t0o+1uDVUp1IngcCZDbvnRr9AimBHcNCHKdeGw2HO2NvIzeUpagqO
0IR+FSMP2smmgs9rFvfxw+VeoL6yUnijkjohOH6eVrKrSWdmxIabreAxdLZDY0w+
sjNbM1FRdpTDm3H4Q3wBBcwxp06Hcw==
=AsaC
-----END PGP SIGNATURE-----

--0o1gLC99UZ6MblS6ftokgGpAQCE791IVd--

--===============0014563412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0014563412==--
