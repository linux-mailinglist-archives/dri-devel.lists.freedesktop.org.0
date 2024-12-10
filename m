Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F749EBA5C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 20:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4FF10E2D6;
	Tue, 10 Dec 2024 19:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="LQBKXxKj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4618902A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 19:55:44 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-6d884e8341bso43178926d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 11:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1733860543; x=1734465343;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ql2UGxSgAnhVvnyh6TJH/A5Xf2PLb4hve2W4JGlhoW8=;
 b=LQBKXxKjAxyWEX6hB3KDoEXQlVQKft5CjuJnHwi+ZQvCNkMJKW4LW4fuqaTwgttxWh
 eBRPmXupVHuq9F/Cu2qcJWWYrNhJSxYuvK6GMbnLNghS6r3duAcsCXMmqqaK+jqB3b/O
 ovMK8qnHMr52yItCwF9tobMKpxg/zv/yD2Eu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733860543; x=1734465343;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ql2UGxSgAnhVvnyh6TJH/A5Xf2PLb4hve2W4JGlhoW8=;
 b=NTiQgR+AvPERiLdVxOO/D4KSOLXk1qePUQJRUwdAsmKPe8va6yqTwM7MqtSXD5y9Hl
 ILMxHBJDHucySE4kzYp6UUIVClznaKs/wnYtmBSHrUAJf7Nd7GpzimtBqjOvJMa124Rp
 DsYCuPDEXNa41M8CS/uRTk1BWTl2vdG2rCYzjkWqR+dwqICx3rQKRLG1t3OZx/JoR6WA
 e9wNyX7adyaXRemw4Nk3IWm7aG1DRXp3/OKHAFequAqSOVWLCQTL1lIKEQnzVLuhMhh4
 TZVnRcE3E0BgzixICyZQZbszeEZrIs+OqUt4QJSbu8sk1/kNkV7+YM/GXCc7DxcQjckC
 aUKA==
X-Gm-Message-State: AOJu0YxYna9RJnSjJwP0MOd+9Xk1H5xQrji05Tn9zoThuKbj5E/AHGgo
 GFqfn5mYbLYiUMTwEhwVmjiIBdItkAoPGrKFLGys00vpqtOgnikXEMM0+YBRr47Oh3CgN66gXwm
 GBQa3gl1AjQhOJA59plgbtFQfNrWw901JX60GhHJbarbo5R36BEy4qjPgOv5V50aiAW4ALZ+7/6
 XPEqNG5jsT28Lu6d/rkTKAwzPaT9ZD8eHFnc7pf7orscUTB63p0/5D
X-Gm-Gg: ASbGncsKOp3BOCWThVQ4GIXttLTVd/nnq9d03PuNTWA1ZEW5KkubsuqcRomaxk48wAh
 j3q4ym2epHnAvwXZdYWHIpMJ48rR3JKprBXtsd0XiTDZS1Mirq2XabT7q48OB12Q9PMN32mVGsk
 r6k9DQxwWRu55k5AvMsnvSF7zLimIYmACle12Xg4nF4m7bEHq3PAnWGnE3TDUSUdlplgwg2BdP4
 kmpHTL6S7bAoYjWdnlbs6hlSA/rNRpVhvz1IsJBUYW6VnL/9U4/2Lg4NEQJzYyC9+UFPYoARHhQ
 dsLevCMr+C5gg4fD4CHNw9NmN6uipw==
X-Google-Smtp-Source: AGHT+IF4F80XcT7WuuPnqobdJSkLPJx6MMZzN/qNsNYaHMcd4b91soEc3wX9WiwW9iMvLw+8F1lSoQ==
X-Received: by 2002:a05:6214:b6a:b0:6d8:7ed4:335c with SMTP id
 6a1803df08f44-6d934c12acfmr5041026d6.45.1733860542642; 
 Tue, 10 Dec 2024 11:55:42 -0800 (PST)
Received: from mtt-opossum.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b6b5a672d7sm568918985a.60.2024.12.10.11.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 11:55:42 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com
Subject: [PATCH] drm/vmwgfx: Unreserve BO on error
Date: Tue, 10 Dec 2024 13:55:35 -0600
Message-Id: <20241210195535.2074918-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
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

Unlock BOs in reverse order.
Add an acquire context so that lockdep doesn't complain.

Fixes: d6667f0ddf46 ("drm/vmwgfx: Fix handling of dumb buffers")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 8db38927729b..800a79e035ed 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -750,6 +750,7 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
 	struct vmw_plane_state *old_vps = vmw_plane_state_to_vps(old_state);
 	struct vmw_bo *old_bo = NULL;
 	struct vmw_bo *new_bo = NULL;
+	struct ww_acquire_ctx ctx;
 	s32 hotspot_x, hotspot_y;
 	int ret;
 
@@ -769,9 +770,11 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
 	if (du->cursor_surface)
 		du->cursor_age = du->cursor_surface->snooper.age;
 
+	ww_acquire_init(&ctx, &reservation_ww_class);
+
 	if (!vmw_user_object_is_null(&old_vps->uo)) {
 		old_bo = vmw_user_object_buffer(&old_vps->uo);
-		ret = ttm_bo_reserve(&old_bo->tbo, false, false, NULL);
+		ret = ttm_bo_reserve(&old_bo->tbo, false, false, &ctx);
 		if (ret != 0)
 			return;
 	}
@@ -779,9 +782,14 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
 	if (!vmw_user_object_is_null(&vps->uo)) {
 		new_bo = vmw_user_object_buffer(&vps->uo);
 		if (old_bo != new_bo) {
-			ret = ttm_bo_reserve(&new_bo->tbo, false, false, NULL);
-			if (ret != 0)
+			ret = ttm_bo_reserve(&new_bo->tbo, false, false, &ctx);
+			if (ret != 0) {
+				if (old_bo) {
+					ttm_bo_unreserve(&old_bo->tbo);
+					ww_acquire_fini(&ctx);
+				}
 				return;
+			}
 		} else {
 			new_bo = NULL;
 		}
@@ -803,10 +811,12 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
 						hotspot_x, hotspot_y);
 	}
 
-	if (old_bo)
-		ttm_bo_unreserve(&old_bo->tbo);
 	if (new_bo)
 		ttm_bo_unreserve(&new_bo->tbo);
+	if (old_bo)
+		ttm_bo_unreserve(&old_bo->tbo);
+
+	ww_acquire_fini(&ctx);
 
 	du->cursor_x = new_state->crtc_x + du->set_gui_x;
 	du->cursor_y = new_state->crtc_y + du->set_gui_y;
-- 
2.34.1

