Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67150391154
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 09:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5746E491;
	Wed, 26 May 2021 07:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0926E491
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 07:20:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622013626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k60fgREplPwiWGJsQqdv4h20lGaggGU60wgCwy99g4g=;
 b=CTEF7dygXtjoIKg+wuIAoncvSjtLF7sl+TiZkVw0T4wyLarkRzrsnXIZzypkG95LexywT1
 csoPFPQWteZ6JviEQc2nFNYiE8T8wn/VO3RmQIBcGmJNlzydBRvozhl8TOjXXJYshljwNd
 lO3juiAjPF4l7qZJ+834LiAMt3nlzmQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622013626;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k60fgREplPwiWGJsQqdv4h20lGaggGU60wgCwy99g4g=;
 b=6NP4LCUpN6bHh8VUZmw0GzwaTbl3pco2yiG6g6PIkcGAbBb9Rurt6Ehe+Ssf8LcFytCeRp
 1ho1EysFY34Q5DBA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 92E8CACB1;
 Wed, 26 May 2021 07:20:26 +0000 (UTC)
Subject: Re: [PATCH v2] drm/fb-helper: improve DRM fbdev emulation device names
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20210525151313.3379622-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <a1d46d7c-bcd1-8f9b-c8d6-1a25d303fc3d@suse.de>
Date: Wed, 26 May 2021 09:20:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210525151313.3379622-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TVBOcARnOoJPaemHCtcsPdoKOkysCMU78"
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TVBOcARnOoJPaemHCtcsPdoKOkysCMU78
Content-Type: multipart/mixed; boundary="exRjFASXm2kfnr7wFWzSuKHfga2LjrLZM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Message-ID: <a1d46d7c-bcd1-8f9b-c8d6-1a25d303fc3d@suse.de>
Subject: Re: [PATCH v2] drm/fb-helper: improve DRM fbdev emulation device
 names
References: <20210525151313.3379622-1-javierm@redhat.com>
In-Reply-To: <20210525151313.3379622-1-javierm@redhat.com>

--exRjFASXm2kfnr7wFWzSuKHfga2LjrLZM
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 25.05.21 um 17:13 schrieb Javier Martinez Canillas:
> Framebuffer devices that are registered by DRM drivers for fbdev emulat=
ion
> have a "drmfb" suffix in their name. But makes them to be quite confusi=
ng
> for drivers that already have "drm" in their name:
>=20
> $ cat /proc/fb
> 0 rockchipdrmdrmfb
>=20
> $ cat /proc/fb
> 0 simpledrmdrmfb
>=20
> Also, there isn't a lot of value in adding these "drmfb" suffices to th=
eir
> names, since users shouldn't really care if the FB devices were registe=
red
> by a real fbdev driver or a DRM driver using the fbdev emulation.
>=20
> What programs should be interested about is if there's a DRM device, an=
d
> there are better ways to query that info than reading this procfs entry=
=2E
>=20
> So let's just remove the suffix, which leads to much better device name=
s:
>=20
> $ cat /proc/fb
> 0 rockchipdrm
>=20
> $ cat /proc/fb
> 0 simpledrm
>=20
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>=20
> Changes in v2:
> - Just remove the "drmfb" suffix instead of using a different one (tzim=
mermann).
>=20
>   drivers/gpu/drm/drm_fb_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_h=
elper.c
> index f6baa204612..d77a24507d3 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1737,7 +1737,7 @@ void drm_fb_helper_fill_info(struct fb_info *info=
,
>   			       sizes->fb_width, sizes->fb_height);
>  =20
>   	info->par =3D fb_helper;
> -	snprintf(info->fix.id, sizeof(info->fix.id), "%sdrmfb",
> +	snprintf(info->fix.id, sizeof(info->fix.id), "%s",
>   		 fb_helper->dev->driver->name);
>  =20
>   }
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--exRjFASXm2kfnr7wFWzSuKHfga2LjrLZM--

--TVBOcARnOoJPaemHCtcsPdoKOkysCMU78
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCt9rkFAwAAAAAACgkQlh/E3EQov+Cv
8w//eCv9AL+3P5rNI+8IlKQHC+vOI0Vl+PZekiFiwvZbbp7liXL2qoGShvlZkzkgWgqTf/jOr3MP
+sOKGHZMU1hBCwowIO808TR1pUM1OaasmSjD+h5xryRKtHfECA4cfzB0iXwfsSWE1eNnQ+T+XxJD
UGLLO+jtNNx9bSL3UpSFXRDdSmCDu6ozqkr9qv1h8X3sDVY0Gqw9RmFxC03sqoeeyJV4GF4ScvgC
53yotxfX6D5TQFroHIRLAT+iKHPWsd60lVuoz/7DbHWAZu86sRgi2ekNCSB28BfeNRcUS6p5WfV6
TOPdDGxH0SsHnDHnnDZYLzlKAkmq+TOhrGezffiqwG65pZq44BxdHMkhYCrEbmWalCFv0wlabzXt
6U1sLDQ4U5sEwzCMEkHLNHNq8TJE79oUidwvj9JLLo/knM+5ho9GHqVDjp9EXQeMZMXUwZFT5fu1
+q09b8bYFzTU6co+AwEYlNXUrXHPWN2CwhYs8HxNdTRRrk87RtjZLcXRmvfgtcpcQbwrmHhT3qcP
UCOLorZXDye51Zf64p+ASWvzlnN6+eE6dkFxLzT/e+1wQGfoawSQIdGkNe6fOEnhokr5RE/NUpx8
d7tF8Q9GQhQpsawklG/rzZYdwAqzm95ZJWDgkOMEKlObd7s7PAtJhOWFrrVhC7CClQQXk5VJODxd
0Pg=
=SLAa
-----END PGP SIGNATURE-----

--TVBOcARnOoJPaemHCtcsPdoKOkysCMU78--
