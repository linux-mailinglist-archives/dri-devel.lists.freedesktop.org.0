Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A6BA9ACEC
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 14:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF65710E7D9;
	Thu, 24 Apr 2025 12:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="C7EKW9yz";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="AKpfKMsp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b8-smtp.messagingengine.com
 (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B4210E7DB
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 12:10:38 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 8B6D111401F6;
 Thu, 24 Apr 2025 08:10:37 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-05.internal (MEProxy); Thu, 24 Apr 2025 08:10:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1745496637;
 x=1745583037; bh=pZ0yPhakeOdllhNxzMFu8ujz+0Qys7e2W3A7Zg814bk=; b=
 C7EKW9yzxa09xn7oTd53CN7txsB073jzzLtjlTLGqn8zmvjNR7XJCnA0ghDD1ssR
 o47BnrpjuIKWpT13awY13SEgvtqDj5AtupbewjvIzuJpsdT+82Q47ftzM6SQwymZ
 i5rhojNcK6urpLKDjC97WKxPopT0OnBdY0bHRc0WHgfvd+7yB0wPBwiKmC7pFZfx
 NTv38+hBizzZeWinTot/Rg6EkJHvl0X1QJixp3oul3ALssy0+qB/lVMejwMZwVcI
 HiN5INPoEuVTrQ+btjuh8fo/lOHW8gtzqCJZxH/GX4h8dFItLpcrLEK/msTdjxRQ
 wFDASvqYFTQ0FlNKNGamUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1745496637; x=
 1745583037; bh=pZ0yPhakeOdllhNxzMFu8ujz+0Qys7e2W3A7Zg814bk=; b=A
 KpfKMspHg/6l8PCqTK2dtL6ebF+OToL+VgiLRSfAVu0qKthy5j6fxvYdJbVLPoWO
 Ub09mJiz3LCTjRAP8dKMiSPbCMz6anPHYgXJsl5huK35zQW38AOteOCjrx4KXRbI
 L++o1/4S//sNRB5pLuxrBK0AN9fy0MVxyrxvinCiy3KSjdplk9ApvhTyWP2mnUss
 /wX7/o6fhHFfww88F0CC8eYFvVP4VYybm4ebm9OpEo46FPcEswtjJdlFzn3Xgmqg
 Bqf/8WN5jwAXFR7WbXziJlUke1i9l1agE/LP72WfFin8Pyq3jaoIfVDXDH8f3ZLk
 x4stqtsurZKY0HQUEJFiw==
X-ME-Sender: <xms:PCoKaEDRGPXhxsih5MJUWY4XdXbFqSGyB8sezqDs0v2sD1sFBpd_wA>
 <xme:PCoKaGi0hlZ5FD6gZuqTacssqb1_5S7uyjhC9lGsewHutmd9XfAowfGqp0GbGQbOA
 ItHKbGdMakXtk8SJvI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeelgeefucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
 tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
 gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
 fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
 udegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehflhhorhgvnhhtrdhtohhmrg
 hsihhnsegrrhhmrdgtohhmpdhrtghpthhtoheplhhivhhiuhdrughuuggruhesrghrmhdr
 tghomhdprhgtphhtthhopehsthgvvhgvnhdrphhrihgtvgesrghrmhdrtghomhdprhgtph
 htthhopegrughrihgrnhdrlhgrrhhumhgsvgestgholhhlrggsohhrrgdrtghomhdprhgt
 phhtthhopegsohhrihhsrdgsrhgviihilhhlohhnsegtohhllhgrsghorhgrrdgtohhmpd
 hrtghpthhtohepughmihhtrhihrdhoshhiphgvnhhkohestgholhhlrggsohhrrgdrtgho
 mhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghirh
 hlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdho
 rhhg
X-ME-Proxy: <xmx:PCoKaHmYsFQo9RkPXdoj_m7h0qMdggoXv3SuyYtodJsroQebKwAMHg>
 <xmx:PCoKaKwNnXrmcAkQtJSQQzZ0sJCOQUocY454mof46HZXQsjwyRTtNg>
 <xmx:PCoKaJQe-00ZhIu_aXfzUKP4MMZZqul8lEXwlOU_HJXfxaooqviPIg>
 <xmx:PCoKaFaZu9r7yXlEJRQt-amCmvTnUWeKhHMj7X5nkyfTiwEvqEPW8Q>
 <xmx:PSoKaOosC1A6rCfgzVJeCue3avrlxv01-hPpknUnQnFTQbwk1W9Wd9au>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 7479D2220073; Thu, 24 Apr 2025 08:10:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T4fe579cdbda070a5
Date: Thu, 24 Apr 2025 14:10:16 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Boris Brezillon" <boris.brezillon@collabora.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Steven Price" <steven.price@arm.com>, "Liviu Dudau" <liviu.dudau@arm.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dave Airlie" <airlied@gmail.com>, 
 "Simona Vetter" <simona@ffwll.ch>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 "Dmitry Osipenko" <dmitry.osipenko@collabora.com>,
 "Florent Tomasin" <florent.tomasin@arm.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Message-Id: <41cd0579-698c-4e1e-82c4-3d46a1cd5e3e@app.fastmail.com>
In-Reply-To: <20250424134105.087ec2f8@collabora.com>
References: <20250424112637.3432563-1-arnd@kernel.org>
 <20250424134105.087ec2f8@collabora.com>
Subject: Re: [PATCH] drm/panthor: fix building without CONFIG_DEBUG_FS
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

On Thu, Apr 24, 2025, at 13:41, Boris Brezillon wrote:
> On Thu, 24 Apr 2025 13:25:47 +0200
>> +#ifdef CONFIG_DEBUG_FS
>>  	bo->debugfs.flags = usage_flags | PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
>> -}
>> -
>> -#else
>> -void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {};
>>  #endif
>> +}
>>  
>
> Oops. I actually don't see a good reason to expose this function, so
> could we go for something like that instead?

I think moving it into pantor_gem.c makes sense, and it certainly
avoids the build warning.

>  #else
>  static void panthor_gem_debugfs_bo_add(struct panthor_device *ptdev,
>                                        struct panthor_gem_object *bo)
>  {}
>  static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo) {}
> +static void panthor_gem_debugfs_set_usage_flags(struct 
> panthor_gem_object *bo,
> +                                               u32 usage_flags)
> +{

Side note: I think the panthor_gem_debugfs_bo_{add,rm} stubs could
actually be replaced with an IS_ENABLED() check in the normal
functions, but that wouldn't work for
panthor_gem_debugfs_set_usage_flags or
panthor_gem_debugfs_print_bos().

    Arnd
