Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F3614F1F2
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 19:08:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478956FBCD;
	Fri, 31 Jan 2020 18:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20B86FBD3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 18:08:30 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s10so8955284wmh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 10:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=D8/xsMbR/1C0MwwMOIRTL1zG4nSwZ0s7u5Zu3XQfNwM=;
 b=k/miQjGosr8Qq+sNUdmKHQIanY6GKem8TVK5BMnmBa5hE/J6cZ+rrptRilf5U2JqHl
 9iGjkSHee+kWJhw2/+aN0Xo60NozixAYos32AE7qBiGHkEQ577UVF5Bf+dF/Zwb8lut7
 dFq6p0JtuqxtJveL7E3mVHY7EGuk9MAJZUMrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D8/xsMbR/1C0MwwMOIRTL1zG4nSwZ0s7u5Zu3XQfNwM=;
 b=D9n7AxK5jsaBv4U4T3QZ9I1tJ5bvcLjempaItTlKWF0Ex0W/gwwQyds2+5iAbIMHXy
 G2EfZf/pvEjdxLrxGtyBzqtfDwCcKg2Ou1wiKEGYWWMsm0UwH0FSzFZETP/JZ0zUv/BK
 LXhXMifQyGO5MdO2aCaAFg576qZ7/Xa97qFLk9oTD0hYgHgBx07Y4RZJJjh3L/FuCT01
 ghhPV9OmGkfFv9cVUahiUYy2f4t952Kp6ZK6u99PdzDf8ChlOS/RmG08VfaOrTydMjMi
 fNrtXU9hLDTE7Vu0GBpPdLpL7uPG8dNGeqT9FV+ztSnlePT2ZryQqeIHoloMzqLZVFoD
 4mAA==
X-Gm-Message-State: APjAAAUrwcMvnJvnqcKprcuzkG7tslLAM+GYUJfD5n8ZZVyxnS0QI+zd
 DYBi00zZqPnGCmgRNX03bqpyVg==
X-Google-Smtp-Source: APXvYqwYvtVHJrAFR5skp02TD59UIcI7Dpfa7ZdmIEDocr5H02fBwVRkIDgGAFjK6lnalWJC0u9LQQ==
X-Received: by 2002:a1c:e2c3:: with SMTP id z186mr13396519wmg.70.1580494109356; 
 Fri, 31 Jan 2020 10:08:29 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a9sm11599623wmm.15.2020.01.31.10.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 10:08:27 -0800 (PST)
Date: Fri, 31 Jan 2020 19:08:25 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v10 00/12] drm: Add support for bus-format negotiation
Message-ID: <20200131180825.GO43062@phenom.ffwll.local>
References: <20200128135514.108171-1-boris.brezillon@collabora.com>
 <20200131164244.6955ec45@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200131164244.6955ec45@collabora.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Mark Rutland <mark.rutland@arm.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 intel-gfx-trybot@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 31, 2020 at 04:42:44PM +0100, Boris Brezillon wrote:
> On Tue, 28 Jan 2020 14:55:02 +0100
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
> > Hello,
> > 
> > This patch series aims at adding support for runtime bus-format
> > negotiation between all elements of the
> > 'encoder -> bridges -> connector/display' section of the pipeline.
> > 
> > In order to support that, we need drm bridges to fully take part in the
> > atomic state validation process, which requires adding a
> > drm_bridge_state and a new drm_bridge_funcs.atomic_check() hook.
> > Once those basic building blocks are in place, we can add new hooks to
> > allow bus format negotiation (those are called just before
> > ->atomic_check()). The bus format selection is done at runtime by  
> > testing all possible combinations across the whole bridge chain until
> > one is reported to work.
> > 
> > No fundamental changes in this v10, just collected R-bs, addressed
> > Philipp's comments and moved the changelog back to the visible part
> > of the commit message.
> > 
> > I plan to apply patches 1 to 7 soon, so if there's anything you don't
> > like in there, please say it now. Still waiting for review on the LVDS
> > bridge and panel stuff.
> > 
> > This patch series is also available here [1].
> > 
> > Thanks,
> > 
> > Boris
> > 
> > [1]https://github.com/bbrezillon/linux-0day/commits/drm-bridge-busfmt-v10
> > 
> > Boris Brezillon (12):
> >   drm/bridge: Add a drm_bridge_state object
> >   drm/rcar-du: Plug atomic state hooks to the default implementation
> >   drm/bridge: analogix: Plug atomic state hooks to the default
> >     implementation
> >   drm/bridge: Patch atomic hooks to take a drm_bridge_state
> >   drm/bridge: Add an ->atomic_check() hook
> >   drm/bridge: Add the necessary bits to support bus format negotiation
> >   drm/imx: pd: Use bus format/flags provided by the bridge when
> >     available
> 
> Patches 1 to 7 applied.
> 
> >   drm/bridge: lvds-codec: Implement basic bus format negotiation
> >   dt-bindings: display: bridge: lvds-codec: Add new bus-width prop
> >   drm/bridge: panel: Propage bus format/flags
> 
> Laurent, when you find some time, could you have a look at patches 8-10?
> 
> >   drm/panel: simple: Fix the lt089ac29000 bus_format
> 
> Sam, I'll let you apply that one since dim complained that it was
> missing a R-b (you only gave your A-b).

A-b should be enough ... some typo in the A-b tag maybe?
-Daniel

> 
> >   ARM: dts: imx: imx51-zii-rdu1: Fix the display pipeline definition
> > 
> >  .../bindings/display/bridge/lvds-codec.yaml   |   8 +
> >  arch/arm/boot/dts/imx51-zii-rdu1.dts          |  24 +-
> >  .../drm/bridge/analogix/analogix_dp_core.c    |  44 +-
> >  drivers/gpu/drm/bridge/lvds-codec.c           |  64 ++-
> >  drivers/gpu/drm/bridge/panel.c                |   4 +
> >  drivers/gpu/drm/drm_atomic.c                  | 116 +++++
> >  drivers/gpu/drm/drm_atomic_helper.c           |  73 ++-
> >  drivers/gpu/drm/drm_atomic_state_helper.c     | 103 +++++
> >  drivers/gpu/drm/drm_bridge.c                  | 437 +++++++++++++++++-
> >  drivers/gpu/drm/imx/parallel-display.c        | 177 ++++++-
> >  drivers/gpu/drm/panel/panel-simple.c          |   2 +-
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c           |  11 +-
> >  include/drm/drm_atomic.h                      |  76 +++
> >  include/drm/drm_atomic_helper.h               |   8 +
> >  include/drm/drm_atomic_state_helper.h         |  13 +
> >  include/drm/drm_bridge.h                      | 179 ++++++-
> >  16 files changed, 1258 insertions(+), 81 deletions(-)
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
