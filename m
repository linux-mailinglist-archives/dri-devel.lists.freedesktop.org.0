Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5B05F9E67
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 14:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32ABE10E4B5;
	Mon, 10 Oct 2022 12:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A3110E4B2;
 Mon, 10 Oct 2022 12:10:52 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 9AEDA2B067AA;
 Mon, 10 Oct 2022 08:10:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 10 Oct 2022 08:10:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665403847; x=
 1665411047; bh=h6MDYVkUrCUpK3ETe9fcuN2TM8Pd074coaFYvzfkf3s=; b=X
 8TTYRqTCQS2QJhsYN7GvvAJRh7lJ7Anah3pR2RReFaL/R+5luKeopHOSW0w6nJCC
 wEDZF+lFROGCYFiFLWRbYuNAlFBotirqVeewpXjYbElZQ8E8k5KPJZDpxxL+8o7P
 m14oe5QNJyBDCN2UhEX41FSQ14j2V2TLtp7O9cFS9aS7GuDs/ejSz3oo9Entho4t
 gzrvbg4H8gRWrgpJLH0mg8UpA2HgJSvg5Wkf9tidJBKGGP8SFUy3Hzs1uHRVTjel
 2mgZhegx/CmyQOCuFz+Nw4kihKjUipqWx2JADrbKtx24XNa0J0gODEpgjc9r/9aX
 xUe3E87GwsKevIT7iqzbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665403847; x=
 1665411047; bh=h6MDYVkUrCUpK3ETe9fcuN2TM8Pd074coaFYvzfkf3s=; b=H
 PpyDxQ+0ZEygAo/SXVkKH7PGtx5TPR0HqlATUtyCUxdQdC3h8ctBbDzxmbHVjc+i
 nRH3i5GtxCMz2a8oTcpUscBfrrTgP/Dj8pVAlyWSnGakoXRBAmC9Fg6nxGMH2g4a
 wcw/ZS/oZyxaicAtMS5cohDJOr/37IIqrD1kdQg1kCPOgAkATaNedK/cJLfGDyXD
 XgHzYdCZ+yAQxJi0zFRJP7+rvjQ290H1l9hzZoa9hCwtp3Q6cFCsanyQ1ItdC3OE
 9mBzpBTAxmOCOG5NoebuKEHAaNR9sJUnU6WS/m/VD9vOf3jbdy8vtlcddHawV1Yh
 UK0qVaRdd2pRBHdt4bviA==
X-ME-Sender: <xms:xQtEY9ZqrX6ifLo6Uh1Pyk-C6WQKbR6hgrOtvLDxIYYHLxR6cqee6A>
 <xme:xQtEY0bdEBf3f3gAPzO4ZztjUZCBvdHAFBWPjOgj-vXHoNyowVTfwYGcMEai8OJkG
 7IVdpspdyTzVFMgRsM>
X-ME-Received: <xmr:xQtEY_9y46DdXsGqz3rxNTqtSbPjzoj6tuBxt3QrbtWfwpnhxYvw1gJ-Ma3V>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejgedggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xQtEY7p8IERGoTKuQJ72GS68rLEkGr8D_8-OhO9De8DfkXIa5vCB2w>
 <xmx:xQtEY4r7n7X0UTKUO3laEFPGecThTwGQEAZFNiWKWRhvoTEhaQ-weg>
 <xmx:xQtEYxSyOiGzUuzutWeAtvZioN4TcrsBGPdorJiYKgwBDqZl6fV0lQ>
 <xmx:xwtEYwF-Dwf_OHKQz8Xh1M1zUNqYz1MchTlaPg-7bWhc07gzqysHGEKu99Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Oct 2022 08:10:44 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Samuel Holland <samuel@sholland.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <maxime@cerno.tech>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: (subset) [PATCH v4 02/30] drm/tests: Order Kunit tests in Makefile
Date: Mon, 10 Oct 2022 14:10:36 +0200
Message-Id: <166540374295.183315.10600855236256660249.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-2-60d38873f782@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
 <20220728-rpi-analog-tv-properties-v4-2-60d38873f782@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=EF=BF=BD=EF=BF=BDnnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Sep 2022 18:30:56 +0200, Maxime Ripard wrote:
> Since we've recently added a ton of tests, the list starts to be a bit
> of a mess and creates unneeded conflicts.
> 
> Let's order it alphabetically.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
