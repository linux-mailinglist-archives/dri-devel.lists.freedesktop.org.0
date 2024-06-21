Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3EE912964
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB85310F1E5;
	Fri, 21 Jun 2024 15:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ct8n5NjM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f99.google.com (mail-ej1-f99.google.com
 [209.85.218.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684F110F1EA
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:36 +0000 (UTC)
Received: by mail-ej1-f99.google.com with SMTP id
 a640c23a62f3a-a6efae34c83so247779766b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983295; x=1719588095;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TD4ztjcRfEKkNOkWXGDw3RKYnHJNZ1bahXJyOX9OWiY=;
 b=ct8n5NjMECjsr+sKoINooqTUFO3inBkews/9j6e+rVmhedpGP45vdaJ+oQpRmfxXit
 UkLjwooZDYLf8DF0L0N4GUhRtj4EQoKbJTBwnHAXyKXmuyqOmqWEy/265lD3nJI3XyaO
 i+VZ9vOEUsq3Gm69ITj4tr4q9IpKn1K1h+I3RgLYfvF9latlG22XB6SRoCOGLTe1CAqr
 Vft0vMUTTY6O1W2QhofFAUCquyX8dmZazPv/tAezGX1v+dUUHo+TM9HHMRWfAKoV6BXp
 8UBCrSczIFMH6Vpc9BVRbkAEUsGXPkDOWLVi90wBzcLAKL3/ej66CVnOzH8/JYPflwTv
 i+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983295; x=1719588095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TD4ztjcRfEKkNOkWXGDw3RKYnHJNZ1bahXJyOX9OWiY=;
 b=fTRRWmolLS/UExSoj1j4ypwR5XbXAjpVi20+rXNnHSNdzE+RbwhHLDIb5gKn2y7O3K
 QYq3cDO9cW8IBh4hCwChzbYmU/GZGTJ2MwMCmVpEfvJfPvLkj4janpDkH0xEOgaFd2cn
 ALhms75i56IfDx3sA240U7SzfM8zFZsh9hRK+l3SBZtp8DSqDUenzZIp6cCaaDGgw1X6
 xLTeWox35TJNrjcUxUJ/fjq99TT1MmHEO10G+5F/WNf3NNA+z68kZDAGEbxN/dn/nh3F
 STBJjI0KO+q9PuiKjWf7YN9RjYutp5GwtfPlGVjImy5IPg5PRjQ790w0azksWO7DFd4/
 F4vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0OtzZykdd+ZS5AllvkIrJ425sMHWB/27YBO/ZCN38LaorGlbXSYPLJ3L9QC36UWCr0RQNyfQpRbqFgYaRiu11Gg1PtEgMBstOc6/IHSud
X-Gm-Message-State: AOJu0Yzm+yKY73sOwit7iuaSQmVeL11xCEcymgchN0s4R1/9S3PIECp/
 RBzP6T/aI61yvjTaMAnkoKpspk7Me4AfQhAjwmyt8R5tCyK+RqMvVu6EDFSWErMnJUR3Ub1DxlT
 dRocMN/FP+LBk7hiFr6k9OYArearXE8Cw
X-Google-Smtp-Source: AGHT+IHPwlyY7XlgTpmWELVNxxV6PiKZQlrgZYGlGYVP7IAdf1grmwUQ4b0/eJ389sqcTHK7vsjhiErzr4ib
X-Received: by 2002:a17:907:c31b:b0:a6f:56d2:8f0b with SMTP id
 a640c23a62f3a-a6fab60bb06mr506290266b.3.1718983294737; 
 Fri, 21 Jun 2024 08:21:34 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6fcf485e07sm5513366b.76.2024.06.21.08.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:34 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 07/31] drm/vc4: hdmi: Increase audio MAI fifo dreq threshold
Date: Fri, 21 Jun 2024 16:20:31 +0100
Message-Id: <20240621152055.4180873-8-dave.stevenson@raspberrypi.com>
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

Now we wait for write responses and have a burst
size of 4, we can set the fifo threshold much higher.

Set it to 28 (of the 32 entry size) to keep fifo
fuller and reduce chance of underflow.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 04d32dc3e98c..ad88915306f1 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2041,6 +2041,7 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	unsigned int sample_rate = params->sample_rate;
 	unsigned int channels = params->channels;
 	unsigned long flags;
@@ -2098,11 +2099,18 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 					     VC4_HDMI_AUDIO_PACKET_CEA_MASK);
 
 	/* Set the MAI threshold */
-	HDMI_WRITE(HDMI_MAI_THR,
-		   VC4_SET_FIELD(0x08, VC4_HD_MAI_THR_PANICHIGH) |
-		   VC4_SET_FIELD(0x08, VC4_HD_MAI_THR_PANICLOW) |
-		   VC4_SET_FIELD(0x06, VC4_HD_MAI_THR_DREQHIGH) |
-		   VC4_SET_FIELD(0x08, VC4_HD_MAI_THR_DREQLOW));
+	if (vc4->is_vc5)
+		HDMI_WRITE(HDMI_MAI_THR,
+			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICHIGH) |
+			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICLOW) |
+			   VC4_SET_FIELD(0x1c, VC4_HD_MAI_THR_DREQHIGH) |
+			   VC4_SET_FIELD(0x1c, VC4_HD_MAI_THR_DREQLOW));
+	else
+		HDMI_WRITE(HDMI_MAI_THR,
+			   VC4_SET_FIELD(0x8, VC4_HD_MAI_THR_PANICHIGH) |
+			   VC4_SET_FIELD(0x8, VC4_HD_MAI_THR_PANICLOW) |
+			   VC4_SET_FIELD(0x6, VC4_HD_MAI_THR_DREQHIGH) |
+			   VC4_SET_FIELD(0x8, VC4_HD_MAI_THR_DREQLOW));
 
 	HDMI_WRITE(HDMI_MAI_CONFIG,
 		   VC4_HDMI_MAI_CONFIG_BIT_REVERSE |
-- 
2.34.1

