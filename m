Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14118905F4C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 01:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E4F10E012;
	Wed, 12 Jun 2024 23:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NnrvBYH4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B1710E942
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 23:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1718235440;
 bh=p0StulPiskZvXiAXXy2XqSB+UCYvZvpYVdWBgttD7Nk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NnrvBYH4gcX8jVX7MkBBhnFfP9qpqrsQxMTSYlOMraNkSxwFH0Li6QJtGdX/78m2a
 RBMRctyynP+nNr+yZoE+4fC+VvoXN8Nbv4dLqsD6fZK5ThvBv6j2Hpu4muLIDOaJz+
 4wxHZvfTbFt7oIcP50Jnd0epTTJgfM5nCKa1co+Z0PiHSF/DE04YPabQ4nm7r5F8v+
 gp994IEVMcFT4C/J6yPzIUzYcprN/wOTjjXl/T9UaIikSo3qmQJaAuiX+aKhBFPmly
 h0QusGDacO2lBOzdUVzeiiEkPpL+Uy41i4MOiL7W5nQaIB1Kghz0k60NTs/O6YILD1
 UWY1DJk6t4wWg==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sre)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D9AFF3781022;
 Wed, 12 Jun 2024 23:37:20 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
 id 56CFD10608F7; Thu, 13 Jun 2024 01:37:20 +0200 (CEST)
Date: Thu, 13 Jun 2024 01:37:20 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Oded Gabbay <ogabbay@kernel.org>, Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 1/9] iommu/rockchip: Add compatible for
 rockchip,rk3588-iommu
Message-ID: <75xclodzhu2slf6jntwxzx5gvthgl62g2jcmgeukbafkzkisbf@okedx7ic6aij>
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
 <20240612-6-10-rocket-v1-1-060e48eea250@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lszhpdxqfwkdo2zm"
Content-Disposition: inline
In-Reply-To: <20240612-6-10-rocket-v1-1-060e48eea250@tomeuvizoso.net>
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


--lszhpdxqfwkdo2zm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Tomeu,

On Wed, Jun 12, 2024 at 03:52:54PM GMT, Tomeu Vizoso wrote:
> So far, seems to be fully compatible with the one in the RK3568.
>=20
> The bindings already had this compatible, but the driver didn't
> advertise it.
>=20
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---

The driver does not need to advise it, since it already handles
"rockchip,rk3568-iommu" and the correct compatible for the RK3588
IOMMU is:

compatible =3D "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";

i.e. with the RK3568 compatible as fallback. So the kernel will
just bind to the fallback compatible. Iff differences are found
in the future, the kernel can start to make use of the more
specific compatible.

-- Sebastian

>  drivers/iommu/rockchip-iommu.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iomm=
u.c
> index 4b369419b32c..f5629515bd78 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -1363,6 +1363,9 @@ static const struct of_device_id rk_iommu_dt_ids[] =
=3D {
>  	{	.compatible =3D "rockchip,rk3568-iommu",
>  		.data =3D &iommu_data_ops_v2,
>  	},
> +	{	.compatible =3D "rockchip,rk3588-iommu",
> +		.data =3D &iommu_data_ops_v2,
> +	},
>  	{ /* sentinel */ }
>  };
> =20
>=20
> --=20
> 2.45.2
>=20
>=20

--lszhpdxqfwkdo2zm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmZqMSwACgkQ2O7X88g7
+poM9w//Quf+iUHT1ho9F5H0znbElz82rmJuzS/FCgjZREXsvOOlDdO9WHuR42rU
l7MZhQDNTSYuQ5ok+BbED5k26VuJf3KXdAU2k0guFceqY5kZiwJwq4HVEtUFeUqV
ShNoJYdOKvLtlpQKgVPj9SBTNz63dazB0XigVFEwP6U4fSM5n8OoE/JtBWcGZBsp
I22H5BHefpX7xVoG5d04lMM9EyOxeQToJ2Vveu7D7xMye8rEljBN+RHAnpUZ00dK
svok25DuJKwkWEiIEmPHqJah6avsRr7/vzUz0494Ybz5MkFOFrPVwPfPp9Ge3DK6
LIJ4YZtarT99Jz1kUWzzMS8Tls61CAp3CTxq8TrlFsUvRzqmdKMwy9r+TFaXaRHb
klyFZh+s+qZmMyGnYyWlnKY4RWKbP8EvyPAdGh73rvgjvAaciy8ozDfp8wdEPp0W
WgQ9hIFHPgqpvV+C3dYQv+QBe/ozOzZASrJtIec8PMozNXQcj8+xMfDhzM/k0sXi
azp/EFcbg8AEuoNiXhJmfQBX3lr5Mgf+z3vLvTyST+MTPD9ebqp1CkaBdrHT66jI
Agcf6OBhf8/BYIHTv5e7uFho09S/frrYXqskHJnazd/tckysU+jf//EryBDLOF77
DCJbslCIkJ/jIfrX9BAKU+U+At3JN68xbB+Z1WOu5OoExUtLhO8=
=mDX6
-----END PGP SIGNATURE-----

--lszhpdxqfwkdo2zm--
