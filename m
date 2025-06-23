Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65199AE45FF
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 16:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C205C10E141;
	Mon, 23 Jun 2025 14:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OSVBBqfT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AD910E1FF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 14:09:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A41720453;
 Mon, 23 Jun 2025 14:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1750687747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ePt40yJvrO33B0QpVlIo/HV5dJRHpWVq5OdajjSVb8=;
 b=OSVBBqfTG09UyTei7Nq8pZ1s6OMA19TYtgRlgZ4Ttnj3iFPs2YpySG3Mn3qtN+76gAu7MP
 3G4DI8MqOZs3EMfOuCPQRw63/ZIw3L1Wfn0lJHTiampezCEtlJWz2TgatjDj7O+RddT8nI
 LqLRQWIBq/hrcGNZii8aoSetSIQt/sHQxmt7+56BHG4e8082Jjd+WeftitpLQuC4nVa3/s
 06evNf5AbkOY2mrVGNV0NJYeUvF8mNAW/s7asxH6Xev6U8bDUv0HsCGDiUQXnHDQtCZIPj
 pAUOyi2Z5kXS73OklkeGvOtk3gSwvyJX7r6R1/+x5kp3eVUNRFJwyvUwfeOaTg==
Date: Mon, 23 Jun 2025 16:09:03 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Marek Vasut
 <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 2/5] drm/bridge: get the bridge returned by
 drm_bridge_chain_get_first_bridge()
Message-ID: <20250623160903.01c56bfc@booty>
In-Reply-To: <be6a4d90-2c6e-42be-9948-df1840fd2f83@nxp.com>
References: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-0-0321845fcafb@bootlin.com>
 <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-2-0321845fcafb@bootlin.com>
 <be6a4d90-2c6e-42be-9948-df1840fd2f83@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujedvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopehvihgtthhorhdrlhhiuhesnhigphdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhm
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

Hello Liu,

On Mon, 23 Jun 2025 10:56:13 +0800
Liu Ying <victor.liu@nxp.com> wrote:

> On 06/21/2025, Luca Ceresoli wrote:
> > drm_bridge_chain_get_first_bridge() returns a bridge pointer that the
> > caller could hold for a long time. Increment the refcount of the returned
> > bridge and document it must be put by the caller.  
> 
> To make sure the incremented refcount is decremented once this patch is
> applied, does it make sense to squash patch 3, 4 and 5 into this one?

I see there is a trade off here between bisectability and patch
readability.

However about bisectability the problem is limited for this series. To
get an actual get/put imbalance you'd have to be able to remove the
bridge, but removing (part of) the bridge chain is not at all supported
right now, and it won't be until after chapter 4 of this work (see
cover letter).

However I realize there is an issue if:
* patch 2 is applied but patches 3/4/5 are not
  (it does not make sense to apply this series partially, but this
  might happen when cherry-picking?)
* an entire DRM card is removed where
  drm_bridge_chain_get_first_bridge() is used by some components

If both happen we'd have a get without put, thus a missing free and a
memory leak for the container struct.

Note that, besides drm_bridge_chain_get_first_bridge() that this
series covers, there are various other accessors: see items 1.E.{2..8}
in cover letter. For some of those there are many more changes to apply
because they are called in more places. Squashing them would result in
a really large patch that is likely hard to review and manage.

So I'll leave the decision to DRM subsystem maintainers. For the time
being I'm keeping the current approach given that Maxime already
reviewed these patches in the past, not squashed.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
