Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3532A17D63
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 12:58:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A620110E144;
	Tue, 21 Jan 2025 11:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UUtQrmc3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAC110E144
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 11:58:53 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-304d760f0dfso47764761fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 03:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737460672; x=1738065472; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1SAFX7H1LuRl0ShcXdmRg9sr7Em0tM/5O3qe+btbqhM=;
 b=UUtQrmc3OJBpm6uw7sMiL2iTkaSrq0KLS2iTv7uHgL5NtHYj6DnScuLWVAqtSTiYVo
 +t4cWe7RIWJmZd5mBAEuLEM/3ZobQqHPbVfW1lwpGYWpHDHb5mzWvyyD64nmcx8jnf0u
 S13C7wk4WagrjVtCFxs85OK/XDoEcM33XAY4mxs5UkGYPNN8VBbdbG4W2fBY/JIpmlli
 GsZ3YYaFZvXDIDlMWQgCHWcsv2iOGkESBiA76veDg+XGBlDdymxdGAyPzM6rzlUfjdXx
 VkDp+CMXnjll+i2iQQj7TmE5657Anua7pSgkjgRRiaw/IwjHD7ciWaDaI7Gis4+weDjn
 V6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737460672; x=1738065472;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1SAFX7H1LuRl0ShcXdmRg9sr7Em0tM/5O3qe+btbqhM=;
 b=TrBwvkHZk2EaUZwtSo+ei7UJFVtz0oT8HAdKIQlZRGl2VEocv6rapYi8H7Ag4uSajf
 BM5p2y9bEsBMyadU1Fk1bRfXLpY+IiUPh3caZAFkPgy6uyaneSig2HIBHmwRpg4MUa3x
 I1h0YY/tKpHPcvhE+m7QVepPQgwby2w1w6gbe+hLZbufvObZgxBdw76pF01BrKF/LKGy
 1lCh8YbIX0bb2/wxKlBNAtu39zxgp4SBDZBPH2tIDfO1vNsan+CiL/eoA795bkeGENF3
 +BLn84+N67WOR8fS+cFo7lIQAzmvZNI5yBzW4x+2eZCogHyGGEyA86n0vt0ZiJm0xJRc
 tvxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTII4dRl8iAsCUu5jYFXDCRVAD42XJ02vgGKXIt1Wy6RQ/p1Nfrm/zDiyP0TiW9LvyJak7o2unhOo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjEiVJxWcQPdQMNCqYnV65Fg/sW58iisRMV189xXCUQrth5ObX
 cPRMAi622EXFp794PTVfo+ikFQj7FlsJiDhHii9VaSma18t54CtL+PnaHin4who=
X-Gm-Gg: ASbGnctHhLIGrwrHnPDaKZQVXLWTzwaHJyBFWOpbMW4Rlcd9qZmhgHNRpGXXeZkR205
 F7umkwCIi+8z4S/JvqCyaImn6i36bcsSZsNaN/gaTnjtUXYyz2RcKQ5PC0LllJiFte6OKBcVe5e
 /6JKZiOGlL//UYASmoVKQfHPZXl5q9LBs6lx3QEOllKlRiyj5jISivMcOP4bPqTbrUgEWaa2TV8
 kamQWORkyNsDLJu8I+GqLNCC48Ic3GnSNSfsXesnfPJNYasiu094oQh1sbBojDULx/v/Kwz/qgd
 mh2Qyu9dwtBclSUmYGPfhzD8RPlBcY/fvlfTogxA+buEQgq5Vw==
X-Google-Smtp-Source: AGHT+IF8KkuX72ssiXat7VhOyndxwdOiTOiJJAWuGArrnCGES9N/kA5O4JMJCNQl9GYhF/0BHHp78g==
X-Received: by 2002:a05:651c:1551:b0:302:3021:9b29 with SMTP id
 38308e7fff4ca-3072ca5da83mr69186151fa.4.1737460671594; 
 Tue, 21 Jan 2025 03:57:51 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a330886sm21235751fa.8.2025.01.21.03.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 03:57:50 -0800 (PST)
Date: Tue, 21 Jan 2025 13:57:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 08/10] drm/bridge: samsung-dsim: use supporting
 variable for out_bridge
Message-ID: <lwqv5nukfchusbi2vep2cx3vu6oxj4r5jd7oe3wo4nxtpxadh2@wjyt2c2r46kn>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-8-173065a1ece1@bootlin.com>
 <7kpgrgqp2jx6ivkwdc5ax3dfah2qkajaedpcdadldselr4bdlq@jewss2bdl4or>
 <20250102130149.5784c09b@booty> <20250110115819.55bc887b@booty>
 <20250116113236.39ba876a@booty>
 <emuj2innmp6zmzd7pyakqzjqpdzhly6qfhakya3ydwmd63pl26@5jwxaidpikjw>
 <20250121122718.48502262@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121122718.48502262@booty>
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

On Tue, Jan 21, 2025 at 12:27:18PM +0100, Luca Ceresoli wrote:
> Hi Dmitry,
> 
> On Thu, 16 Jan 2025 12:56:25 +0200
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
> [...]
> 
> > > Idea 3: 
> > > 
> > > The idea is that if the panel driver framework always creates a panel
> > > bridge, it will never need to be created on the fly automagically by
> > > its consumers, so the whole problem would disappear. It also would be
> > > better modeling the hardware: still wrapping a panel with a drm_bridge
> > > that does not exist in the hardware, but at least having it created by
> > > the provider driver and not by the consumer driver which happens to
> > > look for it.  
> > 
> > I think this is the best option up to now.
> 
> Thanks for sharing your opinion. However a few points are not clear to
> me, see below.
> 
> > > This looks like a promising and simple idea, so I tried a quick
> > > implementation:
> > > 
> > >  void drm_panel_init(struct drm_panel *panel, struct device *dev,
> > >                     const struct drm_panel_funcs *funcs, int connector_type)
> > >  {
> > > +       struct drm_bridge *bridge;
> > > +
> > >         INIT_LIST_HEAD(&panel->list);
> > >         INIT_LIST_HEAD(&panel->followers);
> > >         mutex_init(&panel->follower_lock);
> > >         panel->dev = dev;
> > >         panel->funcs = funcs;
> > >         panel->connector_type = connector_type;
> > > +
> > > +       bridge = devm_drm_panel_bridge_add(panel->dev, panel);
> > > +       WARN_ON(!bridge);
> > >  }
> > > 
> > > This is somewhat working but it requires more work because:
> > > 
> > >  * as it is, it creates a circular dependency between drm_panel and the
> > >    panel bridge, and modular builds will fail:
> > > 
> > >      depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
> > > 
> > >  * The panel bridge implementation should be made private to the panel
> > >    driver only (possibly helping to solve the previous issue?)  
> > 
> > Or merge drm_panel.c into bridge/panel.c.
> 
> Not sure here you mean exactly what you wrote, or the other way around.
> It looks more correct to me that the panel core (drm_panel.c) starts
> exposing a bridge now, and not that the panel bridge which is just one
> of many bridge drivers starts handling all the panel-related stuff.

No, I actually meant what I wrote: merge drm_panel.c into
bridge/panel.c. Indeed we have some drivers that use panel directly.
However drm_bridge is a more generic interface. So, yes, I propose to
have a bridge driver which incorporates panel support.

> 
> > The panel bridge already
> > exports non-standard API, so it should be fine to extend / change that
> > API. Likewise we might move drm_panel.c to drm_kms_helper.o, also
> > resolving the loop.
> 
> Again I'm not following I'm afraid. It would seem more logical to me to
> move things from the helper into drm.o as they become more necessary
> for common cases, rather than moving things out to a helper module and
> then force all panel drivers to depend on the helper module.

There are a lot of DRM drivers which do not use panels (nor bridges).
Merging that code into drm.ko means that everybody ends up having that
piece of code in memory. Moving drm_panel.o out of drm.ko and
bridge/panel.o out of drm_kms_helper.ko would make the kernel slightly
smaller for those desktop-only users.

> 
> Apologies, I'm perhaps not following your reasoning here. :(
> 
> > There will be a need for a Kconfig update in both
> > cases.
> > 
> > >  * Many drivers currently call devm_drm_panel_bridge_add() directly,
> > >    they should probably call drm_of_get_bridge instead  
> > 
> > I'd say, make it a stub that calls drm_of_get_bridge() with a possible
> > deprecation warning.
> 
> I get the idea, but it would need to be implemented differently because
> drm_of_get_bridge() calls devm_drm_panel_bridge_add(). They would loop

If the drm_bridge is added during drm_panel_add(), then there is no need
to call devm_drm_panel_bridge_add() from drm_of_get_bridge().

> into each other. I think we might simply add a check at the beginning
> of drm_panel_bridge_add_typed(), as in (pseudocode):
> 
> drm_panel_bridge_add_typed(struct drm_panel *panel, ...)
> {
>     if (panel_has_a_panel_bridge(panel))
>         return panel->panel_bridge.bridge;
> 
>     // existing code
> }
> 
> But that reopens the same issue: drm_panel_bridge_add_typed() would not
> always call drm_bridge_add(), so the caller doesn't know how to dispose
> of the returned pointer.
> 
> I think idea 3 can only work if the code understands that the panel
> bridge is created by the panel and they _never_ have to create it
> themselves. So handling the transition for all drivers would be quite
> painful.

That's why I suggested just stubbing existing functions just to lookup
and return a bridge: drivers can transition one-by-one. The bridge will
be already there, created by the panel support code.

> 
> > >  * drm_of_find_panel_or_bridge() should disappear: other drivers would
> > >    just look for a bridge  
> > 
> > Please keep it for now.
> > 
> > Some of the drivers think that it returns literally panel-or-bridge (but
> > not both). However if panel bridge is already created, it will return
> > both. So those drivers need to be updated.
> 
> I really believe it never returns both. The *bridge is set only when
> ret != 0 here [0], which can happen only if a panel was not found.
> Despite the slightly intricate logic of that function, I don't see how
> it could return both in its current implementation.

Indeed. You are right, I skipped the if(ret) condition. More boilerplate
code in the drivers :-(

> 
> [0]
> https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/gpu/drm/drm_of.c#L273
> 
> Luca
> 
> -- 
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
With best wishes
Dmitry
