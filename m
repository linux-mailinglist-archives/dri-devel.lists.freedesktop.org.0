Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AF3546232
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6580511B282;
	Fri, 10 Jun 2022 09:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915B811B280
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:13 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E53265C01BB;
 Fri, 10 Jun 2022 05:30:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 05:30:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853412; x=1654939812; bh=x+
 qSrI5pb0WBVHA6/WzQ4OASCUMgu1KbPYOUZXBidZM=; b=clpVf8pD6mnxPSUTGv
 lKxrJkbuz2emhzPunVtihQGTECE1ZWOdNnvXBcVqHOVjJG7AtCB/5wasb/bKRZil
 HqyJoW/qmFxPhbgkzegVc6dQm8dHelhbpgiYY/0v5qbx0uZ0Q7fzwZJnM02zDPoh
 TwOUQPIFL+ZCzIZF10UZ7REzGsubUgHbEaskqFhzY6pm9Usclt4YUfBNZX/Sk7lv
 Zx7W2b0hO3iZhT0P6abaeU2DKxluXu8OEggFfDBtsu/szxTMB90lROZTNMizpiOM
 +FW9k9TBR1OA4INhoAkWmqwLscAZFgFDZ5fQOsm+uvXZu0MtsN5Upxr2py181J7W
 UkOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853412; x=1654939812; bh=x+qSrI5pb0WBV
 HA6/WzQ4OASCUMgu1KbPYOUZXBidZM=; b=EzP5iIJClyeusrm8o24369SOOFoUs
 vPGoyOGzopqvS78uCWH/lMdJ754lPqCPuZyYVotf+5QgJMFvhSdGCBQODXtP9aDc
 MacFFI4c9nP9sC5YMiZi7E2wo2uzxnO+gnCXtok3GtaFOH6NJ479tJFM+wavZOqM
 ZRpZE24xyeBnfEEZcA2NFjYPb6VHDvl4U9IWLtarql27jRlUdPvHxs6d00iGMFQj
 H7VCF9a06qDclL73wN2f+DrraD1/dut/sVlrSt0NHTm2m3PUyDboLBR/uibil6lp
 HAwpvbgDr4/f5SfXSpxTVtSTrz04BDNtyeFCqdL/mjCP4qrcb0KfoAdIw==
X-ME-Sender: <xms:JA-jYgHMZeBFj9wNYfp1DmsKROcieQL3zdUYsQywrfw7RSnJLPGuBg>
 <xme:JA-jYpXegjesYPdTeSWitMGGfnYkoe07Jchli6cP_roFTkVY3yBt9LgbplgoaLXGq
 RrgR8QKTUq85KayDmM>
X-ME-Received: <xmr:JA-jYqL7bpVTaiYtcET1IoRHO9YNzCU8FYcUDLqayhfbz7FGr7hAOBFKXBqyJLwMX_RLlOTypOg3FqPJvFX5_R3kDdNV2cc4YIe4WaM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JA-jYiEckBCkvEMir4DABzD6T9JSn4DbCGSGKhW-eTGB7Z_fU6f3tg>
 <xmx:JA-jYmVkUU9foPaE7oNEQc6CfFnqhyz5Tbu_wClUL3w2xfr6thFJog>
 <xmx:JA-jYlMZ3YkfWQi2Ht-EHP52NePk2mIze3OVx5T7TFgVRQ2yuqEj4Q>
 <xmx:JA-jYkw5JBq6MP9Senm2Sj2gC8TzvktRtnkDelvoz2LA8mJi0F1G3w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 25/64] drm/vc4: dpi: Add action to disable the clock
Date: Fri, 10 Jun 2022 11:28:45 +0200
Message-Id: <20220610092924.754942-26-maxime@cerno.tech>
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

Adding a device-managed action will make the error path easier, so let's
create one to disable our clock.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 5a6cdea7bf7b..4e24dbad77f2 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -237,6 +237,13 @@ static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
 	return drm_bridge_attach(&dpi->encoder.base, bridge, NULL, 0);
 }
 
+static void vc4_dpi_disable_clock(void *ptr)
+{
+	struct vc4_dpi *dpi = ptr;
+
+	clk_disable_unprepare(dpi->core_clock);
+}
+
 static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -285,6 +292,10 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
+	ret = devm_add_action_or_reset(dev, vc4_dpi_disable_clock, dpi);
+	if (ret)
+		return ret;
+
 	drm_simple_encoder_init(drm, &dpi->encoder.base, DRM_MODE_ENCODER_DPI);
 	drm_encoder_helper_add(&dpi->encoder.base, &vc4_dpi_encoder_helper_funcs);
 
@@ -300,7 +311,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 
 err_destroy_encoder:
 	drm_encoder_cleanup(&dpi->encoder.base);
-	clk_disable_unprepare(dpi->core_clock);
 	return ret;
 }
 
@@ -310,8 +320,6 @@ static void vc4_dpi_unbind(struct device *dev, struct device *master,
 	struct vc4_dpi *dpi = dev_get_drvdata(dev);
 
 	drm_encoder_cleanup(&dpi->encoder.base);
-
-	clk_disable_unprepare(dpi->core_clock);
 }
 
 static const struct component_ops vc4_dpi_ops = {
-- 
2.36.1

