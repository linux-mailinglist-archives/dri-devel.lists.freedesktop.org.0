Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D5774DC92
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 19:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7276410E2B6;
	Mon, 10 Jul 2023 17:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EDC10E182;
 Mon, 10 Jul 2023 17:35:00 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3a337ddff16so3643186b6e.0; 
 Mon, 10 Jul 2023 10:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689010499; x=1691602499;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7lNLHcBXTtApGxZhppUoQis59G42kvHVFKXqqsERN5w=;
 b=Tie9dyVfcJItKBW5qwyLx0wwlrCJW7b1aqOZhRFL+u91onLNcZCco4Sigd/T83inz9
 6b6RviZqnZiD3MFiWPU83Kid6khe0q/gdyWy7bxD7mxX+ErLQCZCn8/DxQOdrkhi3Khq
 aPVuOTcqPKI4+wu53FlVyllNIaZ9FMurrSfy/i+lKX1SVE0F02Xjca4CQEEdW531c5FD
 r1oSLMUD3ut0o+0OEteag1xrwj5ehZHNjaeZZH+MjbPGcE6qnUFzTVLNJ3SWAN8PMMr2
 NHBFd7APIqj81WND+j3/ErI1n/UHgHCtu9VGnwRi2MTEWA0WckFuHBQuDbZii9uzuxsH
 8D7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689010499; x=1691602499;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7lNLHcBXTtApGxZhppUoQis59G42kvHVFKXqqsERN5w=;
 b=It/khaLl5HEGhRi9Uso65iymciO3F97LTlIBkKaTg5OJmOKj2Md8AGSQhP5D7EYIcy
 N33mvDxEQk7e14C5SF1eO6ZhBgXpcyTwyWp3M/8Oiv2xUO+GgtvC1CcEmV6blAqvJj27
 GQCkgkGOrvXC4OIHhVolD8zkdF7hl272RwgDp0Buuh2mBu2Ds6sF0d1vhd8ZiLZ+CVtC
 aELSqh5abIVdB7Sz0E4BluVEMXSAyeITVYue5LpREGTlAgqZ33CFTYUV8D9eM/XWfmZq
 J+D7lYeK6FX/wO4EcPPX9nrnQCcNIV9peUq+4AQvYRZP6GJAZghd2rtEJoJqRMh/fIEg
 QDEA==
X-Gm-Message-State: ABy/qLaA+vqkEDbii7SaLPa/BSsTWT55B/y3iEJhZYhfQ0uwNvq3qcuo
 Z/1QD3ymhA560JkATbkyFxsUfikcvdJV4b9Mokc=
X-Google-Smtp-Source: APBJJlHnXQlhaJFZ9BvVHmlWPcKunuDRQ7cebzO5QwL/a9uYmG/n3mKcEidNp0WncN8mcAFEKm1oErNLqJieuBbSXEg=
X-Received: by 2002:a05:6808:1a1e:b0:3a3:6283:ce94 with SMTP id
 bk30-20020a0568081a1e00b003a36283ce94mr12747718oib.44.1689010499346; Mon, 10
 Jul 2023 10:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230710091057.64085-1-xujianghui@cdjrlc.com>
 <3a541f425a1ab6d2664a6d74cc4c3a51@208suo.com>
In-Reply-To: <3a541f425a1ab6d2664a6d74cc4c3a51@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 Jul 2023 13:34:48 -0400
Message-ID: <CADnq5_NHYsquFpZre8hfsJKibEjyEooTGCigBWsfSA7OCEPc=w@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: ERROR: "(foo*)" should be "(foo *)"
To: sunran001@208suo.com
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks.  I've applied all the patches you sent out, but all
of them had whitespace problems.  Please double check your mailer on
any future submissions.

Thanks,

Alex

On Mon, Jul 10, 2023 at 6:03=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> Fix five occurrences of the checkpatch.pl error:
> ERROR: "(foo*)" should be "(foo *)"
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/radeon/radeon_kms.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_kms.c
> b/drivers/gpu/drm/radeon/radeon_kms.c
> index e0214cf1b43b..a16590c6247f 100644
> --- a/drivers/gpu/drm/radeon/radeon_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> @@ -444,7 +444,7 @@ int radeon_info_ioctl(struct drm_device *dev, void
> *data, struct drm_file *filp)
>               DRM_DEBUG_KMS("timestamp is r6xx+ only!\n");
>               return -EINVAL;
>           }
> -        value =3D (uint32_t*)&value64;
> +        value =3D (uint32_t *)&value64;
>           value_size =3D sizeof(uint64_t);
>           value64 =3D radeon_get_gpu_clock_counter(rdev);
>           break;
> @@ -543,18 +543,18 @@ int radeon_info_ioctl(struct drm_device *dev, void
> *data, struct drm_file *filp)
>           *value =3D rdev->vce.fb_version;
>           break;
>       case RADEON_INFO_NUM_BYTES_MOVED:
> -        value =3D (uint32_t*)&value64;
> +        value =3D (uint32_t *)&value64;
>           value_size =3D sizeof(uint64_t);
>           value64 =3D atomic64_read(&rdev->num_bytes_moved);
>           break;
>       case RADEON_INFO_VRAM_USAGE:
> -        value =3D (uint32_t*)&value64;
> +        value =3D (uint32_t *)&value64;
>           value_size =3D sizeof(uint64_t);
>           man =3D ttm_manager_type(&rdev->mman.bdev, TTM_PL_VRAM);
>           value64 =3D ttm_resource_manager_usage(man);
>           break;
>       case RADEON_INFO_GTT_USAGE:
> -        value =3D (uint32_t*)&value64;
> +        value =3D (uint32_t *)&value64;
>           value_size =3D sizeof(uint64_t);
>           man =3D ttm_manager_type(&rdev->mman.bdev, TTM_PL_TT);
>           value64 =3D ttm_resource_manager_usage(man);
> @@ -614,7 +614,7 @@ int radeon_info_ioctl(struct drm_device *dev, void
> *data, struct drm_file *filp)
>           DRM_DEBUG_KMS("Invalid request %d\n", info->request);
>           return -EINVAL;
>       }
> -    if (copy_to_user(value_ptr, (char*)value, value_size)) {
> +    if (copy_to_user(value_ptr, (char *)value, value_size)) {
>           DRM_ERROR("copy_to_user %s:%u\n", __func__, __LINE__);
>           return -EFAULT;
>       }
