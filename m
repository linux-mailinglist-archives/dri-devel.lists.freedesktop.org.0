Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C427610F62
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 13:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1903E10E054;
	Fri, 28 Oct 2022 11:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250B810E054
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 11:07:45 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 93A00580289;
 Fri, 28 Oct 2022 07:07:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 28 Oct 2022 07:07:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666955262; x=
 1666962462; bh=OYj6o6DnZKUsBvBaK5mj7xz3Z8JqgZYvtzCw/qoEraU=; b=w
 sq+CW412oUyrsDh5S45/LoPes27vCt3vT10MfIXWMpa6n6jCgLu1lmXDCFcwrJ+F
 IJtYJBIzQfXwYoX9yrCJ92/L5F8xKpvtblKXx20b4g0JWZZmy57FR9wLcDuw3Afw
 xyW63vBoFZLOqg0iUoDDgAtGD2Hx7ezoLvKbydT0EmGvabDGBq7tL4o/dO85wNdc
 rCyIYQ/kU7o/EFRjyRBa7+HKZd/FPP69MFXMZpdKiAhWYKoah2b+jdVnuM9cPYJP
 zgg6+6ClRjckaqhfKUov6Z+j15mAIJwynQS8bZl6rnakyOwel3GJXTRMIQ6+NHUH
 o/ZTfaRSq6tlDX6Sc7c6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666955262; x=
 1666962462; bh=OYj6o6DnZKUsBvBaK5mj7xz3Z8JqgZYvtzCw/qoEraU=; b=I
 ahelEVX7Lk2W2EGqjd9sRD3Xi0rIRmbxZZNjO0F/bz4GEJwK2NHQBjzRxN2YKbvU
 oPL6Vf0/Twxw9Ljl+OQpXi6j7HZEvV1zbuFlcV2kD1Uqr8Zek5v34OeXNEYE2fsT
 Lq1rGR0jT13mEvBoVznFkHbBPQ13defx/uydLSyoQcExfsLPaZ2Hha10R6CuKOKm
 iByLN6cTbvGuTjI8j3GXdBCI0xB/O+PDGrqfDj6kDUQoRhNn7wN2q078QCqs37xX
 JBlYj8DEid5A1vmmlhs0hzyQgZZIVpOgcKickh4to7jJGVTXEn1X/5AFpWDtOiEA
 3/PBLCJklxjXHlCVZWgtw==
X-ME-Sender: <xms:_bdbY9nlMpgJ-SvrrsHu4hBzrmbksZ4wVAGcareqd6XbukVwMcD6SQ>
 <xme:_bdbY43vLuIUZuX0bw-eM5qjNm0mI_TjLgV3IY1oWr0DlyAojyzCvegetv2hKcQ36
 vy1hgu964lglKJYgBM>
X-ME-Received: <xmr:_bdbYzoFkYzbyYJlwsdX5NMC7ZOc2zZ5OKVZ_BSdD1-XKXArUfmZecyC_O33YiHRUg6B7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeigdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgueelkefgkedtvdeiieeffedtleethfffffekjedutedutdektdevfeeu
 gfevteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:_bdbY9nBzIZ6fl07d66DAFHVfGCiKRFCqIHkaFCIleWqs0sDIBKKNQ>
 <xmx:_bdbY71Dp3lJAvFZ6Dsrj83_8R8YQvGvSmv3D07nmyVlwRevG5ApSA>
 <xmx:_bdbY8tBNuySi2rYTdW_7QR0YXplBO4UVxrAZ3YL0pnQfuIatvPlkQ>
 <xmx:_rdbYw0N9H5qxDVM1CYTeBbob4_hXHD92eTcnObWzCxxs_wE12tOFg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Oct 2022 07:07:41 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Florian Fainelli <f.fainelli@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 David Airlie <airlied@linux.ie>, 
 Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
 Daniel Vetter <daniel@ffwll.ch>
In-Reply-To: <20220815-rpi-fix-4k-60-v5-0-fe9e7ac8b111@cerno.tech>
References: <20220815-rpi-fix-4k-60-v5-0-fe9e7ac8b111@cerno.tech>
Subject: Re: [PATCH v5 0/7] drm/vc4: Fix the core clock behaviour
Message-Id: <166695521879.181622.13070643628077395603.b4-ty@cerno.tech>
Date: Fri, 28 Oct 2022 13:06:58 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org,
 Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 27 Oct 2022 14:52:40 +0200, Maxime Ripard wrote:
> Those patches used to be part of a larger clock fixes series:
> https://lore.kernel.org/linux-clk/20220715160014.2623107-1-maxime@cerno.tech/
> 
> However, that series doesn't seem to be getting anywhere, so I've split out
> these patches that fix a regression that has been there since 5.18 and that
> prevents the 4k output from working on the RaspberryPi4.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
