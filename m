Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9A3A26930
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 01:59:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102D610E011;
	Tue,  4 Feb 2025 00:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S+LqLFdY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352D510E590
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 00:59:26 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-540218726d5so4877392e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 16:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738630764; x=1739235564; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iQu+PcBCYHyEWcLorUNu/krN34Y5N713WyAJdtXWICI=;
 b=S+LqLFdYYZ3mHE75hBhIuw4VcIP9ckoVx5eQLOHJfp0F1MjqkIB3GFwctV64iyD99Q
 o2gQkEFDlfYJaKN3chNpqqPxG11Madk+DYUdNEO4HeCJdTVe99+asg76+sDg34GpkRTd
 Bqw+eTR5JAcRPaBvVz5/yoauIY4p1YscadX7EfP7k7EvOUxY96MPdu2Hzjkm0LMtCh1u
 LqMCXjSpfe9hIUNNrk6uNMTyWXlafr92RLUzc33tzvYxIOlJlZeDFtg88e9G8fyxnf04
 GXr56vBH+l8zbiZfC/2cFB7BLczoFuf8RrI542YjCLQQSnUlSMLpYCOb7DXpmP5qcGrD
 aUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738630764; x=1739235564;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iQu+PcBCYHyEWcLorUNu/krN34Y5N713WyAJdtXWICI=;
 b=rcdIYwAx5k7sKUY4UlUxFStu4ervVj1Szdl3iZM/eDY1KA/7dX0ycB+ASCyNpD01uy
 gpUJWgPN9Rx6iNvYEOdFdNRtpQEeImjwPBh2ajtpJrhIIYGVU0i4FsIlX/jFBZwhEKJK
 ZfEcDh/eH5NnO43nVDiHyOFHCFDkRXoFF+9rLPf4e296ROxqPBEkAAUO9MxXYgV0TD+4
 BM9lVNTlsjXLIh6vhjAJoO1RPdhfhxXzV7+2yZBPRbQXF4krfZyFjbcx6ZqEz1/K2LEz
 NnyM6T2+r3tPS1hBmg8m7MeUA7XTUaq8eYvlHfML3igojMY2G4jwa3aJU53ldM1rxxoC
 pbwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZnD27tyfnzEChijRlv4w/zAmpitcfPf3EYGu21Q77IiQmKW95VV0ChEEyLLGMqPWhKRJK5FNIhtE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydNmHDSQ3UpJK5/ywJ0F964FdOiABNTIIGO6/6YWK8kgSBAImK
 ZThwKDjWXHELmn5ASe21vZTe6m1GUUUp6Nsghs8YPs0rC0aoNb/aRx0pAoJ6IiE=
X-Gm-Gg: ASbGnctWv+wYY0kpcg5YKGDiFE2+diAgBBEbqqeLw+GtPLGCKftsFADkKfV3oZOTcqL
 QWzGwUgqIZEbd+jL3g1TUp6jQ7BGsNvjcbAlwAqpkxc+6fGeVSPSZUWC/n4sYoU/olYZZhEwWKk
 nKHnc8jDrFKvYCId5c8tA/QHsYK+gbJNine/F7SWqb9+JAHFciYufsOS5eoJElTNQoLUefSnTzV
 VQX7KxQ0ya3jBpLhBCgginW3flFaye9QqKTwn4yI3lVTpwZ7FYClmErLSMEgN76lfsZzekCMJ1i
 Jy4bcXof/5N6YEI2/0hhLgXffLySlGcRzeLdrbV9g2Nsq0RHou+Vz9bNzlchrnaQkaENolM=
X-Google-Smtp-Source: AGHT+IE/5jfpsneDUND06UjyJ4Ry6Zih6VLQBI5FGcNFFpcyLlM5QM1i945DtByaC+8TDC003dcEnQ==
X-Received: by 2002:a05:6512:114a:b0:542:8d45:cb4f with SMTP id
 2adb3069b0e04-543e4bdffbcmr6358441e87.1.1738630764308; 
 Mon, 03 Feb 2025 16:59:24 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebdf10e2sm1449566e87.32.2025.02.03.16.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 16:59:22 -0800 (PST)
Date: Tue, 4 Feb 2025 02:59:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/7] drm/msm/hdmi: program HDMI timings during
 atomic_pre_enable
Message-ID: <na7jgb5leqbugi6a6xkfz3nl6mp7li4oevfevhjmo5y4v7eot6@fsmfv52u2rtz>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
 <20250124-bridge-hdmi-connector-v6-2-1592632327f7@linaro.org>
 <7fbfc7d5-f6bb-4f99-914a-f91bb7d153fd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fbfc7d5-f6bb-4f99-914a-f91bb7d153fd@quicinc.com>
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

On Mon, Feb 03, 2025 at 11:34:00AM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/24/2025 1:47 PM, Dmitry Baryshkov wrote:
> > The mode_set callback is deprecated, it doesn't get the
> > drm_bridge_state, just mode-related argumetns. Also Abhinav pointed out
> > that HDMI timings should be programmed after setting up HDMI PHY and
> > PLL. Rework the code to program HDMI timings at the end of
> > atomic_pre_enable().
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 23 +++++++++++++++--------
> >   1 file changed, 15 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > index d839c71091dcdc3b020fcbba8d698d58ee7fc749..d5ab1f74c0e6f47dc59872c016104e9a84d85e9e 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > @@ -126,15 +126,26 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
> >   	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
> >   }
> > +static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
> > +					       const struct drm_display_mode *mode);
> >   static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> >   					      struct drm_bridge_state *old_bridge_state)
> >   {
> > +	struct drm_atomic_state *state = old_bridge_state->base.state;
> >   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> >   	struct hdmi *hdmi = hdmi_bridge->hdmi;
> >   	struct hdmi_phy *phy = hdmi->phy;
> > +	struct drm_encoder *encoder = bridge->encoder;
> > +	struct drm_connector *connector;
> > +	struct drm_connector_state *conn_state;
> > +	struct drm_crtc_state *crtc_state;
> >   	DBG("power up");
> > +	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
> > +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> > +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> > +
> >   	if (!hdmi->power_on) {
> >   		msm_hdmi_phy_resource_enable(phy);
> >   		msm_hdmi_power_on(bridge);
> > @@ -151,6 +162,8 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> >   	if (hdmi->hdcp_ctrl)
> >   		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
> > +
> > +	msm_hdmi_bridge_atomic_set_timings(hdmi, &crtc_state->adjusted_mode);
> >   }
> 
> This addresses my comment about setting up the HDMI timing registers before
> setting up the timing engine registers.
> 
> But prior to this change, mode_set was doing the same thing as
> msm_hdmi_bridge_atomic_set_timings() which means
> msm_hdmi_bridge_atomic_set_timings() should be called at the beginning of
> pre_enable()?
> 
> The controller is enabled in msm_hdmi_set_mode(). So this should be done
> before that.

In [1] you provided the following order:

1) setup HDMI PHY and PLL
2) setup HDMI video path correctly (HDMI timing registers)
3) setup timing generator to match the HDMI video in (2)
4) Enable timing engine

This means htat msm_hdmi_bridge_atomic_set_timings() should come at the
end of msm_hdmi_bridge_atomic_pre_enable(), not in the beginning /
middle of it.

[1] https://lore.kernel.org/dri-devel/8dd4a43e-d83c-1f36-21ff-61e13ff751e7@quicinc.com/


> 
> >   static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> > @@ -177,17 +190,12 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> >   	}
> >   }
> > -static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
> > -		 const struct drm_display_mode *mode,
> > -		 const struct drm_display_mode *adjusted_mode)
> > +static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
> > +					       const struct drm_display_mode *mode)
> >   {
> > -	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> > -	struct hdmi *hdmi = hdmi_bridge->hdmi;
> >   	int hstart, hend, vstart, vend;
> >   	uint32_t frame_ctrl;
> > -	mode = adjusted_mode;
> > -
> >   	hdmi->pixclock = mode->clock * 1000;
> >   	hstart = mode->htotal - mode->hsync_start;
> > @@ -306,7 +314,6 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
> >   	.atomic_reset = drm_atomic_helper_bridge_reset,
> >   	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
> >   	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
> > -	.mode_set = msm_hdmi_bridge_mode_set,
> >   	.mode_valid = msm_hdmi_bridge_mode_valid,
> >   	.edid_read = msm_hdmi_bridge_edid_read,
> >   	.detect = msm_hdmi_bridge_detect,
> > 

-- 
With best wishes
Dmitry
