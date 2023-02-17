Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 390E669B57C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 23:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D163910E470;
	Fri, 17 Feb 2023 22:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F7910E1F8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 22:26:28 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bi36so3211267lfb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 14:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nk0P5TEcjLAlZRZi1tf2S3Zc1fDdctQasJLS4BDXM9w=;
 b=vSJPS7u+IYoDpIUA+dfRFb+S3oLZOXXPRmirjjw6S3qPOReKK0aPTSTvFwB88nm8l2
 7cCBxdEmxGN/KzKqvt/TxqtUlfX+AXs12qiVyGyCr0vwLBa2IwYLfSXHv02pmuNByR09
 GmhsDB5ZQZKXE0SvuOy4txvWAOzqcHyj67bkSQ95TIxI917dL/BX5HQ30LYC4E0Mu/s2
 9bGtMFcREbBi5fvbQqWRm2KmR/pmZOnK2I0X0lpLnTu5PKVusRfJer1i3W3gf0brUltz
 C4hYeM0jGidLIXMEoDCpGrncUy2X6oVUk30PJ97jH4cW/hUTXRaVwR4r1OqYjTOeV5Oq
 /CCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nk0P5TEcjLAlZRZi1tf2S3Zc1fDdctQasJLS4BDXM9w=;
 b=apF+XEzIS2+xDBWTE5KKZ0mge+jSPBgXZ1Xhd7xaYc5buTyUVo6OapzflX//PziHA5
 VhybsG/5EWIfJk0V94UPF+nkjUAl5mo4f7ryEztWTWwmkddxH1Kvo/j0VTJfofDa31Vm
 nUcZP3TBs96ku59m+iB/qHAFCWEHMSc+Yn3vBupRkaK8juJQeI+QI/FJ5G0lqI4gFTgA
 cy3kamRDSS9jdxwgqMrlDPsqSoG6uoBTqctIORGd9L3dUuG0bYk5CVuVsOd4luJMLFpK
 wmQCp9PHETdPnQJqlU6o2JETQxS8RlKUOuS++9mYrT+o6I58Z13CCayYUUFCTWgRad1Z
 v5HQ==
X-Gm-Message-State: AO0yUKWIQ1xTPX7QYNyZk3fAxvDZ+ZHKPPJSPLlJlVNZ13uKegn0iG5S
 TnW0aYGxRHSRbTBRT/BwQNbJbA==
X-Google-Smtp-Source: AK7set9tQUZjlvOjEPKgIZhNhaqAqfvoIjGR/tM9dONOTFbJZHwBM+4tpGwqyBXE9VDv0qHRQ1y7TQ==
X-Received: by 2002:a05:6512:10d3:b0:4db:5123:c271 with SMTP id
 k19-20020a05651210d300b004db5123c271mr2439616lfg.29.1676672786935; 
 Fri, 17 Feb 2023 14:26:26 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q13-20020ac25a0d000000b004b578e52d81sm791238lfn.176.2023.02.17.14.26.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 14:26:26 -0800 (PST)
Message-ID: <3c17e91a-4903-ac13-7829-54c2c31bab6f@linaro.org>
Date: Sat, 18 Feb 2023 00:26:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v4 4/4] drm/msm/dpu: manage DPU resources if CTM is
 requested
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1676286704-818-1-git-send-email-quic_kalyant@quicinc.com>
 <1676286704-818-5-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1676286704-818-5-git-send-email-quic_kalyant@quicinc.com>
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com,
 marijn.suijten@somainline.org, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2023 13:11, Kalyan Thota wrote:
> Allow modeset to be triggered during CTM enable/disable.
> In the modeset callbacks, DPU resources required for the
> CTM feature are managed appropriately.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_atomic.c | 18 ++++++++++++++++++
>   drivers/gpu/drm/msm/msm_drv.c    |  2 +-
>   drivers/gpu/drm/msm/msm_drv.h    |  1 +
>   3 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 1686fbb..e3e607c 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -179,6 +179,24 @@ static unsigned get_crtc_mask(struct drm_atomic_state *state)
>   	return mask;
>   }
>   
> +int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
> +	struct drm_crtc *crtc;
> +	int i;
> +

I hope this can be gone for good if at some point we have CRTC resource 
allocation split from encoder resource alloc.

> +	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
> +				      new_crtc_state, i) {
> +		if ((old_crtc_state->ctm && !new_crtc_state->ctm) ||
> +		    (!old_crtc_state->ctm && new_crtc_state->ctm)) {
> +			new_crtc_state->mode_changed = true;
> +			state->allow_modeset = true;
> +		}
> +	}
> +
> +	return drm_atomic_helper_check(dev, state);
> +}
> +
>   void msm_atomic_commit_tail(struct drm_atomic_state *state)
>   {
>   	struct drm_device *dev = state->dev;
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 0759e2d..3221284 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -52,7 +52,7 @@
>   static const struct drm_mode_config_funcs mode_config_funcs = {
>   	.fb_create = msm_framebuffer_create,
>   	.output_poll_changed = drm_fb_helper_output_poll_changed,
> -	.atomic_check = drm_atomic_helper_check,
> +	.atomic_check = msm_atomic_check,
>   	.atomic_commit = drm_atomic_helper_commit,
>   };
>   
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index ea80846..7d0243a 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -209,6 +209,7 @@ int msm_atomic_init_pending_timer(struct msm_pending_timer *timer,
>   		struct msm_kms *kms, int crtc_idx);
>   void msm_atomic_destroy_pending_timer(struct msm_pending_timer *timer);
>   void msm_atomic_commit_tail(struct drm_atomic_state *state);
> +int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state);
>   struct drm_atomic_state *msm_atomic_state_alloc(struct drm_device *dev);
>   void msm_atomic_state_clear(struct drm_atomic_state *state);
>   void msm_atomic_state_free(struct drm_atomic_state *state);

-- 
With best wishes
Dmitry

