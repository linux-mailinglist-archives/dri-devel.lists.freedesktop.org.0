Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0024C3D71D3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 11:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44916E90F;
	Tue, 27 Jul 2021 09:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35146E90F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 09:20:58 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id n11so7097047wmd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 02:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Yvx7FUb+PO9K9tu4D9agXVqaQ0PZBo5xaT5yPpMKIms=;
 b=SIunivkJ3uBUWFL+MmqRwoRt2Ec13tI5ReuRrYPHU6v1ozJHB0RqmiXR2kJtHg7UkK
 kQHeIhOqy40affcu0iFYZjipx4Rj7mvXor6+msSm/jLTCD0shhRncWpbA8dQZkMdDKxG
 CY2f7wiJ4ZZW/66YmNtctsKo4S5yBfyNtbbac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Yvx7FUb+PO9K9tu4D9agXVqaQ0PZBo5xaT5yPpMKIms=;
 b=NjinKtmiXP1vSY/7jxOQ7Y2sAD9SBwcZTLNGcRvhwPxsRTxy8Lro6sYR5RkYbWJZgp
 u1aumJVpwdsqL3csjGsRt7YzOBtHOTXAimwyEH+WF/50hlWv5sXNACqR4e7u4XuoCHZ8
 xQS2KyShyFjLScoFKMCCkGJXSnnpxq8VIHIR4KE/Iszpicr+JR0IeCsyzNjF7ZNDRlea
 KTcfIfoOx1Y36ESXVo+vH53LkOyo/9I0wzguZBECOsrQlr+3L79gUJe+FRbWz/ja4bDO
 e3twQen1JTQ8bZQlQxbFuKIDMvCqc9397wb4ZoIrt13ehw2uTKLMeG84AzOuewRL8LO9
 fe1Q==
X-Gm-Message-State: AOAM530qItZXdwLDZ8JGW0ZPwV1zQ7+A+IzUuxPbOBKxQjoMUvB9btdv
 MT/WnlAWbUTOWwfV5Y3Vn8Yk/g==
X-Google-Smtp-Source: ABdhPJysqoczxFjCBoJFO3VIH1BODqUjcyDz8tshadU8bwCX8Ub+Bjigbsxk+srbu2FSB8xv5JCr8A==
X-Received: by 2002:a05:600c:1c0d:: with SMTP id
 j13mr21332335wms.34.1627377657192; 
 Tue, 27 Jul 2021 02:20:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q19sm2002588wmq.38.2021.07.27.02.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 02:20:56 -0700 (PDT)
Date: Tue, 27 Jul 2021 11:20:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 04/10] drm/bridge: Document the probe issue with MIPI-DSI
 bridges
Message-ID: <YP/P9rJrZyk6zjsT@phenom.ffwll.local>
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
 <20210726151657.c46qmkdvqfhlg6ox@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726151657.c46qmkdvqfhlg6ox@gilmour>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 26, 2021 at 05:16:57PM +0200, Maxime Ripard wrote:
> Hi Daniel,
> 
> On Wed, Jul 21, 2021 at 02:05:01PM +0200, Daniel Vetter wrote:
> > On Tue, Jul 20, 2021 at 03:45:19PM +0200, Maxime Ripard wrote:
> > > Interactions between bridges, panels, MIPI-DSI host and the component
> > > framework are not trivial and can lead to probing issues when
> > > implementing a display driver. Let's document the various cases we need
> > > too consider, and the solution to support all the cases.
> > > 
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > 
> > I still have this dream that eventually we resurrect a patch to add
> > device_link to bridges/panels (ideally automatically), to help with some
> > of the suspend/resume issues around here.
> > 
> > Will this make things worse?
> > 
> > I think it'd be really good to figure that out with some coding, since if
> > we have incompatible solution to handle probe issues vs suspend/resume
> > issues, we're screwed.
> > 
> > Atm the duct-tape is to carefully move things around between suspend and
> > suspend_early hooks (and resume and resume_late) and hope it all works ...
> 
> My initial idea to fix this was indeed to use device links. I gave up
> after a while since it doesn't look like there's a way to add a device
> link before either the bridge or encoder probes.
> 
> Indeed the OF-Graph representation is device-specific, so it can't be
> generic, and if you need to probe to add that link, well, it's already
> too late for the probe ordering :)

But don't we still need the device_link for suspend/resume and module
reload? All very annoying indeed anyway.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
