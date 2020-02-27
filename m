Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A20F417283B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7FC6EC4B;
	Thu, 27 Feb 2020 18:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6161C6EC4B;
 Thu, 27 Feb 2020 18:59:41 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id j23so57156qtr.11;
 Thu, 27 Feb 2020 10:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PeJqgKLVm0WlNj8ytf0PvD1N9e+PYxZ2iWlUUOyvLiY=;
 b=SxOfSBs8lps8BI+jrH/Sst12rIxJeS2OCF4tOMboq6kua2057hFr9nBa2B0NuBETYs
 Dex7WBMmAiIP+PXkDUB5TTgrSBd+lEEURQBv517GNHj+ODIc9HrjdPCODQ804S6QHt/v
 ViBwV/N/4QLS9COQT6jKYM/arELhnnvkbhEVnCCCNyVTt76KmG84fy4zG4R6INILVRIs
 Fvq19DtIMHB2x2svvwE3opjBs3f5MANPHb+MpUTKFoZshRE5RhU/sH+PZjhcGPn8rGiF
 I0u4oPAiFTaqOXHg0V1wHNZBgVRUEpizzGRjdx0uTcTLO6Qj5RmAf3o9CwSSn2P7ptwz
 c5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PeJqgKLVm0WlNj8ytf0PvD1N9e+PYxZ2iWlUUOyvLiY=;
 b=gPxjaukDKbDk1MuQM6CNg1dct/0Xh8Jh8d8uftqI9Zdhsa/wVK8lkNI9gFKYrkL8MA
 yiZ4DZntlmwMl4O9fSMjanz8052pULHxTB/W++EwnTTi8FnYyM53tOuYpUCCzwMHyKgO
 cqRxHw9vansgbZ/xVKlTjs2neaus0Uhb0HsBase6+xB7fl65OXkvg4Omp9UwCSqHGe0K
 lNSdU3hC6nSaL9B4eDG0BQVboM/1Os4Uc+lZiPBuZflnuDsJDISP1DT+pqRmvMQuFzls
 uKOqYyYqP16W6ER0zR+nyD2lbHlhYkG8CX4lPcwS/0pm3D5WlWoWu8De+yEPj46pjEvY
 NCcA==
X-Gm-Message-State: APjAAAU26xHTzDF05o1qjoETL4rPCjKnQ03N6FN4tJVdB0OPPYk6BUYr
 RLEkaM57GfeIr5cIfB8SFOA=
X-Google-Smtp-Source: APXvYqy854ChfS2oPOQ2FtGEOGi6EcVDzxph+auj0Cjj1Fsk/OVxKqcGZDfaIBafaLug0rHSacQ39w==
X-Received: by 2002:ac8:65d3:: with SMTP id t19mr654638qto.369.1582829979694; 
 Thu, 27 Feb 2020 10:59:39 -0800 (PST)
Received: from smtp.gmail.com ([165.204.55.250])
 by smtp.gmail.com with ESMTPSA id a192sm3626703qkb.53.2020.02.27.10.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:59:38 -0800 (PST)
Date: Thu, 27 Feb 2020 13:59:37 -0500
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 14/51] drm/vkms: Use drmm_add_final_kfree
Message-ID: <20200227185937.oycms4mbsjpuya6q@smtp.gmail.com>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-15-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20200227181522.2711142-15-daniel.vetter@ffwll.ch>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 m.felsch@pengutronix.de, DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1789099610=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1789099610==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gn6hus3zmjl2ct5b"
Content-Disposition: inline


--gn6hus3zmjl2ct5b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the patch.

I reviewed and tested this patch, and everything looks fine.

Reviewed-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Tested-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>

On 02/27, Daniel Vetter wrote:
> With this we can drop the final kfree from the release function.
>=20
> v2: After drm_dev_init/drmm_add_final_kfree we need to clean up
> everything through a drm_dev_put. Rework the unwind code to match
> that.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index 860de052e820..2f35fe789343 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -21,6 +21,7 @@
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_ioctl.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
> =20
> @@ -158,13 +159,14 @@ static int __init vkms_init(void)
>  			   &vkms_device->platform->dev);
>  	if (ret)
>  		goto out_unregister;
> +	drmm_add_final_kfree(&vkms_device->drm, vkms_device);
> =20
>  	ret =3D dma_coerce_mask_and_coherent(vkms_device->drm.dev,
>  					   DMA_BIT_MASK(64));
> =20
>  	if (ret) {
>  		DRM_ERROR("Could not initialize DMA support\n");
> -		goto out_fini;
> +		goto out_put;
>  	}
> =20
>  	vkms_device->drm.irq_enabled =3D true;
> @@ -172,25 +174,25 @@ static int __init vkms_init(void)
>  	ret =3D drm_vblank_init(&vkms_device->drm, 1);
>  	if (ret) {
>  		DRM_ERROR("Failed to vblank\n");
> -		goto out_fini;
> +		goto out_put;
>  	}
> =20
>  	ret =3D vkms_modeset_init(vkms_device);
>  	if (ret)
> -		goto out_fini;
> +		goto out_put;
> =20
>  	ret =3D drm_dev_register(&vkms_device->drm, 0);
>  	if (ret)
> -		goto out_fini;
> +		goto out_put;
> =20
>  	return 0;
> =20
> -out_fini:
> -	drm_dev_fini(&vkms_device->drm);
> +out_put:
> +	drm_dev_put(&vkms_device->drm);
> +	return ret;
> =20
>  out_unregister:
>  	platform_device_unregister(vkms_device->platform);
> -
>  out_free:
>  	kfree(vkms_device);
>  	return ret;
> @@ -205,8 +207,6 @@ static void __exit vkms_exit(void)
> =20
>  	drm_dev_unregister(&vkms_device->drm);
>  	drm_dev_put(&vkms_device->drm);
> -
> -	kfree(vkms_device);
>  }
> =20
>  module_init(vkms_init);
> --=20
> 2.24.1
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--gn6hus3zmjl2ct5b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl5YEZQACgkQWJzP/com
vP8JAw/+KvmBQJomE1YQWYkBHHFwyTJ9iKXPiFnmmzLqvw3WrnSXkpjt6sNg80ZE
hCoQ8dnw8VccJvl0vPDuO47ynft/1wImmuIhQYSIex6Vm32UYfq5OPOFv6XYxybl
VuUmLV4UEE95tdxfqgmjXDraMekGgdlcmfeVt0GwwlgzRzUmPZZJNBmDVmOse6c0
l9+lBiOmOG1LPVEAOVgSq1wnJZKN8GIfdu/VzrMvKbpOLq3kiIz4qBU35HmCmTHm
2EOAWn4sUD0qZUxyQZWRugiNM1L7EqjvjSZDQ2lQF4JjuJgxohnydjOe7l0mhN4N
ltxEKqxfdzdNYp3teSyyDbAV+n+5mRjf3xsJxSGoUVaauX4ehZ5pkLFoyB7JsuNi
3x9N5DXOq95XxixG7EEGffA6eRECrZAeCHVDCFv4ivuKRhBEEM4qjsBlkuq2hM3/
HwCqU1Y+3LZEkMDG6CNnKFm+/C2Kx7n4UKQrJp77vgPzIN6ymr4fldUwZasbQwvK
ONEUlzdzx8sOC3XrZMrliiOpaijD5l6CTWykvukogfM6E9BbzvFMq5ypVbHAzOp8
H+J6u0kBXm4v2+ztusfyWEug4h+/fsRYCru/rxCjCrmAk+Hy1r4cVmWvrSbQ1K65
WJ0JFpS9VP44W9NPR32iIVy9whWX86QFU22eNiLtP8nRsMcckc0=
=bG9E
-----END PGP SIGNATURE-----

--gn6hus3zmjl2ct5b--

--===============1789099610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1789099610==--
