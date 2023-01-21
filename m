Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 534A86768D5
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA0D10E401;
	Sat, 21 Jan 2023 20:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC1110E3D8
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2994760BBC;
 Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F17F9C433D2;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331674;
 bh=CPGr3VRhQbbetsXaPje1tpYK6Lvk3tVV0mHH1th56Mg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=sEehNSNXXxo7oGak9TexEJT6TQTcG1ZnXbuD7cp5N9IfjqGgtRzuQulyUBStuVCrL
 BjKrw8cJ1c92xSdtLW2pC2MNd11u/pOOBEt/FfY1JlteAczHj0r/T7+YzvLABsKlpB
 4oWIEJIrAmZv4/WO7PHeEFnGFjJasn6HaYWFYIYatti/FAapYGVyDODBF6Tntqw8eb
 SIAXWUnbbLgdphqtQjUilEfLBnQr/VZ0MINBEoLCSfgrpzoz19nN9ZQxvfvAniJC5W
 UohtxuZYBbMEocrN3g+KcoBirg+/2YJMiqmM4CFxaF1z4nQ5SSdstv/glk3rtsygls
 ZTge+VhSum8mg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E2F8FC54EAA;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:08:58 +0100
Subject: [PATCH 80/86] drm/virtio: Direct include headers from
 drm_atomic_helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-80-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331667; l=1510;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=pMd8haXpuQzhdhfsb5QIvZj/rNkq3BMQdrHRZ82WU1U=; =?utf-8?q?b=3DjAR8vawYdNsH?=
 =?utf-8?q?5SgEHnDYd264P3NYSSGoIG/eHrfd9SsNsC2rXjul7ghnuIbeBf2TignC+Jss1AQg?=
 nHMQdJnPBRk2Hps/8OlwhjXZxmrwq6HT29OHXqi4PHxSUJ8f2Muk
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
 drivers/gpu/drm/virtio/virtgpu_display.c | 3 +++
 drivers/gpu/drm/virtio/virtgpu_plane.c   | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 9ea7611a9e0f..712c98535f4d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -26,10 +26,13 @@
  */
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_modeset_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 4c09e313bebc..d0fc333f6b3f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -24,8 +24,10 @@
  */
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_modeset_helper_vtables.h>
 
 #include "virtgpu_drv.h"
 

-- 
2.34.1

