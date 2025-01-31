Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6732DA23E14
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 14:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2BE10EAA7;
	Fri, 31 Jan 2025 13:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nH3v5WYM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4B210EAA7
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 13:02:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D86F144315;
 Fri, 31 Jan 2025 13:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738328536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XJwSHV11kphzeXrWnjeXrkif/bqrggQ85lvkHsuBw6I=;
 b=nH3v5WYMhcZfITGnkH86Y6hheRWa1SEIvz7KB6HBphbq37u+6tWJYS1e7+QLOYc9POfX7X
 msU711aBHV7+Hogs8aTslUvpU/SZ7LSn0uHlw8z+Emwcf/7YFWdX657OQLV4ErqkU0iZQi
 I07zWn5sXK6OzvwNfaKOUpgzolb5gBLltg+kn1GB1HHMx+Gjz+RhV2JVQOZA+iyDzMsLjt
 0mjn8bXFYhZORBqNnSNV7y2aYGn8BJxJUuIamzcRQQgfdqQoWr73JeD9fYDu+GlBQ2p5oZ
 cDZL2jKR/KRiWbcPtQlcI/eRRaOkn3vfHY6XT1Y/pFwW6wL9O9Sap7pU/3Dt6w==
Date: Fri, 31 Jan 2025 14:02:14 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] drm/vkms: Allow to configure device
Message-ID: <Z5zJ1rEZyBEgd7DN@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <Z5uDGr445jEfdt5L@louis-chauvet-laptop> <Z5yYVov9_z6CDU46@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5yYVov9_z6CDU46@fedora>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeffeduuddujeevueffkeekhffhkeethefggeeitdduieffhfffkedtfeeggfdvueenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhouhhishdqtghhrghuvhgvthdqlhgrphhtohhppdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghomhdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmp
 dhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 31/01/25 - 10:31, José Expósito wrote:
> On Thu, Jan 30, 2025 at 02:48:10PM +0100, Louis Chauvet wrote:
> > On 29/01/25 - 12:00, José Expósito wrote:
> > > Hi everyone,
> > > 
> > > In preparation for ConfigFS support, a flexible way to configure VKMS device(s)
> > > is required.
> > > This series adds the required APIs to create a configuration, the code changes
> > > required to apply it and KUnit test validating the changes.
> > 
> > Hi José,
> 
> Hi Louis,
> 
> Thanks a lot for the quick review!
> 
> > Thanks a lot!
> > 
> > This series is amazing and better than mine on many points. I have few 
> > comments:
> > - a "strange" naming pair: add/destroy (I expect add/remove or 
> >   create/destroy like other function in DRM)
> 
> I used "add" because the function creates and adds a display pipeline
> items and "destroy" because the opposite function removes it and frees
> its memory, so I wanted to emphasize that the action was destructive.
> 
> However, I don't have a strong preference about the naming. If you
> prefer another pair of verbs, I'll be happy to change the function
> names.

So, I think create/destroy is a bit better: `create` with the 
`vkms_config` parameter is enough to tell "it allocates stuff in 
`vkms_config`". 
 
> > - usage of "complex" list accessors, can't we just create iterators?
> 
> Yes, on the first iteration, I used the underlying structure: list
> iterators for planes/CRTCs/encoders/connectors and xa_for_each for
> the possible_* items.
> 
> However, I found 2 main issues that made me rewrite this code:
> 
> The first one is that, if in the future, we change the internal data
> type, we'll have to change all the code using it. On this way, like
> I did with all the other vkms_config_*_get_*() functions, the data is
> encapsulated.

In one of my comment I proposed a macro to help on this point. I think 
this is sufficient to hide internals. (see patch 7/13)
 
> The second one is vkms_config_get_connectors(). Unlike the other
> functions, this one filters by connector enabled status. If we let the
> caller do the filtering, we'll duplicate that logic.

That something I missed, and a very good point.

I will try to create a macro that do the filtered iteration, if I succeed 
and you agree on the previous point, I think it does not worth it to have 
those huge amount of code just to iterate over a list.

> Because of these two reasons, I decided to add a getter for lists.
> 
> > - should we use pr_err in vkms_config_valid?
> 
> I think it is great to show to the user a reason why their device couldn't
> be enabled in dmesg... But I'm not sure if there is a better way to do it.

I was not clear: I agree we want some logs, but pr_err is too 
agressive (see patch 8/13).

> > > Louis Chauvet and I are working on ConfigFS support. In this series I tried to
> > > merge his changes [1] with mine [2].
> > > I kept his Signed-off-by to reflect that, even if I show up as the author of
> > > some/most of the patches, this was a joint effort.
> > 
> > To avoid confusion, you should add the Co-developped-by tag, so it will be 
> > clear that we worked together on this.
> 
> Good point, I'll change it.
> 
> > > I'm still polishing the ConfigFS code [3] and its IGT tests [4] (connector
> > > hot-add/remove bugs) but the IGT tests also exercise this series and can be used
> > > for additional test coverage.
> > 
> > I will take a look at those series. For the connector hot-add/remove, do 
> > you have any example of usage in the kernel? I did not found anything in 
> > the documentation explaining they are hot-addable.
> 
> I pushed a couple of WIP commits to the kernel and IGT so you can see/test
> the crashes and hopefully share some ideas.
> 
> About the documentation: I didn't find much information other than a few
> mentions to hot-add/remove. However, in one of my rebases, two new functions, 
> drm_connector_dynamic_init() and drm_connector_dynamic_register(), were added:
> https://patchwork.freedesktop.org/patch/628418/

Ho! This is exactly one issue I had when developping IGT tests, sometimes 
you fetch the connector list, and when querying info about a specific 
connector you get nothing!

> I'm still trying to make them work, but I think they are what we need.

After reading the patch "https://patchwork.freedesktop.org/patch/628418/", 
I don't think we really need to support "dynamic connector creation" right 
now:
- None of the existing driver do it (except MST, but MST need a lot of 
  stuff to works)
- If we want to support it later, just create a "useless" 
  /configfs/vkms/DEV/connectors/CON/enable that you must write 1 before 
  the device initialization to make the connector working. This way we 
  will not have to break the UAPI (the file is already there, disabled by 
  default)
 
> Part of the crashes happen on the cleanup of drm_client_setup(). Adding a
> connector adds modes in the DRM client, but removing the connector doesn't
> remove them and, on cleanup, I get a NULL pointer.
>
> I'm a bit stuck, so help or tips are very welcome :)

I will look at it next week (same repo/branch?).

Have a nice weekend,
Louis Chauvet

> 
> > Thanks again for this series,
> > Louis Chauvet
> 
> I'll look with more time into your comments in the other patches next week.
> 
> Thanks,
> Jose
> 

[...]
