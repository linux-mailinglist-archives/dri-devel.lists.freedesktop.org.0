Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B1F9954BD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 18:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9891F10E594;
	Tue,  8 Oct 2024 16:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="cL0FoPBi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F5110E593
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 16:44:50 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42cc8782869so60072285e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2024 09:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1728405889; x=1729010689;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=90ANlFWGN+t7YRM+OQtOzbvQb+vC2EWhHHwqfHzlk5w=;
 b=cL0FoPBi9kr4rGtoMOBIfrMPTZjJzUPJ3bq2NclYKYZ/3cnSyk0dHqPJ0mtaFIh59g
 Ko0W7ZAxTcOAm7mpGk3MS4Jbn3m+W7dSlDyL9ui9HsBUcEMneum8diUTNErNT/aQiNV7
 B2Vu2FKhzFj/ngPYanUR2q2a4mgkah/Q+FZMRSKJZpgk/KN4uU96MgE+Xw45ZKZuydPs
 BUVQW2agEJAjWDm8FgAzJWFsgHng3JYRCI3aZ8yr++Pa6v3xnTMDS81U0BI3Wy/bmFFt
 LQSo75P9LlIZtNht8kxzOfL8GH620jr2MJEUMQmFu4G7LC+wsqEjixU4gz/1aGieMPKD
 qQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728405889; x=1729010689;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=90ANlFWGN+t7YRM+OQtOzbvQb+vC2EWhHHwqfHzlk5w=;
 b=dCWHEqmcYBlbeqldpPrZOZIZYM4g14nao1bSONS+jaayn2Zf+CE9HP0ojt3V1CkzmC
 u6+XP1jSvlCAkN1rPph1wh9cBOE53+xC6gfxTWWeMUKnXaSzmW1wq8Ryj8a/0xsMkc7O
 6RBF2d9c3Dn8B6d/cPSGXzH+HJpOyvYKqz4MwEy9mtPvkk7uQ1Dg1PJYBDDgVYt0Up05
 Lw+uID8rYVMARdYhRKpGb6f7IkcUC+mXqIDxoVFF9tGo7Ny8XgrG2LpMnoHNHY2zryay
 kg/e+Ohz4ElQByjOAEBD5yWcGAhI3C90yjpqIazGm3LHi0cRBUZY/PbCFMCAu7mdmRmh
 I50Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzm0vI0fWlEIPtjNCtRi2om8PkxT4sbSUMSti2HjBinhI8N5wD0X+pdxPjxydmVIR3sCdMTlhEcsw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKwjU3KumTbHIJHPv0bx2tFw6QyISDTwlBfps+rOf9vd69fQqd
 B9kA5he4NYPtZWMu0MQU3uKJPPviHHBy5eD0MQMjpLy9zn64lJA+7/JUkGbQLIY=
X-Google-Smtp-Source: AGHT+IFvA3g8BnPqda9AgaP6SE6nfhTyCYyUtjJJCs7ai6iH9pJMhXZuRLfeVaJbZvQEw/32OWwilg==
X-Received: by 2002:a05:600c:47d2:b0:430:5701:93a4 with SMTP id
 5b1f17b1804b1-430570198c6mr14325085e9.14.1728405888599; 
 Tue, 08 Oct 2024 09:44:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42f86b4acddsm132133155e9.44.2024.10.08.09.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 09:44:48 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 08 Oct 2024 17:44:35 +0100
Subject: [PATCH 2/3] drm/vc4: Match drm_dev_enter and exit calls in
 vc4_hvs_atomic_flush
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-drm-vc4-fixes-v1-2-9d0396ca9f42@raspberrypi.com>
References: <20241008-drm-vc4-fixes-v1-0-9d0396ca9f42@raspberrypi.com>
In-Reply-To: <20241008-drm-vc4-fixes-v1-0-9d0396ca9f42@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
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

Commit 92c17d16476c ("drm/vc4: hvs: Ignore atomic_flush if we're disabled")
added a path which returned early without having called drm_dev_exit.

Ensure all paths call drm_dev_exit.

Fixes: 92c17d16476c ("drm/vc4: hvs: Ignore atomic_flush if we're disabled")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 546ee11016b2..c5ebc317188a 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -603,7 +603,7 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	}
 
 	if (vc4_state->assigned_channel == VC4_HVS_CHANNEL_DISABLED)
-		return;
+		goto exit;
 
 	if (debug_dump_regs) {
 		DRM_INFO("CRTC %d HVS before:\n", drm_crtc_index(crtc));
@@ -686,6 +686,7 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 		vc4_hvs_dump_state(hvs);
 	}
 
+exit:
 	drm_dev_exit(idx);
 }
 

-- 
2.34.1

