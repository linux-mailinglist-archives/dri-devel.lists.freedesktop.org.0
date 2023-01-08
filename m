Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD228661B21
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 00:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27B310E226;
	Sun,  8 Jan 2023 23:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B155710E228
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 23:32:00 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id bq39so10544081lfb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 15:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XMahuRHUyby9cTVuxiS45czpMUwY4cTgnEghJo22NtM=;
 b=B/zmp25lbiHXTxa0KspeA4G9eLR4vSmqAyhrfaXFRjd3WVLbQRAe2lZfY5pJ4437A1
 LcCrbGZ2uTfBcGW6PAxHJnh0d4YC/FkcoKM2x/lPFs52aTtPySUiC6Dk7w4uQjP02RcS
 j5Bt/G1fw95wzs/SFoE0xKOCii56DHs65oM8TbdwooGdgO6vqaMGehI3gLUN57d2cFBj
 65V82y669Y7JZbh/MDcRlmMAEbsDT0d7KeN3JHqC9u+OakcIAouKLJRvG5F2IcyOZL2X
 Ws9j6AjM3YU+MAHK7E0TRgykek/OzpqESX9VmUGfyyxsKmnow40uSGf2r6JuKb5SiLEf
 pDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XMahuRHUyby9cTVuxiS45czpMUwY4cTgnEghJo22NtM=;
 b=AXXV4X/skVFIda6hIoaughcM/ScOsCiF+DfgRTiGsqT2GtPojwTOnU1kudmapHlOwq
 5StLxJlCUqjhHI2L/h/tBwGdYhSvmaPl34da3k0zyrbLqdZbbQV3yAy9uPFE0dH992ch
 7Z0DXS1LAm906M80BoHYV2SDH+5Y7xjzP2zskZgaTdatho9PS+FfTB0kxCyG5ce/DlUn
 Rhv8J9s9QvL64OjX/TApddyEVjQN3P0jkzwdKvb8k8vpVP8vr7TsItxBNY7eOuUBcApT
 zW+eYQ+LPScnNGtd+sJsGr6jHpnzaRU674RWi/P14Z8ePFN9Eb7UGOOaEyy1qnIvuWrQ
 XRJw==
X-Gm-Message-State: AFqh2kpR49by8jm+ImxuCFbOOixTRsTe6IXzUblZF3NnnMK9BEKzo0Vr
 Klluj9aVEwWGBrVcL1eK7e0F5w==
X-Google-Smtp-Source: AMrXdXsAP/6HHrzQYlZxu6VJANy0ySDdGi0ykUte9WZ5AYM3cntDWvUcoLeugwDSlwNH2vdWcbCVWQ==
X-Received: by 2002:a05:6512:e89:b0:4b5:b7be:136b with SMTP id
 bi9-20020a0565120e8900b004b5b7be136bmr18592394lfb.69.1673220719050; 
 Sun, 08 Jan 2023 15:31:59 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a19790f000000b004cb344a8c77sm1286960lfc.54.2023.01.08.15.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 15:31:58 -0800 (PST)
Message-ID: <42b45762-7fb9-2694-9fab-039ee09e4709@linaro.org>
Date: Mon, 9 Jan 2023 01:31:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 6/8] drm/msm/dpu: Remove num_enc from topology struct
 in favour of num_dsc
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221221231943.1961117-1-marijn.suijten@somainline.org>
 <20221221231943.1961117-7-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221221231943.1961117-7-marijn.suijten@somainline.org>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Haowen Bai <baihaowen@meizu.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/12/2022 01:19, Marijn Suijten wrote:
> Downstream calls this num_enc yet the DSC patches introduced a new
> num_dsc struct member, leaving num_enc effectively unused.
> 
> Fixes: 7e9cc175b159 ("drm/msm/disp/dpu1: Add support for DSC in topology")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 9 ++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 4 ++--
>   drivers/gpu/drm/msm/msm_drv.h               | 2 --
>   3 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 9c6817b5a194..a158cd502d38 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -579,19 +579,18 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   			topology.num_dspp = topology.num_lm;
>   	}
>   
> -	topology.num_enc = 0;
>   	topology.num_intf = intf_count;
>   
>   	if (dpu_enc->dsc) {
> -		/* In case of Display Stream Compression (DSC), we would use
> -		 * 2 encoders, 2 layer mixers and 1 interface
> +		/*
> +		 * In case of Display Stream Compression (DSC), we would use
> +		 * 2 DSC encoders, 2 layer mixers and 1 interface
>   		 * this is power optimal and can drive up to (including) 4k
>   		 * screens
>   		 */
> -		topology.num_enc = 2;
>   		topology.num_dsc = 2;
> -		topology.num_intf = 1;
>   		topology.num_lm = 2;
> +		topology.num_intf = 1;

Unless there is a reason, please move num_intf assignment back while 
preparing v3.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>   	}
>   
>   	return topology;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index dcbf03d2940a..5e7aa0f3a31c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -548,8 +548,8 @@ static int _dpu_rm_populate_requirements(
>   {
>   	reqs->topology = req_topology;
>   
> -	DRM_DEBUG_KMS("num_lm: %d num_enc: %d num_intf: %d\n",
> -		      reqs->topology.num_lm, reqs->topology.num_enc,
> +	DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
> +		      reqs->topology.num_lm, reqs->topology.num_dsc,
>   		      reqs->topology.num_intf);
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index d4e0ef608950..74626a271f46 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -82,14 +82,12 @@ enum msm_event_wait {
>   /**
>    * struct msm_display_topology - defines a display topology pipeline
>    * @num_lm:       number of layer mixers used
> - * @num_enc:      number of compression encoder blocks used
>    * @num_intf:     number of interfaces the panel is mounted on
>    * @num_dspp:     number of dspp blocks used
>    * @num_dsc:      number of Display Stream Compression (DSC) blocks used
>    */
>   struct msm_display_topology {
>   	u32 num_lm;
> -	u32 num_enc;
>   	u32 num_intf;
>   	u32 num_dspp;
>   	u32 num_dsc;

-- 
With best wishes
Dmitry

