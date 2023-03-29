Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 762866CF7AD
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 01:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8685B10E54E;
	Wed, 29 Mar 2023 23:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BE010EC70
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 23:48:55 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id c29so22373182lfv.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 16:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680133734;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4nT0j+zzun4HtuwuHnIU3HzE9OK3SdjOBdsKWomYhs8=;
 b=treoMPKCnP9KvD6g3WiT4R/vOlPlc9SINf22j56KAjCa4W4kt/4xpd+p8ji4YbDR7X
 qql44PqDgfsP2LXvL06L+GSf6ZXy+bYmKW2PLiqFxSxPtmKk6t+osVTQbk4sJwd/4Zxa
 yDulGSvq4FrvMal/KN4xFg8nrWV4UKfbnMoXHGz8L6WS0NEp83JuvwDDDjbJt1AtQ/Ko
 dy74JEho40A4JFx49QO2YyI3JOpZGjM6G6oibRVmmh/Q7tYH9AAqJ1a7LLuGc9Nh2Pg/
 i0DAKu0siIC6lGm/gn7GzsPdWf6cDqmMRucH4V9qPEsjAIk8u83FZ0rA54gS9/QT8HpQ
 Grew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680133734;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4nT0j+zzun4HtuwuHnIU3HzE9OK3SdjOBdsKWomYhs8=;
 b=BcqVDoYBqHsKzS+GFMrvI+q/BROChnopwy63x2HI1wXssT3f1VkXNrpbpIvWhbMC4P
 xxMM13SQRR24ik9nI64vE0YH0PQR5X/ELSt607RlubxLvd7xBXqyN7GNuSyA98y1cGg/
 uxJaADiNVANfNDI/R3qGocsxo2BN82dpSYaBdr+x3NaI/kC9B9pm/NpZZivQ7DOQhg+D
 9ty6s3FCkI4uf0Ot8SLPv6KMU8JVm+352kd7g3JYmWZXyg1P1GCtWm8o1u625GoQdVBw
 1crlBhmxIt67eNg/MXv6Yb4pILs4tADpWcnIaQ/Mx9Em+lj1u/3Mads5wtW/qDWyUCCC
 cOIQ==
X-Gm-Message-State: AAQBX9fu56X//iB0wzZ5KuaoFJWzfkloEdcYXceiK2GPFl4A3JUmOM6m
 JGruyyd4fAS9A8b6nj3aQxKOow==
X-Google-Smtp-Source: AKy350ba6VQZff9h18Gq+EGyt3d2FKmAT21ZUHO8Hhxi+SOXYHjoTJL701+OV4F+lqxYsDJ7h4iHYQ==
X-Received: by 2002:ac2:41cd:0:b0:4eb:1527:e2a7 with SMTP id
 d13-20020ac241cd000000b004eb1527e2a7mr2339243lfi.45.1680133734016; 
 Wed, 29 Mar 2023 16:48:54 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a2eb602000000b0029a1ccdc560sm5684880ljn.118.2023.03.29.16.48.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 16:48:53 -0700 (PDT)
Message-ID: <0698ce89-d70c-c3f4-f006-18130858aacf@linaro.org>
Date: Thu, 30 Mar 2023 02:48:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 5/5] drm/msm/dsi: Use MSM and DRM DSC helper methods
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v1-5-f3e479f59b6d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v1-5-f3e479f59b6d@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2023 02:18, Jessica Zhang wrote:
> Use MSM and DRM DSC helper methods.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 74d38f90398a..7419fe58a941 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -31,6 +31,7 @@
>   #include "msm_kms.h"
>   #include "msm_gem.h"
>   #include "phy/dsi_phy.h"
> +#include "disp/msm_dsc_helper.h"
>   
>   #define DSI_RESET_TOGGLE_DELAY_MS 20
>   
> @@ -841,14 +842,14 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>   {
>   	struct drm_dsc_config *dsc = msm_host->dsc;
>   	u32 reg, reg_ctrl, reg_ctrl2;
> -	u32 slice_per_intf, total_bytes_per_intf;
> +	u32 slice_per_intf;
>   	u32 pkt_per_line;
>   	u32 eol_byte_num;
>   
>   	/* first calculate dsc parameters and then program
>   	 * compress mode registers
>   	 */
> -	slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
> +	slice_per_intf = msm_dsc_get_slice_per_intf(dsc, hdisplay);

This looks good

>   
>   	/*
>   	 * If slice_count is greater than slice_per_intf
> @@ -858,10 +859,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>   	if (dsc->slice_count > slice_per_intf)
>   		dsc->slice_count = 1;
>   
> -	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
> +	eol_byte_num = msm_dsc_get_eol_byte_num(msm_host->dsc, hdisplay,
> +			dsi_get_bpp(msm_host->format));
>   
> -	eol_byte_num = total_bytes_per_intf % 3;
> -	pkt_per_line = slice_per_intf / dsc->slice_count;
> +	pkt_per_line = slice_per_intf / MSM_DSC_SLICE_PER_PKT;

And for these values the result is definitely changed. Separate patch & 
description please. Just in case, "values per downstream kernel" is not 
a proper description for such changes.

>   
>   	if (is_cmd_mode) /* packet data type */
>   		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
> @@ -911,6 +912,11 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   
>   	DBG("");
>   
> +	if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
> +		/* Default widebus_en to false for now. */
> +		hdisplay = msm_dsc_get_pclk_per_line(msm_host->dsc, mode->hdisplay,
> +				dsi_get_bpp(msm_host->format));
> +

This is definitely something new and thus should probably go into a 
separate patch and be described. Also I'm not sure how does that 
interact with the hdisplay-related calculations below, under the if(dsc) 
clause.

>   	/*
>   	 * For bonded DSI mode, the current DRM mode has
>   	 * the complete width of the panel. Since, the complete
> @@ -1759,7 +1765,7 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
>   		return ret;
>   	}
>   
> -	dsc->initial_scale_value = 32;
> +	dsc->initial_scale_value = drm_dsc_calculate_initial_scale_value(dsc);

This is fine, we only support 8bpp where these values match.

>   	dsc->line_buf_depth = dsc->bits_per_component + 1;
>   
>   	return drm_dsc_compute_rc_parameters(dsc);
> 

-- 
With best wishes
Dmitry

