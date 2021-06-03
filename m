Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8E539A50B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 17:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193506F4C4;
	Thu,  3 Jun 2021 15:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C716F4C3;
 Thu,  3 Jun 2021 15:54:17 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2473F1FD4E;
 Thu,  3 Jun 2021 15:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622735656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VTgp5iu2YNHqDZA7fH2zBOOufUN2r89rQlj6cQ4oYrY=;
 b=m3+SBJ+EVjeq16Nlb2DNENHSgH5ife6kx+VwLb7ytoz6tN6sycGNfyCZM5/REiRiKBXc5+
 e6EB4koailpFoBnbwH5CZ9BskErh7ot9QMXp3K+7mxjNHCYdFnfsFF0ZfKYC2JfZD4pYbA
 ADXRAoIk97xKAR3eWwv7Cn6ignQ+bFI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622735656;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VTgp5iu2YNHqDZA7fH2zBOOufUN2r89rQlj6cQ4oYrY=;
 b=WjFitLhiPhdR6BgTgg+lFQdby8l/5TldcjX2Tf+fRNVLbNv8mP9O12R43c2UL7OPzPb6Fk
 0/JtHBzs0JaddHAw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id DF627118DD;
 Thu,  3 Jun 2021 15:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622735656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VTgp5iu2YNHqDZA7fH2zBOOufUN2r89rQlj6cQ4oYrY=;
 b=m3+SBJ+EVjeq16Nlb2DNENHSgH5ife6kx+VwLb7ytoz6tN6sycGNfyCZM5/REiRiKBXc5+
 e6EB4koailpFoBnbwH5CZ9BskErh7ot9QMXp3K+7mxjNHCYdFnfsFF0ZfKYC2JfZD4pYbA
 ADXRAoIk97xKAR3eWwv7Cn6ignQ+bFI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622735656;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VTgp5iu2YNHqDZA7fH2zBOOufUN2r89rQlj6cQ4oYrY=;
 b=WjFitLhiPhdR6BgTgg+lFQdby8l/5TldcjX2Tf+fRNVLbNv8mP9O12R43c2UL7OPzPb6Fk
 0/JtHBzs0JaddHAw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id DbxxNSf7uGBabwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 03 Jun 2021 15:54:15 +0000
Subject: Re: [PATCH v2 1/4] drm/gem-shmem-helper: Export drm_gem_shmem_funcs
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20210603150326.1326658-1-daniel.vetter@ffwll.ch>
 <20210603150326.1326658-2-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <0357b639-bc85-1a5c-2025-aa3f9e8ffc2b@suse.de>
Date: Thu, 3 Jun 2021 17:54:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210603150326.1326658-2-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="e5oGsZkHfbhJFJBj01unZ5OEqwGZskJww"
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
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--e5oGsZkHfbhJFJBj01unZ5OEqwGZskJww
Content-Type: multipart/mixed; boundary="E08XtbKgi5ecIZKEREHTNraxNmb9D7GgJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Message-ID: <0357b639-bc85-1a5c-2025-aa3f9e8ffc2b@suse.de>
Subject: Re: [PATCH v2 1/4] drm/gem-shmem-helper: Export drm_gem_shmem_funcs
References: <20210603150326.1326658-1-daniel.vetter@ffwll.ch>
 <20210603150326.1326658-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20210603150326.1326658-2-daniel.vetter@ffwll.ch>

--E08XtbKgi5ecIZKEREHTNraxNmb9D7GgJ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 03.06.21 um 17:03 schrieb Daniel Vetter:
> Drivers which need to overwrite the drm_driver->gem_create_object hook
> need this. Specifically vgem, which wants wc mode, but everything else
> is fine as-is.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>   drivers/gpu/drm/drm_gem_shmem_helper.c | 3 ++-
>   include/drm/drm_gem_shmem_helper.h     | 1 +
>   2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/d=
rm_gem_shmem_helper.c
> index 6d625cee7a6a..4439004e62fe 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -24,7 +24,7 @@
>    * allocated using anonymous pageable memory.
>    */
>  =20
> -static const struct drm_gem_object_funcs drm_gem_shmem_funcs =3D {
> +const struct drm_gem_object_funcs drm_gem_shmem_funcs =3D {
>   	.free =3D drm_gem_shmem_free_object,
>   	.print_info =3D drm_gem_shmem_print_info,
>   	.pin =3D drm_gem_shmem_pin,
> @@ -34,6 +34,7 @@ static const struct drm_gem_object_funcs drm_gem_shme=
m_funcs =3D {
>   	.vunmap =3D drm_gem_shmem_vunmap,
>   	.mmap =3D drm_gem_shmem_mmap,
>   };
> +EXPORT_SYMBOL(drm_gem_shmem_funcs);

No that's not needed. If you leave out the funcs pointer in your=20
gem_create_object, __drm_gem_shmem_create() will set this default for=20
you. [1] So please drop this patch.

Best regards
Thomas

[1]=20
https://elixir.bootlin.com/linux/v5.12/source/drivers/gpu/drm/drm_gem_shm=
em_helper.c#L56

>  =20
>   static struct drm_gem_shmem_object *
>   __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool priv=
ate)
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_s=
hmem_helper.h
> index 434328d8a0d9..b29667f2b8a3 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -106,6 +106,7 @@ struct drm_gem_shmem_object {
>   #define to_drm_gem_shmem_obj(obj) \
>   	container_of(obj, struct drm_gem_shmem_object, base)
>  =20
> +extern const struct drm_gem_object_funcs drm_gem_shmem_funcs;
>   struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *=
dev, size_t size);
>   void drm_gem_shmem_free_object(struct drm_gem_object *obj);
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--E08XtbKgi5ecIZKEREHTNraxNmb9D7GgJ--

--e5oGsZkHfbhJFJBj01unZ5OEqwGZskJww
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmC4+ycFAwAAAAAACgkQlh/E3EQov+Bz
bBAAkTjE1tPA5PU6ESKxs9SKoMeCI6dkxsoVgnAa0dKzrAbcs20Z0ZTwg1MbjamuhEEJzYKkIULl
fP2qhSkd66Mrm0kfUeuivu9IASGKdR0E7JifqP3BjH+wXr8r138BpvrClK7VqvoQw64uR5F2TZxN
H32iPKjlz4pb06R2biYoCTO7oAuO0K+c0w9Ac5mxEhLlxg3ZD2cqkglapKB//qEFXd24qMEsbpRW
+HHd5Nte+x3dGKrihX5B2CzqZD5MG1k4UqpUeTks9DWympqxrE2zJDYHNWB9DbTv9FdQGstzEIlB
v6Nxi4QLwGzzXwxfYv2uxaRhzQgqQgBAuVRroH/NKiAUApU6x/pH6pb2JMoNc3F/cuvB11M2Y7W+
/BmSwZsOmRRidTnsjeYEyxCoxmV4m/rjVZhZYRVzDDDKR/Ax8cHiGuLUuhbaareONNP1dhi2bJRK
9l0Ny4CIuCKjQHrYmG+9vFlbWWcDUZUOuouNxrSIG6QOhy4nJSY8crg+VkohS8BOmCJBj4CyVGFJ
jUHNhcIrQiZM+zBQ4TEc+rwMAW+a8gRB3metT2YLq2V/uHf+wjg6mJhbBaMvzKk9Tbzx/KCV9BFK
iP15wnynO+kgiQGl3slXWtBEyODgrD8F5g82iyPud2LvsfjLp9dWMUacuqWvWfeMbNqOCQGPUIXl
uY0=
=BQW1
-----END PGP SIGNATURE-----

--e5oGsZkHfbhJFJBj01unZ5OEqwGZskJww--
