Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F79CC7CF8
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 14:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1162610E116;
	Wed, 17 Dec 2025 13:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NnKfhuFR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1834510E116
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 13:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765977854;
 bh=8/nVhpbxaSmBbI4zfSz52qF1SD68HO4P2I+t+AFEmjQ=;
 h=From:To:Cc:Subject:Date:From;
 b=NnKfhuFRa9obuRSenDN3g2W77Pg5ZkATdctasB9Zp1mliHW8jZNkgcyDVJ9qC6qZH
 XJYT+fET9lnt5zdt8qCSuq3cfVzMosRn6kCUwSwOCj4+uIJCvMoj/kFRcOufBEHeDL
 +ocK5DdueIGl0swHjikM4h61Py8nSS7omP6mVm8FXL9jlOX8IQTllNL8sKeWt5FRHW
 9EfvL7vTzAJ3ZJhpDNwKGSGWT/gJq+AS+NPYB+T5ImDboe3TulgNq4BXICP4c5rhNk
 YWH39xoXDxEHZhLnpGJP/BLtzNHeI7/wS44KeZ9OvV/QZ70pwdG8Lgd1cYX19Rrxab
 foIGHIFsZ1FNA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 26B3617E0458;
 Wed, 17 Dec 2025 14:24:14 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, kernel@collabora.com
Subject: [PATCH] drm/panthor: Fix kerneldoc in uAPI header
Date: Wed, 17 Dec 2025 14:24:03 +0100
Message-ID: <20251217132403.3996014-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.52.0
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

Fix a typo in a kerneldoc header.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/dri-devel/20251216120049.3ed7e06e@canb.auug.org.au/
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 include/uapi/drm/panthor_drm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index e238c6264fa1..b401ac585d6a 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -350,7 +350,7 @@ struct drm_panthor_gpu_info {
 	__u32 as_present;
 
 	/**
-	 * @select_coherency: Coherency selected for this device.
+	 * @selected_coherency: Coherency selected for this device.
 	 *
 	 * One of drm_panthor_gpu_coherency.
 	 */
-- 
2.52.0

