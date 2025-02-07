Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8D2A2BEA7
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 10:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26BF10EA73;
	Fri,  7 Feb 2025 09:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GSWncqUo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0821710EA72
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 09:01:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BCAD43310;
 Fri,  7 Feb 2025 09:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738918874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9QuQO7QcmtLV3YXSW7XXjQXJN3jM1qRLRyaLw973vGc=;
 b=GSWncqUoCRG8fOhlT1BgumurcgFCDidy4afWlPmtggBq1JnOWRBv0IxGG6+BVetOGhKI5S
 FF37VhIlCH9QHylO0jP/kUcPqysMvln62a/xDma3U4U8SigHrBqroWmm7BebHh7MkS5rpA
 d5sHWvyX8FACg0kX2BZo6ar5hYhGCCVRTcHhtDSoqNWURaS5bfwznlJxJmhFHjMJ51DQoH
 CPekqRTO8wuxdDKL1V54skt5X7MFs9mmgN1F0ZmSYZU6o95lXcf7QBfN+f6lzbr78r3sHA
 85xB/aKdHHqCGWQRnven2+sfGhYqFYSaZexbKwZeD6sxLphwseutALcfRD68gQ==
Date: Fri, 7 Feb 2025 10:01:10 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard
 <mripard@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?UTF-8?Q?Herv?=
 =?UTF-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 00/26] Add support for hot-pluggable DRM bridges
Message-ID: <20250207100110.3bc5baef@booty>
In-Reply-To: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeekiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegtvgejvgemiegtgegvmeeitggtjeemleekgeejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegtvgejvgemiegtgegvmeeitggtjeemleekgeejpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefjedprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepihhnkhhirdgurggvsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepjhgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgto
 hhmpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvg
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

On Thu, 06 Feb 2025 19:14:15 +0100
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> Patch series overview
> =====================

And I messed up with my patch series overview.

Please ignore all lines from here...

>  * 2 Preliminary patches (maybe to be removed as this work progresses):
>    - drm/bridge: allow bridges to be informed about added and removed bridges
>    - drm/encoder: add drm_encoder_cleanup_from()
> 
>  * Implement refcounting in the drm_bridge core:
>    - drm/bridge: add support for refcounted DRM bridges
>    - drm/tests: bridge: add KUnit tests for DRM bridges (init and destroy)
>    - drm/bridge: add documentation of refcounted bridges
> 
>  * Adapt some existing bridges to be refcounted and/or to refcount bridges
>    they take a pointer to:
>    - drm/bridge: ti-sn65dsi83: use dynamic lifetime management
>    - drm/bridge: panel: use dynamic lifetime management
>    - drm/bridge: samsung-dsim: use supporting variable for out_bridge
>    - drm/bridge: samsung-dsim: refcount the out_bridge
> 
>  * Add hotplug-bridge (may be removed as this work progresses): 
>    - drm/bridge: hotplug-bridge: add driver to support hot-pluggable DSI bridges

...to here, as they belong to v5

The lines that follow are the correct ones for v6:

>  * Prelimiary, simple cleanups:
>    - drm/debugfs: fix printk format for bridge index
>    - drm: of: drm_of_find_panel_or_bridge: move misplaced comment
>    - drm/bridge: panel: use drm_bridge_is_panel() instead of open code
>    - drm/bridge: panel: drm_panel_bridge_remove: warn when called on non-panel bridge
> 
>  * debugfs improvements to show bridges, part 1:
>    - drm/debugfs: add top-level 'bridges' file showing all added bridges
> 
>  * Restructure panel code to always add a panel_bridge:
>    - drm/panel: move all code into bridge/panel.c
>    - drm/bridge: panel: forbid initializing a panel with unknown connector type
>    - drm/bridge: panel: add a panel_bridge to every panel
>    - drm/bridge: move devm_drm_of_get_bridge and drmm_of_get_bridge to drm_bridge.c
> 
>  * Add new get_bridge variant for drivers supporting non-graph DT:
>    - drm/bridge: add devm_drm_of_get_bridge_by_node()
>    - drm/bridge: samsung-dsim: use devm_drm_of_get_bridge[_by_node] to find the out_bridge
>    
>  * Preliminary patches (maybe to be removed as this work progresses):
>    - drm/bridge: allow bridges to be informed about added and removed bridges
>    - drm/encoder: add drm_encoder_cleanup_from()
> 
>  * Implement refcounting in the drm_bridge core:
>    - drm/bridge: add support for refcounted DRM bridges
>    - drm/bridge: devm_drm_of_get_bridge and drmm_of_get_bridge: automatically put the bridge
>    - drm/bridge: increment refcount in of_drm_find_bridge()
>    - drm/bridge: add devm_drm_put_bridge() and devm_drm_put_and_clear_bridge()
>    - drm/bridge: add documentation of refcounted bridges
>    - drm/tests: bridge: add KUnit tests for DRM bridges (init and destroy)
> 
>  * debugfs improvements to show bridges, part 2:
>    - drm/debugfs: bridges_show: show refcount
>    - drm/bridge: add list of removed refcounted bridges
>    - drm/debugfs: show removed bridges
>    
>  * Adapt some existing bridges to be refcounted and/or to refcount bridges
>    they take a pointer to:
>    - drm/bridge: samsung-dsim: use refcounting for the out_bridge
>    - drm/bridge: panel: use dynamic lifetime management
>    - drm/bridge: ti-sn65dsi83: use dynamic lifetime management
>    
>  * Add hotplug-bridge (may be removed as this work progresses): 
>    - drm/bridge: hotplug-bridge: add driver to support hot-pluggable DSI bridges (HEAD -> ge/luca/wip)

Apologies for the mess.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
