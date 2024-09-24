Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D672D984995
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 18:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCBE10E725;
	Tue, 24 Sep 2024 16:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S003kr6q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6483B10E040;
 Tue, 24 Sep 2024 16:27:29 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-3a07bd770e2so30698005ab.0; 
 Tue, 24 Sep 2024 09:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727195248; x=1727800048; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tIKJ3tLYnjzjQAicXIIqfWRcuCEsTe9hsi8L1oCHUJE=;
 b=S003kr6qDozVNzWFC7N9B2Za5RBiRpaumSZZ08t6X/1ZRR7gjMSKAXagc4n76x9TFn
 rZPmf5QO3u8dOAUOG6dxKa93WnSvVa4bgaasXW/s7/QKv1c+T9g7oPDEzAJ7ARsiUvXK
 KQTfx8Gza6+89PBQpQP1cuLeiNsf2WzoqCjgLnFFmyL2d1dR9+8SW+vZRn7F3rDcNph9
 R8UxTgdGNG1vEEhVw01+T2O2D0mQn4dDMTvBFtRUb5MmwG1s93GPuCwpY7sdBd6iYdRY
 SmcnlLXiT7roKvxCNkIDooze+Cz+XNmVHA4QkxjMv5U/5VnvWJZr1ITXHfckgDymFmmR
 kJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727195248; x=1727800048;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tIKJ3tLYnjzjQAicXIIqfWRcuCEsTe9hsi8L1oCHUJE=;
 b=EBO7YyYfRQEg3XtTAM13l1frBJKjo0VIpD9ij559lPpqjCDCmb2rdzpcDjm7kttqqy
 ylllQ+4w4SNssD5FnIoWBcfV+RvIge6XcZNnTmU9/W8FBnyi4UQVCGgv2n5wK2qX9StH
 UqXDQ8Q4yeX83rxOIk+38pd9xrs4KFkGKR3qPwDyVEKJEJgFBw5Uic1B9KimYTKrDDY1
 mu++IvuNw1Pvfry4/xRqbiloYUCJtPqVePEFWdNUeHFmgWd3EkGerI637NTwxnSb3ONP
 k5ksUV9+MtnbHH5jB6pgvDUeB/qFnbbkUnxnAzcJMclscK9LylKHrobOF7HWrSHOGh3V
 XMDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/dDjoZdU9ocZtPC9aFAyRfxNEnjwvsRJ2nM33Mv8UYq11AvooCHE9zj/RqedHzDxcgoBoy4lg1x4=@lists.freedesktop.org,
 AJvYcCVxRdchv3NiCVL8togeg2JqdvortwV0s0gAjucTRdU+x/ht+wHXw4o2nq2QPASIzVuRVdveH6JvUkuI@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzrBL7uyr9vwne/eseqrIZlut+LeahLIGXaFj0C4fNTxk1qP4Y
 hs8foPu20zNAixTwVtl/1gQsPMyqA7Xo7wWbSj+04EfF3sj/oBXWijWGwTnrmOVxaNa7Mzpq2B2
 dM5z2eCBmoAmSRotXWQ5DNSVAJkY=
X-Google-Smtp-Source: AGHT+IG9boXyVk/1DBYrjUtsCFlsGG3k5A0clibRl0uG/AxfB6qhwgN3oUtXzCNhhSbUc7BmikIteq3R9XRZ7x4hGyY=
X-Received: by 2002:a05:6e02:20c8:b0:3a0:9aff:5046 with SMTP id
 e9e14a558f8ab-3a26d795471mr409395ab.15.1727195248272; Tue, 24 Sep 2024
 09:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
 <20240924-preemption-a750-t-v5-10-0be2bf81c187@gmail.com>
In-Reply-To: <20240924-preemption-a750-t-v5-10-0be2bf81c187@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 24 Sep 2024 09:27:16 -0700
Message-ID: <CAF6AEGsixas1wa4k6QjjwdjKqq1hHk8RDBeL-MUHTcmMRrFDoQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] drm/msm/A6xx: Enable preemption for A750
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
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

nit, lowercase "a6xx" in subject prefix

(no need to resend just for this, I can fix it up when applying
patches if needed.. but if you do resend pls fix that)

BR
-R

On Tue, Sep 24, 2024 at 4:30=E2=80=AFAM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> Initialize with 4 rings to enable preemption.
>
> For now only on A750 as other targets require testing.
>
> Add the "preemption_enabled" module parameter to override this for other
> A7xx targets.
>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 3 ++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 6 +++++-
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 1 +
>  4 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/=
msm/adreno/a6xx_catalog.c
> index 316f23ca91671d973797f2a5b69344f376707325..0e3041b2941905f1acdc9e571=
e0549a960a7edfa 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1240,7 +1240,8 @@ static const struct adreno_info a7xx_gpus[] =3D {
>                 .gmem =3D 3 * SZ_1M,
>                 .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
>                 .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> -                         ADRENO_QUIRK_HAS_HW_APRIV,
> +                         ADRENO_QUIRK_HAS_HW_APRIV |
> +                         ADRENO_QUIRK_PREEMPTION,
>                 .init =3D a6xx_gpu_init,
>                 .zapfw =3D "gen70900_zap.mbn",
>                 .a6xx =3D &(const struct a6xx_info) {
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index edbcb6d229ba614be910ee70e75731538116e4a4..4760f9469613c0bf208f56be9=
608747b5aa75606 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2529,6 +2529,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *de=
v)
>         struct a6xx_gpu *a6xx_gpu;
>         struct adreno_gpu *adreno_gpu;
>         struct msm_gpu *gpu;
> +       extern int enable_preemption;
>         bool is_a7xx;
>         int ret;
>
> @@ -2567,7 +2568,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *d=
ev)
>                 return ERR_PTR(ret);
>         }
>
> -       if (is_a7xx)
> +       if ((enable_preemption =3D=3D 1) || (enable_preemption =3D=3D -1 =
&&
> +           (config->info->quirks & ADRENO_QUIRK_PREEMPTION)))
> +               ret =3D adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7x=
x, 4);
> +       else if (is_a7xx)
>                 ret =3D adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7x=
x, 1);
>         else if (adreno_has_gmu_wrapper(adreno_gpu))
>                 ret =3D adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmu=
wrapper, 1);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm=
/msm/adreno/adreno_device.c
> index cfc74a9e2646d3de76a06bd67457d69afa49e309..9ffe91920fbfb4841b28aabec=
9fbde94539fdd83 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -20,6 +20,10 @@ bool allow_vram_carveout =3D false;
>  MODULE_PARM_DESC(allow_vram_carveout, "Allow using VRAM Carveout, in pla=
ce of IOMMU");
>  module_param_named(allow_vram_carveout, allow_vram_carveout, bool, 0600)=
;
>
> +int enable_preemption =3D -1;
> +MODULE_PARM_DESC(enable_preemption, "Enable preemption (A7xx only) (1=3D=
on , 0=3Ddisable, -1=3Dauto (default))");
> +module_param(enable_preemption, int, 0600);
> +
>  extern const struct adreno_gpulist a2xx_gpulist;
>  extern const struct adreno_gpulist a3xx_gpulist;
>  extern const struct adreno_gpulist a4xx_gpulist;
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 87098567483b69c21025b80f356e0a68f0e7f172..d1cd53f05de68b3873f355206=
55e09e82fc40449 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -56,6 +56,7 @@ enum adreno_family {
>  #define ADRENO_QUIRK_LMLOADKILL_DISABLE                BIT(2)
>  #define ADRENO_QUIRK_HAS_HW_APRIV              BIT(3)
>  #define ADRENO_QUIRK_HAS_CACHED_COHERENT       BIT(4)
> +#define ADRENO_QUIRK_PREEMPTION                        BIT(5)
>
>  /* Helper for formating the chip_id in the way that userspace tools like
>   * crashdec expect.
>
> --
> 2.46.1
>
