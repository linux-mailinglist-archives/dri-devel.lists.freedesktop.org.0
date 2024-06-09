Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4056E90145C
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2024 05:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA26B10E0CE;
	Sun,  9 Jun 2024 03:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="BKk+ta52";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="MSJPQ9QI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh4-smtp.messagingengine.com
 (fhigh4-smtp.messagingengine.com [103.168.172.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D308D10E0CE
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2024 03:24:25 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 0988C11400D1;
 Sat,  8 Jun 2024 23:24:25 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
 by compute5.internal (MEProxy); Sat, 08 Jun 2024 23:24:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm1; t=1717903465; x=
 1717989865; bh=nnBF7siKGaRQDQ6aerGHINxyaNRt/yxBE7c3TRJUhFM=; b=B
 Kk+ta5222eQf5DPK6prPs526sbG4F9QQTCVQBti/nP9PviQFHjz0INVPa0xfYyxT
 TmEOXDj5cHbBEm2L+vF9nOmJKmmrAgnTE4NV+I4Xbms5JkY8AQA9ilpdNBJ5ZEMd
 F7y/b2e+FkqP5wA1cYgbETAlVtM5rZTsSBoR8XGVaYKRD2twTSLJeH0ilDHFM+qF
 LivXdyG4G6SB5kpU6EPPj8k2OmE7ln8pxG9mPngc/TFeMuD6Pm/4x75jpIHxC2Jl
 zlrP1z1gHnJzEfz3c4mk0E9o7v6SrfO6IUaseWy/VC3Xwc1JuJea56IeQtWRA8oM
 2kBobGhIxLeyuglX9bhgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1717903465; x=1717989865; bh=nnBF7siKGaRQDQ6aerGHINxyaNRt
 /yxBE7c3TRJUhFM=; b=MSJPQ9QIlr4ygV7QNPN/Si+UtkH4CfcjUk6xsLe1iWPM
 24+i3srzRiBYYATw0pStvQQEILTBd++Fdr4AbTO9HwG8R9/Imx/KwjL/Bq1DHnp1
 CKBht0eNMs3U/55FO06Ne8mAchgaJ/Cs1+rF6jS/OycoAiS37FyzixCqR+JjI2V1
 xhlXwWJrTteNT5kDVB4eB342Bxjvt3UBlJWPD+3PsNLDm815PhDbZc7q6wpiciVm
 X8nhibMHKRpzPWGbSX0qaDE1NDXlxXGVWu/lECR+CXRJMjV3jy/A4Knt9j3ZBADl
 EtscSd9EbDjnf9dlwF4eKaTXeljae5DVSAgW2MGpog==
X-ME-Sender: <xms:aCBlZtzq4Iej0v4z0pQjzmzACck0ZpOueps8_w-52nD-H8dlWsztjw>
 <xme:aCBlZtTDi4Cx9A8tvsGOaBgxc0DRC1IZj2fewqtW_0LLx7tBBbC0WEMcR17mAoNAE
 HxI-yRcp3Uw84TSew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedthedgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftfih
 rghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecugg
 ftrfgrthhtvghrnhephedvveeigedujeeufeegffehhfffveduhfeijefgtdffteelgfet
 ueevieduieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homheprhihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:aCBlZnUxQ6Q07T376-AdZt-Uig0J_aza8YikRTZJvMoc1VdcJgtdDg>
 <xmx:aCBlZviYyqHmD7U2d-9mB8KUiHza5XZPWhqhxuSUb-SG25-EnwE4qA>
 <xmx:aCBlZvC1lTmxvNjqAm9661U-860GiTz7yShZUw-kxMNHRQvhPvkbNw>
 <xmx:aCBlZoKzWmCsCEHPSYV5pu-pZ4cOlqGoP2Df6ms-iKUtIg7ZAG-ODg>
 <xmx:aCBlZuAgU3Vzt00mK_NWRLSxA907WXH6k4uFtXtTpebV7EOg6K5EatSb>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A6403A60078; Sat,  8 Jun 2024 23:24:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-497-g97f96844c-fm-20240526.001-g97f96844
MIME-Version: 1.0
Message-Id: <11376802-7c04-4779-9dac-f41301a64b60@app.fastmail.com>
In-Reply-To: <20240607153250.51906e89@donnerap.manchester.arm.com>
References: <20240607110227.49848-1-ryan@testtoast.com>
 <20240607110227.49848-8-ryan@testtoast.com>
 <20240607153250.51906e89@donnerap.manchester.arm.com>
Date: Sun, 09 Jun 2024 15:24:03 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: "Maxime Ripard" <mripard@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Chris Morgan" <macroalpha82@gmail.com>,
 "John Watts" <contact@jookia.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RFC 7/8] drm/sun4i: de3: Implement AFBC support
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 8 Jun 2024, at 2:32 AM, Andre Przywara wrote:

>> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

> This signature suggests that it's indeed Jernej's patch, so it should
> have his authorship, as in the other patches, indicated by a line starting
> with "From:" before the commit message.

Thanks Andre, no this is Jernej's work, I have simply minimally refactored to as cleanly as possible just support the DE33 with this set, and added the device-tree binding docs. My mistake in my git client pulling in his patches, will correct authorship for v2.

> "Co-developed-by:" is only used if the patch really has two authors, both
> having contributed significantly to the patch.
> If you merely post a patch from someone else, then it just needs your
> Signed-off-by, as you correctly do below.
>
> That applies to the other patches as well.

Thanks, noted. Will correct in v2.

> Cheers,
> Andre

Regards,

Ryan
