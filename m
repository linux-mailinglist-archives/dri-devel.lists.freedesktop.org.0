Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C747687B6F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 12:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EFB10E4D5;
	Thu,  2 Feb 2023 11:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E778910E4ED
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 11:03:19 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 5D9435C00FB;
 Thu,  2 Feb 2023 06:03:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 02 Feb 2023 06:03:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1675335797; x=1675422197; bh=moLcA4bsezUE5wyDqyRqDRQ/m
 of6ux2pDf/1s00zbjI=; b=DUx865NrL7lH1aROPGqViwPHffJrdveVuS5MLupGJ
 Z6RueFe3fFhhI+A3crczqaWHz+KtdXVtqSSIof+nSgSvDA2BRPZHEAFOW3etioG3
 9ky3vRfJiWU6aPsdxq0KmvzUKpepmxEEuNFTY21OChIsNRWlsr2zJDTJGBeW2d23
 soms95mVvA4ILkaYPV86rAS4wqeBNwbddo0E6+Sc0WErFBzOef0L78u48vs+tr/A
 I0rsl17DUcsR9tc4XIAtVup+Nj8FfETwFvpCaCPddnCB216ekoLAztLivvHIkYkL
 I5JnOv5PMI2wR6I8bNRIQYaOqEyrf/xLrs2a8nzmTcfPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1675335797; x=1675422197; bh=moLcA4bsezUE5wyDqyRqDRQ/mof6ux2pDf/
 1s00zbjI=; b=XIPa1FBStrqkCigfTK9zfRQ5B8z1OJjm+kfirOxWa9EX8BbNJwJ
 nNwzpuvAihu8xfx0nahC/7BXOaPrhO6orlCLiWmU0JQPM+Se+G5tsQ1IlXAajkCy
 N4Ahc4lolfuTtojUEYPOnXYClJWcmbxdcbECosZsF95hUiHzRjbBocXJ5Lx/DVmQ
 PKEUpY4K1FllluEZRsEm5Rm3wtvq8Va14861LoOpjKg6Jr5/m20svJZPcEi9QIVp
 GEruwuXRo3+B9NB/nlgJWQa2NeK3i1o5w7ov6KZIedNTNFJBfl+OZyW+4Qf6tdR/
 HJ8ad4voqbOGQkthVbMIEfAgDvl1VzduKJw==
X-ME-Sender: <xms:dJjbYyz4L0Bsw4_CD7zzv4YOm0jlZPHRlt0pObZFaLbe-Q0HiIqFtw>
 <xme:dJjbY-RO6qVZECig-55OFDZRhUngLY21rEcewEcdABUQGQiBiv_K_ye5XSstQ7Au3
 C2Qg12dG42_K3mMJdw>
X-ME-Received: <xmr:dJjbY0XHNJFhOUbgOP78ud2TKAP8URK2b3huyHbUQYogGUdm0cZz0FgEwCBKeb4C3jiFFVBUoe8OvrubISV4BfohBadSaBK05WJT-oj4_iEHPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefkedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeektedujeeijeefhfejuedtudegtdejffffvdettdeigeekffeileelgeevgfdv
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dJjbY4hCAA28cBJN-C1W38yu2Q1VSbHUzV6IqJGCTNrf2ZbOqA3Rmg>
 <xmx:dJjbY0BIhkaDme74BIjQtAFqmKWTjaTwDzyEsb_1RNAJeiFIrqx2-Q>
 <xmx:dJjbY5Lf_EexBTp5UyEIi691QvM0HkPZwji_gSSE3isbBS8eaUu2XA>
 <xmx:dZjbY45qD0JwGBHoMHxEgEB-l-gmkChd4XRzDFW_QsFByNLRGJ9x5A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Feb 2023 06:03:16 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/client: Convert to VISIBLE_IF_KUNIT
Date: Thu,  2 Feb 2023 12:03:12 +0100
Message-Id: <20230202110312.808607-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.39.1
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

Commit 8fc0380f6ba7 ("drm/client: Add some tests for
drm_connector_pick_cmdline_mode()") was meant to introduce unit tests
for the static drm_connector_pick_cmdline_mode() function.

In such a case, the kunit documentation recommended to import the tests
source file directly from the source file with the static function to
test.

While it was working, it's generally frowned upon. Fortunately, commit
9c988fae6f6a ("kunit: add macro to allow conditionally exposing static
symbols to tests") introduced macros to easily deal with that case. We
can thus remove our include and use those macros instead.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_client_modeset.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 1b12a3c201a3..f48882941852 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -8,6 +8,9 @@
  */
 
 #include "drm/drm_modeset_lock.h"
+
+#include <kunit/visibility.h>
+
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
@@ -159,7 +162,8 @@ drm_connector_has_preferred_mode(struct drm_connector *connector, int width, int
 	return NULL;
 }
 
-static struct drm_display_mode *drm_connector_pick_cmdline_mode(struct drm_connector *connector)
+VISIBLE_IF_KUNIT struct drm_display_mode *
+drm_connector_pick_cmdline_mode(struct drm_connector *connector)
 {
 	struct drm_cmdline_mode *cmdline_mode;
 	struct drm_display_mode *mode;
@@ -215,6 +219,7 @@ static struct drm_display_mode *drm_connector_pick_cmdline_mode(struct drm_conne
 
 	return NULL;
 }
+EXPORT_SYMBOL_IF_KUNIT(drm_connector_pick_cmdline_mode);
 
 static bool drm_connector_enabled(struct drm_connector *connector, bool strict)
 {
@@ -1233,7 +1238,3 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
 	return ret;
 }
 EXPORT_SYMBOL(drm_client_modeset_dpms);
-
-#ifdef CONFIG_DRM_KUNIT_TEST
-#include "tests/drm_client_modeset_test.c"
-#endif
-- 
2.39.1

