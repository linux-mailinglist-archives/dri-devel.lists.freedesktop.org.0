Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA30891295A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06BC10F1F1;
	Fri, 21 Jun 2024 15:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="FUL4AMJL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f98.google.com (mail-ej1-f98.google.com
 [209.85.218.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37AF10F1E3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:33 +0000 (UTC)
Received: by mail-ej1-f98.google.com with SMTP id
 a640c23a62f3a-a6fd513f18bso78459566b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983292; x=1719588092;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RldGIEEllNIV4EGABqgzjNJrsTpOsfjwSHsp4z2iitA=;
 b=FUL4AMJLm0V1R8of/h0TJuSR+rnfLZcvcLzBd5QGZrkE0HZ5ItEUfCFTfHrZ/+7KUQ
 pGTSDUFO1CwmagnKudmN7Cd9CbCv/hmfI+/1eM0q6LhV9cAwUu94Rydt9jJm3sUTzJNL
 5VvFyxILubv6vA/mZEdyZeJG8qdt5+J8l9ZcB/ImJZHJ+AtplKOdaScsIjXET1WqkXLC
 xCVjkoAMGHyOWitl1KtnqCpWcL2tvn6huBnceU2yaAaBEAaZFvtDYdRp2fYsXgiMpeez
 dkUaV0rPtxqZYQ/ufjsEZ/W09eZcH5sB3FnRTg8cDCGdC95Q2Hj1Afwbdhm+Brryuh7Q
 v2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983292; x=1719588092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RldGIEEllNIV4EGABqgzjNJrsTpOsfjwSHsp4z2iitA=;
 b=aLPK22hGNoaLjRdv5ky5KKHasriFPYKcQucOfGk2rGEVY3r2DFQWZtYhDoL3XP5Lj5
 0a5xo18wgHXY2psQEtqkHG4haRFU0X/6BTaLXtd3SVnE11nXgu/Mmu65v/PeHowBct+m
 gJJdRdEIay2+CRvnFhIdoViWK8gqBwK42cmuUQeqgUk7WI/sr1ePphNx9upt9eARm8is
 XaLHdmxXE9pXiCbzI9qk2OeEy3Zk7s5Ag9J5+zZAqCnrvdCujUt49kDs71aOgDM8XkQN
 rJNjIhuuKkxs6r8ScL/Ai5L3N8mvFKeVe7ZsQVwvKfYcOs43kTNsCwTwSQZScYbywfr8
 S/3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCURgc08YyQafbLZ68bI+CGtPK195gAsPaZ7Wz8kqPY/6r9UIqf/HTPHn79TkX7hQKK4bFqixZF5PQQh3CBEbqjT6rgDB64SvdTVM7/7G6YF
X-Gm-Message-State: AOJu0YzU5nRRVO357JpSBxIPkZWGDhuL6TalNY9A+RPvCmVnH2OuOpZw
 K0Vci8fGFWo4KrSwTod4vrO1eYMDCp6wLRvLOjOS7nQqOUucZBAQzPqHyJ0xV+qgF1xoPzNYVp1
 K8uw1kEvlHMv/n+Bm64cuyUPfauJF2Wc3
X-Google-Smtp-Source: AGHT+IGsMGMPsik0V1lBhNOSBj5LSmd+YiU8+QxnRRKH2Bvthg23FIDjo7uHL/16ZH61MPbYY7jJAi3Wx4Qw
X-Received: by 2002:a17:907:1682:b0:a6f:98b6:36e with SMTP id
 a640c23a62f3a-a6fab605048mr709466266b.11.1718983292170; 
 Fri, 21 Jun 2024 08:21:32 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6fcf5602fcsm5596366b.198.2024.06.21.08.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:32 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 03/31] drm/vc4: crtc: Force trigger of dlist update on
 margins change
Date: Fri, 21 Jun 2024 16:20:27 +0100
Message-Id: <20240621152055.4180873-4-dave.stevenson@raspberrypi.com>
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

When the margins are changed, the dlist needs to be regenerated
with the changed updated dest regions for each of the planes.

Setting the zpos_changed flag is sufficient to trigger that
without doing a full modeset, therefore set it should the
margins be changed.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 15 +++++++++++----
 drivers/gpu/drm/vc4/vc4_drv.h  |  7 +------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 8b5a7e5eb146..1d54176cf811 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -735,10 +735,17 @@ int vc4_crtc_atomic_check(struct drm_crtc *crtc,
 		if (conn_state->crtc != crtc)
 			continue;
 
-		vc4_state->margins.left = conn_state->tv.margins.left;
-		vc4_state->margins.right = conn_state->tv.margins.right;
-		vc4_state->margins.top = conn_state->tv.margins.top;
-		vc4_state->margins.bottom = conn_state->tv.margins.bottom;
+		if (memcmp(&vc4_state->margins, &conn_state->tv.margins,
+			   sizeof(vc4_state->margins))) {
+			memcpy(&vc4_state->margins, &conn_state->tv.margins,
+			       sizeof(vc4_state->margins));
+
+			/*
+			 * Need to force the dlist entries for all planes to be
+			 * updated so that the dest rectangles are changed.
+			 */
+			crtc_state->zpos_changed = true;
+		}
 		break;
 	}
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 697e9b7c9d0e..717fd1140561 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -598,12 +598,7 @@ struct vc4_crtc_state {
 	bool txp_armed;
 	unsigned int assigned_channel;
 
-	struct {
-		unsigned int left;
-		unsigned int right;
-		unsigned int top;
-		unsigned int bottom;
-	} margins;
+	struct drm_connector_tv_margins margins;
 
 	unsigned long hvs_load;
 
-- 
2.34.1

