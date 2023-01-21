Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB8D6768C1
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BAF10E3E9;
	Sat, 21 Jan 2023 20:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4EDC10E3F6
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ADA0B60BA7;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8037AC433A1;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331673;
 bh=xAp3Rflu50hOHjPM6GGsERnHzinfkHqH1OYAV3UHijE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=cJhAmxvGmvZX47zcr6xWUsnn5OR1v8oIYOf4sJswyDXc75/oQkKVAaLsi4lwzBSKp
 +6Xa4Tc87YcBltJoND7rkrrlxQcPr9iw/vdNLfAkBJ42aN9xgkxzUk3OKpeaBlJjcn
 gvgI53ggOs9BNVG5TabENkn0F92ZSwLxm156fOQsK6UxZKJrFeK2momQfPa8sbVB8R
 j3T3Nj73rAs/CUpazlF4M4yaN//dPdkoRBB3zcuug+AH9Awz9MzFfcw1AmAdbg3vfj
 fx6078AL+WHjuIBve0cYYz3yTc0M5BnpMWs4xjC6v77EG8JnyBPejAhCUhJVuAhC6p
 m8pdARWbd5EFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 71757C54E94;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:08:46 +0100
Subject: [PATCH 68/86] drm/sprd: Direct include headers from drm_atomic_helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-68-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331667; l=1880;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=1/75aVFE/jNOCmrkv1r2SWbKkiotoeNjncdsaURVeaM=; =?utf-8?q?b=3DQnexHRtnbjI6?=
 =?utf-8?q?Y82E0C9x+VG/pIMgzJY4kirOgsbsAy5jFPmC13LsB625/nj/7vz0BmssVCt9oCQp?=
 1c4B2W3eAuKPkCPxlzVtHHVb0tegx3meXc4sJksv8id9T+5huZ2b
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Submission Endpoint for sam@ravnborg.org/20230107
 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Cc: Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

Direct include the headers that otherwise comes indirect from
drm_atomic_helper, because drm_atomic_helper will be reduced to
include only the minimal set of headers.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/sprd/sprd_dpu.c | 2 ++
 drivers/gpu/drm/sprd/sprd_drm.c | 1 +
 drivers/gpu/drm/sprd/sprd_dsi.c | 1 +
 3 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index b96fc6837b0d..db8b9e75f260 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -17,11 +17,13 @@
 #include <linux/workqueue.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
 
 #include "sprd_drm.h"
 #include "sprd_dpu.h"
diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
index be60c0d546a3..0563b4ba1fdd 100644
--- a/drivers/gpu/drm/sprd/sprd_drm.c
+++ b/drivers/gpu/drm/sprd/sprd_drm.c
@@ -14,6 +14,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
index ab0e5cce7adb..b00b09405795 100644
--- a/drivers/gpu/drm/sprd/sprd_dsi.c
+++ b/drivers/gpu/drm/sprd/sprd_dsi.c
@@ -13,6 +13,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 

-- 
2.34.1

