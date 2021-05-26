Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7149D391145
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 09:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4746EA88;
	Wed, 26 May 2021 07:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389826EC16
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 07:17:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622013439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iW12W0JfdfWu0mRjLkOSJwwbTRibEs40+Ey5ayzpSg8=;
 b=D25QkLj+FbzUbLy3lXATBPGNfLgG1s2jOXHzmjQUQ8XDOXJWVKiuWlHZ4DewubASB+xuoP
 l4lm+9hDqjVTyhcTt+pbrefabaUQBowO4CfjupV6OrH11Q5JFNWtuleCxQ40v2x7hbLdLu
 A8EvQTaUZP1ndeBZQKoOpYP4k5UF3GI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622013439;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iW12W0JfdfWu0mRjLkOSJwwbTRibEs40+Ey5ayzpSg8=;
 b=NdFYi7OunZ7dv+XMNxFzL5Lg2qOHjBDgbinLjMKvQZ5WFx5ExZSFYPLsG9zgRnfeoC+NB0
 FE6oqoOezUzcgJDQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 60F84ABED;
 Wed, 26 May 2021 07:17:19 +0000 (UTC)
To: ainux.wang@gmail.com, airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210525015520.8327-1-ainux.wang@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/ast: Add detect function support
Message-ID: <49faa0db-2c6b-1915-7b21-e98349062db2@suse.de>
Date: Wed, 26 May 2021 09:17:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210525015520.8327-1-ainux.wang@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3EkI4jV6k5mofl0iKy4NmEOasHSnN8GU6"
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
Cc: sterlingteng@gmail.com, chenhuacai@kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3EkI4jV6k5mofl0iKy4NmEOasHSnN8GU6
Content-Type: multipart/mixed; boundary="rghy5m1ZDKVN9OvP9SHCy29gOqAqQXUwb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ainux.wang@gmail.com, airlied@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, sterlingteng@gmail.com,
 chenhuacai@kernel.org
Message-ID: <49faa0db-2c6b-1915-7b21-e98349062db2@suse.de>
Subject: Re: [PATCH] drm/ast: Add detect function support
References: <20210525015520.8327-1-ainux.wang@gmail.com>
In-Reply-To: <20210525015520.8327-1-ainux.wang@gmail.com>

--rghy5m1ZDKVN9OvP9SHCy29gOqAqQXUwb
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

thanks for the patch.

Am 25.05.21 um 03:55 schrieb ainux.wang@gmail.com:
> From: Ainux <ainux.wang@gmail.com>
>=20
> The existence of the connector cannot be detected,
> so add the detect function to support.
>=20
> Signed-off-by: Ainux <ainux.wang@gmail.com>
> ---
>   drivers/gpu/drm/ast/ast_drv.c  |  2 ++
>   drivers/gpu/drm/ast/ast_mode.c | 19 ++++++++++++++++++-
>   2 files changed, 20 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_dr=
v.c
> index 5aa452b4efe6..6698bbc405e3 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -128,6 +128,8 @@ static int ast_pci_probe(struct pci_dev *pdev, cons=
t struct pci_device_id *ent)
>  =20
>   	drm_fbdev_generic_setup(dev, 32);
>  =20
> +	drm_kms_helper_poll_init(dev);
> +

I think this is too late. Rather put it at the end of=20
ast_mode_config_init(). [1]

>   	return 0;
>   }
>  =20
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_m=
ode.c
> index 36d9575aa27b..b4dd4c29b353 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1293,6 +1293,21 @@ static enum drm_mode_status ast_mode_valid(struc=
t drm_connector *connector,
>   	return flags;
>   }
>  =20
> +static enum drm_connector_status ast_connector_detect(struct drm_conne=
ctor
> +						   *connector, bool force)
> +{
> +	int r;
> +	enum drm_connector_status ret =3D connector_status_connected;
> +
> +	r =3D ast_get_modes(connector);
> +	if (r)
> +		ret =3D connector_status_connected;
> +	else
> +		ret =3D connector_status_disconnected;
> +
> +	return ret;


As a side note: VGA is not hotplug-able, but expected to always be=20
connected. Ideally we could detect this, but it's unreliable AFAIK.


Rather use:

  r =3D ast_get_modes()
  if (r < 0)
     return connector_status_disconnected

   return connector_status_connected

So it's disconnected if there was an error in ast_get_modes().

Best regards
Thomas

[1]=20
https://elixir.bootlin.com/linux/v5.12/source/drivers/gpu/drm/ast/ast_mod=
e.c#L1171

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--rghy5m1ZDKVN9OvP9SHCy29gOqAqQXUwb--

--3EkI4jV6k5mofl0iKy4NmEOasHSnN8GU6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCt9f4FAwAAAAAACgkQlh/E3EQov+Al
wQ/+N9yp0CWTU0dKrU+lyO3E0h9El9ErXVnRFLH+3P1OQV4wjLZ5mlM6pU3GYvpDm+y71eiQpcBS
kIN3huLStk8v21HzzOI3xfKOWiT12lcdEEwtxCOYHGW36AzfFnUszICP02LzfEKzpZB3XZj79Gq0
s9OQPjVxY5d0rVyUH2FaG5mhQFQYBEbO8mFWzQC0QXZW7chlcftI4ZblsKFzS5e3bnuxhwkWYjTU
rB21Y3ViVQ0x5LgEYd+pbbu7t1LiYIV+YmOEOhaR8CKqJON2Dn8HXqIej7EDAV1V50agDZXpSIAs
N3/NglNlfQg3ut/SWbnLtFgS8ieUxFdiUpyrgtVyCS9+pVk6O31pys8DQnV73/4xwfWcqPA/Ankl
uoPyYRJJ3vbr4TN2quToL//WoPgV3tEHBXcM1r5QEaWf+vnQYUMGRku7N4pE9Nu9sHf7LrZiyVxj
WZxuPYMxa6hC/IV6vB0GBefka+gLbmPYeew+k301Ia7oDR9kEfjq8nMpu5NAeiP2EZF1hG5FObQc
7EqmroouJVm4cxTkO9d7TuVSBEWN2JOzVZ0+RSn8R3aQ2onaYYUO+krq/LbTp+E6/ystqmAePuc3
mx461uFzYfBAXMQ8odPto0Z3YOrk4eel8r+q4N/PTj46zTj3Syg4k2gT95xpJ4kFh7FvKOUjI3lD
wpk=
=Int3
-----END PGP SIGNATURE-----

--3EkI4jV6k5mofl0iKy4NmEOasHSnN8GU6--
