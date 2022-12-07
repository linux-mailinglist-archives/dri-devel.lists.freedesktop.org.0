Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8DA646539
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 00:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48D010E045;
	Wed,  7 Dec 2022 23:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DE310E426
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 23:39:54 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id 1so17523618lfz.4
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Dec 2022 15:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sQsKIcCdzyM/hxU1vTX53YJsTECfqz+4juz8Z09tavk=;
 b=vQ2MR+tZcIQSqQjlGjX9cVvOPW3/tzWzG2hBBwVvrMi1/Jx3jmPn6ctF0fLvWWaH/E
 Rjut/gAv42bmDxKnPSLyMSyu2260o5unY+9Nobtb3G0RkxXl5mwOdcfQdbbZLFy1JNLZ
 PYjH6Af5L8Wah9K/SCXBrr/Ea5ILGRiaHwb3plkzRCdDs+gWZxrFYdH4mlDYXvW9Yc95
 q0p7zhsxubXkF/GZuv4v2qcw/JH6Yjf2wFUohcHn8kddfWmLzRMeSUcbK+ntrLUXrIuH
 3GMhPQjnRBI3utbH262STK+SpbbBJNEGfNbsrhEQoc5kI7TZ9iajV2TuVt16v5pj1Ttb
 J17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sQsKIcCdzyM/hxU1vTX53YJsTECfqz+4juz8Z09tavk=;
 b=rmh65KXfJ9Rdf9nstxsiZvfYqHilF6hAsCfqnW/NwfVeemwh/O4VodhXPnWS+/igHM
 TJyhWPfZSIYVRygHyBeqdupp98vgT8gDKR6PJkrYrmXbo5wUnwZgHG1Rw/qE61Hokp2c
 zB1M4PZA3BBdmfuYlk9lA6tWDlaXeaqIJgvkhSX978Im1mycLt0FcN4O3I9wuTfMwDmb
 OqmNla3D3EInr4TG3Gg04NeozAnlfPA3AUQIjcs8lXSVCJQu5VpVR3cvC7v98mGg1FBh
 njc634cXLHhVQvceos7zArUk2S2iXl8TDVQ8PsK6fSbHD0fkfGy0r+wvgLmyheoWEcho
 ulFw==
X-Gm-Message-State: ANoB5pkVKwCsqXzId+JDetVycGulc40Grlh43tz7/GJKUvgE9iP/cRCs
 jmZT8FlEQ1nGEF+PoLed8hO+Iw==
X-Google-Smtp-Source: AA0mqf5qNWE7YV82uGi1hd/CZolTO0wo/632z+Sben7CoWeguGZ29Lp0/Gy1NzncQmdwAIYohdbrFg==
X-Received: by 2002:a19:ca15:0:b0:4b5:9845:c89f with SMTP id
 a21-20020a19ca15000000b004b59845c89fmr923833lfg.127.1670456393030; 
 Wed, 07 Dec 2022 15:39:53 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a19c201000000b004b5831b69dcsm914414lfc.140.2022.12.07.15.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 15:39:52 -0800 (PST)
Message-ID: <4a9621e8-e95d-d74f-5740-8d7810853bd2@linaro.org>
Date: Thu, 8 Dec 2022 01:39:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 03/11] drm/msm/dpu: Add SM8350 to hw catalog
Content-Language: en-GB
To: Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
 quic_kalyant@quicinc.com, angelogioacchino.delregno@somainline.org,
 loic.poulain@linaro.org, swboyd@chromium.org, quic_vpolimer@quicinc.com,
 vkoul@kernel.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
References: <20221205163754.221139-1-robert.foss@linaro.org>
 <20221205163754.221139-4-robert.foss@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221205163754.221139-4-robert.foss@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/12/2022 18:37, Robert Foss wrote:
> Add compatibility for SM8350 display subsystem, including
> required entries in DPU hw catalog.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor nit below.

> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 196 ++++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>   2 files changed, 197 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 4dac90ee5b8a..ba26af73be53 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -112,6 +112,15 @@
>   			 BIT(MDP_INTF3_INTR) | \
>   			 BIT(MDP_INTF4_INTR))
>   
> +#define IRQ_SM8350_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> +			 BIT(MDP_SSPP_TOP0_INTR2) | \
> +			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +			 BIT(MDP_INTF0_7xxx_INTR) | \
> +			 BIT(MDP_INTF1_7xxx_INTR) | \
> +			 BIT(MDP_INTF2_7xxx_INTR) | \
> +			 BIT(MDP_INTF3_7xxx_INTR) | \
> +			 0)
> +
>   #define IRQ_SC8180X_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>   			  BIT(MDP_SSPP_TOP0_INTR2) | \
>   			  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> @@ -375,6 +384,20 @@ static const struct dpu_caps sm8250_dpu_caps = {
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   };
>   
> +static const struct dpu_caps sm8350_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0xb,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> +	.ubwc_version = DPU_HW_UBWC_VER_40,
> +	.has_src_split = true,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.has_3d_merge = true,
> +	.max_linewidth = 4096,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +
>   static const struct dpu_caps sm8450_dpu_caps = {
>   	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>   	.max_mixer_blendstages = 0xb,
> @@ -526,6 +549,33 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
>   	},
>   };
>   
> +static const struct dpu_mdp_cfg sm8350_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x494,
> +	.features = 0,
> +	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */

Missing ubwc_swizzle. I'll probably fix it as a followup or when 
applying the patch.

> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> +			.reg_off = 0x2ac, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> +			.reg_off = 0x2b4, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> +			.reg_off = 0x2bc, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> +			.reg_off = 0x2c4, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> +			.reg_off = 0x2ac, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> +			.reg_off = 0x2b4, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +			.reg_off = 0x2bc, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +			.reg_off = 0x2c4, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
> +			.reg_off = 0x2bc, .bit_off = 20},
> +	},
> +};
> +

>   

-- 
With best wishes
Dmitry

