Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8CE3916DE
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 14:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000446ECBF;
	Wed, 26 May 2021 12:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4A26ECBF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 12:00:25 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by smtp-out2.suse.de (Postfix) with ESMTP id 2D33B1FD2A;
 Wed, 26 May 2021 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622030424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IjDfVNGyLqkqsPwVm25MULiJLzVWqdHHv+ncw0xAGyk=;
 b=UeoYFvN0l10pOObHYxLSXztHiWtXmYwEV18Dfzb26DvzzZSd0DGois5lXazPBpwQSIOoS5
 M3C2BOiJ3IRmdlVN7t61wRROiLWWheuTgPUI5vSAyFNzbyn1Izep3UAH63C+aXNf9s+bHr
 4fP+d2Y7nJS3PTrpSkjxRy1uqfKTUj8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622030424;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IjDfVNGyLqkqsPwVm25MULiJLzVWqdHHv+ncw0xAGyk=;
 b=tlTC+ARnM+GuMeOKQJIThyu7MqxL9cgstGXGa4v/zBZ5gfaqKA4+2C/FTzMGc+LOacp2Y2
 MlFneooEigMAzGDw==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id D078711A98;
 Wed, 26 May 2021 12:00:23 +0000 (UTC)
Subject: Re: [PATCH] drm/rockchip: kick firmware-based framebuffer when
 initializing
To: Icenowy Zheng <icenowy@aosc.io>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20210526085527.155840-1-icenowy@aosc.io>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <13c50c42-4f2a-eed3-fc79-cbe6d1e7cae9@suse.de>
Date: Wed, 26 May 2021 14:00:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210526085527.155840-1-icenowy@aosc.io>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8BYw6q2hiLDaE4D6t7JULaNP7Anat21W2"
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
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8BYw6q2hiLDaE4D6t7JULaNP7Anat21W2
Content-Type: multipart/mixed; boundary="LZzy5vKYeS6aAktdZRJoJ4RLNbvtCfZeM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Icenowy Zheng <icenowy@aosc.io>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <13c50c42-4f2a-eed3-fc79-cbe6d1e7cae9@suse.de>
Subject: Re: [PATCH] drm/rockchip: kick firmware-based framebuffer when
 initializing
References: <20210526085527.155840-1-icenowy@aosc.io>
In-Reply-To: <20210526085527.155840-1-icenowy@aosc.io>

--LZzy5vKYeS6aAktdZRJoJ4RLNbvtCfZeM
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

I think we already fixed this at [1]. Apparently no on epicked it up. If =

you awant to test, I'll add your Tested-by before merging the patch.

Best regards
Thomas

[1]=20
https://lore.kernel.org/dri-devel/20210516074833.451643-1-javierm@redhat.=
com/

Am 26.05.21 um 10:55 schrieb Icenowy Zheng:
> Since U-Boot now supports EFI and FB passing via EFI GOP, when booting
> rockchip SoCs via EFI, a EFI FB is available. However, currently when
> re-initializing display pipeline, the EFI FB is not removed, lead to
> fbcon not working (because the EFI FB is no longer bound to the display=

> pipeline although it's still /dev/fb0 and fbcon is bound to it).
>=20
> Add some code for removing firmware-based FB when initializing KMS of
> rockchipdrm.
>=20
> Tested on Pinebook Pro (RK3399) with U-Boot patchset for initializing
> eDP display applied.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 3 +++
>   1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/=
drm/rockchip/rockchip_drm_drv.c
> index 212bd87c0c4a..3905fce6ce0b 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -158,6 +158,9 @@ static int rockchip_drm_bind(struct device *dev)
>   	 */
>   	drm_dev->irq_enabled =3D true;
>  =20
> +	/* Remove early framebuffers (ie. efifb) */
> +	drm_fb_helper_remove_conflicting_framebuffers(NULL, "rockchipdrmfb", =
false);
> +
>   	ret =3D rockchip_drm_fbdev_init(drm_dev);
>   	if (ret)
>   		goto err_unbind_all;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--LZzy5vKYeS6aAktdZRJoJ4RLNbvtCfZeM--

--8BYw6q2hiLDaE4D6t7JULaNP7Anat21W2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCuOFcFAwAAAAAACgkQlh/E3EQov+CU
Mg//V2gspuj9JuJo17jjUtDZxGtg0cclw4uF6RWE0TZxjSpREAsLdCEFd9WrxIqgbGTJU+nFVzE1
wJaL1TfnACOmm/6BYr+xUm4F9ArpMDKbJcLpDzCYJmP+n0u1twXjrVBfE5xoW7ja40Vvx0LcImpb
/dnWF2xks5dZt0KbaOXAmtySqL1N4wQZr+BKj6T00bXctekhz/Hfgc8FwwQy+gD8ToEBfb46uzuT
wZGfXMbPPZ5BFvQFj6FwsXfORTpyevyeQGoFruqj6aTDxQpiYXWxtLS9/DzlTmHCPYHXqjxHSltM
igkb8qVEw7yAsuThVSTPBK6lt1C0YCvFUVpZGHL2LSraDXLna7K3bYvMDqbTNgWnprB0ImaL2RVy
9+1SYL2MDwBZFle8qsZsUbrG8w6zRZYUUO3H5EjUGC0ZG3dnFvLuH3IS5HUHhu2RPAv8dXfysvc7
wi3lQ+lNylV6Vt7NbQELWQC5Y8fHp08Un8MCQJFpXbYnQZUr2+ALdUc6RADPcBtuWipWKTkw+HwI
e5lBnZ9DeHsQkGDq9M0/PJu34NjeyK2vCjvqgsCsI7UrhooJ0ray9h038FNP/h5XA+NULExYIvC6
SMSAtmLsTjyryAgMHEMpJLaADJG0nr3OE/mReUG6Kn+dsjrSR71y7NOIRMOm5dJ2Z/iiWr/BEWrD
S84=
=LAV6
-----END PGP SIGNATURE-----

--8BYw6q2hiLDaE4D6t7JULaNP7Anat21W2--
