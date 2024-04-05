Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441CA89A41B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 20:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216D71132B2;
	Fri,  5 Apr 2024 18:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fHtwvz4+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76EC112FC1
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 18:21:02 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-ddda842c399so2636502276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 11:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712341262; x=1712946062; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6FshVhZKcqJky0lBiOIixXGsQBzKhd/9O9LkN4VAwkM=;
 b=fHtwvz4+OLtUnoX7BjKEZ4XAvEtuHuQxml63suD7Tkc+FXZF9oC4rkS5J5dLhs4ZIB
 hqVzmHfukIsXI35iwOIxGnJ9dyQQaFqmAzUF5xdBp0bhxME8iDpes99UUN/ryRKspS97
 S+xi3OOp3SqOTYaYR0x2pa5Wu5c9OIBXuPjMuJP4z49t/+Hfz0m2kzrSPTZBdFNeU2rT
 SO8EdZPaN8eiqQV+rDKGdECIl09Z2hJeK9YKcz+h1a/El95BmBFbkODX0hRMAA8Qm8c1
 GO/mruWHO1rBv3h90WWpCSgiUjYvqfDZjbmFDc7siD70tsdpgl6pvJpXnbhfaehYddN1
 l/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712341262; x=1712946062;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6FshVhZKcqJky0lBiOIixXGsQBzKhd/9O9LkN4VAwkM=;
 b=IXOvwk9kyHrhg52ewpK1LrsahPvD2C/psu4DjqYvcpDkU5xvplSQH3HJ1vOpRt13UP
 acXCR+HwzgCa78nSZ7bvAnfFH7LqtXiB2hOZkGKAprBuQTK+WwZQzdIGxf1Nln23+dAY
 12hlXkQ31KffX1coqX5YbiqzVfP6pHk0FNIDNjInXP5Uk6RVZUdgQeymfx2YN9IxJWOI
 lR3A3hIs8meySQtqDoseAV8ZjD8ALVrUJll9ZGc88Aj30q62hJhqMRNl0F8/dK0uLqZP
 dSRskyiqD0uP2TtLpova1S7cfLySccaum8EyQ4kXnS3pRawB78++j/b/j1M7o6qj8/O/
 Bj8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtBM5ggf2/NPToWThCyFnBGEeMqtigCwJ3d6FBFWMeMlPv6jw3wCllhPRLYIJ2jMYDCzpUW1nfnYNhRkUbjT44eE6TKAkxamHN6l286G3g
X-Gm-Message-State: AOJu0YzJFVqsYIaVPdPYees3owc2R8B23+FMcIaSmS8jSLZpNYt3rBWa
 S9NxEb4UB2DpsSMEIxBzFFqkpVSpncnHg6YULGje49adhWmzfipQnZqLBBZ6rh9nr5VXDmAFAEk
 ySTnEXRz5atebEA7DJQmH8zGoI3VwAFpfrsnakA==
X-Google-Smtp-Source: AGHT+IHUuUqv9XGZ9bYt/6FB0DSxASTzs7ENjMecr4yFUOen3MARyohRguewr1dgCgDY1mFhRU/AKlGWEip8NUHr6ww=
X-Received: by 2002:a25:8250:0:b0:dcd:5bfa:8184 with SMTP id
 d16-20020a258250000000b00dcd5bfa8184mr2366149ybn.39.1712341261719; Fri, 05
 Apr 2024 11:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240405155855.3672853-1-arnd@kernel.org>
In-Reply-To: <20240405155855.3672853-1-arnd@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 21:20:50 +0300
Message-ID: <CAA8EJpoVmyJhyrRz0p-8Ue0sa-XG+rSFwCajuR8b6GQVxBDM0Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: remove an unused-but-set variable
To: Arnd Bergmann <arnd@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 5 Apr 2024 at 18:59, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The modification to a6xx_get_shader_block() had no effect other
> than causing a warning:
>
> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error: variable 'out' set but not used [-Werror,-Wunused-but-set-variable]
>         u64 out = dumper->iova + A6XX_CD_DATA_OFFSET;
>
> Revert this part of the previous patch.
>
> Fixes: 64d6255650d4 ("drm/msm: More fully implement devcoredump for a7xx")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Unfortunately this fix is not correct. The proper patch is present at
https://patchwork.freedesktop.org/patch/584955/?series=131663&rev=1

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 1f5245fc2cdc..d4e1ebfcb021 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -840,7 +840,6 @@ static void a6xx_get_shader_block(struct msm_gpu *gpu,
>                 struct a6xx_crashdumper *dumper)
>  {
>         u64 *in = dumper->ptr;
> -       u64 out = dumper->iova + A6XX_CD_DATA_OFFSET;
>         size_t datasize = block->size * A6XX_NUM_SHADER_BANKS * sizeof(u32);
>         int i;
>
> @@ -853,8 +852,6 @@ static void a6xx_get_shader_block(struct msm_gpu *gpu,
>
>                 in += CRASHDUMP_READ(in, REG_A6XX_HLSQ_DBG_AHB_READ_APERTURE,
>                         block->size, dumper->iova + A6XX_CD_DATA_OFFSET);
> -
> -               out += block->size * sizeof(u32);
>         }
>
>         CRASHDUMP_FINI(in);
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
