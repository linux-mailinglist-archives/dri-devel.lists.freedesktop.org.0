Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C88B1D905
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 15:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335CC10E84E;
	Thu,  7 Aug 2025 13:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ZwLpU7EZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CF110E849
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 13:28:13 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-458baf449cbso9729915e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 06:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1754573292; x=1755178092;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/UjLlQ+L3bIru1QWf7Opm9SNHsuB1DBkMulE4apVSC4=;
 b=ZwLpU7EZM2T/uMRypiTjJbqRecPMu9x1xia5M8ZOOeA6HLtfeHsKyexZE2eJLM2yAY
 B+ek9D80py/zkiqXE7ZSKSPChSGLcY01VEPEJ1DQwbqw/v/T3UCDmX7O3RLfaWnSRO91
 drNYUqqm4je9CH1/oFws3Vf4nSDi/EvVLEzveg/+1TriJeLzFWIg1hkq0W91nDJQtWqt
 ojF91aoXCC1Ly7lk8DsxwKFVkpWUVaq+Vlj/tQmEIhSWJWrtqsppxNEgMpDTbVp9SGZr
 IbCYuFlvkfxO8LJZUnEtM+HgGVWI/sJHO68uBp4ZDRplawAWpMR0/v8bs3Qnsb0ke7PR
 FUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754573292; x=1755178092;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/UjLlQ+L3bIru1QWf7Opm9SNHsuB1DBkMulE4apVSC4=;
 b=wEqvibN/ooPGmbmI/QBWMB8YT3950R548VbAmloti3t4EQepNGzZLxWVc+PWg0Xtih
 klE9tMX8FVguc7oB3Cbf+V2DeL3I9U0yb5Wx+DshGViYuepVEQB6NtIAEea97zEzGoSm
 VJ299ZePFTrrHxedrmD1TGZ3pJjcVzZl8FyeUrseTQtnhl9/h01qufFtfhPp3wR5dbNg
 2mLzEWlhDF5MYKPAT+ZJIlsRxSp4xoq1pBG/FCMWnZ9ENzn9nH761xF9lY3u3malj4JC
 9PM+SHaXDdUsOlrfFOHeW9w82XYt/kurF9zX/CUQsaVHtUMh5bVZ9UHYeQx5kBz8DSjz
 Ikug==
X-Gm-Message-State: AOJu0YwM75RACgJuEk7HAlp4lokv2AjHb2ee+RItzkF3z5TW4w0b26Uk
 uOp8YCHBWa6MmBj+jYNPO6w3/M9awpziGHUcP2lZEgT2S6kv6hrTtgA+XQCpsQ2AEqQ=
X-Gm-Gg: ASbGncsj/0a6LxusiXnOukGA4K4gXAmku07AANGqZ0+HsiXI2WoIGc/QkJsm6oBHyRt
 cyiHt45ovWBLOuOfc3RvXO/iIRLeDLZk3RyFDm9c17sL3G7+yieaW1mE92+P8aCoGLTG6sVlVqv
 hzIUJLmpgbg4R8ZottGieRLuBpm0tbLNlmF8cc2wZkCLrv/BeeH2A6byz2xpqIo16A5oaUmMlFt
 ZAExUXoyZhpxiX3I8rOYOfkv3C9lDJ5KgbuiSRfmAArPWUvzZe8MuD6jlaMBaNvfZq40r9Ya7es
 pmZgAuX+AyVuWf0pUFzJkXd66h0U6EPcy6b2KgGdMw3gwZTb/ALdnbngj8VvI1XPrmxumoOKrcf
 SF98stOiAMym2jw==
X-Google-Smtp-Source: AGHT+IGxJzTwYdZWDug800B5MIYEQqP61Suv+ofwMo1CfF6iLq20x7i2X3BM+SSPRKsVVznjLbxOug==
X-Received: by 2002:a05:600c:3ba3:b0:459:e200:67e0 with SMTP id
 5b1f17b1804b1-459f33bb3b2mr12103515e9.10.1754573291766; 
 Thu, 07 Aug 2025 06:28:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-459e6dcdbbbsm38337875e9.7.2025.08.07.06.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 06:28:11 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 07 Aug 2025 14:28:01 +0100
Subject: [PATCH v2 1/2] drm/vc4: plane: Flag formats as having a minimum
 generation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250807-drm-vc4-extra-formats-v2-1-fadc93844551@raspberrypi.com>
References: <20250807-drm-vc4-extra-formats-v2-0-fadc93844551@raspberrypi.com>
In-Reply-To: <20250807-drm-vc4-extra-formats-v2-0-fadc93844551@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Robert Mader <robert.mader@collabora.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
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

The bool hvs5_only is now mis-named as they are also supported on
hvs6, and we're about to add formats that are only supported on
hvs6.

Change from a bool to an enum vc4_gen giving the minimum generation
that supports the format.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 056d344c5411..3bdd9466a7b0 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -35,7 +35,7 @@ static const struct hvs_format {
 	u32 hvs; /* HVS_FORMAT_* */
 	u32 pixel_order;
 	u32 pixel_order_hvs5;
-	bool hvs5_only;
+	enum vc4_gen min_gen;
 } hvs_formats[] = {
 	{
 		.drm = DRM_FORMAT_XRGB8888,
@@ -161,31 +161,31 @@ static const struct hvs_format {
 		.drm = DRM_FORMAT_P030,
 		.hvs = HVS_PIXEL_FORMAT_YCBCR_10BIT,
 		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
-		.hvs5_only = true,
+		.min_gen = VC4_GEN_5,
 	},
 	{
 		.drm = DRM_FORMAT_XRGB2101010,
 		.hvs = HVS_PIXEL_FORMAT_RGBA1010102,
 		.pixel_order_hvs5 = HVS_PIXEL_ORDER_ARGB,
-		.hvs5_only = true,
+		.min_gen = VC4_GEN_5,
 	},
 	{
 		.drm = DRM_FORMAT_ARGB2101010,
 		.hvs = HVS_PIXEL_FORMAT_RGBA1010102,
 		.pixel_order_hvs5 = HVS_PIXEL_ORDER_ARGB,
-		.hvs5_only = true,
+		.min_gen = VC4_GEN_5,
 	},
 	{
 		.drm = DRM_FORMAT_ABGR2101010,
 		.hvs = HVS_PIXEL_FORMAT_RGBA1010102,
 		.pixel_order_hvs5 = HVS_PIXEL_ORDER_ABGR,
-		.hvs5_only = true,
+		.min_gen = VC4_GEN_5,
 	},
 	{
 		.drm = DRM_FORMAT_XBGR2101010,
 		.hvs = HVS_PIXEL_FORMAT_RGBA1010102,
 		.pixel_order_hvs5 = HVS_PIXEL_ORDER_ABGR,
-		.hvs5_only = true,
+		.min_gen = VC4_GEN_5,
 	},
 	{
 		.drm = DRM_FORMAT_RGB332,
@@ -2524,7 +2524,7 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 	};
 
 	for (i = 0; i < ARRAY_SIZE(hvs_formats); i++) {
-		if (!hvs_formats[i].hvs5_only || vc4->gen >= VC4_GEN_5) {
+		if (vc4->gen >= hvs_formats[i].min_gen) {
 			formats[num_formats] = hvs_formats[i].drm;
 			num_formats++;
 		}

-- 
2.34.1

