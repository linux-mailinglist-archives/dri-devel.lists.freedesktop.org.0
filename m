Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBE9B2DD3B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 15:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B09810E72E;
	Wed, 20 Aug 2025 13:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KRppZq+b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9322510E72E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 13:03:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CE7E43960;
 Wed, 20 Aug 2025 13:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1755694990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rt+0HzlN0GaJY1va0P0oiYStG3sAxyTGjMfwBuvnESY=;
 b=KRppZq+bBuap94XWSmAOhDA3aclBmjsNIEqRm59WtPolG/xPd78QgqhUFgPaxmkhTI5t+m
 3X5+2ti0WeFuEDJ01GYN/EZExEPgbw3WXuzcTsK6ePb3EKOuQRcCVYu45ZkS3gpavIZ4Ds
 jnIrsIUWLodzZ9mMnWSI7FpijLjEb0WCi2APzDW2hIjqpq6msOw1Rsc5dP6ctb10HaCOP4
 in9JuXK+vOUHek9nlDFXksOjG0Bpuzk51zAi6Q3dD+waCV7gCSd+iLqNjethPBnoWgx+tL
 0jHHsljZi7RhIDnYMXhJGORvLh02VVEO2JmKsa3qpGYY2+w1LswmKWfXW1CEFA==
Date: Wed, 20 Aug 2025 15:03:07 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v7 2/3] drm/bridge: add list of removed refcounted bridges
Message-ID: <20250820150307.358e164c@booty>
In-Reply-To: <ecfsac5tok6bu7n6ctzt5j7n6vtiumn47iwmff4pid57kdsunz@wqxdxgsaibcw>
References: <20250819-drm-bridge-debugfs-removed-v7-0-970702579978@bootlin.com>
 <20250819-drm-bridge-debugfs-removed-v7-2-970702579978@bootlin.com>
 <ecfsac5tok6bu7n6ctzt5j7n6vtiumn47iwmff4pid57kdsunz@wqxdxgsaibcw>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheekgeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrr
 hhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomh
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

Hi Maxime,

On Tue, 19 Aug 2025 13:15:30 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> > @@ -197,15 +197,22 @@
> >   * driver.
> >   */
> >  
> > +/* Protect bridge_list and bridge_removed_list */
> >  static DEFINE_MUTEX(bridge_lock);
> >  static LIST_HEAD(bridge_list);
> > +static LIST_HEAD(bridge_removed_list);  
> 
> I'm not super fond of "removed" here, it's ambiguous, especially since
> the bridge wouldn't be considered as removed after the last put.
> 
> lingering maybe?

Sure, will rename.

> > @@ -288,10 +296,13 @@ void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
> >  EXPORT_SYMBOL(__devm_drm_bridge_alloc);
> >  
> >  /**
> > - * drm_bridge_add - add the given bridge to the global bridge list
> > + * drm_bridge_add - publish a bridge
> >   *
> >   * @bridge: bridge control structure
> >   *
> > + * Add the given bridge to the global list of "published" bridges, where
> > + * they can be found by users via of_drm_find_bridge().  
> 
> It's quite a change in semantics, at least in the doc. I believe it
> should be a separate patch, since it's really more about updating the
> drm_bridge_add / drm_bridge_remove doc than collecting the
> removed-but-not-freed bridges.
> 
> Also, I'm not sure if it's more obvious here. The quotes around publish
> kind of it to that too. Maybe using register / registration would make
> it more obvious?

OK, I'll reword using register/registration and definitely move to a
separate patch.

Thanks for reviewing.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
