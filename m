Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2725369B487
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 22:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23AB10E487;
	Fri, 17 Feb 2023 21:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6053910E191
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 21:19:25 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id be32so3079439lfb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZL7ZNu7FEbMtJ9RGZ9bejhOyVbqzh9GzBXsKBEiWiD4=;
 b=lZJpnKzdGoYsLixqpCAo5pPdd8LSvscCan0kGfBywFsPZMSoqCZx182Yzyov52OuoG
 5RDnh7hJctvYW35O0YW+g5O+CJ3bLSFQZKVu3TGeJTcMPQU0IlGYktqoNx7hD+PCpBxf
 AKzInRs8oz+vPdsuxE2u7/3L8T0Qe9CiQiErJ9ko6eUg+G+uYp/oMf1HH0obmfXVqOuM
 U8PBi7g+8p0DhkxVTwOcWEYlurQK328vNC/tbpfpr2LJHIzlY4SBctLcDjWIGiaAQq+3
 KHWjYe/Uuvs76VfcUb65oqjwsGv+3OOiIncuUC970tFeotD/O7upAOQOJh3yBsWR99MF
 xZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZL7ZNu7FEbMtJ9RGZ9bejhOyVbqzh9GzBXsKBEiWiD4=;
 b=dWCTFWrFJ5wdSY5376jp78ML4cfdcMCvVODx/mLhSOR5lqpD5FFBqlGvUkFCI/njdg
 BorOZqk8eJUj176hYXHFucNBgY8OPd9rGP7GqWq/yK6aKK46dbwPbkuborIhzTu5AWcl
 dLUYC+XtKUnTWWjJXigUNGdrlWHIOtMqWwuFLoNDtEFOgc98wzke6FwGPvUb65Kj9KMy
 HtKbSocWSUod/IatRODz7KP9P7AvsSbaopeyt5HOGKvvcqxIIxsPrGLCBFeEM0rBMHLu
 YS//NZRujc2WTLBDFcFHUce8LtchdUNf8AuKzLKd9fAtvAX3GNJKeXfeMl4w8B4Q1D8V
 Mq0Q==
X-Gm-Message-State: AO0yUKXyyRqo72+sCSmIVKwc6Lwzv1QVtCVnvQoy4CY8Jvb3ytSzNOfz
 vXjWFVVZqrXRZcwd+cn55M+hqQ==
X-Google-Smtp-Source: AK7set9JsozXnyoVy2cayMqoBjxBs5Py49+ZzdKi+/cg3WN4lLwQmEs7T8Q0GVF7TRRJ8H3gS79YWA==
X-Received: by 2002:ac2:5e8f:0:b0:4b5:7d49:4a05 with SMTP id
 b15-20020ac25e8f000000b004b57d494a05mr822117lfq.0.1676668763601; 
 Fri, 17 Feb 2023 13:19:23 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f16-20020ac251b0000000b004aac23e0dd6sm779288lfk.29.2023.02.17.13.19.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 13:19:23 -0800 (PST)
Message-ID: <8268b4c9-ca5e-4ff3-628c-7e9daaeb16b0@linaro.org>
Date: Fri, 17 Feb 2023 23:19:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 07/14] drm/msm/a6xx: Add support for A619_holi
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-8-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230214173145.2482651-8-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Nathan Chancellor <nathan@kernel.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/02/2023 19:31, Konrad Dybcio wrote:
> A619_holi is a GMU-less variant of the already-supported A619 GPU.
> It's present on at least SM4350 (holi) and SM6375 (blair). No mesa
> changes are required. Add the required kernel-side support for it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 37 +++++++++++++++++-----
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 13 ++++++++
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++
>   3 files changed, 47 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 75cf94b03c29..c168712a0dc4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -614,14 +614,14 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>   		return;
>   
>   	/* Disable SP clock before programming HWCG registers */
> -	if (!adreno_has_gmu_wrapper(adreno_gpu))
> +	if ((!adreno_has_gmu_wrapper(adreno_gpu) || adreno_is_a619_holi(adreno_gpu)))

Extra parenthesis made me interpret this incorrectly. Maybe you can 
remove them and spit the condition onto two lines? Because my first 
interpretation was:
if (!(has_gmu_wrapper || a619_holi)).


>   		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
>   
>   	for (i = 0; (reg = &adreno_gpu->info->hwcg[i], reg->offset); i++)
>   		gpu_write(gpu, reg->offset, state ? reg->value : 0);
>   
>   	/* Enable SP clock */
> -	if (!adreno_has_gmu_wrapper(adreno_gpu))
> +	if ((!adreno_has_gmu_wrapper(adreno_gpu) || adreno_is_a619_holi(adreno_gpu)))
>   		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
>   
>   	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? clock_cntl_on : 0);
> @@ -1007,7 +1007,12 @@ static int hw_init(struct msm_gpu *gpu)
>   	}
>   
>   	/* Clear GBIF halt in case GX domain was not collapsed */
> -	if (a6xx_has_gbif(adreno_gpu)) {
> +	if (adreno_is_a619_holi(adreno_gpu)) {
> +		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
> +		gpu_write(gpu, 0x18, 0);
> +		/* Let's make extra sure that the GPU can access the memory.. */
> +		mb();
> +	} else if (a6xx_has_gbif(adreno_gpu)) {
>   		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
>   		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
>   		/* Let's make extra sure that the GPU can access the memory.. */
> @@ -1016,6 +1021,9 @@ static int hw_init(struct msm_gpu *gpu)
>   
>   	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
>   
> +	if (adreno_is_a619_holi(adreno_gpu))
> +		a6xx_sptprac_enable(gmu);
> +
>   	/*
>   	 * Disable the trusted memory range - we don't actually supported secure
>   	 * memory rendering at this point in time and we don't want to block off
> @@ -1293,7 +1301,8 @@ static void a6xx_dump(struct msm_gpu *gpu)
>   #define GBIF_CLIENT_HALT_MASK	BIT(0)
>   #define GBIF_ARB_HALT_MASK	BIT(1)
>   #define VBIF_RESET_ACK_TIMEOUT	100
> -#define VBIF_RESET_ACK_MASK	0x00f0
> +#define VBIF_RESET_ACK_MASK	0xF0
> +#define GPR0_GBIF_HALT_REQUEST	0x1E0
>   
>   static void a6xx_recover(struct msm_gpu *gpu)
>   {
> @@ -1350,10 +1359,16 @@ static void a6xx_recover(struct msm_gpu *gpu)
>   
>   	/* Software-reset the GPU */
>   	if (adreno_has_gmu_wrapper(adreno_gpu)) {
> -		/* Halt the GX side of GBIF */
> -		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, GBIF_GX_HALT_MASK);
> -		spin_until(gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT_ACK) &
> -			   GBIF_GX_HALT_MASK);
> +		if (adreno_is_a619_holi(adreno_gpu)) {
> +			gpu_write(gpu, 0x18, GPR0_GBIF_HALT_REQUEST);
> +			spin_until((gpu_read(gpu, REG_A6XX_RBBM_VBIF_GX_RESET_STATUS) &
> +				   (VBIF_RESET_ACK_MASK)) == VBIF_RESET_ACK_MASK);
> +		} else {
> +			/* Halt the GX side of GBIF */
> +			gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, GBIF_GX_HALT_MASK);
> +			spin_until(gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT_ACK) &
> +				   GBIF_GX_HALT_MASK);
> +		}
>   
>   		/* Halt new client requests on GBIF */
>   		gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
> @@ -1763,6 +1778,9 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
>   		if (ret)
>   			return ret;
>   
> +		if (adreno_is_a619_holi(adreno_gpu))
> +			a6xx_sptprac_enable(gmu);
> +
>   		mutex_unlock(&a6xx_gpu->gmu.lock);
>   
>   		msm_devfreq_resume(gpu);
> @@ -1795,6 +1813,9 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
>   
>   		mutex_lock(&a6xx_gpu->gmu.lock);
>   
> +		if (adreno_is_a619_holi(adreno_gpu))
> +			a6xx_sptprac_disable(gmu);
> +
>   		ret = clk_prepare_enable(gpu->ebi1_clk);
>   		if (ret)
>   			return ret;
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 82757f005a1a..71faeb3fd466 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -264,6 +264,19 @@ static const struct adreno_info gpulist[] = {
>   		.gmem = SZ_512K,
>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>   		.init = a6xx_gpu_init,
> +	}, {
> +		.rev = ADRENO_REV(6, 1, 9, 1),

I think this deserves a comment that GMU-enabled sm6350 has patch_id 0 
(if I interpreted the vendor dtsi correctly).

Another option might be to actually check for the qcom,gmu presense and 
add that to the selection conditional.

> +		.revn = 619,
> +		.name = "A619_holi",
> +		.fw = {
> +			[ADRENO_FW_SQE] = "a630_sqe.fw",
> +		},
> +		.gmem = SZ_512K,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_GMU_WRAPPER,
> +		.init = a6xx_gpu_init,
> +		.zapfw = "a615_zap.mdt",
> +		.hwcg = a615_hwcg,
>   	}, {
>   		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
>   		.revn = 619,
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 7c5e0a90b5fb..16241368c2e4 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -252,6 +252,11 @@ static inline int adreno_is_a619(struct adreno_gpu *gpu)
>   	return gpu->revn == 619;
>   }
>   
> +static inline int adreno_is_a619_holi(struct adreno_gpu *gpu)
> +{
> +	return adreno_is_a619(gpu) && adreno_has_gmu_wrapper(gpu);
> +}
> +
>   static inline int adreno_is_a630(struct adreno_gpu *gpu)
>   {
>   	return gpu->revn == 630;

-- 
With best wishes
Dmitry

