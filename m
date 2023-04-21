Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4B76EA07D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 02:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC1E10ED66;
	Fri, 21 Apr 2023 00:12:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E57610ED65
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 00:12:11 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4ec8133c59eso1024032e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 17:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682035929; x=1684627929;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wfnd8gwg66uWWNFqZoU9vOCkwYs8srEJj3TQoz5dxlo=;
 b=RY1oM4BK/5v0LprVe4rP9faKD0LmsM9Krz6cbm2zFAEGCx531mXEJChnBDKdBqtK+w
 ApaYg5YMvD5ltAJ0db8rfPc0+pYEzXauLWhZ2dJoQQFeXx+XGB4TbaKZr6edKfJeOk5F
 gmtQPxovj+nzakZptSyA6Xt22HpaA8emndhnW4L3DkN5ldmS/V8cC716yaCN1w6tWE08
 XKReL/F6qnqBOm1wUTLL42L0fJufb69ehGL8hfMOljGbHyobKjUULXoxLAndCqb6kfrd
 7M0yOC/n7tAowE+GNf4N6K4vyV4HG0ublkc11RpqBtNC1UAy9/ofLZMO9a+29J5OtLy7
 A2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682035929; x=1684627929;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wfnd8gwg66uWWNFqZoU9vOCkwYs8srEJj3TQoz5dxlo=;
 b=Eh6xt3GskDOiRHxUH+8fQkwRjDyxEipoEfZk20ZaWF2g6+OcvAoAFQEq5rbiX+aXcg
 f1NbTJR9YyQnwMuLXfD/DgJTCig/JNONfOHkbqevt9V6pr8ZPFTCzGFPzhAGi6qaSHar
 HGx3YgkZM77zvCqTWcQM3J445R7JBoph1Pt9imSghUoAUw6CQ63QV7ovtvKxoEt8bO3M
 rXEJCMOWVhFpPxeMOiDOKkLWG8ezaifvvYzTucJd/BpU8BeeECkJ3K5FWxhFvOEn2d1H
 JS/FHpLTb4d2zcp6eQDPa9qrlM5rU1reMaJvb7+Jnyr5vdzInxACb9f7hbYqI4Cg8o0A
 6hKA==
X-Gm-Message-State: AAQBX9cz9t9k9azm17VvBf6XtH+ZdVGUeAerugPqlma7FQ7cR8DP3dMM
 CPMtlZd5jGVl+mTOxJMWLh94Zw==
X-Google-Smtp-Source: AKy350byv3FyqZCdhlmwY2XmCwCEkfsVpS/0QqsRdz0fkwqLkNDUQwU9T8VyZflbSGWut/E0+W1mnw==
X-Received: by 2002:ac2:5195:0:b0:4eb:53f7:a569 with SMTP id
 u21-20020ac25195000000b004eb53f7a569mr944090lfi.63.1682035929486; 
 Thu, 20 Apr 2023 17:12:09 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w14-20020ac25d4e000000b004eed8de597csm375609lfd.32.2023.04.20.17.12.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 17:12:09 -0700 (PDT)
Message-ID: <897af051-aed4-938a-5ab1-c44c967ab02d@linaro.org>
Date: Fri, 21 Apr 2023 03:12:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 3/5] drm/msm/dpu: save dpu topology configuration
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1682033114-28483-1-git-send-email-quic_khsieh@quicinc.com>
 <1682033114-28483-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1682033114-28483-4-git-send-email-quic_khsieh@quicinc.com>
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
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2023 02:25, Kuogee Hsieh wrote:
> At current implementation, topology configuration is thrown away after
> dpu_rm_reserve(). This patch save the topology so that it can be used
> for DSC related calculation later.

Please take a look at 
https://patchwork.freedesktop.org/patch/527960/?series=115283&rev=2 .

> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 ++++++++++++++---------------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index ecb87bc..2fdacf1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -542,13 +542,13 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>   	return (num_dsc > 0) && (num_dsc > intf_count);
>   }
>   
> -static struct msm_display_topology dpu_encoder_get_topology(
> +static void dpu_encoder_get_topology(
>   			struct dpu_encoder_virt *dpu_enc,
>   			struct dpu_kms *dpu_kms,
>   			struct drm_display_mode *mode,
> -			struct drm_crtc_state *crtc_state)
> +			struct drm_crtc_state *crtc_state,
> +			struct msm_display_topology *topology)
>   {
> -	struct msm_display_topology topology = {0};
>   	int i, intf_count = 0;
>   
>   	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
> @@ -567,16 +567,16 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   	 * Add dspps to the reservation requirements if ctm is requested
>   	 */
>   	if (intf_count == 2)
> -		topology.num_lm = 2;
> +		topology->num_lm = 2;
>   	else if (!dpu_kms->catalog->caps->has_3d_merge)
> -		topology.num_lm = 1;
> +		topology->num_lm = 1;
>   	else
> -		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
> +		topology->num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>   
>   	if (crtc_state->ctm)
> -		topology.num_dspp = topology.num_lm;
> +		topology->num_dspp = topology->num_lm;
>   
> -	topology.num_intf = intf_count;
> +	topology->num_intf = intf_count;
>   
>   	if (dpu_enc->dsc) {
>   		/*
> @@ -585,12 +585,10 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   		 * this is power optimal and can drive up to (including) 4k
>   		 * screens
>   		 */
> -		topology.num_dsc = 2;
> -		topology.num_lm = 2;
> -		topology.num_intf = 1;
> +		topology->num_dsc = 2;
> +		topology->num_lm = 2;
> +		topology->num_intf = 1;
>   	}
> -
> -	return topology;
>   }
>   
>   static int dpu_encoder_virt_atomic_check(
> @@ -602,7 +600,7 @@ static int dpu_encoder_virt_atomic_check(
>   	struct msm_drm_private *priv;
>   	struct dpu_kms *dpu_kms;
>   	struct drm_display_mode *adj_mode;
> -	struct msm_display_topology topology;
> +	struct msm_display_topology *topology;
>   	struct dpu_global_state *global_state;
>   	int i = 0;
>   	int ret = 0;
> @@ -639,7 +637,9 @@ static int dpu_encoder_virt_atomic_check(
>   		}
>   	}
>   
> -	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
> +	topology = &dpu_enc->topology;
> +	memset(topology, 0, sizeof (*topology));
> +	dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, topology);
>   
>   	/*
>   	 * Release and Allocate resources on every modeset
> @@ -650,7 +650,7 @@ static int dpu_encoder_virt_atomic_check(
>   
>   		if (!crtc_state->active_changed || crtc_state->enable)
>   			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> -					drm_enc, crtc_state, topology);
> +					drm_enc, crtc_state, *topology);
>   	}
>   
>   	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);

-- 
With best wishes
Dmitry

