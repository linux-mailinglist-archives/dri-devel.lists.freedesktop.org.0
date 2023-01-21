Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA686768BC
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C001210E3E3;
	Sat, 21 Jan 2023 20:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E6110E413
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6298AB8091D;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EAFE6C433D2;
 Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331673;
 bh=OghXvco2RD+KCg0a+4KPIYtaEuscXFpO1g+TLI7oXxs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=oDOAsf8ZNbQvyEtNelCYQbhtJJg4ecyFKpNfSLC46wW6WYsM7aZl4F+kOvf6ySfn2
 y8YjStiOToDIDGdcpyRR0OFsqDyYa1+gRHTleq9cV4NNLlsSA+izss4DwxAAsJzxcG
 jDw8j9PnDIG0G3gHdh6ZX+RcWwJtKJo89zQcF+9w4oCxUUPqaZ7JHY2dK3DdIZLowF
 HzwdUlCK9B2/IKvlBzNXrplHz7Wo8I8PljaK5B/5Ad5tFrJoahkGoiHd7OpHuHP+m+
 YtCaPMx9XE8poqkmi/vEu0bkLpc5J+p8JqWW+yjvXhEhq9hjon+krveliScWvrxy4n
 1a100+T9J1vhQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id DD88AC38A23;
 Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:08:33 +0100
Subject: [PATCH 55/86] drm/logicvc: Direct include headers from
 drm_atomic_helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-55-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331667; l=2507;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=w9RLVltZWMyPuI0kcn93WYnbA6TZ5d8CgVI+/VyIlrw=; =?utf-8?q?b=3D8vJ/jlL4HEkl?=
 =?utf-8?q?B9CpojIx+Kf+qEI4mqIRf4+WHcwL3/FCakhl4S1jpku8qoMSbEGYsJywjQGulas2?=
 5dTDFNN0BJtHxq/2Z6pauWCB2ACR90tJhWWzwlPPd4cnCm7G38vh
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
 drivers/gpu/drm/logicvc/logicvc_crtc.c      | 2 ++
 drivers/gpu/drm/logicvc/logicvc_crtc.h      | 2 ++
 drivers/gpu/drm/logicvc/logicvc_interface.c | 1 +
 drivers/gpu/drm/logicvc/logicvc_layer.c     | 2 ++
 4 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/logicvc/logicvc_crtc.c b/drivers/gpu/drm/logicvc/logicvc_crtc.c
index 43a675d03808..83b882b28be4 100644
--- a/drivers/gpu/drm/logicvc/logicvc_crtc.c
+++ b/drivers/gpu/drm/logicvc/logicvc_crtc.c
@@ -10,9 +10,11 @@
 #include <linux/workqueue.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/logicvc/logicvc_crtc.h b/drivers/gpu/drm/logicvc/logicvc_crtc.h
index b122901f2936..1134dd2519ab 100644
--- a/drivers/gpu/drm/logicvc/logicvc_crtc.h
+++ b/drivers/gpu/drm/logicvc/logicvc_crtc.h
@@ -7,6 +7,8 @@
 #ifndef _LOGICVC_CRTC_H_
 #define _LOGICVC_CRTC_H_
 
+#include <drm/drm_crtc.h>
+
 struct drm_pending_vblank_event;
 struct logicvc_drm;
 
diff --git a/drivers/gpu/drm/logicvc/logicvc_interface.c b/drivers/gpu/drm/logicvc/logicvc_interface.c
index 689049d395c0..a4f01bd3aec3 100644
--- a/drivers/gpu/drm/logicvc/logicvc_interface.c
+++ b/drivers/gpu/drm/logicvc/logicvc_interface.c
@@ -7,6 +7,7 @@
 #include <linux/types.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_drv.h>
diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/logicvc/logicvc_layer.c
index 464000aea765..8f6b292b8bf7 100644
--- a/drivers/gpu/drm/logicvc/logicvc_layer.c
+++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
@@ -9,10 +9,12 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_print.h>
 

-- 
2.34.1

