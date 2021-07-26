Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74023D52E9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 07:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAAEB6E5A1;
	Mon, 26 Jul 2021 05:47:13 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE536E5A1
 for <dri-devel@freedesktop.org>; Mon, 26 Jul 2021 05:47:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627278433; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=+YYshN0Fg+rdtEFVDKY1g2/gdCqUBEKT3aEs8StFQBQ=;
 b=shcGl55SGUyG4ssofdjtmjVAabql+g9jYkcj7+VLfVOPhDHcNHH0jN3pyUPxacSZxgtcX7lo
 kugV4Ul+NKS9p89HVmohvTxC0v8T3ZYgv/3QPaIDfTj3DMn/yZAqGKHp4UDRu65RBR14TCgG
 lQeu6mhRyrhO9qfWbKwKcz/KnGg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60fe4c58b653fbdadddd3471 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 26 Jul 2021 05:47:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B5E68C43217; Mon, 26 Jul 2021 05:47:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
 version=3.4.0
Received: from [192.168.1.105] (unknown [59.89.230.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F1D94C433D3;
 Mon, 26 Jul 2021 05:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F1D94C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/a6xx: Add support for Adreno 7c
 Gen 3 gpu
To: Rob Clark <robdclark@gmail.com>
References: <1627036688-1426-1-git-send-email-akhilpo@codeaurora.org>
 <1627036688-1426-2-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGvn3BEJDS_8jDqVNfV6Z5GKdtETkFyMnBoG5ONsMZi5Xg@mail.gmail.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <abcaf350-77ea-7ce8-8854-67a25a02211b@codeaurora.org>
Date: Mon, 26 Jul 2021 11:16:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGvn3BEJDS_8jDqVNfV6Z5GKdtETkFyMnBoG5ONsMZi5Xg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 7/24/2021 11:42 PM, Rob Clark wrote:
> ()
> 
> On Fri, Jul 23, 2021 at 3:38 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>>
>> This patch adds support for the gpu found in the Snapdragon 7c Gen 3
>> compute platform. This gpu is similar to the exisiting a660 gpu with
>> minor delta in the programing sequence. As the Adreno GPUs are moving
>> away from a numeric chipid based naming scheme to a string, it was
>> decided to use 0x06030500 as the gpu id of this gpu to communicate
>> to the userspace driver.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 20 ++++++++++++++++++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h      |  1 +
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h  |  2 ++
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 21 ++++++++++++++------
>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c      | 32 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/adreno/adreno_device.c | 12 +++++++++++
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 11 ++++++++--
>>   7 files changed, 90 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index b349692..332301f 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -933,6 +933,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>>
>>          /* Use a known rate to bring up the GMU */
>>          clk_set_rate(gmu->core_clk, 200000000);
>> +       clk_set_rate(gmu->hub_clk, 150000000);
>>          ret = clk_bulk_prepare_enable(gmu->nr_clocks, gmu->clocks);
>>          if (ret) {
>>                  pm_runtime_put(gmu->gxpd);
>> @@ -1094,6 +1095,7 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
>>
>>   int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
>>   {
>> +       struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>>          struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>>          struct msm_gpu *gpu = &a6xx_gpu->base.base;
>>
>> @@ -1117,9 +1119,22 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
>>           * domain. Usually the GMU does this but only if the shutdown sequence
>>           * was successful
>>           */
>> -       if (!IS_ERR_OR_NULL(gmu->gxpd))
>> +       if (!IS_ERR_OR_NULL(gmu->gxpd)) {
>> +               /*
>> +                * Toggle the loop_en bit, across disabling the gx gdsc,
>> +                * with a delay of 10 XO cycles before disabling gx
>> +                * gdsc. This is to prevent CPR measurements from
>> +                * failing.
>> +                */
>> +               if (adreno_is_a660(adreno_gpu))
>> +                       gmu_rmw(gmu, REG_A6XX_GPU_CPR_FSM_CTL, 1, 0);
>> +
>>                  pm_runtime_put_sync(gmu->gxpd);
>>
>> +               if (adreno_is_a660(adreno_gpu))
>> +                       gmu_rmw(gmu, REG_A6XX_GPU_CPR_FSM_CTL, 1, 1);
> 
> This kinda seems like it should be a separate patch.. but I noticed
> you silently turned adreno_is_a660() into what should probably be
> adreno_is_a660_family()
> 
> I'd suggest to break this out into it's own patch, so it is clear that
> it effects a660 as well, and then a next patch to rename
> adreno_is_a660_family()
> 
> Longer term, we might want to think about refactoring all the
> if(adreno_is_xyz()) into a features table (see i915_pci.c for ideas)

I agree. This should have been a seperate patch.

> 
>> +       }
>> +
>>          clk_bulk_disable_unprepare(gmu->nr_clocks, gmu->clocks);
>>
>>          pm_runtime_put_sync(gmu->dev);
>> @@ -1393,6 +1408,9 @@ static int a6xx_gmu_clocks_probe(struct a6xx_gmu *gmu)
>>          gmu->core_clk = msm_clk_bulk_get_clock(gmu->clocks,
>>                  gmu->nr_clocks, "gmu");
>>
>> +       gmu->hub_clk = msm_clk_bulk_get_clock(gmu->clocks,
>> +               gmu->nr_clocks, "hub");
>> +
>>          return 0;
>>   }
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> index 71dfa600..3c74f64 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> @@ -66,6 +66,7 @@ struct a6xx_gmu {
>>          int nr_clocks;
>>          struct clk_bulk_data *clocks;
>>          struct clk *core_clk;
>> +       struct clk *hub_clk;
>>
>>          /* current performance index set externally */
>>          int current_perf_index;
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
>> index 8115892..d46733f 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
>> @@ -479,5 +479,7 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
>>
>>   #define REG_A6XX_RSCC_TCS3_DRV0_STATUS                         0x0000053e
>>
>> +#define REG_A6XX_GPU_CPR_FSM_CTL                               0x0000c001
>> +
>>
>>   #endif /* A6XX_GMU_XML */
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 183b9f9..c0882536 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -694,6 +694,13 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>>                  uavflagprd_inv = 2;
>>          }
>>
>> +       if (adreno_is_7c3(adreno_gpu)) {
>> +               lower_bit = 1;
>> +               amsbc = 1;
>> +               rgb565_predicator = 1;
>> +               uavflagprd_inv = 2;
>> +       }
>> +
>>          gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
>>                  rgb565_predicator << 11 | amsbc << 4 | lower_bit << 1);
>>          gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, lower_bit << 1);
>> @@ -950,10 +957,10 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>>          /* Setting the primFifo thresholds default values,
>>           * and vccCacheSkipDis=1 bit (0x200) for A640 and newer
>>          */
>> -       if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
>> -               gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
>> -       else if (adreno_is_a640(adreno_gpu))
>> +       if (adreno_is_a640(adreno_gpu) || adreno_is_7c3(adreno_gpu))
>>                  gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
>> +       else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
>> +               gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
>>          else
>>                  gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00180000);
>>
>> @@ -993,8 +1000,9 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>>          if (adreno_is_a660(adreno_gpu)) {
>>                  gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, 0x1);
>>                  gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x0);
>> -               /* Set dualQ + disable afull for A660 GPU but not for A635 */
>> -               gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x66906);
>> +               /* Set dualQ + disable afull for A660 GPU but not for 7c3 */
>> +               if (!adreno_is_7c3(adreno_gpu))
>> +                       gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x66906);
>>          }
>>
>>          /* Enable expanded apriv for targets that support it */
>> @@ -1780,7 +1788,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>           */
>>          info = adreno_info(config->rev);
>>
>> -       if (info && (info->revn == 650 || info->revn == 660))
>> +       if (info && (info->revn == 650 || info->revn == 660
>> +                       || info->revn == ADRENO_REV_7C3))
>>                  adreno_gpu->base.hw_apriv = true;
>>
>>          a6xx_llc_slices_init(pdev, a6xx_gpu);
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> index 9194337..1451c2b 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> @@ -382,6 +382,36 @@ static void a660_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>>          msg->cnoc_cmds_data[1][0] =  0x60000001;
>>   }
>>
>> +static void adreno_7c3_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>> +{
>> +       /*
>> +        * Send a single "off" entry just to get things running
>> +        * TODO: bus scaling
>> +        */
>> +       msg->bw_level_num = 1;
>> +
>> +       msg->ddr_cmds_num = 3;
>> +       msg->ddr_wait_bitmask = 0x07;
>> +
>> +       msg->ddr_cmds_addrs[0] = 0x50004;
>> +       msg->ddr_cmds_addrs[1] = 0x50000;
>> +       msg->ddr_cmds_addrs[2] = 0x50088;
>> +
>> +       msg->ddr_cmds_data[0][0] =  0x40000000;
>> +       msg->ddr_cmds_data[0][1] =  0x40000000;
>> +       msg->ddr_cmds_data[0][2] =  0x40000000;
>> +
>> +       /*
>> +        * These are the CX (CNOC) votes - these are used by the GMU but the
>> +        * votes are known and fixed for the target
>> +        */
>> +       msg->cnoc_cmds_num = 1;
>> +       msg->cnoc_wait_bitmask = 0x01;
>> +
>> +       msg->cnoc_cmds_addrs[0] = 0x5006c;
>> +       msg->cnoc_cmds_data[0][0] =  0x40000000;
>> +       msg->cnoc_cmds_data[1][0] =  0x60000001;
>> +}
>>   static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>>   {
>>          /* Send a single "off" entry since the 630 GMU doesn't do bus scaling */
>> @@ -432,6 +462,8 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>>                  a640_build_bw_table(&msg);
>>          else if (adreno_is_a650(adreno_gpu))
>>                  a650_build_bw_table(&msg);
>> +       else if (adreno_is_7c3(adreno_gpu))
>> +               adreno_7c3_build_bw_table(&msg);
>>          else if (adreno_is_a660(adreno_gpu))
>>                  a660_build_bw_table(&msg);
>>          else
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> index 6dad801..063b847 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> @@ -300,6 +300,18 @@ static const struct adreno_info gpulist[] = {
>>                  .init = a6xx_gpu_init,
>>                  .zapfw = "a660_zap.mdt",
>>                  .hwcg = a660_hwcg,
>> +       }, {
>> +               .rev = ADRENO_REV(6, 3, 5, ANY_ID),
>> +               .revn = ADRENO_REV_7C3,
> 
> So rather than adding an ARENO_REV_7C3 define, I was thinking to just
> not set .revn (leave it zero) and identify based on .rev .. that (ie.
> GPU_ID being zero) would also be the signal to userspace to identify
> the GPU via CHIP_ID instead
> 
> You could extract out the version comparison in adreno_info() into a
> helper that can be re-used in things like adreno_is_a660_family() and
> adreno_is_7c3().
> 
> BR,
> -R
Sure. Will update this patch.

-Akhil.
> 
>> +               .name = "Adreno 7c Gen 3",
>> +               .fw = {
>> +                       [ADRENO_FW_SQE] = "a660_sqe.fw",
>> +                       [ADRENO_FW_GMU] = "a660_gmu.bin",
>> +               },
>> +               .gmem = SZ_512K,
>> +               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> +               .init = a6xx_gpu_init,
>> +               .hwcg = a660_hwcg,
>>          },
>>   };
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index 8dbe0d1..679bc59 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -247,15 +247,22 @@ static inline int adreno_is_a650(struct adreno_gpu *gpu)
>>          return gpu->revn == 650;
>>   }
>>
>> +#define ADRENO_REV_7C3 0x06030500
>> +static inline int adreno_is_7c3(struct adreno_gpu *gpu)
>> +{
>> +       return gpu->revn == ADRENO_REV_7C3;
>> +}
>> +
>>   static inline int adreno_is_a660(struct adreno_gpu *gpu)
>>   {
>> -       return gpu->revn == 660;
>> +       return gpu->revn == 660 || gpu->revn == ADRENO_REV_7C3;
>>   }
>>
>>   /* check for a650, a660, or any derivatives */
>>   static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
>>   {
>> -       return gpu->revn == 650 || gpu->revn == 620 || gpu->revn == 660;
>> +       return gpu->revn == 650 || gpu->revn == 620 || gpu->revn == 660
>> +              || gpu->revn == ADRENO_REV_7C3;
>>   }
>>
>>   int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value);
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation.
>>
>> _______________________________________________
>> Freedreno mailing list
>> Freedreno@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/freedreno

