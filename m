Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99207125C62
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 09:11:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD626EAB9;
	Thu, 19 Dec 2019 08:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 874 seconds by postgrey-1.36 at gabe;
 Wed, 18 Dec 2019 14:53:49 UTC
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBF86E4E8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 14:53:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 55C4EB3E2;
 Wed, 18 Dec 2019 14:39:13 +0000 (UTC)
Message-ID: <78a1badd7c08ca39e7f62c6b66addeb2bf485a1e.camel@suse.de>
Subject: Re: [PATCH] gpu/drm/v3d: Add ARCH_BCM2835 to DRM_V3D Kconfig
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Peter Robinson <pbrobinson@gmail.com>, Eric Anholt <eric@anholt.net>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Florian Fainelli <f.fainelli@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 18 Dec 2019 15:39:02 +0100
In-Reply-To: <20191218084320.312561-1-pbrobinson@gmail.com>
References: <20191218084320.312561-1-pbrobinson@gmail.com>
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 19 Dec 2019 08:11:13 +0000
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
Content-Type: multipart/mixed; boundary="===============1727108766=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1727108766==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-dQNxoxTSFb/E0Lltjh2W"


--=-dQNxoxTSFb/E0Lltjh2W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Wed, 2019-12-18 at 08:43 +0000, Peter Robinson wrote:
> On arm64 the config ARCH_BCM doesn't exist so to be able to
> build for platforms such as the Raspberry Pi 4 we need to add
> ARCH_BCM2835 similar to what has been done on vc4.
>=20
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---

v3d's upstream implementation doesn't support RPi4 for now. So I don't see =
how
we could benefit from this.

That said you're more than welcome to have a go at adding support for RPi4.=
 It
seems to me that the divergence betweeen us and Raspberry Pi foundation's
kernel isn't that big. Maybe Eric can share some extra light on this.

Regards,
Nicolas

>  drivers/gpu/drm/v3d/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/Kconfig b/drivers/gpu/drm/v3d/Kconfig
> index 9a5c44606337..b0e048697964 100644
> --- a/drivers/gpu/drm/v3d/Kconfig
> +++ b/drivers/gpu/drm/v3d/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_V3D
>  	tristate "Broadcom V3D 3.x and newer"
> -	depends on ARCH_BCM || ARCH_BCMSTB || COMPILE_TEST
> +	depends on ARCH_BCM || ARCH_BCMSTB || ARCH_BCM2835 || COMPILE_TEST
>  	depends on DRM
>  	depends on COMMON_CLK
>  	depends on MMU


--=-dQNxoxTSFb/E0Lltjh2W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl36OgYACgkQlfZmHno8
x/53VAf+OP1RkfSy/jgroNYtSQKCf77Xv18wNpP9BAd/32YNu65bmnM25QYvqVza
s/HrSqBvmae80LkVRUnj3danXmHmHx+c9gx/6VEGi2+BZ0EF6hotsCthvlkABi4o
dT3w/0S0uYzejyne1f1v/MnuvBgPcvVl6Xl193SHT9Bt8a6Y2GwCrrkzq+Vy1tGw
ddK3BVyOWTsyVstI0pYQ7UE51k4Xn0Ka/yiB1FZuIU+5mT0EvYZhBd2ivtX9I9AY
a+zcIJ42OzGQVMIr+9ve0r+7QuveM9GHIwjqxRnP5EsPlO/PN209IwVePNyiWiLw
AOQOihepJh3qInBRU2Ppn+na2ZooUQ==
=bMtf
-----END PGP SIGNATURE-----

--=-dQNxoxTSFb/E0Lltjh2W--


--===============1727108766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1727108766==--

