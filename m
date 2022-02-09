Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BEA4B0016
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 23:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FBD10E31A;
	Wed,  9 Feb 2022 22:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D310110E4C4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 22:25:09 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id j14so5463958lja.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 14:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hIcx7fgKf79oX3DQejLBFipd+nYlJybj4bCOUvRVfTk=;
 b=AlKhd6Y+1pFKRAL1Gs0aGJemkU9izAFnRZhqMlBaMSz8KC/XHIV+ftQIqR0T+2Pv0g
 iHaSekL2qjqYoQg48jXn6Li+zsiiNBgZOavlJPwPpmx7FS3as0roA3vYdVTGL+5Hl8p6
 0/yHjvl7FFo92P3shC64MLzA5PjgKri39OfSj5KVgWTvfUybQVEUd5eAk3A39OGl2/Up
 aTcL1aLw+i22DqH2LVq2zkGsp5X9y53Vebd/FxsxVz7DN29WnCQvXejtpuUrq9EAkqCy
 RhD5ZgxUos3uDuChqgQkq2qbYHRNGLF2F+h1QkMbhrFCdk5aYjTLTP1RWGhOf4+v54Zn
 oPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hIcx7fgKf79oX3DQejLBFipd+nYlJybj4bCOUvRVfTk=;
 b=P8TxtPF+ZPF/MqpW+iRGw+XaczgsBp0OTMz+9bxZPOvDDgJZafh/AV9x4viIX0ZGgz
 BGpJzz6THc/RTb/FA6mI+iGFjICmtLRHl2z6h+2TfuCGgElSW6GHM8esictJBR8Rv1eU
 tXqC91Knhdin+Ee+lV9mz85LwLOfo0aXc5Gp2GzsMktY5bv/FX5j45t4XspqxmZlTRkV
 PD6G6IRTtWvPQYtvR9jmnxxGuLNdK018uB/vkxBqF9UkS156s/HkqIeBGoBQrLcUxpyr
 oXa+4uaMA36BdDwqsLNNfINl3WkqTqyPACQ6Vbxzr3ZZn2/oR0sPRcVOVlYcSBoEHXt3
 KNxQ==
X-Gm-Message-State: AOAM533f8bggwiaBPOhom6AxFj41gh1Pt2XPWFaJ8htsN+/wsbv+DPHY
 pRaKBweAkix2omTmrIw7166wAQ==
X-Google-Smtp-Source: ABdhPJwBNTpjejPUqQ20I3Mf4h67E5BFHnM2+lhr2w2BSwR1xW8oumn+pmF/vKAuybdKMNJNXLT2LA==
X-Received: by 2002:a05:651c:54d:: with SMTP id
 q13mr2950529ljp.352.1644445508012; 
 Wed, 09 Feb 2022 14:25:08 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id bi16sm1131966lfb.309.2022.02.09.14.25.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 14:25:07 -0800 (PST)
Message-ID: <fa5f1cd9-d274-a5ed-18a2-eb16ffe82196@linaro.org>
Date: Thu, 10 Feb 2022 01:25:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] drm/msm/rd: Add chip-id
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220114185742.283539-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220114185742.283539-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/01/2022 21:57, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> For newer devices which deprecate gpu-id and do matching based on
> chip-id, we need this information in cmdstream dumps so that the
> decoding tools know how to decode them.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_rd.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
> index 81432ec07012..7e4d6460719e 100644
> --- a/drivers/gpu/drm/msm/msm_rd.c
> +++ b/drivers/gpu/drm/msm/msm_rd.c
> @@ -62,6 +62,7 @@ enum rd_sect_type {
>   	RD_FRAG_SHADER,
>   	RD_BUFFER_CONTENTS,
>   	RD_GPU_ID,
> +	RD_CHIP_ID,
>   };
>   
>   #define BUF_SZ 512  /* should be power of 2 */
> @@ -202,6 +203,9 @@ static int rd_open(struct inode *inode, struct file *file)
>   
>   	rd_write_section(rd, RD_GPU_ID, &gpu_id, sizeof(gpu_id));
>   
> +	gpu->funcs->get_param(gpu, MSM_PARAM_CHIP_ID, &val);
> +	rd_write_section(rd, RD_CHIP_ID, &val, sizeof(val));
> +
>   out:
>   	mutex_unlock(&gpu->lock);
>   	return ret;


-- 
With best wishes
Dmitry
