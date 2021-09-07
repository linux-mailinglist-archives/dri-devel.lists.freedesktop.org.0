Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F00402E6D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 20:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F086E0A8;
	Tue,  7 Sep 2021 18:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BF46E0A8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 18:34:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="242579267"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="242579267"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 11:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="524311473"
Received: from jeevan.iind.intel.com ([10.223.74.109])
 by fmsmga004.fm.intel.com with ESMTP; 07 Sep 2021 11:33:53 -0700
From: Jeevan B <jeevan.b@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, kai.vehmanen@linux.intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH] Change igt_log level from IGT_LOG_WARN to IGT_LOG_INFO
Date: Wed,  8 Sep 2021 00:03:56 +0530
Message-Id: <20210907183356.11126-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.19.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

change igt_warn to igt_info when unloading the snd module before
unbinding i915 until WA is fixed.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/core_hotunplug.c | 2 +-
 tests/device_reset.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 2d73e27f..b3661668 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -164,7 +164,7 @@ static void driver_unbind(struct hotunplug *priv, const char *prefix,
 			igt_lsof("/dev/snd");
 			igt_skip("Audio is in use, skipping\n");
 		} else {
-			igt_warn("Preventively unloaded snd_hda_intel\n");
+			igt_info("Preventively unloaded snd_hda_intel\n");
 		}
 	}
 
diff --git a/tests/device_reset.c b/tests/device_reset.c
index e6a468e6..982ba5ef 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -201,7 +201,7 @@ static void driver_unbind(struct device_fds *dev)
 			igt_lsof("/dev/snd");
 			igt_skip("Audio is in use, skipping\n");
 		} else {
-			igt_warn("Preventively unloaded snd_hda_intel\n");
+			igt_info("Preventively unloaded snd_hda_intel\n");
 		}
 	}
 
-- 
2.19.1

