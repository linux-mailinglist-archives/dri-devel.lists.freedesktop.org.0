Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B63D54FB134
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 02:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894D010E370;
	Mon, 11 Apr 2022 00:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F5A10E5DE
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 00:56:33 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id t25so23925362lfg.7
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 17:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9nnU/hlsgDy+lppU4ToxpqXZCXzo/JN9tONmD8z7t0M=;
 b=s+acL3GufGKRuADS3DU+Tl535oN0NiRYHOaSbwAGp1nnqf4i2AelYYSwf2pC0rcdQo
 CetSVGmAhbEgKZAjlpABCeudEqT6qApYSA2mgKmkWtQgBNLag2Z+Y0014IxV42g8J6TS
 KQm0uUNjx/+IW74QYTlE1lnhuoGVi4f//EXt65PPRH0phWmuy2xpf7PF5VsvRcHV9dHv
 SZj3130pFZZF8vy97v1FWFW2BoSCbHr3WH+L6m0IBPc7I0sq19w79edI8xd+M8lHbwI3
 9aVMwMV/4QWr5k8UZmZbGHEvu6MiFwG7xyiBgiW6aFZY44XLnmZtk8U2DdNHDzLWjg7U
 d/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9nnU/hlsgDy+lppU4ToxpqXZCXzo/JN9tONmD8z7t0M=;
 b=XD7gYtNbRAOUuYB0nWnJuRY/1X9Iip4CwEFO6JqhrvMwXG5Vq9mw+zC+EkFLdAbRiy
 1smoVuTlh1Cc89KykXzYEOLUWf8DLCbirYUkT3O+AN0Pt3QInLtp2Zsm25buSQwDTKTM
 41MVd+5P+ak98zK0uQL0LBU9pwgeqPuaS7pasT8NyDgvYchw/ZiwKCV8RKXoL5conmc1
 YUxYjrFIkCeOsVxgoO82LJMBxLrQrciOARvRv7SwuFiBUknr1eUFM4COna2O2zJlXwVK
 IVZ02ioBLOXfc28qU/11ckvPT7iPQKer9m9zD3R27mVUss51LdT1h6yGDh7nQENFI8Sc
 s9ag==
X-Gm-Message-State: AOAM530A5WRf12UoIJB36ye4WiqkgnGz0nQHcC5gKut6sPQoDT9z4COU
 h7H7hQJLfDNE756hvg9PTt6UOQ==
X-Google-Smtp-Source: ABdhPJygHoGGMiS/MT7i5dOZ69wDIbP52cTh/NAz+MNb4CGrKLMnej89s7ZZh3bJGQAToKEYaASHdQ==
X-Received: by 2002:a05:6512:3050:b0:44b:111:be72 with SMTP id
 b16-20020a056512305000b0044b0111be72mr19981248lfb.138.1649638592169; 
 Sun, 10 Apr 2022 17:56:32 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 j29-20020a056512029d00b0046ba6e0cc32sm125926lfp.300.2022.04.10.17.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 17:56:31 -0700 (PDT)
Message-ID: <0788b245-ee8f-25de-dde3-7ff10f6c688c@linaro.org>
Date: Mon, 11 Apr 2022 03:56:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dpu1: dpu_encoder: fix a missing check on list iterator
Content-Language: en-GB
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>, robdclark@gmail.com,
 sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
References: <20220327073252.10871-1-xiam0nd.tong@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220327073252.10871-1-xiam0nd.tong@gmail.com>
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
Cc: quic_kalyant@quicinc.com, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com,
 stable@vger.kernel.org, jsanka@codeaurora.org, bjorn.andersson@linaro.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/03/2022 10:32, Xiaomeng Tong wrote:
> The bug is here:
> 	 cstate = to_dpu_crtc_state(drm_crtc->state);
> 
> For the drm_for_each_crtc(), just like list_for_each_entry(),
> the list iterator 'drm_crtc' will point to a bogus position
> containing HEAD if the list is empty or no element is found.
> This case must be checked before any use of the iterator,
> otherwise it will lead to a invalid memory access.
> 
> To fix this bug, use a new variable 'iter' as the list iterator,
> while use the origin variable 'drm_crtc' as a dedicated pointer
> to point to the found element.
> 
> Cc: stable@vger.kernel.org
> Fixes: b107603b4ad0f ("drm/msm/dpu: map mixer/ctl hw blocks in encoder modeset")
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1e648db439f9..d3fdb18e96f9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -965,7 +965,7 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>   	struct dpu_kms *dpu_kms;
>   	struct list_head *connector_list;
>   	struct drm_connector *conn = NULL, *conn_iter;
> -	struct drm_crtc *drm_crtc;
> +	struct drm_crtc *drm_crtc = NULL, *iter;
>   	struct dpu_crtc_state *cstate;
>   	struct dpu_global_state *global_state;
>   	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
> @@ -1007,9 +1007,14 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>   		return;
>   	}
>   
> -	drm_for_each_crtc(drm_crtc, drm_enc->dev)
> -		if (drm_crtc->state->encoder_mask & drm_encoder_mask(drm_enc))
> +	drm_for_each_crtc(iter, drm_enc->dev)
> +		if (iter->state->encoder_mask & drm_encoder_mask(drm_enc)) {
> +			drm_crtc = iter;
>   			break;
> +		}
> +
> +	if (!drm_crtc)
> +		return;
>   
>   	/* Query resource that have been reserved in atomic check step. */
>   	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,


-- 
With best wishes
Dmitry
