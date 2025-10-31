Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53276C25EBB
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 16:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD8F10E08A;
	Fri, 31 Oct 2025 15:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="IvCkZC7c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FD210E08A
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 15:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761926170;
 bh=uspcJjb0y0eaIpNX0UpD38PJOq7ghtMHl321zqBUCls=;
 h=From:To:Cc:Subject:Date:From;
 b=IvCkZC7ceXi3XG1Obk50/enPV7b/hjD1sI2M5fQG7SYFihxYlU5AdYCaeHwxCVruk
 zA5tU63gjpp+bNKBd5Nm6DDPu3V31L8rt2rtAftVnTIbXpzVmGUuxmRwLGwnrgi947
 OkSz3Y5i8pNGpIKlyZOwOl1wEkPSJkfci+daXIUnQlI4I5Q+oYO+36GBAV5/GxfYZ7
 bA98Ia4kcV+q5DzHMCm432Dq5+8CwY68JHY+eKBKJVrn1bbybQt5/JJWvdR9Nx7ym8
 hPIo4Rpqw6tYVGBoCWiGKceEdkYGPaQ+k5Pk2AXMCEkdhZuoP3ARYwzTYezpF4aom2
 G1BnAZZeo2zIQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id F225A17E0927;
 Fri, 31 Oct 2025 16:56:09 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] drm/rockchip: Include drm_print.h from rockchip_drm_vop2.c
Date: Fri, 31 Oct 2025 16:56:00 +0100
Message-ID: <20251031155600.831329-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.0
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

Apparently some rockchip source files were left behind.

Cc: Jani Nikula <jani.nikula@intel.com>
Fixes: f6e8dc9edf96 ("drm: include drm_print.h where needed")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 284c8a048034..e979d5e02ff4 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -29,6 +29,7 @@
 #include <drm/drm_flip_work.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
-- 
2.51.0

