Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69366668AF2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 05:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC36B10E988;
	Fri, 13 Jan 2023 04:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C121F10E987
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 04:39:18 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id bf43so31452469lfb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 20:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rwPWckFN6l5Z0VUc2rVprLclAK1KfD6OaLDUvXSlPdU=;
 b=Hus9WhNP0DRji76qhUZD9CGZBPjXVgznHEyqxtiuCZvdjakWb7/pqgsZ6ogIyK7Bas
 RsErYkEFYFFIuWWrKINuUrESd+Q8tdxJf1d5ez8gVaAHyvNDYrWKz+4+lrB5q7j9GYMu
 Uwww3O2Q2Jxw9UbU0ybbDPjjoR4tTUYQPAhVnw8tJw51QJ/E1OPPLBJMeb+t7w3pfPa6
 CSe8ErQK9BiqMatIMuosQmkfJIKPHD/sKx5P80j5/PeKsZBUeh03LzSzkftt0bLsryFG
 3JMlDzzlKx7V4TvIax8OnW7Xc/tnqfICLmsXlZjikwo2c5ElObaf/PtYaw1k6R4hGmqw
 pdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rwPWckFN6l5Z0VUc2rVprLclAK1KfD6OaLDUvXSlPdU=;
 b=NnJbYzLt7e5X1+g83aFJggNo3sps75EYsWTbKlCJtfcx9PgVFfU9U+I/eEqjvTXxym
 Z28CQ4vEx9mBmR5SCQGAxm39U9p9xSRfFbjOQmNWwA1A1aVS4kn0gTPPQBqobahH58qB
 1vQ2GM0imObgPzifLA6f2pF8BJ30nTSdWXcp0dM3yAtlLXodx8ZB9Y+fEb/IVOj0w95m
 sHAFYPsEbvABRtVbNHwyrJwdib5p0lpUOJ/HieAtt6Qk0zMPrLIbN99VaaHAnT1X0ej/
 X0XF9QIpD7l8Ynn6vaZ9IH3XmmGJzA0Tww+yj2gSkhf4PGmh1zi0tzafnItm/1KBcbfR
 YHpA==
X-Gm-Message-State: AFqh2koZQ1US0kJBy5A+p9k4t1b/pqqNComOVoiVgfmlFOwpxH/8hmTM
 JcAvOwCLn02DzSYfnTBMjvTzaw==
X-Google-Smtp-Source: AMrXdXuk1hI4hpqDsFfaxA0tg5vvn/WEymEIKE6fD6oI7k5DMiFrZUHrVB69K4e5s7uzDhfzb3cLVw==
X-Received: by 2002:a19:c20d:0:b0:4b5:7859:349f with SMTP id
 l13-20020a19c20d000000b004b57859349fmr18986772lfc.48.1673584757132; 
 Thu, 12 Jan 2023 20:39:17 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a056512358800b004cb2c720b97sm3639604lfr.260.2023.01.12.20.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 20:39:16 -0800 (PST)
Message-ID: <6c6bb40e-3601-f795-a170-43117b39b5a3@linaro.org>
Date: Fri, 13 Jan 2023 06:39:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] drm/msm/dpu: add hw revision 410
To: Richard Acayan <mailingradian@gmail.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Konrad Dybcio
 <konrad.dybcio@somainline.org>, Robert Foss <rfoss@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20230113035939.185064-1-mailingradian@gmail.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230113035939.185064-1-mailingradian@gmail.com>
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

On 13/01/2023 05:59, Richard Acayan wrote:
> The Snapdragon 670 uses similar clocks (with one frequency added) to the
> Snapdragon 845 but reports DPU revision 4.1.0. Add support for this DPU
> with configuration from the Pixel 3a downstream kernel.
> 
> Link: https://android.googlesource.com/kernel/msm/+/368478b0ae76566927a2769a2bf24dfe7f38bb78/arch/arm64/boot/dts/qcom/sdm670-sde.dtsi
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

This should come together with the qcom,sdm670-dpu and with the bindings 
update. Also unless there is a strong reason not to do this, add 
corresponding qcom,sdm670-mdss support to the driver and bindings.

Otherwise the patch look good to me, minor nit below.

> ---
> Changes since v1:
>   - proper use of DSC_BLK()
> 
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 67 +++++++++++++++++++
>   1 file changed, 67 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 0f3da480b066..56709d508a6f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -504,6 +504,25 @@ static const struct dpu_mdp_cfg msm8998_mdp[] = {
>   	},
>   };
>   
> +static const struct dpu_mdp_cfg sdm670_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x45C,
> +	.features = BIT(DPU_MDP_AUDIO_SELECT),
> +	.highest_bank_bit = 0x1,
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> +			.reg_off = 0x2AC, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> +			.reg_off = 0x2B4, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> +			.reg_off = 0x2AC, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +			.reg_off = 0x2B4, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +			.reg_off = 0x2BC, .bit_off = 8},

lowercase hex please

> +	},
> +};
> +
>   static const struct dpu_mdp_cfg sdm845_mdp[] = {
>   	{
>   	.name = "top_0", .id = MDP_TOP,

-- 
With best wishes
Dmitry

