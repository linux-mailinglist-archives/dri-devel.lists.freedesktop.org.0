Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 343E270FE10
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 20:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C92D10E582;
	Wed, 24 May 2023 18:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC92210E0A5;
 Wed, 24 May 2023 18:51:03 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-19ad6baf96dso508059fac.0; 
 Wed, 24 May 2023 11:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684954263; x=1687546263;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fh+vsCfQhWMTg601LSuJ7dosZCBsyljcCI/FGdQ7IFo=;
 b=N+2xxIX5+s0dqsPU37iciIjhPlC28VKz/AYi1eSQJUbEAUSmQhU+qLYsJOWj34NyiD
 ZvL3M5fuHUgaTKU0sFRBDPXyivvJOPQXzCPA2Higv5SGOrCUykNZz6atWnuJdEyM3/SS
 qge9WM7LugfKyLWwuRNXxs+efsYid9+w4S57tr3s5QS18IUUDUAlItF3QzQmvdmey861
 uEUxcJpoyUZRHmGENebnb9bdwhhktKNqd8ykkL0C6hWKauw/fU9TEnfd9nH6DXLjMxDu
 Blj28lcCCd8BT8adBmFV5yFzX3sjTYO++Tvo8/PGIP57vNJpz0Yv8mdk7PiCciDuN/wH
 7psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684954263; x=1687546263;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fh+vsCfQhWMTg601LSuJ7dosZCBsyljcCI/FGdQ7IFo=;
 b=O9YR8oPOR4RmiklutmU06mSh3jSdWwe61Bz+gvGAWC4iIQ6eiSjAuYL8/Nl76pWDB/
 +kHZtWOiSMDuPi50sUvFuDYiiTJWqsQvtv6ZuB+u+P92uuiyTy/a2jP258JBt2WNwTJh
 Fb7iNRbL5E7Q+CXDo6ZhknQCi1vGYZNha/+yytvmoyc7y190nOdLi2NAM6KA+jTp1S3D
 YSZPV5VtYzrrkmFR5+iW0lBppcxVjL1v+JDuPN/n7SRAMupA9odccshqatkJeldNy1n0
 yPzI/9C9o1NMIjkTZiss6HPZBstDus8VRQk2mcZCrZo8tne7P7LhGfBqm1JV7hFd7MpO
 Bk2A==
X-Gm-Message-State: AC+VfDxlqn/E4susZ38wByLB8cYvoKax+7q9J79BCvnnC+wUttdC3rqQ
 CxCEulSNeD1lIEtJCAi94kZu2jY5+MoLO7l/Nzs=
X-Google-Smtp-Source: ACHHUZ56MBkHwuJZUxtHdnEmW+CctVr/y6MwOU/WfTd0k8F+Qa4utnXsYUMxDo2Ul/b6ay1xTR7WpL7PVVLtW7k7um4=
X-Received: by 2002:a05:6870:d413:b0:19b:9835:a2cc with SMTP id
 i19-20020a056870d41300b0019b9835a2ccmr382637oag.30.1684954262854; Wed, 24 May
 2023 11:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230524-nbio_v7_9-wincompatible-function-pointer-types-strict-v1-1-da17e01907cf@kernel.org>
In-Reply-To: <20230524-nbio_v7_9-wincompatible-function-pointer-types-strict-v1-1-da17e01907cf@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 24 May 2023 14:50:51 -0400
Message-ID: <CADnq5_OXzN3_9r8_X9ESx_axvGw-sNdGfPbU0NZuwQ+gFzZEag@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix return types of certain NBIOv7.9 callbacks
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: llvm@lists.linux.dev, trix@redhat.com, Xinhui.Pan@amd.com,
 ndesaulniers@google.com, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, May 24, 2023 at 12:44=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> When building with clang's -Wincompatible-function-pointer-types-strict,
> which ensures that function pointer signatures match exactly to avoid
> tripping clang's Control Flow Integrity (kCFI) checks at run time and
> will eventually be turned on for the kernel, the following instances
> appear in the NBIOv7.9 code:
>
>   drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c:465:32: error: incompatible func=
tion pointer types initializing 'int (*)(struct amdgpu_device *)' with an e=
xpression of type 'enum amdgpu_gfx_partition (struct amdgpu_device *)' [-We=
rror,-Wincompatible-function-pointer-types-strict]
>           .get_compute_partition_mode =3D nbio_v7_9_get_compute_partition=
_mode,
>                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
>   drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c:467:31: error: incompatible func=
tion pointer types initializing 'u32 (*)(struct amdgpu_device *, u32 *)' (a=
ka 'unsigned int (*)(struct amdgpu_device *, unsigned int *)') with an expr=
ession of type 'enum amdgpu_memory_partition (struct amdgpu_device *, u32 *=
)' (aka 'enum amdgpu_memory_partition (struct amdgpu_device *, unsigned int=
 *)') [-Werror,-Wincompatible-function-pointer-types-strict]
>           .get_memory_partition_mode =3D nbio_v7_9_get_memory_partition_m=
ode,
>                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
>   2 errors generated.
>
> Change the return types of these callbacks to match the prototypes to
> clear up the warning and avoid tripping kCFI at run time. Both functions
> return a value from ffs(), which is an integer that can fit into either
> int or unsigned int.
>
> Fixes: 11f64eb1472f ("drm/amdgpu: add sysfs node for compute partition mo=
de")
> Fixes: 41a717ea8afc ("drm/amdgpu: detect current GPU memory partition mod=
e")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c b/drivers/gpu/drm/amd=
/amdgpu/nbio_v7_9.c
> index e082f6343d20..d19325476752 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c
> @@ -382,7 +382,7 @@ static void nbio_v7_9_enable_doorbell_interrupt(struc=
t amdgpu_device *adev,
>                               DOORBELL_INTERRUPT_DISABLE, enable ? 0 : 1)=
;
>  }
>
> -static enum amdgpu_gfx_partition nbio_v7_9_get_compute_partition_mode(st=
ruct amdgpu_device *adev)
> +static int nbio_v7_9_get_compute_partition_mode(struct amdgpu_device *ad=
ev)
>  {
>         u32 tmp, px;
>
> @@ -408,8 +408,8 @@ static void nbio_v7_9_set_compute_partition_mode(stru=
ct amdgpu_device *adev,
>         WREG32_SOC15(NBIO, 0, regBIF_BX_PF0_PARTITION_COMPUTE_STATUS, tmp=
);
>  }
>
> -static enum amdgpu_memory_partition
> -nbio_v7_9_get_memory_partition_mode(struct amdgpu_device *adev, u32 *sup=
p_modes)
> +static u32 nbio_v7_9_get_memory_partition_mode(struct amdgpu_device *ade=
v,
> +                                              u32 *supp_modes)
>  {
>         u32 tmp;
>
>
> ---
> base-commit: fd8f7bb391fa9c1979232cb5ab5bedb08abc855d
> change-id: 20230524-nbio_v7_9-wincompatible-function-pointer-types-strict=
-c894636ce146
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
