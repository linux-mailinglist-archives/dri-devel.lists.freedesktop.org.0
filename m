Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B873D0E7E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 14:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF8A6E20E;
	Wed, 21 Jul 2021 12:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDA36E20E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 12:06:19 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k4so1919428wrc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 05:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=eCSPUArH7bL8REI5Gajkm+3GJJr0qAHdo8IFFReHMuY=;
 b=i0xkx1SUPQl2GpY/wmo0F1a6NzSEg7PwKEbYefjD/puTMxo+/oLxEKlhA1ge0UOOEP
 Cw3FBxrQLVWW8iKJLz1MxX47ZmmrsMDx9Zg9T71JbPUWlcRTWSWHwUxmsyqNUMo8p46c
 A6RToF/ca8X4CheGbTfcp9T6zdAvT/FV0v7u4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=eCSPUArH7bL8REI5Gajkm+3GJJr0qAHdo8IFFReHMuY=;
 b=kNOIy6fdvvkyYZ1KWRwxYyJ5fmeVjc99iQZ/Do4JfxZMwmmPhE9V+aPR4jhYlptz/5
 Ba9/8A3RMTU1CK8LHy96RA8i2elFI7fqyQ5i3SzRCxqK4tnJh6+GvwbIrWj8MZm3Vo7K
 gWOqkZ9WXXC50j1ewl7ZraVkJ+aZp9uQi6BprQdDY32u51+8OQs1i7NUHsiIqVAboO5u
 lztXGS11Zr6Y005TIBTohiRBwrfQkyxB2nK7YDsI+96VkCZEMw/5i8f0w4uqzFQflmuH
 9LkOY339Qwz+xjmlaTWp7ZxmR2DqeH4StF1mGxYGLdGM12SQYb9SXWkA38zqicnMaQud
 tWWA==
X-Gm-Message-State: AOAM530rZCctW+Uepod5rGrShQsHFfqERb9rclfQ1AWeMvrk8AyYP5Z5
 LXJ91M6LGhCE15vr3dDYDPfkcA==
X-Google-Smtp-Source: ABdhPJzt8gwrGvkEMnaa2/6yehKOs++w6DFTtB6q0IFfG3oTaJL+YaFHBefJWEtwJzUN2HWvTFwVTw==
X-Received: by 2002:adf:dcca:: with SMTP id x10mr41894037wrm.59.1626869178539; 
 Wed, 21 Jul 2021 05:06:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g18sm21898424wmk.37.2021.07.21.05.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 05:06:18 -0700 (PDT)
Date: Wed, 21 Jul 2021 14:06:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 04/10] drm/bridge: Document the probe issue with MIPI-DSI
 bridges
Message-ID: <YPgNuM14AAo16rMe@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <maxime@cerno.tech>,
 Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20210720134525.563936-1-maxime@cerno.tech>
 <20210720134525.563936-5-maxime@cerno.tech>
 <YPgNbVoNnq3fTMN2@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPgNbVoNnq3fTMN2@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Wed, Jul 21, 2021 at 02:05:01PM +0200, Daniel Vetter wrote:
> On Tue, Jul 20, 2021 at 03:45:19PM +0200, Maxime Ripard wrote:
> > Interactions between bridges, panels, MIPI-DSI host and the component
> > framework are not trivial and can lead to probing issues when
> > implementing a display driver. Let's document the various cases we need
> > too consider, and the solution to support all the cases.
> > 
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> I still have this dream that eventually we resurrect a patch to add
> device_link to bridges/panels (ideally automatically), to help with some
> of the suspend/resume issues around here.
> 
> Will this make things worse?
> 
> I think it'd be really good to figure that out with some coding, since if
> we have incompatible solution to handle probe issues vs suspend/resume
> issues, we're screwed.
> 
> Atm the duct-tape is to carefully move things around between suspend and
> suspend_early hooks (and resume and resume_late) and hope it all works ...

Just remembered: The other reason for device links was module ordering
fun. Especially when you have parts managed as a component. Currently if
you unload a bridge driver then in some cases the drm_device doesn't
rebind.
-Daniel

> 
> > ---
> >  Documentation/gpu/drm-kms-helpers.rst |  6 +++
> >  drivers/gpu/drm/drm_bridge.c          | 60 +++++++++++++++++++++++++++
> >  2 files changed, 66 insertions(+)
> > 
> > diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
> > index 10f8df7aecc0..ec2f65b31930 100644
> > --- a/Documentation/gpu/drm-kms-helpers.rst
> > +++ b/Documentation/gpu/drm-kms-helpers.rst
> > @@ -157,6 +157,12 @@ Display Driver Integration
> >  .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
> >     :doc: display driver integration
> >  
> > +Special Care with MIPI-DSI bridges
> > +----------------------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
> > +   :doc: special care dsi
> > +
> >  Bridge Operations
> >  -----------------
> >  
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index c9a950bfdfe5..81f8dac12367 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -95,6 +95,66 @@
> >   * documentation of bridge operations for more details).
> >   */
> >  
> > +/**
> > + * DOC: special care dsi
> > + *
> > + * The interaction between the bridges and other frameworks involved in
> > + * the probing of the display driver and the bridge driver can be
> > + * challenging. Indeed, there's multiple cases that needs to be
> > + * considered:
> > + *
> > + * - The display driver doesn't use the component framework and isn't a
> > + *   MIPI-DSI host. In this case, the bridge driver will probe at some
> > + *   point and the display driver should try to probe again by returning
> > + *   EPROBE_DEFER as long as the bridge driver hasn't probed.
> > + *
> > + * - The display driver doesn't use the component framework, but is a
> > + *   MIPI-DSI host. The bridge device uses the MIPI-DCS commands to be
> > + *   controlled. In this case, the bridge device is a child of the
> > + *   display device and when it will probe it's assured that the display
> > + *   device (and MIPI-DSI host) is present. The display driver will be
> > + *   assured that the bridge driver is connected between the
> > + *   &mipi_dsi_host_ops.attach and &mipi_dsi_host_ops.detach operations.
> > + *   Therefore, it must run mipi_dsi_host_register() in its probe
> > + *   function, and then run drm_bridge_attach() in its
> > + *   &mipi_dsi_host_ops.attach hook.
> > + *
> > + * - The display driver uses the component framework and is a MIPI-DSI
> > + *   host. The bridge device uses the MIPI-DCS commands to be
> > + *   controlled. This is the same situation than above, and can run
> > + *   mipi_dsi_host_register() in either its probe or bind hooks.
> > + *
> > + * - The display driver uses the component framework and is a MIPI-DSI
> > + *   host. The bridge device uses a separate bus (such as I2C) to be
> > + *   controlled. In this case, there's no correlation between the probe
> > + *   of the bridge and display drivers, so care must be taken to avoid
> > + *   an endless EPROBE_DEFER loop, with each driver waiting for the
> > + *   other to probe.
> > + *
> > + * The ideal pattern to cover the last item (and all the others in the
> > + * display driver case) is to split the operations like this:
> > + *
> > + * - In the display driver must run mipi_dsi_host_register() and
> > + *   component_add in its probe hook. It will make sure that the
> > + *   MIPI-DSI host sticks around, and that the driver's bind can be
> > + *   called.
> > + *
> > + * - In its probe hook, the bridge driver must not try to find its
> > + *   MIPI-DSI host or register as a MIPI-DSI device. As far as the
> > + *   framework is concerned, it must only call drm_bridge_add().
> > + *
> > + * - In its bind hook, the display driver must try to find the bridge
> > + *   and return -EPROBE_DEFER if it doesn't find it. If it's there, it
> > + *   must call drm_bridge_attach(). The MIPI-DSI host is now functional.
> > + *
> > + * - In its &drm_bridge_funcs.attach hook, the bridge driver can now try
> > + *   to find its MIPI-DSI host and can register as a MIPI-DSI device.
> > + *
> > + * At this point, we're now certain that both the display driver and the
> > + * bridge driver are functional and we can't have a deadlock-like
> > + * situation when probing.
> > + */
> > +
> >  static DEFINE_MUTEX(bridge_lock);
> >  static LIST_HEAD(bridge_list);
> >  
> > -- 
> > 2.31.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
