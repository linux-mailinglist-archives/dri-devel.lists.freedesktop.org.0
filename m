Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B730A21D93
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 14:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508BF10E7F5;
	Wed, 29 Jan 2025 13:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="I3AFh5mb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B482110E7F5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 13:11:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D41DA442EF;
 Wed, 29 Jan 2025 13:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738156300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8HgcJtHNXDb9K1nOfZ+HqLoD2HMmB8+mqhC5v0ZMXaQ=;
 b=I3AFh5mb8yfxGmI5bk4VkzrfR2gQyg/9py/0qIH1dJa6j9ML63Mzmx5bBis2fnbnmbQSZ7
 IPT58oYLy2sIPYa9oZbo7xRkycofNvvb3RxbhBx78q9/oLXE/54esdrSBE2s04t5YPVhqh
 Gl9MMKJecggbVb6psYKy50II4LgtRgMnm84tH/kETqvFaSDfwstf2Dpe2mD3JYSsNbgCwz
 ZKObaxEiVhtxQaAQDbGzFsry7HssZeSSMbUZIcF6CxsWFTQl+g3CEMlgahkRMBh4gu8Xif
 aGTHWgIR8b4WasSubsjFBDtJ86yI7hEnFZk+jM85Z2ovSry/BWbV9IseVCd2vQ==
Date: Wed, 29 Jan 2025 14:11:35 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Thompson <danielt@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, Paul
 Kocialkowski <contact@paulk.fr>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?UTF-8?Q?Herv?=
 =?UTF-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, Paul
 Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 04/10] drm/bridge: add documentation of refcounted
 bridges
Message-ID: <20250129141135.28b01ff9@booty>
In-Reply-To: <yipjwosmkqsadvhulzh76ydqbfvv5npdafl3yzdjmikfa2yq4y@j7nj4audwxl7>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-4-173065a1ece1@bootlin.com>
 <20250106-vigorous-talented-viper-fa49d9@houat>
 <CAA8EJprhe4+9HwjW-=4K_LUD5pw51ij_dk0SZABbKH+ExnjdzQ@mail.gmail.com>
 <20250108162429.53316041@booty>
 <20250108-astonishing-oarfish-of-energy-c0abbe@houat>
 <20250122171230.30cf9b97@booty>
 <jiwexbvzcrq7hywl5t25cojrgjnyv5q2wnb2kvgriucal6764w@hhrefcftcjza>
 <20250129125153.35d0487a@booty>
 <yipjwosmkqsadvhulzh76ydqbfvv5npdafl3yzdjmikfa2yq4y@j7nj4audwxl7>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsgefsgekmeejrghfgeemkeekgeefmegvhedufhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsgefsgekmeejrghfgeemkeekgeefmegvhedufhdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtohepughmihhtrhihrdgsrghrhihshhhkohhvsehlihhnrghrohdrohhrghdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhp
 dhrtghpthhtohepihhnkhhirdgurggvsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepjhgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhg
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

On Wed, 29 Jan 2025 14:22:30 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Wed, Jan 29, 2025 at 12:51:53PM +0100, Luca Ceresoli wrote:
> > Hi Maxime,
> > 
> > On Tue, 28 Jan 2025 15:49:23 +0100
> > Maxime Ripard <mripard@kernel.org> wrote:
> >   
> > > Hi,
> > > 
> > > On Wed, Jan 22, 2025 at 05:12:30PM +0100, Luca Ceresoli wrote:  
> > > > On Wed, 8 Jan 2025 17:02:04 +0100
> > > > Maxime Ripard <mripard@kernel.org> wrote:
> > > > 
> > > > [...]
> > > >     
> > > > > > > > And we'll also need some flag in drm_bridge to indicate that the device
> > > > > > > > is gone, similar to what drm_dev_enter()/drm_dev_exit() provides,
> > > > > > > > because now your bridge driver sticks around for much longer than your
> > > > > > > > device so the expectation that your device managed resources (clocks,
> > > > > > > > registers, etc.) are always going to be around.        
> > > > > > 
> > > > > > Yes, makes sense too. That should be a drm_bridge_enter/exit(), and
> > > > > > drm_bridge.c will need to be sprinkled with them I guess.      
> > > > > 
> > > > > The users would be the drivers, most likely. There's not much we can do
> > > > > at the framework level, unfortunately.    
> > > > 
> > > > Back to the idea of a "gone" flag, or perhaps an "unplugged" flag to
> > > > be consistent with the struct drm_device naming, and
> > > > drm_bridge_enter()/drm_bridge_exit(), I did a few experiments and have
> > > > a question.
> > > > 
> > > > In case:
> > > > 
> > > >   a) there is a notification callback to inform about bridges
> > > >      being removed, and
> > > >   b) all entities owning a struct drm_bridge pointer stop using
> > > >      that pointer when notified
> > > > 
> > > > 
> > > > With the above, there should be no need for
> > > > drm_bridge_enter()/drm_bridge_exit(). Nobody will be using a pointer to
> > > > a bridge that is being removed.
> > > > 
> > > > Now, about a), patch 1 in this series implements such a mechanism to
> > > > inform all bridges when a bridge is being removed. Note that the
> > > > "unplugged" flag would be set immediately after the notifier callback
> > > > is currently called: "unplugged == true" will never happen before the
> > > > callback, and after the callback there will be no pointer at all.
> > > > 
> > > > Patch 1 however is only notifying bridges, so other entities (e.g.
> > > > encoders) cannot be notified with this implementation. However a
> > > > different notification mechanism can be implemented. E.g. until v3 this
> > > > series was using a generic struct notifier_block for this goal [0], so
> > > > any part of the kernel can be notified.
> > > > 
> > > > About b), the notification appears simpler to implement in the various
> > > > drivers as it needs to be added in one place per driver. Also adding
> > > > drm_bridge_enter()/exit() can be trickier to get right for non-trivial
> > > > functions.
> > > > 
> > > > Do you see any drawback in using a notification mechanism instead of
> > > > drm_bridge_enter()/exit() + unplugged flag?    
> > > 
> > > Yeah, because we're not considering the same thing :)
> > > 
> > > The issue you're talking about is that you want to be notified that the
> > > next bridge has been removed and you shouldn't use the drm_bridge
> > > pointer anymore.
> > > 
> > > A notification mechanism sounds like a good solution there.
> > > 
> > > The other issue we have is that now, we will have the drm_bridge pointer
> > > still allocated and valid after its device has been removed.
> > > 
> > > In which case, you need to be able to tell the bridge driver whose
> > > device got removed that the devm resources aren't there anymore, and it
> > > shouldn't try to access them.
> > > 
> > > That's what drm_bridge_enter()/exit is here for.  
> > 
> > Let me rephrase to check I got what you mean.
> > 
> > A) On bridge removal, use a notifier to notify all consumers of that
> > bridge that they have to stop using the pointer to the bridge about to
> > be removed.
> > 
> > B) Internally in the bridge driver (provider) use
> > drm_bridge_enter()/exit() to forbid access to resources when the
> > hardware is unplugged.
> > 
> > And also: bridge consumers won't need to use drm_bridge_enter()/exit()
> > as they will clear their pointer before setting the unplugged flag.
> > 
> > Is my understanding of your idea correct?
> > 
> > If it is, I tend to agree, and I like it.
> > 
> > I like it, except for one point  I'm afraid. Why do we need enter/exit
> > inside the driver (provider) code? At driver release, the driver
> > instance won't exist anymore. Sure the private struct embedding a
> > struct drm_bridge will be still allocated for some time, but the struct
> > device will not exist, and the device driver instance as well.  
> 
> You have to sync several possible kinds of events: bridge calls from DRM
> core, from HDMI audio, CEC, DP AUX _and_ completely async device
> 'remove' / unbind callbacks.

Ah, yes, that make sense. Looks like the big picture w.r.t. notifiers
and enter/exit is clear -- until implementation time at least ;)

Thanks,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
