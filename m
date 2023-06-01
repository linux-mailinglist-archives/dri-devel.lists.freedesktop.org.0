Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0E071F5E1
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 00:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9289A10E5F1;
	Thu,  1 Jun 2023 22:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6149910E5F1
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 22:19:05 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f60a27c4a2so1429637e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 15:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685657943; x=1688249943;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tzXpUnDvZMIGNay0Hjx0EQuMfpTuFoMlesIC5F6AUvE=;
 b=kkhGZhP5XYy2HzmNIbLeUTEFhbvL2oQoZdvdAI05ZtUBwV3q5x/VU0GV1R3T9qZODl
 Dm+cctRk1I2y2IwihBvGoQDFXqC2kMkKIPU2uxpiZ4KBHZaXech2/+rpMV8wCwfo/8kU
 mhbWvU54ao/wpEDJoIztIre3a2004KfIjMYKCWyDxXzOhSV7mfvmGDu7D1/V2kBiNAwq
 yuK+R850oz/AG2rENm8K36Wg2Oozrly5S+LqBCwTzdLVmr20hEdqF3qyrDSGLfie8Y0A
 jYem+IJBXXhiaucCcB6zFtJvmYfv303ldkko5SgNfy96NbcGNvgAVaL7/D3E75w88cZe
 3A/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685657943; x=1688249943;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tzXpUnDvZMIGNay0Hjx0EQuMfpTuFoMlesIC5F6AUvE=;
 b=im896OBi0QSSgQVaW+0Ekk51Z0dClIu0TtGx0IetyhQsWmjg5m4uJm2WsT6qElszye
 M14BnzrXXlrQXmlCVr+nJ1V9lNABYYkXjXIH/B6dISI2KL8PpH+xS7BAU4yxW2I/Nqwc
 ss6IF2gAA+96OfM/X1wsTjRs/r5TTngGF0VYvjPvAQgxjFy0EmkHW5SMYUkI4ZC70j9d
 8/AIL6aqTwuyLpjQkVuzV5l5eQCsy6NS48Xl8Qktf5jISr1K7k/bapUs+dS3jfcm5RhS
 YvoIOBvpj9pAlugkLS3XwnP3aT6INu8xU9+5Z73lu2lrOgabE035yrqC3bn9BiW26o08
 yZoQ==
X-Gm-Message-State: AC+VfDy3tJx+bq+yYxUY3txZugIg9gEi0zMAX6z6ctGl0bFmqf8zWzht
 i26SEWooYkzIvQIgkUlDctxNIA==
X-Google-Smtp-Source: ACHHUZ4bdEmvTLb553Q5+iyY77wpuuXKmGQSlgIhZOEtsTYnzLDj9i2MCBGiPRL4H9ECBwrf05q6wA==
X-Received: by 2002:ac2:5a06:0:b0:4f4:b28f:6b9c with SMTP id
 q6-20020ac25a06000000b004f4b28f6b9cmr783852lfn.29.1685657943086; 
 Thu, 01 Jun 2023 15:19:03 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a056512102200b004f25c1e2cf5sm1210004lfr.173.2023.06.01.15.19.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 15:19:02 -0700 (PDT)
Message-ID: <4011108d-1c1a-c648-244f-5414e9465d80@linaro.org>
Date: Fri, 2 Jun 2023 01:19:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] drm/msm/dpu: retrieve DSI DSC struct at
 atomic_check()
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1685657331-23280-1-git-send-email-quic_khsieh@quicinc.com>
 <1685657331-23280-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1685657331-23280-2-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/06/2023 01:08, Kuogee Hsieh wrote:
> At current implementation, DSI DSC struct is populated at display setup
> during system bootup. This mechanism works fine with embedded display.
> But will run into problem with plugin/unplug oriented external display,
> such as DP, due to DSC struct will become stale once external display
> unplugged. New DSC struct has to be re populated to reflect newer external
> display which just plugged in. Move retrieving of DSI DSC struct to
> atomic_check() so that same mechanism will work for both embedded display
> and external plugin/unplug oriented display.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 3b416e1..5c440a0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -604,7 +604,7 @@ static int dpu_encoder_virt_atomic_check(
>   	struct drm_display_mode *adj_mode;
>   	struct msm_display_topology topology;
>   	struct dpu_global_state *global_state;
> -	int i = 0;
> +	int index, i = 0;
>   	int ret = 0;
>   
>   	if (!drm_enc || !crtc_state || !conn_state) {
> @@ -639,6 +639,10 @@ static int dpu_encoder_virt_atomic_check(
>   		}
>   	}
>   
> +	index = dpu_enc->disp_info.h_tile_instance[0];
> +        if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI)
> +		dpu_enc->dsc = msm_dsi_get_dsc_config(priv->dsi[index]);

As discussed previously, one should not write to non-state objects from 
atomic_check. This chunk does.

Not to mention that this will start exploding once you try adding DP 
next to it.

Please abstain from posting next revisions until the discussions on the 
previous one are more or less finished. For now this is NAK.

Not to mention that this patch doesn't pass checkpatch.pl.

> +
>   	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
>   
>   	/*
> @@ -1034,7 +1038,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
>   	int num_lm, num_ctl, num_pp, num_dsc;
>   	unsigned int dsc_mask = 0;
> -	int i;
> +	int index, i;
>   
>   	if (!drm_enc) {
>   		DPU_ERROR("invalid encoder\n");
> @@ -1055,6 +1059,10 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   
>   	trace_dpu_enc_mode_set(DRMID(drm_enc));
>   
> +	index = dpu_enc->disp_info.h_tile_instance[0];
> +        if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI)
> +		dpu_enc->dsc = msm_dsi_get_dsc_config(priv->dsi[index]);

Doesn't this seem 100% same as the previous chunk? Doesn't it plead to 
be extracted to a helper function?

> +
>   	/* Query resource that have been reserved in atomic check step. */
>   	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>   		drm_enc->base.id, DPU_HW_BLK_PINGPONG, hw_pp,
> @@ -2121,8 +2129,10 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>   					phys_enc->hw_pp->merge_3d->idx);
>   	}
>   
> -	if (dpu_enc->dsc)
> +	if (dpu_enc->dsc) {
>   		dpu_encoder_unprep_dsc(dpu_enc);
> +		dpu_enc->dsc = NULL;
> +	}
>   
>   	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>   	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);

-- 
With best wishes
Dmitry

