Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0DC3D490D
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 20:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48FAC734D4;
	Sat, 24 Jul 2021 18:08:11 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43064734D4
 for <dri-devel@freedesktop.org>; Sat, 24 Jul 2021 18:08:10 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 9-20020a05600c26c9b02901e44e9caa2aso3582235wmv.4
 for <dri-devel@freedesktop.org>; Sat, 24 Jul 2021 11:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MiQpeDS/bOdbcucYOh8ALaob0EUSxGeoUAmNnRu5KIw=;
 b=Z7/vRFeMC8P++O7/RZkBHsMZ1S1J/Kk/bvQAA56l28KEnna/VLLCCG70iAKvkBv+gH
 4gun0YuCAgeQ2zcMJuqAFlzsMbj3N3Ti+5I90iD/EOz2PhwHbuy402GR/4bMF4qZM8FO
 LVeM4ChsAH2jU1mMkENW070byRODKtFlEPcc0xXJ2vBTrfOqDBTnx+bp09i5UyEcu7Tq
 bKImnBngmoTzHjAPGvU/xo0/j8H/7hD62uu9AWJ5CyKjx0Cd0fpfegS5VK28mBkX73Q/
 4ScG4SNGqNwK7le0vqB3m93D9IwCQsgHOL22A+iY2feexBvRbL3jcJtxHT/ap/qVUJ4s
 i0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MiQpeDS/bOdbcucYOh8ALaob0EUSxGeoUAmNnRu5KIw=;
 b=PGcW4oJn6nzF47Lf71+tb2Pzy51yErNHCFqrt2kVPeM4YRjWmRqIFUdUS6mb4LdwLb
 BdAOPbk0d1OB7Ano1hu8GpKO8NGpuvVI/24+YDxFQEX3/MVVLQuDq6HXKstvPaed6aEL
 qtq92/IDk1jy4XbdnG7H0aD6peC16N0pggk2z9Kwf+U7n5IvWuxtJlyr0gi2bmxWMgB6
 v/jiD2c7gU8wpFKLx+zjhgFX7Zs4v1STKJHUQ5eMyCUVnVntlhQcpoRwLFYCJyGiqKq/
 4M2Bko0RmJWeZ0H7sK8hU6xNlAqtg7cadjPxcsjQiw0xTP0RG+DbFuqXnxMxWzZoxLp2
 gsgQ==
X-Gm-Message-State: AOAM531fihZ2Vw5Nr1quwHIuCVx5KtpAcZpJxBfHS8yc33Ph346MzlSe
 dhjzgOQpFqPClAQ4zxtUh6xeXeHpeJnlktbo2Pc=
X-Google-Smtp-Source: ABdhPJwrhLZVEEgV4rK8VyCIepljzXGPeQHv6t3bOH/ECjyHC23eVO7r5YJuGjHPHJgDjsbDUtW726xKDsntFIL2d3s=
X-Received: by 2002:a1c:f414:: with SMTP id z20mr19935294wma.94.1627150088851; 
 Sat, 24 Jul 2021 11:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <1627036688-1426-1-git-send-email-akhilpo@codeaurora.org>
 <1627036688-1426-2-git-send-email-akhilpo@codeaurora.org>
In-Reply-To: <1627036688-1426-2-git-send-email-akhilpo@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 24 Jul 2021 11:12:17 -0700
Message-ID: <CAF6AEGvn3BEJDS_8jDqVNfV6Z5GKdtETkFyMnBoG5ONsMZi5Xg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/a6xx: Add support for Adreno 7c
 Gen 3 gpu
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
Cc: Jonathan <jonathan@marek.ca>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Matthias Kaehlcke <mka@chromium.org>,
 dri-devel@freedesktop.org, freedreno <freedreno@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

()

On Fri, Jul 23, 2021 at 3:38 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> This patch adds support for the gpu found in the Snapdragon 7c Gen 3
> compute platform. This gpu is similar to the exisiting a660 gpu with
> minor delta in the programing sequence. As the Adreno GPUs are moving
> away from a numeric chipid based naming scheme to a string, it was
> decided to use 0x06030500 as the gpu id of this gpu to communicate
> to the userspace driver.
>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 20 ++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h      |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h  |  2 ++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 21 ++++++++++++++------
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c      | 32 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 12 +++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 11 ++++++++--
>  7 files changed, 90 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index b349692..332301f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -933,6 +933,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>
>         /* Use a known rate to bring up the GMU */
>         clk_set_rate(gmu->core_clk, 200000000);
> +       clk_set_rate(gmu->hub_clk, 150000000);
>         ret = clk_bulk_prepare_enable(gmu->nr_clocks, gmu->clocks);
>         if (ret) {
>                 pm_runtime_put(gmu->gxpd);
> @@ -1094,6 +1095,7 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
>
>  int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
>  {
> +       struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>         struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>         struct msm_gpu *gpu = &a6xx_gpu->base.base;
>
> @@ -1117,9 +1119,22 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
>          * domain. Usually the GMU does this but only if the shutdown sequence
>          * was successful
>          */
> -       if (!IS_ERR_OR_NULL(gmu->gxpd))
> +       if (!IS_ERR_OR_NULL(gmu->gxpd)) {
> +               /*
> +                * Toggle the loop_en bit, across disabling the gx gdsc,
> +                * with a delay of 10 XO cycles before disabling gx
> +                * gdsc. This is to prevent CPR measurements from
> +                * failing.
> +                */
> +               if (adreno_is_a660(adreno_gpu))
> +                       gmu_rmw(gmu, REG_A6XX_GPU_CPR_FSM_CTL, 1, 0);
> +
>                 pm_runtime_put_sync(gmu->gxpd);
>
> +               if (adreno_is_a660(adreno_gpu))
> +                       gmu_rmw(gmu, REG_A6XX_GPU_CPR_FSM_CTL, 1, 1);

This kinda seems like it should be a separate patch.. but I noticed
you silently turned adreno_is_a660() into what should probably be
adreno_is_a660_family()

I'd suggest to break this out into it's own patch, so it is clear that
it effects a660 as well, and then a next patch to rename
adreno_is_a660_family()

Longer term, we might want to think about refactoring all the
if(adreno_is_xyz()) into a features table (see i915_pci.c for ideas)

> +       }
> +
>         clk_bulk_disable_unprepare(gmu->nr_clocks, gmu->clocks);
>
>         pm_runtime_put_sync(gmu->dev);
> @@ -1393,6 +1408,9 @@ static int a6xx_gmu_clocks_probe(struct a6xx_gmu *gmu)
>         gmu->core_clk = msm_clk_bulk_get_clock(gmu->clocks,
>                 gmu->nr_clocks, "gmu");
>
> +       gmu->hub_clk = msm_clk_bulk_get_clock(gmu->clocks,
> +               gmu->nr_clocks, "hub");
> +
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index 71dfa600..3c74f64 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -66,6 +66,7 @@ struct a6xx_gmu {
>         int nr_clocks;
>         struct clk_bulk_data *clocks;
>         struct clk *core_clk;
> +       struct clk *hub_clk;
>
>         /* current performance index set externally */
>         int current_perf_index;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
> index 8115892..d46733f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
> @@ -479,5 +479,7 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
>
>  #define REG_A6XX_RSCC_TCS3_DRV0_STATUS                         0x0000053e
>
> +#define REG_A6XX_GPU_CPR_FSM_CTL                               0x0000c001
> +
>
>  #endif /* A6XX_GMU_XML */
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 183b9f9..c0882536 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -694,6 +694,13 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>                 uavflagprd_inv = 2;
>         }
>
> +       if (adreno_is_7c3(adreno_gpu)) {
> +               lower_bit = 1;
> +               amsbc = 1;
> +               rgb565_predicator = 1;
> +               uavflagprd_inv = 2;
> +       }
> +
>         gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
>                 rgb565_predicator << 11 | amsbc << 4 | lower_bit << 1);
>         gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, lower_bit << 1);
> @@ -950,10 +957,10 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>         /* Setting the primFifo thresholds default values,
>          * and vccCacheSkipDis=1 bit (0x200) for A640 and newer
>         */
> -       if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
> -               gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
> -       else if (adreno_is_a640(adreno_gpu))
> +       if (adreno_is_a640(adreno_gpu) || adreno_is_7c3(adreno_gpu))
>                 gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
> +       else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
> +               gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
>         else
>                 gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00180000);
>
> @@ -993,8 +1000,9 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>         if (adreno_is_a660(adreno_gpu)) {
>                 gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, 0x1);
>                 gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x0);
> -               /* Set dualQ + disable afull for A660 GPU but not for A635 */
> -               gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x66906);
> +               /* Set dualQ + disable afull for A660 GPU but not for 7c3 */
> +               if (!adreno_is_7c3(adreno_gpu))
> +                       gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x66906);
>         }
>
>         /* Enable expanded apriv for targets that support it */
> @@ -1780,7 +1788,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>          */
>         info = adreno_info(config->rev);
>
> -       if (info && (info->revn == 650 || info->revn == 660))
> +       if (info && (info->revn == 650 || info->revn == 660
> +                       || info->revn == ADRENO_REV_7C3))
>                 adreno_gpu->base.hw_apriv = true;
>
>         a6xx_llc_slices_init(pdev, a6xx_gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index 9194337..1451c2b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -382,6 +382,36 @@ static void a660_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>         msg->cnoc_cmds_data[1][0] =  0x60000001;
>  }
>
> +static void adreno_7c3_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +{
> +       /*
> +        * Send a single "off" entry just to get things running
> +        * TODO: bus scaling
> +        */
> +       msg->bw_level_num = 1;
> +
> +       msg->ddr_cmds_num = 3;
> +       msg->ddr_wait_bitmask = 0x07;
> +
> +       msg->ddr_cmds_addrs[0] = 0x50004;
> +       msg->ddr_cmds_addrs[1] = 0x50000;
> +       msg->ddr_cmds_addrs[2] = 0x50088;
> +
> +       msg->ddr_cmds_data[0][0] =  0x40000000;
> +       msg->ddr_cmds_data[0][1] =  0x40000000;
> +       msg->ddr_cmds_data[0][2] =  0x40000000;
> +
> +       /*
> +        * These are the CX (CNOC) votes - these are used by the GMU but the
> +        * votes are known and fixed for the target
> +        */
> +       msg->cnoc_cmds_num = 1;
> +       msg->cnoc_wait_bitmask = 0x01;
> +
> +       msg->cnoc_cmds_addrs[0] = 0x5006c;
> +       msg->cnoc_cmds_data[0][0] =  0x40000000;
> +       msg->cnoc_cmds_data[1][0] =  0x60000001;
> +}
>  static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
>         /* Send a single "off" entry since the 630 GMU doesn't do bus scaling */
> @@ -432,6 +462,8 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>                 a640_build_bw_table(&msg);
>         else if (adreno_is_a650(adreno_gpu))
>                 a650_build_bw_table(&msg);
> +       else if (adreno_is_7c3(adreno_gpu))
> +               adreno_7c3_build_bw_table(&msg);
>         else if (adreno_is_a660(adreno_gpu))
>                 a660_build_bw_table(&msg);
>         else
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 6dad801..063b847 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -300,6 +300,18 @@ static const struct adreno_info gpulist[] = {
>                 .init = a6xx_gpu_init,
>                 .zapfw = "a660_zap.mdt",
>                 .hwcg = a660_hwcg,
> +       }, {
> +               .rev = ADRENO_REV(6, 3, 5, ANY_ID),
> +               .revn = ADRENO_REV_7C3,

So rather than adding an ARENO_REV_7C3 define, I was thinking to just
not set .revn (leave it zero) and identify based on .rev .. that (ie.
GPU_ID being zero) would also be the signal to userspace to identify
the GPU via CHIP_ID instead

You could extract out the version comparison in adreno_info() into a
helper that can be re-used in things like adreno_is_a660_family() and
adreno_is_7c3().

BR,
-R

> +               .name = "Adreno 7c Gen 3",
> +               .fw = {
> +                       [ADRENO_FW_SQE] = "a660_sqe.fw",
> +                       [ADRENO_FW_GMU] = "a660_gmu.bin",
> +               },
> +               .gmem = SZ_512K,
> +               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +               .init = a6xx_gpu_init,
> +               .hwcg = a660_hwcg,
>         },
>  };
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 8dbe0d1..679bc59 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -247,15 +247,22 @@ static inline int adreno_is_a650(struct adreno_gpu *gpu)
>         return gpu->revn == 650;
>  }
>
> +#define ADRENO_REV_7C3 0x06030500
> +static inline int adreno_is_7c3(struct adreno_gpu *gpu)
> +{
> +       return gpu->revn == ADRENO_REV_7C3;
> +}
> +
>  static inline int adreno_is_a660(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn == 660;
> +       return gpu->revn == 660 || gpu->revn == ADRENO_REV_7C3;
>  }
>
>  /* check for a650, a660, or any derivatives */
>  static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn == 650 || gpu->revn == 620 || gpu->revn == 660;
> +       return gpu->revn == 650 || gpu->revn == 620 || gpu->revn == 660
> +              || gpu->revn == ADRENO_REV_7C3;
>  }
>
>  int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value);
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation.
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
