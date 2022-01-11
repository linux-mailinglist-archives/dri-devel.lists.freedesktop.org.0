Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D66CA48BB1D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 23:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5885310E631;
	Tue, 11 Jan 2022 22:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663FB10E61F;
 Tue, 11 Jan 2022 22:57:42 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id w26so398546wmi.0;
 Tue, 11 Jan 2022 14:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=glmkjzY8Fi9sqkIQnl9KfDtWWrINBNZm5tVmuz2Pnbo=;
 b=hLCUPw0FQZ4odRq4xM2sYsyJ+sGOJecN2sIu8aBK2P7zjXbXLgfrR59Ox5NQplUlGG
 lZ9C99G12sbT/+SIQQ6p//8TDuLRYSqasm6uCuZe6X5MZpJ1anevbecxgAg/jzIpM32g
 lCJpFa5ILRjePFM6wUwMCe34jWrdT22Xn3jt8nKIRVryqAYZUtzJCunwiQREyzranpXq
 OxotV2Ld29XyjQgwC21a1dDZNNkn8ZEkThp1fNAZLmSJx+VNm7iyfPH8I7pFesQKebV2
 eL5bXt0LRsPTsdZ/roQPWuPx3+5V4iH9aVzkfBwKS8NhCsJaAbnNcM1rZnJXr9h3P/9Q
 PzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=glmkjzY8Fi9sqkIQnl9KfDtWWrINBNZm5tVmuz2Pnbo=;
 b=SucauG0jRZGDmrq1WnEcLvYtICsddBs9XgPP/uDMPQtbOTs+PZfiJ2xZIu4k7QWMnI
 cQbwHoRQv87AHDiVVARKIJkVP2vvEkn+4yTxgZ4lXhQrzFDQRWbBLQ1MwcByBE5/l3y9
 PF5yqPVecNv9zcw9+jkPS58KdHhgf1/y1hnf2We4Y7IKK/1svX3I+OrAFg4D1cs1qXqP
 SEdhjUW5zA6wgdashSfMYFbieOZbpfo1FyOwp5fzwtElNXIErlP+saYcaT0bWgFr665W
 h4QmxDL40q8y8phHFZ+Ub+lwqOA3lDjAHIupWLvZTOqW1bt3AVl1inWLPskivIZfCn5G
 taCw==
X-Gm-Message-State: AOAM530p/PZcUWQqklUXl1rn3NbvhUtaheHAqb+YiLwEgsHA9IvTDBoA
 XXkachb2zZMyQi8fR4eZkNtnz2jtk2JorXgPyj8=
X-Google-Smtp-Source: ABdhPJylc0rXcIM7Aa+xdHt5hCIktFOufNg7jem7FFEktxAO9b6unTsDGOWJaOqB8caJRzMFrxO0jM4+YRpF/6dn+nU=
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr4344676wmh.44.1641941860733; 
 Tue, 11 Jan 2022 14:57:40 -0800 (PST)
MIME-Version: 1.0
References: <20220112030115.1.Ibac66e1e0e565313bc28f192e6c94cb508f205eb@changeid>
In-Reply-To: <20220112030115.1.Ibac66e1e0e565313bc28f192e6c94cb508f205eb@changeid>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 11 Jan 2022 14:57:38 -0800
Message-ID: <CAF6AEGsw0sm-6cRKY7qNx-R04Csy5Mn-ZwHce0wSmdQ1mt6RgQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/msm/adreno: Add support for Adreno 8c Gen 3
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
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
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Eric Anholt <eric@anholt.net>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 freedreno <freedreno@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 11, 2022 at 1:31 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> Add support for "Adreno 8c Gen 3" gpu along with the necessary speedbin
> support.
>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 21 +++++++++++++++++----
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 29 ++++++++++++++++++++++++++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 10 ++++++++--
>  3 files changed, 51 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 51b8377..9268ce3 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -10,7 +10,6 @@
>
>  #include <linux/bitfield.h>
>  #include <linux/devfreq.h>
> -#include <linux/nvmem-consumer.h>
>  #include <linux/soc/qcom/llcc-qcom.h>
>
>  #define GPU_PAS_ID 13
> @@ -1734,6 +1733,18 @@ static u32 a618_get_speed_bin(u32 fuse)
>         return UINT_MAX;
>  }
>
> +static u32 adreno_7c3_get_speed_bin(u32 fuse)
> +{
> +       if (fuse == 0)
> +               return 0;
> +       else if (fuse == 117)
> +               return 0;
> +       else if (fuse == 190)
> +               return 1;
> +
> +       return UINT_MAX;
> +}
> +
>  static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
>  {
>         u32 val = UINT_MAX;
> @@ -1741,6 +1752,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
>         if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
>                 val = a618_get_speed_bin(fuse);
>
> +       if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
> +               val = adreno_7c3_get_speed_bin(fuse);
> +
>         if (val == UINT_MAX) {
>                 DRM_DEV_ERROR(dev,
>                         "missing support for speed-bin: %u. Some OPPs may not be supported by hardware",
> @@ -1753,11 +1767,10 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
>
>  static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
>  {
> -       u32 supp_hw = UINT_MAX;
> -       u32 speedbin;
> +       u32 speedbin, supp_hw = UINT_MAX;
>         int ret;
>
> -       ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", &speedbin);
> +       ret = adreno_read_speedbin(dev, &speedbin);
>         /*
>          * -ENOENT means that the platform doesn't support speedbin which is
>          * fine
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 9300583..f35c631 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -6,6 +6,7 @@
>   * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
>   */
>
> +#include <linux/nvmem-consumer.h>
>  #include "adreno_gpu.h"
>
>  bool hang_debug = false;
> @@ -317,6 +318,17 @@ static const struct adreno_info gpulist[] = {
>                 .zapfw = "a660_zap.mdt",
>                 .hwcg = a660_hwcg,
>         }, {
> +               .rev = ADRENO_REV_SKU(6, 3, 5, ANY_ID, 190),
> +               .name = "Adreno 8c Gen 3",
> +               .fw = {
> +                       [ADRENO_FW_SQE] = "a660_sqe.fw",
> +                       [ADRENO_FW_GMU] = "a660_gmu.bin",
> +               },
> +               .gmem = SZ_512K,
> +               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +               .init = a6xx_gpu_init,
> +               .hwcg = a660_hwcg,
> +       }, {
>                 .rev = ADRENO_REV(6, 3, 5, ANY_ID),
>                 .name = "Adreno 7c Gen 3",
>                 .fw = {
> @@ -371,7 +383,8 @@ bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2)
>         return _rev_match(rev1.core, rev2.core) &&
>                 _rev_match(rev1.major, rev2.major) &&
>                 _rev_match(rev1.minor, rev2.minor) &&
> -               _rev_match(rev1.patchid, rev2.patchid);
> +               _rev_match(rev1.patchid, rev2.patchid) &&
> +               _rev_match(rev1.sku, rev2.sku);
>  }
>
>  const struct adreno_info *adreno_info(struct adreno_rev rev)
> @@ -445,12 +458,17 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
>         return gpu;
>  }
>
> +int adreno_read_speedbin(struct device *dev, u32 *speedbin)
> +{
> +       return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
> +}

If you are going to add a helper for this, you should probably use it
in a6xx_set_supported_hw() as well..

BR,
-R

> +
>  static int find_chipid(struct device *dev, struct adreno_rev *rev)
>  {
>         struct device_node *node = dev->of_node;
>         const char *compat;
>         int ret;
> -       u32 chipid;
> +       u32 chipid, speedbin;
>
>         /* first search the compat strings for qcom,adreno-XYZ.W: */
>         ret = of_property_read_string_index(node, "compatible", 0, &compat);
> @@ -466,7 +484,7 @@ static int find_chipid(struct device *dev, struct adreno_rev *rev)
>                         rev->minor = r;
>                         rev->patchid = patch;
>
> -                       return 0;
> +                       goto done;
>                 }
>         }
>
> @@ -486,6 +504,11 @@ static int find_chipid(struct device *dev, struct adreno_rev *rev)
>         dev_warn(dev, "Use compatible qcom,adreno-%u%u%u.%u instead.\n",
>                 rev->core, rev->major, rev->minor, rev->patchid);
>
> +done:
> +       if (adreno_read_speedbin(dev, &speedbin))
> +               speedbin = ANY_ID;
> +
> +       rev->sku = (uint16_t) (0xffff & speedbin);
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index cffabe7..52bd93a 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -40,12 +40,16 @@ struct adreno_rev {
>         uint8_t  major;
>         uint8_t  minor;
>         uint8_t  patchid;
> +       uint16_t sku;
>  };
>
> -#define ANY_ID 0xff
> +#define ANY_ID 0xff
> +#define ANY_SKU 0xffff
>
>  #define ADRENO_REV(core, major, minor, patchid) \
> -       ((struct adreno_rev){ core, major, minor, patchid })
> +       ((struct adreno_rev){ core, major, minor, patchid, ANY_SKU })
> +#define ADRENO_REV_SKU(core, major, minor, patchid, sku) \
> +       ((struct adreno_rev){ core, major, minor, patchid, sku })
>
>  struct adreno_gpu_funcs {
>         struct msm_gpu_funcs base;
> @@ -324,6 +328,8 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
>
>  void adreno_set_llc_attributes(struct iommu_domain *iommu);
>
> +int adreno_read_speedbin(struct device *dev, u32 *speedbin);
> +
>  /*
>   * For a5xx and a6xx targets load the zap shader that is used to pull the GPU
>   * out of secure mode
> --
> 2.7.4
>
