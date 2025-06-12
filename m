Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDF6AD75C5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 17:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542B710E8A9;
	Thu, 12 Jun 2025 15:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="vroO0C16";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="RV36GKp6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9852410E8A9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 15:21:36 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id D872013803AF;
 Thu, 12 Jun 2025 11:21:35 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-05.internal (MEProxy); Thu, 12 Jun 2025 11:21:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1749741695;
 x=1749828095; bh=yo46/0j5hmsmMNixOyVWRoGIJqFxk5fUKVizkJxtF2g=; b=
 vroO0C16rS97XT9Cs1m12LLszasW9eQA848HdECFr9FRX2TTeLLifk2WR1duCfmQ
 +BqGmheN2bm/i3m3255d0WUUWSbEmns8UJZh1LWWjeSo6nK1zMP4i8N5eheTCnVB
 G/PQ6D6iC5nhhon7+Ji4UJ9WirYy5Gj97hFQk2wqiGOFvTw/b8o7uK6s9WI5NEV/
 A6NW7RL+i3k76nefQU5VtDgqzipXmzm71blnFkZH1xkug8w1M+3kbl8sCs35pHWM
 JK1XUkgDS9Iz85W5I3uzI0qwAvhEp+nkPRMDahLUeotKb8kihzTj57M4HZz2Wpj8
 LTF9KidPnpR59ncOZMDW8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749741695; x=
 1749828095; bh=yo46/0j5hmsmMNixOyVWRoGIJqFxk5fUKVizkJxtF2g=; b=R
 V36GKp6bagKkgFi5W50SHy0AKhHWTPP5tgGu7axJMavkXIrq82TjI/rrLh3mG/rp
 etpwglWXb0VyX2X8kINTfb7/PzFJ0blhLaXz+9qQhatyT7uydu78BqLeird9Xk3C
 RJ6EhecQVv0gH+MmCWP3fPrYrp2k0pMw+KLJ7c77Cn+8UMA+G/AUcTnpzNrrVjLk
 SfA2XHEST44PwwA+Ll/qMU/XOyUCUCKHVy+F689JMiwgYwzzlBhzt991mPzboSwy
 wwxvsJzZecZ2AGiBTRQRWqFnwDNsrZDBxSS5Nx0fopFbRSREtHh9eROawXrXqVV7
 6HhzlE+InQg/ID4+HaakQ==
X-ME-Sender: <xms:fvBKaArG63TVq8jnSR8iuf2tXQtvx6J4HZ-YEKsCHoPkD6gqbSwcYg>
 <xme:fvBKaGpqfiHNqa9N0GhXWEPKlSq8F7U_OoNoLL_Pd-dAcASklW_F_xdQ9tGwLTEvE
 U7Ux5nrP3r-sjcyJ7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduheegudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
 tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
 druggvqeenucggtffrrghtthgvrhhnpeeggfejudejvdeijeeglefgtdfhudffieetfedu
 gefhffekjeefhedtjeefjeetfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
 rhhnuggsrdguvgdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprh
 gtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhlihgv
 ugesghhmrghilhdrtghomhdprhgtphhtthhopehnihgtkhdruggvshgruhhlnhhivghrsh
 dolhhkmhhlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhushhtihhnshhtihhtthes
 ghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhhorhgsohesghhoohhglhgvrdgtohhmpd
 hrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnsehiuggvrghsohhnsghorghrugdr
 tghomhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmh
 hrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehkvghr
 nhgvlhdrohhrgh
X-ME-Proxy: <xmx:fvBKaFPjhtPDtyIgiKClztvwQqG5txFN1Kf6Ce5DwCtley3Abv6qVA>
 <xmx:fvBKaH7IEhBL1Py8wryZkMKmGJWIf9nYQnHAFpPCk65xAqCpRvulnw>
 <xmx:fvBKaP5VjAyv2WVmwHcj-ezFH6Fs2NMGK3_43uPQKofNhP8PZDYmVw>
 <xmx:fvBKaHhtEXjBKuOVmxUA_LFBt-NbsEUFvfRhqJmzjSJrJjqYJ2AsxQ>
 <xmx:f_BKaBJmEhJgRp7WsewDvbgnixt1gjiprL_X9IX0pcC_Y02mFjoc1epS>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id A9B66700062; Thu, 12 Jun 2025 11:21:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T7abef826b1a41757
Date: Thu, 12 Jun 2025 17:19:56 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 linux <linux@treblig.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dave Airlie" <airlied@gmail.com>, 
 "Simona Vetter" <simona@ffwll.ch>, "Nathan Chancellor" <nathan@kernel.org>
Message-Id: <d24e13cd-f327-4077-9119-ea6fcd11f9f9@app.fastmail.com>
In-Reply-To: <c93bf50b-0300-4bd9-8c59-bc2b876801f8@ideasonboard.com>
References: <20250610092737.2641862-1-arnd@kernel.org>
 <f4e42ca9-d6f2-401b-9a53-d3b41915c6a0@ideasonboard.com>
 <4a81fc44-7c93-49d1-891b-dae11cd5e74a@app.fastmail.com>
 <c93bf50b-0300-4bd9-8c59-bc2b876801f8@ideasonboard.com>
Subject: Re: [PATCH] drm: omapdrm: reduce clang stack usage
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

On Thu, Jun 12, 2025, at 16:37, Tomi Valkeinen wrote:
> On 12/06/2025 15:40, Arnd Bergmann wrote:

> static u16 DISPC_OVL_BASE(enum omap_plane_id plane)
> {
>     static const u16 bases[] = {0x0080, 0x00BC, 0x014C, 0x0300, 0x0500};
>     return bases[plane];
> }
>
> In any case, I'll apply this with a small comment.

Thanks!

I've also opened an issue against llvm at
https://github.com/llvm/llvm-project/issues/143908

Hopefully we can pinpoint something in llvm that can be fixed
to improve similar issues in other code.

It does seem fairly obscure, as even changing the code
slightly seems to completely avoid the problem, e.g. if the
one of the loops grows too big to be unrolled.

    Arnd
