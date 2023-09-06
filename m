Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AD4794375
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 21:02:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D92010E715;
	Wed,  6 Sep 2023 19:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1891610E706;
 Wed,  6 Sep 2023 19:02:34 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-79536bc6697so4638039f.1; 
 Wed, 06 Sep 2023 12:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694026953; x=1694631753; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Shuu74iNOrUzggTrIzmIdLUSQe5OqUirbEavz/33+0U=;
 b=EZ5rL+Vy7fZNCPDyFWaHJA72AYBctyaxYn8neQ0YHBNe1EQmdLfknVcTrvsMG6m6rT
 qe/zJvwwY/XqjU2MXxlnl9gxfKHVttaESfADVdntc3Znmvz2UZBIA8uLRFUmRqUTWslO
 5sRjCzeZGsuhJX27bfbdt2M3T5ZtJ6DZEKqHoYGroC0uwtcRVBZAGml4l5VhR5OsjU1F
 BAn5SItD8ryndij55O+tZAH6UhvFyy2xZ17L70d16cUeGWt3eBdZQXlow5XYy9fYeu/q
 1BacKv6JoMK/tBHIlnJJxNH9f0ertXf7dH7z1zHP7NW/O65ssKdVguhtw4GQzBmR65/y
 cUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694026953; x=1694631753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Shuu74iNOrUzggTrIzmIdLUSQe5OqUirbEavz/33+0U=;
 b=eVQdKOPKtYvi+MuxoeWx0WewST6r3L5nswwfGyGmXEKv4JIJ7hMqqFfMI/IOS9iK+2
 qIxqX4jLqhYlCvnp9HME8qFC25QfXo5Sx+y69DrwbJiSAXmnBS8RhEHp9LrOmmRX+Mhp
 YZVcSMu32ZtPEaMZRjEw8n5V1MzwtP+uLiSWokI5PoCH2l0Hv1CGJ9XJb9JN9UE1fNRU
 b4X617dgi5Xf5zLmCpA4MI0eiUMksR23sbZZuu15nkahtHn89b1/WMTgLKhcPfmiLLyB
 Wann3OE3KXpn12HFeKGcK9uJIuvsZQh5nxpjHsT9pa4jOr+BeXtPZP4XuqO7jkgMrm1n
 iVGg==
X-Gm-Message-State: AOJu0YyRfu1biFpt82S0TPTLsT6yU+Lg9wCVIDr4b3TO9LhpwZT1Ichc
 1Hwf1CahRZY9RGqAn8WXQDw=
X-Google-Smtp-Source: AGHT+IG8dUwsOLP2n+Ukg0ohoD1JineJZS15vcrecPVQqbrwV1b9zykvv4DUg7GBrgG/kgmfyMJyGQ==
X-Received: by 2002:a6b:dc17:0:b0:792:8d16:91ef with SMTP id
 s23-20020a6bdc17000000b007928d1691efmr16839930ioc.18.1694026953259; 
 Wed, 06 Sep 2023 12:02:33 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 w11-20020a5d844b000000b0076ffebfc9fasm5152306ior.47.2023.09.06.12.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 12:02:32 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 3/5] drm/msm: add trailing newlines to drm_dbg msgs
Date: Wed,  6 Sep 2023 13:02:21 -0600
Message-ID: <20230906190224.583577-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230906190224.583577-1-jim.cromie@gmail.com>
References: <20230906190224.583577-1-jim.cromie@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, jani.nikula@intel.com,
 daniel.vetter@ffwll.ch, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 seanpaul@chromium.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By at least strong convention, a print-buffer's trailing newline says
"message complete, send it".  The exception (no TNL, followed by a call
to pr_cont) proves the general rule.

Most DRM.debug calls already comport with this: 207 DRM_DEV_DEBUG,
1288 drm_dbg.  Clean up the remainders, in maintainer sized chunks.

No functional changes.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index e3f61c39df69..88bb5fa23bb1 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -89,7 +89,7 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb,
 
 	for (i = 0; i < n; i++) {
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], aspace, &msm_fb->iova[i]);
-		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)",
+		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)\n",
 			      fb->base.id, i, msm_fb->iova[i], ret);
 		if (ret)
 			return ret;
@@ -176,9 +176,9 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 	const struct msm_format *format;
 	int ret, i, n;
 
-	drm_dbg_state(dev, "create framebuffer: mode_cmd=%p (%dx%d@%4.4s)",
-			mode_cmd, mode_cmd->width, mode_cmd->height,
-			(char *)&mode_cmd->pixel_format);
+	drm_dbg_state(dev, "create framebuffer: mode_cmd=%p (%dx%d@%4.4s)\n",
+		      mode_cmd, mode_cmd->width, mode_cmd->height,
+		      (char *)&mode_cmd->pixel_format);
 
 	n = info->num_planes;
 	format = kms->funcs->get_format(kms, mode_cmd->pixel_format,
@@ -232,7 +232,7 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 
 	refcount_set(&msm_fb->dirtyfb, 1);
 
-	drm_dbg_state(dev, "create: FB ID: %d (%p)", fb->base.id, fb);
+	drm_dbg_state(dev, "create: FB ID: %d (%p)\n", fb->base.id, fb);
 
 	return fb;
 
-- 
2.41.0

