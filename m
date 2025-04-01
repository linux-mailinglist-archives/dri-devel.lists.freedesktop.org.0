Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37893A78205
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 20:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27BC210E133;
	Tue,  1 Apr 2025 18:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VGPufHGV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FF710E133
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 18:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743531834;
 bh=TXycUMTIR/u+vvGBFewoZeIZ6GQCPp3CVe6g3Rw4wZY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VGPufHGV6Z6JWaLtIlvbuNN3OK8YPkVvq6tblo4vy4/26YM3rIGRJP4apN2ApPW7V
 AgXOyD2XgsronGlbEqT+u46tced9v65ymvDXa71z6vR66NU9XqLlvSi+HEDLgODVsB
 lKnK9wZ/kjnh0C0vDTCtpl6lo2FmswJhzNok+fP+kZouPcgqLzxVwm2gYazaVL6Y13
 xa2ziziy7FhXWOw/K/Km7JKtLG6QIfaj5IHmhiGo+FEHFBq/mqcNfDEXqdaaf8GjRD
 2gKkHLhujbZu0nlnsZz02zwbBM3XWsAolU9RY6XGV0xIygTVb3Fwpz9Y8zEHWHW4gU
 pIjPb0W0l8YtA==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 03E0917E0657;
 Tue,  1 Apr 2025 20:23:53 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v2 1/5] drm/panthor: Fix GPU_COHERENCY_ACE[_LITE] definitions
Date: Tue,  1 Apr 2025 20:23:44 +0200
Message-ID: <20250401182348.252422-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401182348.252422-1-boris.brezillon@collabora.com>
References: <20250401182348.252422-1-boris.brezillon@collabora.com>
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

GPU_COHERENCY_ACE and GPU_COHERENCY_ACE_LITE definitions have been
swapped.

Changes in v2:
- New patch

Reported-by: Liviu Dudau <liviu.dudau@arm.com>
Fixes: 546b366600ef ("drm/panthor: Add GPU register definitions")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_regs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index b7b3b3add166..a7a323dc5cf9 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -133,8 +133,8 @@
 #define GPU_COHERENCY_PROT_BIT(name)			BIT(GPU_COHERENCY_  ## name)
 
 #define GPU_COHERENCY_PROTOCOL				0x304
-#define   GPU_COHERENCY_ACE				0
-#define   GPU_COHERENCY_ACE_LITE			1
+#define   GPU_COHERENCY_ACE_LITE			0
+#define   GPU_COHERENCY_ACE				1
 #define   GPU_COHERENCY_NONE				31
 
 #define MCU_CONTROL					0x700
-- 
2.49.0

