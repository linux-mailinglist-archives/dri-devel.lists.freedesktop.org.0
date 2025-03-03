Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795B5A4C81D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 17:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F6110E4A9;
	Mon,  3 Mar 2025 16:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jBcHt+hu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2663910E4A9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 16:50:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1927444309;
 Mon,  3 Mar 2025 16:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741020614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s/VKy7RNZe04O3Ukil/E1YnYwXSSFhvFI8FQ/Orueu8=;
 b=jBcHt+hurhYQWG8MXM+6Q18iiRl00Kb8LtZaruiTkOJxYoRg6Tsu7WQ3EZJr9iTLlUQ1vG
 nv7evnIrAsOAYK3a99Ni9hxflAOy6GxeAqgOFFPgO+JPFAmSdc2RG6HfHK9CrOZBIeRhU2
 m3lt5bhjmtFhn6/zbY90dUpd1Ho6i7yazVoBVkWF43pZpXbdIVte8bcpStAVY1GCXPAzIc
 8JG+X8LStqmqMDH7m8bA/a8BiEHTH/L4KHdT8Q8Ukv2HyJd58nAbJbjtT4P7sQVsGPO5yc
 Mx7gpuh+lh/N46j4ABfHJO/biPY3j6RPqmMl13tR9HpgoPKE/gdhIxfL7DG3eA==
Date: Mon, 3 Mar 2025 17:50:11 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas
 Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 00/15] drm/bridge: Various quality of life improvements
Message-ID: <20250303175011.3f79a8c0@bootlin.com>
In-Reply-To: <20250303-idealistic-camouflaged-mandrill-4fb5f8@houat>
References: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
 <20250227120004.77814e09@bootlin.com>
 <20250303-urban-trout-of-vastness-f8d0e7@houat>
 <20250303143404.623a3178@bootlin.com>
 <20250303-idealistic-camouflaged-mandrill-4fb5f8@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelleeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejffelhfeiudetgeffieefgefgffdvuedvuedtvdefudduueekffelheehffekteenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnr
 gesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: herve.codina@bootlin.com
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

On Mon, 3 Mar 2025 16:00:33 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> On Mon, Mar 03, 2025 at 02:34:04PM +0100, Herve Codina wrote:
> > Hi Maxime,
> > 
> > On Mon, 3 Mar 2025 14:11:05 +0100
> > Maxime Ripard <mripard@kernel.org> wrote:
> >   
> > > On Thu, Feb 27, 2025 at 12:00:04PM +0100, Herve Codina wrote:  
> > > > Hi Maxime,
> > > > 
> > > > On Tue, 25 Feb 2025 17:43:48 +0100
> > > > Maxime Ripard <mripard@kernel.org> wrote:
> > > >     
> > > > > Hi,
> > > > > 
> > > > > Here's a series of changes after to the KMS helpers and bridge API
> > > > > following a bunch of reviews I did.
> > > > > 
> > > > > It's mostly centered across providing an easier time to deal with bridge
> > > > > states, and a somewhat consistent with the other entities API.
> > > > > 
> > > > > It's build tested only, with arm64 allmodconfig.
> > > > > 
> > > > > Maxime
> > > > > 
> > > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > > ---    
> > > > 
> > > > I Tried to test this series on my system but I've got a compilation issue.
> > > >      depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
> > > >      depmod: ERROR: Found 2 modules in dependency cycles!
> > > > 
> > > > CONFIG_DRM=m in my configuration.    
> > > 
> > > Could you share your configuration? it doesn't happen with allmodconfig.
> > >   
> > 
> > Here is a defconfig that leads to the issue on my side:  
> 
> I still can't reproduce it, sorry. Is this based on linux-next /
> drm-misc-next, or a private branch?
> 
> Maxime

Got it with this git history (based on 72d0af4accd9 available in
drm-misc-next):

f86431f9d3fc (HEAD -> test_maxime_series_drm_next_clean_v4) drm/bridge: ti-sn65dsi86: Use bridge_state crtc pointer
27b49a4a713f drm/bridge: tc358768: Convert to atomic helpers
f3f203c823e3 drm/bridge: tc358768: Stop disabling when failing to enable
89f4b115b1ca drm/bridge: tc358775: Switch to atomic commit
142be5c7910a drm/bridge: cdns-csi: Switch to atomic helpers
e6db675d871a drm/bridge: Introduce drm_bridge_is_atomic() helper
1745511b7394 drm/bridge: ti-sn65dsi83: Switch to drm_bridge_reset_crtc
e44654d4c9bd drm/tests: bridge: Provide tests for drm_bridge_reset_crtc
671a94f57f99 drm/bridge: Add helper to reset bridge pipeline
bcf02dc7fb61 drm/tests: Create tests for drm_atomic
f7b479b6f283 drm/atomic: Introduce helper to lookup connector by encoder
56d9fa19b833 drm/tests: Add kunit tests for bridges
9c86d5205422 drm/bridge: Provide a helper to retrieve current bridge state
3e0010915240 drm/bridge: Add encoder parameter to drm_bridge_funcs.attach
72d0af4accd9 (upstream_drm/for-linux-next, upstream_drm/drm-misc-next) drm/msm/dp: Add support for LTTPR handling
6dcc3c5121b7 drm/i915/dp: Use the generic helper to control LTTPR transparent mode
226a0baf9098 drm/nouveau/dp: Use the generic helper to control LTTPR transparent mode
...

Best regards
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
