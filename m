Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61DAA33F47
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 13:36:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC0510EA80;
	Thu, 13 Feb 2025 12:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="XJ9gxEyl";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="U6wqzpa4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 584 seconds by postgrey-1.36 at gabe;
 Thu, 13 Feb 2025 12:36:20 UTC
Received: from flow-a4-smtp.messagingengine.com
 (flow-a4-smtp.messagingengine.com [103.168.172.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BAF10EA80
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 12:36:20 +0000 (UTC)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailflow.phl.internal (Postfix) with ESMTP id 4AE72200B56;
 Thu, 13 Feb 2025 07:26:35 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-11.internal (MEProxy); Thu, 13 Feb 2025 07:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1739449595;
 x=1739456795; bh=FR8peTn+6BBmPLk5iID+tCE6/pHRxsIv4lGcTzblwoI=; b=
 XJ9gxEyl/COcD8OPpQMR9rJB7dPDYoEPGlnqma1JfToEYYblKGjYlcjWfV5IH5zP
 zIm6c9uK9RdpTR7BXw61YA5CiPhSRKJprszaWchZqDVqUecm3QzNc+IqCsP6SCjX
 V17Ljs/L+CMIgmETqwDCM4UlHgMsn9r2r6NMLlWuW5xnK+LoOEmNprP53GmBUsi1
 NC0cGfFVEuBP7ng5WlzAU0ZpKEdc9nQwsgpDc379Unu41kJ5+1cYYAqnOYZRhgM/
 SYxHs7DGUSCMP/W+dsCeWqS6cSN/KIERYSnztWZ6uz5Vf09uBu+kSW2Urk0eW/Ec
 Yw+e7ZtwSBvPVWpho1fEbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739449595; x=
 1739456795; bh=FR8peTn+6BBmPLk5iID+tCE6/pHRxsIv4lGcTzblwoI=; b=U
 6wqzpa4uiTMx3q64AWGaIGQS+6SOhDEGiwv4mp84wMhNm+gigOYDGiSJenR6YIP3
 BM3B4gf7ER0A21xQIXdTbSxXiFUnbrZQPKfY7UyXEzbhAHWbwnkypmbWRPkKDRaR
 36HuPHxg91nZ6dHfjA5uF6W800rVRZ7rkcvd6TU1NNDFB3ppZiIM+KLDzgvMu4g3
 FvPxdqGdPDPgYOoV2lH4NG3H9wOjPhspXjxHIfZ2h1ENTNUzN8tZiyJDjhH9QGe7
 0EjrMHu85tXf3pyho3ylq4wPwc4WaJgxmz1gYs5+PLf50Ea1fV3I10zSdewMErw4
 YpEqh0ynM2Ko812HwCkNA==
X-ME-Sender: <xms:-eStZ08ek9ZgBsHSt2yK2pwLtAhTnTAkTCZc9mWvlQfn38LApMtCPw>
 <xme:-eStZ8v9qERfnFnuuTNNVUySi9zRLQXTiH7I2nnC_q2dXF_qIwxbLfqskJhJjjIls
 lYfS6oFnwn9dBL9t08>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieejiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
 tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
 druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
 gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeg
 iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsrhhunhgvthessggrhihlih
 gsrhgvrdgtohhmpdhrtghpthhtohepkhhhihhlmhgrnhessggrhihlihgsrhgvrdgtohhm
 pdhrtghpthhtohepmhhtuhhrqhhuvghtthgvsegsrgihlhhisghrvgdrtghomhdprhgtph
 htthhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghp
 thhtohepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdprhgtphhtthhope
 guihgrnhguvghrshestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtohepshhimhhonhgr
 sehffhiflhhlrdgthhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpd
 hrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:-eStZ6DJfAjQ14kfAgTdQqyH99WfhZR92CsV1VKNO6MOCXPu35J6BQ>
 <xmx:-eStZ0cFq550de-DZ_fy71mFwdmBY8g-Xn22ymThnA5StsTXfxd-BA>
 <xmx:-eStZ5PNRuFuEcjglGcWddwoiAcavhMQqT8AyjktcsY4fTR5FEQZ3A>
 <xmx:-eStZ-k1QgZGIj34ELqoUXB0YfqzMlj9CYfHAJfHaJFP44wx8Nqs-w>
 <xmx:--StZyM9KidzQnErUrQeh3H59EWqCYDr1O0-6JJzdwBpqmtnp_ARQlyN>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id AD13F2220072; Thu, 13 Feb 2025 07:26:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 13 Feb 2025 13:26:12 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jerome Brunet" <jbrunet@baylibre.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Dave Ertman" <david.m.ertman@intel.com>,
 "Ira Weiny" <ira.weiny@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Stephen Boyd" <sboyd@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Daire McNamara" <daire.mcnamara@microchip.com>,
 "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Doug Anderson" <dianders@chromium.org>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>,
 "laurent.pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Dave Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Abel Vesa" <abelvesa@kernel.org>, "Peng Fan" <peng.fan@nxp.com>,
 "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Message-Id: <73c1ab6b-fd5e-47e3-8815-8f74758535f1@app.fastmail.com>
In-Reply-To: <20250211-aux-device-create-helper-v3-7-7edb50524909@baylibre.com>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-7-7edb50524909@baylibre.com>
Subject: Re: [PATCH v3 7/7] clk: amlogic: axg-audio: use the auxiliary reset
 driver - take 2
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

On Tue, Feb 11, 2025, at 18:28, Jerome Brunet wrote:
>
>  I also think this is more readeable and maintainable than a bunch of
>  'default CONFIG_FOO if CONFIG_FOO' for CONFIG_RESET_MESON_AUX. This approach
>  also would have several pitfall, such as picking the value of the first config
>  set or the config of RESET_MESON_AUX staying to 'n' if CONFIG_FOO is turned on
>  with menuconfig.

I still think you should just drop the 'imply' line, all it does it
force reviewers to double-check that you didn't make a mistake
here, so it's a waste of time.

    Arnd
