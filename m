Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD8491295D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CCF10F1EB;
	Fri, 21 Jun 2024 15:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="HTDb7MLh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f98.google.com (mail-ej1-f98.google.com
 [209.85.218.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2D810F1E5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:38 +0000 (UTC)
Received: by mail-ej1-f98.google.com with SMTP id
 a640c23a62f3a-a6f1da33826so274084066b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983297; x=1719588097;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=boWmX/zHuDKS6o0+GVTV34Q95J/n+9X9ckLwUl//mHI=;
 b=HTDb7MLhgxnrAhd6GEsKCGVS1+WeH2acSh/5qgTg4E272McKCqcEEGzI2LZ2pQAgvr
 PZuax/EDWHwejo0U0q6/6+nEDjAKt3+3/gKN9FPs5nUK1XTpGYxjETTs41bgoAi+PIBf
 7VZV+OIaatCLBwGlkBKzfK/5c8xMu17gFmJ3XR7TD6xz9XhsndKpoDSwYjuu3l2UcGia
 ZZPcedGUDstdMr9Fkls64qvn1iKawTUiK7v/0oW2hEpp40ijy0Su0FiBwfEKk7tBckhN
 Oj/dsyYXhUpyCUI+x0jJL4dM1UEMN3kkIlw/Nqd82NQ33bEi+Rulku1wBRC9Qb5p7wzI
 I66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983297; x=1719588097;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=boWmX/zHuDKS6o0+GVTV34Q95J/n+9X9ckLwUl//mHI=;
 b=vT20FEs2gnLgZjxadEazEnZZiekeRVeYA61CzxJEggH5QdmZNpU65k3Dy3YQLHuX54
 UvikcLVd8/l9vu+rqzC+oJyzZ/ymAt8clHiIlaos59ubPr7Gtw9Xu8tyiXIWQfxM9mX9
 Xg9XwAhuKX0u5KHK2wpl5VKGM+gOKgVPaQnrss24R+UynBaNGLqvvri2pE56b5xFPCu1
 EpD2pNGZJoo+tJZP8sIYm3on7D/PMezyuynFB3OLMuOOtOMUWto7GJpoFfLtF5dp/vPB
 EdYNhTvDy1KBEc+l0CVNjY/c9HcscnngcvWaFaZ3NYctpdQJmX5eKfbHpK5WMO4Kkkg6
 EgFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUQ9ouXHET3zSQ5W6Ak26UX31gS3ij/clODxaMezM/EoZtNE8mkWG08pLHbZSmVpv3noiS6KEuFJGCJq7o0vJ2Ak6+qwbfaAbdf2L+cSBE
X-Gm-Message-State: AOJu0YyCRJxh798oRhRLaB7R3DVrdJfsRjxWEpqnUQn7zJmAm4BaS+gV
 Y6GIsiZwLIpRsGXNMJx5ndbhMCRfTytr80rwzMqS1AMTkO9aQOGHA37okV4xlE1sZhBPAd8RW18
 +tcR8ahm0qrFFoPUYzljoW/HiBVCk6vy+
X-Google-Smtp-Source: AGHT+IFEiEho9ATCkM7lGOEWWBKE2DxDz/WKNvmrpW1cEPNs7I65ct65Sdbi80SpOnHmae5kEgR/mTgSweWM
X-Received: by 2002:a17:907:bb88:b0:a6f:2e80:6e04 with SMTP id
 a640c23a62f3a-a6fab62a888mr632026366b.19.1718983296863; 
 Fri, 21 Jun 2024 08:21:36 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6fcf56ee96sm5598066b.274.2024.06.21.08.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:36 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 11/31] drm/vc4: plane: Add more debugging for LBM allocation
Date: Fri, 21 Jun 2024 16:20:35 +0100
Message-Id: <20240621152055.4180873-12-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
References: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
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

From: Maxime Ripard <mripard@kernel.org>

LBM allocations need a different size depending on the line length,
format, etc.

This can get tricky, and fail. Let's add some more prints to ease the
debugging when it does.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index e4fcef11cf6f..16197c4b4b33 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -741,6 +741,7 @@ static int vc4_plane_allocate_lbm(struct drm_plane_state *state)
 {
 	struct drm_device *drm = state->plane->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
+	struct drm_plane *plane = state->plane;
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
 	unsigned long irqflags;
 	u32 lbm_size;
@@ -749,6 +750,9 @@ static int vc4_plane_allocate_lbm(struct drm_plane_state *state)
 	if (!lbm_size)
 		return 0;
 
+	drm_dbg_driver(drm, "[PLANE:%d:%s] LBM Allocation Size: %u\n",
+		       plane->base.id, plane->name, lbm_size);
+
 	if (WARN_ON(!vc4_state->lbm_offset))
 		return -EINVAL;
 
-- 
2.34.1

