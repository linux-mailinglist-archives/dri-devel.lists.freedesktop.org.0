Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C2D68195B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 19:36:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E802910E111;
	Mon, 30 Jan 2023 18:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF1510E0C3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 18:36:37 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id y11so11904740edd.6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 10:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cZhLOD9IjFhT2rw5mFVQaRWDwbDZlqozjoeDC3b7Esw=;
 b=N1dmJr/r8/XSvyoUxRNc2HjR0kOQkzvm2Ls4s4KX7nE03ug0BnSqPpeXukRW1nGVGO
 mUNRdd4Pgm344uL3hROdKa9/JQoe/K9mDXJEiqYLeKq64hBwquTI6wAy7No2AYzt8VYp
 f/43I6o4AvhVx/LkESOysg0UhYz9vKsX4N5uF2J46mZTTLdCfLSDC9xTGSu7WRvCebeG
 7rdw9mYyXqXClvmJkPy845MjgFT8wMU6Hn3UJKSpJ7bMMJIBGwEwRSmgIjY+AyKb5H8A
 mX3OQI4Nl6yFKOvE9PV46OQ4XGBvUib7ghHLBkTf81y6X3LJ+/c0Gno1SfrdAIyOyca6
 N6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cZhLOD9IjFhT2rw5mFVQaRWDwbDZlqozjoeDC3b7Esw=;
 b=FTBv79mhvwWSdwvDEvpOJr5UO6d3NDRwRIUgsfkSqJmUvoV5YjLEwGZM60oZExUZuS
 CgIMb7c6JNpYAkFDIhFknFR27mMyo/EMrQ4H/Nhh70nI0NtrblX002PQs4vlrMWXUcJw
 omnrs4plM6MsksD/hqmW2ImbSNKr0R2/n+8N4Wd/hYAe8+V8EFlQdoxdSEWqwBCg386w
 12XBsPganMK1CbFtSCOO0IrCZJ4cy9cQZkM45K1a+Q3NhaQEKCZPOKwifWRS5x0vlWzW
 Mu1WuKOCv2kpezcFc2rUe5wZDMX8+Ksq118rTavpZRgX6TeMD7Flwhe6uJYLZktlDOEW
 HtVQ==
X-Gm-Message-State: AFqh2kqZG/V2I5Sq+n5kQU9+Gvau8gqRX1lPB22BNnYDNtiLwEfO9FNs
 YlBL/2GzPL06PvCXhnl3RJgmqg==
X-Google-Smtp-Source: AMrXdXvR5Q6KvIhrUEwYGvqNhBkWgrUuFEJSdmc3ZGDzFQa57T8TClhZRDJYjAW55lqTmNIGI4NywQ==
X-Received: by 2002:a05:6402:298e:b0:496:6a20:6b61 with SMTP id
 eq14-20020a056402298e00b004966a206b61mr57790399edb.22.1675103796373; 
 Mon, 30 Jan 2023 10:36:36 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 fd22-20020a056402389600b004a1d4142543sm5937753edb.27.2023.01.30.10.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 10:36:35 -0800 (PST)
Message-ID: <e9b238af-28dd-f38e-24e3-4065c39d4e25@linaro.org>
Date: Mon, 30 Jan 2023 20:36:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [v1 2/3] drm/msm/disp/dpu1: add dspps into reservation if there
 is a ctm request
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1675092092-26412-1-git-send-email-quic_kalyant@quicinc.com>
 <1675092092-26412-3-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1675092092-26412-3-git-send-email-quic_kalyant@quicinc.com>
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

On 30/01/2023 17:21, Kalyan Thota wrote:
> Add dspp blocks into the topology for reservation, if there is a ctm
> request for that composition.
> 
> Changes in v1:
> - Minor nits (Dmitry)
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 9c6817b..3bd46b4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -545,7 +545,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>   static struct msm_display_topology dpu_encoder_get_topology(
>   			struct dpu_encoder_virt *dpu_enc,
>   			struct dpu_kms *dpu_kms,
> -			struct drm_display_mode *mode)
> +			struct drm_display_mode *mode,
> +			struct drm_crtc_state *crtc_state)
>   {
>   	struct msm_display_topology topology = {0};
>   	int i, intf_count = 0;
> @@ -573,11 +574,9 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   	else
>   		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>   
> -	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> -		if (dpu_kms->catalog->dspp &&
> -			(dpu_kms->catalog->dspp_count >= topology.num_lm))
> -			topology.num_dspp = topology.num_lm;
> -	}
> +	if (dpu_kms->catalog->dspp &&
> +	    crtc_state->ctm && (dpu_kms->catalog->dspp_count >= topology.num_lm))

This condition doesn't look correct anymore for the following reasons:
- if there are no DSPPs we will completely ignore the ctm property
- if there are not enough DSPPs, the CTM property will be ignore

I think, this should be just:

if (crtc_state->ctm)
     topology.num_dspp = topology.num_lm;




> +		topology.num_dspp = topology.num_lm;
>   
>   	topology.num_enc = 0;
>   	topology.num_intf = intf_count;
> @@ -643,7 +642,7 @@ static int dpu_encoder_virt_atomic_check(
>   		}
>   	}
>   
> -	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
> +	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
>   
>   	/* Reserve dynamic resources now. */
>   	if (!ret) {

-- 
With best wishes
Dmitry

