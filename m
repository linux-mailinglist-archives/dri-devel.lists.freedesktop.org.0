Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CC76E9FC9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 01:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5F610ED3A;
	Thu, 20 Apr 2023 23:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FEF10ED35
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 23:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zeoICPT/fFUzQZVSkY+2g5dMGykQb/bybRh/r8P4y9o=; b=foegNT5+jRpUlQ1hKt2VtufUGv
 kcRUGX99QH/69nSmQb5BWpHB1tFu3XRntHrWuAfz/ZJbHolfA70ACYePLS2Kh3gN2FctlUA6MWTN2
 bfu6rVyiziRqRd8O33iEefsEjXzuqQQChSeKUUv78ooJl2Iw+Wk7EXbjH9i5jPmxfO85jLDzFWsra
 /80/U/0Te1EXaPpdrvuQp3ixWH0Ddpd0mImz3gmBwKHzA4IbeU30/WO13clk8iJJZc+oHvG/Xp1qO
 9pJzMmtNgTXNRkHYJc+TVbxeEKC86P5FyIysuDaCKDI3jDS8mXD4D2S6QA605E7XVtW8RF5zFIyYO
 tHBuEeAg==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ppdc0-007Qqg-4X; Fri, 21 Apr 2023 01:22:48 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH v2 2/2] drm/vkms: drop full alpha blending TODO
Date: Thu, 20 Apr 2023 20:22:28 -0300
Message-Id: <20230420232228.273340-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420232228.273340-1-mcanal@igalia.com>
References: <20230420232228.273340-1-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that VKMS supports full alpha blending on all planes, drop the
"ARGB format on primary plane" and "Full alpha blending on all planes"
tasks from the TODO list.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---

v1 -> v2: https://lore.kernel.org/dri-devel/20230414190913.106633-1-mcanal@igalia.com/T/

* Add Melissa's Reviewed-by

---
 Documentation/gpu/vkms.rst | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 49db221c0f52..0f599c897614 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -118,13 +118,8 @@ Add Plane Features
 
 There's lots of plane features we could add support for:
 
-- ARGB format on primary plane: blend the primary plane into background with
-  translucent alpha.
-
 - Add background color KMS property[Good to get started].
 
-- Full alpha blending on all planes.
-
 - Rotation, scaling.
 
 - Additional buffer formats, especially YUV formats for video like NV12.
-- 
2.40.0

