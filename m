Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA68C2E035
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 21:19:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56FA10E481;
	Mon,  3 Nov 2025 20:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="IzYxZtFZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com
 [209.85.210.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1841510E481
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 20:19:32 +0000 (UTC)
Received: by mail-pf1-f228.google.com with SMTP id
 d2e1a72fcca58-7a9c64dfa6eso1534361b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 12:19:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762201171; x=1762805971;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b00idl91agjn0ys29sWn+IvlA/fQWIzSQ8wCh5mMYoQ=;
 b=j0+f5KwXS8OTn5uf8uCI4tR9tq1UVUV4QZkxJIOQRmi5moTKLUOcmHBLsc0Q15IhzQ
 uh5Z7FoOTkIEJ8GUYFYXeRx4YLZUDbbxMJy/7D0BthfF0aby5StsBG8Fm9f5BJ26kFgP
 N3GOcqZt4mth0DyGcIBqzYlQcVSCZnf9h54axr3wU5k4SilV+457JMNJhBFUJGwlNv4s
 kLf13/gjrkNP7/lNkolgLuWhucymJOUYOPIASu7WVyay0zxJGYtNGJPFqXHgJL5VoZrB
 nPJ7BHn6x6v1hkpIITlChdEg5Hto+6Scc44n0BZOfFxoD1EZZDJ4ijTkKvsgj2bYBEdK
 GN0w==
X-Gm-Message-State: AOJu0Yx/Sv+EFiomtWSWWNxH0mcVl8ToALi/9aYCNi+wMjpAoOyzcGaa
 j50bxbEyVTP7DQCGscYgAS4706I3cKIhAeWQdhqf3zyr949qF4X7hF2kiYpfpZac2JNicY4RFvf
 gsRgWYrYVRdt2JNyDf3CZpgNFqh2FLpr6wodzUQ48p8NP+GE4mVZz3hK72m1Vu7xqxqKlRxO4Mw
 kyoW5uw9ZrqHEAlgYuKg0aF/PEcDkBFRagAM+KdRvCgcyIF0qcK5Vte6/UWpA9ui/qa3SxJaDD5
 9aygQCcz6o9eDNFshCz
X-Gm-Gg: ASbGncus8d6gwFWpGfVEEP0/Zkzfn9aJrshICjpy8qubX2kMFMZkY8FFDJiDwjsawNA
 nFAoZmElqmU8Pj5DFXs5qwR6hsW59XdXwOYcxJmQDslDv0ILguDsozknCTu33KH36tIVy7xl6yg
 pZ8ix9cogfZv4Bij2x2dMFLhpBeWK/o4Yva1/VeLeD2NtZN5n2fhUWp49osdwVfaMKz9mL9bJDP
 psfQoygCqRoILc4ZEP/kbKQsVydDVzCcslTXwvlJIQ5F9jM8PV17Z0hWwgzj/NqLfpWQ6tauP0x
 zAMEnLDk7QMd/vmIowVIkyi9DfxAHvhVyLi3+ZLSJpyyp7LonHdLr7uvjg/HS+BjI0QV401KJOJ
 TC09ZLS/WIdJNz1p1gELguCLucZcZfQrRbc/HSVsiFPwwEGRLyNOGbkPD1J3iTj+5ESRrV4EUFZ
 cmUt0F6fxGNXnR2BELzFsiJCRDkvkjY2nu/A==
X-Google-Smtp-Source: AGHT+IFxjA4jSnUPU7GorcDKRLB99SCfp7alOTdZMRHWnHuvNWZ0JB+7JNdGLZ/KZfVLXopy9lma9gdFqcys
X-Received: by 2002:a17:902:e84a:b0:295:987d:f7ef with SMTP id
 d9443c01a7336-295987e0271mr70702555ad.10.1762201170580; 
 Mon, 03 Nov 2025 12:19:30 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
 by smtp-relay.gmail.com with ESMTPS id
 41be03b00d2f7-ba1f493c46bsm763a12.9.2025.11.03.12.19.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Nov 2025 12:19:30 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-27c62320f16so57312495ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 12:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1762201168; x=1762805968;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b00idl91agjn0ys29sWn+IvlA/fQWIzSQ8wCh5mMYoQ=;
 b=IzYxZtFZPJmWoKSxiePIodrUMOwSduntbIkkXw0dcpFKJ8VALDXf45G5tf2OIPcgHe
 /r4uPTXhbBMjYsZzy8pdKmzVvQZhgFyIDRYNXrH+SbFC7H4MYW58e3vVSMYE5iABfhhy
 82lduNEPGp/aYFT+GqcUJLX2SBHNtavQTlDfk=
X-Received: by 2002:a17:902:c409:b0:276:d3e:6844 with SMTP id
 d9443c01a7336-2951a493552mr202563075ad.33.1762201168274; 
 Mon, 03 Nov 2025 12:19:28 -0800 (PST)
X-Received: by 2002:a17:902:c409:b0:276:d3e:6844 with SMTP id
 d9443c01a7336-2951a493552mr202562655ad.33.1762201167664; 
 Mon, 03 Nov 2025 12:19:27 -0800 (PST)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29601a5d174sm154575ad.77.2025.11.03.12.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 12:19:27 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 maaz.mombasawala@broadcom.com, Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v3] drm/vmwgfx: Restore Guest-Backed only cursor plane support
Date: Mon,  3 Nov 2025 14:19:20 -0600
Message-ID: <20251103201920.381503-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251030143910.134767-1-ian.forbes@broadcom.com>
References: <20251030143910.134767-1-ian.forbes@broadcom.com>
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

The referenced fixes commit broke the cursor plane for configurations
which have Guest-Backed surfaces but no cursor MOB support.

Fixes: 965544150d1c ("drm/vmwgfx: Refactor cursor handling")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---

v2:
 - Add drm_warn_once on unknown cursor type
v3:
 - Fixed compiler error on GCC 8

 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c | 16 +++++++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h |  1 +
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
index 718832b08d96..c46f17ba7236 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
@@ -100,8 +100,10 @@ vmw_cursor_update_type(struct vmw_private *vmw, struct vmw_plane_state *vps)
 	if (vmw->has_mob) {
 		if ((vmw->capabilities2 & SVGA_CAP2_CURSOR_MOB) != 0)
 			return VMW_CURSOR_UPDATE_MOB;
+		else
+			return VMW_CURSOR_UPDATE_GB_ONLY;
 	}
-
+	drm_warn_once(&vmw->drm, "Unknown Cursor Type!\n");
 	return VMW_CURSOR_UPDATE_NONE;
 }
 
@@ -139,6 +141,7 @@ static u32 vmw_cursor_mob_size(enum vmw_cursor_update_type update_type,
 {
 	switch (update_type) {
 	case VMW_CURSOR_UPDATE_LEGACY:
+	case VMW_CURSOR_UPDATE_GB_ONLY:
 	case VMW_CURSOR_UPDATE_NONE:
 		return 0;
 	case VMW_CURSOR_UPDATE_MOB:
@@ -623,6 +626,7 @@ int vmw_cursor_plane_prepare_fb(struct drm_plane *plane,
 		if (!surface || vps->cursor.legacy.id == surface->snooper.id)
 			vps->cursor.update_type = VMW_CURSOR_UPDATE_NONE;
 		break;
+	case VMW_CURSOR_UPDATE_GB_ONLY:
 	case VMW_CURSOR_UPDATE_MOB: {
 		bo = vmw_user_object_buffer(&vps->uo);
 		if (bo) {
@@ -737,6 +741,7 @@ void
 vmw_cursor_plane_atomic_update(struct drm_plane *plane,
 			       struct drm_atomic_state *state)
 {
+	struct vmw_bo *bo;
 	struct drm_plane_state *new_state =
 		drm_atomic_get_new_plane_state(state, plane);
 	struct drm_plane_state *old_state =
@@ -762,6 +767,15 @@ vmw_cursor_plane_atomic_update(struct drm_plane *plane,
 	case VMW_CURSOR_UPDATE_MOB:
 		vmw_cursor_update_mob(dev_priv, vps);
 		break;
+	case VMW_CURSOR_UPDATE_GB_ONLY:
+		bo = vmw_user_object_buffer(&vps->uo);
+		if (bo)
+			vmw_send_define_cursor_cmd(dev_priv, bo->map.virtual,
+						   vps->base.crtc_w,
+						   vps->base.crtc_h,
+						   vps->base.hotspot_x,
+						   vps->base.hotspot_y);
+		break;
 	case VMW_CURSOR_UPDATE_NONE:
 		/* do nothing */
 		break;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h
index 40694925a70e..0c2cc0699b0d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h
@@ -33,6 +33,7 @@ static const u32 __maybe_unused vmw_cursor_plane_formats[] = {
 enum vmw_cursor_update_type {
 	VMW_CURSOR_UPDATE_NONE = 0,
 	VMW_CURSOR_UPDATE_LEGACY,
+	VMW_CURSOR_UPDATE_GB_ONLY,
 	VMW_CURSOR_UPDATE_MOB,
 };
 
-- 
2.51.1

