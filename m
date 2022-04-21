Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C1D50ABA5
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 00:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA6310E036;
	Thu, 21 Apr 2022 22:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8292C10E065
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 22:47:38 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id h27so10932513lfj.13
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 15:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4rBU8JhHGmuimm5fNEMYbDal/dx3pK4nk4qKGREZwJY=;
 b=dqHnLKNVe70MHMrBRxGiGrwpRLv1zJNDutjfpUs3f9oC/bK0liONREEHpl31iD9+Ri
 JyO4BbdJIvL8vxhYnE9cBrmO/5/LW4WdNrsdb1ERbnph2MwyidhXi7WazTciBrNhl6cP
 8r8KyknGr64p5oi4gbPe/fUoy+bYOW2lVa0cM7coGACQ0GXWepxzbKkMWitp3QREKKli
 BvCyw53Tl/6/afWVaJm1eXGMmhUEVeACPE3kAYoo34C8MJqQn9B96O6mJBmNAqaTHz5m
 TVuV9xdZP/Pm+n+hQeFORHTNOiQPKJwgAXuSh6jZmQBshlCuAPv4646NT77KMzFVrw+T
 jprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4rBU8JhHGmuimm5fNEMYbDal/dx3pK4nk4qKGREZwJY=;
 b=ZhbkD8AzpWU2zZORmNdzJHKZfAkOmZmwEVs3BpP1kgpLO7f+FtvR09c4bcnvF27QB6
 mu16zTc7RiR5mmPHAx9ybqkacIR7drJ5F6KJAmXY22C9vRUREZqap/PEzPUFbM/IRHqV
 UfvqeJ5SxyuExko0o9hAZAiXzdLxEUZC4XU5iU1/CtDFA7IvRicV5xSY/8fuRIl6v1jb
 ufSn//szijZzSQ0E7CV5B0l1k/Jdi/yntEhQ8sfapzySX0lSN80bZKOxPnmQuHbOpPaA
 XqnZxEWt9Ze7TvTonN5ci8xR+iXF1YOGrS8wu9R8trc/bcajTO1aqkTjCGWPnbGjRlYk
 PIuA==
X-Gm-Message-State: AOAM533kAFXrPclq3O8xstYdygF5gwy/rl6B/FHotwLnwU/BMHwb/RWw
 W1BjUah9IJ8qqRgrSxzcIEUu5g==
X-Google-Smtp-Source: ABdhPJzVl5JGlq0nxYBRjN5pG7zM+qsdFSKqfMP4FK0YjLOYGNmz9fAoB1kFbF8S07a3RB5AO8r4uA==
X-Received: by 2002:a05:6512:1051:b0:471:ac48:505e with SMTP id
 c17-20020a056512105100b00471ac48505emr1096879lfb.306.1650581256722; 
 Thu, 21 Apr 2022 15:47:36 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a056512046600b0046fd05817f4sm34147lfd.239.2022.04.21.15.47.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 15:47:36 -0700 (PDT)
Message-ID: <b87b9c54-280e-43e0-bcb9-acd8c524ff98@linaro.org>
Date: Fri, 22 Apr 2022 01:47:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC 3/4] drm/msm/dpu: add wb_idx to existing DRM prints in
 dpu_encoder
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1650574112-25294-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650574112-25294-4-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1650574112-25294-4-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: markyacoub@chromium.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2022 23:48, Abhinav Kumar wrote:
> Add wb_idx to existing DRM prints in dpu_encoder and also
> print the intf_mode so that its clear that for any INTF_CMD/VID
> there will be a valid intf_idx and any INTF_WB_* there will be a
> valid wb_idx.
> 
> Update the debugfs to add the same information. Here is a sample
> output with this change:
> 
> root:/sys/kernel/debug/dri/0/encoder31# cat status
> intf:1  wb:-1  vsync: 31  underrun: 0    mode: INTF_MODE_VIDEO
> root:/sys/kernel/debug/dri/0/encoder33# cat status
> intf:-1  wb:2  vsync:  7  underrun: 0    mode: INTF_MODE_WB_LINE
> 
> Also remove DPU_DEBUG_PHYS macros as its unused because the
> respective dpu_encoder_phys_* files have their own macros.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 50 +++++++++++++----------------
>   1 file changed, 22 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 054d7e4..871ce87 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -37,18 +37,6 @@
>   #define DPU_ERROR_ENC(e, fmt, ...) DPU_ERROR("enc%d " fmt,\
>   		(e) ? (e)->base.base.id : -1, ##__VA_ARGS__)
>   
> -#define DPU_DEBUG_PHYS(p, fmt, ...) DRM_DEBUG_ATOMIC("enc%d intf%d pp%d " fmt,\
> -		(p) ? (p)->parent->base.id : -1, \
> -		(p) ? (p)->intf_idx - INTF_0 : -1, \
> -		(p) ? ((p)->hw_pp ? (p)->hw_pp->idx - PINGPONG_0 : -1) : -1, \
> -		##__VA_ARGS__)
> -
> -#define DPU_ERROR_PHYS(p, fmt, ...) DPU_ERROR("enc%d intf%d pp%d " fmt,\
> -		(p) ? (p)->parent->base.id : -1, \
> -		(p) ? (p)->intf_idx - INTF_0 : -1, \
> -		(p) ? ((p)->hw_pp ? (p)->hw_pp->idx - PINGPONG_0 : -1) : -1, \
> -		##__VA_ARGS__)
> -
>   /*
>    * Two to anticipate panels that can do cmd/vid dynamic switching
>    * plan is to create all possible physical encoder types, and switch between
> @@ -262,12 +250,28 @@ static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bp
>   	hw_pp->ops.setup_dither(hw_pp, &dither_cfg);
>   }
>   
> +static char *dpu_encoder_helper_get_intf_type(enum dpu_intf_mode intf_mode)
> +{

I'd rather convert this to switch() {...}

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +	if (intf_mode == INTF_MODE_VIDEO)
> +		return "INTF_MODE_VIDEO";
> +	else if (intf_mode == INTF_MODE_CMD)
> +		return "INTF_MODE_CMD";
> +	else if (intf_mode == INTF_MODE_WB_BLOCK)
> +		return "INTF_MODE_WB_BLOCK";
> +	else if (intf_mode == INTF_MODE_WB_LINE)
> +		return "INTF_MODE_WB_LINE";
> +	else
> +		return "INTF_MODE_UNKNOWN";
> +}
> +
>   void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
>   		enum dpu_intr_idx intr_idx)
>   {
> -	DRM_ERROR("irq timeout id=%u, intf=%d, pp=%d, intr=%d\n",
> -		  DRMID(phys_enc->parent), phys_enc->intf_idx - INTF_0,
> -		  phys_enc->hw_pp->idx - PINGPONG_0, intr_idx);
> +	DRM_ERROR("irq timeout id=%u, intf_mode=%s intf=%d wb=%d, pp=%d, intr=%d\n",
> +			DRMID(phys_enc->parent),
> +			dpu_encoder_helper_get_intf_type(phys_enc->intf_mode),
> +			phys_enc->intf_idx - INTF_0, phys_enc->wb_idx - WB_0,
> +			phys_enc->hw_pp->idx - PINGPONG_0, intr_idx);
>   
>   	if (phys_enc->parent_ops->handle_frame_done)
>   		phys_enc->parent_ops->handle_frame_done(
> @@ -2042,22 +2046,12 @@ static int _dpu_encoder_status_show(struct seq_file *s, void *data)
>   	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>   		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>   
> -		seq_printf(s, "intf:%d    vsync:%8d     underrun:%8d    ",
> -				phys->intf_idx - INTF_0,
> +		seq_printf(s, "intf:%d  wb:%d  vsync:%8d     underrun:%8d    ",
> +				phys->intf_idx - INTF_0, phys->wb_idx - WB_0,
>   				atomic_read(&phys->vsync_cnt),
>   				atomic_read(&phys->underrun_cnt));
>   
> -		switch (phys->intf_mode) {
> -		case INTF_MODE_VIDEO:
> -			seq_puts(s, "mode: video\n");
> -			break;
> -		case INTF_MODE_CMD:
> -			seq_puts(s, "mode: command\n");
> -			break;
> -		default:
> -			seq_puts(s, "mode: ???\n");
> -			break;
> -		}
> +		seq_printf(s, "mode: %s\n", dpu_encoder_helper_get_intf_type(phys->intf_mode));
>   	}
>   	mutex_unlock(&dpu_enc->enc_lock);
>   


-- 
With best wishes
Dmitry
