Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAAB76CFC1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 16:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B125A10E1EE;
	Wed,  2 Aug 2023 14:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA73410E1EA
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 14:11:31 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3177163aa97so6967411f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 07:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690985490; x=1691590290;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=SVUD/O22MK9ex6QgiZ3+WUntWWQ3J8kc4lQNBHLBbPU=;
 b=O0pl3CfNG+2nlyUt5+zfo6hxkUIwCmA0VTxeAoAucHTP2J3GXCg1P/ihndRx2gZ1I4
 0t1+kPq9wQCvjz8ovRbBlbKlQwVL6EZg7iHAAyFUZ3WHclipajFdd87iZ8Vjjz/ygVRQ
 rWHMIgDWEKEZc+nK0spkAOFVW8mN7o3dPyajSNEcGbZcve+qEJNuTbJ2TddbaiHi2J/C
 EpxmIZKdd6hrUpaH5JR5F3pfc6P+vE3OA7K39Ynn52i6RoSMpdc0BHai/1MAkXTt/Lco
 hcj1WzLZnaiL5wxytbt69pPeY3LyclHGlIdXaKnPhDJ4q8JLhVQIqEJGRpWj1iuf64c5
 QmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690985490; x=1691590290;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SVUD/O22MK9ex6QgiZ3+WUntWWQ3J8kc4lQNBHLBbPU=;
 b=AhPAhmfuwUqQuT8DpO3agQIXWa8tTBhxVbaWVUQshHcpc9ddjMnUF8qGhjidbqj49+
 Gww8/ze9YgoyYYBNepD546WAe3QEWA+S+bHUwqTh3OqqHQo1N/EtTSiZfdTYhh+YskvP
 MP2KPBjnoYOIYnti6G9aLmdN74Xgd4d3BONhtYwAWn54uaa374kEMBTNIwSXSm6HMedY
 rPADHuAHkKOh4yPDwlCJEeiL0PHB4mnvzh2L2KcK/zOXCcVDllnS184WoKHxUe+8/gTc
 g0hydDXLN36EZQql0AZW/zWHRsmz7yVOjYKfeyKZBLC0RPpW7O/9nTEZ9cqpGgNYqwbr
 vG0w==
X-Gm-Message-State: ABy/qLZf7FZtle2KQlwLAaE+5kyx9ZUBxWmuR5P+XgrgjfXoS68KyLrs
 iT+UfLLLeM51d/DbEpSRKUTONA==
X-Google-Smtp-Source: APBJJlG571gwXZIj6TT36oNDTSONPYSRs5LsCoWFMRx/QXy3Xwaf3xs7Q41gEg0SoGxykIUAzWqDbw==
X-Received: by 2002:a5d:6a8e:0:b0:314:468d:ccab with SMTP id
 s14-20020a5d6a8e000000b00314468dccabmr4601407wru.45.1690985490210; 
 Wed, 02 Aug 2023 07:11:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196?
 ([2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a7bc847000000b003fe22da3bc5sm1772761wml.42.2023.08.02.07.11.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 07:11:29 -0700 (PDT)
Message-ID: <079ece4b-3f36-2ff9-36ff-23fcc4c2c8e1@linaro.org>
Date: Wed, 2 Aug 2023 16:11:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: increase memtype count to 16 for sm8550
Content-Language: en-US
To: Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org
References: <20230802134900.30435-1-jonathan@marek.ca>
Organization: Linaro Developer Services
In-Reply-To: <20230802134900.30435-1-jonathan@marek.ca>
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
Reply-To: neil.armstrong@linaro.org
Cc: Robert Foss <rfoss@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/08/2023 15:48, Jonathan Marek wrote:
> sm8550 has 16 vbif clients.
> 
> This fixes the extra 2 clients (DMA4/DMA5) not having their memtype
> initialized. This fixes DMA4/DMA5 planes not displaying correctly.
> 
> Fixes: efcd0107 ("drm/msm/dpu: add support for SM8550")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  4 ++--
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 20 +++++++++++++++++++
>   2 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index f17b9a7fee85..89a2ac1e840d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -245,8 +245,8 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
>   	.merge_3d = sm8550_merge_3d,
>   	.intf_count = ARRAY_SIZE(sm8550_intf),
>   	.intf = sm8550_intf,
> -	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> -	.vbif = sdm845_vbif,
> +	.vbif_count = ARRAY_SIZE(sm8550_vbif),
> +	.vbif = sm8550_vbif,
>   	.perf = &sm8550_perf_data,
>   	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
>   		     BIT(MDP_SSPP_TOP0_INTR2) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 0de507d4d7b7..8b17a4a9b438 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -663,6 +663,26 @@ static const struct dpu_vbif_cfg sdm845_vbif[] = {
>   	},
>   };
>   
> +static const struct dpu_vbif_cfg sm8550_vbif[] = {
> +	{
> +	.name = "vbif_rt", .id = VBIF_RT,
> +	.base = 0, .len = 0x1040,
> +	.features = BIT(DPU_VBIF_QOS_REMAP),
> +	.xin_halt_timeout = 0x4000,
> +	.qos_rp_remap_size = 0x40,
> +	.qos_rt_tbl = {
> +		.npriority_lvl = ARRAY_SIZE(sdm845_rt_pri_lvl),
> +		.priority_lvl = sdm845_rt_pri_lvl,
> +		},
> +	.qos_nrt_tbl = {
> +		.npriority_lvl = ARRAY_SIZE(sdm845_nrt_pri_lvl),
> +		.priority_lvl = sdm845_nrt_pri_lvl,
> +		},
> +	.memtype_count = 16,
> +	.memtype = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
> +	},
> +};
> +
>   /*************************************************************
>    * PERF data config
>    *************************************************************/

Thanks !

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
