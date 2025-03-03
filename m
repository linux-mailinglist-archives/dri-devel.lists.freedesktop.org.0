Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE196A4C4B9
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 16:19:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8F710E46D;
	Mon,  3 Mar 2025 15:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ashley.smith@collabora.com header.b="HYgyjVIf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1E610E46C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 15:19:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1741015137; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kx2/9tpcRNxJv0M/M4WznHk0YsM7Xefav7qwpVYMD2mgfiqoUc2sktJF+puQ7priwZOrXaLpGMLG3rm8N1SSuoVl5pUiUgoVljvEsBiawJY6+ngGay5BvzHtBGZ087GtLw3uZDgVbjrariz3OPkzHyw7WKPjbpVz5Q4t1riIRNo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1741015137;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=C/iTLLU7L7PZsGrUCbrk0/fCDtfiKSdFLTKlNGPrcDU=; 
 b=Uon+SGgbyvYkjK4YtrKwyiMcSoLjd9RbernR8GL96sze9DmSX9StgrdZ5hc7yXNHydJqnYs/qr4lRJbdbQtILARgWHU2YUi8yppL6ER3snFsmLqwSBCIxv8bYXKE4pHeSgxm8GBds+Aaob1DJcq3Pyn1dL9htoV58cmSDQEJxHg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ashley.smith@collabora.com;
 dmarc=pass header.from=<ashley.smith@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741015137; 
 s=zohomail; d=collabora.com; i=ashley.smith@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=C/iTLLU7L7PZsGrUCbrk0/fCDtfiKSdFLTKlNGPrcDU=;
 b=HYgyjVIfrTaphGehpAzQSsCEahgJefY4+RnaS84lMkrOlwuV78IU4jyPsxlJR4Bu
 y5fLNyfhdWJ3rKxgkl72wScWGxJtWd8o4/yJorgV/0T5bJ5lUZL3JC1QIheyDZQuAHe
 JnI6ucD6q6xvct/dXHwqY5He6+FRsz60kHp/j/ko=
Received: by mx.zohomail.com with SMTPS id 1741015134703693.1164829293207;
 Mon, 3 Mar 2025 07:18:54 -0800 (PST)
From: Ashley Smith <ashley.smith@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, Ashley Smith <ashley.smith@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panthor: Update CS_STATUS_ defines to correct values
Date: Mon,  3 Mar 2025 15:18:37 +0000
Message-ID: <20250303151840.3669656-1-ashley.smith@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Values for SC_STATUS_BLOCKED_REASON_ are documented at https://arm.pages.collabora.com/mali-docs/g610-odin-csf/register/CS_KERNEL_OUTPUT_BLOCK.htm#rp_CS_KERNEL_OUTPUT_BLOCK/CS_STATUS_BLOCKED_REASON

This change updates the defines to the correct values.

Signed-off-by: Ashley Smith <ashley.smith@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_fw.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
index 22448abde992..4d3c8b585dcb 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.h
+++ b/drivers/gpu/drm/panthor/panthor_fw.h
@@ -102,9 +102,9 @@ struct panthor_fw_cs_output_iface {
 #define CS_STATUS_BLOCKED_REASON_SB_WAIT	1
 #define CS_STATUS_BLOCKED_REASON_PROGRESS_WAIT	2
 #define CS_STATUS_BLOCKED_REASON_SYNC_WAIT	3
-#define CS_STATUS_BLOCKED_REASON_DEFERRED	5
-#define CS_STATUS_BLOCKED_REASON_RES		6
-#define CS_STATUS_BLOCKED_REASON_FLUSH		7
+#define CS_STATUS_BLOCKED_REASON_DEFERRED	4
+#define CS_STATUS_BLOCKED_REASON_RES		5
+#define CS_STATUS_BLOCKED_REASON_FLUSH		6
 #define CS_STATUS_BLOCKED_REASON_MASK		GENMASK(3, 0)
 	u32 status_blocked_reason;
 	u32 status_wait_sync_value_hi;

base-commit: 16e57a72780931c3c70dbc928aeee4a0518075de
-- 
2.43.0

