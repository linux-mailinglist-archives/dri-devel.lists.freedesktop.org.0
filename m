Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4582388932
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 10:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2676ECD9;
	Wed, 19 May 2021 08:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A526ECD9;
 Wed, 19 May 2021 08:15:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DC0960241;
 Wed, 19 May 2021 08:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621412147;
 bh=TLTO07eCdq1orhOlOSYmgcvo49avpBaMddvAcag1RYk=;
 h=From:To:Cc:Subject:Date:From;
 b=lWKraVSXpxYlHZQ9F1B2jPEMuPOOJAyH26Z10nwEaNkhUxnDEkZn1hCYQoZnYsjbm
 3GzWv1gStcX1+E7nZ+HAo1c9BMXYSGGskS3lYu3sK1VaXPFYcHsRSxwCetmupwLhsb
 htKAtrp2YhOktI+8gPSlUmojlSiPQcG+RLNCf+QWc3UCDK4rPPQa5umgCpAhUIVC+q
 UYNcV2fIGZ5xt1uCS+8jvRnaW3dubw8VGIIPNZN1Npq1G01AmuikLWZyeMCyhOSRnI
 nrWwopAuuBwP+aGeOkcfm4pBKrMPMlgCJIbwmfbWaqpoQI9k0s5RNX3Tnmbf+Ppzaw
 XBP0qfGxzqyIw==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1ljHMm-007fB7-Uo; Wed, 19 May 2021 10:15:44 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: David Airlie <airlied@linux.ie>
Subject: [PATCH 1/3] gpu: drm: replace occurrences of invalid character
Date: Wed, 19 May 2021 10:15:35 +0200
Message-Id: <e606930c73029f16673849c57acac061dd923866.1621412009.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, amd-gfx@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are some places at drm that ended receiving a
REPLACEMENT CHARACTER U+fffd ('�'), probably because of
some bad charset conversion.

Fix them by using what it seems	to be the proper
character.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/gpu/drm/amd/include/atombios.h       | 10 +++++-----
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  2 +-
 drivers/gpu/drm/i915/i915_gpu_error.h        |  2 +-
 drivers/gpu/drm/r128/r128_drv.h              |  2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd/include/atombios.h
index 47eb84598b96..6a505d1b82a5 100644
--- a/drivers/gpu/drm/amd/include/atombios.h
+++ b/drivers/gpu/drm/amd/include/atombios.h
@@ -5178,11 +5178,11 @@ typedef struct  _ATOM_LEAKAGE_VOLTAGE_OBJECT_V3
 typedef struct  _ATOM_SVID2_VOLTAGE_OBJECT_V3
 {
    ATOM_VOLTAGE_OBJECT_HEADER_V3 sHeader;    // voltage mode = VOLTAGE_OBJ_SVID2
-// 14:7 � PSI0_VID
-// 6 � PSI0_EN
-// 5 � PSI1
-// 4:2 � load line slope trim.
-// 1:0 � offset trim,
+// 14:7 - PSI0_VID
+// 6 - PSI0_EN
+// 5 - PSI1
+// 4:2 - load line slope trim.
+// 1:0 - offset trim,
    USHORT   usLoadLine_PSI;
 // GPU GPIO pin Id to SVID2 regulator VRHot pin. possible value 0~31. 0 means GPIO0, 31 means GPIO31
    UCHAR    ucSVDGpioId;     //0~31 indicate GPIO0~31
diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
index 14e2ffb6c0e5..2694dbb9967e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
+++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: MIT*/
 /*
- * Copyright � 2003-2018 Intel Corporation
+ * Copyright © 2003-2018 Intel Corporation
  */
 
 #ifndef _INTEL_GPU_COMMANDS_H_
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
index 16bc42de4b84..4df24c737e13 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.h
+++ b/drivers/gpu/drm/i915/i915_gpu_error.h
@@ -1,7 +1,7 @@
 /*
  * SPDX-License-Identifier: MIT
  *
- * Copyright � 2008-2018 Intel Corporation
+ * Copyright © 2008-2018 Intel Corporation
  */
 
 #ifndef _I915_GPU_ERROR_H_
diff --git a/drivers/gpu/drm/r128/r128_drv.h b/drivers/gpu/drm/r128/r128_drv.h
index 8b256123cf2b..c4d0e21280b9 100644
--- a/drivers/gpu/drm/r128/r128_drv.h
+++ b/drivers/gpu/drm/r128/r128_drv.h
@@ -29,7 +29,7 @@
  *    Rickard E. (Rik) Faith <faith@valinux.com>
  *    Kevin E. Martin <martin@valinux.com>
  *    Gareth Hughes <gareth@valinux.com>
- *    Michel D�zer <daenzerm@student.ethz.ch>
+ *    Michel Däzer <daenzerm@student.ethz.ch>
  */
 
 #ifndef __R128_DRV_H__
-- 
2.31.1

