Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 030FCA2B7BC
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 02:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C889010E9CB;
	Fri,  7 Feb 2025 01:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t2mxUpKS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9AB10E9CF
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 01:19:57 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53f22fd6832so1763051e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 17:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738891196; x=1739495996; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jR7G4bjSs75agGdo58DpWlgOrV5xySB61UFyh6B/Njo=;
 b=t2mxUpKSsjkeLqtxLZ4EHwl47ZKD8Flf+SjDnfeS8pIoLWfNzokMMLP0RHzH7ks83D
 H9fJbPLiUmUGVdDCgqatNkLcDTWvpbjPjsUhrdQyiIRqrDMlOq3GBs0TlNmQ46ywywht
 /9VNtqGZtCWRa73w6PNV9yn9SXl7lb+tyFtDpKi8c+e9/I+gP9Bfq8WWo5MUCJcMJxAG
 G/e4kuZqV84wdjDmEu812CfhROhNj7o7u1V0bWwqIWEuS0qS5JMRGRjtsjhtQ4KElMlr
 OjZuep9mAUdTe7UYadYv2QIvdLrgE9NSJ8Oz33zXRmBidZP77nqC4tVVBTpbPBnHwQvb
 SzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738891196; x=1739495996;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jR7G4bjSs75agGdo58DpWlgOrV5xySB61UFyh6B/Njo=;
 b=addnYMjuIuyeRCNy9u/lS7GdBFi/ZlnNkjgGw4hGVP04ypYFknzUyGEjFw8/NlObkB
 eylaOEsyRAHr/3ayUbdNBoyyNjJTZSJJM9rAlwdQ6PU5LxAG7+gB/LeeUunhj4GwO4gi
 JYd+tnSiCbmnCBXmUZnL28UuDVAQpID+M0vDK9k8WgxLJKGXcTohkbESBG2ITFD44qJl
 qmBwTt2xO7VzkX3LV8rR/O09HJcYSRLqKGXUpQnc8Wvw/C2bVH0W793f+hF04Q2B3r0/
 4fxPAFR20TOTDora7Rks/Qv84H7tLfyKcJ7VryajYz+iJvjVngDt8kpMjGc8O868ikcn
 9sUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIt/CKESckyPhM3y51+GYmLxaOtgDBuT/zq5Q3SeBVSUPb40GAVEAvKosJSJN0UAUJf5fszEiS2GA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZgIpi0GZu5woDjYdhBQ4iNvW7eVR4rKG7rnhOgzUsiedi62DJ
 JsO8os1sVa64x5G4xfpYqeaIf5Pkwj+Mn+rpcMLuhhldRY5s6lgyT0gz/bpfzQA=
X-Gm-Gg: ASbGncserO0Z9uDJtlji80uGO1ZaWS8839e4CTfDtQ6jwRPcD/c5PrUtjYUsc20xCZ+
 r8njbUNueSniaUcLtteoJHMPSHxyF45aslQZczH1Mku8KEjhE/DbNZ6pqtkkAgKKhoyb3B325hI
 TZleby6up0yyKCVPfhOruC3zmQwudQcJwLyPGk2yGJFkVOJ7K6+RcMgAxnaZzDhc7rlSZrbQ9ve
 3xduroe7aR6JIVRWGH2gUhR/i7C3gvGac5UkBB+oew2fYe4IY/Ly+TsVIZ56jrlo7cWzXYVJ41b
 BzUn3ZcdFzDiopAsKF849Nm12APBqk1Uy9RlSIz81QBQsJfFNL5mM0j8ZCADU66zqSNHOlk=
X-Google-Smtp-Source: AGHT+IGzkRVzaNXC0CL9KdL08++NyesGqxNAQYUMTfafBH2nZwBMw9jHYCswmGLhqdEzxoG/iLL+kQ==
X-Received: by 2002:a05:6512:159e:b0:540:1abe:d6d2 with SMTP id
 2adb3069b0e04-54414ae0d71mr280840e87.35.1738891196095; 
 Thu, 06 Feb 2025 17:19:56 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441053eb99sm285940e87.22.2025.02.06.17.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 17:19:54 -0800 (PST)
Date: Fri, 7 Feb 2025 03:19:53 +0200
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
Message-ID: <fgzcd4gm4uriqbpslh7arfyxjvzyxrck3f2uuv4mhkvcbkdmvm@b2pz5vmmqs3l>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
 <20250124-bridge-hdmi-connector-v6-2-1592632327f7@linaro.org>
 <7fbfc7d5-f6bb-4f99-914a-f91bb7d153fd@quicinc.com>
 <na7jgb5leqbugi6a6xkfz3nl6mp7li4oevfevhjmo5y4v7eot6@fsmfv52u2rtz>
 <1b98265e-8766-4504-b374-f7af8203c926@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b98265e-8766-4504-b374-f7af8203c926@quicinc.com>
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

On Thu, Feb 06, 2025 at 12:41:30PM -0800, Abhinav Kumar wrote:
> 
> 
> On 2/3/2025 4:59 PM, Dmitry Baryshkov wrote:
> > On Mon, Feb 03, 2025 at 11:34:00AM -0800, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 1/24/2025 1:47 PM, Dmitry Baryshkov wrote:
> > > > The mode_set callback is deprecated, it doesn't get the
> > > > drm_bridge_state, just mode-related argumetns. Also Abhinav pointed out
> > > > that HDMI timings should be programmed after setting up HDMI PHY and
> > > > PLL. Rework the code to program HDMI timings at the end of
> > > > atomic_pre_enable().
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >    drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 23 +++++++++++++++--------
> > > >    1 file changed, 15 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > index d839c71091dcdc3b020fcbba8d698d58ee7fc749..d5ab1f74c0e6f47dc59872c016104e9a84d85e9e 100644
> > > > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > @@ -126,15 +126,26 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
> > > >    	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
> > > >    }
> > > > +static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
> > > > +					       const struct drm_display_mode *mode);
> > > >    static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> > > >    					      struct drm_bridge_state *old_bridge_state)
> > > >    {
> > > > +	struct drm_atomic_state *state = old_bridge_state->base.state;
> > > >    	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> > > >    	struct hdmi *hdmi = hdmi_bridge->hdmi;
> > > >    	struct hdmi_phy *phy = hdmi->phy;
> > > > +	struct drm_encoder *encoder = bridge->encoder;
> > > > +	struct drm_connector *connector;
> > > > +	struct drm_connector_state *conn_state;
> > > > +	struct drm_crtc_state *crtc_state;
> > > >    	DBG("power up");
> > > > +	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
> > > > +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> > > > +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> > > > +
> > > >    	if (!hdmi->power_on) {
> > > >    		msm_hdmi_phy_resource_enable(phy);
> > > >    		msm_hdmi_power_on(bridge);
> > > > @@ -151,6 +162,8 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> > > >    	if (hdmi->hdcp_ctrl)
> > > >    		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
> > > > +
> > > > +	msm_hdmi_bridge_atomic_set_timings(hdmi, &crtc_state->adjusted_mode);
> > > >    }
> > > 
> > > This addresses my comment about setting up the HDMI timing registers before
> > > setting up the timing engine registers.
> > > 
> > > But prior to this change, mode_set was doing the same thing as
> > > msm_hdmi_bridge_atomic_set_timings() which means
> > > msm_hdmi_bridge_atomic_set_timings() should be called at the beginning of
> > > pre_enable()?
> > > 
> > > The controller is enabled in msm_hdmi_set_mode(). So this should be done
> > > before that.
> > 
> > In [1] you provided the following order:
> > 
> > 1) setup HDMI PHY and PLL
> > 2) setup HDMI video path correctly (HDMI timing registers)
> > 3) setup timing generator to match the HDMI video in (2)
> > 4) Enable timing engine
> > 
> > This means htat msm_hdmi_bridge_atomic_set_timings() should come at the
> > end of msm_hdmi_bridge_atomic_pre_enable(), not in the beginning /
> > middle of it.
> > 
> > [1] https://lore.kernel.org/dri-devel/8dd4a43e-d83c-1f36-21ff-61e13ff751e7@quicinc.com/
> > 
> 
> Sequence given is correct and is exactly what is given in the docs. What is
> somewhat not clear in the docs is the location of the enable of the HDMI
> controller. This is not there in the above 4 steps. I am referring to the
> enable bit being programmed in msm_hdmi_set_mode(). Ideally till we enable
> the timing engine, it should be okay but what I wanted to do was to keep the
> msm_hdmi_set_mode() as the last call in this function that way we program
> everything and then enable the controller.
> 
> This can be done in either way, move it to the beginning of the function or
> move it right before msm_hdmi_set_mode(). I had suggested beginning because
> thats how it was when things were still in mode_set.

Well.. following your description it might be better to put it after PHY
init. What do you think?

-- 
With best wishes
Dmitry
