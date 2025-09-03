Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F21B424FF
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 17:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E295A10E8AC;
	Wed,  3 Sep 2025 15:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="Q7MGT8W6";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="IG/ERKkY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a1-smtp.messagingengine.com
 (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739DD10E8AC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 15:22:15 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 9AFD3EC0396;
 Wed,  3 Sep 2025 11:22:14 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-01.internal (MEProxy); Wed, 03 Sep 2025 11:22:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1756912934;
 x=1756999334; bh=+AXXTnO/DsaC5LEgexoxh1xVHsHWM2RT4Q9VJHHYQHY=; b=
 Q7MGT8W6SrBI/I4/SVwPJI40Xq5+wuvssqNx4RG3HzY9p2+fw8W/MauiLQdWxrO4
 yezUpKVvZIPNkhEjY+5P05C7gUrVKm9T249zOo78tS0s343DG995c2eson102Hj9
 f84/STbHvSy6oC+tI/Up501yIloNpWJ0ykGni1GAViFp/hX3/WM/tYxoH4V79Kk+
 BA598huM2ANrIBYSlJvHV/BP1tkAzuTvwmj5uVBdhnBcGzJyP7iGMdF+1Vlfnm4j
 3YpFWiiAdfdKuYhy0eh2cIu6m9ShaLTyNohBu+fBrHsAgXFS5votMkEHdnG5mgum
 RhiX1cvt+r59jK8IM4SdTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756912934; x=
 1756999334; bh=+AXXTnO/DsaC5LEgexoxh1xVHsHWM2RT4Q9VJHHYQHY=; b=I
 G/ERKkYHTFyn68d7ueOQM9/5oYICsx8l+pWQXOFQ1mOV/c5nI/+uet3/cmAgKA6G
 SE/YvR8vQjqDH9yPWLQ9PuzNl3gA8jOM+JM+9RG8F6ABRpuGtTOdYpbbnFxlf1Gb
 vFucs4GCFpwcbvC2pYtW0RF8ynKe/6sW0N5aHi27koxnpCoQF+19uKC2Gbx9Tfm4
 BcPqEqenL3//SaOidjMR81rHpi109uQhdN0gSAwNDDBukEeznQMmGa6WvsFTr1Vm
 C/RWTkqsKAtFFBf9BH+XaggX7x5vC8T+mQvuOMBCDqWGvbfwV7QUgOTfk90Rhul1
 g2Ye13Ygsg2LczzJ+sPIw==
X-ME-Sender: <xms:JV24aM2HgdpoVdql9uOoB2Gfc3hNTKH1Miu7n_ta2hHdOMpiOiaVdg>
 <xme:JV24aHEcG6iUyKZi2f3SGYBakiGAFpbqJc-4V-NSE4AwFIRNimdTkoKUUi3NiXrJV
 PuC2s_OonJjkA_23cs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefgeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedflfgrnhhnvgcu
 ifhruhhnrghufdcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhephe
 ejtdeffeethfetgefhffejudegheefueejtedvhfeuheevfeekheetfeduffevnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
 hurdhnvghtpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghp
 thhtohepuggrnhhivghlrdgrlhhmvghiuggrsegtohhllhgrsghorhgrrdgtohhmpdhrtg
 hpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrihhrlhhivggu
 sehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrd
 gtohhmpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehm
 rhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrg
 hnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepughrihdq
 uggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhope
 hnohhuvhgvrghusehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-ME-Proxy: <xmx:JV24aJf1c2sLqelv-BOyVUJxgZsCEIGOoaB7KUtLdY-YM83PIgblew>
 <xmx:JV24aLzOtCoJ4gsHYMpGxGS7gmlxZDJ9PEq6ZPTKqcNXU3nawz7imQ>
 <xmx:JV24aPpt6X5I2uQYYYCycvujtMeU3eY1RFxlkoPPbQHbOZk7sHDpeA>
 <xmx:JV24aJwAZjN1s5wPHvJt5D7auQ3x8oMkZ0_Kkj7ZBdjIpbW2Qco9IA>
 <xmx:Jl24aOpB4djR-SR3dYB7A583cM074Jdqvq5fzeZTK3VoavlTEzmFdvSt>
Feedback-ID: i47b949f6:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id D0F72700065; Wed,  3 Sep 2025 11:22:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Ahk4-nWWyfYc
Date: Wed, 03 Sep 2025 17:21:52 +0200
From: "Janne Grunau" <j@jannau.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, 
 "David Airlie" <airlied@gmail.com>, simona@ffwll.ch,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, acourbot@nvidia.com,
 daniel.almeida@collabora.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Message-Id: <a6ffa735-5678-4011-84af-b526ba31d53f@app.fastmail.com>
In-Reply-To: <20250901202850.208116-1-dakr@kernel.org>
References: <20250901202850.208116-1-dakr@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add drm-rust tree for Rust DRM drivers and
 infrastructure
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

Hej,

On Mon, Sep 1, 2025, at 22:26, Danilo Krummrich wrote:
> Multiple DRM Rust drivers (e.g. nova-core, nova-drm, Tyr, rvkms) are in
> development, with at least Nova and (soon) Tyr already upstream. Having a
> shared tree will ease and accelerate development, since all drivers can
> consume new infrastructure in the same release cycle.
>
> This includes infrastructure shared with other subsystem trees (e.g. Rust
> or driver-core). By consolidating in drm-rust, we avoid adding extra
> burden to drm-misc maintainers, e.g. dealing with cross-tree topic
> branches.
>
> The drm-misc tree is not a good fit for this stage of development, since
> its documented scope is small drivers with occasional large series.
>
> Rust drivers in development upstream, however, regularly involve large
> patch series, new infrastructure, and shared topic branches, which may
> not align well with drm-misc at this stage.
>
> The drm-rust tree may not be a permanent solution. Once the core Rust,
> DRM, and KMS infrastructure have stabilized, drivers and infrastructure
> changes are expected to transition into drm-misc or standalone driver
> trees respectively. Until then, drm-rust provides a dedicated place to
> coordinate development without disrupting existing workflows too much.

I think this good idea. I plan to make an initial asahi submission based
on v6.18-rc1. Feel free to add asahi to the list.

Acked-by: Janne Grunau <j@jannau.net>
