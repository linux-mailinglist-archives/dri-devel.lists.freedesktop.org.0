Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5314081D7
	for <lists+dri-devel@lfdr.de>; Sun, 12 Sep 2021 23:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90CA6E09A;
	Sun, 12 Sep 2021 21:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1473 seconds by postgrey-1.36 at gabe;
 Sun, 12 Sep 2021 21:30:05 UTC
Received: from tartarus.angband.pl (tartarus.angband.pl [51.83.246.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D180A6E09A
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 21:30:05 +0000 (UTC)
Received: from 89-73-149-240.dynamic.chello.pl ([89.73.149.240]
 helo=barad-dur.angband.pl)
 by tartarus.angband.pl with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <kilobyte@angband.pl>)
 id 1mPWb0-00C2Pi-2a; Sun, 12 Sep 2021 23:01:03 +0200
Received: from [2a02:a31c:8245:f980::4] (helo=valinor.angband.pl)
 by barad-dur.angband.pl with esmtp (Exim 4.94.2)
 (envelope-from <kilobyte@angband.pl>)
 id 1mPWaz-00036m-6a; Sun, 12 Sep 2021 23:01:01 +0200
Received: from kilobyte by valinor.angband.pl with local (Exim 4.95-RC2)
 (envelope-from <kilobyte@valinor.angband.pl>) id 1mPWaw-0002qi-M5;
 Sun, 12 Sep 2021 23:00:58 +0200
From: Adam Borowski <kilobyte@angband.pl>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Adam Borowski <kilobyte@angband.pl>
Date: Sun, 12 Sep 2021 23:00:54 +0200
Message-Id: <20210912210054.10939-1-kilobyte@angband.pl>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 89.73.149.240
X-SA-Exim-Mail-From: kilobyte@angband.pl
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on tartarus.angband.pl
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001,SPF_PASS=-0.001,TVD_RCVD_IP=0.001 autolearn=no
 autolearn_force=no languages=en
Subject: [PATCH] drm/fb-helper: disallow if DRM=y and FB=m
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on tartarus.angband.pl)
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

A subfeature of a built-in can't depend on a module.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index cea777ae7fb9..75a5a9359d4b 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -103,7 +103,7 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
 config DRM_FBDEV_EMULATION
 	bool "Enable legacy fbdev support for your modesetting driver"
 	depends on DRM
-	depends on FB
+	depends on FB >= DRM
 	select DRM_KMS_HELPER
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
-- 
2.33.0

