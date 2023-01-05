Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B964965EC87
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 14:11:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2080F10E716;
	Thu,  5 Jan 2023 13:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E679310E712
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 13:11:16 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id ay40so28007542wmb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 05:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=epo4NuCr+R0WCc3ZS+TmM2VQF2a+mloAFRnhMBihugE=;
 b=duzWfuiaiDnHSzdqXc0CHu1JETDMs23u6PwEyxrReeZ2pcHD7wg36yyPob3yPiqF79
 p54dRd8VgvKhNpXBOqzbFJi/g/7LyHax6lWVK1NSkr/W7Ij8PDWdyUJy/MzUqA5quR/p
 C2lyEJ1rIOxvNJHCw636pxMWbETY1v5kfnHM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=epo4NuCr+R0WCc3ZS+TmM2VQF2a+mloAFRnhMBihugE=;
 b=Oos8iZbUj4wVwqX1g8Ko2e9F+NKpu1ZO1xOLAo3g72fJ86p6b13Px5izoB9htZjbb1
 N9o1kaUh3wZiAvLuJCcXZ0DiIPkkPZ5URHLA9e5V8JpVkBzo5RD7lrXcG2h63wPVGYZS
 jqtHS1KkyibiUFgpbe0MaaK1T9PsrWIm3ghoATlU2J76gdxePlmTSNbUkhtXQ/VGgDeh
 srED+F/Mkp5TzYEaokqrA8KbX7X9Itqp7EmQ7XsIiLs2bsssNk/FeXlvupRPbT9K4zHr
 PWheFFQujO4OYeorgh00VGz+cOKzMLa3N0s3xSLXNxNJpGfWetkpKEhB6k8zubR6lpru
 foBA==
X-Gm-Message-State: AFqh2kqz66/pkEHh3Wme2/PD+a2bRG/Loe24UCs0AOr6N9rY1voGaUbf
 N4oT+DOqi+LN4JJXDToP/poKAg==
X-Google-Smtp-Source: AMrXdXv/jh051xUt17UFK3vfd0Ya/xZZjvYng3OETahVuoWkb274Fuqt6WI0eN29vKK3LjAETkh/8g==
X-Received: by 2002:a05:600c:1f0e:b0:3cf:497c:c59e with SMTP id
 bd14-20020a05600c1f0e00b003cf497cc59emr37030168wmb.6.1672924275463; 
 Thu, 05 Jan 2023 05:11:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c358300b003d1f2c3e571sm2634955wmq.33.2023.01.05.05.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 05:11:14 -0800 (PST)
Date: Thu, 5 Jan 2023 14:11:12 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Subject: Re: [PATCH v9 08/15] drm/bridge: add psr support for panel bridge
 callbacks
Message-ID: <Y7bMcLHr79uhfJv2@phenom.ffwll.local>
Mail-Followup-To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, quic_khsieh@quicinc.com,
 dianders@chromium.org, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@linaro.org, quic_aravindh@quicinc.com,
 swboyd@chromium.org
References: <1671012352-1825-1-git-send-email-quic_vpolimer@quicinc.com>
 <1671012352-1825-9-git-send-email-quic_vpolimer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1671012352-1825-9-git-send-email-quic_vpolimer@quicinc.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 quic_sbillaka@quicinc.com, dianders@chromium.org, quic_bjorande@quicinc.com,
 quic_vproddut@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 14, 2022 at 03:35:45PM +0530, Vinod Polimera wrote:
> This change will handle the psr entry exit cases in the panel
> bridge atomic callback functions. For example, the panel power
> should not turn off if the panel is entering psr.
> 
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

I think this is all a nice integration of the sr helpers and bridge stuff
and makes sense to me. For the 2 bridge patches and the drm core atomic
patch:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/bridge/panel.c | 48 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 3558cbf..5e77e38 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -113,6 +113,18 @@ static void panel_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>  				struct drm_bridge_state *old_bridge_state)
>  {
>  	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
> +	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
> +	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *old_crtc_state;
> +
> +	crtc = drm_atomic_get_new_crtc_for_encoder(atomic_state, encoder);
> +	if (!crtc)
> +		return;
> +
> +	old_crtc_state = drm_atomic_get_old_crtc_state(atomic_state, crtc);
> +	if (old_crtc_state && old_crtc_state->self_refresh_active)
> +		return;
>  
>  	drm_panel_prepare(panel_bridge->panel);
>  }
> @@ -121,6 +133,18 @@ static void panel_bridge_atomic_enable(struct drm_bridge *bridge,
>  				struct drm_bridge_state *old_bridge_state)
>  {
>  	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
> +	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
> +	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *old_crtc_state;
> +
> +	crtc = drm_atomic_get_new_crtc_for_encoder(atomic_state, encoder);
> +	if (!crtc)
> +		return;
> +
> +	old_crtc_state = drm_atomic_get_old_crtc_state(atomic_state, crtc);
> +	if (old_crtc_state && old_crtc_state->self_refresh_active)
> +		return;
>  
>  	drm_panel_enable(panel_bridge->panel);
>  }
> @@ -129,6 +153,18 @@ static void panel_bridge_atomic_disable(struct drm_bridge *bridge,
>  				struct drm_bridge_state *old_bridge_state)
>  {
>  	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
> +	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
> +	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *new_crtc_state;
> +
> +	crtc = drm_atomic_get_old_crtc_for_encoder(atomic_state, encoder);
> +	if (!crtc)
> +		return;
> +
> +	new_crtc_state = drm_atomic_get_new_crtc_state(atomic_state, crtc);
> +	if (new_crtc_state && new_crtc_state->self_refresh_active)
> +		return;
>  
>  	drm_panel_disable(panel_bridge->panel);
>  }
> @@ -137,6 +173,18 @@ static void panel_bridge_atomic_post_disable(struct drm_bridge *bridge,
>  				struct drm_bridge_state *old_bridge_state)
>  {
>  	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
> +	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
> +	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *new_crtc_state;
> +
> +	crtc = drm_atomic_get_old_crtc_for_encoder(atomic_state, encoder);
> +	if (!crtc)
> +		return;
> +
> +	new_crtc_state = drm_atomic_get_new_crtc_state(atomic_state, crtc);
> +	if (new_crtc_state && new_crtc_state->self_refresh_active)
> +		return;
>  
>  	drm_panel_unprepare(panel_bridge->panel);
>  }
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
