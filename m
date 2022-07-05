Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BA9567779
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 21:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262F114B2E0;
	Tue,  5 Jul 2022 19:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C61514B2D5
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 19:11:15 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id y18so4859730ljj.6
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 12:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=J6D9ah16emZXx6hjKx4gNbSSNQArHV+bljGkIepJWWY=;
 b=fPBcba4cf1W10Y18B7s5DZjcJ6V/KUvY8viyA9kqyyOpFLVgSd0SDDGQyrolMQVPps
 dDZxnASrWQr8PP7Z7BxaKqNiHLxI52YzAFkyCRS6og6ku0tMnX6ueK2/PTEmfZdik+/Y
 FDzn+z1sWq+P3ARJeB3QaRdaIYsM9X5W389AaJFXLQ2BvYw257NKRfjyyqCEKv0AuDRE
 0uynuZA2dMr9W2xMMUn1+zD2bCfeUjB08pcXf5H/iIg1WCupwec+jS+kPMIXiJn55sbU
 aT1at17KfI+RBuSiKqz4EdjfsCToKWtZGzVUu/fJsThrMVJszXuK27Ssr0RqRObvajTQ
 QsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J6D9ah16emZXx6hjKx4gNbSSNQArHV+bljGkIepJWWY=;
 b=5UNt++hbGmTUrpd064Clv1xGWU94aohjAVmCD4q3nixxidbaHapn054URMRgXSexPg
 BL5RfwhZAIL8L/Ng3kc+c5GSg3J+wVtXYCpsL4LQtkhAIWAOtNpNxy2aWdBpjnTEfBp5
 jXlghI5siXBb9yEXeYcnuDLb3YANMWv6hWa7SMav8BpFOKfAKh8OVnU9XJBe3AHbz7VV
 OuULIqpMefN/GQEvduRIYZbUrb7fPkrMYleLaQOO1IE+O7yp2acIABxXjAfV8gLAIPrH
 KsEC6yS4rFVEkYQwnT5BsmhAMiLoJ8JaDgHPClXEuV/CZX+7EAqxWQCUdqwcUJ1JTuJU
 X/Rg==
X-Gm-Message-State: AJIora9lqW8olMEbp7OVlXjBN/dP/Lt46vq6rO1jFBIASg/8wgXstD8W
 5MjH8IH6loe21J00E14Q7x9vug==
X-Google-Smtp-Source: AGRyM1sL/LTYXGeLBxn2MDkN3hIX3prmmc2NavC9gkASPWyG/n/7avAHRUQVmIf9il4Z6RpMssOGpg==
X-Received: by 2002:a05:651c:1202:b0:25a:6096:bd7e with SMTP id
 i2-20020a05651c120200b0025a6096bd7emr19313701lja.304.1657048273570; 
 Tue, 05 Jul 2022 12:11:13 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05651220d000b00478ea0e4f66sm5835982lfr.169.2022.07.05.12.11.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 12:11:12 -0700 (PDT)
Message-ID: <e3ac8795-c6c5-35fb-c133-877f6b78ffb3@linaro.org>
Date: Tue, 5 Jul 2022 22:11:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 7/7] drm/msm/disp/dpu1: add PSR support for eDP
 interface in dpu driver
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1657040445-13067-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657040445-13067-8-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1657040445-13067-8-git-send-email-quic_vpolimer@quicinc.com>
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
> Enable PSR on eDP interface using drm self-refresh librabry.
> This patch uses a trigger from self-refresh library to enter/exit
> into PSR, when there are no updates from framework.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 13 ++++++++++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 19 ++++++++++++++++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 +-
>   3 files changed, 31 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index f91e3d1..e63e363 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -18,6 +18,7 @@
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_rect.h>
>   #include <drm/drm_vblank.h>
> +#include <drm/drm_self_refresh_helper.h>
>   
>   #include "dpu_kms.h"
>   #include "dpu_hw_lm.h"
> @@ -961,6 +962,9 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>   
>   	DRM_DEBUG_KMS("crtc%d\n", crtc->base.id);
>   
> +	if (old_crtc_state->self_refresh_active)
> +		return;
> +
>   	/* Disable/save vblank irq handling */
>   	drm_crtc_vblank_off(crtc);
>   
> @@ -1019,7 +1023,9 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
>   	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>   	struct drm_encoder *encoder;
>   	bool request_bandwidth = false;
> +	struct drm_crtc_state *old_crtc_state;
>   
> +	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);

What for?

>   	pm_runtime_get_sync(crtc->dev->dev);
>   
>   	DRM_DEBUG_KMS("crtc%d\n", crtc->base.id);
> @@ -1521,7 +1527,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>   {
>   	struct drm_crtc *crtc = NULL;
>   	struct dpu_crtc *dpu_crtc = NULL;
> -	int i;
> +	int i, ret;
>   
>   	dpu_crtc = kzalloc(sizeof(*dpu_crtc), GFP_KERNEL);
>   	if (!dpu_crtc)
> @@ -1558,6 +1564,11 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>   	/* initialize event handling */
>   	spin_lock_init(&dpu_crtc->event_lock);
>   
> +	ret = drm_self_refresh_helper_init(crtc);
> +	if (ret)
> +		DPU_ERROR("Failed to initialize %s with self-refresh helpers %d\n",
> +			crtc->name, ret);

Return an error?

> +
>   	DRM_DEBUG_KMS("%s: successfully initialized crtc\n", dpu_crtc->name);
>   	return crtc;
>   }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index f01a976..e2a74ba 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -225,6 +225,11 @@ bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
>   	return dpu_enc->wide_bus_en;
>   }
>   
> +static inline bool is_self_refresh_active(const struct drm_crtc_state *state)
> +{
> +	return (state && state->self_refresh_active);
> +}

Please inline this function. There is just one user.

> +
>   static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bpc)
>   {
>   	struct dpu_hw_dither_cfg dither_cfg = { 0 };
> @@ -592,7 +597,7 @@ static int dpu_encoder_virt_atomic_check(
>   		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>   			dpu_rm_release(global_state, drm_enc);
>   
> -			if (!crtc_state->active_changed || crtc_state->active)
> +			if (!crtc_state->active_changed || crtc_state->enable)

This warrants a separate commit with Fixes tag.

>   				ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
>   						drm_enc, crtc_state, topology);
>   		}
> @@ -1171,11 +1176,23 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
>   					struct drm_atomic_state *state)
>   {
>   	struct dpu_encoder_virt *dpu_enc = NULL;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *old_state;
>   	int i = 0;
>   
>   	dpu_enc = to_dpu_encoder_virt(drm_enc);
>   	DPU_DEBUG_ENC(dpu_enc, "\n");
>   
> +	crtc = drm_enc->crtc;
> +	old_state = drm_atomic_get_old_crtc_state(state, crtc);
> +
> +	/*
> +	 * The encoder disabled already occurred when self refresh mode

The encoder is already disabled if self ...

> +	 * was set earlier, in the old_state for the corresponding crtc.
> +	 */
> +	if (is_self_refresh_active(old_state))
> +		return;
> +
>   	mutex_lock(&dpu_enc->enc_lock);
>   	dpu_enc->enabled = false;
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index bce4764..cc0a674 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -507,7 +507,7 @@ static void dpu_kms_wait_for_commit_done(struct msm_kms *kms,
>   		return;
>   	}
>   
> -	if (!crtc->state->active) {
> +	if (!drm_atomic_crtc_effectively_active(crtc->state)) {
>   		DPU_DEBUG("[crtc:%d] not active\n", crtc->base.id);
>   		return;
>   	}


-- 
With best wishes
Dmitry
