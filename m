Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95030C1B207
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 15:16:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DDD10E1E0;
	Wed, 29 Oct 2025 14:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="OyODLhzw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f100.google.com (mail-qv1-f100.google.com
 [209.85.219.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC6010E1E0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 14:16:33 +0000 (UTC)
Received: by mail-qv1-f100.google.com with SMTP id
 6a1803df08f44-879b99b7ca8so81795046d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 07:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761747392; x=1762352192;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6BxaqZovFbFwhRINv1GsGm1DPg8PCqnNvABLTF3prBk=;
 b=ofV6kr4ffQUOLBWfajML7nO+lhf1gznoaFf7us17my5/mmth4q8qLiEe35mxgz/ovj
 RcLnsOhS3kT6UQwQByslNqX66sNMjYV+jmeop28Smy4vsiOP8r7fo/cGh8Nc2X3BX6Fk
 VVAYtOp0c8rMgOyiisHh/+WxKVac2HLPUb0VC8A0TOTWwh2d1b87lfHoL4ffBW6g0i/b
 pAFtYnSWsX/RHA6iUEqFaDjTfZl2rgm9jp4Qv8WExeFMDiNg/TIiSAV7rNby9Gz5pCaS
 U4A619Svp13Z7napYpkyVVrHV/1XF9kJIghOaQDL/JbO162d0sAjwObO/EakhApziGCz
 tL7w==
X-Gm-Message-State: AOJu0YxsDmvIUwqkCX/2EZB1dmsYwgJW2thphdTL3trg4xlRxvvYLoQM
 tiCCjWmrAnU2Y+atNBxFYDVWVQUQ8d5KDPNOP3ZLA7XDYkBldoqXKWhtoZN9spMpkpxaQ12ZWoH
 /spDCSEhgFmW41SH1AZC58eVCmmSJBTQKQIAyMPig5sMuh5eHWVSQ73JJ5O31tnMKooshGu8aZ5
 9Le4BoD32EBBbZDssL1umVG9ztGWda6/uO+Fm4viB3fcYaswwPRnHPFONHXCnTMjTaz1x6GP4Cb
 nFC8fKzAEz5dSTeiL0i
X-Gm-Gg: ASbGncv7Xn1fYIAYH5fxOojy9hl7wD9ZA+A/2MujUUgc/FunvfTTAxibMSi8TghsACE
 lkzVAtOqhNhvFGg/GXEn8J6gZ4+pPM/YGMaTTjF3d3MnwfhLqJb+qMAvohEEdaKycOe7ciwkGne
 qsVMCbtlwXpvoXiF/B1KEYEqUs5pHpmH0vWxCxuumNQVOE2OjLQvdq8hOA814OFusU5IE2tGjjC
 m6lJ6HsuUXCqbpSCTRe9gzJ+s0TESMYNbZQMDP2zYLn9TWXXFw4WxMmcZCSr/8S6wTWgQRwGqLg
 uPq3zMxinZJe7WIk4dmFVcORzXM/OIJXl+mt47oUN8/Vh/Ny+rG9Lr67kWj2Fa/M96IK09UVo8I
 zrY4yGyHTAvxBeLjwrtnMeHKrX4q4r2YmCpLNXotsWtTwkO60kvZ25cz+CGNO8C5wNUgEsRfomn
 c6iO59FKY3Dfl1U2dvQjj/X2DWHq7dqiUJRQ==
X-Google-Smtp-Source: AGHT+IGFyknScjjpGA9z23mjZBBbPOQYDgAw322OXGcIqc5nLrb2B3KnE1T5kr9lPdWtkfYQQ/7muV+SukZp
X-Received: by 2002:a05:6214:1cc5:b0:84d:5b71:8a7f with SMTP id
 6a1803df08f44-88009c088a5mr42967556d6.34.1761747391941; 
 Wed, 29 Oct 2025 07:16:31 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
 by smtp-relay.gmail.com with ESMTPS id
 6a1803df08f44-87fc494a261sm12724836d6.16.2025.10.29.07.16.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Oct 2025 07:16:31 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-33bc5d7c289so12642657a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 07:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1761747385; x=1762352185;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6BxaqZovFbFwhRINv1GsGm1DPg8PCqnNvABLTF3prBk=;
 b=OyODLhzwtaVLgMvh2roc7VJKVNFyhe4uJNUhHShpYeDxA87M9z+afBLM2rfgHqDL78
 xodSksO+w9Qel5URhfBakHpf2uoltAleS7YglOt2HBqSQ5vKCWHr8R0agvtbtRAynT+e
 +US9SmppBxoG2GZeAMLgcrgDRBGptFlTffdHY=
X-Received: by 2002:a17:90b:5241:b0:340:29be:7838 with SMTP id
 98e67ed59e1d1-3403a28f55cmr3343066a91.29.1761747385007; 
 Wed, 29 Oct 2025 07:16:25 -0700 (PDT)
X-Received: by 2002:a17:90b:5241:b0:340:29be:7838 with SMTP id
 98e67ed59e1d1-3403a28f55cmr3343020a91.29.1761747384272; 
 Wed, 29 Oct 2025 07:16:24 -0700 (PDT)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3402a637765sm2765132a91.14.2025.10.29.07.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 07:16:23 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 maaz.mombasawala@broadcom.com, Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH] drm/vmwgfx: Restore Guest-Backed only cursor plane support
Date: Wed, 29 Oct 2025 09:16:19 -0500
Message-ID: <20251029141619.28964-1-ian.forbes@broadcom.com>
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

The referenced fixes commit broke the cursor plane for configurations
which have Guest-Backed surfaces but no cursor MOB support.

Fixes: 965544150d1c ("drm/vmwgfx: Refactor cursor handling")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c | 14 ++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
index 718832b08d96..87f0f61e470c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
@@ -100,6 +100,8 @@ vmw_cursor_update_type(struct vmw_private *vmw, struct vmw_plane_state *vps)
 	if (vmw->has_mob) {
 		if ((vmw->capabilities2 & SVGA_CAP2_CURSOR_MOB) != 0)
 			return VMW_CURSOR_UPDATE_MOB;
+		else
+			return VMW_CURSOR_UPDATE_GB_ONLY;
 	}
 
 	return VMW_CURSOR_UPDATE_NONE;
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
2.51.0

