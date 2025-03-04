Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A6BA4ECE2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 20:12:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFCB10E052;
	Tue,  4 Mar 2025 19:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b90XRDZJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D2410E052
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 19:12:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5B9255C62C7;
 Tue,  4 Mar 2025 19:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D18B0C4CEE5;
 Tue,  4 Mar 2025 19:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741115540;
 bh=Ci7nz+Ro7inrwbsSnXblrTQOXIqs+O9CwkgBJ92korc=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=b90XRDZJJOfqR8ElYaRTuEi8PYVAMfwLviWV6R9nk2qjXZ0jYTAS73KD3BKYVXfsK
 K3N8qDa9niK2qD5acbIOcPJ+cn25BmWCvBa86q61r2r2dZQmSV9LWBghTIQLq27a0S
 BDb75TiiCLUG987Zya80TSanQ+rWdwvYqnGUOAstdY8h4/QJ5PeJOPwdOg+6HeTCvN
 wJGysyUqDumeaU2pY974ioOzXKt7JrngPI3nz4UcGICUIaEOg3g9GdBZNkrIiDv78h
 JBjGu/Ly+FafzQMZh2zCMlm0hEhQ++MfHhOHF7bigyNyj/B8zxSogsIb4fDZc7v3Q5
 Pd9V4BzQDWi0Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id B8E2AC021B8;
 Tue,  4 Mar 2025 19:12:20 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Tue, 04 Mar 2025 20:12:14 +0100
Subject: [PATCH] drm: Select DRM_KMS_HELPER from DRM_DEBUG_DP_MST_TOPOLOGY_REFS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-drm_debug_dp_mst_topo_kconfig-v1-1-e16fd152f258@jannau.net>
X-B4-Tracking: v=1; b=H4sIAI1Qx2cC/x3MQQqDMBAAwK/InhvIplqwXylliWZNFzEJiRZB/
 LvB41zmgMJZuMC7OSDzX4rEUIGPBsafDZ6VuGow2nT6qVvl8kKOh82TS7SUldaYIs1jDJN4ZRF
 Nr9vBvhChHinzJPv9f77neQHbKI4hbwAAAA==
X-Change-ID: 20250304-drm_debug_dp_mst_topo_kconfig-a112904ba611
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2182; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=CwxEpxjxqdhwbX3K+IrTZdcGwFWOTIRbUncA5vUkg+8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhvTjAZNFwncV/wzyebfhsJvo05Cm1F29cU5SRzkvqPMtC
 HKMUGDvKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMJHqXQx/RblCHy68xXKhLsYv
 Tm7D4XJWr3XbKn8UcM/6YMh7yfuPACPD1kdeDy+VKrpv/qm9QSUyjl/koIfU851KOw/P2LS6wMe
 HEwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
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
Reply-To: j@jannau.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Janne Grunau <j@jannau.net>

Using "depends on" and "select" for the same Kconfig symbol is known to
cause circular dependencies (cmp. "Kconfig recursive dependency
limitations" in Documentation/kbuild/kconfig-language.rst.
DRM drivers are selecting drm helpers so do the same for
DRM_DEBUG_DP_MST_TOPOLOGY_REFS.
Fixes following circular dependency reported on x86 for the downstream
Asahi Linux tree:

error: recursive dependency detected!
  symbol DRM_KMS_HELPER is selected by DRM_GEM_SHMEM_HELPER
  symbol DRM_GEM_SHMEM_HELPER is selected by RUST_DRM_GEM_SHMEM_HELPER
  symbol RUST_DRM_GEM_SHMEM_HELPER is selected by DRM_ASAHI
  symbol DRM_ASAHI depends on RUST
  symbol RUST depends on CALL_PADDING
  symbol CALL_PADDING depends on OBJTOOL
  symbol OBJTOOL is selected by STACK_VALIDATION
  symbol STACK_VALIDATION depends on UNWINDER_FRAME_POINTER
  symbol UNWINDER_FRAME_POINTER is part of choice block at arch/x86/Kconfig.debug:224
  symbol <choice> unknown is visible depending on UNWINDER_GUESS
  symbol UNWINDER_GUESS prompt is visible depending on STACKDEPOT
  symbol STACKDEPOT is selected by DRM_DEBUG_DP_MST_TOPOLOGY_REFS
  symbol DRM_DEBUG_DP_MST_TOPOLOGY_REFS depends on DRM_KMS_HELPER

Fixes: 12a280c72868 ("drm/dp_mst: Add topology ref history tracking for debugging")
Cc: stable@vger.kernel.org
Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index fbef3f471bd0e5101699cf576542f7350bea3982..bd228dc77e99b4356b09de02d9001237eb2423e2 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -188,7 +188,7 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
         bool "Enable refcount backtrace history in the DP MST helpers"
 	depends on STACKTRACE_SUPPORT
         select STACKDEPOT
-        depends on DRM_KMS_HELPER
+        select DRM_KMS_HELPER
         depends on DEBUG_KERNEL
         depends on EXPERT
         help

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250304-drm_debug_dp_mst_topo_kconfig-a112904ba611

Best regards,
-- 
Janne Grunau <j@jannau.net>


