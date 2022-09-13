Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCCC5B772B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 19:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC4D10E796;
	Tue, 13 Sep 2022 17:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69F410E796
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 17:04:52 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id z25so21200448lfr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 10:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=C1SHrY0bzxKJ2NJT55YgREa1pzMItM4ioi+jr7Uh69I=;
 b=ZyzHm7wCckAHL4Gs1yvJKUehjmxAlog/Jx3GoSEfC4baYLnjiY7xzQVbg1PkrG4KFC
 v97vC0Qk1DFJl9ilEx3cLWjd/j9NES0HBuZanV/u/bcCIliA9ktXGZrjhAAxQLsg7oqC
 9USwMMYwfKr+JzxZQ3Su1k9TpWSYbZccBk5Go25P9wOiQWcuB/EeDpKNudTt/UDESMDq
 CCTylyfCgb0/lOANY0qNvTCv2F/hLzFA3m7UOUKmAX+hSZnuxTD+4IRPuhmBEJ5+SwMj
 ZuFKikE00gDHXMjuVbTrIoI7n0Swziqp6aJViDdPykGVFW9DXifyATtfJz+1ysj3OPLs
 u4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=C1SHrY0bzxKJ2NJT55YgREa1pzMItM4ioi+jr7Uh69I=;
 b=lVadBGaWmLHg9mT7XAolzAsRuwr0lvIOHw4+d1xIUlpCTRSeeeCvSKf5KWRZ86I6Zc
 BIOmMmnj9CT6IElH2yE3ju7LHyRlpUuB1VRovUk7LqMBaZygt9XGeKHReo24AHzIyTU0
 I/duiZTlvC+ZKKnyJlY/fI4AOnTSSV/Ee4V2QWE9/ivLfNbwPmVn/mcReq9Tl8Tlg9/G
 4V09EzIRgHJCDU2+5L9TX0EBcaaCIBzxbB3oH79eaw6+ghO4NVNMJoSHIoxUit8DYslz
 fXTi3w9NRnVFURhNRtSKodONC0HoeqkI6AbyLGjGUzwRaIRsnNTHeWCtwBtTdO54YDqe
 F3DA==
X-Gm-Message-State: ACgBeo2fTZZbXI+qn3WVy2WX4GDw+v8uqKMqvG4l5VQPW2SAuRmeUibM
 HOeWMrPxAg9t8X/sf1jZukBbLA==
X-Google-Smtp-Source: AA6agR4rAimnm7a205Tjxp1N64zK3JZcXpBZwm3oeZBBQMHWEgaM2PIlpoha5yNCcLjv3U9HBWcOyQ==
X-Received: by 2002:a19:f805:0:b0:498:df1f:858e with SMTP id
 a5-20020a19f805000000b00498df1f858emr9917460lff.610.1663088690486; 
 Tue, 13 Sep 2022 10:04:50 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 i24-20020a0565123e1800b00492e5d31201sm1833989lfv.7.2022.09.13.10.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 10:04:50 -0700 (PDT)
Message-ID: <fc45b986-99ae-b63d-9ed4-0ca622b16a8f@linaro.org>
Date: Tue, 13 Sep 2022 20:04:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v7 01/15] drm/msm/disp/dpu: clear dpu_assign_crtc and get
 crtc from connector state instead of dpu_enc
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1663080676-12936-1-git-send-email-quic_vpolimer@quicinc.com>
 <1663080676-12936-2-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1663080676-12936-2-git-send-email-quic_vpolimer@quicinc.com>
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
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, linux-kernel@vger.kernel.org,
 quic_khsieh@quicinc.com, quic_aravindh@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/09/2022 17:51, Vinod Polimera wrote:
> Update crtc retrieval from dpu_enc to dpu_enc connector state,
> since new links get set as part of the dpu enc virt mode set.
> The dpu_enc->crtc cache is no more needed, hence cleaning it as
> part of this change.
> 
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 35 ++++++++++++-----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  8 -------
>   3 files changed, 14 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 13ce321..8ec9a13 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1029,7 +1029,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>   		 */
>   		if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_VIDEO)
>   			release_bandwidth = true;
> -		dpu_encoder_assign_crtc(encoder, NULL);
>   	}
>   
>   	/* wait for frame_event_done completion */
> @@ -1099,9 +1098,6 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
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
> index 9c6817b..0c7d8b5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -132,11 +132,6 @@ enum dpu_enc_rc_states {
>    * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
>    *			for partial update right-only cases, such as pingpong
>    *			split where virtual pingpong does not generate IRQs
> - * @crtc:		Pointer to the currently assigned crtc. Normally you
> - *			would use crtc->state->encoder_mask to determine the
> - *			link between encoder/crtc. However in this case we need
> - *			to track crtc in the disable() hook which is called
> - *			_after_ encoder_mask is cleared.
>    * @connector:		If a mode is set, cached pointer to the active connector
>    * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
>    *				all CTL paths
> @@ -181,7 +176,6 @@ struct dpu_encoder_virt {
>   
>   	bool intfs_swapped;
>   
> -	struct drm_crtc *crtc;
>   	struct drm_connector *connector;
>   
>   	struct dentry *debugfs_root;
> @@ -1288,6 +1282,7 @@ static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
>   		struct dpu_encoder_phys *phy_enc)
>   {
>   	struct dpu_encoder_virt *dpu_enc = NULL;
> +	struct drm_crtc *crtc;
>   	unsigned long lock_flags;
>   
>   	if (!drm_enc || !phy_enc)
> @@ -1298,9 +1293,14 @@ static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
>   
>   	atomic_inc(&phy_enc->vsync_cnt);
>   
> +	if (!dpu_enc->connector || !dpu_enc->connector->state)
> +		return;
> +
> +	crtc = dpu_enc->connector->state->crtc;
> +
>   	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
> -	if (dpu_enc->crtc)
> -		dpu_crtc_vblank_callback(dpu_enc->crtc);
> +	if (crtc)
> +		dpu_crtc_vblank_callback(crtc);
>   	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);

Stephen's comment about reading the state from outside of the lock and 
then using local variable under spinlock is still valid. Moreover I'm 
not sure that enc_spinlock protects connector's state. I'd say one has 
to take the modesetting lock here.

>   
>   	DPU_ATRACE_END("encoder_vblank_callback");
> @@ -1324,29 +1324,22 @@ static void dpu_encoder_underrun_callback(struct drm_encoder *drm_enc,
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
>   	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	struct drm_crtc *new_crtc;
>   	unsigned long lock_flags;
>   	int i;
>   
>   	trace_dpu_enc_vblank_cb(DRMID(drm_enc), enable);
>   
> +	if (!dpu_enc->connector || !dpu_enc->connector->state)
> +		return;
> +
> +	new_crtc = dpu_enc->connector->state->crtc;
>   	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
> -	if (dpu_enc->crtc != crtc) {
> +	if (!new_crtc || new_crtc != crtc) {
>   		spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
>   		return;
>   	}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 9e7236e..eda5cd8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -40,14 +40,6 @@ struct msm_display_info {
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

