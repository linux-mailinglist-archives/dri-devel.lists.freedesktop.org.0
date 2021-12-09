Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D08E46EE2C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75F910E252;
	Thu,  9 Dec 2021 16:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF4410E116
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 06:28:41 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id EB73729F879;
 Thu,  9 Dec 2021 02:49:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1639018177; bh=YXG5BhkLwROr20dr615B2sjJ6G1wLcQj39XHO/upPFk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LOyTFF/9I4agwt3qSwtKYPJlT9O5ZITR9/Lb8Y92GHZpQnjd0XSZvmxDKA1cOAdE2
 HvtTgprxN9jYEOR8EnOUDUuGRkML6QmIYn2hWV0ZaFTFR2HsFUYHasF/sbMeO1fFiM
 riQTtpldiHyrQGvET2jKTbKR80f7zw6A8DFtxfyJzzqIc3JXXMcTmncRTp1Jm7YJxh
 YpUKFQzFehYMHqhJRyHK5k0+SozGWYBajOk8NeksvaskvfFuFnZ5keMNvtJIT7F/4d
 sOHKF6A5wU806UMg7SUULQc/bDEP2S+dKPnMnROOgovOKXZhPw6lkcx4Yh4can3qQp
 +M4YxH3Zq1ZhQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/vmwgfx: Bump the minor version
Date: Wed,  8 Dec 2021 21:49:24 -0500
Message-Id: <20211209024924.3298137-1-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206172620.3139754-13-zack@kde.org>
References: <20211206172620.3139754-13-zack@kde.org>
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

v2: Old userspace doesn't like 3.x.x and we'd like to keep it working,
so lets just bump the minor version until we have no choice.

With GEM, GL4.3, stats and removal of a lot of old code it's time to bump
the minor version of the driver.

Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 1760ba1b0d4a..4ec2b99351cf 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -54,9 +54,9 @@
 
 
 #define VMWGFX_DRIVER_NAME "vmwgfx"
-#define VMWGFX_DRIVER_DATE "20210722"
+#define VMWGFX_DRIVER_DATE "20211206"
 #define VMWGFX_DRIVER_MAJOR 2
-#define VMWGFX_DRIVER_MINOR 19
+#define VMWGFX_DRIVER_MINOR 20
 #define VMWGFX_DRIVER_PATCHLEVEL 0
 #define VMWGFX_FIFO_STATIC_SIZE (1024*1024)
 #define VMWGFX_MAX_RELOCATIONS 2048
-- 
2.32.0

