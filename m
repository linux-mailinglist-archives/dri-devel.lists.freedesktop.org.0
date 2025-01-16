Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4D1A138F1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 12:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A560E10E930;
	Thu, 16 Jan 2025 11:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="VkSeJ59e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5E210E930
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 11:27:41 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso4649495e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 03:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737026860; x=1737631660; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a0nKJjtH2ApPSyDxi76icAcEp1aOGZMrOf/6aGFgnYQ=;
 b=VkSeJ59e3CN71CcoD1NYHSTXNbnONO4e0+apql7/Dx6yeLakLJQuANhr03LUOOYex+
 CHNYn5mxeMJZvXq5qh35TjG5nqTDzXcb6RSXuJpO3+wgWz0pPGyI6pDSO765ihE+7nZs
 uJ07bedUacUwpw9Pso1cRCEWzgt7TPE56vcmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737026860; x=1737631660;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a0nKJjtH2ApPSyDxi76icAcEp1aOGZMrOf/6aGFgnYQ=;
 b=YQav8OyfsDI20wgTgoX2tL1hUDKWhRpIJQq5QU4Zc9vuoGE1W5GAJ74lBp9BJyob+o
 kOVygK+8tr1XMRobIlCoLwJo2kHfLMRgjRSuUPuEBSN2Jf+lhDV0n/3jgGEvgP50IQD7
 vrCYKYKbwk1Xsv8fVGDTceQ0y67Bdo2OmGLmcRXQXUPElARZ7oNg85y9v0KWFWP5ANbK
 J+0SEPKlAg0eY0K4Kg5FhitRPubyifgr4S+Xo8Ktjhxbj8CBSOtdrAD+UsdJ+84gyBxT
 YRPN+yv/wIpJTU2jVfiOxAVeJ0nN59lXqEgF0vB2nkafTwQNNSLRUluDeNS8D+hzIK6z
 T2TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHwWm0Rub/XtN/D2EL2HOlPQacjElMRIoBFZPCOfs+V5HV80N8IpUiXxCrYl7KlmGL9Jt3QKJB58U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzu909HOEzRHEYtSI+v3Ox4w0cjuiJ5+8et5UUV/JMGnt2YmXwN
 qY8IhhM6nIPwn1jC3D4nXJAAuTFtBQ49/jYZeMgAThne3nR6T45Rzvpi1LiSoeQ=
X-Gm-Gg: ASbGncsOjDtTXbFbfWGknqaCYXVZ81s6i1IxO1hzYvLQoDTR/OUuaSm8S+UignehDeI
 vLDP0zSeRow2lKs/SP4LrxydegGNASY8DHftVFPgam74EK6BoYIS/6XrNqQ8ABZGVeNJbHUVmv4
 mr7TN4QExg4YGGDaV0ZKhE3GUNur7I5FYR4g5YJoUWAdD+sfSt2B/rF5TVIobNpRkTAOa1vdjBD
 3FlLb4vSjpCmuLgef57qqPUbfNrjWyO4JPT0YOZBvbB7Qtw4x+jUACG053efZrVuxiv
X-Google-Smtp-Source: AGHT+IEn6TJVuC3++aW+1bE9Q5vRJBPt+NtT9C6gLCW54SZ0vlfPrBVTCB3tNcIpK4+Qdu8I/gfALg==
X-Received: by 2002:a05:600c:3b94:b0:434:e2ea:fc94 with SMTP id
 5b1f17b1804b1-436e2696cb8mr337102945e9.11.1737026859642; 
 Thu, 16 Jan 2025 03:27:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74c65b7sm57007715e9.23.2025.01.16.03.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 03:27:39 -0800 (PST)
Date: Thu, 16 Jan 2025 12:27:36 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/29] drm/atomic-helper: Fix commit_tail state variable
 name
Message-ID: <Z4jtKHY4qN3RNZNG@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
 <20250115-bridge-connector-v1-1-9a2fecd886a6@kernel.org>
 <w6hoxhwyrp44e6yqelxe5qtlyq643bvynmqrwzybuflhb7lkvu@bmsy3losd6t4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <w6hoxhwyrp44e6yqelxe5qtlyq643bvynmqrwzybuflhb7lkvu@bmsy3losd6t4>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Thu, Jan 16, 2025 at 03:36:12AM +0200, Dmitry Baryshkov wrote:
> On Wed, Jan 15, 2025 at 10:05:08PM +0100, Maxime Ripard wrote:
> > Even though the commit_tail () drm_atomic_state parameter is called
> > old_state, it's actually the state being committed which is confusing.
> > 
> > It's even more confusing since the atomic_commit_tail hook being called
> > by commit_tail() parameter is called state.
> 
> Do you have any kind of history and/or explanation, why it's called
> old_state all over the place?
> 
> I think that the renaming is correct, but I'd like to understand the
> reason behind it.

So originally drm_atomic_state only had a single set of state pointers, so
was truly just a state collection and not a state transition/commit like
it is now.

During atomic check it contained the new states, and the old ones you
could get by looking at obj->state pointers. After
drm_atomic_helper_swap_state it contained the old states, and the new ones
could be found by looking at obj->state.

This caused endless amounts of confusions, and eventually we settled on a
new design:
- Ville added both old and new state pointers to drm_atomic_state, so now
  it's not just a state collection, but really a state transition/commit.
  We did discuss whether we should also rename it, but for lack of time
  and good name this hasn't happened yet.
- Instead of trying to pass the individual states to callbacks we've moved
  over to just passing drm_atomic_state, and let the callbacks grab
  whatever they need. That's also not yet done everywhere yet, but I think
  we're pretty close.

But one of the interim attempts at reducing the confusion was to rename
the drm_atomic_state argument to old_state anywhere after we've called
swap_states(). Didn't really help, and not it's just adding to the
confusion.

If we haven't yet I guess we should document the above two design
principles in the drm_atomic_state kerneldoc.

Cheers, Sima

> 
> > Let's rename the variable from old_state to state to make it less
> > confusing.
> > 
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 20 ++++++++++----------
> >  1 file changed, 10 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index 40e4e1b6c9110677c1c4981eeb15dc93966f4cf6..913d94d664d885323ad7e41a6424633c28c787e1 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -1818,13 +1818,13 @@ void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *old_state)
> >  
> >  	drm_atomic_helper_cleanup_planes(dev, old_state);
> >  }
> >  EXPORT_SYMBOL(drm_atomic_helper_commit_tail_rpm);
> >  
> > -static void commit_tail(struct drm_atomic_state *old_state)
> > +static void commit_tail(struct drm_atomic_state *state)
> >  {
> > -	struct drm_device *dev = old_state->dev;
> > +	struct drm_device *dev = state->dev;
> >  	const struct drm_mode_config_helper_funcs *funcs;
> >  	struct drm_crtc_state *new_crtc_state;
> >  	struct drm_crtc *crtc;
> >  	ktime_t start;
> >  	s64 commit_time_ms;
> > @@ -1842,37 +1842,37 @@ static void commit_tail(struct drm_atomic_state *old_state)
> >  	 * These times will be averaged out in the self refresh helpers to avoid
> >  	 * overreacting over one outlier frame
> >  	 */
> >  	start = ktime_get();
> >  
> > -	drm_atomic_helper_wait_for_fences(dev, old_state, false);
> > +	drm_atomic_helper_wait_for_fences(dev, state, false);
> >  
> > -	drm_atomic_helper_wait_for_dependencies(old_state);
> > +	drm_atomic_helper_wait_for_dependencies(state);
> >  
> >  	/*
> >  	 * We cannot safely access new_crtc_state after
> >  	 * drm_atomic_helper_commit_hw_done() so figure out which crtc's have
> >  	 * self-refresh active beforehand:
> >  	 */
> > -	for_each_new_crtc_in_state(old_state, crtc, new_crtc_state, i)
> > +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
> >  		if (new_crtc_state->self_refresh_active)
> >  			new_self_refresh_mask |= BIT(i);
> >  
> >  	if (funcs && funcs->atomic_commit_tail)
> > -		funcs->atomic_commit_tail(old_state);
> > +		funcs->atomic_commit_tail(state);
> >  	else
> > -		drm_atomic_helper_commit_tail(old_state);
> > +		drm_atomic_helper_commit_tail(state);
> >  
> >  	commit_time_ms = ktime_ms_delta(ktime_get(), start);
> >  	if (commit_time_ms > 0)
> > -		drm_self_refresh_helper_update_avg_times(old_state,
> > +		drm_self_refresh_helper_update_avg_times(state,
> >  						 (unsigned long)commit_time_ms,
> >  						 new_self_refresh_mask);
> >  
> > -	drm_atomic_helper_commit_cleanup_done(old_state);
> > +	drm_atomic_helper_commit_cleanup_done(state);
> >  
> > -	drm_atomic_state_put(old_state);
> > +	drm_atomic_state_put(state);
> >  }
> >  
> >  static void commit_work(struct work_struct *work)
> >  {
> >  	struct drm_atomic_state *state = container_of(work,
> > 
> > -- 
> > 2.47.1
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
