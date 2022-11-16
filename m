Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F2A62C23E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 16:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E6A10E4BE;
	Wed, 16 Nov 2022 15:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6247510E4BE
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 15:18:37 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E8E1232004CE;
 Wed, 16 Nov 2022 10:18:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 16 Nov 2022 10:18:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1668611915; x=1668698315; bh=rBfwRPMrSZla8fIVq3FfwXuML
 qmAOw2eEs2Ghka3rzI=; b=K7kePJnpikZE3m2MnSf0gsyplVc8eeYhsUKEKY1sB
 iU9Jvx+Z27NF4r65ROwB5xcKpeH9q3YFMOOtEIG7MpQW9s92bKyDUkNv7sgpKa2X
 c1mlZw4c60IFJ35sDMgd2UjZ4bCPqT65q0EiyMy0d46JfqauAJ1UeFV/C1JLjl0T
 2g7jKAx8drjhH0XQrfneQVEPbBT7o39KqQPcL812qT10s+UVOkC4/3nAMH2eEabs
 x68AthkBb10FSIxQFzQW9zn6tsaD2CUTgB1m7eepbQ+9nBar3NyCjJnEVw++IJYj
 4EjiRzUvmOWSr1qvSYuN5jNH07ZLjCyAqxu18pRbPkHvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1668611915; x=1668698315; bh=rBfwRPMrSZla8fIVq3FfwXuMLqmAOw2eEs2
 Ghka3rzI=; b=ulxicxaEk/BFhSOfCUwgR1KHlfGL6C/lVRCTEJfzPSrx63BqABz
 TF7HA/7FV3W8e7fcm2xGNx92Bv9HmqpjV/JfBGpxtOXnEKFtTz9Oi8P2tzlzbcZe
 hJlzrWME0bKadD56zUewXaSR5SsW12IpjYy0bC+aSKD2AbTNmyQQAKnQUxwcH9n0
 KY6Y4GqatpS4uQQdIu8/HCfpccRBHuL/F4F/PUZ6RA9udmbZTWDnSTufDtBTHX+h
 /1g7YWQy1OdzOFGCMOkTfeYisGPzi261p+3t9vC/iVnBqSnyg8vHpQPzE4Nuttbw
 l4BKVQTFFYYIcXt/yxDF4JWq5WlLjU7Puug==
X-ME-Sender: <xms:S_90Y4w7R1AGEkgdsL9MQDZ3o3dCgb01z6djRmrFyoKzelxpAyq2lw>
 <xme:S_90Y8Q-2sJTHU2gqV0WpyKZhRpxLD5KV-k5d7sZZzetKAFwnzf5jgJuog5WPYUO_
 evMyqfIg2QUBzTP6h4>
X-ME-Received: <xmr:S_90Y6UpYdfKhfJGBIYgjuYRB_e5aAuS7TAtssQOABSGaASuVvF2nVZYeo2xZfEQxj69dG3_ugZfd3z5TCN1bao_rjxMEq4X61dDAyxYnUlBcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeigdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepkeetudejieejfefhjeeutddugedtjeffffdvtedtieegkeffieelleegvefgvddv
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:S_90Y2hlyL4-rFAOUQIlTTTvXmQ8QqLpMAP2pxyyCC18Uont7ZA1wQ>
 <xmx:S_90Y6Bhki5B3G-NcnRmfo71-WKUHwKd5M5D4ybGdtjVL1Uc89bzhA>
 <xmx:S_90Y3Ltb5h2GuquGkPdD_6pux2TAV4oIbnLZ0TGKsEPKypRN3_a-w>
 <xmx:S_90Y-6b1MQUmBfe08oxk7c-EiALHqMPRA4GEMsvGIR9ZVulQYfKeA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Nov 2022 10:18:34 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 1/2] drm/tests: client: Remove extra blank lines
Date: Wed, 16 Nov 2022 16:18:32 +0100
Message-Id: <20221116151833.1679379-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.38.1
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

Some extra blank lines slipped through, remove them.

Fixes: 8fc0380f6ba7 ("drm/client: Add some tests for drm_connector_pick_cmdline_mode()")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index 558c098b0384..362a5fbd82f5 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -53,7 +53,6 @@ static int drm_client_modeset_test_init(struct kunit *test)
 	drm_connector_helper_add(&priv->connector, &drm_client_modeset_connector_helper_funcs);
 
 	return 0;
-
 }
 
 static void drm_test_pick_cmdline_res_1920_1080_60(struct kunit *test)
@@ -85,7 +84,6 @@ static void drm_test_pick_cmdline_res_1920_1080_60(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected_mode, mode));
 }
 
-
 static struct kunit_case drm_test_pick_cmdline_tests[] = {
 	KUNIT_CASE(drm_test_pick_cmdline_res_1920_1080_60),
 	{}
-- 
2.38.1

