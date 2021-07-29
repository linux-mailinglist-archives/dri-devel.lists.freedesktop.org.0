Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C72E3DA7DF
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 17:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0EEB6EDE2;
	Thu, 29 Jul 2021 15:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BE86E15C;
 Thu, 29 Jul 2021 15:51:53 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id z4so7515879wrv.11;
 Thu, 29 Jul 2021 08:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3dkqmjHMW8drUlUgQsfNaBo3qc/DlW4niKnPdeZqWp8=;
 b=Au7F5D9CJRHWpO/NBx38cCoQUgGVIqgBQ9rfYwhIbuQYpaDrVX9YOWevvUZzFbGoZV
 mTox1N/VhCyD1kTa2gB6xz6quH4aMg2B7rgzLVmqVAV7BNxirrbB9UNyo/rt3C96D8Om
 oEs0e9qFg/rw5Kx7IXvePIM4BtcptBPZ6aj2RbJifIBiaQrIycP23s7ZTpOud3xRqoSQ
 Kn220Vs5j6Eef7Sez5kSDrH95UYJ/qJ7tYiCmyvNwusVyc1QNyKykXip/pYQYOlxro24
 zk6nRaGJqSvIfLub9oNTbSXaBR0myWM7pfzKR71SYkLEJFF4vqGyaTSb8n774pKnSzoZ
 CCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3dkqmjHMW8drUlUgQsfNaBo3qc/DlW4niKnPdeZqWp8=;
 b=YTEyHSXWznSnIOqBfGNnQppEBlM/8eafAuS6QN2iujb9TJJ2RNf8/4IxwGwiYbC7kc
 JQ0RFwGs/WribXxgIEmyKcXbBIpxW+JC21CCwYDELx7JKnn+jAqQ7DqCXaOS01Thalba
 7Ge8mXvxp5NwIketnfp5JK/gviP8Mle0vtCCBMBdBOyQgAC0X5O5rQ9nna74SE3oLJiC
 Uq54uF8JvCWEkliBHv/8Q8crns8+gg4r/wZkQrVF+yNPJB7p4a8/UZwW6n9vD/Lf3PpW
 SipL9RwTh7EBL+aoF3Zew8/TGKeI//gA89M0cs6Jf9KP+ZmOumX8tePL/gLwor5RkQS9
 FN0A==
X-Gm-Message-State: AOAM531WkB5QXO9mYOBfbOxSuyXool0jWqtbYasDNFR+qdceYX+jx5zp
 MQhSU74Y91rHWKpayvFfrVMxgt52EGKuJ/uW+BI=
X-Google-Smtp-Source: ABdhPJwkA1KW+JpoNyJbBzXYZFeXYw7Veq9CN5tBPTxRZIq6Nehtz+SFcuxN5BqNY8KrewYis6Qol67+aM0zOMUE8nQ=
X-Received: by 2002:adf:eb43:: with SMTP id u3mr5753373wrn.83.1627573912474;
 Thu, 29 Jul 2021 08:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210729205906.RFC.1.I5645753650f32d9b469d6183a5fd8e5e65a7b7a4@changeid>
In-Reply-To: <20210729205906.RFC.1.I5645753650f32d9b469d6183a5fd8e5e65a7b7a4@changeid>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 29 Jul 2021 08:56:01 -0700
Message-ID: <CAF6AEGuwvwx0P2KELREccmhCfkQR=QVG6hXqiutEfpAMGDGEKQ@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/msm: Introduce Adreno Features
To: Akhil P Oommen <akhilpo@codeaurora.org>
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
Cc: Sean Paul <sean@poorly.run>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Matthias Kaehlcke <mka@chromium.org>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 8:31 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> Introduce a feature flag in gpulist to easily identify the capabilities
> of each gpu revision. This will help to avoid a lot of adreno_is_axxx()
> check when we add new features. In the current patch, HW APRIV feature
> is converted to a feature flag.
>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
> This patch is rebased on top of the below series:
> https://patchwork.freedesktop.org/series/93192/
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 12 ------------
>  drivers/gpu/drm/msm/adreno/adreno_device.c |  3 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  3 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  9 +++++++++
>  4 files changed, 15 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 1881e09..b28305b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1765,7 +1765,6 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>         struct msm_drm_private *priv = dev->dev_private;
>         struct platform_device *pdev = priv->gpu_pdev;
>         struct adreno_platform_config *config = pdev->dev.platform_data;
> -       const struct adreno_info *info;
>         struct device_node *node;
>         struct a6xx_gpu *a6xx_gpu;
>         struct adreno_gpu *adreno_gpu;
> @@ -1781,17 +1780,6 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>
>         adreno_gpu->registers = NULL;
>
> -       /*
> -        * We need to know the platform type before calling into adreno_gpu_init
> -        * so that the hw_apriv flag can be correctly set. Snoop into the info
> -        * and grab the revision number
> -        */
> -       info = adreno_info(config->rev);
> -
> -       if (info && (info->revn == 650 || info->revn == 660 ||
> -                       adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))
> -               adreno_gpu->base.hw_apriv = true;
> -
>         a6xx_llc_slices_init(pdev, a6xx_gpu);
>
>         ret = a6xx_set_supported_hw(&pdev->dev, config->rev);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 7b9d605..44321ec 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -276,6 +276,7 @@ static const struct adreno_info gpulist[] = {
>                 .rev = ADRENO_REV(6, 5, 0, ANY_ID),
>                 .revn = 650,
>                 .name = "A650",
> +               .features = ADRENO_APRIV,

I guess this should be:

        .features = BIT(ADRENO_APRIV),

>                 .fw = {
>                         [ADRENO_FW_SQE] = "a650_sqe.fw",
>                         [ADRENO_FW_GMU] = "a650_gmu.bin",
> @@ -289,6 +290,7 @@ static const struct adreno_info gpulist[] = {
>                 .rev = ADRENO_REV(6, 6, 0, ANY_ID),
>                 .revn = 660,
>                 .name = "A660",
> +               .features = ADRENO_APRIV,
>                 .fw = {
>                         [ADRENO_FW_SQE] = "a660_sqe.fw",
>                         [ADRENO_FW_GMU] = "a660_gmu.bin",
> @@ -301,6 +303,7 @@ static const struct adreno_info gpulist[] = {
>         }, {
>                 .rev = ADRENO_REV(6, 3, 5, ANY_ID),
>                 .name = "Adreno 7c Gen 3",
> +               .features = ADRENO_APRIV,
>                 .fw = {
>                         [ADRENO_FW_SQE] = "a660_sqe.fw",
>                         [ADRENO_FW_GMU] = "a660_gmu.bin",
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 9f5a302..e8acadf5 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -945,6 +945,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>         pm_runtime_use_autosuspend(dev);
>         pm_runtime_enable(dev);
>
> +       if (ADRENO_FEAT(adreno_gpu, ADRENO_APRIV))
> +               adreno_gpu->base.hw_apriv = true;
> +
>         return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
>                         adreno_gpu->info->name, &adreno_gpu_config);
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 50b4d53..61797c3 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -35,6 +35,11 @@ enum adreno_quirks {
>         ADRENO_QUIRK_LMLOADKILL_DISABLE = 3,
>  };
>
> +enum adreno_features {
> +       /* ADRENO has HW APRIV feature */
> +       ADRENO_APRIV,
> +};
> +
>  struct adreno_rev {
>         uint8_t  core;
>         uint8_t  major;
> @@ -63,6 +68,7 @@ struct adreno_info {
>         struct adreno_rev rev;
>         uint32_t revn;
>         const char *name;
> +       u32 features;
>         const char *fw[ADRENO_FW_MAX];
>         uint32_t gmem;
>         enum adreno_quirks quirks;
> @@ -388,6 +394,9 @@ static inline uint32_t get_wptr(struct msm_ringbuffer *ring)
>         return (ring->cur - ring->start) % (MSM_GPU_RINGBUFFER_SZ >> 2);
>  }
>
> +#define ADRENO_FEAT(adreno_gpu, feature) \
> +       (adreno_gpu->info->features & (1 << feature))

And also use BIT() here

But I suppose we could also do something like:

    #define ADRENO_FEAT(feature)  BIT(ADRENO_ ## feature)
    #define ADRENO_HAS_FEAT(adreno_gpu, feature) \
           ((adreno_gpu)->info->features & ADRENO_FEAT(feature))

and then in the gpulist table:

     .features = ADRENO_FEAT(APRIV) | ADRENO_FEAT(FOO) | ADRENO_FEAT(BAR)

that way there is no confusion about whether or not to use BIT()

Otherwise, I like the idea.

BR,
-R

> +
>  /*
>   * Given a register and a count, return a value to program into
>   * REG_CP_PROTECT_REG(n) - this will block both reads and writes for _len
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation.
>
