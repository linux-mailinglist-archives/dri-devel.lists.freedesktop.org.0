Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D1C546233
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C609A11B280;
	Fri, 10 Jun 2022 09:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF11411B267
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:08 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BEC745C01B5;
 Fri, 10 Jun 2022 05:30:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 10 Jun 2022 05:30:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853407; x=1654939807; bh=t3
 Gp//PfOnxiNK1W9yZNy0yNJt+7mVFqz00HXJBploc=; b=ecBxoWgp4nCTzEZAUM
 XazcSZMakqnAbhD/WAHw3wqbh94HnuWWKljpy7IDmBlodcoWrclLyfuk9IH0ysZM
 tBMjpRg2Ciwh8V+Mx9V/4KYsE0gkXmrhUWAvxS0iEGWC/tWBxHWJXbE0h5mChdW2
 lN0orfPVLyo0SNDj9jzMpagm4OqsCgWTAmRzi+pd408CJQ9PgPQIBzDnjfuVKy58
 f0TEpoVzid4ejZzzqo9pW0NYA2szVHcvW8W1XRyXjNNqn3fDkY2ZZLtiqPZtk9RC
 9ncLG0PirOLCgAn6+xcUYbBtWu3E/GgbBdg45m8YtLuAN1R2XOY/0e3dM/qWkMHd
 5EBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853407; x=1654939807; bh=t3Gp//PfOnxiN
 K1W9yZNy0yNJt+7mVFqz00HXJBploc=; b=azcVocyUB2g5Broa1r36Tr8cnCPeu
 j9l9an5PnBsxvsFPtBshkOf8VwnTc8t6QtZCLEL7jkmkp71p354II44pxROkCKxi
 LWw4w76KJlyI7+npFHyOTnBNg5h5BPO4PzQKkPu05+SBjCrsDDAYsW9o6u+Ty8i1
 VuekOQk1dJTOvEFQ5HhzoyuN7oZY8e8Iqwf8e6oLoAQN1Tk1mHosfn3SQplcy3nF
 jmirWQYYcVsfD0Wdhjk8QO/Uuq8w23/alRGacXELoIaiEFu3srbn82tOF8zf0qYM
 6XZJ/d1ETkoYeJDNtPwubszeaEYmWPI6GuVLsjXYRbLDhzRccfQKyi/Og==
X-ME-Sender: <xms:Hw-jYoLxAublPzV690RnK7EpFRYTwcw5w0n-sOIW1Xvq1T__qLioHA>
 <xme:Hw-jYoK8CTxc2i4Ei1G2Ycsr0XSHWDveB0lMc_MZaZO1WvK8aDjECzMTbLk0til8i
 mXMLyTvEZpDV230fO4>
X-ME-Received: <xmr:Hw-jYotnusplgscZIfGbZlvuDXc3_GC-KEwk3GWvWMTVnGd4FkX-0DzZWSWM0BbURz0hOIjltoNQI8X2mXtE1cMiSjPIhAfoxBc18ig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Hw-jYlZkbA3JIjeuNYCkhSRmoU6ta1M5hEHi8_Gn8zvNhOfJUZqfig>
 <xmx:Hw-jYvbA12ictcCuWsAaqwtwt52IxI4qjsudzNAh7qYdTZ8tNaAUCA>
 <xmx:Hw-jYhDJ6DJ4N7aYpkxgR7Y9Mqh_ovDAsNLzzzKyIAHnUpJWwh0UhA>
 <xmx:Hw-jYuUwOSi78c1je_WyVPVdCx77A0A-s-9mvuWmpTbKhFSIwx-EIA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:07 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 22/64] drm/vc4: dpi: Switch to drmm_kzalloc
Date: Fri, 10 Jun 2022 11:28:42 +0200
Message-Id: <20220610092924.754942-23-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our internal structure that stores the DRM entities structure is allocated
through a device-managed kzalloc.

This means that this will eventually be freed whenever the device is
removed. In our case, the most like source of removal is that the main
device is going to be unbound, and component_unbind_all() is being run.

However, it occurs while the DRM device is still registered, which will
create dangling pointers, eventually resulting in use-after-free.

Switch to a DRM-managed allocation to keep our structure until the DRM
driver doesn't need it anymore.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index c88e8e397730..d1eaafb43bd1 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -244,9 +244,10 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	struct vc4_dpi *dpi;
 	int ret;
 
-	dpi = devm_kzalloc(dev, sizeof(*dpi), GFP_KERNEL);
+	dpi = drmm_kzalloc(drm, sizeof(*dpi), GFP_KERNEL);
 	if (!dpi)
 		return -ENOMEM;
+
 	dpi->encoder.type = VC4_ENCODER_TYPE_DPI;
 	dpi->pdev = pdev;
 	dpi->regs = vc4_ioremap_regs(pdev, 0);
-- 
2.36.1

