Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 314A1A66132
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 23:05:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A0710E1AD;
	Mon, 17 Mar 2025 22:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="LlHMBRN4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C6C10E1AD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 22:05:08 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id F3F16580549
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 21:56:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FEF32057C;
 Mon, 17 Mar 2025 21:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1742248573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2+2T3UFKZNQqzYcppRSeRT40EIToHYWw5aJ/ZTMJlsg=;
 b=LlHMBRN4dd1wr3rT/5fl9FvLjlU9W0MrimdfbNvbBLmagR523h+WFWVHELxVrwnr0AfKe8
 ukIUFAYhDvBj14lILUTc8VuKNOeQFbdP6N31lMeCB4rgKBTFhfnLu0UNK4UEiV9x4b2J8z
 FODZFbe0VD3kW/Fe0/x/2OSWKJSok7HbxuwLO8aX/OGP+sQ/57sLDj0U2NSAMytvG4ozlw
 MMAkehhE4kvQHPoYD4sXllnsp7IqWM5rJSm1tESA9G0kq76sLK5m0A7HTknvrio+tWCebf
 VYStkCnS/CxnZo0zorWUmQgBwRrEVqrP+mCb+1lDaJ9mNFAIaeVZHXYdaDnfdQ==
Date: Mon, 17 Mar 2025 22:56:12 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: arnd@arndb.de, lee@kernel.org, dmitry.torokhov@gmail.com,
 sre@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 linus.walleij@linaro.org, brgl@bgdev.pl, tsbogend@alpha.franken.de,
 linux@treblig.org
Cc: linux-mips@vger.kernel.org, linux-input@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 2/9] rtc: pcf50633: Remove
Message-ID: <174224855863.1587763.1321316355670597238.b4-ty@bootlin.com>
References: <20250311014959.743322-1-linux@treblig.org>
 <20250311014959.743322-3-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311014959.743322-3-linux@treblig.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedtieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegumhhithhrhidrthhorhhokhhhohhvsehgmhgrihhlrdgtohhmpdhrtghpt
 hhtohepshhrvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhnghhoohhhrghnudesghhmrghilhdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com
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

On Tue, 11 Mar 2025 01:49:52 +0000, linux@treblig.org wrote:
> The pcf50633 was used as part of the OpenMoko devices but
> the support for its main chip was recently removed in:
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
> 
> See https://lore.kernel.org/all/Z8z236h4B5A6Ki3D@gallifrey/
> 
> Remove it.
> 
> [...]

Applied, thanks!

[2/9] rtc: pcf50633: Remove
      https://git.kernel.org/abelloni/c/0a243de9d009

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
