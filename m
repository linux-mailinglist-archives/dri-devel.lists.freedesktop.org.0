Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4340F90F25A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 17:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC3110ED08;
	Wed, 19 Jun 2024 15:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="B/2jcS9n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f98.google.com (mail-ej1-f98.google.com
 [209.85.218.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86B710ED08
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 15:39:30 +0000 (UTC)
Received: by mail-ej1-f98.google.com with SMTP id
 a640c23a62f3a-a63359aaaa6so1051318366b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 08:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718811569; x=1719416369;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wq3XbK5u/8uGB1NH5CGoSwu3O5ze71JMH2q0vqPTrIw=;
 b=B/2jcS9nFbdicY8JsGhy3K02LsRqdhlDzlWjxJEbK9v6WZWn9EkNZMTzQ6O+7rdILa
 fcfmXHvju5Wwt6gh/u07BUO/OCQo2UIKA2QwpnYkkMsZbloXVLdnA8R13H2qlB/Qq/V7
 dQvDk/QjBhabV229UeQbP+TIQT/fMvFtmfosyvCFhDbIL7B/LCnQGB6xHzwMzeieunyw
 Z6uHPuIZES9RnrzQS6i3bsd0SEv5zfPfqw28YBY4YXDg1R3e//nkl+S5O1oDJlfRZwne
 pe9ph2qvCkrLJD9HotEjLOzb0TKdfViLlr7j+p0wp+9tJe6twhJIfW3bhtGD0THktX9g
 m+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718811569; x=1719416369;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wq3XbK5u/8uGB1NH5CGoSwu3O5ze71JMH2q0vqPTrIw=;
 b=F9rlnKW5XFm4X8QA65cXZVdzJh544Eonz5+fHeFusmL1BTgPLvwzuhtmQcJq/l7+g1
 SFsT9KYOTVQHeYdme25j+BRjXxutNUWRHyUQan6b3wExbVPSHCV7SRTOVYtJItmYFOJL
 2NxXP/pB1BRzqaAcW1p6dq6lFxqnNhbdFVGz+vgfuDquymvUMGR+Zj5Jq3kIyUaN2jgF
 nVepad20fFZmtFOeSl/7vMQo0gUxTPhuduuAwvJvqdeQfU6tVs2a6APBfIBk8b7cHkkj
 AyvB/oq1z6HS45l8XgpT5v7o3unIdbz6H5PWj2PS8cDFS1/cI8JRKyNGQu2Ta/Kt0ILL
 3LrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtwzi2GS5inQ8PrltbO6HCIRhtfVrGvO6FdG6piXkb2PZ2uiGTCZYx8e2PLoTggrSAt2J6owON6LJoyua1RNCiUYtWuSweWQBc+f5BqhiR
X-Gm-Message-State: AOJu0YwaEkz/eX9YB3q/JWEh0y3+w4P3DrDc4+5p2QDF9HifTg0icf7a
 ILcsznTPBFC8Cuu651dPn6j1xWIql6dEAL3JccjQfw4EjgXPmjXNb1P9nygNVsE6UpLAy51xbsB
 j0Oah9/ysXBQQ8qx6v6o5uDXVDtyPOJyo
X-Google-Smtp-Source: AGHT+IHYGUFsZyEinxvixOf5q69KaF6hLyJ8jXosA6IMMYJsUjdJBT7wSSvnxBuCiyXaVArkGDFGJ1+UrmLb
X-Received: by 2002:a17:907:c5c7:b0:a6f:b5ff:a6eb with SMTP id
 a640c23a62f3a-a6fb5ffaafemr113625866b.24.1718811568793; 
 Wed, 19 Jun 2024 08:39:28 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6f56d8daa7sm22580566b.77.2024.06.19.08.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 08:39:28 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 2/3] drm/vc4: Add monochrome mode to the VEC.
Date: Wed, 19 Jun 2024 16:39:12 +0100
Message-Id: <20240619153913.2804051-3-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240619153913.2804051-1-dave.stevenson@raspberrypi.com>
References: <20240619153913.2804051-1-dave.stevenson@raspberrypi.com>
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

The VEC supports not producing colour bursts for monochrome output.
It also has an option for disabling the chroma input to remove
chroma from the signal.

Now that there is a DRM_MODE_TV_MODE_MONOCHROME defined, plumb
this in.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 268f18b10ee0..5fdde6f28d86 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -234,6 +234,7 @@ enum vc4_vec_tv_mode_id {
 	VC4_VEC_TV_MODE_PAL_60,
 	VC4_VEC_TV_MODE_PAL_N,
 	VC4_VEC_TV_MODE_SECAM,
+	VC4_VEC_TV_MODE_MONOCHROME,
 };
 
 struct vc4_vec_tv_mode {
@@ -324,6 +325,22 @@ static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 		.custom_freq = 0x29c71c72,
 	},
+	{
+		/* 50Hz mono */
+		.mode = DRM_MODE_TV_MODE_MONOCHROME,
+		.expected_htotal = 864,
+		.config0 = VEC_CONFIG0_PAL_BDGHI_STD | VEC_CONFIG0_BURDIS |
+			   VEC_CONFIG0_CHRDIS,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
+	},
+	{
+		/* 60Hz mono */
+		.mode = DRM_MODE_TV_MODE_MONOCHROME,
+		.expected_htotal = 858,
+		.config0 = VEC_CONFIG0_PAL_M_STD | VEC_CONFIG0_BURDIS |
+			   VEC_CONFIG0_CHRDIS,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
+	},
 };
 
 static inline const struct vc4_vec_tv_mode *
@@ -351,6 +368,7 @@ static const struct drm_prop_enum_list legacy_tv_mode_names[] = {
 	{ VC4_VEC_TV_MODE_PAL_M, "PAL-M", },
 	{ VC4_VEC_TV_MODE_PAL_N, "PAL-N", },
 	{ VC4_VEC_TV_MODE_SECAM, "SECAM", },
+	{ VC4_VEC_TV_MODE_MONOCHROME, "Mono", },
 };
 
 static enum drm_connector_status
@@ -406,6 +424,10 @@ vc4_vec_connector_set_property(struct drm_connector *connector,
 		state->tv.mode = DRM_MODE_TV_MODE_SECAM;
 		break;
 
+	case VC4_VEC_TV_MODE_MONOCHROME:
+		state->tv.mode = DRM_MODE_TV_MODE_MONOCHROME;
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -453,6 +475,10 @@ vc4_vec_connector_get_property(struct drm_connector *connector,
 		*val = VC4_VEC_TV_MODE_SECAM;
 		break;
 
+	case DRM_MODE_TV_MODE_MONOCHROME:
+		*val = VC4_VEC_TV_MODE_MONOCHROME;
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -754,7 +780,8 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 					    BIT(DRM_MODE_TV_MODE_PAL) |
 					    BIT(DRM_MODE_TV_MODE_PAL_M) |
 					    BIT(DRM_MODE_TV_MODE_PAL_N) |
-					    BIT(DRM_MODE_TV_MODE_SECAM));
+					    BIT(DRM_MODE_TV_MODE_SECAM) |
+					    BIT(DRM_MODE_TV_MODE_MONOCHROME));
 	if (ret)
 		return ret;
 
-- 
2.34.1

