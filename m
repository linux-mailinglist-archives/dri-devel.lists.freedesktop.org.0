Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481E2A3D54D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 10:50:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2544D10E4BA;
	Thu, 20 Feb 2025 09:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="gQvsa7We";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF6B10E4BA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 09:49:57 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-38f403edb4eso374535f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 01:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1740044996; x=1740649796; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z7SecTuWmwnoGQvx5fWAJpnW1FaqciuMmH5iox49O5c=;
 b=gQvsa7WeykLbviUOa9VCec9KctgArswr3eqpt/PbSqeuKFryyAiev4t7IpWaqZdD8p
 fr/tMXpHlyGDP5MhoTBQZHlwttYOLqO2I6K51jmb1XlL9yYdw4Qa/pwh0GPMDU3yEf3j
 yF9VMmzQBT+TUpAkgqheIuRZy+qqW3Sb5KfkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740044996; x=1740649796;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z7SecTuWmwnoGQvx5fWAJpnW1FaqciuMmH5iox49O5c=;
 b=QPcMMCPIyn7fstB73Qj79K3q4y/8UZVwQ13/Zux8tDN1S/gy14kKSToOtzzXB5BL5C
 NcL6T9i4zOWNBZu51MetWnxki3E+1MDGA6FTQyXAryznrKhzTJkPxUdyQWrUU4sbd/ID
 7bihcnpatGe/VtN6xe+guPdACgrO0f5Z98Lc+TXngAtcpozjkD0zoHGnlW7UOi4ucnsU
 Nt7tt/Nk7BACdadEApCpchhQb6/aW3klbyhFdUgUsSOJwTFJsqu7BMR1tNkA3KpA6Uun
 eHmKUQNYFkdA4jsDqfxQ6ARgiGmD3b9MvbIjvgYKGCRB2QWdT04GMnoHbnzEhv5I7ZF9
 a8yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX13R8R0Dgh4uNsS60Q+iqdeACYmWqDgSeMWF32lW9w2UH/0i3PR3kLU+WIg47pYyT6wW4CE+Lgwmk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaFKoMBs26XTJwgOV3MEyiMJvpDyJJehUbp5/cua02TPziiun2
 fp2e/JPxu5yCKL/y7ZICramI2u3Zl1RgodBe1DXKW0CHmaYskYN3XDJ7aOQY+8A=
X-Gm-Gg: ASbGnctvGot74cK50haI1V9gf7EMzxiQCAw15fbTupWjaqq3lT2hR1/68qieMIEbk7x
 tw09I0JS0qQhM12qYAfzqIJeliTdJ0xDfg8h12URWrmSMFOdaAkGCGSmMnRYIrN09HeQu4LAuHw
 pln7KUz2EKqPOJWZRR5sQ3jwHRIcPmircvlanMvBIqVkP4VzO73EP3RzOVzwZWwn/IyO+SwlVaS
 GnsghQo7TdyqWTP+Qrt9bPxWmJroBxBNL/L0aGd69cRtODizmpYqORYKJ/fSu+UX6m8NZLL9/UX
 eYlkLeuVzr46vWTJTAf4AYjxRrs=
X-Google-Smtp-Source: AGHT+IG1XNq+yvNmwPgumPAiB8sDygsjgkleurSBqiGod07eF/zDW+EUm3aE6kOmPHgxFKCHHicsIA==
X-Received: by 2002:a5d:6486:0:b0:38f:6149:9235 with SMTP id
 ffacd0b85a97d-38f614992eemr2689445f8f.16.1740044995913; 
 Thu, 20 Feb 2025 01:49:55 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a04f8c1sm239212715e9.8.2025.02.20.01.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 01:49:54 -0800 (PST)
Date: Thu, 20 Feb 2025 10:49:52 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 31/37] drm/bridge: Provide pointers to the connector
 and crtc in bridge state
Message-ID: <Z7b6wBF9VNwYkB5w@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
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
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-31-e71598f49c8f@kernel.org>
 <Z7NmtF83adILfasi@phenom.ffwll.local>
 <20250218-adamant-translucent-civet-aebcc5@houat>
 <Z7XeHaTmtS8ClOV-@phenom.ffwll.local>
 <20250219-gregarious-condor-of-prestige-a6ce0c@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219-gregarious-condor-of-prestige-a6ce0c@houat>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Wed, Feb 19, 2025 at 04:56:11PM +0100, Maxime Ripard wrote:
> On Wed, Feb 19, 2025 at 02:35:25PM +0100, Simona Vetter wrote:
> > On Tue, Feb 18, 2025 at 11:23:00AM +0100, Maxime Ripard wrote:
> > > Hi,
> > > 
> > > Thanks for your answer
> > > 
> > > On Mon, Feb 17, 2025 at 05:41:24PM +0100, Simona Vetter wrote:
> > > > On Thu, Feb 13, 2025 at 03:43:50PM +0100, Maxime Ripard wrote:
> > > > > Now that connectors are no longer necessarily created by the bridges
> > > > > drivers themselves but might be created by drm_bridge_connector, it's
> > > > > pretty hard for bridge drivers to retrieve pointers to the connector and
> > > > > CRTC they are attached to.
> > > > > 
> > > > > Indeed, the only way to retrieve the CRTC is to follow the drm_bridge
> > > > > encoder field, and then the drm_encoder crtc field, both of them being
> > > > > deprecated.
> > > > 
> > > > Eh, this isn't quite how this works. So unless bridges have become very
> > > > dynamic and gained flexible routing the bridge(->bridge->...)->encoder
> > > > chain is static. And the crtc for an encoder you find by walking the
> > > > connector states in a drm_atomic_state, finding the right one that points
> > > > at your encoder, and then return the ->crtc pointer from that connector
> > > > state.
> > > > 
> > > > It's a bit bonkers, but I think it's better to compute this than adding
> > > > more pointers that potentially diverge. Unless there's a grand plan here,
> > > > but then I think we want some safety checks that all the pointers never
> > > > get out of sync here.
> > > 
> > > That work stemed from this series
> > > https://lore.kernel.org/all/20250210132620.42263-1-herve.codina@bootlin.com/
> > > 
> > > and in particular:
> > > https://lore.kernel.org/all/20250210132620.42263-5-herve.codina@bootlin.com/
> > > 
> > > Bridges, outside of the modesetting code path, don't have a way to
> > > access the drm_atomic_state since drm_bridge_state->state is typically
> > > cleared after swap_state. So accessing the connectors and CRTCs don't
> > > work anymore.
> > > 
> > > In this particular case, we needed to access those from the bridge
> > > interrupt handler.
> > 
> > Uh for interrupt handler you can't use anything stored in state objects
> > anyway. So I'm even more confused.
> 
> Why not? As long as we're in a threaded handler, and take the proper
> locks, what's wrong with it, and how is it fundamentally different than,
> idk, cec or audio hooks?

Well, _threaded_ interrupt handler is a quite important distinction. Then
it's indeed fine from a locking pov. I'm still not sure it's actually what
you want, because obj->state is the logical state. It does not reflect the
hw state, and grabbing a lock won't change that. You can do nonblocking
atomic modeset changes after all. So you might still run the risk that
your irq handler is looking at state which does not reflect the actual hw
configuration. And if it's then messing around with it, you're racing
against a concurrent atomic commit work.

This is why all the vblank state is protected by separate spinlocks, and
copied over to that separate state at the appropriate time within the
atomic commit sequence. So if you need something like this for bridges,
you probably need still need the spinlock (or a mutex, for threaded
interrupt handlers) and separate state.

Meaning: I'm still rather skeptical of what you're doing here ...
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
