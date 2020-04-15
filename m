Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F951AB079
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 20:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4A56E10A;
	Wed, 15 Apr 2020 18:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416DB6E10A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 18:19:52 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id m2so873407otr.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 11:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qDxDIMcHnKDaTkDrbLBeWSZ7yxwOmULjzB6Wp84Gry8=;
 b=PuZEhih3dlWMagJPaUuPEjMXv/1GUEvIf7jj9DTY03EqHNtc8Td8wV0ktGADDG5mB2
 jOzmdcTJfWAD5Lk+9moKBcVdqmdwX0virSvhFc89WcR8/ibz3rNr4WrjrOZ/+BPbzRXa
 xgYXrA2z8kiQqnk6+kxe8XojUK4CdaWAf0llg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qDxDIMcHnKDaTkDrbLBeWSZ7yxwOmULjzB6Wp84Gry8=;
 b=SN/p2W/cJXhV0yYiJklMbRzaF8bLbCj48mKkZMR0H14FxnvAJgahGvCSP2VO8StKUj
 amT117+tF6Qs6yrFgBeo+zDHlduXHjmQWmIyixOvhpp2df5dbiWYor+nUQR82XpHwXrW
 pCp9YHIPwX5t8Taf3+mC6diZ6Z5bafsXdPZy9MT3aW8G8ovjNENGzewmhXheD58iLLT7
 X3PsHvMy7UYCZC4i/CsQCaCA76HzLYdm29vo6PEu/ZkHtcvHTSxe73a8Jzvbrwj184Mz
 +W/r2/49PH+Eo/8NFvcA3C3Bn72r4lUGPNxs6kwZhfdrJdlFBySvOAXjlcOXHzzrT8Sa
 9ocQ==
X-Gm-Message-State: AGi0Pubh85K7rqqhXZBIFD+ZLMarHKPtYolOd/ZXNaQU6IJ2Pq6p6FwX
 UP4m2SemNNFbU1rCfvkDVUpnr/DpeGwdIMBhWv0WvQ==
X-Google-Smtp-Source: APiQypK0gKEatV6VpbU9iXQiNjarWYr2s5X4uXhypG6Gqv8rCEeC4zmimWMk+2UsYgO4mNlxLi02Xb15qmcewfcSWDs=
X-Received: by 2002:a9d:2056:: with SMTP id n80mr24772595ota.281.1586974791387; 
 Wed, 15 Apr 2020 11:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200415173833.312706-1-daniel.vetter@ffwll.ch>
 <20200415174806.GL4758@pendragon.ideasonboard.com>
 <20200415180620.GK3456981@phenom.ffwll.local>
 <20200415181223.GN4758@pendragon.ideasonboard.com>
In-Reply-To: <20200415181223.GN4758@pendragon.ideasonboard.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 15 Apr 2020 20:19:40 +0200
Message-ID: <CAKMK7uE=iOvzqoDsr68C5yX=kUAfAT=V_G3Kg8QwFzh9-794dQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: Move mhl.h into driver directory
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonas Karlman <jonas@kwiboo.se>, Alexey Brodkin <abrodkin@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 8:12 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Daniel,
>
> On Wed, Apr 15, 2020 at 08:06:20PM +0200, Daniel Vetter wrote:
> > On Wed, Apr 15, 2020 at 08:48:06PM +0300, Laurent Pinchart wrote:
> > > On Wed, Apr 15, 2020 at 07:38:33PM +0200, Daniel Vetter wrote:
> > > > include/drm/bridge is a bit a mistake, drivers are supposed to find
> > > > their bridges using one of the standard of_* functions the drm_bridge
> > > > core provides.
> > >
> > > I'm confused, I don't really see how that's related to mhl.h. The header
> > > defines constants and structures related to the MHL (Mobile
> > > High-Definition Link) protocol, which is an industry standard. If you
> > > want to move it out of include/drm/bridge/ to eventually remove that
> > > directory, I think it should be renamted to include/drm/drm_mhl.h.
> >
> > It looked misplaced at least ... I guess moving this out of drm/bridge
> > makes more sense.
> >
> > > > dw-hdmi and analogix-dp are the only, historically
> > > > grown exception that we haven't managed to get rid of yet.
> > >
> > > The reason why we have shared headers for those is because they're IP
> > > cores integrated with different glue layers in different SoCs. There's
> > > one driver for the IP core itself, and SoC-specific glue drivers that
> > > need to provide the IP core drivers with data and callbacks, defined in
> > > shared headers. Granted, there's also data in those headers that are
> > > only internal to the IP core drivers, and that should be moved out, but
> > > for the interface header, include/drm/bridge/ doesn't seem to be a bad
> > > location to me.
> >
> > The thing that irks me on them is that they kinda implement bridges, but
> > they don't load like bridges. That's the part I think should get changed,
> > or we need to finally figure out what exactly isn't good with the current
> > drm_bridge handling and get that fixed (the relevant patches seem forever
> > stuck in limbo, hence why I'm kicking).
>
> dw-hdmi certainly loads like a bridge when used with R-Car DU :-) Are
> you referring to the component-based probe mode for that driver ?

Yeah I guess component.c hand-rolled loading vs. just calling
of_drm_find_bridge and then binding that to the encoder. Component.c
is meant for driver-specific building blocks, imo for anything that's
as standardized as drm_bridge at least aims to be it's totally the
wrong thing.

The other issue is that imo there's no abstraction between the part
that binds something like dw-hdmi on the drm_device side, and the side
that implements its on the drm_bridge side. The drm_bridge interface
feels very fake in that regard, and that's why I think we should:
- move the binding point slightly out, so that the variant-specific
binding stuff is behind the abstraction
- convert the dw-hdmi library to a helper library, with the
variant-specific binding drivers in the driver seat. If you look
through the code dw_hdmi_probe is full of switch statements and if
ladders and that's all to special case specific variants. That's
screaming midlayer mistake :-)

> > If that's not possible because these things just dont fit as drm_bridge,
> > then maybe they shouldn't be a bridge, but something else. But looking at
> > both dw-hdmi and analogix-dp these things look a lot like midlayers that
> > get fed huge structures. Instead of more bare-bones toolboxes to build a
> > set of similar drm_bridge drivers, which drivers then bind into using dt.
> >
> > So all a bit fishy imo.
> >
> > I guess step 1 at least would be to throw the connector and encoder code
> > out of all these drivers, that would be at least a first step.
>
> Oh yes!! DRM_BRIDGE_ATTACH_NO_CONNECTOR for everybody :-) It's a
> step-by-step process though:
>
> 1. Convert bridge drivers to support both modes (adding support for
>    DRM_BRIDGE_ATTACH_NO_CONNECTOR).
> 2. Convert display drivers to make use of DRM_BRIDGE_ATTACH_NO_CONNECTOR
>    (with the DRM bridge connector helper, or custom code if really
>    needed).
> 3. Remove support for the !DRM_BRIDGE_ATTACH_NO_CONNECTOR mode in bridge
>    drivers.
> 4. Drop the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag itself.
>
> Sam and I are working on the first step (I'll convert the dw-hdmi driver
> soon), and we're passing the message around that new bridge drivers
> must support DRM_BRIDGE_ATTACH_NO_CONNECTOR and new display controller
> drivers must use it.

Yup, I think that's at least one problem I'm seeing here with these.
But there's a pile more I think.
-Daniel

>
> > Next one maybe push the per-variant bind code into drm/bridge and out of
> > drivers, and use more standard of_ functions to find the bridges and tie
> > them into the drm_device.
> >
> > Then 3rd round, some refactoring to demidlayer these libraries and make
> > them real toolboxes.
> >
> > > > Make sure that at least no new ones grow by moving hardware header
> > > > files into the correct driver directory.
> > > >
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > Cc: Alexey Brodkin <abrodkin@synopsys.com>
> > > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > > > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > > > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > > > Cc: Jonas Karlman <jonas@kwiboo.se>
> > > > Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > Cc: Kate Stewart <kstewart@linuxfoundation.org>
> > > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > > Cc: Allison Randal <allison@lohutok.net>
> > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
> > > > ---
> > > >  {include => drivers/gpu}/drm/bridge/mhl.h | 0
> > > >  drivers/gpu/drm/bridge/sii9234.c          | 3 ++-
> > > >  drivers/gpu/drm/bridge/sil-sii8620.c      | 2 +-
> > > >  3 files changed, 3 insertions(+), 2 deletions(-)
> > > >  rename {include => drivers/gpu}/drm/bridge/mhl.h (100%)
> > > >
> > > > diff --git a/include/drm/bridge/mhl.h b/drivers/gpu/drm/bridge/mhl.h
> > > > similarity index 100%
> > > > rename from include/drm/bridge/mhl.h
> > > > rename to drivers/gpu/drm/bridge/mhl.h
> > > > diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> > > > index b1258f0ed205..4c862c3af038 100644
> > > > --- a/drivers/gpu/drm/bridge/sii9234.c
> > > > +++ b/drivers/gpu/drm/bridge/sii9234.c
> > > > @@ -12,7 +12,6 @@
> > > >   *    Shankar Bandal <shankar.b@samsung.com>
> > > >   *    Dharam Kumar <dharam.kr@samsung.com>
> > > >   */
> > > > -#include <drm/bridge/mhl.h>
> > > >  #include <drm/drm_bridge.h>
> > > >  #include <drm/drm_crtc.h>
> > > >  #include <drm/drm_edid.h>
> > > > @@ -29,6 +28,8 @@
> > > >  #include <linux/regulator/consumer.h>
> > > >  #include <linux/slab.h>
> > > >
> > > > +#include "mhl.h"
> > > > +
> > > >  #define CBUS_DEVCAP_OFFSET               0x80
> > > >
> > > >  #define SII9234_MHL_VERSION              0x11
> > > > diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
> > > > index 92acd336aa89..017dbb67404e 100644
> > > > --- a/drivers/gpu/drm/bridge/sil-sii8620.c
> > > > +++ b/drivers/gpu/drm/bridge/sil-sii8620.c
> > > > @@ -8,7 +8,6 @@
> > > >
> > > >  #include <asm/unaligned.h>
> > > >
> > > > -#include <drm/bridge/mhl.h>
> > > >  #include <drm/drm_bridge.h>
> > > >  #include <drm/drm_crtc.h>
> > > >  #include <drm/drm_edid.h>
> > > > @@ -31,6 +30,7 @@
> > > >
> > > >  #include <media/rc-core.h>
> > > >
> > > > +#include "mhl.h"
> > > >  #include "sil-sii8620.h"
> > > >
> > > >  #define SII8620_BURST_BUF_LEN 288
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
