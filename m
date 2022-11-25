Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05348638708
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 11:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3213410E5E9;
	Fri, 25 Nov 2022 10:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D1D10E5E9;
 Fri, 25 Nov 2022 10:06:40 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 2D2605C013B;
 Fri, 25 Nov 2022 05:06:40 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute3.internal (MEProxy); Fri, 25 Nov 2022 05:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1669370800; x=1669457200; bh=rTN6mE9PsM
 PtJWJzgBPfjFVsIw8tlQTrAia9D4cqv3w=; b=fBAKjs+hIEmhYZN+dgS1dU5ZZk
 p1/d37Pe7pKx9AwOE8y25RH57j/26oR+kof8KR+ukFwkO4Jxg/WgIhV6rARwFwyv
 PJypt+bmCDu+3/zDkL0m+ILwDcMDKvgN8DGKfi0i0qPOBF0HH13BJojlAI0Ct7IB
 EVmc3mntXzEDP07I0F2PrXA33/pMLbndev+lq1qaUviMNR/6fBcdKkW6TPkyouLr
 y9oSsC2+mYqgK+TemOZ41DmIPGzCT2Sh+rx1ujkC1BgCNvMnDFVIrGsoqF2UVWsR
 BBDG8KwMTzpAue2/dnVY+cr/BMTOBvKx506DVCtbjNag7CemH66fjRuiBVRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1669370800; x=1669457200; bh=rTN6mE9PsMPtJWJzgBPfjFVsIw8t
 lQTrAia9D4cqv3w=; b=O8r2vRDZXQbpA+6y/vvszehVy3BZEvvwpyyEiwga6Drz
 g5JxxHj8j51+7OG870AzJI+Ya7lQYYxIPer8Uil1FFBFHgTat1jvwfuTPuwi4qr2
 5XQw5roYONJ4Y0wG8nGqCAwC16ldtR93oA9R/9BVrgQG6Go5RA4q55wJOOuDQN7e
 ALF0k0VeyXCcgC4fGqJZH3FKLGQqpFZS6rlv62GzSH28hP13AoCBoJO/jV2Ru9yJ
 ukGq5+2Ynq3jtmI/ujh4dZHZYhP4BtgwpjlH1ZqsziRib4ZGf3DSkNCFHUEZVo0V
 sCcO5PL+Ml7y8A4DRegUs9/Q+Nk4accJUB6jqZKDTg==
X-ME-Sender: <xms:r5OAYxrrIH9Xun07pLSUa4SqaWOGUnA69dwAmjZgrFkp6GQs3NDuaA>
 <xme:r5OAYzqSK0RoBkmwM3nHwnnZcOcYpTsYaWHs1h-Yt0gDqepHX84kildrnxKDV-155
 7gCULKnNPaZNK8jxq4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieehgdduvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeejvddvvdduleduheejiedtheehiedvjefgleelffeigfevhffhueduhfegfeef
 heenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:r5OAY-O2xTwBD6KN-QkqmglbfV_nufohtc_f8OhiTskTgUupM9k59A>
 <xmx:r5OAY848pjoZtyFQ7LXFHujFa3LqrYFjG0twwZHllzE77eF4IMZgpw>
 <xmx:r5OAYw68lEFECDX7--_fKrK7ZcCKt5SUmjMWRgJYraUUI1v_IlW1uw>
 <xmx:sJOAY9y-FCYF_Z_8HHEhhaewxF4NnA6qjLu6UrVwxJh_b_toL0ex5A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E1291B60086; Fri, 25 Nov 2022 05:06:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <82578dd4-a00d-44aa-9059-c5c5215aeb0b@app.fastmail.com>
In-Reply-To: <20221125092517.3074989-3-lee@kernel.org>
References: <20221125092517.3074989-1-lee@kernel.org>
 <20221125092517.3074989-3-lee@kernel.org>
Date: Fri, 25 Nov 2022 11:06:18 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lee Jones" <lee@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>, 
 "Nathan Chancellor" <nathan@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, mripard@kernel.org,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dave Airlie" <airlied@gmail.com>, 
 "Daniel Vetter" <daniel@ffwll.ch>,
 "Nick Desaulniers" <ndesaulniers@google.com>, "Tom Rix" <trix@redhat.com>,
 "Harry Wentland" <harry.wentland@amd.com>, "Leo Li" <sunpeng.li@amd.com>,
 "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com
Subject: Re: [PATCH 2/3] drm/amdgpu: Temporarily disable broken Clang builds
 due to blown stack-frame
Content-Type: text/plain
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 25, 2022, at 10:25, Lee Jones wrote:
> calculate_bandwidth() is presently broken on all !(X86_64 || SPARC64 || ARM64)
> architectures built with Clang (all released versions), whereby the stack
> frame gets blown up to well over 5k.  This would cause an immediate kernel
> panic on most architectures.  We'll revert this when the following bug report
> has been resolved: https://github.com/llvm/llvm-project/issues/41896.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/Kconfig | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 34f5a092c99e7..1fa7b9760adb8 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -265,6 +265,7 @@ source "drivers/gpu/drm/radeon/Kconfig"
> 
>  config DRM_AMDGPU
>  	tristate "AMD GPU"
> +	depends on BROKEN || !CC_IS_CLANG || !(X86_64 || SPARC64 || ARM64)

The logic looks fine, this has been broken for so long without anyone
paying attention that limiting the broken code to the working architectures
is probably the best way to avoid trouble.

However, as far as I can tell, the problem doesn't affect the
entire driver, only the "new" display engine, so I would probably
try to limit this to turning off CONFIG_DRM_AMD_DC for architectures
that don't have a fixed clang.

     Arnd
