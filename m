Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B876768BE
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0837A10E3E5;
	Sat, 21 Jan 2023 20:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A2010E3E8
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 41AB660B9C;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04F31C4339E;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331673;
 bh=t32CyTLyYAHHp/WhBsr1oaJnAsXwT5FCNnI8IWJSYXI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=axiN+JCpww32KHHJdJAbODPsm/CsNjgBc2LzJeVYZOEBA8ALT7A3CE/F9XFcd2//z
 kCpCxkPZbDIPJg4+U90MCqDe3B8L1iDoZlA3H8j2n2EDfvIxNtmuwwCbAj2ND7/bYz
 E+n9c8z1oOCMH3TL5qeZBC7HeSOcCH88FA1NM3YBLPZTYDP53+ca0H3YW+rhcVUTVZ
 qmXv5Q6TtOLJdOqDKuoHy3RGJtHionHdmO4BKG9LngJDLvcShGi6vFv7WzcUPEm3X5
 5WO1ifv/Mu0eLlhODeU9v/TSQhWOMmC4P6zOuo6yz1HhUzHNg1vuKVL4P8roM7cyJV
 Si3+v1PurE5ew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E9A46C54E94;
 Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:08:34 +0100
Subject: [PATCH 56/86] drm/mcde: Direct include headers from drm_atomic_helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-56-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331667; l=785;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=je9pzCbUqVPiseX2WuXbAWlb6PIctK5DkhugPRIXGO0=; =?utf-8?q?b=3Dbjv/0YuiWuoo?=
 =?utf-8?q?nOwQ98UWrRTSHoDqzJGVzi/RcK3akVNfnagG83qZ0LRyeELOuZ/PWPcvsyeUPwyN?=
 9rTs+IMfAHkvW6jVJ+5v8YXLZ5IqKmbFpXdMjrRsdxiaCX3l6mpn
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
 drivers/gpu/drm/mcde/mcde_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 4aedb050d2a5..457b80e1c75c 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -74,6 +74,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_panel.h>

-- 
2.34.1

