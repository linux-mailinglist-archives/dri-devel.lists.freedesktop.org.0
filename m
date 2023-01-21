Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC466768C3
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7776F10E3EE;
	Sat, 21 Jan 2023 20:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E9A10E3D0
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9E14060B78;
 Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39399C433D2;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331671;
 bh=XzcRBoIce0xv7FMYtvTYDt/pWUbAxedsOUyxwYrX5xY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=TMBQYruJQJt0LRpUkeDIkDwu9MPOYinZLIa7aVGhYMUqFI8lyFs5ktqFind41c6pV
 xCNx7uHU4xI4pYjB247kIuRNQyHd+YC9187iLn/8j5wR/LmKn1lo5hL9vFII+Hn9po
 wv4s3UA2dgVOYaah6KoOc5orj7Lyl3slbi/QHVDI7Ulig7NZ/OfA+mFdHLd1BjQopD
 qZkNk+Wpe2oAuKrEZFcFdUcw4Mw2tI7oUIJi0aGzdY8BICiPqvyM29Zo/1cNdP7fPN
 jzI1D/Db8cyrrpKgKy1swjzDc0sZnpgDYyvdOiaQ0/RX+oFWykYUYAnjP80aphB8Lh
 Va1u0yKi2gg3g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 2AABAC54E94;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:07:55 +0100
Subject: [PATCH 17/86] drm/xlnx: Direct include headers from drm_atomic_helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-17-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331666; l=1510;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=6RWIxs7MOac8fr/o9P82yTIVCvxQkopUQeFoO30LAmc=; =?utf-8?q?b=3D9Mn0UB3x58Vk?=
 =?utf-8?q?5IVGLfTuS/GvbGqqGnMzEHAb3OxcUiOqSOONYe4aARItwBbcJmUeuWCd+qPcaXOo?=
 DJAkf2HiC7w+fukHobr2D+YPZqb6PzNnVm64bPRy6BG8VWrK32/1
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
 drivers/gpu/drm/xlnx/zynqmp_dp.c  | 1 +
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 0a7b466446fb..9e8d6456ee13 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -11,6 +11,7 @@
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 776ef5480206..697a97d4f576 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -11,6 +11,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
@@ -26,6 +27,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_mode_config.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>

-- 
2.34.1

