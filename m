Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 298BBAD8D79
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 15:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D45510E9B3;
	Fri, 13 Jun 2025 13:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C6410E027;
 Fri, 13 Jun 2025 13:45:44 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [RFC PATCH 1/8] drm/xe: Add PSC region for PVC
Date: Fri, 13 Jun 2025 15:45:20 +0200
Message-ID: <20250613134520.2458175-11-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613134520.2458175-10-dev@lankhorst.se>
References: <20250613134520.2458175-10-dev@lankhorst.se>
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

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_nvm.c      | 1 +
 include/linux/intel_dg_nvm_aux.h | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
index 61b0a1531a539..0a703c2612548 100644
--- a/drivers/gpu/drm/xe/xe_nvm.c
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@ -31,6 +31,7 @@ static const struct intel_dg_nvm_region regions[INTEL_DG_NVM_REGIONS] = {
 	[9] = { .name = "PADDING", },
 	[11] = { .name = "OptionROM", },
 	[12] = { .name = "DAM", },
+	[13] = { .name = "PSC" },
 };
 
 static void xe_nvm_release_dev(struct device *dev)
diff --git a/include/linux/intel_dg_nvm_aux.h b/include/linux/intel_dg_nvm_aux.h
index 625d46a6b96e5..c51fe68d9a59d 100644
--- a/include/linux/intel_dg_nvm_aux.h
+++ b/include/linux/intel_dg_nvm_aux.h
@@ -11,7 +11,7 @@
 #include <linux/ioport.h>
 #include <linux/types.h>
 
-#define INTEL_DG_NVM_REGIONS 13
+#define INTEL_DG_NVM_REGIONS 14
 
 struct intel_dg_nvm_region {
 	const char *name;
-- 
2.45.2

