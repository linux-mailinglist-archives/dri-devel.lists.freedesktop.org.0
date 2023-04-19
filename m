Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BF56E846D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 00:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DCF10EB32;
	Wed, 19 Apr 2023 22:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C82710EB34
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 22:15:07 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id bz21so588453ljb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 15:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681942505; x=1684534505;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ytCeCLRrAM5jc6M/DBn6k6KhfCt7gZVNX4R7z0khTGc=;
 b=OnRB/l3vwD/hi/TsQlTfTlBEMz9NLvwqfNSo1CP2j66Bj8pW7wLDYKHzoOQBGs55qN
 s9j/cT59DrxIjL9I5wsOYYPGSC1u3zmTVaq2KUnjo/lbADYVAd+g802TYcZo1j5IaBMP
 yS3SxHVHSDLWF6MjQmNWcXX58EOsLjareyulU/wybmMlz3/sTfv5PMnEDruajOfKowCK
 el6MMeWgUgUETby0ukQA6Awhae2Ouba6KcHUwVWpbOHAx1o1Dw+KA9HUVIYVPc5fp15c
 V1g+nSYgTufzn7oIdm5zDI09zsn+6SI/OdYR4Gw/7LkOnSoWzh/1BnRQFZBD4NhrhTHb
 p2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681942505; x=1684534505;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ytCeCLRrAM5jc6M/DBn6k6KhfCt7gZVNX4R7z0khTGc=;
 b=Q8LQAwyF2IUR4yr/KhAOBhmrEDQOON16VqY0KyLEO18OWt3TA0jXOJHx6ceBxEN7VN
 IKkZ7Y079TzL+SEvxnjB3nJ/D6ftKe56VhbpqZGVt1tXRdK7wdle9MoJ1HQwF2xlmAkp
 /J+U5Pis7UVsvyfWOggt3xGXmI1o71hX/QvTMhJ8AZYM77J8s5zzxYwXeU/TGE/FUHi/
 EVX1ZhxukywdwFR+3P5V/nNWVXaNNOoNL3t/Iw2IawpE9DakW7Ll7wCKOV24IrO5wA0b
 GejJt7eyLwvtNCPXPjrQhn+3Og7SXjRAwYfd83Jz8fUdi/cenRp85RvMuiLMJ6G9fS3b
 U80Q==
X-Gm-Message-State: AAQBX9c41zfeCe0CQR7547B3rSez1vdLbEiSXeEdYyefzrynXxUK64+q
 gNkLS/GiqesyY7dFKv+WBh3i9w==
X-Google-Smtp-Source: AKy350ZFutfn0RXVZ/ykfD/OVNTS1p2iLO9nhoF8y7NgvPMPbsszamU9msWN/8x7CYFEeoCAj2bInQ==
X-Received: by 2002:a2e:954b:0:b0:2a8:d242:4df with SMTP id
 t11-20020a2e954b000000b002a8d24204dfmr2518118ljh.35.1681942504921; 
 Wed, 19 Apr 2023 15:15:04 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a2e91d0000000b002934fe524d2sm3067789ljg.83.2023.04.19.15.15.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 15:15:04 -0700 (PDT)
Message-ID: <71fe636f-ba8b-643c-9b5f-02f712bc0674@linaro.org>
Date: Thu, 20 Apr 2023 01:15:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/11] drm/msm/dpu: tweak msm8998 hw catalog values
To: Arnaud Vrac <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-1-d1bac46db075@freebox.fr>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230419-dpu-tweaks-v1-1-d1bac46db075@freebox.fr>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/04/2023 17:41, Arnaud Vrac wrote:
> Match the values found in the downstream msm-4.4 kernel sde driver.
> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>

Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 15 +++++----------
>   2 files changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index 2b3ae84057dfe..b07e8a9941f79 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -134,10 +134,10 @@ static const struct dpu_dspp_cfg msm8998_dspp[] = {
>   };
>   
>   static const struct dpu_intf_cfg msm8998_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, 1, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_HDMI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 21, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 21, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, 1, 21, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_HDMI, 0, 21, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>   };
>   
>   static const struct dpu_perf_cfg msm8998_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 03f162af1a50b..8d5d782a43398 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -587,12 +587,12 @@ static const u32 sdm845_nrt_pri_lvl[] = {3, 3, 3, 3, 3, 3, 3, 3};
>   
>   static const struct dpu_vbif_dynamic_ot_cfg msm8998_ot_rdwr_cfg[] = {
>   	{
> -		.pps = 1088 * 1920 * 30,
> +		.pps = 1920 * 1080 * 30,
>   		.ot_limit = 2,
>   	},
>   	{
> -		.pps = 1088 * 1920 * 60,
> -		.ot_limit = 6,
> +		.pps = 1920 * 1080 * 60,
> +		.ot_limit = 4,
>   	},
>   	{
>   		.pps = 3840 * 2160 * 30,
> @@ -705,10 +705,7 @@ static const struct dpu_qos_lut_entry msm8998_qos_linear[] = {
>   	{.fl = 10, .lut = 0x1555b},
>   	{.fl = 11, .lut = 0x5555b},
>   	{.fl = 12, .lut = 0x15555b},
> -	{.fl = 13, .lut = 0x55555b},
> -	{.fl = 14, .lut = 0},
> -	{.fl = 1,  .lut = 0x1b},
> -	{.fl = 0,  .lut = 0}
> +	{.fl = 0,  .lut = 0x55555b}
>   };
>   
>   static const struct dpu_qos_lut_entry sdm845_qos_linear[] = {
> @@ -730,9 +727,7 @@ static const struct dpu_qos_lut_entry msm8998_qos_macrotile[] = {
>   	{.fl = 10, .lut = 0x1aaff},
>   	{.fl = 11, .lut = 0x5aaff},
>   	{.fl = 12, .lut = 0x15aaff},
> -	{.fl = 13, .lut = 0x55aaff},
> -	{.fl = 1,  .lut = 0x1aaff},
> -	{.fl = 0,  .lut = 0},
> +	{.fl = 0,  .lut = 0x55aaff},
>   };
>   
>   static const struct dpu_qos_lut_entry sc7180_qos_linear[] = {
> 

-- 
With best wishes
Dmitry

