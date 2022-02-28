Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9734C61D9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 04:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4A810E143;
	Mon, 28 Feb 2022 03:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D244010E143
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 03:30:31 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K6Qr52yV0z4xcZ;
 Mon, 28 Feb 2022 14:30:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1646019030;
 bh=fFGfNTWBpPZK6KTga7di37oMpun8zfKH3ME2alMatHA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=N45U571qMwiy6QSFly3IzVX8Mk64R9GXlTPiOIjqUiwiBmI/XOk6Csid2eyjY+a6A
 M6vNeriDMKP4gIrsOk2yUWVVMoAmf0DBnH0JofDkH3nHd9M+/ixEJpUPBQwl8xXIAP
 obQH1fHt7eE/K13gZ7tp5d6x/lqLExe51jowvWs+xCcA88dcPKIBtmLiIvXH1isVXD
 q3p02Qu64vWd9E/qG7Cx9/EKvq4EmUtHaZDv0weRML6GIVtHZ+L+mkcKm5vEIWIjgJ
 AP278Wik4N38Dnkhno0rwXj6WMIVZ+nhRSLndeQ2XuqYLC7IMUNh22ozkSJleZEhJs
 pROfUekzN7m7Q==
Date: Mon, 28 Feb 2022 14:30:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thierry Reding <thierry.reding@gmail.com>, Dave Airlie
 <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the drm-tegra tree with the drm tree
Message-ID: <20220228143028.53fdde86@canb.auug.org.au>
In-Reply-To: <20220223163007.328242-1-broonie@kernel.org>
References: <20220223163007.328242-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p.IHzvdzT7lUS8h=WkGcD31";
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
Cc: Thierry Reding <treding@nvidia.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, broonie@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/p.IHzvdzT7lUS8h=WkGcD31
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 23 Feb 2022 16:30:07 +0000 broonie@kernel.org wrote:
>
> Today's linux-next merge of the drm-tegra tree got conflicts in:
>=20
>   drivers/gpu/drm/tegra/dpaux.c
>   drivers/gpu/drm/tegra/Kconfig
>=20
> between commit:
>=20
>   adb9d5a2cc77e ("drm/dp: Move DisplayPort helpers into separate helper m=
odule")
>=20
> from the drm tree and commit:
>=20
>   8913e1aea4b32 ("drm/tegra: dpaux: Populate AUX bus")
>=20
> from the drm-tegra tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/gpu/drm/tegra/Kconfig
> index 18c319b804c00,201f5175ecfec..0000000000000
> --- a/drivers/gpu/drm/tegra/Kconfig
> +++ b/drivers/gpu/drm/tegra/Kconfig
> @@@ -5,7 -5,7 +5,8 @@@ config DRM_TEGR
>   	depends on COMMON_CLK
>   	depends on DRM
>   	depends on OF
>  +	select DRM_DP_HELPER
> + 	select DRM_DP_AUX_BUS
>   	select DRM_KMS_HELPER
>   	select DRM_MIPI_DSI
>   	select DRM_PANEL
> diff --cc drivers/gpu/drm/tegra/dpaux.c
> index 8ca500977a46b,d7a731d287d23..0000000000000
> --- a/drivers/gpu/drm/tegra/dpaux.c
> +++ b/drivers/gpu/drm/tegra/dpaux.c
> @@@ -18,7 -18,8 +18,8 @@@
>   #include <linux/reset.h>
>   #include <linux/workqueue.h>
>  =20
>  -#include <drm/drm_dp_helper.h>
>  -#include <drm/drm_dp_aux_bus.h>
>  +#include <drm/dp/drm_dp_helper.h>
> ++#include <drm/dp/drm_dp_aux_bus.h>
>   #include <drm/drm_panel.h>
>  =20
>   #include "dp.h"

This is now a conflict between the drm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/p.IHzvdzT7lUS8h=WkGcD31
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmIcQdQACgkQAVBC80lX
0Gy8PwgAm4LtXpGy5IwqeR44tbNRTRjR4fhU9B8iuuGFElJ4mNSlTxf4Rbd89das
MFqdJU5sj1zxk9k8QGcqvPDTfvoO9lmSnSdDmg1Uy381UMCO8m425kqjCSEn1i6F
IH8/DDGt+PYHAR9JIVHifFuBQxfmI2TEM6DAYhj9MzuNdbozcU5zyor7KbpEbDWk
rlCUaBgZwVlkmMt0hByqCnsOpwKHO/GGvOOXBQdDt6auUPE3NrXpgRhUXAvmlICm
948pOrvXWmQaq2ZNavoRc7ILhoVYMRZhRS7OumBn02nAuUAV6TKvbmwZ15kKndCZ
u25tPBU+bythV4TLRsjxbZHMPAUClw==
=KWpo
-----END PGP SIGNATURE-----

--Sig_/p.IHzvdzT7lUS8h=WkGcD31--
