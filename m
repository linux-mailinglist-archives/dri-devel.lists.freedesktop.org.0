Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90DFAD8D7F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 15:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8AD10E9C4;
	Fri, 13 Jun 2025 13:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2F810E9B1;
 Fri, 13 Jun 2025 13:45:47 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [RFC PATCH 7/8] drm/xe: Remove unused XE_DEFAULT_GTT_SIZE_MB
 definition.
Date: Fri, 13 Jun 2025 15:45:26 +0200
Message-ID: <20250613134520.2458175-17-dev@lankhorst.se>
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

The #define went unused since mid 2023, remove it.
Relevant commit: 1a545ed74b33 ("drm/xe: fix pvc unload issue")

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_bo.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 02ada1fb8a235..ecb5fe3b1c1dc 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -13,8 +13,6 @@
 #include "xe_vm_types.h"
 #include "xe_vm.h"
 
-#define XE_DEFAULT_GTT_SIZE_MB          3072ULL /* 3GB by default */
-
 #define XE_BO_FLAG_USER		BIT(0)
 /* The bits below need to be contiguous, or things break */
 #define XE_BO_FLAG_SYSTEM		BIT(1)
-- 
2.45.2

