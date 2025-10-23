Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C730C03511
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 22:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C81B10E126;
	Thu, 23 Oct 2025 20:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Tbjyq1TP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f228.google.com (mail-il1-f228.google.com
 [209.85.166.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F36D10E126
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 20:04:59 +0000 (UTC)
Received: by mail-il1-f228.google.com with SMTP id
 e9e14a558f8ab-430cd27de3eso5957035ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 13:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761249898; x=1761854698;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/owpE2sPaF7oMJO9OlrmKv+bfEFb0Ue7x3FTysXdQ5g=;
 b=G2TYC7YJC5LSUzB12w/5+149hBsCWMpjTM+hCepjCVvBXSjX+fanDIm5KEsTiTda11
 0KqSvC5HgjLxfrHnk3kbmD/y46a7arvoBAOON/tjaS1VUaz60raR7AfaNubJJ8ZKkYIV
 eV8BVWDV1MxQ2SlCZZjk2tyWWZYdXaaU8oh4UyqKkWsTd+eC042jXuPx4RDWR7lpbLoT
 GIPsEqCoOZn5tmnawWY7xQsp1UpOLKYB6NPVmXGjnwFrhHjCNs0P2+VYtAtC8Usxias/
 FKAY62dfJ19EHUl2yycdChSsQaX328jpN/aKMs3r0ortcJvjR4yFVs7wfGD/P545Qmxx
 yX4w==
X-Gm-Message-State: AOJu0Yxhu2zFjwAdkebWHK1wWLTWsu2SDtGxsC8e0ZcFEiIj3WQb9flr
 8aUBVDg5htSANcWf6289t38A6yA8kwPyR5IHnFqUALsqMQ9w4Wjw/Iu/jBjAHTHS0L3W0nlDoPX
 +CU1VfX0ROk9fCJdAzfQtkv4qnN5BGILhtqIoquxVYlCrd+mRYCStuKCeWEfZ/AJjMhoNPPLTGx
 PnROiSP8C1rj1HD8a0HOKE9M8SX9h1ReN71/QWdXGiUfc5/V42TwXfs5/I30eZUaV6AXN4rt9tk
 zL3ETUSWXCOyTYSaKNH
X-Gm-Gg: ASbGncudS3/TEbN1MybXxD9nTbz6Wl+3qvr3Rh72xudMM36WY80lM5WmAuAhovN3gmc
 VfGm9jhR1vaIFlHn6bH8If1HasUKXhGOtMIre6of0lyEEq1oV8aYYY/5udneHaa7aVXjVpk87nY
 bajlYvWmMgUyVauoGDPpwo3Lqv+fUHpvoJR4GqIKNzvJLwiGOuq/FxVTBreeNvD/GCnpBzJZIG+
 ThVl9gQeVFUtfKNpX5dBlxAG0uUjrxLzqrCV0xt5Zj6H5WJ2lc4ksFvcZ9qsi61hDhu91J964Gw
 gBw01B/fUUVXbsQcCJYpa+0CJ8PmYse1s1oeePLADcSBKIepfEVlkOGhhiwHKgO+su0hwLJkjZt
 t7Xgm9Nv646HSWvRplzk3h6KCJ7LoJ47QJ8OjnFVVBJHmspLqzciwTOE=
X-Google-Smtp-Source: AGHT+IFyocryGjUgK1C1HcL8OQGGeDgvTBR6iiKz+Az/07wK7ZOIDrAyyM8HrUzpmy7bkH0dg1VljlFbd/DM
X-Received: by 2002:a05:6e02:1c0c:b0:430:ae99:e501 with SMTP id
 e9e14a558f8ab-430c527db5fmr337383325ab.16.1761249898384; 
 Thu, 23 Oct 2025 13:04:58 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 ([144.49.247.127]) by smtp-relay.gmail.com with ESMTPS id
 8926c6da1cb9f-5abb701de2esm223569173.23.2025.10.23.13.04.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Oct 2025 13:04:58 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8908a248048so341958285a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 13:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1761249897; x=1761854697;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/owpE2sPaF7oMJO9OlrmKv+bfEFb0Ue7x3FTysXdQ5g=;
 b=Tbjyq1TPgPI1ASgTzjwFkGE7wV5FdSxrqf5t43gPMxonfNXuWyMAC/42d5auYL1L+k
 odh7yEWthIGl4OXjd3/5sEM2OtEXdOkrusKVutsM1glo6OAkZifRu3iquQ4ccbxVn8y4
 ZBXPYDcqoKwZ/tO3nUbc2s8Ix1ge4TSHvpUYg=
X-Received: by 2002:a05:620a:44cb:b0:815:87ab:37e0 with SMTP id
 af79cd13be357-89070113963mr3202884585a.53.1761249897062; 
 Thu, 23 Oct 2025 13:04:57 -0700 (PDT)
X-Received: by 2002:a05:620a:44cb:b0:815:87ab:37e0 with SMTP id
 af79cd13be357-89070113963mr3202878685a.53.1761249896539; 
 Thu, 23 Oct 2025 13:04:56 -0700 (PDT)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-89c0e98051bsm223456485a.25.2025.10.23.13.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 13:04:56 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 maaz.mombasawala@broadcom.com, Ian Forbes <ian.forbes@broadcom.com>,
 Ryosuke Yasuoka <ryasuoka@redhat.com>
Subject: [PATCH] drm/vmwgfx: Add drm_panic support
Date: Thu, 23 Oct 2025 15:04:47 -0500
Message-ID: <20251023200447.206834-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
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

Sets up VRAM as the scanout buffer then switches to legacy mode.

Suggested-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  | 33 ++++++++++++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h  |  5 +++++
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |  2 ++
 3 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 54ea1b513950..4ff4ae041236 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -20,6 +20,7 @@
 #include <drm/drm_rect.h>
 #include <drm/drm_sysfs.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_panic.h>
 
 void vmw_du_init(struct vmw_display_unit *du)
 {
@@ -2022,3 +2023,35 @@ bool vmw_user_object_is_null(struct vmw_user_object *uo)
 {
 	return !uo->buffer && !uo->surface;
 }
+
+int
+vmw_get_scanout_buffer(struct drm_plane *plane, struct drm_scanout_buffer *sb)
+{
+	void  *vram;
+	struct vmw_private *vmw_priv = container_of(plane->dev, struct vmw_private, drm);
+
+	// Only call on the primary display
+	if (container_of(plane, struct vmw_display_unit, primary)->unit != 0)
+		return -EINVAL;
+
+	vram = memremap(vmw_priv->vram_start, vmw_priv->vram_size,
+			MEMREMAP_WB | MEMREMAP_DEC);
+	if (!vram)
+		return -ENOMEM;
+
+	sb->map[0].vaddr = vram;
+	sb->format = drm_format_info(DRM_FORMAT_RGB565);
+	sb->width  = vmw_priv->initial_width;
+	sb->height = vmw_priv->initial_height;
+	sb->pitch[0] = sb->width * 2;
+	return 0;
+}
+
+void vmw_panic_flush(struct drm_plane *plane)
+{
+	struct vmw_private *vmw_priv = container_of(plane->dev, struct vmw_private, drm);
+
+	vmw_kms_write_svga(vmw_priv,
+			   vmw_priv->initial_width, vmw_priv->initial_height,
+			   vmw_priv->initial_width * 2, 16, 16);
+}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index 445471fe9be6..8e37561cd527 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -500,6 +500,11 @@ int vmw_kms_stdu_readback(struct vmw_private *dev_priv,
 
 int vmw_du_helper_plane_update(struct vmw_du_update_plane *update);
 
+struct drm_scanout_buffer;
+
+int vmw_get_scanout_buffer(struct drm_plane *pl, struct drm_scanout_buffer *sb);
+void vmw_panic_flush(struct drm_plane *plane);
+
 /**
  * vmw_du_translate_to_crtc - Translate a rect from framebuffer to crtc
  * @state: Plane state.
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 20aab725e53a..37cb742ba1d9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -1506,6 +1506,8 @@ drm_plane_helper_funcs vmw_stdu_primary_plane_helper_funcs = {
 	.atomic_update = vmw_stdu_primary_plane_atomic_update,
 	.prepare_fb = vmw_stdu_primary_plane_prepare_fb,
 	.cleanup_fb = vmw_stdu_primary_plane_cleanup_fb,
+	.get_scanout_buffer = vmw_get_scanout_buffer,
+	.panic_flush = vmw_panic_flush,
 };
 
 static const struct drm_crtc_helper_funcs vmw_stdu_crtc_helper_funcs = {
-- 
2.51.0

