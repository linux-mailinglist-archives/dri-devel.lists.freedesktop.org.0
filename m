Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 917306922F4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 17:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA4210E28A;
	Fri, 10 Feb 2023 16:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4516810E0FF;
 Fri, 10 Feb 2023 16:08:12 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 r34-20020a05683044a200b0068d4a8a8d2dso1648942otv.12; 
 Fri, 10 Feb 2023 08:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4emY2aYDtRoR9UZ7jLcczorMFm1waRZPbFvwM4wLc9E=;
 b=aWSWteleIR9+UAZEVCZEVc8HP/hkIhR1OLjT7/VCjv+2oohX6i+Zo5V2E5Q6VnaVO5
 25xAWOidHRMn2qSboWzDgvBEbsZEOMNWs8YJzyRanQsgcbLKgGoxU7+dumPF94Hy6QIE
 yOnxzodhTNpMF2oLO1B+p1yCJl3CknTjR/XxxesNvhUMqvKvUNJQ9mUJZNO7cs3poufJ
 CkIxMOnv+CKwAAgJ9cgeYS08koP6JHmmcY/ptmxW3H9VmJcjkkp/rtE0O0c95iEwXz0u
 W3gs6sMmWOKvOSfQopWGWNws/umzHXb+nfrgAgPwrcACcJEXNAajvC53TVeuW6HLmkjO
 lSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4emY2aYDtRoR9UZ7jLcczorMFm1waRZPbFvwM4wLc9E=;
 b=mST5l0gGkHxP92S1ptyss3CO9FckblgTCkmFWdi3RWUplQKbU7TJPzUzuFqFJip7Qd
 1ZqxhDdo1wswOBniq/dVlwUO+FOydK8zpSPjHXGYX7ZJLfAB17XG/q8bumgKbb7Vn1Uu
 m4vv/m8ZiBG42mkR/kAJulbo5QesnjBD6eukYLd4yUSpXTQolIvZGGFlibYHx4YV543+
 tyY3O1E+wQXLaMUj4S8OzdMc4mAs7q7FckgmA8SBn1li1EJk931lmAfUvXIGDULXAkMC
 hLpgR6HvtTemib7u/eTERjDQnjayPoaYvZIFYgnquvHSpWVyZ0iChgL14qUL4PkZYEIP
 EdGw==
X-Gm-Message-State: AO0yUKW0AMwBFMYvHJzrnqUlU/GtvB2mciem/641RQXyALws1JAmoOlI
 94A8tAoD/kKNEu2NPPQwfTfuodZCob62anxSXas=
X-Google-Smtp-Source: AK7set9wgkk0Y/btfsROL9d/dXkzdbQqIynUkExuaeqvBxQwiu451kzhqQ0eMzAL1mKWWxUC8G4bIA7idOvfMSuXOxk=
X-Received: by 2002:a9d:862:0:b0:68b:d79f:e4f8 with SMTP id
 89-20020a9d0862000000b0068bd79fe4f8mr1361711oty.100.1676045291353; Fri, 10
 Feb 2023 08:08:11 -0800 (PST)
MIME-Version: 1.0
References: <20230208034052.2047681-1-quic_bjorande@quicinc.com>
 <20230208034052.2047681-2-quic_bjorande@quicinc.com>
In-Reply-To: <20230208034052.2047681-2-quic_bjorande@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 10 Feb 2023 08:07:58 -0800
Message-ID: <CAF6AEGvHudjbeE5B9rTi=i9=MHZokgAgB3H_7uyyziex_BEkvA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/adreno: Add Adreno A690 support
To: Bjorn Andersson <quic_bjorande@quicinc.com>
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
Cc: devicetree@vger.kernel.org, mani@kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, johan@kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 7, 2023 at 7:41 PM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Introduce support for the Adreno A690, found in Qualcomm SC8280XP.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 120 ++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c      |  34 ++++++
>  drivers/gpu/drm/msm/adreno/adreno_device.c |  14 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  10 +-
>  4 files changed, 173 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index aae60cbd9164..81dfcc5073ad 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -588,6 +588,63 @@ const struct adreno_reglist a660_hwcg[] = {
>         {},
>  };
>
> +const struct adreno_reglist a690_hwcg[] = {
> +       {REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222},
> +       {REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
> +       {REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
> +       {REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
> +       {REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222},
> +       {REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
> +       {REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
> +       {REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222},
> +       {REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
> +       {REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
> +       {REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111},
> +       {REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111},
> +       {REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777},
> +       {REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
> +       {REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777},
> +       {REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777},
> +       {REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
> +       {REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01002222},
> +       {REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220},
> +       {REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040F00},
> +       {REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x25222022},
> +       {REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
> +       {REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
> +       {REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044},
> +       {REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
> +       {REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
> +       {REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x00222222},
> +       {REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002},
> +       {REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222},
> +       {REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
> +       {REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
> +       {REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
> +       {REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
> +       {REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
> +       {REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
> +       {REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
> +       {REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000},
> +       {REG_A6XX_RBBM_CLOCK_CNTL_TEX_FCHE, 0x00000222},
> +       {REG_A6XX_RBBM_CLOCK_DELAY_TEX_FCHE, 0x00000111},
> +       {REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE, 0x00000000},
> +       {REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
> +       {REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004},
> +       {REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
> +       {REG_A6XX_RBBM_CLOCK_CNTL, 0x8AA8AA82},
> +       {REG_A6XX_RBBM_ISDB_CNT, 0x00000182},
> +       {REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000},
> +       {REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000},
> +       {REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
> +       {REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
> +       {REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
> +       {REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL, 0x20200},
> +       {REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL, 0x10111},
> +       {REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL, 0x5555},
> +       {}
> +};
> +
>  static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>  {
>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> @@ -747,6 +804,45 @@ static const u32 a660_protect[] = {
>         A6XX_PROTECT_NORDWR(0x1f8c0, 0x0000), /* note: infinite range */
>  };
>
> +/* These are for a690 */
> +static const u32 a690_protect[] = {
> +       A6XX_PROTECT_RDONLY(0x00000, 0x004ff),
> +       A6XX_PROTECT_RDONLY(0x00501, 0x00001),
> +       A6XX_PROTECT_RDONLY(0x0050b, 0x002f4),
> +       A6XX_PROTECT_NORDWR(0x0050e, 0x00000),
> +       A6XX_PROTECT_NORDWR(0x00510, 0x00000),
> +       A6XX_PROTECT_NORDWR(0x00534, 0x00000),
> +       A6XX_PROTECT_NORDWR(0x00800, 0x00082),
> +       A6XX_PROTECT_NORDWR(0x008a0, 0x00008),
> +       A6XX_PROTECT_NORDWR(0x008ab, 0x00024),
> +       A6XX_PROTECT_RDONLY(0x008d0, 0x000bc),

There is a slight difference from downstream here, upstream userspace
needs access to CP_PERFCTR_CP_SEL so this range starts at 0x008de.  I
*think* that is the only major difference in CP_PROTECT settings.

BR,
-R

> +       A6XX_PROTECT_NORDWR(0x00900, 0x0004d),
> +       A6XX_PROTECT_NORDWR(0x0098d, 0x00272),
> +       A6XX_PROTECT_NORDWR(0x00e00, 0x00001),
> +       A6XX_PROTECT_NORDWR(0x00e03, 0x0000c),
> +       A6XX_PROTECT_NORDWR(0x03c00, 0x000c3),
> +       A6XX_PROTECT_RDONLY(0x03cc4, 0x01fff),
> +       A6XX_PROTECT_NORDWR(0x08630, 0x001cf),
> +       A6XX_PROTECT_NORDWR(0x08e00, 0x00000),
> +       A6XX_PROTECT_NORDWR(0x08e08, 0x00008),
> +       A6XX_PROTECT_NORDWR(0x08e50, 0x0001f),
> +       A6XX_PROTECT_NORDWR(0x08e80, 0x0027f),
> +       A6XX_PROTECT_NORDWR(0x09624, 0x001db),
> +       A6XX_PROTECT_NORDWR(0x09e60, 0x00011),
> +       A6XX_PROTECT_NORDWR(0x09e78, 0x00187),
> +       A6XX_PROTECT_NORDWR(0x0a630, 0x001cf),
> +       A6XX_PROTECT_NORDWR(0x0ae02, 0x00000),
> +       A6XX_PROTECT_NORDWR(0x0ae50, 0x0012f),
> +       A6XX_PROTECT_NORDWR(0x0b604, 0x00000),
> +       A6XX_PROTECT_NORDWR(0x0b608, 0x00006),
> +       A6XX_PROTECT_NORDWR(0x0be02, 0x00001),
> +       A6XX_PROTECT_NORDWR(0x0be20, 0x0015f),
> +       A6XX_PROTECT_NORDWR(0x0d000, 0x005ff),
> +       A6XX_PROTECT_NORDWR(0x0f000, 0x00bff),
> +       A6XX_PROTECT_RDONLY(0x0fc00, 0x01fff),
> +       A6XX_PROTECT_NORDWR(0x11c00, 0x00000), /*note: infiite range */
> +};
> +
>  static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> @@ -758,6 +854,11 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>                 count = ARRAY_SIZE(a650_protect);
>                 count_max = 48;
>                 BUILD_BUG_ON(ARRAY_SIZE(a650_protect) > 48);
> +       } else if (adreno_is_a690(adreno_gpu)) {
> +               regs = a690_protect;
> +               count = ARRAY_SIZE(a690_protect);
> +               count_max = 48;
> +               BUILD_BUG_ON(ARRAY_SIZE(a690_protect) > 48);
>         } else if (adreno_is_a660_family(adreno_gpu)) {
>                 regs = a660_protect;
>                 count = ARRAY_SIZE(a660_protect);
> @@ -806,6 +907,13 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>                 uavflagprd_inv = 2;
>         }
>
> +       if (adreno_is_a690(adreno_gpu)) {
> +               lower_bit = 2;
> +               amsbc = 1;
> +               rgb565_predicator = 1;
> +               uavflagprd_inv = 2;
> +       }
> +
>         if (adreno_is_7c3(adreno_gpu)) {
>                 lower_bit = 1;
>                 amsbc = 1;
> @@ -1065,13 +1173,18 @@ static int hw_init(struct msm_gpu *gpu)
>         if (adreno_is_a660_family(adreno_gpu))
>                 gpu_write(gpu, REG_A6XX_CP_LPAC_PROG_FIFO_SIZE, 0x00000020);
>
> +       if (adreno_is_a690(adreno_gpu)) {
> +               gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x0);
> +               gpu_write(gpu, REG_A6XX_CP_LPAC_PROG_FIFO_SIZE, 0x00000020);
> +       }
> +
>         /* Setting the mem pool size */
>         gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 128);
>
>         /* Setting the primFifo thresholds default values,
>          * and vccCacheSkipDis=1 bit (0x200) for A640 and newer
>         */
> -       if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
> +       if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu) || adreno_is_a690(adreno_gpu))
>                 gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
>         else if (adreno_is_a640_family(adreno_gpu) || adreno_is_7c3(adreno_gpu))
>                 gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
> @@ -1579,7 +1692,7 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>                 /* On A660, the SCID programming for UCHE traffic is done in
>                  * A6XX_GBIF_SCACHE_CNTL0[14:10]
>                  */
> -               if (adreno_is_a660_family(adreno_gpu))
> +               if (adreno_is_a660_family(adreno_gpu) || adreno_is_a690(adreno_gpu))
>                         gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL0, (0x1f << 10) |
>                                 (1 << 8), (gpu_scid << 10) | (1 << 8));
>         }
> @@ -2006,7 +2119,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>         info = adreno_info(config->rev);
>
>         if (info && (info->revn == 650 || info->revn == 660 ||
> -                       adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))
> +                    info->revn == 690 ||
> +                    adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))
>                 adreno_gpu->base.hw_apriv = true;
>
>         a6xx_llc_slices_init(pdev, a6xx_gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index 2cc83e049613..4d6d68a25931 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -4,6 +4,7 @@
>  #include <linux/completion.h>
>  #include <linux/circ_buf.h>
>  #include <linux/list.h>
> +#include <soc/qcom/cmd-db.h>
>
>  #include "a6xx_gmu.h"
>  #include "a6xx_gmu.xml.h"
> @@ -414,6 +415,37 @@ static void a650_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>         msg->cnoc_cmds_data[1][0] =  0x60000001;
>  }
>
> +static void a690_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +{
> +       /*
> +        * Send a single "off" entry just to get things running
> +        * TODO: bus scaling
> +        */
> +       msg->bw_level_num = 1;
> +
> +       msg->ddr_cmds_num = 3;
> +       msg->ddr_wait_bitmask = 0x01;
> +
> +       msg->ddr_cmds_addrs[0] = cmd_db_read_addr("SH0");
> +       msg->ddr_cmds_addrs[1] = cmd_db_read_addr("MC0");
> +       msg->ddr_cmds_addrs[2] = cmd_db_read_addr("ACV");
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
> +       msg->cnoc_cmds_addrs[0] = cmd_db_read_addr("CN0");
> +       msg->cnoc_cmds_data[0][0] =  0x40000000;
> +       msg->cnoc_cmds_data[1][0] =  0x60000001;
> +}
> +
>  static void a660_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
>         /*
> @@ -531,6 +563,8 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>                 adreno_7c3_build_bw_table(&msg);
>         else if (adreno_is_a660(adreno_gpu))
>                 a660_build_bw_table(&msg);
> +       else if (adreno_is_a690(adreno_gpu))
> +               a690_build_bw_table(&msg);
>         else
>                 a6xx_build_bw_table(&msg);
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index ca38b837dedb..437515e46e5a 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -355,6 +355,20 @@ static const struct adreno_info gpulist[] = {
>                 .init = a6xx_gpu_init,
>                 .zapfw = "a640_zap.mdt",
>                 .hwcg = a640_hwcg,
> +       }, {
> +               .rev = ADRENO_REV(6, 9, 0, ANY_ID),
> +               .revn = 690,
> +               .name = "A690",
> +               .fw = {
> +                       [ADRENO_FW_SQE] = "a660_sqe.fw",
> +                       [ADRENO_FW_GMU] = "a690_gmu.bin",
> +               },
> +               .gmem = SZ_4M,
> +               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +               .init = a6xx_gpu_init,
> +               .zapfw = "a690_zap.mdt",
> +               .hwcg = a690_hwcg,
> +               .address_space_size = SZ_16G,
>         },
>  };
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index b4f9b1343d63..da29bd392388 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -55,7 +55,7 @@ struct adreno_reglist {
>         u32 value;
>  };
>
> -extern const struct adreno_reglist a615_hwcg[], a630_hwcg[], a640_hwcg[], a650_hwcg[], a660_hwcg[];
> +extern const struct adreno_reglist a615_hwcg[], a630_hwcg[], a640_hwcg[], a650_hwcg[], a660_hwcg[], a690_hwcg[];
>
>  struct adreno_info {
>         struct adreno_rev rev;
> @@ -272,6 +272,11 @@ static inline int adreno_is_a660(struct adreno_gpu *gpu)
>         return gpu->revn == 660;
>  }
>
> +static inline int adreno_is_a690(struct adreno_gpu *gpu)
> +{
> +       return gpu->revn == 690;
> +};
> +
>  /* check for a615, a616, a618, a619 or any derivatives */
>  static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
>  {
> @@ -286,7 +291,8 @@ static inline int adreno_is_a660_family(struct adreno_gpu *gpu)
>  /* check for a650, a660, or any derivatives */
>  static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn == 650 || gpu->revn == 620 || adreno_is_a660_family(gpu);
> +       return gpu->revn == 650 || gpu->revn == 620  || gpu->revn == 690 ||
> +              adreno_is_a660_family(gpu);
>  }
>
>  u64 adreno_private_address_space_size(struct msm_gpu *gpu);
> --
> 2.39.1
>
