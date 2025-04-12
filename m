Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7989A86E7F
	for <lists+dri-devel@lfdr.de>; Sat, 12 Apr 2025 19:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D774110E3CB;
	Sat, 12 Apr 2025 17:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mzxk9Tbk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7160510E3CB;
 Sat, 12 Apr 2025 17:54:12 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7c7a5ee85dcso58797285a.2; 
 Sat, 12 Apr 2025 10:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744480451; x=1745085251; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6+swTvs1bMwk0dAlVOfDZ90gSAfKDS6pnqb80rHKJ+c=;
 b=mzxk9TbkHvepm8eVcAmkimwkoJJL7b9L9tsCJfLMjpd8bBcJC9JNbuM+BxclbbX+u6
 +xwZqEo4pPqbtnPY/64+oJZY7wvirYTUW9oPYzbDuFfTZ7Ei6Fi5xOYuSqsDPQvj6CUy
 j5eKPO+wh7TM6euttgF7fyD2gx5cTw5KbCPZ2oyUoBD6+bpPFNx2psfYYV6MtkrKy+Cg
 CMmPL5a+cVjAB+ZEMEt+UAgIbnvfH4GlSTkHdUCW5Fe91uzB9emnrEVx1lBUpb4XVBRr
 TfhRZvyWVR47Ol0eiQTfNNxCUWIjHK0XlrOymHbTeDY81Vm+ujrlMbJDuU4AmYx5Kr5g
 QGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744480451; x=1745085251;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6+swTvs1bMwk0dAlVOfDZ90gSAfKDS6pnqb80rHKJ+c=;
 b=EskDbciL468swke/lON5VaI2NqyU+I4g6ogGOQn877voPUvKhSaHhQ2vLEhYRZFoZw
 WOc8YX7NHlNQwAeAOOKp80aVtu5BqVUFx3iG3M6EirLhTzSiuczeO/dDhNOIuTnJh3NX
 8Be750qp38LrxZP8TXX0bdeWm8wPZFb/9COPBJc+97Q1dWRVqMrbreXsDy3ElNXn1GKN
 VZFOgfbVoDASZN1nmq5tu7SE+5fp6t4eUs2A6zzH7pbS+KnGFieOvFxZzGPlu4tIMgGC
 sXviL1hXz6oO8P2ELlkwuWtUuOA7yfotaFxDSYB9aFh83uRqvWwHymJoDo2O38msnXaO
 GZPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvlJYYpxpJW7tjT9y7aoEWS2UJG97VnyupqDBWY75t2aXSco5dN8alJSvy6DpcFJrvPC59CecS@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKjUCSK4VXLYdcj93ihk8CucSXONSnzjVXApOovli/Gm2Behr0
 oI2vmgbFR1+rAwiNLFK0Og+R9ylKHsRnxOWKfMPBUbaVDN9ktTw=
X-Gm-Gg: ASbGncv832ArhzAJ/p9u2pB10U95uUHbNlKfF4/5xXKVel6mWCaqUFB0dLzbogvTYsz
 qUFIMYuD1EGHbTteCx6GIU9gs1V/Rks5wjJhZEEnBptNJZOz08GVMoYv1GNmUXSlMSPW5ertxiK
 6ZEGEepXmeMIF4hgVO/S6mCGXziWj++OhXw5sxUvSFqRbpLp25FykC3T9XYh/ncyBbx9OSPijwe
 OBz7crRoc24Wa530HpLMu5k4U+9Ns3Ae4W5qNSvLTTvY33GSQFg4Ssqbhh7zyMm5GPCq0peBF+j
 vMtjJnngOFdTnTXB+YcS4OVBggdsnhTOKQnSHTqODR0kAZ7/
X-Google-Smtp-Source: AGHT+IEL1SqJ5F06hbFN3Y1JvHG2PLyceL1Lc10guuRTd0YVFxZ2IuhOYNTle1a61WyixhDH669LQw==
X-Received: by 2002:a05:622a:3d3:b0:472:1d00:1faa with SMTP id
 d75a77b69052e-479775de243mr38040611cf.13.1744480451119; 
 Sat, 12 Apr 2025 10:54:11 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4796edc0e57sm43012951cf.65.2025.04.12.10.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Apr 2025 10:54:10 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: lyude@redhat.com, dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 lumag@kernel.org, tzimmermann@suse.de, dianders@chromium.org,
 harry.wentland@amd.com, u.kleine-koenig@baylibre.com, airlied@redhat.com,
 bskeggs@redhat.com
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] drm/nouveau: Fix null pointer dereference
Date: Sat, 12 Apr 2025 12:53:56 -0500
Message-Id: <20250412175356.3123901-1-chenyuan0y@gmail.com>
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

The return value of drm_mode_duplicate() is assigned to mode,
which will lead to a NULL pointer dereference on
failure of drm_mode_duplicate(). Add a check to avoid npd.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: 6ee738610f41 ("drm/nouveau: Add DRM driver for NVIDIA GPUs")
---
 drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c
index fd2150e07e36..f39a7028933a 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c
@@ -229,6 +229,7 @@ static int ch7006_encoder_get_modes(struct drm_encoder *encoder,
 {
 	struct ch7006_priv *priv = to_ch7006_priv(encoder);
 	const struct ch7006_mode *mode;
+	struct drm_display_mode *drm_mode;
 	int n = 0;
 
 	for (mode = ch7006_modes; mode->mode.clock; mode++) {
@@ -236,9 +237,11 @@ static int ch7006_encoder_get_modes(struct drm_encoder *encoder,
 		    ~mode->valid_norms & 1<<priv->norm)
 			continue;
 
-		drm_mode_probed_add(connector,
-				drm_mode_duplicate(encoder->dev, &mode->mode));
+		drm_mode = drm_mode_duplicate(encoder->dev, &mode->mode);
+		if (!drm_mode)
+			continue;
 
+		drm_mode_probed_add(connector, drm_mode);
 		n++;
 	}
 
-- 
2.34.1

