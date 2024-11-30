Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A129DEF68
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 09:42:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2E110E230;
	Sat, 30 Nov 2024 08:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GryLLEO5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35A010E230
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 08:42:21 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53df67d6659so4169709e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 00:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732956140; x=1733560940; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YiTdOQTmKQnnT3u/vRpmnx3kA75mK1aPDkrsIIBxJq8=;
 b=GryLLEO5qRrED5qZmJuQviVlotW2Qi2woC2thHY16Qvf+z8ssU3UFzO/bRJnf63cuK
 ZfoX0BAT7xNrCftzCwwJZHPcsBOBYXKuNH6K4Hc95JZ+H4EGDLKc+WqWRrz+GJvjJyYg
 5fiTtc0e0PErERrvJQT2ljRbedFave8/GVX9ZCxuM9sVbz4Deh86HR8/EZlBL082JyYV
 Kk6NQm95nQCmKRVp4Y647oR5ljCAK9h/SDFr2PF+FTVHIQq166lbEwxbaqi9WHWhhTP2
 iVmZrlTSqMoq2nBqiFFYfQc5uqMgm36uigRyPHxRpLK62LReDrahCFW+5jkAVZsVM4Bs
 RnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732956140; x=1733560940;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YiTdOQTmKQnnT3u/vRpmnx3kA75mK1aPDkrsIIBxJq8=;
 b=wuKHll5Vr6dmqIdiYjzAfaozkYu4uT7ie3ry7MXR09UQ73NzledrvHMkobxTBlOB+W
 pODGlWcbGRWQu2MIikhy3UpF9BjNLlKLRvmdsCxLp0QIbnOX+w/mU2WkOlRPlEA7TF/N
 A3UbG0L1uLrW0Gttb1aMOaWlR6pGaw9mv5NqNgDFRICFUqmfXiCcZDp65IwmYo9bdOX3
 ZAbDObM483g17bokZwYJzzXUQzclnv7ruaHy3udFtllh1u1hIBnYtMFC4pKqGUBb/d6T
 KUmvjfEj1M9MkQ3NjpdUp7o5mhz0x7G9vd/JeXcoaNxhneaF6XfsvKAmk6/eaBVVvXai
 jvMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWULyH1UsClAis9mS3DS4MA2CQoTNKsw1VsKQg/lwWZVXeQDAv0x9Ml9KfaBYuW7YsYNwuDjUOUmno=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyH/tqNEZR8564ZAU4vS4HGAnUhDXzGqZPKoklaAMU30GwxAbdr
 BelkJZQFUD771pVNzRSqBspc+vh8glaYYCFODIkpWnw+wHXIb65ct8dIZBuZquU=
X-Gm-Gg: ASbGncu17hAznnkoQ7yCzbi2bmlxHfzQpErWo7ieJKHry5c7QNA1ZKSv/Sl24mlEpNL
 6DNv2coNMa3CxPjCu+cNDiP+qnd/3Bugtk+fSYXvBYnUFYdWVu3EzCF1nmb/LELzSYr0U2jCeVI
 L8u0GYZbvopf/omFTLn4AIhDO/z4VUx06m93+E6egLT4iTO9UjvNeJrMK1JuY0PRB3dG8FzmB3o
 6VUuwUSGrtRrvor60kO3klahOMDO2G0W3H0L0seNYU7WMtl7rbHCC1PV3cqj4+U8ZtL4RzDLSDk
 unqxTulxqZUKhqmwRAla1aLm8yteIw==
X-Google-Smtp-Source: AGHT+IEEK8CkCTOvlO09efgwBx3bMcY5gfcm8u1qQfaMXFvzGemWDXqn9wPa62U3AOMv1mmqMOAitQ==
X-Received: by 2002:a05:6512:3e23:b0:53d:e5fd:a453 with SMTP id
 2adb3069b0e04-53df010b140mr13875507e87.39.1732956139957; 
 Sat, 30 Nov 2024 00:42:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df64433b2sm700166e87.86.2024.11.30.00.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 00:42:18 -0800 (PST)
Date: Sat, 30 Nov 2024 10:42:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/connector: hdmi: Evaluate limited range after
 computing format
Message-ID: <y266o2w6xu4wlqdlyckfaxjze7d45qi4f7qlv2ivkbzoi4jh3o@nj5t53pusxjj>
References: <20241130-hdmi-conn-yuv-v1-0-254279a08671@collabora.com>
 <20241130-hdmi-conn-yuv-v1-1-254279a08671@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241130-hdmi-conn-yuv-v1-1-254279a08671@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 30, 2024 at 01:56:32AM +0200, Cristian Ciocaltea wrote:
> Evaluating the requirement to use a limited RGB quantization range
> involves a verification of the output format, among others, but this is
> currently performed before actually computing the format, hence relying
> on the old connector state.
> 
> Move the call to hdmi_is_limited_range() after hdmi_compute_config() to
> ensure the verification is done on the updated output format.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Fixes: 027d43590649 ("drm/connector: hdmi: Add RGB Quantization Range to the connector state")

> 
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> index feb7a3a759811aed70c679be8704072093e2a79b..0cbcee7e77cd8dff387044487ce28ee5748f5587 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -494,12 +494,12 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
>  		connector_state_get_mode(new_conn_state);
>  	int ret;
>  
> -	new_conn_state->hdmi.is_limited_range = hdmi_is_limited_range(connector, new_conn_state);
> -
>  	ret = hdmi_compute_config(connector, new_conn_state, mode);
>  	if (ret)
>  		return ret;
>  
> +	new_conn_state->hdmi.is_limited_range = hdmi_is_limited_range(connector, new_conn_state);
> +
>  	ret = hdmi_generate_infoframes(connector, new_conn_state);
>  	if (ret)
>  		return ret;
> 
> -- 
> 2.47.0
> 

-- 
With best wishes
Dmitry
