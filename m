Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCFC498E90
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 20:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4D010E6A6;
	Mon, 24 Jan 2022 19:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9345E10E6A6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 19:47:14 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id d10so24448788eje.10
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 11:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lc7APd50YkFqw3zFombLtjhX0dQZ0+1XcIFSXUKBNWU=;
 b=UGrTFIWKpsKAjs683ggxdXs6/63ca0rixpRWQwB37TnpiyedBtuVGfEEMmNtTAxQQR
 4TSsj2IwN8qhwv5OTGg0Qz+RXCb3LlN5hdUShnvKik8NbUcCCwxQbcxET9KU5rpCTeiR
 bLNNiTl6ud6y9ZXOufSy6ZbTB6puvwT3TBj1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lc7APd50YkFqw3zFombLtjhX0dQZ0+1XcIFSXUKBNWU=;
 b=5/S0M3eJMNN5F7LMI8r9qRX8EdPR6E8IR1niFRQg4Ocil96KJKD1exjIYrKSDIfUPP
 KulKSuPkHnobBat6U0bnditWHV/jorDGSfUFoRfQW+ZVLVlSOSrN1rtJGFGSUEkgrtcy
 fdAaWFbn5A8HGGeAgPJex17BB/q04hHyvCGjtEOVki8cZSUCL/iWHRqX+AqqlZ485EKw
 x8617yBm1gxlZm0gOjXagr8/8FPtVHUzXW/OYuEAcYRBPu7AQbcpY0RSx2fBrvUGe7FP
 YAUjl41ZXADsKCHGRVBUEH7w2NQtf6E0pu/oo75rv4NOiuoqUG0P8xY3bYAfsru5irrZ
 j/og==
X-Gm-Message-State: AOAM533cBF66kLG1mpBOQI9B01gfAeUsPTzII116FXubIeLkfENYfR4E
 KbrsB0D6dMsKfYO08X8OwWq8HCllCQo3mw==
X-Google-Smtp-Source: ABdhPJweOOHZRcrkFms49pe+uX75PVhPVRuaeBQyFEz7Np4o9riHmSH95zcal9Yoo3cIbQenXfovPQ==
X-Received: by 2002:a17:907:97d6:: with SMTP id
 js22mr1642766ejc.527.1643053633080; 
 Mon, 24 Jan 2022 11:47:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d26sm7070334edy.92.2022.01.24.11.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 11:47:12 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/docs: Document where the C8 color lut is stored
Date: Mon, 24 Jan 2022 20:47:06 +0100
Message-Id: <20220124194706.930319-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also add notes that for atomic drivers it's really somewhere else and
no longer in struct drm_crtc.

Maybe we should put a bigger warning here that this is confusing,
since the pixel format is a plane property, but the GAMMA_LUT property
is on the crtc. But I think we can fix this if/when someone finds a
need for a per-plane CLUT, since I'm not sure such hw even exists. I'm
also not sure whether even hardware with a CLUT and a full color
correction pipeline with degamm/cgm/gamma exists.

Motivated by comments from Geert that we have a gap here.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_color_mgmt.c |  4 ++++
 include/drm/drm_crtc.h           | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index bb14f488c8f6..96ce57ad37e6 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -82,6 +82,10 @@
  *	driver boot-up state too. Drivers can access this blob through
  *	&drm_crtc_state.gamma_lut.
  *
+ *	Note that for mostly historical reasons stemming from Xorg heritage,
+ *	this is also used to store the color lookup table (CLUT) for indexed
+ *	formats like DRM_FORMAT_C8.
+ *
  * “GAMMA_LUT_SIZE”:
  *	Unsigned range property to give the size of the lookup table to be set
  *	on the GAMMA_LUT property (the size depends on the underlying hardware).
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 4d01b4d89775..03cc53220a2a 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -285,6 +285,10 @@ struct drm_crtc_state {
 	 * Lookup table for converting pixel data after the color conversion
 	 * matrix @ctm.  See drm_crtc_enable_color_mgmt(). The blob (if not
 	 * NULL) is an array of &struct drm_color_lut.
+	 *
+	 * Note that for mostly historical reasons stemming from Xorg heritage,
+	 * this is also used to store the color lookup table (CLUT) for indexed
+	 * formats like DRM_FORMAT_C8.
 	 */
 	struct drm_property_blob *gamma_lut;
 
@@ -1075,12 +1079,18 @@ struct drm_crtc {
 	/**
 	 * @gamma_size: Size of legacy gamma ramp reported to userspace. Set up
 	 * by calling drm_mode_crtc_set_gamma_size().
+	 *
+	 * Note that atomic drivers need to instead use
+	 * &drm_crtc_state.gamma_lut. See drm_crtc_enable_color_mgmt().
 	 */
 	uint32_t gamma_size;
 
 	/**
 	 * @gamma_store: Gamma ramp values used by the legacy SETGAMMA and
 	 * GETGAMMA IOCTls. Set up by calling drm_mode_crtc_set_gamma_size().
+	 *
+	 * Note that atomic drivers need to instead use
+	 * &drm_crtc_state.gamma_lut. See drm_crtc_enable_color_mgmt().
 	 */
 	uint16_t *gamma_store;
 
-- 
2.33.0

