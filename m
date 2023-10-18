Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E4A7CDE2B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 16:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBE110E3FB;
	Wed, 18 Oct 2023 14:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4F610E3F9;
 Wed, 18 Oct 2023 14:00:51 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1dd71c0a41fso4215458fac.2; 
 Wed, 18 Oct 2023 07:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697637651; x=1698242451; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WSpW0doOcXn+5lTEk2bF0qorpVq0IOpiC8aimltnNyc=;
 b=IJoP2dw/gmfJ/34qyDnZHqepppZ3vMlda/9oSjLGtUjMYs4N3IAXASJvUBvSmvWfs9
 8Te6CTrDqY+cwGftkl7WGLwPcOOUU3BXM7zwdpNQJaKuzVz08NSkHtFtWzG5kreOY71p
 MVcCW2FHcXDpPRKyahVRLCdfgrO1F2XiG44Zm/KXxWx79YE1B4Kn6mCoimU2U7txsddC
 Nml1Q9YiWZ9N05PjXr/qoDBWnhBL8rSKNJYu9wHlHvgiqyKC9xr9bdKsJCXN9Z/k6ilH
 SKxMUH3hgI7qZhQCDGL9hSmbLUWYmVJCaaj2C/z/4LpuL2DGRGe4rfJsD2sGKsbr459G
 r/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697637651; x=1698242451;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WSpW0doOcXn+5lTEk2bF0qorpVq0IOpiC8aimltnNyc=;
 b=ad20bXeohEAessUImfhmfMAEkt3gK5VdCxTaU8CDFP2EJ8+y2IfOQBsLxM8iO53/FC
 nPDO/5uj6OKsDmm5pCqnDkW639azQGi59oJtuOLe5M/OvFcykstuG5ynsWH8MAHfU+Fg
 njxnuyisneTPsjvXadf1TNMbYhOPfHiqQNx8XKV+Bme0ic6c8XUqUMB5NNwoOHQSL5hx
 GkynsHlmIqz8OCnElhH3t2yHQPSJ9P4pU/2uD2iT1UgCiXwEHZXd+gBK3riy0+kKgEqJ
 v10m3TCOubVd2nTgAb44F+8cKElOogYC2SBf/6eLyi3Dw27M9gSVu81WfswkUAuCQ1WY
 rX1Q==
X-Gm-Message-State: AOJu0Yyz/cP/FnYwA+oz7b3S6hhcHVfXqmgK2Y2A6jXVOa61wzmvcdoI
 A5M/3nO/FzoAy174HwHd+uJJIxA7vrYvZtKLMUIaMBn7
X-Google-Smtp-Source: AGHT+IEQ4VEtbC0I6wuqk0m6CgF4CBRg3eATOWskFebNDExHAfRNTUc8nf7f+4X0neKTlP5ZmmLRREbS7bZuwo/7gww=
X-Received: by 2002:a05:6871:8784:b0:1e9:bd5c:ae40 with SMTP id
 td4-20020a056871878400b001e9bd5cae40mr5801664oab.38.1697637650989; Wed, 18
 Oct 2023 07:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <20231018012232.23995-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20231018012232.23995-1-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 18 Oct 2023 10:00:39 -0400
Message-ID: <CADnq5_ONGOu-1SWzD99vr5CBtQzRXxOOUMMzto9UeN4q92Ri_Q@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: Simplify bool conversion
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Oct 17, 2023 at 9:22=E2=80=AFPM Yang Li <yang.lee@linux.alibaba.com=
> wrote:
>
> ./drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c:4802:84-89: WAR=
NING: conversion to bool not needed here
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D6901
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c b/dr=
ivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
> index 851db026f251..3296c078ff3e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
> @@ -4799,7 +4799,7 @@ static void CalculateSurfaceSizeInMall(
>                 if (UseMALLForStaticScreen[k] =3D=3D dml_use_mall_static_=
screen_enable)
>                         TotalSurfaceSizeInMALL =3D TotalSurfaceSizeInMALL=
 + SurfaceSizeInMALL[k];
>         }
> -       *ExceededMALLSize =3D (TotalSurfaceSizeInMALL <=3D MALLAllocatedF=
orDCN * 1024 * 1024 ? false : true);
> +       *ExceededMALLSize =3D (TotalSurfaceSizeInMALL > MALLAllocatedForD=
CN * 1024 * 1024);
>  } // CalculateSurfaceSizeInMall
>
>  static void CalculateDETBufferSize(
> --
> 2.20.1.7.g153144c
>
