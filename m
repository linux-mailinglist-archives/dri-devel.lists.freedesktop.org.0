Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92963494D51
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 12:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEF210E1E9;
	Thu, 20 Jan 2022 11:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0AB10E2FD;
 Thu, 20 Jan 2022 11:45:14 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Jfgfw6GWfz4xQp;
 Thu, 20 Jan 2022 22:45:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1642679113;
 bh=vmJ6No4MXJ1y6HZthOfeTVsE329K7/HTKQOxFIg5N/s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PgBYlSTiE7i4zenvW6uSPdRqysJd0zLllGOzu3fO0o9qfgHa6Kv7N804+Lkr8RoHY
 SFm2Av4jdV6tDvu8OeYrcNgXYiYCCNkhazTV3+f+BEJwkO7h051MAPHIIgHjsTTzaC
 6TRYLtjyg/2BXf5+l8NMLZqlT8sET9QbvOfOJ23xEAehcnDhgp9TdgpT12khXGOqcm
 Zvjbb3aEJrtFLEtuDyXH8fx/Setm1PTk1sH3H+40lCaVObCdSFS7TWE4MYD8ipRDLe
 jhToZWnsGLyrCGpYV5fwv2ISXzmsneI6QJJfSYis01Y84bkbQnGxt2rm2Qx8HKTP8a
 MD71dNTJwrJ1A==
Date: Thu, 20 Jan 2022 22:45:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/locking: fix drm_modeset_acquire_ctx kernel-doc
Message-ID: <20220120224511.4147b57d@canb.auug.org.au>
In-Reply-To: <20220120094856.3004147-1-jani.nikula@intel.com>
References: <20220120094856.3004147-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qySkoQcfoJqATNJL/57J00e";
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/qySkoQcfoJqATNJL/57J00e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jani,

On Thu, 20 Jan 2022 11:48:56 +0200 Jani Nikula <jani.nikula@intel.com> wrot=
e:
>
> The stack_depot member was added without kernel-doc, leading to below
> warning. Fix it.
>=20
> ./include/drm/drm_modeset_lock.h:74: warning: Function parameter or
> member 'stack_depot' not described in 'drm_modeset_acquire_ctx'
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: cd06ab2fd48f ("drm/locking: add backtrace for locking contended lo=
cks without backoff")
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  include/drm/drm_modeset_lock.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/drm/drm_modeset_lock.h b/include/drm/drm_modeset_loc=
k.h
> index b84693fbd2b5..ec4f543c3d95 100644
> --- a/include/drm/drm_modeset_lock.h
> +++ b/include/drm/drm_modeset_lock.h
> @@ -34,6 +34,7 @@ struct drm_modeset_lock;
>   * struct drm_modeset_acquire_ctx - locking context (see ww_acquire_ctx)
>   * @ww_ctx: base acquire ctx
>   * @contended: used internally for -EDEADLK handling
> + * @stack_depot: used internally for contention debugging
>   * @locked: list of held locks
>   * @trylock_only: trylock mode used in atomic contexts/panic notifiers
>   * @interruptible: whether interruptible locking should be used.
> --=20
> 2.30.2
>=20

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>

Thanks.
--=20
Cheers,
Stephen Rothwell

--Sig_/qySkoQcfoJqATNJL/57J00e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmHpS0cACgkQAVBC80lX
0Gx6AAf8DiA8eripQYIoKk75GgXoBWkcxW1SKpTH7vYyEy6JJ0SxhU+0kVXyg0wZ
QUM+gHO1tQEAYmnbmoKg2NytQmB/K5gqqD20h4ux0rF5MIslPN3nqHGXzI43rk6h
ERxUEaLgAln1pP9S/3gcYcvvBdLwI7rGFRLE6rpntAm+Brnn044+uW2l6QjReytB
oUl+uz5kHmoGZ6Tf2REodSwDktaV/FLoLUtDS6zJAmomv//hlcUZGsyR53js5TgU
8j40osBB70aPyH9pCtc4tZh7plXD9pJgC+xHkFJecIEytayKExyM0EDn3jjhW3x3
E88BjoLxx9+UkaMqSc4oW7dW7GOH2Q==
=TEFh
-----END PGP SIGNATURE-----

--Sig_/qySkoQcfoJqATNJL/57J00e--
