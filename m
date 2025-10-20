Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7385BF0B21
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 12:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32A310E135;
	Mon, 20 Oct 2025 10:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FnD3y4qs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7451D10E135
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 10:58:15 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b3df81b1486so80631066b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 03:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760957894; x=1761562694; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GkFaQ1bopt/VkRBUzrDCpvzpaSMPfW8Xt+ULvEdICqg=;
 b=FnD3y4qsTMvRwawfSdoRDOuNgOd0mz49irUSOB3tLP7R39OvCwCz3nLIq9cf5ZB0CU
 u2yaL/kD7uKq2p7MlSelThg0gyQ01iu0JhhAVYlAJo72n4Bl3efSHiA9VHxMT6BMMynS
 0ij/AnVXNdi5zOf4d51BOnc7wrRiOgqmzgPrG6zdOI4jUTOOLWRmA7oFRBtCbWfdJH5F
 /VTKjR4jHDdeQIG1VfEUQlRWHOSB4yzdo4ASwOEbNW9hrL3WqE901RED/BsOGEmAfbvV
 soCjMrLNSGznyg45XtzzIGh/fJbMDY0WqcV6D+PnRdVyt7MqG6ovHo/bJkvj5K65a23A
 nZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760957894; x=1761562694;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GkFaQ1bopt/VkRBUzrDCpvzpaSMPfW8Xt+ULvEdICqg=;
 b=Fo9lKch87XEHbqDs1wg38r8U1ulw1nB2kCToX6OmZ8SXMERIjXVAdpyOLJ+7mbpgY6
 jLfPJnwu/jwdzfbNL9X7iIQONPTNlZtPGy+s0TiCGQIg/Ze5k6C4sRWSOqiKOnscni0X
 wFMIud8FRBPbBW+aB1uWNBto4jYfIATNzCXtjw2UjC5sP4R/LqbJd/ln5si3wrbetMfU
 qttwulPRdSeHnyTdJEwYFRt3J9fcOarsjHpkjLDDe1AGZQdezbBJ/FHtfOXdL3dM6LSC
 ZHJJGAeJJHtyPTCALDwwmZnQXAiuPnKpws0wM49bgkj92E5Y5i/pn9fILAiRK0nBwMWZ
 JfYA==
X-Gm-Message-State: AOJu0YxDPamwuHShcrvc9QskS8a7eM6H3yzHPgOEagAF8CpsNwKq/Wrk
 YRA8rMumNtuxqvn510GlTieNm6sq4+L2CyMP3GjuvtIJyQc03UclVkeM
X-Gm-Gg: ASbGncuP0E85trXuix5lbllup7qaFLzRIywPnlthxQGrHJD7xUiaViwARDpXxP3J+Sb
 CbZxOs56QYuAkBhSWRRx/qgYfZ2Ifx+YOtfmMHEzNpyz70hqytXyQ4bAgjfo8EJYy3LTJhxHwo0
 8WlomwmWmp8/97G7kzRuXLR/FHpPjf07bucNBdYO4SfDhsxPFUDidDh9XfVZG02btnSMkeT/aOV
 q7mev6kIiw6uauOSsZLR+2DYVgKw76UAQv7Ah5IQj3ZsqdN16Bz8nUiUIlUClmQa1h3D0keHezI
 pLYR8lHnWA7bSZjXwAXxdCLBxdhmXVkqq0Dn2pNVn51yG+7fo+qVG7SKaGLoO+O/08UTkLuIWzR
 t7v4/lJeKxb8+JIZ7OCG6obR5gJQjktbSiE8mid7psj+wvUwGJ78mWmbFiKGT+jeE+IT130wIfd
 dUvEY=
X-Google-Smtp-Source: AGHT+IFonlP9IIaHnKYJ1FGKly6VFGVY9U/JNDCz4I3ar5aMmaJr0RPUUSGZ9EBntxqPtU8gcUrFxg==
X-Received: by 2002:a17:906:9f86:b0:b3d:5088:2140 with SMTP id
 a640c23a62f3a-b6472353d0emr769387166b.3.1760957893588; 
 Mon, 20 Oct 2025 03:58:13 -0700 (PDT)
Received: from bhk ([165.50.81.231]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65e8971897sm751474166b.37.2025.10.20.03.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 03:58:13 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: lanzano.alex@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH] drm/tiny: Refactor framebuffer's size calculation
Date: Mon, 20 Oct 2025 12:57:23 +0100
Message-ID: <20251020115803.192572-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
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

Use drm_format_info_min_pitch() to calculate the framebuffer line pitch
instead of directly multiplying width and height. This aligns with DRM
helpers for determining per-line byte size and avoids manual assumptions
about bytes per pixel.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
 drivers/gpu/drm/tiny/repaper.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 4824f863fdba..aeff49bc6ba7 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -517,6 +517,8 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb, const struct iosys_map *
 	unsigned int dst_pitch = 0;
 	struct iosys_map dst;
 	struct drm_rect clip;
+	const struct drm_format_info *info = fb->format;
+	size_t pitch;
 	int idx, ret = 0;
 	u8 *buf = NULL;
 
@@ -534,7 +536,9 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb, const struct iosys_map *
 	DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
 		  epd->factored_stage_time);
 
-	buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
+	pitch = drm_format_info_min_pitch(info, 0, fb->width);
+
+	buf = kmalloc_array(fb->height, pitch, GFP_KERNEL);
 	if (!buf) {
 		ret = -ENOMEM;
 		goto out_exit;
-- 
2.51.1.dirty

