Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BE473A287
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 16:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC03710E56E;
	Thu, 22 Jun 2023 14:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BE510E56C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 14:00:59 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b45b6adffbso98235831fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 07:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687442457; x=1690034457;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qDAFBMYPiPznVnRgG8rIe+FxGJ3jLqWLpn7zX6SjUaI=;
 b=rXyoHmUPmG24VepNTHLtml3z3pyhBDAdea659DZ4l/YTnDn9NYZT3+JeVpFiTBCV/Y
 GhAeTyQ/0fQeCbYoLLTlr13cQ7IVuZbdmJQdk8YF0K7qSHCZqw8XUpV8yLszFtZOyHhQ
 p+jYEgj7GWwepbRwPe7Z5Iu17vRddAk//AABG1UaxMjrpmYaHRX6ZL3GrDPmpaoeBhEc
 sKEgl7IWuOm91R7htKsTWao9jJeFQiBzaSArcLXz1RANOsUzPYvpBiJk4MGlxB8V8kKM
 lVVc7YNmW+DO+zdGQzd/waVZR2QZzo+9rP1gL3Wz5x6MHB0hx3oKiFE2rx5JTGuHhpPu
 DzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687442457; x=1690034457;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qDAFBMYPiPznVnRgG8rIe+FxGJ3jLqWLpn7zX6SjUaI=;
 b=eNXch8U0VWE8BhoqAk0D1u1ESlgy5bJIGTHt2aSFYbDIXrr2XOXuK5LEUKSAKmeIYq
 9cqHFXxpNB8aZ53bqUOXh2CkYCjU7ZYxqj/03L3JqPWbnueU0xkE8fmbO99tcIvb4UlW
 DBdTxvn6vgLJMDH1Oo4g/tTpGBsLqtO+rrXN/Br5utlKORKEYPaO6m3UAAIzWJXkQT3k
 Eo2snwV/sQijOJPSmiCE7P7JWHpGbtRu12sjDdNXPr9Ig0523g5FBNQV81YvFLuF+xh5
 DBSos6DxRg4DBIqxnLQbBzsCdy5BOsEQwk+Tv0P6aNCGddtjHsuuAZm9JUU07UOmraIZ
 5iug==
X-Gm-Message-State: AC+VfDyRetLlz1/0jbKVWwZzP3gFe4pLBCDNbqULHhqc/iaYm2jAkThm
 iWfgeKzOdwg0FQMGp4UrBQ0yIA==
X-Google-Smtp-Source: ACHHUZ4IZbd5OONR4StDIjXq0BsVph+RBZrIc32OiKTpTMnquJPVj5igDtBZY3vDyNgcb2ng5uBbEA==
X-Received: by 2002:a2e:9d58:0:b0:2b4:79c3:cdf7 with SMTP id
 y24-20020a2e9d58000000b002b479c3cdf7mr7489182ljj.26.1687442456530; 
 Thu, 22 Jun 2023 07:00:56 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a2e9984000000b002af25598ef9sm1335755lji.0.2023.06.22.07.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 07:00:55 -0700 (PDT)
Message-ID: <a73ea5f4-310d-23c8-e686-decc3e59d602@linaro.org>
Date: Thu, 22 Jun 2023 17:00:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 1/2] drm/msm/dpu: retrieve DSI DSC struct through
 priv->dsi[0]
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1687364298-29430-1-git-send-email-quic_khsieh@quicinc.com>
 <1687364298-29430-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1687364298-29430-2-git-send-email-quic_khsieh@quicinc.com>
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

On 21/06/2023 19:18, Kuogee Hsieh wrote:
> Currently DSI DSC struct is populated at display setup during
> system bootup. This mechanism works fine with embedded display
> but not for pluggable displays as the DSC struct will become
> stale once external display unplugged.
> 
> Move storing of DSI DSC struct to both atomic_mode_set() and
> atomic_enable() so that same mechanism will work for both
> embedded display and pluggable displays.
> 
> Changes in v4:
> -- fix checkpatch.pl warning
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 30 +++++++++++++++++++++++++----
>   1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 2e1873d..367d374 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -543,11 +543,24 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>   	return (num_dsc > 0) && (num_dsc > intf_count);
>   }
>   
> +static struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
> +{
> +	struct msm_drm_private *priv = drm_enc->dev->dev_private;
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	int index = dpu_enc->disp_info.h_tile_instance[0];
> +
> +	if (dpu_enc->disp_info.intf_type == INTF_DSI)
> +		return msm_dsi_get_dsc_config(priv->dsi[index]);
> +
> +	return NULL;
> +}
> +
>   static struct msm_display_topology dpu_encoder_get_topology(
>   			struct dpu_encoder_virt *dpu_enc,
>   			struct dpu_kms *dpu_kms,
>   			struct drm_display_mode *mode,
> -			struct drm_crtc_state *crtc_state)
> +			struct drm_crtc_state *crtc_state,
> +			struct drm_dsc_config *dsc)
>   {
>   	struct msm_display_topology topology = {0};
>   	int i, intf_count = 0;
> @@ -579,7 +592,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   
>   	topology.num_intf = intf_count;
>   
> -	if (dpu_enc->dsc) {
> +	if (dsc) {
>   		/*
>   		 * In case of Display Stream Compression (DSC), we would use
>   		 * 2 DSC encoders, 2 layer mixers and 1 interface
> @@ -605,6 +618,7 @@ static int dpu_encoder_virt_atomic_check(
>   	struct drm_display_mode *adj_mode;
>   	struct msm_display_topology topology;
>   	struct dpu_global_state *global_state;
> +	struct drm_dsc_config *dsc;
>   	int i = 0;
>   	int ret = 0;
>   
> @@ -640,7 +654,9 @@ static int dpu_encoder_virt_atomic_check(
>   		}
>   	}
>   
> -	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
> +	dsc = dpu_encoder_get_dsc_config(drm_enc);
> +
> +	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
>   
>   	/*
>   	 * Release and Allocate resources on every modeset
> @@ -1056,6 +1072,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   
>   	trace_dpu_enc_mode_set(DRMID(drm_enc));
>   
> +	dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
> +
>   	/* Query resource that have been reserved in atomic check step. */
>   	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>   		drm_enc->base.id, DPU_HW_BLK_PINGPONG, hw_pp,
> @@ -1187,6 +1205,8 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
>   
>   	dpu_enc = to_dpu_encoder_virt(drm_enc);
>   
> +	dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);

Let's have a single place where dpu_enc->dsc is set. I have slight 
preference for atomic_enable, but atomic_mode_set is fine too.

> +
>   	mutex_lock(&dpu_enc->enc_lock);
>   	cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
>   
> @@ -2109,8 +2129,10 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
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

