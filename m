Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A85E513DAE
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 23:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCD710EB8D;
	Thu, 28 Apr 2022 21:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564AB10EB88
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 21:34:40 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id l19so8343844ljb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 14:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LUO8kGdNJXZTMb0WmkKFEGqEheFIy7DQPZG/Z0cgjoA=;
 b=lNXfvFzsxPyNTjxt6InfLkA3RG4El1r+Dc1kSWwGQOqo5rTHIVKAcGiG2EAStEhtbN
 lLWdMkaxjIIaDN6p/4VLMxFptvRzt/Ii9XjWyyxPeS8dAhGR6fQEJeN22LqjwUntOYAf
 +o62I+wXaGNPvyAJ0QXgF2vGwC5QjRqKv6FO/Y14/92WM6k43fXeraLYmUAyg/lHFhw1
 iSpQtj42ZCDnQmUwkDTp457UV1URd64cyklxDTqVe8cVTEtBG+4Ck13hwB01fMhxdC1e
 rKq3/yuBpYGOlRi77nnPM6KlqtqcQOg/KORapBbNifPSmoztQ13/d9VWBSFMyPKxCV75
 0N9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LUO8kGdNJXZTMb0WmkKFEGqEheFIy7DQPZG/Z0cgjoA=;
 b=AemPl8CyCLk3qGKLoeXWuemI/VTNFogQSiJhUBCLloXNva1q8tEj5eahWnQfK7ZjnU
 b85ZDGfA7/leZWYjY4ZSK1dEEvf7JHFWZGVPHLdD8NjZDqU+ovTgj/Bkt+H2qUhb2KPz
 f996YU7Wy5IsenkIFi9e3MabnPuME8RQyouXaVXJh8ktwxxLIYpBZK1W56MfnciQEBiw
 xtf3UYH6FxQPKOsyVRx6EhPFUCSYv7j1nTmneGjBBfs+SuRKThUEHF26U045bXygCUmM
 UymjYu2GIgPQH7V/k76GBiMNs5j5yC57KOwiR65wz/63ZZmfOcDlvdh+SMxeV4HNYZer
 Sihw==
X-Gm-Message-State: AOAM5314EoPnwfYf+qhTJp1YfmseSZrP0DDI0ZmadCM/L2+VL47d08/2
 F7pYayOw4oOdeocBcJA6f2Vq3w==
X-Google-Smtp-Source: ABdhPJy4VZqBBFOSxpowqFsDu0aJsJZvoxMi0KRblL784nZybddRajmHphO+K/QrlPfQvi8IB3sdsQ==
X-Received: by 2002:a2e:9c03:0:b0:24a:fe64:2c12 with SMTP id
 s3-20020a2e9c03000000b0024afe642c12mr22792679lji.101.1651181678375; 
 Thu, 28 Apr 2022 14:34:38 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a199150000000b00472012f5d72sm95626lfj.98.2022.04.28.14.34.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 14:34:37 -0700 (PDT)
Message-ID: <81490e39-2cd1-02ce-508f-936bbd4e994b@linaro.org>
Date: Fri, 29 Apr 2022 00:34:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] drm/msm/dpu: remove unused refcount for encoder_phys_wb
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1651169759-29760-1-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1651169759-29760-1-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/04/2022 21:15, Abhinav Kumar wrote:
> Remove the unused local variable refcount for encoder_phys_wb
> as the one part of wb_enc is used directly.
> 
> changes in v2:
> 	- remove usage of ret variable also
> 	- remove the if (ret) code as it was dead-code anyway
> 
> Fixes: 0ce51f19453e ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 15 +++------------
>   1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index cb5c7da53c29..f4a79715a02e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -406,22 +406,13 @@ static void dpu_encoder_phys_wb_irq_ctrl(
>   {
>   
>   	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys);
> -	int ret = 0;
> -	int refcount;
> -
> -	refcount = atomic_read(&wb_enc->wbirq_refcount);
>   
> -	if (enable && atomic_inc_return(&wb_enc->wbirq_refcount) == 1) {
> +	if (enable && atomic_inc_return(&wb_enc->wbirq_refcount) == 1)
>   		dpu_core_irq_register_callback(phys->dpu_kms,
>   				phys->irq[INTR_IDX_WB_DONE], dpu_encoder_phys_wb_done_irq, phys);
> -		if (ret)
> -			atomic_dec_return(&wb_enc->wbirq_refcount);
> -	} else if (!enable &&
> -			atomic_dec_return(&wb_enc->wbirq_refcount) == 0) {
> +	else if (!enable &&
> +			atomic_dec_return(&wb_enc->wbirq_refcount) == 0)
>   		dpu_core_irq_unregister_callback(phys->dpu_kms, phys->irq[INTR_IDX_WB_DONE]);
> -		if (ret)
> -			atomic_inc_return(&wb_enc->wbirq_refcount);
> -	}
>   }
>   
>   static void dpu_encoder_phys_wb_atomic_mode_set(


-- 
With best wishes
Dmitry
