Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27588A56683
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 12:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A71810E108;
	Fri,  7 Mar 2025 11:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="kaY9Rr8s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B2E10E138
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 11:22:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4A29432BF;
 Fri,  7 Mar 2025 11:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741346536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qcuD7NlNDZd+xhVem/Y+o+z4MWg9gjtRsouOtv13Y6A=;
 b=kaY9Rr8s/iRCbvx0GX0icDjID8GQ0lANAxP8yEtn+4eQQIvzjVU+NSkHQOFUFzuzJOtfTL
 GAmi3h7PM7njnuuWRVxOpB7KVzL6ytdr1lVgbNkFB+HV9MKENMy7bO33KObvVOq97MXB3Y
 iDKjjRbqR4Zh2LBH/iNV8WdrViBm3wc9kOlXUVGQ2vn90LRQe3EwhqUs7/RJxQwMvWofon
 MLNahYoNEwETYmW8y4lpsAjsJz/1X0aoK8me0BW5Mzdl9kYHFF3YIUZADuuyYdDcvKIBci
 Wt6L0z0Ke9qm18BVKX7Ohjf/4YoajG/JoJBfD7qiU/zsO2WI+FGhainZs7xh3Q==
Date: Fri, 7 Mar 2025 12:22:12 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/bridge: fsl-ldb: make warning message more
 informative
Message-ID: <20250307122212.18252ca6@booty>
In-Reply-To: <f8df2b5e-b005-4ada-8108-159b2b94a72e@nxp.com>
References: <20250306-drm-two-ldb-improvements-v1-0-f139d768b92c@bootlin.com>
 <20250306-drm-two-ldb-improvements-v1-2-f139d768b92c@bootlin.com>
 <f8df2b5e-b005-4ada-8108-159b2b94a72e@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddtheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeeltdeljeeftdetgeeuuedvheffffekleehkeevhfdttefgleeutdfhkeehkeeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmpdhkvghrnhgvlhdrohhrghenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopehvihgtthhorhdrlhhiuhesnhigphdrtghomhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhms
 hhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhm
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

thanks for your reviews.

On Fri, 7 Mar 2025 14:33:37 +0800
Liu Ying <victor.liu@nxp.com> wrote:

> On 03/07/2025, Luca Ceresoli wrote:
> > This warning notifies a clock was set to an inaccurate value. Modify the
> > string to also show the clock name.
> > 
> > While doing that also rewrap the entire function call.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >  drivers/gpu/drm/bridge/fsl-ldb.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> > index 0fc8a14fd80062248a43b8b93272101a7ca6158a..c7c899a9644bb827845fb3fe96a9695d79a91474 100644
> > --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> > +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> > @@ -181,9 +181,9 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
> >  
> >  	configured_link_freq = clk_get_rate(fsl_ldb->clk);
> >  	if (configured_link_freq != requested_link_freq)
> > -		dev_warn(fsl_ldb->dev, "Configured LDB clock (%lu Hz) does not match requested LVDS clock: %lu Hz\n",
> > -			 configured_link_freq,
> > -			 requested_link_freq);
> > +		dev_warn(fsl_ldb->dev,
> > +			 "Configured %pC clock (%lu Hz) does not match requested LVDS clock: %lu Hz\n",
> > +			 fsl_ldb->clk, configured_link_freq, requested_link_freq);  
> 
> Though this slightly changes the warning message userspace sees, I guess it is
> acceptable.
> 
> Does it make sense to s/%pC/%pCn/ so that the clock name is printed in lower
> case instead of upper case, since it seems that all i.MX specific clock names
> are in lower case?

%pC and %pCn print the same string, as I just discovered at
https://elixir.bootlin.com/linux/v6.14-rc5/source/lib/vsprintf.c#L1972

I've pondering for a moment about whether we should document %pC and
%pCn produce the same output or rather %pCn. I decided to try the
latter and just sent a patch to do it [0].

FYI in my case the printed value is (with both %pC and %pCn)
"32ec0000.blk-ctrl:bridge@5c".

[0] https://lore.kernel.org/20250307-vsprintf-pcn-v1-0-df0b2ccf610f@bootlin.com

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
