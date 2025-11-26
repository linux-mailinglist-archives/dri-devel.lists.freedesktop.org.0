Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2454BC8B5A2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 18:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB9910E06C;
	Wed, 26 Nov 2025 17:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="IEAAAD74";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com
 [209.85.214.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E8610E06C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 17:54:03 +0000 (UTC)
Received: by mail-pl1-f226.google.com with SMTP id
 d9443c01a7336-297e982506fso321935ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:54:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764179643; x=1764784443;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XsDPRzaHgU1kAFT7eBgBmOFk/YKhXXrixVM/7Ow3UOI=;
 b=WVTIXH/P7IRhtW5pYHSZG2xFH4SaG4doblZYYyWAHNaFBOMDpk1HHgrDJyPumDjc0O
 8LKvra+Up3epiG0c4BU+1aCmoad9GtoXtchazH3CDBj2A62HeYHCU7to0GZ9JUvaZ2Nm
 siGF+xdcGDtR8YTz2smTHupLizvXdaEwhVE4/W+Ji4Aaby0n/zwOuwPrBA1r8xiUWGuC
 sxU0uTbKzsqEfqpiYWStUxRrpcEzps9A3uqocqN8xPUC8mSkDkmIqXsX1JAeDAsrdjZq
 MRlhUq4ai1Qg/Ws0mQv0qYtfC/7zNYOEKH7DPDncUkSOKUxPHIDx+sv3QYHWFLylGZJ9
 Mfkw==
X-Gm-Message-State: AOJu0YzftzZBqKZNjppoGkpR/9d+OleJb3NeBfe/CXa5hW3phSKel2BQ
 Spnr8b2tHKadc5ejrV4xrCkmVuesVrVmoekEbbx4TmqmDbU0T0DQUprtlCkLomQZeSY3Ke8wbbz
 DB+kj0G3VErM2LqB0lk7TXElClR5Fc4z9RbyDD2Rr7W6x0BWT0coQKrItJgpnBdxD2nFF2mdEd0
 gmaPoTSLN9y+HQwmG8Jw6wg2Nt1VGOSzC/TKNROtN2nCbFpSXalzZRg8yDXW2tuFL5pD+OWPfEo
 QNcLCoxZ5DAFzgwsAz0
X-Gm-Gg: ASbGnctP812tl5baRtp6Uk0iA6ymMLqlmx88FpBiNZltHg5HbvtrQKL/NIgrXWB4Ufj
 SIOwYdvrryG1kG+Ke8f+oUlkGO3D63HqfbmUgp6o5e74LyYUX+l7soSsD81F0Jc4fTq6OccfeWU
 wrMx4kKvc5Rar6vIoZeDM0v6si3NItJv/xOxNXAs7Lm7o0kz9nc42cC2otz6KvHzfPfdMDGhSfP
 +HH0PkRgl2Pbk+QhkwY7m90/cNywqVQESR9GmChTeitApsixvFaUNADzJ+feJht7tP5kfh/ZLCv
 ygLMAhsPTzS5UNgicMQDUNAsoqU1tCpz1TEKNgoEXKC40+jVM8anE8Rquv1NTT4gvCGW2GIwYu7
 t8MiDZcADj8XC5Vw0SI0Ff6jc/i+FWA0hy1TmrUZWM2zXoX6ij+HiO5AsaNDA7VMjY4geMVMLw/
 +9g3keDV1ov7vElMm2RaA8OJkGYTzbH5q49fCu19NAOA==
X-Google-Smtp-Source: AGHT+IE4rTOy7XwCXrcu9eOpZKQj+FW8aVBN5DLdkR3ntx9ji8PdmlZjUBjrXxjLMnqz3TG+JnkCNvLTxxWF
X-Received: by 2002:a17:902:d541:b0:295:9db1:ff32 with SMTP id
 d9443c01a7336-29b6bf5d676mr230700435ad.48.1764179642633; 
 Wed, 26 Nov 2025 09:54:02 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-77.dlp.protect.broadcom.com. [144.49.247.77])
 by smtp-relay.gmail.com with ESMTPS id
 d9443c01a7336-29b5b14aef2sm22132175ad.25.2025.11.26.09.54.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Nov 2025 09:54:02 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ed79dd4a47so1591701cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1764179641; x=1764784441;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XsDPRzaHgU1kAFT7eBgBmOFk/YKhXXrixVM/7Ow3UOI=;
 b=IEAAAD74olstVTjwiiJmeXnMr036yHC5aV7v0HygX5rqR4n/rVQ2X7tXX90npkfNJy
 Im4qKhRgLVnV77dio0LEh67IfBQ1mmbRUhh2fW4JTIwCQ8sdXLLCcbAACQf+F8h1MKlI
 AUSZrBTIIkrztrXnuFmQgvwmrS8rxBTb97IRM=
X-Received: by 2002:a05:622a:50b:b0:4ee:1ce8:e58c with SMTP id
 d75a77b69052e-4ee58912202mr283823421cf.48.1764179641391; 
 Wed, 26 Nov 2025 09:54:01 -0800 (PST)
X-Received: by 2002:a05:622a:50b:b0:4ee:1ce8:e58c with SMTP id
 d75a77b69052e-4ee58912202mr283823031cf.48.1764179640929; 
 Wed, 26 Nov 2025 09:54:00 -0800 (PST)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee48e8df63sm130006711cf.30.2025.11.26.09.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 09:54:00 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 maaz.mombasawala@broadcom.com, Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH] drm/vmwgfx: Fix cursor plane on HW version 10
Date: Wed, 26 Nov 2025 11:53:52 -0600
Message-ID: <20251126175352.3038001-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.51.1
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

This covers the case where a Dumb Buffer is attached to the cursor plane on
HW version 10 and below.

Also suppresses the unknown cursor type warning if there is no FB
attached to the plane.

Fixes: 965544150d1c ("drm/vmwgfx: Refactor cursor handling")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c | 9 ++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
index c46f17ba7236..d5c6026855e3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
@@ -103,7 +103,11 @@ vmw_cursor_update_type(struct vmw_private *vmw, struct vmw_plane_state *vps)
 		else
 			return VMW_CURSOR_UPDATE_GB_ONLY;
 	}
-	drm_warn_once(&vmw->drm, "Unknown Cursor Type!\n");
+
+	if (vmw_user_object_buffer(&vps->uo))
+		return VMW_CURSOR_UPDATE_DUMB;
+	if (vps->base.fb)
+		drm_warn_once(&vmw->drm, "Unknown Cursor Type!\n");
 	return VMW_CURSOR_UPDATE_NONE;
 }
 
@@ -142,6 +146,7 @@ static u32 vmw_cursor_mob_size(enum vmw_cursor_update_type update_type,
 	switch (update_type) {
 	case VMW_CURSOR_UPDATE_LEGACY:
 	case VMW_CURSOR_UPDATE_GB_ONLY:
+	case VMW_CURSOR_UPDATE_DUMB:
 	case VMW_CURSOR_UPDATE_NONE:
 		return 0;
 	case VMW_CURSOR_UPDATE_MOB:
@@ -627,6 +632,7 @@ int vmw_cursor_plane_prepare_fb(struct drm_plane *plane,
 			vps->cursor.update_type = VMW_CURSOR_UPDATE_NONE;
 		break;
 	case VMW_CURSOR_UPDATE_GB_ONLY:
+	case VMW_CURSOR_UPDATE_DUMB:
 	case VMW_CURSOR_UPDATE_MOB: {
 		bo = vmw_user_object_buffer(&vps->uo);
 		if (bo) {
@@ -768,6 +774,7 @@ vmw_cursor_plane_atomic_update(struct drm_plane *plane,
 		vmw_cursor_update_mob(dev_priv, vps);
 		break;
 	case VMW_CURSOR_UPDATE_GB_ONLY:
+	case VMW_CURSOR_UPDATE_DUMB:
 		bo = vmw_user_object_buffer(&vps->uo);
 		if (bo)
 			vmw_send_define_cursor_cmd(dev_priv, bo->map.virtual,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h
index 0c2cc0699b0d..32011b48d4e5 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h
@@ -35,6 +35,7 @@ enum vmw_cursor_update_type {
 	VMW_CURSOR_UPDATE_LEGACY,
 	VMW_CURSOR_UPDATE_GB_ONLY,
 	VMW_CURSOR_UPDATE_MOB,
+	VMW_CURSOR_UPDATE_DUMB,
 };
 
 struct vmw_cursor_plane_state {
-- 
2.51.1

