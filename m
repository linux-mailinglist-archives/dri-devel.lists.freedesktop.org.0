Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF85912965
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:22:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BF810F1EE;
	Fri, 21 Jun 2024 15:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="k1FkpU0q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f228.google.com (mail-lj1-f228.google.com
 [209.85.208.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDF510F1EB
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:44 +0000 (UTC)
Received: by mail-lj1-f228.google.com with SMTP id
 38308e7fff4ca-2ec50d4e46aso5785631fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983303; x=1719588103;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vah5T3STMeYAsZCPoSKiEHrhTnJBqttm9TdoY8rEf0E=;
 b=k1FkpU0qx1enmGEG9tQseWYY4nKkRpk+pUtsA1D0C613UBpAtPUUpNul1BCjckBvqa
 PtPGAdzPcTRSDmuDP/i2m6wws5DPpN35VXL5ICkEQeFckq5rKiW3gNG+1cGABEHF06XF
 ZoqVfyKbkgmy3/xUU0Ytjni0SCynGEKdyxn6VW9T7ay+0/X/FqwOb2/0ocxS/sk/UIUg
 RWNY5+mdA6b8v8nUNBZrWw7l7r4H9yVZHepX+qpW9MUhRf00w6A7S+d5PKGXReZ52RDD
 Ymg7U7F8dsfhFjkV6jK3pY2Ulu5kT+bCqvTMbRxaHAP9s1fcszc3M5qhidFaYYVOGbdf
 ClyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983303; x=1719588103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vah5T3STMeYAsZCPoSKiEHrhTnJBqttm9TdoY8rEf0E=;
 b=THjlW6+dGcnX3XmplvyjARMqTmvlN3hRTo0iSuw6dSs+keIgZzgBVZKuD+LF8ftVDu
 /jUsgF2ZYjihpPO6o00rtHWKgLUWsFO1y5deDaZx38hzboUEK7X68yrDToFfjJuxSmSH
 ympA51ZrWoEuVXHdPcyk3AtuznzxZwofcO6h0SJmzaEplYS4/9wgxKMM5vJvVl6Tl2eo
 abnucpkS5dLZMiHSQZf9kA4N0XyM0EHSAmS5mfCvC3Qaq0k8qnkzr5j39FwJ9ziRiKj/
 RJhTENYgj4XftBWg5/xe7LPQ54uQBQ0x3LhSHUOK3H+UrdLQopOjT+sbsrSqVBOu0MEV
 9Srg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX9I2t2AHKP3f0Tx/yjgSQFzwFBG/6Qi+JrADVxe+oTEDMc6GFQz+yNOfV2UTqyES/hOekq7jA1tGmDTl0y3hfOnJHvtSny1be57jFydhG
X-Gm-Message-State: AOJu0YxB4u23USOP1ioi6TOtSYGlcoPyANy9FnIYxbd7s2n64FcjFFiu
 OVl5QP6D7gJlglgJrGN41IjJuMkZL3nwLohpRfuvoMv2yf9tGNhdAUUqBuIsUaF2s5HaKmbMqAX
 A5IQZURzWviZnUcpcHhjlGQAAmCuels5r
X-Google-Smtp-Source: AGHT+IFXOgnW7qhKAHy+W4pCm4vmr7jdOaylIYaerGl2u1MIOHdO9HyKHDp61HrETIPjAM0hvAwqDIDSrBUD
X-Received: by 2002:a2e:9e14:0:b0:2eb:efff:771e with SMTP id
 38308e7fff4ca-2ec3cea1b23mr57968311fa.29.1718983303035; 
 Fri, 21 Jun 2024 08:21:43 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-424817a9eadsm1079885e9.28.2024.06.21.08.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:43 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 22/31] drm/vc4: hvs: Use switch statement to simplify
 vc4_hvs_get_fifo_from_output
Date: Fri, 21 Jun 2024 16:20:46 +0100
Message-Id: <20240621152055.4180873-23-dave.stevenson@raspberrypi.com>
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

Since we'll support BCM2712 soon, let's move the logic behind
vc4_hvs_get_fifo_from_output() to a switch to extend it more easily.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 77 +++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 7380a02a69a2..922e5f73f5d9 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -296,53 +296,60 @@ int vc4_hvs_get_fifo_from_output(struct vc4_hvs *hvs, unsigned int output)
 	u32 reg;
 	int ret;
 
-	if (vc4->gen == VC4_GEN_4)
+	switch (vc4->gen) {
+	case VC4_GEN_4:
 		return output;
 
-	/*
-	 * NOTE: We should probably use drm_dev_enter()/drm_dev_exit()
-	 * here, but this function is only used during the DRM device
-	 * initialization, so we should be fine.
-	 */
+	case VC4_GEN_5:
+		/*
+		 * NOTE: We should probably use
+		 * drm_dev_enter()/drm_dev_exit() here, but this
+		 * function is only used during the DRM device
+		 * initialization, so we should be fine.
+		 */
 
-	switch (output) {
-	case 0:
-		return 0;
+		switch (output) {
+		case 0:
+			return 0;
 
-	case 1:
-		return 1;
+		case 1:
+			return 1;
 
-	case 2:
-		reg = HVS_READ(SCALER_DISPECTRL);
-		ret = FIELD_GET(SCALER_DISPECTRL_DSP2_MUX_MASK, reg);
-		if (ret == 0)
-			return 2;
+		case 2:
+			reg = HVS_READ(SCALER_DISPECTRL);
+			ret = FIELD_GET(SCALER_DISPECTRL_DSP2_MUX_MASK, reg);
+			if (ret == 0)
+				return 2;
 
-		return 0;
+			return 0;
 
-	case 3:
-		reg = HVS_READ(SCALER_DISPCTRL);
-		ret = FIELD_GET(SCALER_DISPCTRL_DSP3_MUX_MASK, reg);
-		if (ret == 3)
-			return -EPIPE;
+		case 3:
+			reg = HVS_READ(SCALER_DISPCTRL);
+			ret = FIELD_GET(SCALER_DISPCTRL_DSP3_MUX_MASK, reg);
+			if (ret == 3)
+				return -EPIPE;
 
-		return ret;
+			return ret;
 
-	case 4:
-		reg = HVS_READ(SCALER_DISPEOLN);
-		ret = FIELD_GET(SCALER_DISPEOLN_DSP4_MUX_MASK, reg);
-		if (ret == 3)
-			return -EPIPE;
+		case 4:
+			reg = HVS_READ(SCALER_DISPEOLN);
+			ret = FIELD_GET(SCALER_DISPEOLN_DSP4_MUX_MASK, reg);
+			if (ret == 3)
+				return -EPIPE;
 
-		return ret;
+			return ret;
 
-	case 5:
-		reg = HVS_READ(SCALER_DISPDITHER);
-		ret = FIELD_GET(SCALER_DISPDITHER_DSP5_MUX_MASK, reg);
-		if (ret == 3)
-			return -EPIPE;
+		case 5:
+			reg = HVS_READ(SCALER_DISPDITHER);
+			ret = FIELD_GET(SCALER_DISPDITHER_DSP5_MUX_MASK, reg);
+			if (ret == 3)
+				return -EPIPE;
 
-		return ret;
+			return ret;
+
+		default:
+			return -EPIPE;
+		}
 
 	default:
 		return -EPIPE;
-- 
2.34.1

