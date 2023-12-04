Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7559803438
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 14:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A2010E258;
	Mon,  4 Dec 2023 13:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5947A10E1C8
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 13:15:00 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id
 2adb3069b0e04-50bf69afa99so1235139e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 05:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701695698; x=1702300498; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iDYOW09h+pT00R97XM10ZVFeYIp6xI3XBNZf6tighVY=;
 b=MdBmfRAA7dT5NdEe60ePHYPOaGQEDp/XRsTKnqTT+ewrmVOqgE40/E8pBVjVLPkKAy
 9ttIPRpsHldddzT2CJf8lzM7NxCPs4FQx+Ba4WWpHVUfjNEKN7N5xPrXRvWmyM2ElqSu
 x2LgnO7pt4CrcgJmiVOzg+gDhOb6kv07WS6dMuhb4rAZ729gtGbxLz+Q87qBPnwSCpcZ
 GDyL54VeNW8eCIkrhBY47h6iVMJEg9kQZasOfJpt5sBQr+uI6QOlEe8zilx79fFpOp0D
 3oUDvnoZ1aTzHpEgzp59TFbc6CKk0XQaX4zJe0uK1drrQA5LIWLc9U1paDwiKKBgHcbT
 pwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701695698; x=1702300498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iDYOW09h+pT00R97XM10ZVFeYIp6xI3XBNZf6tighVY=;
 b=YNgSp1oMoa1qcRhiKwjSsXvzL4VCLFerI5epFpCsIRSYRln8Yg4WhLYFeoLHxKW2AG
 xpEt6du6TFIOwYCY3clDYSDJB7ClcQlMmyMYC3SC+KmWcfqAyizY64S88XAMppbG4Leq
 ugJrDbrPH/77ktL59nGcVszgkyjSTH7KaBFjJkkkAp097JaTzTjy7FLWNfgzEWhFdm3L
 wI/FZoeNMrd9K4hnZeGdfgrUDtGQfVtj07bXjZAFW/UrdDvxEw/gDpMatMrjyHNV4GJT
 YQAdRtsAaiFbPyxmC7rc2hQiAJQ7AcqbTOYOKF91TR85QeA/DN5/NTABHvn9y7rpIjIX
 H6Cg==
X-Gm-Message-State: AOJu0YzGBKlIc8lTR6jv2BzLWJHYRpo4WhdzWn9zOLEIAqsxrXdgxUnj
 mzyVLwtsOpLq0UZoMGT4iNzruA==
X-Google-Smtp-Source: AGHT+IFYEXM+I7k7BfurZSUwYVxgU9MIJ9BegdhKzAyCoiOcrClosqZ8ZjBR5b2uLlnUHG4uDlAkWg==
X-Received: by 2002:a05:6512:2396:b0:50b:d764:96a4 with SMTP id
 c22-20020a056512239600b0050bd76496a4mr3713697lfv.136.1701695698646; 
 Mon, 04 Dec 2023 05:14:58 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::227]) by smtp.gmail.com with ESMTPSA id
 br25-20020a056512401900b0050bc59642casm1251924lfb.286.2023.12.04.05.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 05:14:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/7] Revert "drm/atomic: Add solid fill data to plane state
 dump"
Date: Mon,  4 Dec 2023 15:13:50 +0200
Message-ID: <20231204131455.19023-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
References: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit e86413f5442ee094e66b3e75f2d3419ed0df9520.

Altough the Solid Fill planes patchset got all reviews and
acknowledgements, it doesn't fulfill requirements for the new uABI. It
has neither corresponding open-source userspace implementation nor the
IGT tests coverage. Reverting this patchset until userspace obligations
are fulfilled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic.c | 4 ----
 drivers/gpu/drm/drm_plane.c  | 8 --------
 include/drm/drm_plane.h      | 3 ---
 3 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 1339785fbe80..02aa7df832cc 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -726,10 +726,6 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 	drm_printf(p, "\tfb=%u\n", state->fb ? state->fb->base.id : 0);
 	if (state->fb)
 		drm_framebuffer_print_info(p, 2, state->fb);
-	drm_printf(p, "\tsolid_fill=%u\n",
-			state->solid_fill_blob ? state->solid_fill_blob->base.id : 0);
-	if (state->solid_fill_blob)
-		drm_plane_solid_fill_print_info(p, 2, state);
 	drm_printf(p, "\tcrtc-pos=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&dest));
 	drm_printf(p, "\tsrc-pos=" DRM_RECT_FP_FMT "\n", DRM_RECT_FP_ARG(&src));
 	drm_printf(p, "\trotation=%x\n", state->rotation);
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index c65c72701dd2..c8dbe5ae60cc 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1641,14 +1641,6 @@ __drm_plane_get_damage_clips(const struct drm_plane_state *state)
 					state->fb_damage_clips->data : NULL);
 }
 
-void drm_plane_solid_fill_print_info(struct drm_printer *p, unsigned int indent,
-				     const struct drm_plane_state *state)
-{
-	drm_printf_indent(p, indent, "r=0x%08x\n", state->solid_fill.r);
-	drm_printf_indent(p, indent, "g=0x%08x\n", state->solid_fill.g);
-	drm_printf_indent(p, indent, "b=0x%08x\n", state->solid_fill.b);
-}
-
 /**
  * drm_plane_get_damage_clips - Returns damage clips.
  * @state: Plane state.
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index d14e2f1db234..4b7af4381bbe 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -1025,9 +1025,6 @@ drm_plane_get_damage_clips_count(const struct drm_plane_state *state);
 struct drm_mode_rect *
 drm_plane_get_damage_clips(const struct drm_plane_state *state);
 
-void drm_plane_solid_fill_print_info(struct drm_printer *p, unsigned int indent,
-				     const struct drm_plane_state *state);
-
 int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
 					     unsigned int supported_filters);
 
-- 
2.42.0

