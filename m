Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9759912969
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C34310F1F0;
	Fri, 21 Jun 2024 15:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="kCTJb5et";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f97.google.com (mail-wm1-f97.google.com
 [209.85.128.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8B010F1EE
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:47 +0000 (UTC)
Received: by mail-wm1-f97.google.com with SMTP id
 5b1f17b1804b1-4217136a74dso18124705e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983305; x=1719588105;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vWGmb6l1SHcNYIDLYAmsjh4d+xv8ubmxXT21om5fHcM=;
 b=kCTJb5eto8kYBAzctL0+l1n/LCEgi2+ylwuF78lKANS69Y4kBVA1B5zEx2iZBnbhfa
 BflGeZFBkY3QZUrS4nD90WDec09v3gQt4c2kVdo/eVz7yXD99Bt+IPWLqma81qLuiOWY
 zFTsZuADHrNXfZS5uCAMhbZicy9i+vgcr6V1dcbnApc413VD5v/erR4lOvF4mIIoYzeT
 R62qGtb9Xg0FJWmJqbg+mo8daP+5NBRMSLvjDfqnX9cUFsk/6Ud6Pks25EYlZ8g8GdLz
 9vlU3CXU4VtUJiFtb18QQaRCFVn8rtMn/H7BLir0qxqVmaO8PmTThmmXgwWVKx7H5Kza
 E15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983305; x=1719588105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vWGmb6l1SHcNYIDLYAmsjh4d+xv8ubmxXT21om5fHcM=;
 b=bnrdCBTkIZ7QifnUOyfjd200/Yxc0hsEaHrm5sIjSL9r+OeBWDXDtoFQYyAyKvw5kU
 0v77GmVLEqpmaY3tt+JdObzag4DrbQerJIwpA/XemNb4+9S3xlW9YX5l4d7WZY7QbZdQ
 BBEW5KRh47DxJUGtYVR6g5V2OGaWEzOl2e7zmhQLCn+w23y8ZlGDt6AosXgZK2yH5Nwo
 XZzLYo1qKrk+YJJdqw8UfxFI5jJrLjkHboIgHwYgCVrRpDrhy6OGmfGYthZjDp17KzCY
 ADhXacWIs5m670KGbQocc7c5imVi7adpFb2ktA34eTdm4Hgo6+c93yeRZjwRs5qMMzdS
 0LLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUib0cR3CbQqP1vwlmVHrnYOVjN14rjeq/G2Rms+a/2t77oBUPn17N804fHeoSC8pIKMihjQ0njhUWn6lWiTXa67Kxbxyjoq8tYe8o+BW58
X-Gm-Message-State: AOJu0YyzDOShlwiVr79JKsMBW3PinFFBEkmt9lBVKVYb5fMw7Vc1W94v
 Uaqd7N/CiJEeY3014nwDWVfq6y7LKFdW/0/CBi1l0Lxvj7AmU93i56A0qW2820adZStxe2Kcj9C
 WzcInGyDi8HLHMsygzNA2RhCMLvKifj3I
X-Google-Smtp-Source: AGHT+IGcGH3oQzCCStpFga54qZZCqs8a+Q28zbON+nzQSUR+YN7vPiIqa/HyfknCOQlioDQk0Qi+kKnwkMQ+
X-Received: by 2002:a05:600c:5c4:b0:421:5ada:c137 with SMTP id
 5b1f17b1804b1-4247529b439mr63667075e9.33.1718983305569; 
 Fri, 21 Jun 2024 08:21:45 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-4247d210ec9sm4819325e9.44.2024.06.21.08.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:45 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 27/31] drm/vc4: hvs: Rework LBM alignment
Date: Fri, 21 Jun 2024 16:20:51 +0100
Message-Id: <20240621152055.4180873-28-dave.stevenson@raspberrypi.com>
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

With the introduction of the support for BCM2712, the check of whether
we're running on vc5 or not to compute the LBM alignment requirement
doesn't work anymore.

Moreover, the LBM size will need to be computed in words for the
BCM2712, while we've had sizes in bytes so far.

Aligning on either 64 or 32 words is thus fairly harmful on BCM2712, so
let's just explicitly align the size when needed, and then call
drm_mm_insert_node_generic() with an alignment of 1.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index a4965226595d..4c61ef4f4142 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -756,6 +756,11 @@ static int vc4_plane_allocate_lbm(struct drm_plane_state *state)
 	if (!lbm_size)
 		return 0;
 
+	if (vc4->gen == VC4_GEN_5)
+		lbm_size = ALIGN(lbm_size, 64);
+	else if (vc4->gen == VC4_GEN_4)
+		lbm_size = ALIGN(lbm_size, 32);
+
 	drm_dbg_driver(drm, "[PLANE:%d:%s] LBM Allocation Size: %u\n",
 		       plane->base.id, plane->name, lbm_size);
 
@@ -771,8 +776,7 @@ static int vc4_plane_allocate_lbm(struct drm_plane_state *state)
 		spin_lock_irqsave(&vc4->hvs->mm_lock, irqflags);
 		ret = drm_mm_insert_node_generic(&vc4->hvs->lbm_mm,
 						 &vc4_state->lbm,
-						 lbm_size,
-						 vc4->gen == VC4_GEN_5 ? 64 : 32,
+						 lbm_size, 1,
 						 0, 0);
 		spin_unlock_irqrestore(&vc4->hvs->mm_lock, irqflags);
 
-- 
2.34.1

