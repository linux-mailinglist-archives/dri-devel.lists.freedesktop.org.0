Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FC212415A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413646EA42;
	Wed, 18 Dec 2019 08:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 449 seconds by postgrey-1.36 at gabe;
 Tue, 17 Dec 2019 17:36:02 UTC
Received: from mail.pmoreau.org (pmoreau.org [37.187.98.141])
 by gabe.freedesktop.org (Postfix) with ESMTP id DFA886E05C;
 Tue, 17 Dec 2019 17:36:02 +0000 (UTC)
Received: from pmoreau.org (unknown
 [IPv6:2a01:e35:2fd7:d5a0:a93f:fcc7:d652:2bb2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: eiquom6u@pmoreau.org)
 by mail.pmoreau.org (Postfix) with ESMTPSA id 92840A40850;
 Tue, 17 Dec 2019 18:28:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=pmoreau.org;
 s=default; t=1576603711;
 bh=30ew8plVfwsmK02Gcyxb8vJmPnlaOBwg60YRDUqEh48=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=j7jkJ2dYUBz1ABbfhdITW9qg+t5aRQWQvJbalBFPjblrYoPCFadGprefRebxLVe4y
 bzi+mRMnwRJo+k8t4NrbQxWhTKS9GEQEGGvNynr9259MIeelQpfZq0bEjwYKrsCaFJ
 qWyAQBnPuijRNp+wEj865Q17j9ZkTdT0c76j0hdU=
Date: Tue, 17 Dec 2019 18:28:22 +0100
From: Pierre Moreau <contact@pmoreau.org>
To: zhengbin <zhengbin13@huawei.com>
Subject: Re: [PATCH] drm/nouveau/mmu: Remove unneeded semicolon
Message-ID: <20191217172822.6ivdgdo7g7dorj2a@pmoreau.org>
Mail-Followup-To: zhengbin <zhengbin13@huawei.com>, bskeggs@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <1576468096-63366-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1576468096-63366-1-git-send-email-zhengbin13@huawei.com>
X-Mailman-Approved-At: Wed, 18 Dec 2019 08:13:02 +0000
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com
Content-Type: multipart/mixed; boundary="===============1410055713=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1410055713==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vgqfymq4dbr4mqye"
Content-Disposition: inline


--vgqfymq4dbr4mqye
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

With the comment further below addressed, this patch is
Reviewed-by: Pierre Moreau <dev@pmoreau.org>

On 2019-12-16 =E2=80=94 11:48, zhengbin wrote:
> Fixes coccicheck warning:
>=20
> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:583:2-3: Unneeded semicolon
> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h:307:2-3: Unneeded semicolon
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: zhengbin <zhengbin13@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/mmu/vmm.c
> index 41640e0..199f94e 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> @@ -580,7 +580,7 @@ nvkm_vmm_iter(struct nvkm_vmm *vmm, const struct nvkm=
_vmm_page *page,
>  				it.pte[it.lvl]++;
>  			}
>  		}
> -	};
> +	}
>=20
>  	nvkm_vmm_flush(&it);
>  	return ~0ULL;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/=
drm/nouveau/nvkm/subdev/mmu/vmm.h
> index 5e55ecb..321bfca 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> @@ -304,7 +304,7 @@ int tu102_vmm_new(struct nvkm_mmu *, bool, u64, u64, =
void *, u32,
>  		FILL(VMM, PT, PTEI, _ptes, MAP, _addr);                        \
>  		PTEI +=3D _ptes;                                                 \
>  		PTEN -=3D _ptes;                                                 \
> -	};                                                                     \
> +	}                                                                     \

You are missing one space after the closing curly bracket, to align the
backslash at the end of the line.

Thanks,
Pierre Moreau

>  	nvkm_done((PT)->memory);                                               \
>  } while(0)
>=20
> --
> 2.7.4
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--vgqfymq4dbr4mqye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEej50sMo3avjoHMecTsmfhA5fDzsFAl35EDUACgkQTsmfhA5f
DzuvgQ/8Ctn+W37Q9fWdH1uu0TjXwVACe9zx47KGz8B6af+Jy6eR91sHdjUVjVu3
cZOAgqiwQa8D9FT7/B0Ti2vWofsABbQ254RTRU1yzAn3B+4LMAMg7isGu8Fn3pyB
ZEW2moSGaG+pZBwdesWAl5VRRlGEy0VJ6vys78TooJ6z1ve/GchpFkRfqYYcuIF5
1UrTDbP4QbrijxLjOKh4x3s+jUevbu3oLQVyYv+tLDZ8Pns0OWS453MBJIVIsWg9
7eB4lpP/hXw7g0b4KlgZRIYx6I7+Xu3TvgffprAaldMvtmYurcF3zE3TEivThpPk
8KKk0L2r8xq/7mhVLKq4vBcnOXDTYd6qQodcHWWETpkJf45ixidG+qQSw7AbqaSs
o/h3Pe0W6h1KLjgTWACxlhNZsf+vb187dHi8aLQUKJJyEvABdH08yFbtHZDRKsRj
la4JAiE4sn9wzg4svgp+yZUWIi54jazEdGKTcBti9iT+lC+wh6zwtGWYFrhB8Gz8
eEBjFyepLdNXw8SA2G/rNQ47aIFBLKOaeFP/8BtQjtFfFCnRV3ziNvqNfT8+BZNu
TBtQCs+ior/nrh4EzGMWv39oP6RiJ2VZaaaRbUgyz0JOGKtlFx9+On3DPL/35ud/
ESP3t9TJAzbMet6NAj5D3h07um4NX/APavYnAMIr3S3H3WzTbAE=
=04OF
-----END PGP SIGNATURE-----

--vgqfymq4dbr4mqye--

--===============1410055713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1410055713==--
