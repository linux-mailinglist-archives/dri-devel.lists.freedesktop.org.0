Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8973C7F57
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 09:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914486E067;
	Wed, 14 Jul 2021 07:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4C76E067
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 07:30:03 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 793CF20265;
 Wed, 14 Jul 2021 07:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626247801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h4w9EJoeQwacEkG5zsrZXA/3QtbREzM/KT1IUobYUgw=;
 b=OSKSWXh5jbousE7ufiIvTbWgyNZDKsRFe27Hb50uiS+BOtVkO7HCb/L/mUn5yBtKkWK2rc
 5Vtt4MmoXaei9H/yGLA6HvoMMMUuSzWhS2HphCE9K4eMBVUS8yJEQ20GYShaVMND2hK/0W
 SwBLuhifCe5ve6fuh4OSbuyw/V7hZcA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626247801;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h4w9EJoeQwacEkG5zsrZXA/3QtbREzM/KT1IUobYUgw=;
 b=rNM3vHZgmwOO8H4VrRQ3shsWIoNeA1whd7z8lMYVH8K4RsC3Pli3KO7Ot7EmSMoc9ky58o
 NGJ4Q7g3aUr2iOBA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 5F462133FA;
 Wed, 14 Jul 2021 07:30:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id CSzSFXmS7mBNaAAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Wed, 14 Jul 2021 07:30:01 +0000
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20210714041417.221947-1-zackr@vmware.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/4] drm/vmwgfx: Add support for CursorMob and
 CursorBypass 4
Message-ID: <676dcb6a-b95d-f29a-f76b-51450fe3998a@suse.de>
Date: Wed, 14 Jul 2021 09:30:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714041417.221947-1-zackr@vmware.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UttyNI9h8RTdyYsOnWp2AH6GWzmyseieE"
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
Cc: Martin Krastev <krastevm@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UttyNI9h8RTdyYsOnWp2AH6GWzmyseieE
Content-Type: multipart/mixed; boundary="rIcbK120ypD422UydAKSDkrPsCVLyT6lO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Cc: Martin Krastev <krastevm@vmware.com>
Message-ID: <676dcb6a-b95d-f29a-f76b-51450fe3998a@suse.de>
Subject: Re: [PATCH 1/4] drm/vmwgfx: Add support for CursorMob and
 CursorBypass 4
References: <20210714041417.221947-1-zackr@vmware.com>
In-Reply-To: <20210714041417.221947-1-zackr@vmware.com>

--rIcbK120ypD422UydAKSDkrPsCVLyT6lO
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 14.07.21 um 06:14 schrieb Zack Rusin:
> From: Martin Krastev <krastevm@vmware.com>
>=20
> * Add support for CursorMob
> * Add support for CursorBypass 4
>=20
> Reviewed-by: Zack Rusin <zackr@vmware.com>
> Signed-off-by: Martin Krastev <krastevm@vmware.com>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 45 +++++++++++++++-
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |  6 +++
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 79 +++++++++++++++++++++++++++-=
-
>   3 files changed, 125 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwg=
fx/vmwgfx_drv.c
> index 086dc75e7b42..7d8cc2f6b04e 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1,7 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0 OR MIT
>   /********************************************************************=
******
>    *
> - * Copyright 2009-2016 VMware, Inc., Palo Alto, CA., USA
> + * Copyright 2009-2021 VMware, Inc., Palo Alto, CA., USA
>    *
>    * Permission is hereby granted, free of charge, to any person obtain=
ing a
>    * copy of this software and associated documentation files (the
> @@ -301,8 +301,12 @@ static void vmw_print_capabilities2(uint32_t capab=
ilities2)
>   		DRM_INFO("  Grow oTable.\n");

These macros have been out of fashion for a while. There's drm_info(),=20
drm_warn(), drm_err(), etc as replacements. They also print device=20
information. Applis here and for the rest of the patchset.


>   	if (capabilities2 & SVGA_CAP2_INTRA_SURFACE_COPY)
>   		DRM_INFO("  IntraSurface copy.\n");
> +	if (capabilities2 & SVGA_CAP2_CURSOR_MOB)
> +		DRM_INFO("  Cursor Mob.\n");
>   	if (capabilities2 & SVGA_CAP2_DX3)
>   		DRM_INFO("  DX3.\n");
> +	if (capabilities2 & SVGA_CAP2_EXTRA_REGS)
> +		DRM_INFO("  Extra Regs.\n");
>   }
>  =20
>   static void vmw_print_capabilities(uint32_t capabilities)
> @@ -505,6 +509,7 @@ static int vmw_request_device_late(struct vmw_priva=
te *dev_priv)
>   static int vmw_request_device(struct vmw_private *dev_priv)
>   {
>   	int ret;
> +	size_t i;
>  =20
>   	ret =3D vmw_device_init(dev_priv);
>   	if (unlikely(ret !=3D 0)) {
> @@ -526,6 +531,37 @@ static int vmw_request_device(struct vmw_private *=
dev_priv)
>   	if (unlikely(ret !=3D 0))
>   		goto out_no_query_bo;
>  =20
> +	/* Set up mobs for cursor updates */
> +	if (dev_priv->has_mob && dev_priv->capabilities2 & SVGA_CAP2_CURSOR_M=
OB) {
> +		const uint32_t cursor_max_dim =3D vmw_read(dev_priv, SVGA_REG_CURSOR=
_MAX_DIMENSION);
> +
> +		for (i =3D 0; i < ARRAY_SIZE(dev_priv->cursor_mob); i++) {
> +			struct ttm_buffer_object **const bo =3D &dev_priv->cursor_mob[i];
> +
> +			ret =3D vmw_bo_create_kernel(dev_priv,
> +				cursor_max_dim * cursor_max_dim * sizeof(u32) + sizeof(SVGAGBCurso=
rHeader),
> +				&vmw_mob_placement, bo);
> +
> +			if (ret !=3D 0) {
> +				DRM_ERROR("Unable to create CursorMob array.\n");
> +				break;
> +			}
> +
> +			BUG_ON((*bo)->resource->mem_type !=3D VMW_PL_MOB);

BUG_ON() crashes the kernel. The prefered way is to use drm_WARN_*() and =

return.

> +
> +			/* Fence the mob creation so we are guarateed to have the mob */
> +			ret =3D ttm_bo_reserve(*bo, false, true, NULL);
> +			BUG_ON(ret);

I'm not quite sure, but this line is probably a no-go wrt to best=20
practices. See the comment above.

> +
> +			vmw_bo_fence_single(*bo, NULL);
> +
> +			ttm_bo_unreserve(*bo);
> +
> +			DRM_INFO("Using CursorMob mobid %lu, max dimension %u\n",
> +				 (*bo)->resource->start, cursor_max_dim);

IIRC anything *_info() is just radom info into the log. Most of the=20
time, no one cares. Better use one of the drm_dbg_() calls.

> +		}
> +	}
> +
>   	return 0;
>  =20
>   out_no_query_bo:
> @@ -556,6 +592,8 @@ static int vmw_request_device(struct vmw_private *d=
ev_priv)
>    */
>   static void vmw_release_device_early(struct vmw_private *dev_priv)
>   {
> +	size_t i;
> +
>   	/*
>   	 * Previous destructions should've released
>   	 * the pinned bo.
> @@ -570,6 +608,11 @@ static void vmw_release_device_early(struct vmw_pr=
ivate *dev_priv)
>   	if (dev_priv->has_mob) {
>   		struct ttm_resource_manager *man;
>  =20
> +		for (i =3D 0; i < ARRAY_SIZE(dev_priv->cursor_mob); i++) {
> +			if (dev_priv->cursor_mob[i] !=3D NULL)
> +				ttm_bo_put(dev_priv->cursor_mob[i]);
> +		}
> +
>   		man =3D ttm_manager_type(&dev_priv->bdev, VMW_PL_MOB);
>   		ttm_resource_manager_evict_all(&dev_priv->bdev, man);
>   		vmw_otables_takedown(dev_priv);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwg=
fx/vmwgfx_drv.h
> index 356f82c26f59..46bf54f6169a 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -642,6 +642,12 @@ struct vmw_private {
>   	u8 mksstat_kern_top_timer[MKSSTAT_CAPACITY];
>   	atomic_t mksstat_kern_pids[MKSSTAT_CAPACITY];
>   #endif
> +
> +	/*
> +	 * CursorMob buffer objects
> +	 */
> +	struct ttm_buffer_object *cursor_mob[2];
> +	atomic_t cursor_mob_idx;

That's something like page-flipping with alternating BO's and shadow=20
buffering?

You really want a cursor plane to hold this information.


I briefly looked through vmwgfx and it has all these fail-able code in=20
its atomic-update path. The patches here only make things worse. With=20
cursor planes, you can do all the preparation in atomic_check and=20
prepare_fb, and store the
intermediate state/mappings/etc in the plane state.

The ast driver started with a design like this one here and then we=20
moved it to cursor planes. Ast has now none of the mentioned problems.=20
Relevant code is at [1][2].

Best regards
Thomas

[1]=20
https://elixir.bootlin.com/linux/v5.13.1/source/drivers/gpu/drm/ast/ast_d=
rv.h#L105

[2]=20
https://elixir.bootlin.com/linux/v5.13.1/source/drivers/gpu/drm/ast/ast_m=
ode.c#L652

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--rIcbK120ypD422UydAKSDkrPsCVLyT6lO--

--UttyNI9h8RTdyYsOnWp2AH6GWzmyseieE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDukngFAwAAAAAACgkQlh/E3EQov+Bo
kA//Vxr4UpyKeu8M5y0YCZBuZH/I8DV58WSacvoTTm+XCQtuXazBQTavpfGq79Aj7JYQPELI6XJO
xx+4uXh9ur3vaYmwFTnKALuwZ+cyB30TEmcOSSvWKgvUiizDSTZ5fwFht9begsR/zeJqtFb0jyCx
rXRdAH/B2SXMSHBIjSN+hC0D0zvry9Y84qlxTk9Hu+Te42ztHgyRXDoSDXB361Zj8pSsJ0M6wHg/
GTbTYTzEkRXZUTHNkrQwFNTrXaNh3oKo61VtbQKtPQoDgmFxsMbqAZw0PNGvu1CGgMn0M8gImxUE
fhJKXnTc4YNjDH8HLSd8faaUExyXmjkdkWTv020hAiic9EGf/MoR3SchFZjR1TYV5ijBP6f14Xc4
A9PiMt/CsHHOkeWCJw4oq7csNJ1lYWfdquEKx0hEFdY2wU65yEHSsvZBdNP7/aqkboxxzBiiIk6c
KxA/gX5fBHt7A7YVNz8ZflBUmQEIucWBNKnInBi5YcOjx349yrzxpX/ELiNoplK3CTgDhz7mQgS+
jY8RvdYXC19zkRPSGY9FEuwV1L7YwPdOeeHabrCxN4joFAYKV1evVFIyzQTYcQqxu5AH1M6ouAZz
0ZUVilWa1PvSz3vqGyF+fy0pe/8jDXoHZOwXRdAlAKx98CT5AOG/JI9XDBjRiU/Egh47fcU0P0Oe
joI=
=W3u/
-----END PGP SIGNATURE-----

--UttyNI9h8RTdyYsOnWp2AH6GWzmyseieE--
