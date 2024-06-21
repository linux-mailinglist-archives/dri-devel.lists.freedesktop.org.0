Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE95591296A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3AB10F1F7;
	Fri, 21 Jun 2024 15:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="OFAvYAXu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f97.google.com (mail-ej1-f97.google.com
 [209.85.218.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E190010F1E6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:42 +0000 (UTC)
Received: by mail-ej1-f97.google.com with SMTP id
 a640c23a62f3a-a6efe62f583so210672866b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983301; x=1719588101;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JUcoJYmxn8ZjjlN+151pT+WbRnpSNWHCL5DiyI9wH6M=;
 b=OFAvYAXu43gfC5+vTzdSFhgaM7avdHW4s69lkW1kQSW+JBnqXvd7nu7Tzn+fSNtP4/
 1KFiV2lWEnLP6GSiy0xbSo9+zvoXh3HvG9/9/dVeIuoL6ySOdlNAvrNI1LK5sKlybU9o
 IztRyQeDNByKOsw1bBx1IK8oAD/Pi2X8IVH12dWdIei6gWbFCxbm5RpUw1riEFHamoVl
 pl5qnv9YkbSKJ4WaYkjOXA6fimSfF2lA7EJ3CPzNXZaAMw2pRXPaSoCQy7qX91Rip6bV
 h791eCtbAevUl3Obrv79DexAVlrz9MQhOIUG5x5gorOStYsceJfX4010XirIUZZXAJc1
 ggpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983301; x=1719588101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JUcoJYmxn8ZjjlN+151pT+WbRnpSNWHCL5DiyI9wH6M=;
 b=giJwVbwSonMYzXomzDJnQj80n9sC/qDsLCBkdUwBNPxZZpSvVeeqrPcrB5Ut1YXEjS
 Wt524siLfT0nWElj7cgGzi3zeIvFAytqQZG1dxIwVsNHqutADu96SxWsx6w/cDgzXRvf
 Q+5ZGsEeyF7hPyucHC9cPh9NHX2+Fu2YDl47ksQTBRbwuo+0ujsyGZq1XDwMDnuQ2baF
 4XwkThwSsD4NgN9GC8AZcaqyh6m0srLKxrd5xcRq7ZP3nuZMRW2tqrgGF410WBTOnQjj
 39OKPbqWeryZ+rXmOplY/v1bqMckeZ0cMEcgE+0mj8PS59PJeepOnNkE5WUDqm0xGX4c
 tPxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUErHolHyiCRyVtJm9vfAEygXAUhp41LhmrRjPJweAuKb8TjHOIoxYCY1suMuAXQCKQC2QJRVA6fQiisPnOLMvBV+2yIE5+0HhP8GKrQvnz
X-Gm-Message-State: AOJu0YzC4I/iEgCrbqoqziM8X7l53TM+rdvNr33VPTS7F5yY4QWzt+A0
 zMEGQzelZNEy3I87q9aC3b7aBBioYYy2f75A+u9tSWZ0icxRsj11R+FPH+v8rQekuNl9EnQdaIU
 EcZ5t4JFNoFqgaWn3aycFGOK8QaYTA+B0
X-Google-Smtp-Source: AGHT+IFEQqgCellWTmwqe4OHu4E4Hrylm2gTNwU2BvlLlfvnUMK80k7gwESURG5m6JcWign353cydLTl1PTB
X-Received: by 2002:a17:907:cc1f:b0:a6f:5ef5:2f63 with SMTP id
 a640c23a62f3a-a6fab6171fcmr472140266b.18.1718983301449; 
 Fri, 21 Jun 2024 08:21:41 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6fcf5492b1sm5548466b.137.2024.06.21.08.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:41 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 19/31] drm/vc4: hvs: Remove ABORT_ON_EMPTY flag
Date: Fri, 21 Jun 2024 16:20:43 +0100
Message-Id: <20240621152055.4180873-20-dave.stevenson@raspberrypi.com>
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

From: Dom Cobley <popcornmix@gmail.com>

ABORT_ON_EMPTY chooses whether the HVS abandons the current frame
when it experiences an underflow, or attempts to continue.

In theory the frame should be black from the point of underflow,
compared to a shift of sebsequent pixels to the left.

Unfortunately it seems to put the HVS is a bad state where it is not
possible to recover simply. This typically requires a reboot
following the 'flip done timed out message'.

Discussion with Broadcom has suggested we don't use this flag.
All their testing is done with it disabled.

Additionally setting BLANK_INSERT_EN causes the HDMI to output
blank pixels on an underflow which avoids it losing sync.

After this change a 'flip done timed out' due to sdram bandwidth
starvation or too low a clock is recoverable once the situation improves.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 1 +
 drivers/gpu/drm/vc4/vc4_regs.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 680e40a688a5..fa1f94e29871 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1592,6 +1592,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 		   VC4_HD_VID_CTL_CLRRGB |
 		   VC4_HD_VID_CTL_UNDERFLOW_ENABLE |
 		   VC4_HD_VID_CTL_FRAME_COUNTER_RESET |
+		   VC4_HD_VID_CTL_BLANK_INSERT_EN |
 		   (vsync_pos ? 0 : VC4_HD_VID_CTL_VSYNC_LOW) |
 		   (hsync_pos ? 0 : VC4_HD_VID_CTL_HSYNC_LOW));
 
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 8ac9515554f8..c55dec383929 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -777,6 +777,7 @@ enum {
 # define VC4_HD_VID_CTL_CLRSYNC			BIT(24)
 # define VC4_HD_VID_CTL_CLRRGB			BIT(23)
 # define VC4_HD_VID_CTL_BLANKPIX		BIT(18)
+# define VC4_HD_VID_CTL_BLANK_INSERT_EN		BIT(16)
 
 # define VC4_HD_CSC_CTL_ORDER_MASK		VC4_MASK(7, 5)
 # define VC4_HD_CSC_CTL_ORDER_SHIFT		5
-- 
2.34.1

