Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 171A2A2D393
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 04:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE0D10E2C6;
	Sat,  8 Feb 2025 03:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dWHs1kHe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F2210E2C6
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 03:50:03 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-30738a717ffso24762561fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 19:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738986602; x=1739591402; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NUuRY+SGQqkiJGXQ8h6Ofym4ZEB8QVsdwYk0m4YJyac=;
 b=dWHs1kHeVQF2x9r1Hd8YH//D4LF3k2Ff6wcNqD4Axc9Fuez7FqQAfCm4O/W0ZhxSwH
 9mzoxIDgvGwICzMDHW/29RcjDzDsRaTASH8AMEMNrIUbmtjly+DiXqWuWEeRQQqAvt21
 uoWj9ZBVyTAiyvp+1/5bNrOGgDgdDu7dpi8NZEEkIn42yDWfp5rFuJTn0YJMycsIwtnt
 j0jaFC+rpehgweCKVS8qkrqtewXVLujC9bFU7iLqNUl8Tvq8zjwVujzwwD1w3emPB34v
 PSstc50h8QtGhkU/izJJGLFeMykFYH/JQTybPU45PPnBENhf4BqsS3DQsEr7xVDdUQOn
 H1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738986602; x=1739591402;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NUuRY+SGQqkiJGXQ8h6Ofym4ZEB8QVsdwYk0m4YJyac=;
 b=kpt0z/Lgo6o3FOAVXmknPC9hlY/KnhMsrn1ZK8udH5zUK5TTrS7uxCHM4MQ22X1jy2
 qFCxc6RNEFLw2gM2BuiHvSw/II10y5mQjfpXj4DJCJfUhbYEo8OaLOFFVxqBGLBk1USV
 KeF3oFb9W8sdvnWN209WNNzgIqjZP9HlmW1/qmkKV/sfiIG3bfzneW5orPBSukkpJKxP
 IN45o2NKWoNF1czxAAJ9zgx7JsbGr+0jaHTnRyrsxum7kYcrFFm+tvDvVDFa1pT54aUd
 P+s6ruTVS0NzegsbUP1tGALTQfXQmdzhJrAN5LybSM3D11P6WN3bj1Br9+6IAiswE+Yp
 LEyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKCsiJu6SrYsCxZgAAAjD3NBt+c5JcQus+qVnq7gR19Bt3J+tIxYD1KMgELCWtVmhkxbLsFcf9zsU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmK1VyiSA2GMca6rGqYpAyftwhgXUn+aWUYBxSTfXet2t64sHv
 mR7vlLq8r4wezWNfyxUzafa5CeAO15IrRLumbyXgnSvgc5usb20Rb1DrwcSlbe4=
X-Gm-Gg: ASbGncvKKtSQTzhH6KiHWC3s1AD8zfucOTt+tzdwDip+fMCAhhDZ2HIVDcNz+2KXIuS
 u6vfxdL+g8J25YlA59D0SOjAXxexIy0gojhKVWRie/OsYgEusdtJh22TQbfhtQ/n6NpWbkBSLuu
 /ilyJ8GqvHIQ3dJlb0hjgfytXlYPZ7UhlYW9iSlgxznLtW9MzVcPpj122BOr3rCg62aL+Gi+o8G
 8z70OorvSw3eulEfSKEROEzGP/M1xJj+lugoxcDoYkJ9rv+vFt0dK3Pq2EDqbr92YEGSixf89SR
 eLFddjwYFqmh/rquRUbNIebCaSfGRiZK0CRQuzWFFIFNaH3nADPRSB2stnNqRKfrDFYCP6k=
X-Google-Smtp-Source: AGHT+IHxa06MWEO0AyRI+e3MMcFW/cLQ8qh1dO9gXzCNcVwPzBIJl1HzogP/eYdm61A/K08gSYzy1A==
X-Received: by 2002:a2e:9147:0:b0:308:860e:d4d3 with SMTP id
 38308e7fff4ca-308860edd40mr13207081fa.22.1738986601810; 
 Fri, 07 Feb 2025 19:50:01 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de2f6995sm5745881fa.107.2025.02.07.19.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 19:50:00 -0800 (PST)
Date: Sat, 8 Feb 2025 05:49:56 +0200
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
Subject: Re: [PATCH v7 2/7] drm/msm/hdmi: program HDMI timings during
 atomic_pre_enable
Message-ID: <irh4phyeaybd42xujkyqos2rpjpkarz5jvymbxhtbmy6l7zz5f@fmov5qqheyg7>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
 <20250208-bridge-hdmi-connector-v7-2-0c3837f00258@linaro.org>
 <cdfa5cfd-6cdf-45cf-ac18-c2c217d4211a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdfa5cfd-6cdf-45cf-ac18-c2c217d4211a@quicinc.com>
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

On Fri, Feb 07, 2025 at 04:42:46PM -0800, Abhinav Kumar wrote:
> 
> 
> On 2/7/2025 4:27 PM, Dmitry Baryshkov wrote:
> > The mode_set callback is deprecated, it doesn't get the
> > drm_bridge_state, just mode-related argumetns. Also Abhinav pointed out
> > that HDMI timings should be programmed after setting up HDMI PHY and
> > PLL. Rework the code to program HDMI timings at the end of
> > atomic_pre_enable().
> > 
> 
> I think now this needs to be changed that, program the HDMI timings at the
> beginning of atomic_pre_enable() to match the location of mode_set()
> 
> With that fixed,

Ack

> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 24 ++++++++++++++++--------
> >   1 file changed, 16 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > index d839c71091dcdc3b020fcbba8d698d58ee7fc749..bd94b3a70f0e5e457a88f089b491103a8c09567b 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > @@ -126,15 +126,29 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
> >   	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
> >   }
> > +static void msm_hdmi_set_timings(struct hdmi *hdmi,
> > +				 const struct drm_display_mode *mode);
> > +
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
> > +	msm_hdmi_set_timings(hdmi, &crtc_state->adjusted_mode);
> > +
> >   	if (!hdmi->power_on) {
> >   		msm_hdmi_phy_resource_enable(phy);
> >   		msm_hdmi_power_on(bridge);
> > @@ -177,17 +191,12 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> >   	}
> >   }
> > -static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
> > -		 const struct drm_display_mode *mode,
> > -		 const struct drm_display_mode *adjusted_mode)
> > +static void msm_hdmi_set_timings(struct hdmi *hdmi,
> > +				 const struct drm_display_mode *mode)
> >   {
> > -	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> > -	struct hdmi *hdmi = hdmi_bridge->hdmi;
> >   	int hstart, hend, vstart, vend;
> >   	uint32_t frame_ctrl;
> > -	mode = adjusted_mode;
> > -
> >   	hdmi->pixclock = mode->clock * 1000;
> >   	hstart = mode->htotal - mode->hsync_start;
> > @@ -306,7 +315,6 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
> >   	.atomic_reset = drm_atomic_helper_bridge_reset,
> >   	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
> >   	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
> > -	.mode_set = msm_hdmi_bridge_mode_set,
> >   	.mode_valid = msm_hdmi_bridge_mode_valid,
> >   	.edid_read = msm_hdmi_bridge_edid_read,
> >   	.detect = msm_hdmi_bridge_detect,
> > 
> 

-- 
With best wishes
Dmitry
