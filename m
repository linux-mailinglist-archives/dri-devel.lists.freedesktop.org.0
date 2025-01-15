Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 216BBA126BF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 16:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B8410E05B;
	Wed, 15 Jan 2025 15:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J4SemOwZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739BB10E05B;
 Wed, 15 Jan 2025 15:01:08 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2ef05d0ef18so1419716a91.0; 
 Wed, 15 Jan 2025 07:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736953208; x=1737558008; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oJNN+yIAbJ7FQhP5e1dcdow/Ss7cUXshCz1OUzIShrw=;
 b=J4SemOwZfYSmG5EjjFJkuLbBc3Ewt/MgAf47yrBwxHEXZtc7ODWTiAutDFV8IV4Fkb
 kajKRqy20K9AZEPrvLseOdvNpBAD6eLykfjOIsP9xQv6WsSD9G6ok0RdmFVs9EMxk/3a
 4qcZRBMPpdEvRw5pgVpPQNtTOgLeK2kV0KgShwa26VQ6tAULmledvLoi6+b95ZWScAdb
 Zn+qPLtsLIyjmvXPz8ZooSUEBgm7kk7Wl9fjpwR5I4H4StgDOSs5CQimpM5zKAZKAVEM
 Qnmhg2ZcLBlVk0jNPWBXoPlNdaA4alNz6L9DPx+pPeS+PelmXQw2OZuFAGnmYlERwIMo
 ip7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736953208; x=1737558008;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oJNN+yIAbJ7FQhP5e1dcdow/Ss7cUXshCz1OUzIShrw=;
 b=g7U/ez0KvduVYocIRHHajL1SJe7oxOfFxbjLj+CW6uctldtKEDD7alzYQeHNdd2uoZ
 X+aeG/UqGMCd4fiKVrcChqVck5wWevZAIglH2Q1sVFiJCYwUq18i5ooEyGJtW6nss/Jw
 rC575Fzj7Jl+gi/DoX5GCN0aVd1SpNiau5S6jtAA5lu690d7tJfSUv+SWn+V900QdpoL
 RvkakEF6kpo9mbN6VG+V4dqV0ZIh2Uc/ppy31Wt+dp9ZzGbDrRDpujJ9d0RZBe0FhUIn
 FqJJP1k6kHlKojIC1KjPqgj4U3aGPfMiV3750pbIShM+Inv4+9BZqRaCtbnSrw1ntXrr
 liDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhaYntNTrOP/ilhTKbHBZ8CYl7zp1e+cO3rvgfyvUgmnj2xWpP1UgZuc2ZE+7eVSoDtn/GcmGF@lists.freedesktop.org,
 AJvYcCVC+ZSflOdbP3c6WYDEP8pBf8tZI/0519/tUFQ+DMw4zaD8FKBNTmruB+aDmWd3ylVMKLfcuzRzw84T@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYabyk4n1WGD2yghFk3QabvktOPNmOlv1ui77bsdYmt8HyaniX
 euGGFPjBMzfJqOtrIhJ4zVMYFcoHGsBoscXlWvf5i5qwNnBJ2XxMqGo621s9BkkKLSUuRqfWWYU
 1e6NgNhcqzDiPT5vM0hglU8dINMS4zQ==
X-Gm-Gg: ASbGncuj2xrAp8uG/JDTkG8LtusVBIANIgEZw6GsLEK+Ik47LZ2WQnu6CC5OwLtqmha
 dmE75ILu6Vo0GeM1ojuJhUXAPlLrPD2q4LIzLbQ==
X-Google-Smtp-Source: AGHT+IFr7+OOHfJRndFGnKOHv47itbOd5fZmj4mkPaTAVgkZpPIEyEf6hdx/C48x6sLxu6ybP54hOConvjPiXuJhOeM=
X-Received: by 2002:a17:90b:2811:b0:2ee:cbc9:d50b with SMTP id
 98e67ed59e1d1-2f5490ac695mr16375331a91.4.1736953207787; Wed, 15 Jan 2025
 07:00:07 -0800 (PST)
MIME-Version: 1.0
References: <20250115113552.297307-1-colin.i.king@gmail.com>
In-Reply-To: <20250115113552.297307-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 15 Jan 2025 09:59:55 -0500
X-Gm-Features: AbW1kvZGmglu8dFsb44hdBkRoz1ygvAcPx6pHw7z_ZcBWTQupYD9YyxpbJX4y2w
Message-ID: <CADnq5_PQGZuL5g5w87-HCqKAL+76WN=iso45UvnVu4GGww1Veg@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: remove extraneous ;
 after statements
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Chaitanya Dhere <chaitanya.dhere@amd.com>, Jun Lei <jun.lei@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

Applied.  thanks!

Alex

On Wed, Jan 15, 2025 at 7:02=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There are a couple of statements with two following semicolons, replace
> these with just one semicolon.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2=
_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_cor=
e/dml2_core_dcn4_calcs.c
> index c4dbf27abaf8..1a0a08823ed9 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_d=
cn4_calcs.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_d=
cn4_calcs.c
> @@ -3894,8 +3894,8 @@ static void CalculateSwathAndDETConfiguration(struc=
t dml2_core_internal_scratch
>                         p->SwathHeightC[k] =3D MaximumSwathHeightC[k] / 2=
;
>                         RoundedUpSwathSizeBytesY[k] =3D p->full_swath_byt=
es_l[k] / 2;
>                         RoundedUpSwathSizeBytesC[k] =3D p->full_swath_byt=
es_c[k] / 2;
> -                       p->request_size_bytes_luma[k] =3D ((p->BytePerPix=
Y[k] =3D=3D 2) =3D=3D dml_is_vertical_rotation(p->display_cfg->plane_descri=
ptors[k].composition.rotation_angle)) ? 128 : 64;;
> -                       p->request_size_bytes_chroma[k] =3D ((p->BytePerP=
ixC[k] =3D=3D 2) =3D=3D dml_is_vertical_rotation(p->display_cfg->plane_desc=
riptors[k].composition.rotation_angle)) ? 128 : 64;;
> +                       p->request_size_bytes_luma[k] =3D ((p->BytePerPix=
Y[k] =3D=3D 2) =3D=3D dml_is_vertical_rotation(p->display_cfg->plane_descri=
ptors[k].composition.rotation_angle)) ? 128 : 64;
> +                       p->request_size_bytes_chroma[k] =3D ((p->BytePerP=
ixC[k] =3D=3D 2) =3D=3D dml_is_vertical_rotation(p->display_cfg->plane_desc=
riptors[k].composition.rotation_angle)) ? 128 : 64;
>                 }
>
>                 if (p->SwathHeightC[k] =3D=3D 0)
> --
> 2.47.1
>
