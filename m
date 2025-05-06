Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0407AAACEE0
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 22:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A836710E0EF;
	Tue,  6 May 2025 20:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="I68mv2SZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2776E10E083;
 Tue,  6 May 2025 20:47:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA1D1439D4;
 Tue,  6 May 2025 20:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1746564447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RriJ3sQZL+/jAERO13sfWtP2FOfOc3okEQg5B7FnAeQ=;
 b=I68mv2SZI/aGxHCIIcxXbjxxCbHWE9FzDtUtW4PEabsIrho1orzLQHyqR3AJklkXW4/0dS
 sHotiUtnhB37DGcdh4NYEpar2pikiAW6HTYv6TIrN84SPWuBG8+xkiYWGDI06C2IrQ6ogR
 QEZfsdyh/gBXzyxBU6I46Qn7ke+tHyGu4UC1rv5tEOBv61wdugOUnlQfQ6wAbRndu7RuwR
 e6tObBPlpuwkypnH5/quJLTO/9FUmfvGMJGlxu/nMapt7Mz08+7BIwiLIchjrKyUveptAn
 jJ7yDtYArwX8GIIYPRKbfbYPujq44+9hObwSCtfPOkZ15Ae8r3K9ETKKDMJTLA==
Date: Tue, 6 May 2025 22:47:20 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, Paul
 Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui
 Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 chrome-platform@lists.linux.dev, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 30/34] drm/bridge: imx8qxp-pixel-combiner: convert to
 devm_drm_bridge_alloc() API
Message-ID: <20250506224720.5cbcf3e1@booty>
In-Reply-To: <f71d18d2-4271-4bb9-b54f-0e5a585778f3@nxp.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-30-8f91a404d86b@bootlin.com>
 <553d62ed-976a-4e17-9678-cdc3d40ce4a7@nxp.com>
 <20250430112944.1b39caab@booty>
 <f71d18d2-4271-4bb9-b54f-0e5a585778f3@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeegleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeelpdhrtghpthhtohepvhhitghtohhrrdhlihhusehngihprdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhg
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

thanks for your further feedback.

On Tue, 6 May 2025 10:24:18 +0800
Liu Ying <victor.liu@nxp.com> wrote:

> On 04/30/2025, Luca Ceresoli wrote:
> > Hello Liu,  
> 
> Hi Luca,
> 
> > 
> > On Tue, 29 Apr 2025 10:10:55 +0800
> > Liu Ying <victor.liu@nxp.com> wrote:
> >   
> >> Hi,
> >>
> >> On 04/25/2025, Luca Ceresoli wrote:  
> >>> This is the new API for allocating DRM bridges.
> >>>
> >>> This driver embeds an array of channels in the main struct, and each
> >>> channel embeds a drm_bridge. This prevents dynamic, refcount-based
> >>> deallocation of the bridges.
> >>>
> >>> To make the new, dynamic bridge allocation possible:
> >>>
> >>>  * change the array of channels into an array of channel pointers
> >>>  * allocate each channel using devm_drm_bridge_alloc()
> >>>  * adapt the code wherever using the channels
> >>>
> >>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>  
> > 
> > [...]
> >   
> >>> @@ -345,8 +351,8 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
> >>>  free_child:
> >>>  	of_node_put(child);
> >>>  
> >>> -	if (i == 1 && pc->ch[0].next_bridge)
> >>> -		drm_bridge_remove(&pc->ch[0].bridge);
> >>> +	if (i == 1 && pc->ch[0]->next_bridge)    
> >>
> >> Since this patch makes pc->ch[0] and pc->ch[1] be allocated separately,
> >> pc->ch[0] could be NULL if channel0 is not available, hence a NULL pointer
> >> dereference here...  
> > 
> > See below for this.
> >   
> >>> +		drm_bridge_remove(&pc->ch[0]->bridge);
> >>>  
> >>>  	pm_runtime_disable(dev);
> >>>  	return ret;
> >>> @@ -359,7 +365,7 @@ static void imx8qxp_pc_bridge_remove(struct platform_device *pdev)
> >>>  	int i;
> >>>  
> >>>  	for (i = 0; i < 2; i++) {
> >>> -		ch = &pc->ch[i];
> >>> +		ch = pc->ch[i];
> >>>  
> >>>  		if (!ch->is_available)    
> >>
> >> ...and here too.  
> > 
> > This is indeed a bug, I should have checked the pointer for being
> > non-NULL.
> > 
> > Looking at that more closely, I think the is_available flag can be
> > entirely removed now. The allocation itself (ch != NULL) now is
> > equivalent. Do you think my reasoning is correct?
> > 
> > Ouch! After writing the previous paragraph I realized you proposed this
> > a few lines below! OK, removing is_available. :)
> > 
> > [...]
> >   
> >> On top of this patch series, this issue doesn't happen if I apply the below
> >> change:  
> > 
> > [...]
> >   
> >> @@ -351,7 +349,7 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
> >>  free_child:
> >>         of_node_put(child);
> >>  
> >> -       if (i == 1 && pc->ch[0]->next_bridge)
> >> +       if (i == 1 && pc->ch[0])
> >>                 drm_bridge_remove(&pc->ch[0]->bridge);  
> > 
> > Unrelated to this patch, but as I looked at it more in depth now, I'm
> > not sure this whole logic is robust, even in the original code.
> > 
> > The 'i == 1' check here seems to mean "if some error happened when
> > handling channel@1, that means channel@0 was successfully initialized,
> > so let's clean up channel 0".
> > 
> > However my understanding of the bindings is that device tree is allowed
> > to have the channel@1 node before the channel@0 node (or even channel@1
> > without channel@0, but that's less problematic here).
> > 
> > In such case (channel@1 before channel@0), this would happen:
> > 
> >  1. alloc and init ch[1], all OK
> >  2. alloc and init ch[0], an error happens
> >     (e.g. of_graph_get_remote_node() fails)
> > 
> > So we'd reach the free_child: label, and we should call
> > drm_bridge_remove() for ch[1]->bridge, but there's no code to do that.
> > 
> > To be robust in such a case, I think both channels need to be checked
> > independently, as the status of one does not imply the status of the
> > other. E.g.:
> > 
> >   for (i = 0; i < 2; i++)
> >       if (pc->ch[i] && pc->ch[i]->next_bridge)
> >           drm_bridge_remove(&pc->ch[i]->bridge);
> > 
> > (which is similar to what .remove() does after the changes discussed in
> > this thread, and which I have queued for v3)
> > 
> > What's your opinion? Do you think I missed anything?  
> 
> The pixel combiner DT node would be added in imx8-ss-dc{0,1}.dtsi, please
> see the case for imx8-ss-dc0.dtsi introduced by an in-flight patch[1].  As
> channel@{0,1} child nodes always exist(DT overlay cannot effectively delete
> any of them) and channel@0 always comes first, there is no problematic case.

I'm not questioning what existing and future dts files (will) contain,
and surely I don't see a good reason someone would write channel@1
before channel@0.

My point is:

 - the bindings _allow_ channel1 before channel@0
 - the error management code after the free_child label won't work
   correctly if channel1 is before channel@0 in the device tree

IOW the driver is not robust against all legal device tree descriptions,
and it could be easily made robust using the example code in my
previous e-mail (quoted a few lines above).

If you agree about this I'll be happy to send a patch doing that change.
If you think I'm wrong, I won't fight a battle. This topic is
orthogonal to the change I'm introducing in this patch, and I can
continue the conversion independently from this discussion.

> > Thanks for taking the time to dig into this!  
> 
> After looking into this patch and patch 31(though I've already provided my A-b)
> more closely, I think the imx8qxp_pc and imx8{qm,qxp}_ldb main structures
> should have the same life time with the embedded DRM bridges, because for
> example the clk_apb clock in struct imx8qxp_pc would be accessed by the
> imx8qxp_pc_bridge_mode_set DRM bridge callback.  But, IIUC, your patches extend
> the life time for the embedded channel/bridge structures only, but not for the
> main structures.  What do you think ?

I see you concern, but I'm sure the change I'm introducing is not
creating the problem you are concerned about.

The key aspect is that my patch is merely changing the lifetime of the
_allocation_ of the drm_bridge, not its usage. On drm_bridge_remove()
the bridge is removed from its encoder chain and it is completely not
reachable, both before and after my patch. With my patch it is not
freed immediately, but it's just a piece of "wasted" memory that is
still allocated until elsewhere in the kernel there are pointers to it,
to avoid use-after-free.

With this explanation, do you think my patch is correct (after fixing
the bug we already discussed of course)?

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
