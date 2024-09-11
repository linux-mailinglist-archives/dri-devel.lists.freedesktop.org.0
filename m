Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4799748ED
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 05:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D2310E85A;
	Wed, 11 Sep 2024 03:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="u39ZYxd0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F227C10E798;
 Wed, 11 Sep 2024 03:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1726026772;
 bh=4cLsHOdIrDItCYbM4nmmHVgtwp5tvkm25Cd2UPG6inI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=u39ZYxd0uX8xr1RWKN1hvKD9erbcRqS+5iAyrs3c70p9rAQNf22DtUZAmDOe5HDDi
 qseN3PEFaEJP7/XfiQrzNfB19nflldAeAPKmP5qXUlfv4fvf3aISdZmmTQCg7X6u0B
 Cn+TTSHLOSrpl5HFmfJ8MJ7JLzATxrRdzCIOJu9UuNjSKoeDFuw6QS41pLkW4rWbme
 9LtKkUEoYMBWEcSFM6IUaZjGQGtYjxd113gveLxYurIbhf/yQDF5wkJt1TLnF44YVH
 hvvXC4Lcm1MwfTFMzVmXF+fo5aQwBbNfzyLiqDr0kBYxLC0bKQxwZ/kkRZwaLqHjqV
 8yWe0dMERo3zQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3RVV2TLlz4wbr;
 Wed, 11 Sep 2024 13:52:50 +1000 (AEST)
Date: Wed, 11 Sep 2024 13:52:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 DRM XE List <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the drm-xe tree with the drm-intel
 tree
Message-ID: <20240911135249.543da06a@canb.auug.org.au>
In-Reply-To: <20240906131502.7a7d1962@canb.auug.org.au>
References: <20240906131502.7a7d1962@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pqjj7CBh1aZCT0XPsG8iNFK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Pqjj7CBh1aZCT0XPsG8iNFK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 6 Sep 2024 13:15:02 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the drm-xe tree got a conflict in:
>=20
>   drivers/gpu/drm/xe/display/xe_display.c
>=20
> between commit:
>=20
>   11d0613af7c5 ("drm/i915/display: include drm/drm_probe_helper.h where n=
eeded")
>=20
> from the drm-intel tree and commit:
>=20
>   87d8ecf01544 ("drm/xe: replace #include <drm/xe_drm.h> with <uapi/drm/x=
e_drm.h>")
>=20
> from the drm-xe tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/gpu/drm/xe/display/xe_display.c
> index 303d00b99a68,75736faf2a80..000000000000
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@@ -10,8 -10,7 +10,8 @@@
>  =20
>   #include <drm/drm_drv.h>
>   #include <drm/drm_managed.h>
>  +#include <drm/drm_probe_helper.h>
> - #include <drm/xe_drm.h>
> + #include <uapi/drm/xe_drm.h>
>  =20
>   #include "soc/intel_dram.h"
>   #include "i915_drv.h"		/* FIXME: HAS_DISPLAY() depends on this */

This is now a conflict between the drm-intel and drm trees.

--=20
Cheers,
Stephen Rothwell

--Sig_/Pqjj7CBh1aZCT0XPsG8iNFK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbhFBEACgkQAVBC80lX
0GzOcwf/Tc+omT+PVlY+X6N3J0CfM42k39uVnzUvyQWuvr1H5vgittra9ejFZ1Vb
i1D/5fZUv76fqCQy4232fpMD79GPGqywqGUaZcXlA2JPOU1OLik7/Vfer/U5yfKL
9uEHap1QdgD+whexYkWJTG5hROMS2b/8Vp6OuVOjIriUIxphofe680phiBSspjq3
o9ahWGeSjj5JPiOFbvAjQLmd8yovFMeehSnQ+SdZ9xOHc0MTBb7Mjbq9pevmprI4
Azn0l5ZGIrQvXf+0W2jFzcQKJ2b00tXSi+b4a6HnqE+8JJ/QtMUsuaLJW0XnYaqC
pho6916c+7ARMda0KohK/D/z7FePnA==
=8BlM
-----END PGP SIGNATURE-----

--Sig_/Pqjj7CBh1aZCT0XPsG8iNFK--
