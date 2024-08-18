Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D57955F1A
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 22:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D8510E171;
	Sun, 18 Aug 2024 20:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="Iv8myUGf";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="PTI81+ny";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com
 [103.168.172.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1363C10E171
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 20:51:10 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.nyi.internal
 [10.202.2.46])
 by mailfout.nyi.internal (Postfix) with ESMTP id 4E0C6138FC91;
 Sun, 18 Aug 2024 16:51:09 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
 by phl-compute-06.internal (MEProxy); Sun, 18 Aug 2024 16:51:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm3;
 t=1724014269; x=1724100669; bh=i4cnKscBdUtY9R9p+tbVpHTOzg1eZ65J
 GPwxbgvxMQo=; b=Iv8myUGfGqVKAWYcsIRMDJf5QNCfBR/hr3q8RgfKgyytW1wk
 guOQHCpyPgR2jNvR2EdgehleX6ZWt1xAHX0u2dpSYRDdTzWMfMeohmGOF5KHlABB
 Ve9DXFugDUXDju+a28oszKWhqiREIsNTj7TISaiaQl8Ep0H+ia5MZbw6ODejvZ6N
 TxI+U6kACONWUY8CETT06tty19Szdv0HlKxFSkZvLK9urmnE6b0juxO1ZH8Xc4Je
 E0PO12o8R/TU8WSrEvSTcLYWlyYlg2DvHxbHymXZmdfRMKYI4U2R3UMsVGFK+q0R
 EatHVzD1efuI5zt52sYLrmFPZZwjxM07Z9OWAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1724014269; x=
 1724100669; bh=i4cnKscBdUtY9R9p+tbVpHTOzg1eZ65JGPwxbgvxMQo=; b=P
 TI81+nyiGQ4fr5z9Ah3KK77a/B8I8MH9ATRrvdEYWwwjJnt/Kg4tQ1e9WiI2TB7O
 0XiYkoMd9LNSWMJu0C1yeTqJydl2rpicjjjnG0SGcS1zIvzAA6ymHzxt12yGGnJ5
 Qkeo2BK4TOjkeNn6YyH/DZBgFKaLxA2OhRMWXNkIbATL4oIT9tCLGu4SLa2a33L2
 GMtrKiFQd8KLp9rLWw+UDPGc33yQGSexUa/jSAmA9XyRUHny2RmvxLchnBR813XI
 UMucQwSQupv6ATLBU5QYtmXG/rfbQopAalXvVmNaBOEuV1KfQS4yVEeSdBJNGq06
 mXqczhnUHsAYySzgUJXPw==
X-ME-Sender: <xms:u17CZiqlCbWzP-WANzheacZaDIKqQpj7siouw6qs2IWuZJtyDnqFKw>
 <xme:u17CZgorLbYzG8P_kUJreZssG7uUY8v7jVU3GLb5AUmsEa0e5o_OShRf7kEGAllS1
 w73g0NoP8AUeiStVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudduvddgudehfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
 tdenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
 grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeejhfeukeejjefguddvffehveevjefh
 tddutdfhudduvdevfeejfffgvdelfeeugfenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
 pghrtghpthhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurh
 gvrdhprhiihiifrghrrgesrghrmhdrtghomhdprhgtphhtthhopehmthhurhhquhgvthht
 vgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrgh
 dprhgtphhtthhopegurghnihgvlhesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhl
 ihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtg
 esghhmrghilhdrtghomhdprhgtphhtthhopehmrggtrhhorghlphhhrgekvdesghhmrghi
 lhdrtghomhdprhgtphhtthhopegtohhnthgrtghtsehjohhokhhirgdrohhrghdprhgtph
 htthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:u17CZnOnfnY5rLXqdzT_InQzSm68suAboVSZBHTrxL-rqNxO-uOung>
 <xmx:u17CZh4KRpsiCBBWa3VcCPgnD2d6TjeFQLlqx3ymGKqEUnsn7J5dlA>
 <xmx:u17CZh4H1Z1NtFh5vqnb3q7IcLRjnLzbx0eN3LXWFbuVR6oi96tcWQ>
 <xmx:u17CZhiYp6y5XjsMPtUfeZ3wBy4Mx277uTPFg1UJF8vuRaJ8hqLqTA>
 <xmx:vV7CZv65o8E8ELuZHA4h1TGRWAM7lnh4kAeNxBjSCjU_BTOHL8raJvbM>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B634F276005E; Sun, 18 Aug 2024 16:51:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 19 Aug 2024 08:50:46 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Chen-Yu Tsai" <wens@csie.org>
Cc: "Maxime Ripard" <mripard@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Andre Przywara" <andre.przywara@arm.com>, 
 "Chris Morgan" <macroalpha82@gmail.com>, "John Watts" <contact@jookia.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Message-Id: <4a5e5c54-71dd-4069-8543-d3c341369242@app.fastmail.com>
In-Reply-To: <CAGb2v64Fpt_tP5gSZftmexOY-sS6dsC=+KmgAJmMoRuhsEvK7g@mail.gmail.com>
References: <20240817230503.158889-1-ryan@testtoast.com>
 <20240817230503.158889-23-ryan@testtoast.com>
 <CAGb2v64Fpt_tP5gSZftmexOY-sS6dsC=+KmgAJmMoRuhsEvK7g@mail.gmail.com>
Subject: Re: [PATCH v3 22/26] clk: sunxi-ng: ccu: add Display Engine 3.3
 (DE33) support
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



On Mon, 19 Aug 2024, at 1:40 AM, Chen-Yu Tsai wrote:

Hi Chen-Yu, thanks for the reviews!

>> +#include <linux/of_address.h>

> Still incorrect.

Whoops, only fixed the changelog it seems. Will correct.

Ryan
