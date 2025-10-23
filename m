Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8517C034FF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 22:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D8D10E12F;
	Thu, 23 Oct 2025 20:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="motBD7Zc";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="ECu/ABtw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b8-smtp.messagingengine.com
 (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C16B10E12F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 20:03:48 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 559667A012E;
 Thu, 23 Oct 2025 16:03:47 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-05.internal (MEProxy); Thu, 23 Oct 2025 16:03:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1761249827;
 x=1761336227; bh=aaMYsDG/pQDRCmySzx9lGLHtIg8d/IahdrFqtqrWK/Q=; b=
 motBD7ZcCtu71dFhTePy3xXbL9qNG9WHPK3/mPjq8/16haNcYYEN/MBeOdgVo554
 vyytj5Hhy2dwhajHc/VE1cYur5Lih/EAGi7KZ8+YFAaxUrhPPHiH+DQ1O7yFHSx8
 fNMA9VX/rLhoSe9ILRUFzygGn4ckkNQKONXz9oLhry6L5JR3hU1oQPNOmG7Dx2O2
 EJ1ABzvlXsBLS4oHXlnXtthLksfx1v4za3lqscw1BL/nQ1hDPZU+hhSHSH17oT+q
 MLic30xOFT/GlzPEwQa3jb4QcmNc9XpFf+g9cIYtOj28rQOhbyjyIf84R1JV84a7
 h/G27ZZwe8cOBsoNlGcEkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1761249827; x=
 1761336227; bh=aaMYsDG/pQDRCmySzx9lGLHtIg8d/IahdrFqtqrWK/Q=; b=E
 Cu/ABtwbex9eatZQvp6OMkEBQdLNzTuHH9rsCcHZxgbPXDM1M+DtflMvj5icH4HF
 ZxiVYsL4GRBrTeiMuS6HIxKWDKa10K+Hv6ybwJ7qwxAWHF0eQNpCYhXayd+nrHza
 7+oLRKKKRDaom9CO7m2f4fJhpn9QgbcEcO3nlipTSalfIjepDowK5b3d/Qte9B9Q
 DqPNknMNm+3bfgrn+qhUbQci/tmrLzlMXjLUpp5ra4Xg81sIQVYTvnfT9L/4EduP
 QiajDpDorDbrL4Jt4wjSFYcn5TCX2/C2xHA+9eHE8sEbAje6URRJvpw958JSFgMO
 9DVSUiCiE66tnDLKO77vg==
X-ME-Sender: <xms:Ior6aGMmoHdLOgvDCLiqymoMBn9Mqj9QVOig92Ty6LWEFnpVtf0qMg>
 <xme:Ior6aPwdgOpdzameWV8LHIQemuTimqvaaseomWfPCUZsx-ydU_04AUAJLxFbdkEnl
 GnAyrXswkmfovlX-W4G5R6KFJPVmW-ok7oNa1aSj1Qo186R2TrIL7Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddugeejfeejucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
 uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
 hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
 gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhu
 thdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghirh
 hlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgv
 lhdrohhrghdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpth
 htohepnhhstgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgr
 nhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopegurhhiqd
 guvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohep
 lhhinhhugiesrhgrshhmuhhsvhhilhhlvghmohgvshdrughkpdhrtghpthhtohepthiiih
 hmmhgvrhhmrghnnhesshhushgvrdguvg
X-ME-Proxy: <xmx:Ior6aPxgk7TfORk7JB59lTxUIviAV6HsMaQlo4lrHOZ1HpnTBtmdOQ>
 <xmx:Ior6aI3w4G6qPFmFHk-9iUjgpcNl915rHmX66YUbT6Zn4T0daAvigw>
 <xmx:Ior6aImwa5yy548bsEhMV-VMa06drq2iD4BNVRUVUMaxLkS0UrhX_A>
 <xmx:Ior6aP8RwBHYeDOGYoS2CPfqRIXJGlb6YFiGex0iO95Zx5HTazHfMw>
 <xmx:I4r6aDLz1kO85VqTj1d9YG-J0rQEkCgscRKGJmGQ7ctAuG8rNMxh179S>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 015B7700065; Thu, 23 Oct 2025 16:03:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ADVW-1gNVoHF
Date: Thu, 23 Oct 2025 22:03:25 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
Cc: "Rasmus Villemoes" <linux@rasmusvillemoes.dk>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dave Airlie" <airlied@gmail.com>, 
 "Simona Vetter" <simona@ffwll.ch>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-Id: <b817fab5-b8ea-40c3-9777-2fd92ae2403a@app.fastmail.com>
In-Reply-To: <20251023-rename-scripts-makefile-extrawarn-v1-1-8f7531542169@kernel.org>
References: <20251023-rename-scripts-makefile-extrawarn-v1-1-8f7531542169@kernel.org>
Subject: Re: [PATCH] kbuild: Rename Makefile.extrawarn to Makefile.warn
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

On Thu, Oct 23, 2025, at 22:01, Nathan Chancellor wrote:
> Since commit e88ca24319e4 ("kbuild: consolidate warning flags in
> scripts/Makefile.extrawarn"), scripts/Makefile.extrawarn contains all
> warnings for the main kernel build, not just warnings enabled by the
> values for W=. Rename it to scripts/Makefile.warn to make it clearer
> that this Makefile is where all Kbuild warning handling should exist.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Makes sense,

Acked-by: Arnd Bergmann <arnd@arndb.de>
