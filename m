Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB95051E195
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 00:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BE710E292;
	Fri,  6 May 2022 22:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33F710E292
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 22:20:36 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id u23so9089265lfc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 15:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XyGXaAb/M02rlPwHuF/k2F7fqFtO6DD6Qbbge552y8g=;
 b=SPz3AtCZ7zacpN/7qSGY1ZTWBLncuyWbQF1YDKlPbHMhJUh4ovMZmqQ08pQH3ZvTXd
 IosacZsIGp644oGt0vYajM0h2d5DSNugnaWlpKlqgBjv7ZDhyeRbIbnARZFCGauRQ6qi
 4V/XC+2Z7xdWSpg4P9AHKbGURvz6/Rqu5EmhmlZB/4+RgsUiRvqUqUmtZQhVvPnMzmbi
 9k5deXJfkmfX3JfKpx1SEgbyZMkiWxkJP4kf0nK+uau5RkHHCnUos+AOcJPLhpa2dhBf
 pjkwSdHGGx3uh82iUDHaz+QFiJQXPl0koT13gyEJt9wZHgG65Ts4C2Lx6pshMOyavasu
 Hatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XyGXaAb/M02rlPwHuF/k2F7fqFtO6DD6Qbbge552y8g=;
 b=61zjobfRlbMQ4A3QuEjenSmZQZJ+7dDtpsODrW4seQWw8bkye9boWG44IAEO2WBLhg
 RPy0fXbJN7CFB6ZxTTq3BMhABF4Be3gX2+JoHs714jrhu4TIIWfKytgebeIcnMdbvz5A
 5eLmNVrwovePmGQuU+GuFrSfqDEf4pDdw18Mkw51hwgKjvZ8THgkdk7W8/PAYpvdVzYy
 ZnHmVOto94re4jY77xN494SdXJljYCNhDdvd1DdMJJFWBG/lVnbfsGKFw7PCENmKUsYZ
 /0SNs/0d/ntRT2BtWaWRTq8JTXY9stpNzVkjvfPyuGu30ZRWBSQRe6OQ/06qwDXqHrdB
 z+iQ==
X-Gm-Message-State: AOAM532MONwxEvjXS9ynshQ7CmSVgV3408o2LlRQazZd4zfTDTzU2gz2
 vKPTWnWxbOSRuv3LWJ7kzyKDTQ==
X-Google-Smtp-Source: ABdhPJwuKUbU3X3Z2D8y+Jdg7T3J4Ulwha/6oAatFA8qgVLy+uLFv68AI4W+SRdTFJPxSeh8vs6sxQ==
X-Received: by 2002:a05:6512:398d:b0:473:a597:540a with SMTP id
 j13-20020a056512398d00b00473a597540amr4059244lfu.64.1651875635119; 
 Fri, 06 May 2022 15:20:35 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a2e824d000000b0024f3d1dae98sm781421ljh.32.2022.05.06.15.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 15:20:34 -0700 (PDT)
Message-ID: <2c4cbe4a-1dbf-cfa6-7e2c-0131b886b388@linaro.org>
Date: Sat, 7 May 2022 01:20:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/3] drm/msm/adreno: Add A619 support
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20220414184442.375113-1-konrad.dybcio@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220414184442.375113-1-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 Jonathan Marek <jonathan@marek.ca>, Yangtao Li <tiny.windzz@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, jamipkettunen@somainline.org,
 martin.botka@somainline.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, linux-kernel@vger.kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/04/2022 21:44, Konrad Dybcio wrote:
> Add support for the Adreno 619 GPU, as found in Snapdragon 690 (SM6350),
> 480 (SM4350) and 750G (SM7225).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes in v2:
> - Don't reserve icache/dcache regions on legacy GMUs, as that
> is apparently not necessary and simply a downstream leftover.
> 
> 
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 11 ++--
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 70 +++++++++++++++++++++-
>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c      | 66 +++++++++++++++++++-
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 14 +++++
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 13 +++-
>   5 files changed, 166 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 3e325e2a2b1b..e8d4cca6cd46 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -527,6 +527,8 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>   		pdc_in_aop = true;
>   	else if (adreno_is_a618(adreno_gpu) || adreno_is_a640_family(adreno_gpu))
>   		pdc_address_offset = 0x30090;
> +	else if (adreno_is_a619(adreno_gpu))
> +		pdc_address_offset = 0x300a0;
>   	else
>   		pdc_address_offset = 0x30080;
>   
> @@ -601,7 +603,8 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>   
>   	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_MSGID + 4, 0x10108);
>   	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR + 4, 0x30000);
> -	if (adreno_is_a618(adreno_gpu) || adreno_is_a650_family(adreno_gpu))
> +	if (adreno_is_a618(adreno_gpu) || adreno_is_a619(adreno_gpu) ||
> +			adreno_is_a650_family(adreno_gpu))
>   		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA + 4, 0x2);
>   	else
>   		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA + 4, 0x3);
> @@ -1537,7 +1540,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>   			SZ_16M - SZ_16K, 0x04000, "icache");
>   		if (ret)
>   			goto err_memory;
> -	} else if (adreno_is_a640_family(adreno_gpu)) {
> +	} else {
>   		ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
>   			SZ_256K - SZ_16K, 0x04000, "icache");
>   		if (ret)
> @@ -1547,9 +1550,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>   			SZ_256K - SZ_16K, 0x44000, "dcache");
>   		if (ret)
>   			goto err_memory;
> -	} else {
> -		BUG_ON(adreno_is_a660_family(adreno_gpu));
> +	}

Is this chunk expected or not? I don't think you had intention to drop 
the BUG_ON.

>   
> +	if (adreno_is_a630(adreno_gpu) || adreno_is_a615_family(adreno_gpu)) {
>   		/* HFI v1, has sptprac */
>   		gmu->legacy = true;
>   
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 83c31b2ad865..ddeb04a77662 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -252,6 +252,74 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>   	a6xx_flush(gpu, ring);
>   }
>   
> +/* For a615 family (a615, a616, a618 and a619) */
> +const struct adreno_reglist a615_hwcg[] = {
> +	{REG_A6XX_RBBM_CLOCK_CNTL_SP0,  0x02222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
> +	{REG_A6XX_RBBM_CLOCK_HYST_SP0,  0x0000F3CF},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_TP0,  0x02222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_TP1,  0x02222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_TP1, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL3_TP1, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL4_TP1, 0x00022222},
> +	{REG_A6XX_RBBM_CLOCK_HYST_TP0,  0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST_TP1,  0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST2_TP1, 0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST3_TP1, 0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777},
> +	{REG_A6XX_RBBM_CLOCK_HYST4_TP1, 0x00077777},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_TP1, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY2_TP1, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY3_TP1, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY4_TP1, 0x00011111},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_UCHE,  0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_UCHE, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL3_UCHE, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL4_UCHE, 0x00222222},
> +	{REG_A6XX_RBBM_CLOCK_HYST_UCHE,  0x00000004},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x00002222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002020},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_CCU1, 0x00002220},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_CCU2, 0x00002220},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_CCU3, 0x00002220},
> +	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040F00},
> +	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU1, 0x00040F00},
> +	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU2, 0x00040F00},
> +	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU3, 0x00040F00},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x05022022},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
> +	{REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
> +	{REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x00222222},
> +	{REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
> +	{REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
> +	{REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002},
> +	{REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
> +	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
> +	{},
> +};
> +
>   const struct adreno_reglist a630_hwcg[] = {
>   	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
>   	{REG_A6XX_RBBM_CLOCK_CNTL_SP1, 0x22222222},
> @@ -555,7 +623,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>   	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? clock_cntl_on : 0);
>   }
>   
> -/* For a615, a616, a618, A619, a630, a640 and a680 */
> +/* For a615, a616, a618, a619, a630, a640 and a680 */
>   static const u32 a6xx_protect[] = {
>   	A6XX_PROTECT_RDONLY(0x00000, 0x04ff),
>   	A6XX_PROTECT_RDONLY(0x00501, 0x0005),
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index d73fce5fdf1f..db88fa6122d2 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -205,8 +205,8 @@ static int a6xx_hfi_get_fw_version(struct a6xx_gmu *gmu, u32 *version)
>   {
>   	struct a6xx_hfi_msg_fw_version msg = { 0 };
>   
> -	/* Currently supporting version 1.1 */
> -	msg.supported_version = (1 << 28) | (1 << 16);
> +	/* Currently supporting version 1.10 */
> +	msg.supported_version = (1 << 28) | (1 << 19) | (1 << 17);
>   
>   	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_FW_VERSION, &msg, sizeof(msg),
>   		version, sizeof(*version));
> @@ -285,6 +285,66 @@ static void a618_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>   	msg->cnoc_cmds_data[1][0] =  0x60000001;
>   }
>   
> +static void a619_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +{
> +	msg->bw_level_num = 13;
> +
> +	msg->ddr_cmds_num = 1;
> +	msg->ddr_wait_bitmask = 0x0;
> +
> +	msg->ddr_cmds_addrs[0] = 0x50000;
> +	msg->ddr_cmds_addrs[1] = 0x50004;
> +	msg->ddr_cmds_addrs[2] = 0x50080;
> +
> +	msg->ddr_cmds_data[0][0]  = 0x40000000;
> +	msg->ddr_cmds_data[0][1]  = 0x40000000;
> +	msg->ddr_cmds_data[0][2]  = 0x40000000;
> +	msg->ddr_cmds_data[1][0]  = 0x6000030c;
> +	msg->ddr_cmds_data[1][1]  = 0x600000db;
> +	msg->ddr_cmds_data[1][2]  = 0x60000008;
> +	msg->ddr_cmds_data[2][0]  = 0x60000618;
> +	msg->ddr_cmds_data[2][1]  = 0x600001b6;
> +	msg->ddr_cmds_data[2][2]  = 0x60000008;
> +	msg->ddr_cmds_data[3][0]  = 0x60000925;
> +	msg->ddr_cmds_data[3][1]  = 0x60000291;
> +	msg->ddr_cmds_data[3][2]  = 0x60000008;
> +	msg->ddr_cmds_data[4][0]  = 0x60000dc1;
> +	msg->ddr_cmds_data[4][1]  = 0x600003dc;
> +	msg->ddr_cmds_data[4][2]  = 0x60000008;
> +	msg->ddr_cmds_data[5][0]  = 0x600010ad;
> +	msg->ddr_cmds_data[5][1]  = 0x600004ae;
> +	msg->ddr_cmds_data[5][2]  = 0x60000008;
> +	msg->ddr_cmds_data[6][0]  = 0x600014c3;
> +	msg->ddr_cmds_data[6][1]  = 0x600005d4;
> +	msg->ddr_cmds_data[6][2]  = 0x60000008;
> +	msg->ddr_cmds_data[7][0]  = 0x6000176a;
> +	msg->ddr_cmds_data[7][1]  = 0x60000693;
> +	msg->ddr_cmds_data[7][2]  = 0x60000008;
> +	msg->ddr_cmds_data[8][0]  = 0x60001f01;
> +	msg->ddr_cmds_data[8][1]  = 0x600008b5;
> +	msg->ddr_cmds_data[8][2]  = 0x60000008;
> +	msg->ddr_cmds_data[9][0]  = 0x60002940;
> +	msg->ddr_cmds_data[9][1]  = 0x60000b95;
> +	msg->ddr_cmds_data[9][2]  = 0x60000008;
> +	msg->ddr_cmds_data[10][0] = 0x60002f68;
> +	msg->ddr_cmds_data[10][1] = 0x60000d50;
> +	msg->ddr_cmds_data[10][2] = 0x60000008;
> +	msg->ddr_cmds_data[11][0] = 0x60003700;
> +	msg->ddr_cmds_data[11][1] = 0x60000f71;
> +	msg->ddr_cmds_data[11][2] = 0x60000008;
> +	msg->ddr_cmds_data[12][0] = 0x60003fce;
> +	msg->ddr_cmds_data[12][1] = 0x600011ea;
> +	msg->ddr_cmds_data[12][2] = 0x60000008;

I think we typically provide just a single cmd entry. You also have 
ddr_cmds_num = 1, so the rest of the entries are unused and can be removed.

> +
> +	msg->cnoc_cmds_num = 3;
> +	msg->cnoc_wait_bitmask = 0x0;
> +
> +	msg->cnoc_cmds_addrs[0] = 0x50054;
> +
> +	msg->cnoc_cmds_data[0][0] =  0x40000000;
> +	msg->cnoc_cmds_data[1][0] =  0x60000001;
> +}
> +
>   static void a640_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>   {
>   	/*
> @@ -462,6 +522,8 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>   
>   	if (adreno_is_a618(adreno_gpu))
>   		a618_build_bw_table(&msg);
> +	else if (adreno_is_a619(adreno_gpu))
> +		a619_build_bw_table(&msg);
>   	else if (adreno_is_a640_family(adreno_gpu))
>   		a640_build_bw_table(&msg);
>   	else if (adreno_is_a650(adreno_gpu))
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 89cfd84760d7..83a0625adb91 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -264,6 +264,19 @@ static const struct adreno_info gpulist[] = {
>   		.gmem = SZ_512K,
>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>   		.init = a6xx_gpu_init,
> +	}, {
> +		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
> +		.revn = 619,
> +		.name = "A619",
> +		.fw = {
> +			[ADRENO_FW_SQE] = "a630_sqe.fw",
> +			[ADRENO_FW_GMU] = "a619_gmu.bin",
> +		},
> +		.gmem = SZ_512K,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.init = a6xx_gpu_init,
> +		.zapfw = "a615_zap.mdt",
> +		.hwcg = a615_hwcg,
>   	}, {
>   		.rev = ADRENO_REV(6, 3, 0, ANY_ID),
>   		.revn = 630,
> @@ -355,6 +368,7 @@ MODULE_FIRMWARE("qcom/a530_zap.mdt");
>   MODULE_FIRMWARE("qcom/a530_zap.b00");
>   MODULE_FIRMWARE("qcom/a530_zap.b01");
>   MODULE_FIRMWARE("qcom/a530_zap.b02");
> +MODULE_FIRMWARE("qcom/a619_gmu.bin");
>   MODULE_FIRMWARE("qcom/a630_sqe.fw");
>   MODULE_FIRMWARE("qcom/a630_gmu.bin");
>   MODULE_FIRMWARE("qcom/a630_zap.mbn");
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 0490c5fbb780..a13a3e5a294b 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -57,7 +57,7 @@ struct adreno_reglist {
>   	u32 value;
>   };
>   
> -extern const struct adreno_reglist a630_hwcg[], a640_hwcg[], a650_hwcg[], a660_hwcg[];
> +extern const struct adreno_reglist a615_hwcg[], a630_hwcg[], a640_hwcg[], a650_hwcg[], a660_hwcg[];
>   
>   struct adreno_info {
>   	struct adreno_rev rev;
> @@ -242,6 +242,11 @@ static inline int adreno_is_a618(struct adreno_gpu *gpu)
>          return gpu->revn == 618;
>   }
>   
> +static inline int adreno_is_a619(struct adreno_gpu *gpu)
> +{
> +	return gpu->revn == 619;
> +}
> +
>   static inline int adreno_is_a630(struct adreno_gpu *gpu)
>   {
>          return gpu->revn == 630;
> @@ -268,6 +273,12 @@ static inline int adreno_is_a660(struct adreno_gpu *gpu)
>          return gpu->revn == 660;
>   }
>   
> +/* check for a615, a616, a618, a619 or any derivatives */
> +static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
> +{
> +	return gpu->revn == 615 || gpu->revn == 616 || gpu->revn == 618 || gpu->revn == 619;
> +}
> +
>   static inline int adreno_is_a660_family(struct adreno_gpu *gpu)
>   {
>          return adreno_is_a660(gpu) || adreno_is_7c3(gpu);


-- 
With best wishes
Dmitry
