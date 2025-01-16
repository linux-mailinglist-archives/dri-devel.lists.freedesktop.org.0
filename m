Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9489A1370C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 10:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114F410E91D;
	Thu, 16 Jan 2025 09:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RoJ8IVH4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A209A10E918
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 09:53:43 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53e3a227b82so768960e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 01:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737021222; x=1737626022; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QNNa1h8AYUs4B6XNrJw5bBoCCf6HDJBQip+zEhat+hI=;
 b=RoJ8IVH4pGlLhEiQYZ3cyxGrycJlPWo1rSOVmTb1S4f8duWsNvO80Y1FasMUKDxXyF
 ywwxuk4MmN9zGpSAeMloX1vIzWCzFLYXAFzcf8/3bdc/7Iei/TFqpe2CeW9EPmREZ1QN
 51I+b+2QyB4onC3QzvfBujZGLLp3qmshh+tLbQsYHvWA0HeR8St9worI/iGP4PsydkPl
 Ho8j+O1AQU/+AlO417nvqqMC/WTLreig0OlNVYIe/KPPK3Pepnax06pf2F7Rn/4TrXVb
 k7kkLc+KhFScg0c+WIyNa60cHNX6jA40xH+vTiOn0+XzU/n05pohogBD6g8s2su1ky2n
 X28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737021222; x=1737626022;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QNNa1h8AYUs4B6XNrJw5bBoCCf6HDJBQip+zEhat+hI=;
 b=c5Ol7lu0Io3C1vmI4VQS1mMGkgH5XWQvv1O8bowAHWIfy3eszzXG7hG09OgMmvs/P/
 cgBlOKP/ZWc6H8QGXAW03gVVY2q4REuayXxzeJWQAmgLqZZC+KqSCO32kLszDl3Xo1eI
 mjiBAgW6+EY1usxb/ignL/AWTA2UsaXZSdN8d/3R6+14p5FW7xkskIPypIQ+Y+2VpjAY
 9xrPxyCl6MusTm7boZZkaFzDKHs0yDskf7VOOpgtX4uCX+BbjDqk0HQ3hR11ZxHNozFy
 5Dnshu0k++pc75lkblEDz2PQ725mzkWZu1k9lADUk/BC4UgGdzk9aTsml+aNBbtEIB+l
 TTwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKYFrRVWPfm+ofALcnuD1yI3Z8fxSgWJ9IjXPja1RBsseS+OLniwWx3L74UZehnXgDhacRVAXp8RM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtF3XPPBgBmkjK2fwnCUQoYV68fl9mo+hmD16CFEO9VFphELfY
 dmQn7HSf9lsYH+ozJC1tjud/XUj2nji4j1jqarumNYW4fwACUS4B/5CRLkFf/9k=
X-Gm-Gg: ASbGnct7hdn/D1fsFXWqgM5pjKGFadXHDzyAwqS4uc5E3ZzQkL+eWXBrEjSLSQWZe30
 wvSKP7QSXJO/XRxLJKIG0dFvIz7GmMvjUfYWRZr0ZMqPiSmTPqXOUGWdSWax/9kLVAqa8Wi0zAS
 Bo7d7QlSwy91Ge+pxpQ3PrwZWrHm20FV7rKJmn3NqGwbABcKj8DnK4gwVSJgu79gpBHozJzwIyr
 8OW/fIh5qvZdfPONJq3z1+kY2hbkqJlgOPD0d3vFM7bkirTJZ1B+ABDcObiv+ZmrX3GThBRwl+l
 0dEwxAvupE2hmFnERZkVmPoR5PCMQStZ50Ej
X-Google-Smtp-Source: AGHT+IG4fHj2I6gMUTaF41caKL1snpJIBw9bx+1972ulvIElEnBUO0YOwESJQWwC09hO7y68GuL8jA==
X-Received: by 2002:a05:6512:3d22:b0:540:25a6:c390 with SMTP id
 2adb3069b0e04-542845b6f79mr10839722e87.23.1737021221758; 
 Thu, 16 Jan 2025 01:53:41 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be55f1csm2263640e87.88.2025.01.16.01.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 01:53:41 -0800 (PST)
Date: Thu, 16 Jan 2025 11:53:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 25/29] drm/bridge: Provide pointers to the connector and
 crtc in bridge state
Message-ID: <rqem5pqoufet66verjldsb5ihdwnfwcn6clwouj5l6p53f3ik6@sx52djr475yk>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
 <20250115-bridge-connector-v1-25-9a2fecd886a6@kernel.org>
 <eaardp55onpuqxneh4q6a7tmujglp2pu7kubwisoubjbyuqbt3@zttu7txp34xx>
 <20250116-energetic-fine-worm-c2460a@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-energetic-fine-worm-c2460a@houat>
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

On Thu, Jan 16, 2025 at 09:42:54AM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Jan 16, 2025 at 03:04:19AM +0200, Dmitry Baryshkov wrote:
> > On Wed, Jan 15, 2025 at 10:05:32PM +0100, Maxime Ripard wrote:
> > > Now that connectors are no longer necessarily created by the bridges
> > > drivers themselves but might be created by drm_bridge_connector, it's
> > > pretty hard for bridge drivers to retrieve pointers to the connector and
> > > CRTC they are attached to.
> > > 
> > > Indeed, the only way to retrieve the CRTC is to follow the drm_bridge
> > > encoder field, and then the drm_encoder crtc field, both of them being
> > > deprecated.
> > > 
> > > And for the connector, since we can have multiple connectors attached to
> > > a CRTC, we don't really have a reliable way to get it.
> > > 
> > > Let's provide both pointers in the drm_bridge_state structure so we
> > > don't have to follow deprecated, non-atomic, pointers, and be more
> > > consistent with the other KMS entities.
> > > 
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  drivers/gpu/drm/drm_atomic_state_helper.c |  5 +++++
> > >  drivers/gpu/drm/drm_bridge.c              | 21 +++++++++++++--------
> > >  include/drm/drm_atomic.h                  | 14 ++++++++++++++
> > >  3 files changed, 32 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> > > index 519228eb109533d2596e899a57b571fa0995824f..66661dca077215b78dffca7bc1712f56d35e3918 100644
> > > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > > @@ -777,10 +777,15 @@ EXPORT_SYMBOL(drm_atomic_helper_bridge_duplicate_state);
> > >   * that don't subclass the bridge state.
> > >   */
> > >  void drm_atomic_helper_bridge_destroy_state(struct drm_bridge *bridge,
> > >  					    struct drm_bridge_state *state)
> > >  {
> > > +	if (state->connector) {
> > > +		drm_connector_put(state->connector);
> > > +		state->connector = NULL;
> > > +	}
> > > +
> > >  	kfree(state);
> > >  }
> > >  EXPORT_SYMBOL(drm_atomic_helper_bridge_destroy_state);
> > >  
> > >  /**
> > > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > > index c937980d6591fd98e33e37d799ebf84e7e6c5529..069c105aa59636c64caffbefcf482133b0db97d9 100644
> > > --- a/drivers/gpu/drm/drm_bridge.c
> > > +++ b/drivers/gpu/drm/drm_bridge.c
> > > @@ -829,19 +829,24 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
> > >  
> > >  static int drm_atomic_bridge_check(struct drm_bridge *bridge,
> > >  				   struct drm_crtc_state *crtc_state,
> > >  				   struct drm_connector_state *conn_state)
> > >  {
> > > +	struct drm_bridge_state *bridge_state;
> > > +	int ret;
> > > +
> > > +	bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
> > > +						       bridge);
> > 
> > It felt like an error to me to call this function for a non-atomic
> > bridges, until I fully followed the code path to find that it will
> > return NULL if the bridge isn't registered as a private object.
> 
> Yeah.. I wasn't too sure what to do about this one either. I think it
> would be more consistent to always have a state properly filled, even if
> we have !atomic drivers. It's what happens with the rest of the
> framework.

Well... Unlike other parts of the framework there is no state for
non-atomic bridges. Of course we can probably fix that by using default
helpers if the callbacks are not provided.

> But also, I have no idea what the side-effects might be.
> 
> One thing though: a driver having an atomic_check callback is not an
> indication of whether it supports atomic mode-setting or not.
> atomic_check is optional, so we can have atomic drivers without
> atomic_check.

Yeah. The framework uses the presence of the .atomic_reset() callback in
order to register the bridge as a private object, maning state
management & co.

-- 
With best wishes
Dmitry
