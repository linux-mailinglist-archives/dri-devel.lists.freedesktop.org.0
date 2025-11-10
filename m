Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36395C453B7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 08:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD2E10E1E7;
	Mon, 10 Nov 2025 07:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=natalenko.name header.i=@natalenko.name header.b="LAyObUYC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 587 seconds by postgrey-1.36 at gabe;
 Mon, 10 Nov 2025 07:38:16 UTC
Received: from prime.voidband.net (prime.voidband.net [199.247.17.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C3710E2A2;
 Mon, 10 Nov 2025 07:38:16 +0000 (UTC)
Received: from spock.localnet (unknown [212.20.115.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by prime.voidband.net (Postfix) with ESMTPSA id 2D271635B041;
 Mon, 10 Nov 2025 08:28:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
 s=dkim-20170712; t=1762759705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BFX8HjHRy+Iigy+inpDUN8qKkzpCG3IHAa/v/R5/veE=;
 b=LAyObUYCiDeDWmI0C722Sq7EqQATzMVmHDMUPDRy54ja6mLM7tcbKNq28p1E5cnAUp5nWT
 1JKIkUxdMUTBBxiFPYqrftt0/Fzz9g4pslbozbeWuK4vklV3RW0jPaqO09wNL3e7kSJO45
 9cVSYKm9/41haQkG/Wp9r4Atqg/X6YI=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Brady Norander <bradynorander@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, sunil.khatri@amd.com, boyuan.zhang@amd.com
Subject: Re: [PATCH] drm/amdgpu: use static ids for ACP platform devs
Date: Mon, 10 Nov 2025 08:28:10 +0100
Message-ID: <2804615.mvXUDI8C0e@natalenko.name>
In-Reply-To: <20250325210517.2097188-1-bradynorander@gmail.com>
References: <20250325210517.2097188-1-bradynorander@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart12775757.O9o76ZdvQC";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
x-ms-reactions: disallow
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

--nextPart12775757.O9o76ZdvQC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: [PATCH] drm/amdgpu: use static ids for ACP platform devs
Date: Mon, 10 Nov 2025 08:28:10 +0100
Message-ID: <2804615.mvXUDI8C0e@natalenko.name>
In-Reply-To: <20250325210517.2097188-1-bradynorander@gmail.com>
References: <20250325210517.2097188-1-bradynorander@gmail.com>
MIME-Version: 1.0

Hello.

On =C3=BAter=C3=BD 25. b=C5=99ezna 2025 22:05:17, st=C5=99edoevropsk=C3=BD =
standardn=C3=AD =C4=8Das Brady Norander wrote:
> mfd_add_hotplug_devices() assigns child platform devices with
> PLATFORM_DEVID_AUTO, but the ACP machine drivers expect the platform
> device names to never change. Use mfd_add_devices() instead and give
> each cell a unique id.
>=20
> Signed-off-by: Brady Norander <bradynorander@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_acp.c
> index deb0785350e8..9c657637d317 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> @@ -302,17 +302,19 @@ static int acp_hw_init(struct amdgpu_ip_block *ip_b=
lock)
>  		adev->acp.acp_res[2].end =3D adev->acp.acp_res[2].start;
> =20
>  		adev->acp.acp_cell[0].name =3D "acp_audio_dma";
> +		adev->acp.acp_cell[0].id =3D 0;
>  		adev->acp.acp_cell[0].num_resources =3D 3;
>  		adev->acp.acp_cell[0].resources =3D &adev->acp.acp_res[0];
>  		adev->acp.acp_cell[0].platform_data =3D &adev->asic_type;
>  		adev->acp.acp_cell[0].pdata_size =3D sizeof(adev->asic_type);
> =20
>  		adev->acp.acp_cell[1].name =3D "designware-i2s";
> +		adev->acp.acp_cell[1].id =3D 1;
>  		adev->acp.acp_cell[1].num_resources =3D 1;
>  		adev->acp.acp_cell[1].resources =3D &adev->acp.acp_res[1];
>  		adev->acp.acp_cell[1].platform_data =3D &i2s_pdata[0];
>  		adev->acp.acp_cell[1].pdata_size =3D sizeof(struct i2s_platform_data);
> -		r =3D mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell, 2);
> +		r =3D mfd_add_devices(adev->acp.parent, 0, adev->acp.acp_cell, 2, NULL=
, 0, NULL);
>  		if (r)
>  			goto failure;
>  		r =3D device_for_each_child(adev->acp.parent, &adev->acp.acp_genpd->gp=
d,
> @@ -410,30 +412,34 @@ static int acp_hw_init(struct amdgpu_ip_block *ip_b=
lock)
>  		adev->acp.acp_res[4].end =3D adev->acp.acp_res[4].start;
> =20
>  		adev->acp.acp_cell[0].name =3D "acp_audio_dma";
> +		adev->acp.acp_cell[0].id =3D 0;
>  		adev->acp.acp_cell[0].num_resources =3D 5;
>  		adev->acp.acp_cell[0].resources =3D &adev->acp.acp_res[0];
>  		adev->acp.acp_cell[0].platform_data =3D &adev->asic_type;
>  		adev->acp.acp_cell[0].pdata_size =3D sizeof(adev->asic_type);
> =20
>  		adev->acp.acp_cell[1].name =3D "designware-i2s";
> +		adev->acp.acp_cell[1].id =3D 1;
>  		adev->acp.acp_cell[1].num_resources =3D 1;
>  		adev->acp.acp_cell[1].resources =3D &adev->acp.acp_res[1];
>  		adev->acp.acp_cell[1].platform_data =3D &i2s_pdata[0];
>  		adev->acp.acp_cell[1].pdata_size =3D sizeof(struct i2s_platform_data);
> =20
>  		adev->acp.acp_cell[2].name =3D "designware-i2s";
> +		adev->acp.acp_cell[2].id =3D 2;
>  		adev->acp.acp_cell[2].num_resources =3D 1;
>  		adev->acp.acp_cell[2].resources =3D &adev->acp.acp_res[2];
>  		adev->acp.acp_cell[2].platform_data =3D &i2s_pdata[1];
>  		adev->acp.acp_cell[2].pdata_size =3D sizeof(struct i2s_platform_data);
> =20
>  		adev->acp.acp_cell[3].name =3D "designware-i2s";
> +		adev->acp.acp_cell[3].id =3D 3;
>  		adev->acp.acp_cell[3].num_resources =3D 1;
>  		adev->acp.acp_cell[3].resources =3D &adev->acp.acp_res[3];
>  		adev->acp.acp_cell[3].platform_data =3D &i2s_pdata[2];
>  		adev->acp.acp_cell[3].pdata_size =3D sizeof(struct i2s_platform_data);
> =20
> -		r =3D mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell, AC=
P_DEVS);
> +		r =3D mfd_add_devices(adev->acp.parent, 0, adev->acp.acp_cell, ACP_DEV=
S, NULL, 0, NULL);
>  		if (r)
>  			goto failure;

Is this patch still supposed to be applied?

Thank you.

=2D-=20
Oleksandr Natalenko, MSE
--nextPart12775757.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAmkRlAoACgkQil/iNcg8
M0upCRAAznBKt2hrp2RHMh7VAjnb5D+v3EJ7DHNtNDCe+yen7/KRsUo6eJWV9OpT
3mXP189NsqaI29dEosz8MJB3i3E8oO+vr1wO7DXsWCDJpZpHCdwLyv97VaW5tlpL
JGB8UZ24GIwnp+z+ZvYg77/NZvbppfUo2sqak+CHbVU9iwx2fwOTOj2GPco74xhx
8ynKcdDQbkO6J4ags1YdV0g63Pvz6YqqkxiIVUZGfBgt+YoIkUIp3X63VqoMwf1s
e+kgTgirDBTlYhKoP5+X7EfRf/XSV2yN0YmWcifOSrHamv2w7zDOgeuMCDgPXC54
vs2o+DdbK8899KaS+Ir8U8x6+ZiIdJyUx2QoJWOQ4orwgapKf1uC+AuuqxTHsfmy
y4+2KpVEUbGxYMWJyTIhw3DMwl/eeBfmiVgW23MakN7LYZia8Ssvel8k9FpplaO3
ifCrD/XyHtcjPIg60Of/+9P1m+O1BL7orA5DdnrGY45QEFJF0kkP/jHMLeK0fbdd
lRXny0K5j4rEX/htPpI71LAJV/iodVk6aoM+Dbse3JOT8a5ROWGQtMO3oDh985OB
l+tF24HNGtyJg7hGqqNL9TuSoug9MBBerruQuG7I76n3aqvpAtwyRWZWr/jpgycJ
5GoRx4E4JvwueScadNTOH5Y3XzlAu8pQMXAIjjBv6IBFXEccQEk=
=N2yv
-----END PGP SIGNATURE-----

--nextPart12775757.O9o76ZdvQC--



