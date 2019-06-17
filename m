Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B59478A1
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 05:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0FE89187;
	Mon, 17 Jun 2019 03:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555FB89186;
 Mon, 17 Jun 2019 03:25:08 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45RxRN6tlcz9sBp;
 Mon, 17 Jun 2019 13:25:04 +1000 (AEST)
Date: Mon, 17 Jun 2019 13:25:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexdeucher@gmail.com>
Subject: Re: linux-next: manual merge of the drm-misc tree with the amdgpu tree
Message-ID: <20190617132504.2cf70caf@canb.auug.org.au>
In-Reply-To: <20190612114615.69a78655@canb.auug.org.au>
References: <20190612114615.69a78655@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1560741906;
 bh=ybZ9kfd8BqZ5IeQ7uWoB5rdf9MlwGRYtVyyb/7TehV4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZYe8InBSjtvC0Rq4E0GsWn0uKWuK7Lml7+BhjfjebHEcNHsfyjvuCjzqefPOoFNwZ
 JGk3EU3F5OtZV43FdCl9dzH44C7fY3N9NH0jbOxhSHROHZGP0xyP0X+ybBY62fREk2
 8KmmPeOHp7nrSuD0AouplCthgdvT4yOCo+WRVkalVaN08DBoaQi2wbUIKPQuULRip/
 TWFeVEGXaoea6NLKVXXVl/A9mUfeJtJIRYhDjcU9jA2empmyFUxH95hBm8OJpIcrh+
 FBYiX/cqtXMbspBqgt+wgaguYUcxsCJPBImbBDOT0U9ZnFn2TUyHubPTobZqyMu3EZ
 YIe1CMTFIU3UQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Dave Airlie <airlied@linux.ie>, Charlene Liu <charlene.liu@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0887529155=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0887529155==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/pBbuo/mx.9ub.bLi2Nl_21V"; protocol="application/pgp-signature"

--Sig_/pBbuo/mx.9ub.bLi2Nl_21V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 12 Jun 2019 11:46:15 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> Today's linux-next merge of the drm-misc tree got a conflict in:
>=20
>   drivers/gpu/drm/amd/display/dc/dce/dce_audio.c
>=20
> between commit:
>=20
>   c7c7192c56d2 ("drm/amd/display: add audio related regs")
>=20
> from the amdgpu tree and commit:
>=20
>   4fc4dca8320e ("drm/amd: drop use of drmp.h in os_types.h")
>=20
> from the drm-misc tree.
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
> diff --cc drivers/gpu/drm/amd/display/dc/dce/dce_audio.c
> index d43d5d924c19,9b078a71de2e..000000000000
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c
> @@@ -22,7 -22,9 +22,10 @@@
>    * Authors: AMD
>    *
>    */
> +=20
> + #include <linux/slab.h>
> +=20
>  +#include "../dc.h"
>   #include "reg_helper.h"
>   #include "dce_audio.h"
>   #include "dce/dce_11_0_d.h"

This is now a conflict between the drm tree and the amdgpu tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/pBbuo/mx.9ub.bLi2Nl_21V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0HCBAACgkQAVBC80lX
0GxBBwf8CoFB80pNJP6cX+YNjV2ZKobvI1VFUmzmEog2O/V8WCoCN5WupKfm4Gf1
Ea0TELkV5+6TnObptjAVgBjxl0hSYJGZ56ncNpQl8Q8a8eo0L4PvEY4EF9CP2DBG
rCY7GHqLnoh6vl6h4kXgiw1qS6EPsAauW/Dw2BSGpbEq9kj+o9v9VnloPBaNeFvy
pDKoxqHXfQcq+srgFOxAR0LiigcJYBxXqLXp/YehfGRRP4FkHk94OnHFx8jM08JG
7TZPMfvkxCxMIJ1pt0LroHy0v5TUe7Q/L/15UfC6E59WHChNaPWLKk0X6/h/lgHX
TgCvoFy9JxWfxUTj2JH49z7N4HEkqQ==
=glaT
-----END PGP SIGNATURE-----

--Sig_/pBbuo/mx.9ub.bLi2Nl_21V--

--===============0887529155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0887529155==--
