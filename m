Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30369985778
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 12:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B92710E7E4;
	Wed, 25 Sep 2024 10:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="kwrMlGXp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDA210E06C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 10:59:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 831B060004;
 Wed, 25 Sep 2024 10:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1727261942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xe5/2RvZiCjpp536f/aZHEPbaWodWphQ8YXt0yFzsUQ=;
 b=kwrMlGXpIpE2MqDD5Qu/zDMmAK0C/3HSo2JFecxDrBKP56lfbZVieu/Xfpk44AtdTJFDAx
 OlbOAjTfrOIf0lZkYgq9v6O7C6WpYXdSEJz/hhChrSdh81bahFWwBHHXkxP9+E+xZkVjOK
 rFaRa9adNy+rsCko+T7ib8RmR9kSpy6jHNS+h9S8z0xp2oL7BERHiXsd8AoK6LXX2QY9tm
 jRyoq2dlWGJl8lCpeVW6cQRzPQ3JPOujleF1XQ3aUAe6MdttJSjpiwcSE3mgOWqA0+tTOZ
 Od6HAYTh34B6UHJ8N3qBHK2EOABV8iu5IYGW2N/isUX484jnrYNMJdz9uw/tYw==
Date: Wed, 25 Sep 2024 12:58:56 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, Paul
 Kocialkowski <contact@paulk.fr>, =?UTF-8?Q?Herv=C3=A9?= Codina
 <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Paul
 Kocialkowski <paul.kocialkowski@bootlin.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 0/5] Add support for GE SUNH hot-pluggable connector
 (was: "drm: add support for hot-pluggable bridges")
Message-ID: <20240925125856.321f7ef7@booty>
In-Reply-To: <ZvJ3vUCLsowLr_Mv@phenom.ffwll.local>
References: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
 <ZkYIeWzYyxkURS79@phenom.ffwll.local>
 <20240520140148.26b91240@booty>
 <ZkyND17TGj6y0Wjq@phenom.ffwll.local>
 <20240823123903.1c793c4b@booty>
 <Zs4AuPPHaFY0WzBZ@phenom.ffwll.local>
 <20240909152604.1dd27605@booty>
 <ZvJ3vUCLsowLr_Mv@phenom.ffwll.local>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Hello Simona,

[+Cc: Dmitry Baryshkov who took part to the LPC discussion]

On Tue, 24 Sep 2024 10:26:37 +0200
Simona Vetter <simona.vetter@ffwll.ch> wrote:

> On Mon, Sep 09, 2024 at 03:26:04PM +0200, Luca Ceresoli wrote:

...

> > There is a fundamental question where your position is not clear to me.
> > Based on this:
> >   
> > > - The last fixed bridges knows that all subsequent bridges are hotplugged.  
> >     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  
> > >   Which means instead of just asking for the next bridge, it needs to ask
> > >   for the fully formed bridge chain, including the connector.
> > >   
> > 
> > and this:
> >   
> > > - The hotplug bridge connector code checks every time a new bridge shows  
> >     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  
> > >   up whether the chain is now complete. Once that is the case, it creates
> > >   the connector (with the new bridge design this is no longer the job of
> > >   the last bridge in the chain, so we need to require that for
> > >   hotpluggable bridges). Then it can attach all the bridges to that
> > >   connector, and hand the entire fully formed chain to the last fixed
> > >   bridge to hotplug insert and register.  
> > 
> > The question is: do you think the hotplug-bridge driver should be
> > present, or not? To me the two above sentences appear to contradict each
> > other.
> > 
> > The reason we decided to implement a hotplug DRM bridge is it allows to
> > decouple the fixed and the remote segments of the pipeline, in such a
> > way that all the regular bridge drivers don't need any special handling
> > to support hotplug.
> > 
> > In my work the upstream bridge driver is samsung-dsim.c and the
> > downstream one is ti-sn65dsi83.c and none of them needed a single line
> > changed to support hotplug. I think this is useful: virtually any
> > physical bridge with pins can be used in a hotplug setup, either in the
> > fixed or in the removable section, so not needing to modify them is
> > valuable.
> > 
> > OTOH in various parts of this and other e-mails you seem to imply that
> > there should be no hotplug-bridge (not as a struct drm_bridge, not as
> > a driver, or both). Except for the fact that there is no chip
> > implementing such a bridge (there is a physical connector though) I do
> > not see many reasons.  
> 
> Yeah you can have a dummy hotplug-bridge driver which just represents the
> hotplug connector, I don't see an issue with that. And sounds like a
> reasonable idea if it helps modelling with DT and all that.
> 
> What I described above was just focused on the interaction between bridge
> drivers and the hotplug support code. I think you absolutely need the last
> bridge driver to be aware that the entire subsequent chain is hotplugged,
> otherwise it wont work. That last bridge driver can be a special
> hotplug driver, but it doesn't need to be the case.

I see, that clarifies your position, thanks.

...

> > > Yeah we need special functions, which the last fixed bridge needs to call
> > > instead of the current set of functions. So instead of of_drm_find_bridge
> > > we need something like of_drm_register_hotplug_source_bridge or similar.  
> > 
> > Continuing on the above topic, are you suggesting that there should be
> > no hotplug-bridge, and that every bridge that can be used as the "last
> > fixed bridge" should handle the hotplug case individually?
> > 
> > If that is the case, we'd need to modify any bridge driver that people
> > want to use as "last fixed bridge" to:
> > 
> >  1. know they are the "last fixed bridge" (via device tree?)
> >  2. use of_drm_register_hotplug_source_bridge()
> >     instead of of_drm_find_bridge() accordingly  
> 
> This depends upon the dt design. If the dt design has a separate distinct
> hotplug node, then we could bind a hotplug bridge against that, which is
> aware.
> 
> But I think for some case (maybe dsi nodes) the dt design would be more an
> attribute somewhere plus a link to the first hotplugged element. And in
> that case the last physical bridge driver needs to be aware of that - we
> simply don't have any dt node we can bind the hotplug bridge driver
> against. I think the generic bridge hotplug design should not make an
> assumption about how the dt is designed here and allow both.
> 
> Also if the dt design for the approach without a separate hotplug
> connector is standardized, we can have a of_drm_handle_next_bridge
> function which does the right thing for both cases automatically. I think
> that way the impact on existing bridge drivers is minimal.

Pushing this even more, instead of having bridges aware of being the
last fixed ones, I've been pondering on a structure where every bridge
assumes the next one could disappear, and works appropriately. So the
current case (all bridges are fixed) would be just a special case where
the next bridge is found initially and never disappears.

This would probably be cleaner, no [if (hotplug) {this} else {that}]
constructs, but I'm concerned about the transition path for old
poorly-maintained drivers.

...

> > > > > Instead I think that code should be directly in core bridge code (I don't
> > > > > see the benefit of having this entirely in a separate driver), using drm
> > > > > locking to make sure there's no races.    
> > > > 
> > > > Not sure I got what you mean here. Which one of the following?
> > > > 
> > > >  1. The entire hotplug-bridge driver should not exist, and the DRM
> > > >     core should handle it all (seems not doable, this driver has lots of
> > > >     device-specific details)
> > > >  2. The hotplug-driver should exist, but the code to attach/detach the
> > > >     pipeline on hotplug/unplug should be moved to the core, with the
> > > >     hotplug-driver providing callbacks for the device-specific aspects
> > > >  3. Same as 2, but additionally the hotplug-bridge should become a
> > > >     connector driver (hotplug-connector.c?) -- not sure it can decouple
> > > >     the two sides without a bridge however
> > > >  4. None of the above    
> > > 
> > > 3, roughly. The connector creation must be in core bridge code, or things
> > > will go boom.  
> > 
> > Based on this I think you mean:
> > 
> >  1. the hotplug-*something* driver should exist  
> 
> This part I'm not sure is required, see my comments above. I think it
> depends upon how the dt design ultimately will look like, and I don't have
> an input on that.
> 
> >  2. it should add the fixed connector (DSI in my case) on probe
> >  3. it should add/remove the removable connector (LVDS) on hot(un)plug  
> 
> The new bridge design is that bridges do _not_ create connectors
> themselves. Instead the driver does that, using the bridge code as helpers
> to make sure things work correctly.
> 
> But aside from that I think this sounds good. I'm not sure you need the
> connector from step 2, but it shouldn't hurt either. With dp mst we create
> that connector because dp can also be driven directly without mst, so
> there we need that connector to be able to do modesets from userspace.

I had a sort of assumption that the fixed connector is needed to even
populate the card, not sure I was correct. Surely from a high-level API
it would make sense to remove it.

I'll postpone this aspect to a later moment, and by that time questions
about the hotplug-bridge will have been clarified. Right now I'm going
to tackle the drm_bridge refcounting.

> >  4. it should add _no_ bridge (in the sense of struct drm_bridge)
> >     [not sure it can still decouple the fixed VS addon pipeline parts]  
> 
> Yeah that's the tricky part, but definitely those hotplugged bridges
> should not be part of the currently existing bridge chain, because that
> cannot cope with hotplugs.

Not sure what you mean here, and what you mean by "the currently
existing bridge chain".

Do you mean hot-plugged bridges, when present, should not be in the
global bridge_list? That would make sense, sure.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
