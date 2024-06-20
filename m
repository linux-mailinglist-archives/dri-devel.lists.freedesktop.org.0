Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C14910A7F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A000010EAAA;
	Thu, 20 Jun 2024 15:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="pz+CzTLT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f226.google.com (mail-lj1-f226.google.com
 [209.85.208.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE9810EAA3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:47:13 +0000 (UTC)
Received: by mail-lj1-f226.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a6eso10201371fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898432; x=1719503232;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=14qTmjFLbA1GByRd1yyIdhNyl0ie+fffDIM9t1m1Sjs=;
 b=pz+CzTLTVUGkdsJSrcKw0zG87q2WE5B3a+sG0TUfXsZfgeIChmYuQYFiM/uflNrWSp
 GA02XLHnwAoNfGIvQosQeLCdEI1hAbvnx+gfJCIcKV8tBhhbDm5zMqn87clY/bjeCqRZ
 bA/SLrXWmDuETnV0WlyBfZUBFZZM5N8i1XAtBHUmPJrjUGARcScihH92sCAyrRfCvu3S
 QuOdQFNF5XDk+Xco5VhHp4vxTxjcmMDUGcLyGoA5Hnny26UqMQgHF1+QnRBF5N1zLpdl
 6Y4c97LALvZA+ujh83S/krvPU1DDgy0r1ecl0VnlQmdYQTAJNYPryKpeNK7hf5HtX4/N
 IC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898432; x=1719503232;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=14qTmjFLbA1GByRd1yyIdhNyl0ie+fffDIM9t1m1Sjs=;
 b=I7JbYMiqqdgrON6iU24zC9BmovMSzK3B3TtY/Ya4fii8p8FwSHTNjW4+PUhV9j2kgU
 XrwtzXpTBP4nGXm0HbTal7OySAmOHcJmOQx0uMkJ3axrX3JMy00wGYIUhqKYMhGOGGFP
 Au/A9jeaOqxuhnLXolpvvpJFFrHEgsCXX3z4b3K+ANVzRO+spbdk+2dEOWDXCvo9nvP0
 HelFHls0lHjh0h1oVRoZfuAZW+QgfzOK03h/Yb6o3FombObWRwCZ+V9IGMe0+RXk9esK
 kDleQDwUhYVE+JBskN4a1iz7kpXl2kufO7xCBgPVg3Y1OezC1z7V4Y9o5XXf4CxcDqnZ
 UbhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJOxM36gA31h0z7ywzG/dse6JcrAMFx20FOn3e8M0qrOcO+npGoGLHHdnho91Odg4qGvSJdLSCnHkf/tqJL4Za8KAKmE2r43rgCN0vHeNf
X-Gm-Message-State: AOJu0YzE0vtXj3sBus5ylUG1Q+auTEsdHcG66D65k6avjJ870qM/+vf7
 BKDMk2+T4DPwk5G5tQ5od165eoLbRjLB5Gnyl3gc2vbOygs8L1xXisL9Ba2SWfMZDL+FdZ7o0Da
 LOwWDXOEFw79QVJFyVLobWHaB4rCsiWL3
X-Google-Smtp-Source: AGHT+IHz9bZDGGT3q67psTYWRgknH3sAJk+ZoW30J+9RGiFtAaD+169YJ2p51cQfyaYFp7/U0EUk9brVAjUy
X-Received: by 2002:a2e:9b0a:0:b0:2ec:2583:2ba5 with SMTP id
 38308e7fff4ca-2ec3cfe8b1dmr36924861fa.36.1718898432075; 
 Thu, 20 Jun 2024 08:47:12 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-4247d1e1b35sm3312695e9.43.2024.06.20.08.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:47:12 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <maxime@cerno.tech>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 25/31] drm/vc4: hvs: Create cob_init function
Date: Thu, 20 Jun 2024 16:46:26 +0100
Message-Id: <20240620154632.4125308-26-dave.stevenson@raspberrypi.com>
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

Just like the HVS itself, the COB parameters will be fairly different in
the BCM2712.

Let's move the COB parameters computation and its initialisation to a
separate function that will be easier to extend in the future.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 128 ++++++++++++++++++++--------------
 1 file changed, 74 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index bab15827fce0..bd9ae25dbdcf 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -940,6 +940,77 @@ static int vc4_hvs_hw_init(struct vc4_hvs *hvs)
 	return 0;
 }
 
+static int vc4_hvs_cob_init(struct vc4_hvs *hvs)
+{
+	struct vc4_dev *vc4 = hvs->vc4;
+	u32 reg, top;
+
+	/*
+	 * Recompute Composite Output Buffer (COB) allocations for the
+	 * displays
+	 */
+	switch (vc4->gen) {
+	case VC4_GEN_4:
+		/* The COB is 20736 pixels, or just over 10 lines at 2048 wide.
+		 * The bottom 2048 pixels are full 32bpp RGBA (intended for the
+		 * TXP composing RGBA to memory), whilst the remainder are only
+		 * 24bpp RGB.
+		 *
+		 * Assign 3 lines to channels 1 & 2, and just over 4 lines to
+		 * channel 0.
+		 */
+		#define VC4_COB_SIZE		20736
+		#define VC4_COB_LINE_WIDTH	2048
+		#define VC4_COB_NUM_LINES	3
+		reg = 0;
+		top = VC4_COB_LINE_WIDTH * VC4_COB_NUM_LINES;
+		reg |= (top - 1) << 16;
+		HVS_WRITE(SCALER_DISPBASE2, reg);
+		reg = top;
+		top += VC4_COB_LINE_WIDTH * VC4_COB_NUM_LINES;
+		reg |= (top - 1) << 16;
+		HVS_WRITE(SCALER_DISPBASE1, reg);
+		reg = top;
+		top = VC4_COB_SIZE;
+		reg |= (top - 1) << 16;
+		HVS_WRITE(SCALER_DISPBASE0, reg);
+		break;
+
+	case VC4_GEN_5:
+		/* The COB is 44416 pixels, or 10.8 lines at 4096 wide.
+		 * The bottom 4096 pixels are full RGBA (intended for the TXP
+		 * composing RGBA to memory), whilst the remainder are only
+		 * RGB. Addressing is always pixel wide.
+		 *
+		 * Assign 3 lines of 4096 to channels 1 & 2, and just over 4
+		 * lines. to channel 0.
+		 */
+		#define VC5_COB_SIZE		44416
+		#define VC5_COB_LINE_WIDTH	4096
+		#define VC5_COB_NUM_LINES	3
+		reg = 0;
+		top = VC5_COB_LINE_WIDTH * VC5_COB_NUM_LINES;
+		reg |= top << 16;
+		HVS_WRITE(SCALER_DISPBASE2, reg);
+		top += 16;
+		reg = top;
+		top += VC5_COB_LINE_WIDTH * VC5_COB_NUM_LINES;
+		reg |= top << 16;
+		HVS_WRITE(SCALER_DISPBASE1, reg);
+		top += 16;
+		reg = top;
+		top = VC5_COB_SIZE;
+		reg |= top << 16;
+		HVS_WRITE(SCALER_DISPBASE0, reg);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -947,7 +1018,6 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_hvs *hvs = NULL;
 	int ret;
-	u32 reg, top;
 
 	hvs = __vc4_hvs_alloc(vc4, NULL);
 	if (IS_ERR(hvs))
@@ -1017,59 +1087,9 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	/* Recompute Composite Output Buffer (COB) allocations for the displays
-	 */
-	if (vc4->gen == VC4_GEN_4) {
-		/* The COB is 20736 pixels, or just over 10 lines at 2048 wide.
-		 * The bottom 2048 pixels are full 32bpp RGBA (intended for the
-		 * TXP composing RGBA to memory), whilst the remainder are only
-		 * 24bpp RGB.
-		 *
-		 * Assign 3 lines to channels 1 & 2, and just over 4 lines to
-		 * channel 0.
-		 */
-		#define VC4_COB_SIZE		20736
-		#define VC4_COB_LINE_WIDTH	2048
-		#define VC4_COB_NUM_LINES	3
-		reg = 0;
-		top = VC4_COB_LINE_WIDTH * VC4_COB_NUM_LINES;
-		reg |= (top - 1) << 16;
-		HVS_WRITE(SCALER_DISPBASE2, reg);
-		reg = top;
-		top += VC4_COB_LINE_WIDTH * VC4_COB_NUM_LINES;
-		reg |= (top - 1) << 16;
-		HVS_WRITE(SCALER_DISPBASE1, reg);
-		reg = top;
-		top = VC4_COB_SIZE;
-		reg |= (top - 1) << 16;
-		HVS_WRITE(SCALER_DISPBASE0, reg);
-	} else {
-		/* The COB is 44416 pixels, or 10.8 lines at 4096 wide.
-		 * The bottom 4096 pixels are full RGBA (intended for the TXP
-		 * composing RGBA to memory), whilst the remainder are only
-		 * RGB. Addressing is always pixel wide.
-		 *
-		 * Assign 3 lines of 4096 to channels 1 & 2, and just over 4
-		 * lines. to channel 0.
-		 */
-		#define VC5_COB_SIZE		44416
-		#define VC5_COB_LINE_WIDTH	4096
-		#define VC5_COB_NUM_LINES	3
-		reg = 0;
-		top = VC5_COB_LINE_WIDTH * VC5_COB_NUM_LINES;
-		reg |= top << 16;
-		HVS_WRITE(SCALER_DISPBASE2, reg);
-		top += 16;
-		reg = top;
-		top += VC5_COB_LINE_WIDTH * VC5_COB_NUM_LINES;
-		reg |= top << 16;
-		HVS_WRITE(SCALER_DISPBASE1, reg);
-		top += 16;
-		reg = top;
-		top = VC5_COB_SIZE;
-		reg |= top << 16;
-		HVS_WRITE(SCALER_DISPBASE0, reg);
-	}
+	ret = vc4_hvs_cob_init(hvs);
+	if (ret)
+		return ret;
 
 	ret = devm_request_irq(dev, platform_get_irq(pdev, 0),
 			       vc4_hvs_irq_handler, 0, "vc4 hvs", drm);
-- 
2.34.1

