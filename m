Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A833A38C8A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 20:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5321910E5B8;
	Mon, 17 Feb 2025 19:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ld6WWLnW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE05410E5D4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 19:36:40 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5452d9d0d47so2666754e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739820999; x=1740425799; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3U8NlgfYRWr/by2t3l1latdwmUYOB232O9kLWODXzV4=;
 b=ld6WWLnWdABdxIklmMXGAyLPMzySbU0AUurtGnHG4jj8ZdWd81UUQxbm2HUhucx81c
 AASJxGW4v2wVkfi02i7yxr9ptpABt+RD8F34Dv6NcOtTsYa1rTGPw+zyWJKLRsdMRShK
 CHbleqMSfWhDVjjOpw5IXj7t/a2C4+1yS2Ng0BMOUuqqf6JKZYsEC3VbiBPV7zvJcGKZ
 wwGpu5lbL88eDN3E6kEFuJhpKRJyeewYNfXmbosOCuQ3/zjAh4dxMFPNmF1OHHu647yQ
 zcNNddUGbt8aruHOQGqTJ47jhmiOtJDl0pfN/DEt45PHX+hmvx6saIYUNjxhnrALUl6+
 yytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739820999; x=1740425799;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3U8NlgfYRWr/by2t3l1latdwmUYOB232O9kLWODXzV4=;
 b=tTlIW6ft+kJ21hInoSInWV+UrbBH9eVq2wmgdIPqKqz4h7Yy7Iff6874wZba+Mm0Nh
 uWB21gNgblgBIMcIRu4DjXZk+R0C/7wAdBMfls9GE/5dWnMdTbQA4qdcq+MvZCjHgINQ
 7c1IbY5zdTnMKsxpBccJGMXfX6aMSkQeo7uG3dGR9dKcsOmBXsEhPLvHhSOiF2BNOV3F
 cnqarTru24dAr3/+wAyLHJK93HiO+W11dHOR1VIJnyTbYho81OdbBn1L74V8njs7qsSf
 9cZoknY3kkyY659GhUydgQDO8NetDyVTpBNUO481vMW5zGoBxjWkHNPU1UsLFoa/YkYD
 d5Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUABMr5WmaxnT+a6d/MO0CT2T4plfy44NG6wKskEr9Y9+lAas8TC/L7U6toIimS8b8abZSsYY4cr8M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkN75QlQ95LmtwUjM31tsMMYzR+iQhQTDMCfKcF1jIGDcr2Raj
 BSCKoJaelP2YWnPOyGj4SO+59SwEgXZzUdSoU9PKkiPPfIx/lYKQ7egu8kOYcT8=
X-Gm-Gg: ASbGnctR7rpB31gdDvbMcRtbz18gCYIGbt2gcIUChPgCEZUS+nlNWwJbBwLkAqCpYfi
 sIp77pIWw/Ne0hw9SSkb7ho8Z3xK0UHw0vm9x5vaEkDbu8A8i2zj0KV5f5sz8TBSfB9Vrf0Cq1Q
 gQM7xyWdAFaKQduNQa62twzhs6HF6ghu3jtNDpZSSBOGF3DmY5U4WdyQ/VupY7wPkuvr6mvw66q
 LDjQSsgSiZtpkakcoY+uDqtOHowqYTjJtNpRCf5XNU27ZvDfXZM3+D9s5ZL6jVjbNDrC2m4QvXQ
 Rf+JjoTYUje2evQ9OheeMSFQGC9PvYEQ1CVrhx5YKw9aCmDE0PJucsYm1j0ZNcu/KwqF9jQ=
X-Google-Smtp-Source: AGHT+IHBoAKRkAWdvnSRijUiodJjyY3mQNvX+jrwcj4p/1bCSHT6mAHiZoJ693muG+FtPkbJa7m+EQ==
X-Received: by 2002:a05:6512:4005:b0:545:22ec:8b51 with SMTP id
 2adb3069b0e04-5452fe80338mr2687830e87.41.1739820998825; 
 Mon, 17 Feb 2025 11:36:38 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5461c964313sm726047e87.233.2025.02.17.11.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:36:37 -0800 (PST)
Date: Mon, 17 Feb 2025 21:36:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 31/37] drm/bridge: Provide pointers to the connector
 and crtc in bridge state
Message-ID: <padhzkj5astckiltvxkcs4xq335crrhf2m6bvii6cezyoyfypq@t535fgjwqzqg>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-31-e71598f49c8f@kernel.org>
 <Z7NmtF83adILfasi@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7NmtF83adILfasi@phenom.ffwll.local>
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

On Mon, Feb 17, 2025 at 05:41:24PM +0100, Simona Vetter wrote:
> On Thu, Feb 13, 2025 at 03:43:50PM +0100, Maxime Ripard wrote:
> > Now that connectors are no longer necessarily created by the bridges
> > drivers themselves but might be created by drm_bridge_connector, it's
> > pretty hard for bridge drivers to retrieve pointers to the connector and
> > CRTC they are attached to.
> > 
> > Indeed, the only way to retrieve the CRTC is to follow the drm_bridge
> > encoder field, and then the drm_encoder crtc field, both of them being
> > deprecated.
> 
> Eh, this isn't quite how this works. So unless bridges have become very
> dynamic and gained flexible routing the bridge(->bridge->...)->encoder
> chain is static. And the crtc for an encoder you find by walking the
> connector states in a drm_atomic_state, finding the right one that points
> at your encoder, and then return the ->crtc pointer from that connector
> state.
> 
> It's a bit bonkers, but I think it's better to compute this than adding
> more pointers that potentially diverge. Unless there's a grand plan here,
> but then I think we want some safety checks that all the pointers never
> get out of sync here.

Luca is working on bridges hotplug, so connectors are dynamic now. And
at least my humble opinion is that we'd better provide the corresponding
pointers rather than having a lot of boilerplate code in the drivers.
(there are enough drivers which look up connector and/or CRTC) and there
are even more drivers (I think, I haven't actually checked the source
tree) that could have benefited from thaving the connector or CRTC in
the state. Instead they store a pointer to the connector or perform
other fancy tricks.

> -Sima
> 
> > 
> > And for the connector, since we can have multiple connectors attached to
> > a CRTC, we don't really have a reliable way to get it.
> > 
> > Let's provide both pointers in the drm_bridge_state structure so we
> > don't have to follow deprecated, non-atomic, pointers, and be more
> > consistent with the other KMS entities.
> > 
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/drm_atomic_state_helper.c |  5 +++++
> >  drivers/gpu/drm/drm_bridge.c              |  5 +++++
> >  include/drm/drm_atomic.h                  | 14 ++++++++++++++
> >  3 files changed, 24 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> > index 519228eb109533d2596e899a57b571fa0995824f..66661dca077215b78dffca7bc1712f56d35e3918 100644
> > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > @@ -777,10 +777,15 @@ EXPORT_SYMBOL(drm_atomic_helper_bridge_duplicate_state);
> >   * that don't subclass the bridge state.
> >   */
> >  void drm_atomic_helper_bridge_destroy_state(struct drm_bridge *bridge,
> >  					    struct drm_bridge_state *state)
> >  {
> > +	if (state->connector) {
> > +		drm_connector_put(state->connector);
> > +		state->connector = NULL;
> > +	}
> > +
> >  	kfree(state);
> >  }
> >  EXPORT_SYMBOL(drm_atomic_helper_bridge_destroy_state);
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index b6d24092674c8fa33d9b6ebab9ece0f91fb8f8ea..db2e9834939217d65720ab7a2f82a9ca3db796b0 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -812,10 +812,15 @@ static int drm_atomic_bridge_check(struct drm_bridge *bridge,
> >  		bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
> >  							       bridge);
> >  		if (WARN_ON(!bridge_state))
> >  			return -EINVAL;
> >  
> > +		bridge_state->crtc = crtc_state->crtc;
> > +
> > +		drm_connector_get(conn_state->connector);
> > +		bridge_state->connector = conn_state->connector;
> > +
> >  		if (bridge->funcs->atomic_check) {
> >  			ret = bridge->funcs->atomic_check(bridge, bridge_state,
> >  							  crtc_state, conn_state);
> >  			if (ret)
> >  				return ret;
> > diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> > index 4c673f0698fef6b60f77db980378d5e88e0e250e..293e2538a428bc14013d7fabea57a6b858ed7b47 100644
> > --- a/include/drm/drm_atomic.h
> > +++ b/include/drm/drm_atomic.h
> > @@ -1216,10 +1216,24 @@ struct drm_bridge_state {
> >  	/**
> >  	 * @bridge: the bridge this state refers to
> >  	 */
> >  	struct drm_bridge *bridge;
> >  
> > +	/**
> > +	 * @crtc: CRTC the bridge is connected to, NULL if disabled.
> > +	 *
> > +	 * Do not change this directly.
> > +	 */
> > +	struct drm_crtc *crtc;
> > +
> > +	/**
> > +	 * @connector: The connector the bridge is connected to, NULL if disabled.
> > +	 *
> > +	 * Do not change this directly.
> > +	 */
> > +	struct drm_connector *connector;
> > +
> >  	/**
> >  	 * @input_bus_cfg: input bus configuration
> >  	 */
> >  	struct drm_bus_cfg input_bus_cfg;
> >  
> > 
> > -- 
> > 2.48.0
> > 
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
With best wishes
Dmitry
