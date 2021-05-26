Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C33E63920CB
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 21:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0415D6E520;
	Wed, 26 May 2021 19:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE396E520
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 19:24:14 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 649451FD29;
 Wed, 26 May 2021 19:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622057053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VfIzmKVHtGMuGMaPHkUtWywgtu4ZApE+V8z8c4nj+Fo=;
 b=kWjL+FFm1lOsJFS0FjvVOr+mT6Z/rIjLgzpKULbTamg1NXxAjJzNPdnHezJ+3//9tfKC/Q
 MnfwRtKoFz0WsL7QoumIElA9rVkN9CUwwpeV4/CnNXUS6YopKLkYJxmk37/I3B5Lort3ni
 8WaN9J+b9FUh1faUN+sh+l6IlDZt7AM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622057053;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VfIzmKVHtGMuGMaPHkUtWywgtu4ZApE+V8z8c4nj+Fo=;
 b=TJ+hlLRyqiZQPU0o/2ojcyWjo1qQa7Tuf3Qa1KuLopAh6NetEgOr8h/10P6TIKdEo1IidV
 JDyNLlJNhIa04ZBA==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 4664311A98;
 Wed, 26 May 2021 19:24:13 +0000 (UTC)
Subject: Re: [PATCH v2] drm/fb-helper: improve DRM fbdev emulation device names
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20210525151313.3379622-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <89bec7e1-135a-71b6-8d87-ebca19443d3d@suse.de>
Date: Wed, 26 May 2021 21:24:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210525151313.3379622-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="a8eqX8K04hs871qWOtEcWBpxq6Os19aSA"
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
--a8eqX8K04hs871qWOtEcWBpxq6Os19aSA
Content-Type: multipart/mixed; boundary="V4kh2Ko020rS0aWXrYcbwenevlsZptesz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Message-ID: <89bec7e1-135a-71b6-8d87-ebca19443d3d@suse.de>
Subject: Re: [PATCH v2] drm/fb-helper: improve DRM fbdev emulation device
 names
References: <20210525151313.3379622-1-javierm@redhat.com>
In-Reply-To: <20210525151313.3379622-1-javierm@redhat.com>

--V4kh2Ko020rS0aWXrYcbwenevlsZptesz
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

Added to drm-misc-next. Thank you.

Best regards
Thomas

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


--V4kh2Ko020rS0aWXrYcbwenevlsZptesz--

--a8eqX8K04hs871qWOtEcWBpxq6Os19aSA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCuoFwFAwAAAAAACgkQlh/E3EQov+BW
QA//dCY5nLj7FoVjeLjeTu3l8bOIlbdSQZ2Wrm7o0KL6JhL4AmhwCwRXaTNqzB0EnbO+8e8V+Nc0
ux4ds1NKFmPc32DkLouuTvz4tB6CNX8Hp20lLkldVgaThfv4IYeIzQ69+Hq6ZLrVY278C3gesDak
RWM/EqeZBuZ+biJemc9zyH+2pFwilR6/wrtOGPni1EQGEaYsxrSTxjCnZHJlgLFy+n6L2N7+M9Dt
ptZ7mNanThryr388jOWNofAjVqZfTT15YLmR+NYODB/aY0mUKkpA2Fmfp2JqeaiCVQ2M6M1puLnC
i+Of4H/7YMMYcX9oJRGJZfxTuGugJlahNjDUJe/Fd8oXf3STmkj46mTw0VXC4J/R/nPhL5Ml12eI
Jb8KoJiv6YkwXuFv8itrKOwDWc60aDjBqYRpd4LlLStvzajbGcqt1sZNOE2kdvDfqKOgXPy7oOML
fB9qcKlTSyA0vkTYw/5Hex7Gigl/VgUB6rMxx6Azv9fRv4ThK0hKEqCsosC0u6jaNegM1H5W0lu8
lk22S82RLXQa4j0LuimnbtHFshCUoztXnby6dwbUhvYef8XZbeYtfUlx7mtDF5kUgI/kC0QfcMZl
k4Z51TxRUU3NAPSE4tiLvzzbS9L1oHzI9KSUo3007Kh8dM8Wl9Ju6wdfBQZGys/B9vtJJZ21XosF
Rws=
=f0SG
-----END PGP SIGNATURE-----

--a8eqX8K04hs871qWOtEcWBpxq6Os19aSA--
