Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E62F70D4EF
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 09:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F7110E3C3;
	Tue, 23 May 2023 07:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 950E510E028
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 07:28:38 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f3af4295ddso4557529e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 00:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684826916; x=1687418916;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R4wijngb6QvR7fUb6UoriVyz99/h98K23JMN/hOkrwE=;
 b=H9dQ97nC5ybHa0NcQluD8by3BHn6gAnM82D0rSakruU9ARajhmcIelQRGk4Y6bRGgB
 ThqKyX5n8BbRJYAKwzXmA9Azj0wgLL4N1JMdpnuoaQrIH8FG+YwooAVsAIEy2lxvtnvc
 z5Qp6Q1m5fl7Et1JswRqRapGUwtnb2sd1UuVrdSsurcDBsYAdW0vvJHCldGPC6MC80UN
 sZKJFEflubZfgIvum1A/kBW8y6vAiieBkj5JWTO3CnzzIWmjk4Ra1Wy2DdOJT7CsLvA0
 aydfBdz3fmMJ5Fl4tLzvmwpeGVJOnYV/X7kRAaMpvdEj+xaE9Fv75ZKfKFNHL8sLlAjF
 tItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684826916; x=1687418916;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R4wijngb6QvR7fUb6UoriVyz99/h98K23JMN/hOkrwE=;
 b=iLdoZIYFo74RLd+jWkuN4iyUhdbJomzBcwDOIbvgYeDl2v+sDM29/CzFrxK7Hua7If
 XNiGl/y37YLK0R3nL0NJUIlRO/rQIXYMtiHF2Vn5bbf1zg0psorKLekbhVoUCMmASBGo
 xmYEVtnVE+KlSMJ8hpFb2KbGtWQ9QM6t733TW5xVlp7afHeCR1feDsPHFSgWng0mq5qr
 COLlSnX65f4NfPESFX+tc4Lwrxqd7gHaF2W/DKj6JjGlobL6TMWqedggtc487l1u9fmS
 B7Z76UICe8u3V0Ygw4/Hdyu0KQ0tIK/LCyVCIkw+xfVPAsHZfVH3+/O0+40TVhm7vV7v
 gRzg==
X-Gm-Message-State: AC+VfDwsrVNISay95wZwHp+r1PowU+iVSd/yuCMjYgDJKpoKYAF4KO2f
 6SLg58eLA9V4ZYSelrInsyS1Tg==
X-Google-Smtp-Source: ACHHUZ7ckzgTPARCqQoFm84g1VkR8uBKvcTnnnaG7omjOTx5eT2p+q7zUCq3nyUBqCKJ2vjO1+UWzw==
X-Received: by 2002:ac2:4556:0:b0:4f1:3d9f:1b4f with SMTP id
 j22-20020ac24556000000b004f13d9f1b4fmr4111085lfm.49.1684826916275; 
 Tue, 23 May 2023 00:28:36 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a2e9104000000b002adb10a6620sm1443408ljg.107.2023.05.23.00.28.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 00:28:35 -0700 (PDT)
Message-ID: <bab56b1e-18e3-25a2-b596-b181f3032cd1@linaro.org>
Date: Tue, 23 May 2023 09:28:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/3] drm/msm/adreno: Add Adreno A690 support
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230523011522.65351-1-quic_bjorande@quicinc.com>
 <20230523011522.65351-2-quic_bjorande@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230523011522.65351-2-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, mani@kernel.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, johan@kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 23.05.2023 03:15, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Introduce support for the Adreno A690, found in Qualcomm SC8280XP.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
> Changes since v1:
> - Moved a690 to adreno_is_a660_family(), which simplifies hw_init() and
>   ensured that pdc_in_aop got set.
> - Dropped dynamic lookup in cmd-db. Will look into posting this
>   separately.
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 113 ++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c      |  33 ++++++
>  drivers/gpu/drm/msm/adreno/adreno_device.c |  14 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  11 +-
>  4 files changed, 166 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 9fb214f150dd..cabc8f9a12d7 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -588,6 +588,63 @@ const struct adreno_reglist a660_hwcg[] = {
>  	{},
>  };
>  
> +const struct adreno_reglist a690_hwcg[] = {
> +	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
> +	{REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111},
> +	{REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01002222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220},
> +	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040F00},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x25222022},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
> +	{REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
> +	{REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
> +	{REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x00222222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002},
> +	{REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
> +	{REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_TEX_FCHE, 0x00000222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_TEX_FCHE, 0x00000111},
> +	{REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
> +	{REG_A6XX_RBBM_CLOCK_CNTL, 0x8AA8AA82},
> +	{REG_A6XX_RBBM_ISDB_CNT, 0x00000182},
> +	{REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000},
> +	{REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
> +	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
> +	{REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL, 0x20200},
> +	{REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL, 0x10111},
> +	{REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL, 0x5555},
> +	{}
> +};
> +
>  static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> @@ -747,6 +804,45 @@ static const u32 a660_protect[] = {
>  	A6XX_PROTECT_NORDWR(0x1f8c0, 0x0000), /* note: infinite range */
>  };
>  
> +/* These are for a690 */
> +static const u32 a690_protect[] = {
> +	A6XX_PROTECT_RDONLY(0x00000, 0x004ff),
> +	A6XX_PROTECT_RDONLY(0x00501, 0x00001),
> +	A6XX_PROTECT_RDONLY(0x0050b, 0x002f4),
> +	A6XX_PROTECT_NORDWR(0x0050e, 0x00000),
> +	A6XX_PROTECT_NORDWR(0x00510, 0x00000),
> +	A6XX_PROTECT_NORDWR(0x00534, 0x00000),
> +	A6XX_PROTECT_NORDWR(0x00800, 0x00082),
> +	A6XX_PROTECT_NORDWR(0x008a0, 0x00008),
> +	A6XX_PROTECT_NORDWR(0x008ab, 0x00024),
> +	A6XX_PROTECT_RDONLY(0x008d0, 0x000bc),
> +	A6XX_PROTECT_NORDWR(0x00900, 0x0004d),
> +	A6XX_PROTECT_NORDWR(0x0098d, 0x00272),
> +	A6XX_PROTECT_NORDWR(0x00e00, 0x00001),
> +	A6XX_PROTECT_NORDWR(0x00e03, 0x0000c),
> +	A6XX_PROTECT_NORDWR(0x03c00, 0x000c3),
> +	A6XX_PROTECT_RDONLY(0x03cc4, 0x01fff),
> +	A6XX_PROTECT_NORDWR(0x08630, 0x001cf),
> +	A6XX_PROTECT_NORDWR(0x08e00, 0x00000),
> +	A6XX_PROTECT_NORDWR(0x08e08, 0x00008),
> +	A6XX_PROTECT_NORDWR(0x08e50, 0x0001f),
> +	A6XX_PROTECT_NORDWR(0x08e80, 0x0027f),
> +	A6XX_PROTECT_NORDWR(0x09624, 0x001db),
> +	A6XX_PROTECT_NORDWR(0x09e60, 0x00011),
> +	A6XX_PROTECT_NORDWR(0x09e78, 0x00187),
> +	A6XX_PROTECT_NORDWR(0x0a630, 0x001cf),
> +	A6XX_PROTECT_NORDWR(0x0ae02, 0x00000),
> +	A6XX_PROTECT_NORDWR(0x0ae50, 0x0012f),
> +	A6XX_PROTECT_NORDWR(0x0b604, 0x00000),
> +	A6XX_PROTECT_NORDWR(0x0b608, 0x00006),
> +	A6XX_PROTECT_NORDWR(0x0be02, 0x00001),
> +	A6XX_PROTECT_NORDWR(0x0be20, 0x0015f),
> +	A6XX_PROTECT_NORDWR(0x0d000, 0x005ff),
> +	A6XX_PROTECT_NORDWR(0x0f000, 0x00bff),
> +	A6XX_PROTECT_RDONLY(0x0fc00, 0x01fff),
> +	A6XX_PROTECT_NORDWR(0x11c00, 0x00000), /*note: infiite range */
> +};
> +
>  static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> @@ -758,6 +854,11 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>  		count = ARRAY_SIZE(a650_protect);
>  		count_max = 48;
>  		BUILD_BUG_ON(ARRAY_SIZE(a650_protect) > 48);
> +	} else if (adreno_is_a690(adreno_gpu)) {
> +		regs = a690_protect;
> +		count = ARRAY_SIZE(a690_protect);
> +		count_max = 48;
> +		BUILD_BUG_ON(ARRAY_SIZE(a690_protect) > 48);
>  	} else if (adreno_is_a660_family(adreno_gpu)) {
>  		regs = a660_protect;
>  		count = ARRAY_SIZE(a660_protect);
> @@ -806,6 +907,13 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  		uavflagprd_inv = 2;
>  	}
>  
> +	if (adreno_is_a690(adreno_gpu)) {
> +		lower_bit = 2;
> +		amsbc = 1;
> +		rgb565_predicator = 1;
> +		uavflagprd_inv = 2;
> +	}
> +
>  	if (adreno_is_7c3(adreno_gpu)) {
>  		lower_bit = 1;
>  		amsbc = 1;
> @@ -1084,7 +1192,7 @@ static int hw_init(struct msm_gpu *gpu)
>  	/* Setting the primFifo thresholds default values,
>  	 * and vccCacheSkipDis=1 bit (0x200) for A640 and newer
>  	*/
> -	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
> +	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu) || adreno_is_a690(adreno_gpu))
>  		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
>  	else if (adreno_is_a640_family(adreno_gpu) || adreno_is_7c3(adreno_gpu))
>  		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
> @@ -1991,7 +2099,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	info = adreno_info(config->rev);
>  
>  	if (info && (info->revn == 650 || info->revn == 660 ||
> -			adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))
> +		     info->revn == 690 ||
> +		     adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))
>  		adreno_gpu->base.hw_apriv = true;
>  
>  	a6xx_llc_slices_init(pdev, a6xx_gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index 2cc83e049613..25b235b49ebc 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -414,6 +414,37 @@ static void a650_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  	msg->cnoc_cmds_data[1][0] =  0x60000001;
>  }
>  
> +static void a690_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +{
> +	/*
> +	 * Send a single "off" entry just to get things running
> +	 * TODO: bus scaling
> +	 */
> +	msg->bw_level_num = 1;
> +
> +	msg->ddr_cmds_num = 3;
> +	msg->ddr_wait_bitmask = 0x01;
> +
> +	msg->ddr_cmds_addrs[0] = 0x50004;
> +	msg->ddr_cmds_addrs[1] = 0x50000;
> +	msg->ddr_cmds_addrs[2] = 0x500ac;
> +
> +	msg->ddr_cmds_data[0][0] =  0x40000000;
> +	msg->ddr_cmds_data[0][1] =  0x40000000;
> +	msg->ddr_cmds_data[0][2] =  0x40000000;
> +
> +	/*
> +	 * These are the CX (CNOC) votes - these are used by the GMU but the
> +	 * votes are known and fixed for the target
> +	 */
> +	msg->cnoc_cmds_num = 1;
> +	msg->cnoc_wait_bitmask = 0x01;
> +
> +	msg->cnoc_cmds_addrs[0] = 0x5003c;
> +	msg->cnoc_cmds_data[0][0] =  0x40000000;
> +	msg->cnoc_cmds_data[1][0] =  0x60000001;
> +}
> +
>  static void a660_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
>  	/*
> @@ -531,6 +562,8 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>  		adreno_7c3_build_bw_table(&msg);
>  	else if (adreno_is_a660(adreno_gpu))
>  		a660_build_bw_table(&msg);
> +	else if (adreno_is_a690(adreno_gpu))
> +		a690_build_bw_table(&msg);
>  	else
>  		a6xx_build_bw_table(&msg);
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 8cff86e9d35c..e5a865024e94 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -355,6 +355,20 @@ static const struct adreno_info gpulist[] = {
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a640_zap.mdt",
>  		.hwcg = a640_hwcg,
> +	}, {
> +		.rev = ADRENO_REV(6, 9, 0, ANY_ID),
> +		.revn = 690,
> +		.name = "A690",
> +		.fw = {
> +			[ADRENO_FW_SQE] = "a660_sqe.fw",
> +			[ADRENO_FW_GMU] = "a690_gmu.bin",
> +		},
> +		.gmem = SZ_4M,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.init = a6xx_gpu_init,
> +		.zapfw = "a690_zap.mdt",
> +		.hwcg = a690_hwcg,
> +		.address_space_size = SZ_16G,
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index f62612a5c70f..ac9c429ca07b 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -55,7 +55,7 @@ struct adreno_reglist {
>  	u32 value;
>  };
>  
> -extern const struct adreno_reglist a615_hwcg[], a630_hwcg[], a640_hwcg[], a650_hwcg[], a660_hwcg[];
> +extern const struct adreno_reglist a615_hwcg[], a630_hwcg[], a640_hwcg[], a650_hwcg[], a660_hwcg[], a690_hwcg[];
>  
>  struct adreno_info {
>  	struct adreno_rev rev;
> @@ -272,6 +272,11 @@ static inline int adreno_is_a660(struct adreno_gpu *gpu)
>  	return gpu->revn == 660;
>  }
>  
> +static inline int adreno_is_a690(struct adreno_gpu *gpu)
> +{
> +	return gpu->revn == 690;
> +};
> +
>  /* check for a615, a616, a618, a619 or any derivatives */
>  static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
>  {
> @@ -280,13 +285,13 @@ static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
>  
>  static inline int adreno_is_a660_family(struct adreno_gpu *gpu)
>  {
> -	return adreno_is_a660(gpu) || adreno_is_7c3(gpu);
> +	return adreno_is_a660(gpu) || adreno_is_a690(gpu) || adreno_is_7c3(gpu);
>  }
>  
>  /* check for a650, a660, or any derivatives */
>  static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
>  {
> -	return gpu->revn == 650 || gpu->revn == 620 || adreno_is_a660_family(gpu);
> +	return gpu->revn == 650 || gpu->revn == 620  || adreno_is_a660_family(gpu);
>  }
>  
>  u64 adreno_private_address_space_size(struct msm_gpu *gpu);
