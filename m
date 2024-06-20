Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE97910A5E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF1F10EA88;
	Thu, 20 Jun 2024 15:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="O8PE/VG8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f99.google.com (mail-lf1-f99.google.com
 [209.85.167.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F06210EA82
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:46:46 +0000 (UTC)
Received: by mail-lf1-f99.google.com with SMTP id
 2adb3069b0e04-52c89d6b4adso997072e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898404; x=1719503204;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SKete66q0aQ8ctxPqks3yVwM2OF75cFeF/3LngKskhw=;
 b=O8PE/VG8rtQACQrDwoJHH7/VEdULz3JP4lZztAwgpxMCQbadlkTbDgOfpG/JvhOIJi
 QNAWLW++SXyj2gPCZN9Ak8FQbOMFJ9fjgmh9TzJlvD452o7TQyD2G+OL1FqcEjeMe7aJ
 CD6kR5rn85RqBPPR1nibdypR6C1MpWqCJ+GjHdC+AN6BFM7cOmz2oBl+neVpq8j/TFTd
 8qeSss9AgpaSZgRrSicowTZdFL8jO5j3hkZVNNNfJ3vdFzGuqlG9gUeK+SBJHXtozJ6L
 WesHFqLcNPzhX8Gh6R3+C4Ry/AiGnkajPSd8J5ZzCeRqeg90kPaoKoSR4MMn5VBr3Mb4
 2khg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898404; x=1719503204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SKete66q0aQ8ctxPqks3yVwM2OF75cFeF/3LngKskhw=;
 b=KMW8WzjvYv3c337nF7y5VK6ydu3tYsRsuHb0UqSrWT8RxZQBdJwgpDP2HS2pIqxki1
 mjt1e2RceC8IgqbZF5FIWwFOW7PWcZjIGBEr9d6WuYgsFYn+lxihCoSO2AN3ifcMUjfS
 9WlZtW9Mot/JYwGp1WcXQS+hb/PHEvIOx0zalAK8i9RQfw0YXQoAJbnZaSeqrWAUc+2/
 9fTVV/ngydKtoF8mbhoNAx/CRghwYq/WkEigU7R1MXFSe0KFOpGYzt0no9o8cA29WlVi
 VA76X0O+Esfb2j9niVLrHAeqNhCpChoCge88H+ZPULarc+teYvBgSASTtZloUz3U26j9
 53Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5eHtqSBtHqd3SETH4EL6oEfsHGfBHrsvtcuOTI1G3xnh+odjXbsJRSsGVLISCj0De3gexXLJmGbLv7Ax0Vz3AcbRDDgqlC84+4CibCHMr
X-Gm-Message-State: AOJu0YyvsAVSxR8SjBOVdbw+nbJTzHXSz/hMyzXjuw1Fd1HAPus9x8ZT
 Rg7APfS2xI+WL9ByRdMPI/p+rgvzlU1AHsFc6RDJGGOWEWhX4VpiptHNWBnQfx8t6zyZcjldxMR
 gFdbOe4e8t26QWKPXE7PLy2SxKPTs0C5/
X-Google-Smtp-Source: AGHT+IGX6g5c4eHzHqJhYuybUZFSkVnIe3EZSUxt5m/kNBxg9v9zZRpyDTWMbjwzfxrkCKx8l4hN9bUuoV97
X-Received: by 2002:a05:6512:208a:b0:52c:b606:2b2 with SMTP id
 2adb3069b0e04-52ccaa97148mr2882021e87.46.1718898404384; 
 Thu, 20 Jun 2024 08:46:44 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-4247d0c090esm3214475e9.20.2024.06.20.08.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:46:44 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <maxime@cerno.tech>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 10/31] drm/vc4: hvs: More logging for dlist generation
Date: Thu, 20 Jun 2024 16:46:11 +0100
Message-Id: <20240620154632.4125308-11-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
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

From: Maxime Ripard <maxime@cerno.tech>

DLIST generation can get pretty tricky and there's not a lot of debug in
the driver to help. Let's add a few more to track the generated DLIST
size.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 267c9fde7362..189d00fcf4c2 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -456,11 +456,21 @@ int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	if (hweight32(crtc_state->connector_mask) > 1)
 		return -EINVAL;
 
-	drm_atomic_crtc_state_for_each_plane_state(plane, plane_state, crtc_state)
-		dlist_count += vc4_plane_dlist_size(plane_state);
+	drm_atomic_crtc_state_for_each_plane_state(plane, plane_state, crtc_state) {
+		u32 plane_dlist_count = vc4_plane_dlist_size(plane_state);
+
+		drm_dbg_driver(dev, "[CRTC:%d:%s] Found [PLANE:%d:%s] with DLIST size: %u\n",
+			       crtc->base.id, crtc->name,
+			       plane->base.id, plane->name,
+			       plane_dlist_count);
+
+		dlist_count += plane_dlist_count;
+	}
 
 	dlist_count++; /* Account for SCALER_CTL0_END. */
 
+	drm_dbg_driver(dev, "[CRTC:%d:%s] Allocating DLIST block with size: %u\n",
+		       crtc->base.id, crtc->name, dlist_count);
 	spin_lock_irqsave(&vc4->hvs->mm_lock, flags);
 	ret = drm_mm_insert_node(&vc4->hvs->dlist_mm, &vc4_state->mm,
 				 dlist_count);
-- 
2.34.1

