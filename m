Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F95F910A7B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0851110EAA1;
	Thu, 20 Jun 2024 15:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="HeBWnync";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com
 [209.85.128.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B460210EAA3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:47:12 +0000 (UTC)
Received: by mail-wm1-f99.google.com with SMTP id
 5b1f17b1804b1-42108856c33so13603555e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898431; x=1719503231;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JVlSfq2HgH8Tz7va7OsgZAtrT7oLGLMV1tsC/J83HUA=;
 b=HeBWnynct3KUZj8k7IGarpXDSBQxpExuhQUx8IS0pGsUV8+2BJx0gs9FU5MyhdTQ+V
 cKO6wDYLkl5CVTv0Te3dA/0vXS5frlsG8YDbW2uLZsSdDniUHeBUsjaNqPGpKQR5/byd
 kdmZgKz6LydazPKNmfO/AQB5lTV9a49ggwnvgprokUVpoOocy/NVsg/o0Red38qEieVg
 xHEBH/3djVy0e0cPcd5fMA8OCpda0gEx/lHAKymSq8N8Y+UPiXcvi84Vyitef9qQz3Ak
 mAARN8vR6w3tFwUABzwBdiBJ30dkwKSosG5oUjoJrAfHmM1pmVaBiOnqFev8GphymoK7
 yFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898431; x=1719503231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JVlSfq2HgH8Tz7va7OsgZAtrT7oLGLMV1tsC/J83HUA=;
 b=mVKpqNDBIBGbJMYE+QUvPcZnyPy3xhWTg8djQXjnDepxdacFLppF4GW2d/tfvkEBR/
 mFa+FeeBis5r+EP2FfIdrX7Zpii6493QomLOP+GTRCKvU5jT4pvu+XaOJoyli5TLWYvl
 U/D8mkFDa/p/Kw3h8Kitua/01knO/qRoC8vjIxRSCcik+i4gbooLFPRU3Nrh1qypYgAj
 OwY8tkR0ATDuhYjR0DGLYjMEeilktWnt2ItujU5dBS3jpZCwc2SOd0f65U86N5XPsWFC
 UA+q+BnhbmhZSI88SUEbDqhi3Ftthic6J1EAtWy833ZxGpQWY+DHNLIfopXdkldqB3wu
 wOig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU0WsrobzgzDyO1MHA2s1MxBpVBWGUBJpKBKnsU0cqx8yPE9EVadmgEvgdWsvA/wktC/C48jeq9aJOSvHeiSw7ZMXxwoMW6ssqDXo3EGhg
X-Gm-Message-State: AOJu0YxequSWuDjShk0hefprD8N9S1/DYLafiWGAGxNtwo0hMbrJpcyZ
 +LxaK/ePPlJYKpncpeu7rYWPqGEVM65sp5fbzRdLaVnxydOVP6KLZac9ajJSZ3vs2wXZ+/7J4+I
 Ita+r74OLy7KKn9m7q3hiWgo7K3suV4Do
X-Google-Smtp-Source: AGHT+IH/JFH2AYFu30SawAtuFxCj+L1RSqrKtoKd6ytjQfHtmD6RjEhrlfHF2AXzwGUxz1hafe/9WxhMrsrg
X-Received: by 2002:a05:600c:8a9:b0:421:def3:b0d9 with SMTP id
 5b1f17b1804b1-42474d1a2bcmr57999695e9.7.1718898431240; 
 Thu, 20 Jun 2024 08:47:11 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-4247d0bfdbasm3288025e9.15.2024.06.20.08.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:47:11 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <maxime@cerno.tech>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 23/31] drm/vc4: hvs: Use switch statement to simplify
 vc4_hvs_get_fifo_from_output
Date: Thu, 20 Jun 2024 16:46:24 +0100
Message-Id: <20240620154632.4125308-24-dave.stevenson@raspberrypi.com>
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

