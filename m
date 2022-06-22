Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C09554D2C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4841D112CA5;
	Wed, 22 Jun 2022 14:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E52B112CA5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:33:18 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 35E2A3200979;
 Wed, 22 Jun 2022 10:33:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 22 Jun 2022 10:33:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908396; x=1655994796; bh=VU
 Ya2xjd+eBtd9ENjjigabYwiHfUwjA6uqACmadKQJA=; b=dX1w68e/7aBJWX2Fkz
 F6pWfHs5eB9JRFaVJwCqUsUfOI7CN5V14B6Sg6XHU7PRE5Mx2yVerm2zPHDG8TLI
 EzAH9/Qynfc2H2Pq2x5WZY9uoBRa7eXVMo7Hj0AOEvULIxEvVMBboEkaaSTBJ4Ty
 4v2TkkTGTqxR8oBWsqPaUjmclKNjjRjDzM/tqSUgSyMBqDNYHosIff29IAaozvCi
 /Q/RmB7WxMMfHLRkU4pEYeq7aTMjYvY70+z4RlsEnmEcyVrLwwCwlPyPRsZaNEgJ
 5Dn4nInmTTNkn0KxhVFAVXGumiPDGLYtyOB+W26dRQ1hHJ6lsS57XfVmCmVdUJG2
 tOvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908396; x=1655994796; bh=VUYa2xjd+eBtd
 9ENjjigabYwiHfUwjA6uqACmadKQJA=; b=c18rzuf09mKRdcRDevboiZNxqP7qB
 6/mch05sXHPEIG702R6G7H08aBDehjiBYYJ9wYCR7BaoZ7+DfXggQssSUjBUlLWn
 N/789JiAlo49png8/Wy5Ahtl0AQyojIro1aPMWUREMEeG50bylv0Z7PtaXDV5T7s
 G36RVZQLQDBh2z+P/p+LeRUQDoyzfcLbw4mPICTP90woO1aryDVbMWHoybuEDzWw
 7cog6ZZ5S8KAY+CMps/tLPJwVCxgNkkavUpjp0318W+hB9FQn83J3WTaB3Y2zeYp
 YNsMFyT5MQGneJT4vQDrmm5TwPUYqSlWfxpirGhRgAOD0rzIXBDIvX9YQ==
X-ME-Sender: <xms:LCizYk7FxsZd_LsMsRvaWKai1QqCYhINuLODcZVqTmlYhnJBDRkaPw>
 <xme:LCizYl4yxAevrPQ0ytff-cgI0xO3v8Ld2XUy0w0UeUWlPfV7YFjH9BWmWqS8v1en4
 rKIAWWoSmWYcRrGxWg>
X-ME-Received: <xmr:LCizYjc-0n1QUEOn26VM-GC4rcbtq2W-V67O73tAa5iZJaM80-c5xNqv6qgvdFQJq9ivH5yL-dX_kJUAdIiXw2sgQgyYAW3naa4RbqM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LCizYpJTAciEnh2FNGvqiAFjY5BOhtC3PvKfceYI46Ia1_Gxae4Mzw>
 <xmx:LCizYoKFgTyZ9QTDQLe_Cvcewr5ufO-AJv8tyDUJEe6jK2rRCfi9_A>
 <xmx:LCizYqxA13H7puLsfWqhwSAVIrCwQTor1TpoIZselc1DHp_gChknww>
 <xmx:LCizYigQr42Jj5d-YAeHyxQqgdpEFUCZln0FiFcfByXB-yVW7A77mg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:33:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 20/68] drm/vc4: crtc: Switch to drmm_kzalloc
Date: Wed, 22 Jun 2022 16:31:21 +0200
Message-Id: <20220622143209.600298-21-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our internal structure that stores the DRM entities structure is allocated
through a device-managed kzalloc.

This means that this will eventually be freed whenever the device is
removed. In our case, the most likely source of removal is that the main
device is going to be unbound, and component_unbind_all() is being run.

However, it occurs while the DRM device is still registered, which will
create dangling pointers, eventually resulting in use-after-free.

Switch to a DRM-managed allocation to keep our structure until the DRM
driver doesn't need it anymore.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 188cf25125f0..dadf962b0bb5 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1279,7 +1279,7 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 	struct drm_crtc *crtc;
 	int ret;
 
-	vc4_crtc = devm_kzalloc(dev, sizeof(*vc4_crtc), GFP_KERNEL);
+	vc4_crtc = drmm_kzalloc(drm, sizeof(*vc4_crtc), GFP_KERNEL);
 	if (!vc4_crtc)
 		return -ENOMEM;
 	crtc = &vc4_crtc->base;
-- 
2.36.1

