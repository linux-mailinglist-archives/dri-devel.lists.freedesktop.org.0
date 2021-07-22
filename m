Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9355E3D2C04
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 20:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650516E8AF;
	Thu, 22 Jul 2021 18:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB276E8AF;
 Thu, 22 Jul 2021 18:40:58 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7EA4E22654;
 Thu, 22 Jul 2021 18:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626979257; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xXJijGRrkqiEQm5QGASMZ+HObJh2UD3vPLveLc5H25w=;
 b=lyWhc338ZqWVOeKV1LbK1kglCeAxfQw+OBpKnSiY2kujDmTiyohFOLXXIOBTlBX7HeRstG
 tYtzN8SOE+0iMS80wbzIsFQEAVjnEAUc2flEAPYDuggUWazoZ5Y7f6qTOuMh9aayxJPEaj
 W8WGdH45YrRKsKwdu6eQezEM6rj1Gtc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626979257;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xXJijGRrkqiEQm5QGASMZ+HObJh2UD3vPLveLc5H25w=;
 b=eklJmOjHOOPfcGGRFKRMQFIbgsLfjB2YEB/a00Ct9r0kjVkxvR0V8bTXevYKrid+/0/3G7
 /YAsmawTdedaN/AQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 4B470139A1;
 Thu, 22 Jul 2021 18:40:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 2kJZEbm7+WAXQwAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Thu, 22 Jul 2021 18:40:57 +0000
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20210713205153.1896059-1-daniel.vetter@ffwll.ch>
 <20210713205153.1896059-4-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 3/4] drm/shmem-helpers: Allocate wc pages on x86
Message-ID: <0e4eefe0-9282-672c-7678-8d3162de35e3@suse.de>
Date: Thu, 22 Jul 2021 20:40:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713205153.1896059-4-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SSo7Z9twJTGc49FEsCORsLjVLabvW7dlP"
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SSo7Z9twJTGc49FEsCORsLjVLabvW7dlP
Content-Type: multipart/mixed; boundary="mH44ynixz3fzqwiOC5L4ecIqCSTHcUXwm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Message-ID: <0e4eefe0-9282-672c-7678-8d3162de35e3@suse.de>
Subject: Re: [PATCH v4 3/4] drm/shmem-helpers: Allocate wc pages on x86
References: <20210713205153.1896059-1-daniel.vetter@ffwll.ch>
 <20210713205153.1896059-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20210713205153.1896059-4-daniel.vetter@ffwll.ch>

--mH44ynixz3fzqwiOC5L4ecIqCSTHcUXwm
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.07.21 um 22:51 schrieb Daniel Vetter:
> intel-gfx-ci realized that something is not quite coherent anymore on
> some platforms for our i915+vgem tests, when I tried to switch vgem
> over to shmem helpers.
>=20
> After lots of head-scratching I realized that I've removed calls to
> drm_clflush. And we need those. To make this a bit cleaner use the
> same page allocation tooling as ttm, which does internally clflush
> (and more, as neeeded on any platform instead of just the intel x86
> cpus i915 can be combined with).

Vgem would therefore not work correctly on non-X86 platforms?

>=20
> Unfortunately this doesn't exist on arm, or as a generic feature. For
> that I think only the dma-api can get at wc memory reliably, so maybe
> we'd need some kind of GFP_WC flag to do this properly.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>   drivers/gpu/drm/drm_gem_shmem_helper.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/d=
rm_gem_shmem_helper.c
> index 296ab1b7c07f..657d2490aaa5 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -10,6 +10,10 @@
>   #include <linux/slab.h>
>   #include <linux/vmalloc.h>
>  =20
> +#ifdef CONFIG_X86
> +#include <asm/set_memory.h>
> +#endif
> +
>   #include <drm/drm.h>
>   #include <drm/drm_device.h>
>   #include <drm/drm_drv.h>
> @@ -162,6 +166,11 @@ static int drm_gem_shmem_get_pages_locked(struct d=
rm_gem_shmem_object *shmem)
>   		return PTR_ERR(pages);
>   	}
>  =20
> +#ifdef CONFIG_X86
> +	if (shmem->map_wc)
> +		set_pages_array_wc(pages, obj->size >> PAGE_SHIFT);
> +#endif

I cannot comment much on the technical details of the caching of various =

architectures. If this patch goes in, there should be a longer comment=20
that reflects the discussion in this thread. It's apparently a workaround=
=2E

I think the call itself should be hidden behind a DRM API, which depends =

on CONFIG_X86. Something simple like

ifdef CONFIG_X86
drm_set_pages_array_wc()
{
	set_pages_array_wc();
}
else
drm_set_pages_array_wc()
  {
  }
#endif

Maybe in drm_cache.h?

Best regard
Thomas

> +
>   	shmem->pages =3D pages;
>  =20
>   	return 0;
> @@ -203,6 +212,11 @@ static void drm_gem_shmem_put_pages_locked(struct =
drm_gem_shmem_object *shmem)
>   	if (--shmem->pages_use_count > 0)
>   		return;
>  =20
> +#ifdef CONFIG_X86
> +	if (shmem->map_wc)
> +		set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
> +#endif
> +
>   	drm_gem_put_pages(obj, shmem->pages,
>   			  shmem->pages_mark_dirty_on_put,
>   			  shmem->pages_mark_accessed_on_put);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--mH44ynixz3fzqwiOC5L4ecIqCSTHcUXwm--

--SSo7Z9twJTGc49FEsCORsLjVLabvW7dlP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmD5u7gFAwAAAAAACgkQlh/E3EQov+D6
YRAA0ZoQ9AlV5uA8Cu6rPFSe6OCINTh5guBiQO1i8zGgfMVck+uwTEcvx49dK+6Dtd1bZ3YenKs1
L6SxopTfjzRPqlRNGFLOyVrn8SXKK4Sui/lBZZeTgEav8KjrdxAlhiUVpMAzd7HdK5KxXYuuXgQK
l0tHdT9EI2OJKrnx3X18y8hCMVs4HNafaduzGqAUBX68Gm10O57MIwQ4uGr2LYOY5QuLlzlpNU2Z
5aBaDTUCUWqQyQ9RcCQbh4V3ehhycGoqnrcc+juk+bbL+BIygYn7p9nrtwfKf+ril1RvnzniBJiy
TUvL6jcZ7wqyXGOpV+vbJPPaIr8/kQxdNUEcydUPvPvVLaMjYU2fXiM986kuPgIOPxLPOqPgiCM6
YR+ZUWDiZRWk+16ZPqOUI4U+PRg/HKP1+N3rwxa1YAJa5UUW76RUE/cjj48x8qIAbzhwtd4hv0jI
sWY2sDarDsdanx/I0hQK3sO6EahmNpHNUnthgSukP78XvrEh7f1N8Bp12vdEwQvi4hs6Rmxk/QWG
PKO8b5BMe1RHqFebGFEw6yCCsDV7kPHENkmTKvbjUvl+a93gIBWXHC3N/EoT9nhI0EyH+JZk2XzU
DRn6YAW55MACdDCGfgv79PxwN/w41rH0zbL1GRx+rO22c8wUqt7ofOotrALt0ZGZwYsJV3t87UMi
ZbA=
=RUHM
-----END PGP SIGNATURE-----

--SSo7Z9twJTGc49FEsCORsLjVLabvW7dlP--
