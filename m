Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC85C20A5E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 15:39:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894D910E9D3;
	Thu, 30 Oct 2025 14:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="gTn0tSHT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com
 [209.85.221.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D773210E9DB
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 14:39:23 +0000 (UTC)
Received: by mail-vk1-f228.google.com with SMTP id
 71dfb90a1353d-54a7bf06edfso615623e0c.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 07:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761835163; x=1762439963;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9aTPMWjHh9T1Lh/Mi97B6dj1PQnIBII3hHRpL+fy7Oo=;
 b=Y1nFYDsL5F7XNOz05ga+spEh0JMaeNNlIqH27wlDXCjio8sYUUPxHedO/evr+JdFmR
 J/wSaaPmcuG6vTapy00ljxqbkBvchLHt9DbJ+gA+ukoEp9Le8aDmwWn7YopW/evN59eu
 oZJC2jMbt3h2md0jpry+eey+YKHm4B8GMeWVtDXEt9IU81e0rIroohGuqm/IvjN4NSTt
 z3LB2LyCgS1KykWWqhPLAqTySr+w3qLAmK8HZH4fbXU/5aU6yYCKtwCLp2pD2L2PCuyv
 kB9WeeKGNl3XkZ8UysXjQI5u8HqL8g30EYT0OPWzztchowUhtUi8EvGGFSk8A2p7DzuS
 bNRA==
X-Gm-Message-State: AOJu0YzRKDyVigWQtaT1Gm9vu/PujR8jCPAbOT0pHKaOg7T9Q32LEaXq
 zTdBsv4F483cU7/+TxbdK5FF8N+AfqirSURA/GlK/edRfqWIbfOySkRI4FNAhY5cangokGrSuxW
 MWSr9ovUrAr+O/hbn9YCEaf50ZG07taSD3UMz3CVgonJUzwNleLwyd6daJFRbzTKP+1bZ8I5/7c
 1rCfRAYXs8E5U+fDaHjxBTQa6qfyIfzjzoRP/tW7VRBar+nPGlY3MC0fl5N62WPPbIqc8s6CFrl
 nx9974Bvg8DoG5rFQX8
X-Gm-Gg: ASbGncvR+PM7P+ZGMvuaWBhhvqahTuyuU3aGYpWdsQ/ltJ2ATV8qNvKc5RSCc3enA0N
 aZi9F7dcgyOundHDdxj66foJ6A46YqDZSSnJhMpG8NKjLDgqGeIPrszlT8/YWAYzkzPKhnw/dq8
 IKA0u4SF9+mGhsCW89IBO3wzTVcJQxzV3AsUp6sU4cqH5I3c0E992T4vUFbPUjE7BIGS7ikC3IZ
 w2uo9Wivm5UKdOcp34uw5B9TcP9rFUEx5Bgvn1HT9ktmmQFRqloMUrt01S9LuG2lV8FeBW7q6ok
 0ostQpzm9aMCbO4ZSaBJv0oN9sQGZIQJY1CMlsRLM8e6Fps2WLQhSnaBQALXUykBJ077tc55+Z8
 4OVAhtSRvSMCzXbYY6p9EM7d2VCggNE6m2LUFGGCkOju7Xd/uXlFip1nqRMezb+mo8ERyX0SeOW
 0I5enjrjy3YpA0/qVgaQYwk7hhXITYc36Nfw==
X-Google-Smtp-Source: AGHT+IGU8EQIDCSYLOOVMdWYp4uKZ2UrXN5RI3mmlveUos7+wtUbJCGoq/hl4uoy3D/o4flBMYVK6Aft7fg5
X-Received: by 2002:a05:6122:2003:b0:557:c38b:4dac with SMTP id
 71dfb90a1353d-5593e45a174mr23723e0c.15.1761835162420; 
 Thu, 30 Oct 2025 07:39:22 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
 by smtp-relay.gmail.com with ESMTPS id
 71dfb90a1353d-557ddb84246sm1762344e0c.8.2025.10.30.07.39.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Oct 2025 07:39:22 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-34082c48b2bso8918a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 07:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1761835161; x=1762439961;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9aTPMWjHh9T1Lh/Mi97B6dj1PQnIBII3hHRpL+fy7Oo=;
 b=gTn0tSHTBkn76+VPidjE07hQwOpTjx/3bF3GblsxBWvTRlRyFJnYZfuVWUsCUFrYng
 xd+s45Dktt4oU4qJZPDyWC+w+dMSJzWbvK375+26l18QtlBtncXbrCdtp6hC4jpL+2m6
 ncB+qgO1fjqgbKKsH1mHCPlvpr7YQvfL2ERH8=
X-Received: by 2002:a17:90b:2b4c:b0:340:7972:a617 with SMTP id
 98e67ed59e1d1-3407972a71emr811421a91.18.1761835160770; 
 Thu, 30 Oct 2025 07:39:20 -0700 (PDT)
X-Received: by 2002:a17:90b:2b4c:b0:340:7972:a617 with SMTP id
 98e67ed59e1d1-3407972a71emr811367a91.18.1761835159956; 
 Thu, 30 Oct 2025 07:39:19 -0700 (PDT)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3407ed38850sm124689a91.2.2025.10.30.07.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 07:39:19 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 maaz.mombasawala@broadcom.com, Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v2] drm/vmwgfx: Restore Guest-Backed only cursor plane support
Date: Thu, 30 Oct 2025 09:39:10 -0500
Message-ID: <20251030143910.134767-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029141619.28964-1-ian.forbes@broadcom.com>
References: <20251029141619.28964-1-ian.forbes@broadcom.com>
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

 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c | 16 +++++++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h |  1 +
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
index 718832b08d96..29af13f52fe4 100644
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
@@ -762,6 +766,16 @@ vmw_cursor_plane_atomic_update(struct drm_plane *plane,
 	case VMW_CURSOR_UPDATE_MOB:
 		vmw_cursor_update_mob(dev_priv, vps);
 		break;
+	case VMW_CURSOR_UPDATE_GB_ONLY:
+		struct vmw_bo *bo = vmw_user_object_buffer(&vps->uo);
+
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

