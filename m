Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7886F4DFD
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 02:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E0410E16E;
	Wed,  3 May 2023 00:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F056610E139
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 00:01:05 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2a7af0cb2e6so45697431fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 17:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683072063; x=1685664063;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z+e3V1cbVZ3tsdSckxjJySwp/OvSUyqV1boheb/i09g=;
 b=KNamIJq+NMqZjCQ9qLOcpItKMokfaEHFszPvYnTYUS00eYPdccEKUIpW+M/uGX1srK
 grwjuBq/W2iTNlLXP2YJJN0roykGDVpTbX0r6XjsAsyzGguX4TRUa1+nJCOu5+RDkP5C
 qvqTwIGfJW+rn/ijK2dNaTC6QqaSeoTFbqOZPqmLD2LUTc7dZ/6/UzYqn3Hax6Q8OeyM
 DQyT1Ll7Mb8798bD/ix4D3pkhEF8ts2oxowbhxhIgeEd/lM4OnSG24KMhVK1BhD82pis
 hMy1nG+cela3kjuNGJnf8nkQyDXr+TOZJnTnpLc2pPLdnNPjNYVzeKgHgGBDzhIJTF6r
 SuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683072063; x=1685664063;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z+e3V1cbVZ3tsdSckxjJySwp/OvSUyqV1boheb/i09g=;
 b=C2XPJz33xWCFmW5omT9DyS+UHDnia7xx9G1atM8FcLN0GV3XpaTuSpTSLczGbFP8DW
 /gICxfN2k3fQi8BF8uE/Egh1nw1gcwJsOHIko1NOYhXl4gEjLmLVVfHZusTO84/TI9vN
 su4v5ubTfaMya9D9qtrP2SaY15iyuwCfeB2bGZ/o1aMPtn4HMljtRffIoAIlXfu8OOYY
 uoxg81+9eqTlvhbD0oXNErmWT+Q8jpSLklJuV7vNfTYEaPrvAqbv440A/k4Vp34NuEPv
 3eSU4DjFWNHnFNYzVGh49dAt1cZmx8EsIdX0Z5b0kwxya6zsN4iGX670Omh+9PJRyP+p
 JCvw==
X-Gm-Message-State: AC+VfDwYkpbc/3e6KGywf3o+OXPkCOfrTV95sJdWcQahP/XXOoBYWeTe
 HaqRBomWaOqBRnQFYMJ/XsxS0Q==
X-Google-Smtp-Source: ACHHUZ72ib5EQz8PLnDIM4t9DgCxrhx0KGBuZ5nsFqbEebqoA7NT2cZvRRC0+kw77ivoVdY0BoRIUg==
X-Received: by 2002:a05:6512:20d:b0:4f1:1e31:96a9 with SMTP id
 a13-20020a056512020d00b004f11e3196a9mr391590lfo.51.1683072063583; 
 Tue, 02 May 2023 17:01:03 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a195511000000b004ec83bc3e2dsm5572675lfe.42.2023.05.02.17.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 17:01:02 -0700 (PDT)
Message-ID: <11573893-8031-a4c4-9726-be96c732ae17@linaro.org>
Date: Wed, 3 May 2023 03:01:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 7/7] drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
 <20230430235732.3341119-8-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230430235732.3341119-8-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/05/2023 02:57, Dmitry Baryshkov wrote:
> The atomic_mode_set() callback only sets the phys_enc's IRQ data. As the
> INTF and WB are statically allocated to each encoder/phys_enc, drop the
> atomic_mode_set callback and set the IRQs during encoder init.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Please ignore this for now, I'd like to take another look on my own. I 
didn't test the CMD panels and they are going to break with this change.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 --
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  5 -----
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 20 +++++--------------
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 13 ++----------
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 11 +---------
>   5 files changed, 8 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index b35e92c658ad..509b4fc7dbc5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1106,8 +1106,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
>   
>   		phys->cached_mode = crtc_state->adjusted_mode;
> -		if (phys->ops.atomic_mode_set)
> -			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 1c096d9390d0..67c4b4e0975d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -68,8 +68,6 @@ struct dpu_encoder_phys;
>    * @is_master:			Whether this phys_enc is the current master
>    *				encoder. Can be switched at enable time. Based
>    *				on split_role and current mode (CMD/VID).
> - * @atomic_mode_set:		DRM Call. Set a DRM mode.
> - *				This likely caches the mode, for use at enable.
>    * @enable:			DRM Call. Enable a DRM mode.
>    * @disable:			DRM Call. Disable mode.
>    * @atomic_check:		DRM Call. Atomic check new DRM state.
> @@ -97,9 +95,6 @@ struct dpu_encoder_phys_ops {
>   			struct dentry *debugfs_root);
>   	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
>   	bool (*is_master)(struct dpu_encoder_phys *encoder);
> -	void (*atomic_mode_set)(struct dpu_encoder_phys *encoder,
> -			struct drm_crtc_state *crtc_state,
> -			struct drm_connector_state *conn_state);
>   	void (*enable)(struct dpu_encoder_phys *encoder);
>   	void (*disable)(struct dpu_encoder_phys *encoder);
>   	int (*atomic_check)(struct dpu_encoder_phys *encoder,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 781290f17714..3ad03465acfe 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -139,20 +139,6 @@ static void dpu_encoder_phys_cmd_underrun_irq(void *arg, int irq_idx)
>   	dpu_encoder_underrun_callback(phys_enc->parent, phys_enc);
>   }
>   
> -static void dpu_encoder_phys_cmd_atomic_mode_set(
> -		struct dpu_encoder_phys *phys_enc,
> -		struct drm_crtc_state *crtc_state,
> -		struct drm_connector_state *conn_state)
> -{
> -	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
> -
> -	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
> -
> -	phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
> -
> -	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
> -}
> -
>   static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
>   		struct dpu_encoder_phys *phys_enc)
>   {
> @@ -736,7 +722,6 @@ static void dpu_encoder_phys_cmd_init_ops(
>   		struct dpu_encoder_phys_ops *ops)
>   {
>   	ops->is_master = dpu_encoder_phys_cmd_is_master;
> -	ops->atomic_mode_set = dpu_encoder_phys_cmd_atomic_mode_set;
>   	ops->enable = dpu_encoder_phys_cmd_enable;
>   	ops->disable = dpu_encoder_phys_cmd_disable;
>   	ops->destroy = dpu_encoder_phys_cmd_destroy;
> @@ -777,6 +762,11 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
>   
>   	dpu_encoder_phys_cmd_init_ops(&phys_enc->ops);
>   	phys_enc->intf_mode = INTF_MODE_CMD;
> +	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
> +	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
> +	phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
> +	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
> +
>   	cmd_enc->stream_sel = 0;
>   
>   	atomic_set(&cmd_enc->pending_vblank_cnt, 0);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index f02ff8f43f47..cf9a0128ff71 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -348,16 +348,6 @@ static bool dpu_encoder_phys_vid_needs_single_flush(
>   	return phys_enc->split_role != ENC_ROLE_SOLO;
>   }
>   
> -static void dpu_encoder_phys_vid_atomic_mode_set(
> -		struct dpu_encoder_phys *phys_enc,
> -		struct drm_crtc_state *crtc_state,
> -		struct drm_connector_state *conn_state)
> -{
> -	phys_enc->irq[INTR_IDX_VSYNC] = phys_enc->hw_intf->cap->intr_vsync;
> -
> -	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
> -}
> -
>   static int dpu_encoder_phys_vid_control_vblank_irq(
>   		struct dpu_encoder_phys *phys_enc,
>   		bool enable)
> @@ -679,7 +669,6 @@ static int dpu_encoder_phys_vid_get_frame_count(
>   static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
>   {
>   	ops->is_master = dpu_encoder_phys_vid_is_master;
> -	ops->atomic_mode_set = dpu_encoder_phys_vid_atomic_mode_set;
>   	ops->enable = dpu_encoder_phys_vid_enable;
>   	ops->disable = dpu_encoder_phys_vid_disable;
>   	ops->destroy = dpu_encoder_phys_vid_destroy;
> @@ -720,6 +709,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
>   
>   	dpu_encoder_phys_vid_init_ops(&phys_enc->ops);
>   	phys_enc->intf_mode = INTF_MODE_VIDEO;
> +	phys_enc->irq[INTR_IDX_VSYNC] = phys_enc->hw_intf->cap->intr_vsync;
> +	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
>   
>   	DPU_DEBUG_VIDENC(phys_enc, "created intf idx:%d\n", p->hw_intf->idx);
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index b058c69e8778..27479334176b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -398,15 +398,6 @@ static void dpu_encoder_phys_wb_irq_ctrl(
>   		dpu_core_irq_unregister_callback(phys->dpu_kms, phys->irq[INTR_IDX_WB_DONE]);
>   }
>   
> -static void dpu_encoder_phys_wb_atomic_mode_set(
> -		struct dpu_encoder_phys *phys_enc,
> -		struct drm_crtc_state *crtc_state,
> -		struct drm_connector_state *conn_state)
> -{
> -
> -	phys_enc->irq[INTR_IDX_WB_DONE] = phys_enc->hw_wb->caps->intr_wb_done;
> -}
> -
>   static void _dpu_encoder_phys_wb_handle_wbdone_timeout(
>   		struct dpu_encoder_phys *phys_enc)
>   {
> @@ -656,7 +647,6 @@ static bool dpu_encoder_phys_wb_is_valid_for_commit(struct dpu_encoder_phys *phy
>   static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
>   {
>   	ops->is_master = dpu_encoder_phys_wb_is_master;
> -	ops->atomic_mode_set = dpu_encoder_phys_wb_atomic_mode_set;
>   	ops->enable = dpu_encoder_phys_wb_enable;
>   	ops->disable = dpu_encoder_phys_wb_disable;
>   	ops->destroy = dpu_encoder_phys_wb_destroy;
> @@ -707,6 +697,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
>   
>   	dpu_encoder_phys_wb_init_ops(&phys_enc->ops);
>   	phys_enc->intf_mode = INTF_MODE_WB_LINE;
> +	phys_enc->irq[INTR_IDX_WB_DONE] = phys_enc->hw_wb->caps->intr_wb_done;
>   
>   	atomic_set(&wb_enc->wbirq_refcount, 0);
>   

-- 
With best wishes
Dmitry

