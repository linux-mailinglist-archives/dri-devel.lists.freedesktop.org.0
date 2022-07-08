Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E828C56B60C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3451137E0;
	Fri,  8 Jul 2022 09:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350461137C6
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:57:22 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id EB87B320031A;
 Fri,  8 Jul 2022 05:57:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 08 Jul 2022 05:57:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274240; x=1657360640; bh=YP
 EDMy0rIk/gxi10eqHpwwkj5Tbki4hCqBkxghm0y+M=; b=qbVZ7dyYEeAkgzJJJQ
 cz+Q7fefPr0FJM4bqpMQ48AtsMPxPklFeS4jpUlGqXYvQ5R3xPkHeuhXaHTOEYEN
 w+3fuUu8vz3WyNrzL00KC1RfU7brzdwhT8GkiZwEE0hTKcjJRha5Dns1Bg/QaZf+
 Ummlh9yj12MjR90dxJ47pO5QMWk7nDJzAPh/hkjYE39LYDwS1xA+S8DvkNqnkita
 l6UwnOGzyxEbKT9Enpq/3bUhYd5z9HG5rDt5BLVq58amBzmrvtJD4wfNPyfgdSSH
 IffNq3v5IWVdqBYlFrdirQusUEB8+xrI0F/iO7eB5m2UrHGbAq0ybAs3bxVoWVF2
 xO0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274240; x=1657360640; bh=YPEDMy0rIk/gx
 i10eqHpwwkj5Tbki4hCqBkxghm0y+M=; b=J6EmPxE+NGXJCfG/BBursQzdrwkIk
 YwSZBxsvea8S906vxKJBQrmxOb2/HgEm1A0f6yGE+Exb2eawxVFVAC3A7r6K3/ni
 uXOPEe4MhkzRqkW+Y0AHBiUv5qjRNHElGBNLlOzj+crw0jJwcwvklS387g+QtLBB
 hToIG9aJnDyn9wqTZ+VXU4njwiXMIeexRz8O6WUr9xIWYCqNNMhh7RlktzWS/IUg
 kC12m6JwRRwYq3zEvUnI5AgsLW/gTP2N22n2bTMvpcRksJv7EVGU//CsQxZUzQtU
 2r//DUQMci/6Vo4rOJ5KouUplFPWd/7hKnV3zjT46SOy5t1A/mJUrXAdg==
X-ME-Sender: <xms:gP_HYltu_XOpeYV-169Oo1GGJ5euZkHbTs3LMCzu9ge5WZV34A2H3g>
 <xme:gP_HYufa5wESrKMaETBTS6K5u9yClXBtk51DivqV_agAF00Sh1L5f3esd9T4fQvDl
 ZH-OJbac6tcDp9R94g>
X-ME-Received: <xmr:gP_HYowWuDRWyoMPRxYESkdF6wcqynhHiGUFDzsh327jRafilAf77BCu-JVKpz79LKVIp3PHsrXLy7UgvQVEBMzuLM7mA6EnD5HWduk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:gP_HYsPNlkzyjG-LCB8gpKtx92IwvllU0bAZAlmsO6lQwjcWX-liMg>
 <xmx:gP_HYl-SGh81uGF5Fqy1YOQ-a5lBPaWNksVraX5uvPmGaTxD5dNPsA>
 <xmx:gP_HYsVITPA0vKpNJ0lwXU28VcKuINpdeMy9-Z5IK1oa1y4pLr0TNw>
 <xmx:gP_HYolDS9QjDIH3ebCSd29STgvlIzHWg5viv7nvdMiZBJlmgCmObw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:57:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 04/69] drm/connector: Reorder headers
Date: Fri,  8 Jul 2022 11:56:02 +0200
Message-Id: <20220708095707.257937-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unlike most of the other files in DRM, and Linux in general, the headers in
drm_connector.c aren't sorted alphabetically. Let's fix that.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 1ab083b35e3b..d64ee257330e 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -22,15 +22,15 @@
 
 #include <drm/drm_auth.h>
 #include <drm/drm_connector.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_file.h>
 #include <drm/drm_panel.h>
-#include <drm/drm_utils.h>
 #include <drm/drm_print.h>
-#include <drm/drm_drv.h>
-#include <drm/drm_file.h>
 #include <drm/drm_privacy_screen_consumer.h>
 #include <drm/drm_sysfs.h>
+#include <drm/drm_utils.h>
 
 #include <linux/fb.h>
 #include <linux/uaccess.h>
-- 
2.36.1

