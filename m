Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DADA4B2F5
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 17:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4769810E0FF;
	Sun,  2 Mar 2025 16:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="IVLFCY1G";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="yIJqDKWv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 470 seconds by postgrey-1.36 at gabe;
 Sun, 02 Mar 2025 16:11:08 UTC
Received: from fout-b2-smtp.messagingengine.com
 (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2DF10E0FF
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 16:11:07 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id 43CA911400CE;
 Sun,  2 Mar 2025 11:03:13 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
 by phl-compute-03.internal (MEProxy); Sun, 02 Mar 2025 11:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm2;
 t=1740931393; x=1741017793; bh=thNHmiSH9lOAN4/tLKeVEhGP0Bb23KHy
 19mDsCcWSTg=; b=IVLFCY1G/xsblzXzUy2/v2Kb7vuyiA2nr40zwe2Z/OsIdrc6
 qHauS2ALh8zX3P/nIP2seV3RXdPXqiX3fV6AmhJkCpZaHLqY/QtLU8ZrQ6kNr0wK
 qdb4mjwhC2A0g+iJ0hMTAnhr59SQXbZkXVzuH8Cq5DpytOM2i8uwJo/RX75cKRHA
 sLx93nxs2vfnmBdgyztlKRgkYIChX0HW7gLqYqn821pOgVHIB3Uab6cjxkSJo64W
 nV75FyJBCRJlo1N5TiXINfLQEg2JAnsWki4wmUZ/o/FQTGJHRhJs7tFAg6n+woa4
 gkH8NADvEjYWIttKgGUjrcHIeXp0LKZPo2GdaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740931393; x=
 1741017793; bh=thNHmiSH9lOAN4/tLKeVEhGP0Bb23KHy19mDsCcWSTg=; b=y
 IJqDKWvigtwF1a2znq7lujVcD2q3u5cGq+7InAMEVJ6L8QVrVVKGqn5i960ZJhwM
 bbh9fk4+by25IYUa5SVgKV7pzYvHfap71ytCpmZzdx27uXKK+jTddhJY6wrtenWJ
 i7xTNBCJOhTZsvUQqY+4ckkAuZPX/Su5xMcNI75nncNZseoE3hAkcl1Pko5i4o1t
 qxnjJKx0xtk8RX25xSdcxpRjEPs4tLxug40wsAO/uHaukhSG4u2JrswNgVgzEDYv
 giLNi4Vyp6QyTvW/CocaQw0mKkSTosCB/df+BVaXpuKfl3zs6c2SqIQ3iREhbZeO
 bZp2xUNUeaRZoq4era2XA==
X-ME-Sender: <xms:P4HEZ3pP3ImPHfArXRawB3WpOLJaws0FOixegN5jGytL4Us9reeOHw>
 <xme:P4HEZxqPo_qzHrX2A3rEWvJYwKG01K0_QJKYyxhAToRPtozzaZKv8D-_4LVx-FuHG
 zYFlrBh-b7t6PjVWWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelieeigecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
 tdenucfhrhhomhepfdfuvhgvnhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvg
 hrrdguvghvqeenucggtffrrghtthgvrhhnpeelfeetueegudduueduuefhfeehgeevkeeu
 feffvdffkedtffffleevffdvvdeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdpnhgspghr
 tghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehfrghithhhrd
 gvkhhsthhrrghnugestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehsihhmohhn
 rgesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
 dprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehm
 rggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtg
 hpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhr
 ghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpth
 htoheprghlhihsshgrsehrohhsvghniiifvghighdrihhopdhrtghpthhtohepthiiihhm
 mhgvrhhmrghnnhesshhushgvrdguvg
X-ME-Proxy: <xmx:P4HEZ0OijRnMMx1GAxE0ztt0u43gknFQZZcWyfLQgS_TSQXJexFcRA>
 <xmx:P4HEZ660vRX94AI_yJR2WtI4bN9v3nEaD_ubxw8PxrLwXffeuVUsYw>
 <xmx:P4HEZ24GxmKqJGihORpIUiu0LrM4nNRXEdPzr6QbtxlhAaD9sgbbfg>
 <xmx:P4HEZygtZsr-y18jBti2mikR2WPf-XLQMuPpEmtBf0QF22f0uKvDsg>
 <xmx:QYHEZ_FcgTwIiDlILWchsQ_ApNybee3AuLzNTpQZGmHu8PgvWdPWC79->
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 9E84ABA0070; Sun,  2 Mar 2025 11:03:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sun, 02 Mar 2025 17:02:51 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, "Faith Ekstrand" <faith.ekstrand@collabora.com>
Message-Id: <5a4b80f3-c121-4d5e-ae88-442a8480d285@app.fastmail.com>
In-Reply-To: <20250301-apple-twiddled-modifiers-v3-1-4b9bb79825fe@rosenzweig.io>
References: <20250301-apple-twiddled-modifiers-v3-1-4b9bb79825fe@rosenzweig.io>
Subject: Re: [PATCH v3] drm: add modifiers for Apple GPU layouts
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

On Sat, Mar 1, 2025, at 23:01, Alyssa Rosenzweig wrote:
> Apple GPUs support various non-linear image layouts. Add modifiers for
> these layouts. Mesa requires these modifiers to share non-linear buffers
> across processes, but no other userspace or kernel support is
> required/expected.
>
> These layouts are notably not used for interchange across hardware
> blocks (e.g. with the display controller). There are other layouts for
> that but we don't support them either in userspace or kernelspace yet
> (even downstream), so we don't add modifiers here.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> ---

I don't understand much about GPUs but the explanation here is clear enough even for me.

Reviewed-by: Sven Peter <sven@svenpeter.dev>


Best,


Sven
