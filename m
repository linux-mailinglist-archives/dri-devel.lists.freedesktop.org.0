Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6194996EB5D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 09:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCCC10E814;
	Fri,  6 Sep 2024 07:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ixzMos6r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B05810E819
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 07:00:53 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-49bd2b37fe9so446937137.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 00:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725606052; x=1726210852; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m3Ez8XYl6eL7ErMydWXe0O3lPOV2uCplEY60l4avJJ4=;
 b=ixzMos6rbS5vZiEG5lPg6QmqRLF1VYEm3E3759B0fm4Q+Im+DNq3jkjSPBGnE/beNI
 NatnK2MSzqlZLjdnAiCBIy6eYjTn9oVP4U2xINq1VYEZF2+m+IOmGCERbAGnVcEncdl3
 fJScDneCEpQibQptYG3Bz/zlfTQPJtzNymsXzhs7I5ep7ovasrmtREDARLJE1SHTO5xm
 JleVVwToCP8qZDjURObTWXWOWNbkYdvKnGOTFDYW4k/BnBfxp3vPfSb114nsma1V+zxJ
 24vSncsS7FdDZEA/LOd2g57v8SU232suIlY+mT8VUzdRHShSE6zNmjChE9IlLc+66i+n
 T4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725606052; x=1726210852;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m3Ez8XYl6eL7ErMydWXe0O3lPOV2uCplEY60l4avJJ4=;
 b=n8Nd5VIMBEihcARlzxaAwNkDqpA9xq8yH5VX3WhWFXnU1pAnXUcQuaduxQczfsenDa
 UYFIFBC5Qwftf1aiaQqMi+htrIFCF8MIKG341CFxfSFpdw43bPqPDipDNlYpDF5Up+Oq
 3iSgfyZOWEc6GUBGmfxuORYCUC4dC3yALBSSSUxkq8uhRXFVA0+kD4Vh9mWY6FzA+4OM
 CDMkoSXuxAKYBnB+CigSItGqHHNa36POjDQHakJ+xFpKiGnBHZSBZQxNBIt63p+ZRPkI
 M1a6l5bfSQ/Jz/MEmypEPuSse9LrG207uyajdTGCPzYAJRRIJuFP+H122Av0vwjkdpNY
 lvbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQZUYLa6SNMPZJNkaKhjuswJ4c8W9s8XGUypqtYX/dbet3w2sWUToDrqvFCGvNXROhd7biooLZPnk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMs2Ca/xAuix/HNPEyyPNEUJo9CHSqQtj0kn4Q1rMdH5JGTyv6
 f6J21sBtkt2BtQt2KhCi30qKIyFDbXgW4wqwYw2Xe80sGR64we7RRFxrx23M1UHhTggnxq1E/vZ
 CCInlA9eN5JTB4MufCUtvu8wrBO8=
X-Google-Smtp-Source: AGHT+IGdsNQUsmbUOUI+orNngMgxpsTQdp0snOH8gbX5DALySfY8923JRytGglN6HweIwISXhyNuq567FwNajE1v7us=
X-Received: by 2002:a05:6102:1625:b0:49b:dd30:d168 with SMTP id
 ada2fe7eead31-49bde130e32mr1997788137.2.1725606051772; Fri, 06 Sep 2024
 00:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <7c4a1ca4525a1d1429c9f16ccfc6d8bf80fc2b63.1720942618.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <7c4a1ca4525a1d1429c9f16ccfc6d8bf80fc2b63.1720942618.git.christophe.jaillet@wanadoo.fr>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 6 Sep 2024 16:00:15 +0900
Message-ID: <CAAQKjZPN742hd=BJHmS+ATOwpR+AdhyhF4W0J8vWAonMKfPXhg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: Constify struct exynos_drm_ipp_funcs
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Christophe JAILLET,

2024=EB=85=84 7=EC=9B=94 14=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 4:37, C=
hristophe JAILLET
<christophe.jaillet@wanadoo.fr>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> 'struct exynos_drm_ipp_funcs' are not modified in these drivers.
>
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
>
> On a x86_64, with allmodconfig, as an example:
> Before:
> =3D=3D=3D=3D=3D=3D
>    text    data     bss     dec     hex filename
>   20446    1746      16   22208    56c0 drivers/gpu/drm/exynos/exynos_drm=
_fimc.o
>
> After:
> =3D=3D=3D=3D=3D
>    text    data     bss     dec     hex filename
>   20446    1714      16   22176    56a0 drivers/gpu/drm/exynos/exynos_drm=
_fimc.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied. Thank for contribution,
Inki Dae

> ---
> Compile tested-only.
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c   | 2 +-
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c    | 2 +-
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/e=
xynos/exynos_drm_fimc.c
> index 142184c8c3bc..4d7ea65b7dd8 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> @@ -1125,7 +1125,7 @@ static void fimc_abort(struct exynos_drm_ipp *ipp,
>         }
>  }
>
> -static struct exynos_drm_ipp_funcs ipp_funcs =3D {
> +static const struct exynos_drm_ipp_funcs ipp_funcs =3D {
>         .commit =3D fimc_commit,
>         .abort =3D fimc_abort,
>  };
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_gsc.c
> index 1b111e2c3347..d80b0d1eb734 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> @@ -1162,7 +1162,7 @@ static void gsc_abort(struct exynos_drm_ipp *ipp,
>         }
>  }
>
> -static struct exynos_drm_ipp_funcs ipp_funcs =3D {
> +static const struct exynos_drm_ipp_funcs ipp_funcs =3D {
>         .commit =3D gsc_commit,
>         .abort =3D gsc_abort,
>  };
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm=
/exynos/exynos_drm_scaler.c
> index a9d469896824..2788105ac780 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> @@ -403,7 +403,7 @@ static int scaler_commit(struct exynos_drm_ipp *ipp,
>         return 0;
>  }
>
> -static struct exynos_drm_ipp_funcs ipp_funcs =3D {
> +static const struct exynos_drm_ipp_funcs ipp_funcs =3D {
>         .commit =3D scaler_commit,
>  };
>
> --
> 2.45.2
>
>
