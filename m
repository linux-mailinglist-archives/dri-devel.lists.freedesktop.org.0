Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5417C765F25
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 00:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6AF10E62A;
	Thu, 27 Jul 2023 22:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EA610E628
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 22:15:50 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-d05a63946e0so1381318276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 15:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690496149; x=1691100949;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wOD8KgEEEOPljbiXkTM7e1vfVTCZeMVuNm+H/5ZnzWI=;
 b=GF4vQe9Q2QXiQ5WqN59LH2CNoeRi202CwB4ya41H6AykiczHuvb3xG7B9i0XkWfSfu
 Q373vkJ0dfBCgTbdj2Ah4chkhSclTnE9x/rRp6Nw0C51Wg23bAfqRJl5nMDYR/TgyfCw
 8ei61KySxvKUxN8R/Mvg48HyG2oHfvYRGHRfXVsXl6O1HFcJbkPpLFVUP3ZkEEtpGFQC
 35dCp96KyFPyZ3wVBzADGxTnXGR7/J7j6duhBE7cT04CsstMEbrEihLsYTKQPxe/7ceI
 Wu1Fs2DXxGwUGe9W6MBfBuoDYMkANMrNUHoh0KHRSEbofSezXX6mX/rC0Vilgz4OPWpy
 0M3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690496149; x=1691100949;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wOD8KgEEEOPljbiXkTM7e1vfVTCZeMVuNm+H/5ZnzWI=;
 b=APDk40ZBAzWApqkzkP23NdO1avg3jiqXKOfst4RkrevolQbZfAVCCJBQaiLXeV9hJo
 al0i/MPyNUpfAzRTbu+o3TZQszZb/MwuWCKEfOpT11WSYQvFps9FA11fO4bFMhSDwuaJ
 6oQqsd5O2BQwsvoViJymO0KCavZLnTjagcv0O0mNWfB/Ey5SFliBlGV8B53j9OzajXqy
 msxySkgZI5W4gHRGhoJMMWmQGtawiY6HslqMwqtFMIlB6yRUcTIFn0o86clUZHeMydDS
 VhqvJNRkDbwmddHHxBUA3G5jCH8U6NCIBTrK+JiRqP9DTrYuw86o4K0SQgOL8rUTGGNX
 2eYA==
X-Gm-Message-State: ABy/qLbGea3oej35uFgy+klj9VMoBzF6jEW0cmEGoZJLlRqLAl7ufhYe
 0du0r8dBm5aLK/UqUBRqikP6zXM2EBN9cpdDd5kORA==
X-Google-Smtp-Source: APBJJlFzvXJKovMYoMWH82NS6t0YgsjfzUuSbj76qs0bG32xlSJYCovy3Xv5KwXJHF2gt393R3/Esr0VFOB/cKbMMZM=
X-Received: by 2002:a25:c78b:0:b0:d12:25d:fd5c with SMTP id
 w133-20020a25c78b000000b00d12025dfd5cmr698418ybe.13.1690496149389; Thu, 27
 Jul 2023 15:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230727212208.102501-1-robdclark@gmail.com>
 <20230727212208.102501-10-robdclark@gmail.com>
In-Reply-To: <20230727212208.102501-10-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Jul 2023 01:15:38 +0300
Message-ID: <CAA8EJpo4hGkB=DMyCM+gU11Mfiqd2S9J660P+GtVUZSuDBCCNA@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] drm/msm/adreno: Add adreno family
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Jul 2023 at 00:23, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Sometimes it is useful to know the sub-generation (or "family").  And in
> any case, this helps us get away from infering the generation from the

Nit: inferring

> numerical chip-id.
>
> v2: Fix is_a2xx() typo
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 31 ++++++++++++++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 11 +++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 46 ++++++++++++++++------
>  3 files changed, 70 insertions(+), 18 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>

[skipped]


> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index fe7afac5b059..14af16080bd0 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -29,6 +29,25 @@ enum {
>         ADRENO_FW_MAX,
>  };
>
> +/**
> + * @enum adreno_family: identify generation and possibly sub-generation
> + *
> + * In some cases there are distinct sub-generations within a major revision
> + * so it helps to be able to group the GPU devices by generation and if
> + * necessary sub-generation.
> + */
> +enum adreno_family {
> +       ADRENO_2XX_GEN1,  /* a20x */
> +       ADRENO_2XX_GEN2,  /* a22x */
> +       ADRENO_3XX,
> +       ADRENO_4XX,
> +       ADRENO_5XX,

reserves himself a right to glance at splitting 3xx and 5xx later on.

> +       ADRENO_6XX_GEN1,  /* a630 family */
> +       ADRENO_6XX_GEN2,  /* a640 family */
> +       ADRENO_6XX_GEN3,  /* a650 family */
> +       ADRENO_6XX_GEN4,  /* a660 family */
> +};
> +
>  #define ADRENO_QUIRK_TWO_PASS_USE_WFI          BIT(0)
>  #define ADRENO_QUIRK_FAULT_DETECT_MASK         BIT(1)
>  #define ADRENO_QUIRK_LMLOADKILL_DISABLE                BIT(2)
> @@ -68,6 +87,7 @@ struct adreno_speedbin {
>  struct adreno_info {
>         const char *machine;
>         struct adreno_rev rev;
> +       enum adreno_family family;
>         uint32_t revn;
>         const char *fw[ADRENO_FW_MAX];
>         uint32_t gmem;
> @@ -193,14 +213,14 @@ static inline bool adreno_is_a2xx(const struct adreno_gpu *gpu)
>  {
>         if (WARN_ON_ONCE(!gpu->info))
>                 return false;
> -       return (gpu->info->revn < 300);
> +       return gpu->info->family <= ADRENO_2XX_GEN2;
>  }
>
>  static inline bool adreno_is_a20x(const struct adreno_gpu *gpu)
>  {
>         if (WARN_ON_ONCE(!gpu->info))
>                 return false;
> -       return (gpu->info->revn < 210);
> +       return gpu->info->family == ADRENO_2XX_GEN1;
>  }
>
>  static inline bool adreno_is_a225(const struct adreno_gpu *gpu)
> @@ -343,29 +363,31 @@ static inline int adreno_is_a690(const struct adreno_gpu *gpu)
>  /* check for a615, a616, a618, a619 or any a630 derivatives */
>  static inline int adreno_is_a630_family(const struct adreno_gpu *gpu)
>  {
> -       return adreno_is_revn(gpu, 630) ||
> -               adreno_is_revn(gpu, 615) ||
> -               adreno_is_revn(gpu, 616) ||
> -               adreno_is_revn(gpu, 618) ||
> -               adreno_is_revn(gpu, 619);
> +       if (WARN_ON_ONCE(!gpu->info))
> +               return false;
> +       return gpu->info->family == ADRENO_6XX_GEN1;
>  }
>
>  static inline int adreno_is_a660_family(const struct adreno_gpu *gpu)
>  {
> -       return adreno_is_a660(gpu) || adreno_is_a690(gpu) || adreno_is_7c3(gpu);
> +       if (WARN_ON_ONCE(!gpu->info))
> +               return false;
> +       return gpu->info->family == ADRENO_6XX_GEN4;
>  }
>
>  /* check for a650, a660, or any derivatives */
>  static inline int adreno_is_a650_family(const struct adreno_gpu *gpu)
>  {
> -       return adreno_is_revn(gpu, 650) ||
> -               adreno_is_revn(gpu, 620) ||
> -               adreno_is_a660_family(gpu);
> +       if (WARN_ON_ONCE(!gpu->info))
> +               return false;
> +       return gpu->info->family >= ADRENO_6XX_GEN3;
>  }
>
>  static inline int adreno_is_a640_family(const struct adreno_gpu *gpu)
>  {
> -       return adreno_is_a640(gpu) || adreno_is_a680(gpu);
> +       if (WARN_ON_ONCE(!gpu->info))
> +               return false;
> +       return gpu->info->family == ADRENO_6XX_GEN2;
>  }
>
>  u64 adreno_private_address_space_size(struct msm_gpu *gpu);
> --
> 2.41.0
>


-- 
With best wishes
Dmitry
