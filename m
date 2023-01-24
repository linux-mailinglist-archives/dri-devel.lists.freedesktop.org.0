Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD35678CDE
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 01:30:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261AE10E00C;
	Tue, 24 Jan 2023 00:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252F310E00C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 00:30:37 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id u19so34953062ejm.8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 16:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dueIyUaxNeNEFPj/GQDJydit6xe2M3dnJNE9fhHc1lA=;
 b=mNRl6IenhY+hUGyDvtML/z40vf/CJaTsZPxzMKW0GRLUJSJOI1aHOheSt4Bb9WGY6w
 Y0xYhlA5eiNoJkYXm+6WKBKu8rid7O4Yz5jxDilZFzZj7PL3uJkIiJRnG98V+TfJB9qu
 zlKtrVH+MGMm6LiOqlEeqT6Z8hxwFWRkklEIAtE2OiD1sULY3wIe8lOHBr9zw/0rGp4j
 y6ol0ZTjPQaXF764lyiP1kLOXM5I+GyR1yD92i0EzHc3wdn542XJFJxix+wrv8O5bCyw
 SZmU2llOLZCuyGW1FUsa/ezZBv/aBk/O+bRzGk8HNmRZ78v15UWNFcVIyEB/DnfGV1I0
 D9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dueIyUaxNeNEFPj/GQDJydit6xe2M3dnJNE9fhHc1lA=;
 b=KNZmaid69O2fstzjQdhsvxY5LbG8YAyWzkgXNVpB9x4dpjVQB3yK0Rmv1ENBzbvUjX
 Nh78b7CE3mgvgiD/gmJaDwvHRh4r6uC/XFqWCc7pL+v9qoMOg9p8ukyB9LuZvT9BkaNw
 yX8aYB+aCORUvU0YPPh3NT4FiObL8kVl91XZZjpy5j8Eu0lTE5SSL+F7RjQPEzLd3A3a
 6O41g57Aw4iUF4Mi0KxmxjtazikgBoAvifChqDdGzgMmn/RQExGd8g1sq/dToNoPn6qe
 v1cHMGPzaD0Zne6h7oLXF54ublDw9tLpsgY7t33C2ctJnMTzK7NfXoh6cT2bDShQXAw8
 vjzg==
X-Gm-Message-State: AFqh2kqNyuSesW5Jby6owF0lA8hbr7OFA/wNVAWjsbE5GoUAsdU/M0Pw
 rY60xxq5+Zl///WPaElDeDXHzA==
X-Google-Smtp-Source: AMrXdXuIIDNKUFBEqpNOMIYRRAezfeG1WZEFtg71deB0wBVkk/t8NtTqVDc/QBnN3FR/a8Sg+XDe1g==
X-Received: by 2002:a17:907:94ce:b0:870:ab89:3dd3 with SMTP id
 dn14-20020a17090794ce00b00870ab893dd3mr31844473ejc.70.1674520235673; 
 Mon, 23 Jan 2023 16:30:35 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 fq32-20020a1709069da000b0083f91a32131sm154483ejc.0.2023.01.23.16.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 16:30:35 -0800 (PST)
Message-ID: <db1e407c-8dd6-733f-e52d-55a1f9e43d6f@linaro.org>
Date: Tue, 24 Jan 2023 02:30:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH Resend v11 15/15] drm/msm/disp/dpu: update dpu_enc crtc
 state on crtc enable/disable during self refresh
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1674138393-475-1-git-send-email-quic_vpolimer@quicinc.com>
 <1674138393-475-16-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1674138393-475-16-git-send-email-quic_vpolimer@quicinc.com>
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
 quic_khsieh@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/01/2023 16:26, Vinod Polimera wrote:
> Populate the enocder software structure to reflect the updated
> crtc appropriately during crtc enable/disable for a new commit
> while taking care of the self refresh transitions when crtc
> disable is triggered from the drm self refresh library.
> 
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 31 ++++++++++++++++++++++++++-----
>   1 file changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index d513aeb4..e8e456a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1013,14 +1013,23 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>   									      crtc);
>   	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>   	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
> -	struct drm_encoder *encoder;
> +	struct drm_encoder *encoder = NULL;

Why is this chunk necessary?

>   	unsigned long flags;
>   	bool release_bandwidth = false;
>   
>   	DRM_DEBUG_KMS("crtc%d\n", crtc->base.id);
>   
> -	if (old_crtc_state->self_refresh_active)
> +	/* If disable is triggered while in self refresh mode,
> +	 * reset the encoder software state so that in enable
> +	 * it won't trigger a warn while assigning crtc.
> +	 */
> +	if (old_crtc_state->self_refresh_active) {
> +		drm_for_each_encoder_mask(encoder, crtc->dev,
> +					old_crtc_state->encoder_mask) {
> +			dpu_encoder_assign_crtc(encoder, NULL);
> +		}
>   		return;
> +	}
>   
>   	/* Disable/save vblank irq handling */
>   	drm_crtc_vblank_off(crtc);
> @@ -1033,7 +1042,14 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>   		 */
>   		if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_VIDEO)
>   			release_bandwidth = true;
> -		dpu_encoder_assign_crtc(encoder, NULL);
> +
> +		/*
> +		 * If disable is triggered during psr active(e.g: screen dim in PSR),
> +		 * we will need encoder->crtc connection to process the device sleep &
> +		 * preserve it during psr sequence.
> +		 */
> +		if (!crtc->state->self_refresh_active)
> +			dpu_encoder_assign_crtc(encoder, NULL);
>   	}
>   
>   	/* wait for frame_event_done completion */
> @@ -1081,6 +1097,9 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
>   	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>   	struct drm_encoder *encoder;
>   	bool request_bandwidth = false;
> +	struct drm_crtc_state *old_crtc_state;
> +
> +	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
>   
>   	pm_runtime_get_sync(crtc->dev->dev);
>   
> @@ -1103,8 +1122,10 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
>   	trace_dpu_crtc_enable(DRMID(crtc), true, dpu_crtc);
>   	dpu_crtc->enabled = true;
>   
> -	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
> -		dpu_encoder_assign_crtc(encoder, crtc);
> +	if (!old_crtc_state->self_refresh_active) {
> +		drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
> +			dpu_encoder_assign_crtc(encoder, crtc);
> +	}
>   
>   	/* Enable/restore vblank irq handling */
>   	drm_crtc_vblank_on(crtc);

-- 
With best wishes
Dmitry

