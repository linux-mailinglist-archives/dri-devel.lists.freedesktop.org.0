Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D09F508210
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 09:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38CF810F200;
	Wed, 20 Apr 2022 07:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614AA10F203
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 07:26:29 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id d6so1246796lfv.9
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 00:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cojOaNHOH/OuAXhbP7HRkjccKofdUD89wnI1kGLBN/4=;
 b=nu2RxL8dmKq3CS59pKdAF2Gv1kfBM9g3wv6wOqF5r4aSnLDTbXY0r/vAbTHIltCRVH
 /1Af2uWo3/aBhARgjU4IebVjj37jm2qXcQ4YpO+E+xqdaRzynOM61S3NfYtpu1HItLBp
 GUQsoUYO/3luE+RKrtXdAgZsf/b6KIupmUbDhwL0dU0XdTpimvwwEBuG9Qjqge7UdhNq
 aQPfH/h1rOYcc6ZwMHR8hyV8dY1widEK2jxfGMcVWUP6dlvof9IXpfyzEKT/i/pJCljw
 SGip53/ndO56h4+yvJay8rA8bQKnd1F7ENjjCqm5PNSbMTEW81C+WNVBbEl0VZOT2T4z
 4vVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cojOaNHOH/OuAXhbP7HRkjccKofdUD89wnI1kGLBN/4=;
 b=hfGbcAnvXzvPzFgECnmM8ARdRvzDbOqxTFGm7jjEXGHX7ARezvhaSr3Pqud1ikYuFk
 j6oTTS76BUUjSR4A6J+xTQkxIh+K18ukpBL0SD9CE3v4D719Y+FAhOezZBWCuhGlPy+Z
 8Qp1E8FOmkBp1MPxl8aT+eKUTdl2un4D5KC1uDDH80YmCYccg5TYWnR6o0lGGv4Vnjur
 qctIZb3gq4WZGSfuYTky6QrYaNdNE3V1fOh+azCZa4R6Jw2hzK4WzN/ivWTXfZnqGsWj
 ojJx7GgakQA4KwAvWv0W0LZcOQq46ocTABbcGzFaW9N97A2cDkOD0WClD0xLB6PSSsfo
 UWlw==
X-Gm-Message-State: AOAM530s6HrwAFZ7xOVWb/rk+F4eBhE/snfL+stp8GNY+8B2l7RkfUHG
 ++zHlnA/AMQzzHV+VwGz13bqdA==
X-Google-Smtp-Source: ABdhPJzPXREVzo/+QlSyPlmI3ImHupvgQQOHZvAu6d7YJwkpdOWC7PDc51qQtHaQ/K7UcoGiknEtuQ==
X-Received: by 2002:ac2:4dbc:0:b0:46b:c20e:7574 with SMTP id
 h28-20020ac24dbc000000b0046bc20e7574mr14298119lfe.386.1650439587734; 
 Wed, 20 Apr 2022 00:26:27 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a197716000000b0046bc65188d6sm1739163lfc.80.2022.04.20.00.26.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 00:26:27 -0700 (PDT)
Message-ID: <367c1856-305f-f6b9-cb71-6dcecad38b77@linaro.org>
Date: Wed, 20 Apr 2022 10:26:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 12/17] drm/msm/dpu: move _dpu_plane_get_qos_lut to
 dpu_hw_util file
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650419169-13760-13-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1650419169-13760-13-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/04/2022 04:46, Abhinav Kumar wrote:
> _dpu_plane_get_qos_lut() is not specific to just dpu_plane.
> It can take any fill level and return the LUT matching it.
> This can be used even for other modules like dpu_writeback.
> 
> Move _dpu_plane_get_qos_lut() to the common dpu_hw_util file
> and rename it to _dpu_hw_get_qos_lut().
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 25 +++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  4 ++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 27 +--------------------------
>   3 files changed, 30 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> index aad8511..512316f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> @@ -422,3 +422,28 @@ void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map *c,
>   	DPU_REG_WRITE(c, csc_reg_off + 0x3c, data->csc_post_bv[1]);
>   	DPU_REG_WRITE(c, csc_reg_off + 0x40, data->csc_post_bv[2]);
>   }
> +
> +/**
> + * _dpu_hw_get_qos_lut - get LUT mapping based on fill level
> + * @tbl:		Pointer to LUT table
> + * @total_fl:		fill level
> + * Return: LUT setting corresponding to the fill level
> + */
> +u64 _dpu_hw_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
> +		u32 total_fl)
> +{
> +	int i;
> +
> +	if (!tbl || !tbl->nentry || !tbl->entries)
> +		return 0;
> +
> +	for (i = 0; i < tbl->nentry; i++)
> +		if (total_fl <= tbl->entries[i].fl)
> +			return tbl->entries[i].lut;
> +
> +	/* if last fl is zero, use as default */
> +	if (!tbl->entries[i-1].fl)
> +		return tbl->entries[i-1].lut;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> index 3913475..529a6e0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> @@ -9,6 +9,7 @@
>   #include <linux/io.h>
>   #include <linux/slab.h>
>   #include "dpu_hw_mdss.h"
> +#include "dpu_hw_catalog.h"
>   
>   #define REG_MASK(n)                     ((BIT(n)) - 1)
>   
> @@ -324,4 +325,7 @@ void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map  *c,
>   		u32 csc_reg_off,
>   		const struct dpu_csc_cfg *data, bool csc10);
>   
> +u64 _dpu_hw_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
> +		u32 total_fl);
> +
>   #endif /* _DPU_HW_UTIL_H */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index c77c3d9d..730f0a3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -280,31 +280,6 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
>   }
>   
>   /**
> - * _dpu_plane_get_qos_lut - get LUT mapping based on fill level
> - * @tbl:		Pointer to LUT table
> - * @total_fl:		fill level
> - * Return: LUT setting corresponding to the fill level
> - */
> -static u64 _dpu_plane_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
> -		u32 total_fl)
> -{
> -	int i;
> -
> -	if (!tbl || !tbl->nentry || !tbl->entries)
> -		return 0;
> -
> -	for (i = 0; i < tbl->nentry; i++)
> -		if (total_fl <= tbl->entries[i].fl)
> -			return tbl->entries[i].lut;
> -
> -	/* if last fl is zero, use as default */
> -	if (!tbl->entries[i-1].fl)
> -		return tbl->entries[i-1].lut;
> -
> -	return 0;
> -}
> -
> -/**
>    * _dpu_plane_set_qos_lut - set QoS LUT of the given plane
>    * @plane:		Pointer to drm plane
>    * @fb:			Pointer to framebuffer associated with the given plane
> @@ -333,7 +308,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
>   			lut_usage = DPU_QOS_LUT_USAGE_MACROTILE;
>   	}
>   
> -	qos_lut = _dpu_plane_get_qos_lut(
> +	qos_lut = _dpu_hw_get_qos_lut(
>   			&pdpu->catalog->perf.qos_lut_tbl[lut_usage], total_fl);
>   
>   	trace_dpu_perf_set_qos_luts(pdpu->pipe - SSPP_VIG0,


-- 
With best wishes
Dmitry
