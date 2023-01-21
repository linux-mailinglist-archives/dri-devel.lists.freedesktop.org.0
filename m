Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E906768F2
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8AE110E41B;
	Sat, 21 Jan 2023 20:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2DB10E411
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 64A6BB80922;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E41B1C433EF;
 Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331672;
 bh=zSjaNeORlqRuFFjT8hWf4pftcXm6X4VVQDaV+yLs2P0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=HEyMEcGqN8pkxQycMrUgTKSyj+HWiJgElsO25ADCyAVlaTYvBzJ4VZFaEQej4o9uI
 V2UXphTF76kXWR/hs1me0NWk3AvccwWzXf0trLkrpqlWwcal6VrgfYEgGyTVTgU8kO
 VqoKqYcxfK5NjU1FtRw/F1Yq7xFw6S80PIF0DNtEgDHMqg2sQGW4rDd+ui1lK2zyUF
 DSdtVGOwZNlb7SbysKsrBtFGphCmhS+gkj37ui6TlF4a02axG8nmAiKiYhDDePm+Sc
 xX1shich5Wi3B652He8sUnzqz1gWzh8RHiID9x4328f2ugMOOYsUVzhWIbGEwpBoNj
 N5ggQUsywsCXA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D4971C54EB4;
 Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:08:32 +0100
Subject: [PATCH 54/86] drm/kmb: Direct include headers from drm_atomic_helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-54-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331667; l=1798;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=eSsyOKZ6+p7JiXIU8GHkQMxYDhY+FTh/eVSeR8TwAEY=; =?utf-8?q?b=3DSXdQTupU3WJj?=
 =?utf-8?q?BqoEq9OJXAtWDIJDTrrqBxYZfDTdEgFLGUJJ8+2Jw/dvact7MIp+5w7BsQOQPzk5?=
 41tP7EVvCoObj3ZgBF6CFZkLcfSoUjkOykrCLkw5COAUBZJ0i6av
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
 drivers/gpu/drm/kmb/kmb_crtc.c  | 1 +
 drivers/gpu/drm/kmb/kmb_drv.h   | 1 +
 drivers/gpu/drm/kmb/kmb_plane.c | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
index 647872f65bff..b1b51b923928 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index bf085e95b28f..846164236f9c 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -7,6 +7,7 @@
 #define __KMB_DRV_H__
 
 #include <drm/drm_device.h>
+#include <drm/drm_crtc.h>
 
 #include "kmb_plane.h"
 #include "kmb_regs.h"
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 9e0562aa2bcb..362b8b1ea54a 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_fb_dma_helper.h>
@@ -12,6 +13,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_modeset_helper_vtables.h>
 
 #include "kmb_drv.h"
 #include "kmb_plane.h"

-- 
2.34.1

