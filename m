Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B451567720
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 21:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8591C11B4BF;
	Tue,  5 Jul 2022 19:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FF811B5B7
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 19:04:02 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id t25so22146167lfg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 12:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=imjS4QUgcg1C7mxw8dCBqY4kJvs6MaFMcV0Y0kq1AcE=;
 b=KM+OirbQib6vRRFbA1OkOtQZGofZIiEwU0xUW+eoj0/Zcl7IEgCI01Od12lua39zr0
 CZLu8XI3K2b73F0yFGijV+YORnNpqY0XI0kwnl3siIwAVSGf54R9ZT6wae1D4+DglA8X
 SCHzz7edIFyWzIqT8toqlatQgLOn/j3E98FAziVAz71E1ZlAhIKyDnnawKsaiPHbtT58
 WdOcHcZaEM8FWwViG/bnQDhvr82l3JbtDi5c3VyZS84la6LT4eG+LwLQd5abbGSQxcBm
 haT+V8EiOFOWuNk3X+iWfEkC14sdwWpRVtpAAAUL5q6Q2/OT1WS5N9OcrUuxk7p7MUUZ
 CaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=imjS4QUgcg1C7mxw8dCBqY4kJvs6MaFMcV0Y0kq1AcE=;
 b=5lyjDqN1mthqUmHz5ZpXvIMsJ15Guj6rg7rtioxsmTkSc0SojYDbR0jBYWslnvRfij
 yHUHkRGcGKHJI6xEL7T83GEs/jlJiqKYPU+hzTJ9+0VsPNc1JcHOPAKyM3Pn/0vk9XSW
 KhkhfiZ0zHDYHDYKCQBglM+ECcFb3yHUQ+DUM9plyUPSQ0JNPNotH/w9xCLGYrQ+cMsO
 TTBSxwiIYuUAyhykmvOg2JXtUtiV2YwPukkUZTSjVLpyVcOfHs609NV/5OPrPCwZStd/
 iCtXhe+AWXwq/wKk3ZuaZKLLC1V+xAccrov9CcqC3cFyvypvDTdgIcKsk1DBpQc//Ymb
 JGfg==
X-Gm-Message-State: AJIora8j+tTABktkjX31x9STBuOgqM6viQdTZSYeL9XZ7dkFmpoqClzJ
 qDDSFeLOc8hU9THdsjsw+zHRkQ==
X-Google-Smtp-Source: AGRyM1trbAKxG3+y4uZWEyK6u63pcSViIAGhEvfmkm3bF+nIaskdDzcRsMKMX/hYa8ZLzvfu/OpT8g==
X-Received: by 2002:a05:6512:1192:b0:481:4ba:f14d with SMTP id
 g18-20020a056512119200b0048104baf14dmr23498243lfr.662.1657047840478; 
 Tue, 05 Jul 2022 12:04:00 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a056512211100b00482ae30fcc5sm1457244lfr.189.2022.07.05.12.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 12:03:59 -0700 (PDT)
Message-ID: <5d469759-0619-eece-902d-df8ac6583f22@linaro.org>
Date: Tue, 5 Jul 2022 22:03:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 1/7] drm/msm/disp/dpu1: clear dpu_assign_crtc and get
 crtc from drm_enc instead of dpu_enc
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1657040445-13067-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657040445-13067-2-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1657040445-13067-2-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com,
 linux-kernel@vger.kernel.org, quic_khsieh@quicinc.com,
 bjorn.andersson@linaro.org, quic_aravindh@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/07/2022 20:00, Vinod Polimera wrote:
> Update crtc retrieval from dpu_enc to drm_enc, since new links get set
> as part of the update legacy mode set. The dpu_enc->crtc cache is no
> more needed, hence cleaning it as part of this change.

NAK. Quoting the documentation:

only really meaningful for non-atomic drivers. Atomic drivers should 
instead check &drm_connector_state.crtc.

Please adjust according to the documentation.

> 
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 +++---------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  8 --------
>   3 files changed, 3 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index b56f777..f91e3d1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -972,7 +972,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>   		 */
>   		if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_VIDEO)
>   			release_bandwidth = true;
> -		dpu_encoder_assign_crtc(encoder, NULL);
>   	}
>   
>   	/* wait for frame_event_done completion */
> @@ -1042,9 +1041,6 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
>   	trace_dpu_crtc_enable(DRMID(crtc), true, dpu_crtc);
>   	dpu_crtc->enabled = true;
>   
> -	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
> -		dpu_encoder_assign_crtc(encoder, crtc);
> -
>   	/* Enable/restore vblank irq handling */
>   	drm_crtc_vblank_on(crtc);
>   }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 52516eb..5629c0b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1254,8 +1254,8 @@ static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
>   	dpu_enc = to_dpu_encoder_virt(drm_enc);
>   
>   	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
> -	if (dpu_enc->crtc)
> -		dpu_crtc_vblank_callback(dpu_enc->crtc);
> +	if (drm_enc->crtc)
> +		dpu_crtc_vblank_callback(drm_enc->crtc);
>   	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
>   
>   	atomic_inc(&phy_enc->vsync_cnt);
> @@ -1280,18 +1280,6 @@ static void dpu_encoder_underrun_callback(struct drm_encoder *drm_enc,
>   	DPU_ATRACE_END("encoder_underrun_callback");
>   }
>   
> -void dpu_encoder_assign_crtc(struct drm_encoder *drm_enc, struct drm_crtc *crtc)
> -{
> -	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> -	unsigned long lock_flags;
> -
> -	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
> -	/* crtc should always be cleared before re-assigning */
> -	WARN_ON(crtc && dpu_enc->crtc);
> -	dpu_enc->crtc = crtc;
> -	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
> -}
> -
>   void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *drm_enc,
>   					struct drm_crtc *crtc, bool enable)
>   {
> @@ -1302,7 +1290,7 @@ void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *drm_enc,
>   	trace_dpu_enc_vblank_cb(DRMID(drm_enc), enable);
>   
>   	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
> -	if (dpu_enc->crtc != crtc) {
> +	if (drm_enc->crtc != crtc) {
>   		spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
>   		return;
>   	}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 781d41c..edba815 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -39,14 +39,6 @@ struct msm_display_info {
>   };
>   
>   /**
> - * dpu_encoder_assign_crtc - Link the encoder to the crtc it's assigned to
> - * @encoder:	encoder pointer
> - * @crtc:	crtc pointer
> - */
> -void dpu_encoder_assign_crtc(struct drm_encoder *encoder,
> -			     struct drm_crtc *crtc);
> -
> -/**
>    * dpu_encoder_toggle_vblank_for_crtc - Toggles vblank interrupts on or off if
>    *	the encoder is assigned to the given crtc
>    * @encoder:	encoder pointer


-- 
With best wishes
Dmitry
