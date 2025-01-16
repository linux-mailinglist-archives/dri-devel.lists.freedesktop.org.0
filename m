Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD917A13939
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 12:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBE510E945;
	Thu, 16 Jan 2025 11:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="jP0h/k0S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6731B10E945
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 11:37:03 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-436202dd730so4783825e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 03:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737027362; x=1737632162; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rr6AqcEMHdWNfRWQxjEOGM7boVLdKcXaxdw5QHz2A1M=;
 b=jP0h/k0Ssy2TOWUsuD+Yp+E6kBiTPd4FRbNErECk84ewsF+GNXpjOJjw6WjXEJWLS0
 qDE5tRnb0E4XykMzz2ECBJkV+VIzkpgsjIEHY2on9Rjsr+5KMRnBuW0EUifC/JsH/bz3
 FFRKpIpcS8AKI/qaQTnzYTet6SukuY0+7X44o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737027362; x=1737632162;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rr6AqcEMHdWNfRWQxjEOGM7boVLdKcXaxdw5QHz2A1M=;
 b=vAea+Lb9uCqfmhHihirGm5dmnMiAJZvZ2hKQ7Derj/ym9miyinqIm4K2JPdlDf5yrw
 aJV0bOYuTWllSkvUyBj4XHtVBcNjq0tR3/Z92z+yORtMTieXwOZAP4G5Lh6lnEi9huov
 f5I5Ur+A6I0633dgwkxQpDbgWJfUx5V8+1ryLEpVOiAHPjLZveFqo1ukdxTEbOZ1i/R4
 3Ux0BzP8uKZx7JxG8VpVm/bSFMGQujuU/HY6jZOrf40Ey8jwUte9ox3rTct00fdeRT/H
 4CC8KBi4wDL81Sh1RX+rX6UiHCJ2NfSFVAwj/Gfl3KOUKUZBMCT0bhLyg8TC/TJuG/AB
 Ph9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSnhwieby8rokOBHBDAsqypuY0JaQWbwiwcOF5ZWCcQ7e59s9ckLVAxyO5FW6IjBogDr6DKwjGlIQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKQ9EFoJ85EP3oZ8dCNA81xjcdZ0NKpSGGoL+1WVUh62GefiYP
 rNmcDSrIVWHc0wjTpUnebeKn3s/ODTajK8DnQpYlpl1NCwatl7nNMMmNchZ0eb0=
X-Gm-Gg: ASbGnctyY1zzCuzL0Mw6t//TXfjozLo8eI2f4wJiz0a7p9PUw/TjBNpNzigdW/WBwUL
 RhlD7zCVouixzMYRGN4gV9F7TkwNICbtxQVZ3UnQxWmd2Q5zR3G4+qhghTwvYqmc3tpc4aIQWul
 lbpa0+WZGFkEGIqF1YxqRCK80E/1y3MlnTOXqStb8Yn9KQSXcnWlC+6YqlWSERfURQFy7dPuhmV
 CxjvZu3hLuHGuGTvoTri3c76yIduUb27+aAkn1ZQ83XBulUaWpans6ANm3WbKKY5fhW
X-Google-Smtp-Source: AGHT+IEqg01wFFXPcFbD5VuleScEQiGcXBXCjg4Hy6oJM1VnyIAioFXA1b+JP0TYd+K0b6nE2nDELw==
X-Received: by 2002:a05:6000:1a8d:b0:385:ed1e:2105 with SMTP id
 ffacd0b85a97d-38a8730ae10mr30807692f8f.26.1737027361977; 
 Thu, 16 Jan 2025 03:36:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e383965sm20544993f8f.31.2025.01.16.03.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 03:36:01 -0800 (PST)
Date: Thu, 16 Jan 2025 12:35:59 +0100
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
Subject: Re: [PATCH 23/29] drm/bridge: Provide a helper to retrieve current
 bridge state
Message-ID: <Z4jvH9yud8TfXPJ0@phenom.ffwll.local>
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
 <20250115-bridge-connector-v1-23-9a2fecd886a6@kernel.org>
 <opuc3fhvncg6rb3mtktirytr3jexun344bkaatv46sq3nvx3qm@qn54dhudksw4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <opuc3fhvncg6rb3mtktirytr3jexun344bkaatv46sq3nvx3qm@qn54dhudksw4>
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

On Thu, Jan 16, 2025 at 02:43:37AM +0200, Dmitry Baryshkov wrote:
> On Wed, Jan 15, 2025 at 10:05:30PM +0100, Maxime Ripard wrote:
> > The current bridge state is accessible from the drm_bridge structure,
> > but since it's fairly indirect it's not easy to figure out.
> > 
> > Provide a helper to retrieve it.
> > 
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  include/drm/drm_bridge.h | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index 8e18130be8bb85fc2463917dde9bf1d281934184..95c5037a6335e4c1be511e6c31308202015c7754 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -955,10 +955,27 @@ static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
> >  {
> >  	return NULL;
> >  }
> >  #endif
> >  
> > +/**
> > + * @drm_bridge_get_current_state() - Get the current bridge state
> > + * @bridge: bridge object
> > + *
> > + * RETURNS:
> > + *
> > + * The current bridge state, or NULL if there is none.
> 
> Are there any kind of limitations on when and how this function can be
> used? I don't think we can be accessing the state randomly, as the
> framework can change it at some points. E.g. what if the driver uses
> this state from audio or cec callbacks, while the DRM framework performs
> atomic commit and changes / frees the state right concurrently?

Yeah you can only look at this when either holding the corresponding
modesetlock, or in atomic commit. But in the latter it's a much cleaner
design pattern to instead look up the state from the drm_atomic_state,
since that pointer is the magic thing which guarantees lifetim/ownership
for lockless access in atomic commit code.
-Sima

> 
> > + */
> > +static inline struct drm_bridge_state *
> > +drm_bridge_get_current_state(struct drm_bridge *bridge)
> > +{
> > +	if (!bridge)
> > +		return NULL;
> > +
> > +	return drm_priv_to_bridge_state(bridge->base.state);
> > +}
> > +
> >  /**
> >   * drm_bridge_get_next_bridge() - Get the next bridge in the chain
> >   * @bridge: bridge object
> >   *
> >   * RETURNS:
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
