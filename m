Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EBBC41A01
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 21:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0530A10EB81;
	Fri,  7 Nov 2025 20:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="O6NegaYS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com
 [209.85.128.225])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7742310EB81
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 20:46:45 +0000 (UTC)
Received: by mail-yw1-f225.google.com with SMTP id
 00721157ae682-78488cdc20aso12568617b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 12:46:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762548404; x=1763153204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fY79u9w4g4VAY4ytGsRsNKKSlfTg0Gdlek9vIpobFt4=;
 b=kx1wEff4EK2otZpUD8c9GIBK3Tp7QbNOmU2k6rqoNp3G2jT9bPWmZBSAce/2M9E3+h
 RYH7Uu0dY56RpSr/Uf9kNK2jaIv05PsquT9yYdFoUBxzHnMvx8p+Ngu0C52eKaDQ70Vm
 C6CLe8SIvhfwrOqIcJnurid+kE/VMDfI6xCk5TgZAHayV331tNcVxfi38REZrG5cc7Op
 7aZsg1KM6Wvaok7dhufWCbkn1HPh5EpSz6Pa6gpA8E+ADBXfISvUQXipI6ByofMS3EfZ
 yzpMeCdMJyRnltz88LDHJtwbV+qwsB4tLe4SP3KrYS2yAR5BcvpdaUuSJwfo+SsPUNd0
 litg==
X-Gm-Message-State: AOJu0YxXenQdasAmROw5a7ht73Ntu6ZEPk7+ERYHeZrepVdKM4MdXdli
 LNZFiBtNzpM+NQKnyJ9EOD8bHGehYzEWLVbr7xiva9h+9515MLEgZvQiVDSLSLzkvVmN/43ijqm
 mik1SXtkxxJz0j71d4ZOWWHIauglLfJeQrPgh37gG4ZpRj2cCiaWK6goOT+PDLYoLrvHADWRtjA
 hTcqvU5jVfeRdXwCG0+7cgl0YivsswrqAO0diJbVcd8jPJy2JIW3xT7LG2rh6/XK0EBz63uowno
 LCxfvHsccnMJ2T4Xucb
X-Gm-Gg: ASbGncsG0EKHjLP05TskRTXj8AOtDmzwglfDk0KEkv3oMwGkkN7hv/eoUaT58vwDohH
 vWmDEuu+OqKg3AeXTqMBq7YZwIL8+5PYSstLKfNGUML7U/SYjWa4B7fv8IkGBjx2m+wMWl/xWwW
 TXUbfgM8xh55jmLUbSgAeSv4WHNP5VZF49MR2L0uvyvC84P1gixWL+TGrtcGQJopoWiQ7gQ3wim
 8z3qLUjW/OdW7fbmco2ALAj9qHANmE9Gy8U2UnCG0TMjJx+ijbLsMngISW4o+SDLMpGa3a2eny3
 0DL5xkeDfjqV0ChdVVBdLzVzj62aComuGd+pS5DibETaZo148lKjL2h5dsLj1o+aSy2+++9z1Fn
 tvfMf8hiVyyNdRrvQy+hf8GEECZVuJAqcalLsse7ZzdU/VXTUn0OeWqqEysiB0yHpqVuilX0cTP
 h5YId2oaunA86UgXV1VCigf8rtxQZUrh8=
X-Google-Smtp-Source: AGHT+IF0hC0lKVOo5CFsF5Qx0oYA0ZInrrIFrKRIGmGYY4cthAQPBZS1fRM5COzJ0Szv6OvEARmBTRqwi2Dn
X-Received: by 2002:a05:690e:2547:b0:63f:a7fc:694d with SMTP id
 956f58d0204a3-640d45eae05mr406551d50.55.1762548403978; 
 Fri, 07 Nov 2025 12:46:43 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-11.dlp.protect.broadcom.com. [144.49.247.11])
 by smtp-relay.gmail.com with ESMTPS id
 956f58d0204a3-640b5dba71csm355405d50.13.2025.11.07.12.46.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Nov 2025 12:46:43 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-297b35951b7so24085905ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 12:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1762548402; x=1763153202;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fY79u9w4g4VAY4ytGsRsNKKSlfTg0Gdlek9vIpobFt4=;
 b=O6NegaYSQeT214B0Ivxl18PmWGq9OqRAw9EvcilELXT2IYvwl7fOLcTMl/ZaajFrcF
 pOYzgW903NkVcjxhMCdEMDbzJAL+1pwYRSFgRgJAOKjYpCB0fNkEv91Zs6gSlUAgeMS+
 ojuaU0bSgxZTrlaWssRnwX4H6HFrum+y2K8Ls=
X-Received: by 2002:a17:902:fc46:b0:269:4759:904b with SMTP id
 d9443c01a7336-297e570bf23mr4515225ad.58.1762548402464; 
 Fri, 07 Nov 2025 12:46:42 -0800 (PST)
X-Received: by 2002:a17:902:fc46:b0:269:4759:904b with SMTP id
 d9443c01a7336-297e570bf23mr4514975ad.58.1762548401956; 
 Fri, 07 Nov 2025 12:46:41 -0800 (PST)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651c94abasm69459435ad.82.2025.11.07.12.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 12:46:41 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 maaz.mombasawala@broadcom.com, Ian Forbes <ian.forbes@broadcom.com>,
 Ryosuke Yasuoka <ryasuoka@redhat.com>
Subject: [PATCH v2] drm/vmwgfx: Add drm_panic support
Date: Fri,  7 Nov 2025 14:46:17 -0600
Message-ID: <20251107204620.1021749-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251023200447.206834-1-ian.forbes@broadcom.com>
References: <20251023200447.206834-1-ian.forbes@broadcom.com>
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

v2:
 - Set SVGA_REG_CONFIG_DONE=false so that SVGA3 works correctly

 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  | 35 ++++++++++++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h  |  5 ++++
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |  2 ++
 3 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index efdbb67a4966..87448e86d3b3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -20,6 +20,7 @@
 #include <drm/drm_rect.h>
 #include <drm/drm_sysfs.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_panic.h>
 
 void vmw_du_init(struct vmw_display_unit *du)
 {
@@ -2025,3 +2026,37 @@ bool vmw_user_object_is_null(struct vmw_user_object *uo)
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
+	vmw_write(vmw_priv, SVGA_REG_CONFIG_DONE, false);
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
index add13294fb7c..faacfef7baa5 100644
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
2.51.1

