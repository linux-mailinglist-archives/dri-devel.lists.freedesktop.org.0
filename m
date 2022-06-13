Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB08E54A017
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 22:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DB710F99C;
	Mon, 13 Jun 2022 20:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A408510F99C;
 Mon, 13 Jun 2022 20:49:02 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d5so3467046plo.12;
 Mon, 13 Jun 2022 13:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9WbBxL9rxB+15RDo2ejuHuLx5dieu0bPV+8/sqzH35Y=;
 b=DFL3pOHOBZ6uaJ9yEQKJPsB4zFwGx8lcLv8a8av/oYj7ZXVHpF9p4sbHQSM+SiPgzS
 G8v5eO+mAEDU3qPqPtbDxwqMOgfXWgxVYZos6oI0uSl/K1IL6woCWmkehq9oS3XK4l7c
 Uu+e25rcd3/Psv0Hx7k+uDQqHCQxeODGaPKqPeURWic69bRlu7thtwyczqT2D19SxSR7
 GnxyQlGZrDiTQq4x25qyT/ovdPwjwkHlMJ+45YNBt8/4I2ATZvIgVWdMQLJt/JdszGV4
 pRgA4XxU+dIMgKHpuiTMx2hCERNDNuVjp+s4IaereW/IY1CT/WT6dTHpkBGbium/OBgq
 G/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9WbBxL9rxB+15RDo2ejuHuLx5dieu0bPV+8/sqzH35Y=;
 b=iCrXjj1JY9vfHiw79HSzgy+qcIgcJWoY8yvYhlbItizopzPwaM2iYHNa/henXbWXgh
 MYFv8yVELyy66GEjjxHu9b4QJsBHReuf1j0FtP2ljqGHVa/0e99pj6p0GurQk5mfAFQo
 lk4XL5gFgh9evJSzYPFi7M2+p8KijeiwCHkC+vR8UvnCrErsordso25eX2RUrxmJQnan
 CGBiUe3M9ZfQA4ZiuQa6MYGSWAHq3UmiGZ4wNwK4fWNQfnf8Pyvptq+iSBIx3uZxh9jS
 Y7ConbhF4n+EVkqM+IjezYQsXl+zgzGWTV7FVukJGlZNhYHsBVM3/L/znn6q1xrBS675
 QCPA==
X-Gm-Message-State: AJIora+lr5KEDfjvaStFxA0e8Dx0ivDmRZsRfU4FAa7QZxVYOtMQTjL6
 vl9lzmAUme/o6J5NlOPZqsWklicD00A=
X-Google-Smtp-Source: AGRyM1uOTI6k/sL4XJU84/uEt3GMbUUcl5XCnXux4Nhuu8n+ayh648e2MJrOjk4qEy4XjYgEi16mpA==
X-Received: by 2002:a17:90a:1588:b0:1e0:a45c:5c1 with SMTP id
 m8-20020a17090a158800b001e0a45c05c1mr596780pja.65.1655153341625; 
 Mon, 13 Jun 2022 13:49:01 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170902900b00b00168b113f222sm5539202plp.173.2022.06.13.13.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 13:49:00 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Make msm_gem_free_object() static
Date: Mon, 13 Jun 2022 13:49:10 -0700
Message-Id: <20220613204910.2651747-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Misc small cleanup I noticed.  Not called from another object file since
3c9edd9c85f5 ("drm/msm: Introduce GEM object funcs")

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 2 +-
 drivers/gpu/drm/msm/msm_gem.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 35845e273d81..3ef7ada59392 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1004,7 +1004,7 @@ void msm_gem_describe_objects(struct list_head *list, struct seq_file *m)
 #endif
 
 /* don't call directly!  Use drm_gem_object_put() */
-void msm_gem_free_object(struct drm_gem_object *obj)
+static void msm_gem_free_object(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct drm_device *dev = obj->dev;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 6b7d5bb3b575..d608339c1643 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -175,7 +175,6 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu);
 void msm_gem_active_put(struct drm_gem_object *obj);
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
 int msm_gem_cpu_fini(struct drm_gem_object *obj);
-void msm_gem_free_object(struct drm_gem_object *obj);
 int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 		uint32_t size, uint32_t flags, uint32_t *handle, char *name);
 struct drm_gem_object *msm_gem_new(struct drm_device *dev,
-- 
2.36.1

