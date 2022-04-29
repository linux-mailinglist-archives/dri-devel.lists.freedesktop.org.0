Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AC1514506
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 11:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94EF310FC21;
	Fri, 29 Apr 2022 09:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB97610FC19;
 Fri, 29 Apr 2022 09:03:16 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id jt15so4905014qvb.13;
 Fri, 29 Apr 2022 02:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qoxSXQJ9/dxQQK4MVZhhkXxfBiLYXcuDgG7pQcSbp24=;
 b=qwYRTKhQT/k6kRH/sIvie4o3m09yMCZ0af+PONrrDG4vjbZgGBVZIlqkSCyJIJbm4L
 Za3E7j8wM3DvURSzIFVADYcRS7YRyZefkdx9DxC/f8sHSn+vZhxWBhkyaLl49l3cUf9F
 NMDASElKrvx3w7dCZ0jZ1PdzhrNwzr/ecS6b8bpQznlo0CRse27sxu39b7wIw0bEp0v3
 67zffhdAMXD6ifrRlWDSLt5ZIzzCdkSU+WBf4Lv1JYRO2DT9xnIIisXCADiCrWktMlTk
 zwwJTDIshEN/uyLpfDzug5GqrE2L4CnP4GKroovL6eLRDzzvZjnnsttvTpLZqYvlq0DY
 iCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qoxSXQJ9/dxQQK4MVZhhkXxfBiLYXcuDgG7pQcSbp24=;
 b=vQhjhaHRiCA61JDgH4vWBbM9VV/sRuxu/mhKGDUchdpUVb1JN45A0p4f+EtcyBC9mU
 Xhp07OkYuFd/choKmzRhk84SHs+D+uRCxdwsUDwbj27G67dwXW53kv3NiZEz3ZQazXkM
 5kS8aCki0XMMJsU8jV0PEeCd1aEuT0kpCeyjByZz3WZ1M4D9iPC/nqGBviMjIaH+CyDt
 4kYVJ8qgexKSUhAnhe3vGLCDOSuDRUTAREiYrtrR6Z+zdjPgIlvHxicjwyxC4cidSe3u
 s0BrBj+Pq8ymFLKJtcLyllwGvhX8iR1fgFG8SUP0p2O9YrqC51CHJNzRcRGU6fux04K2
 E6IA==
X-Gm-Message-State: AOAM532vGUR/8wc16sGXf4yzWgP017A8HAL2Ake0wNmntoWw4eaGYZT+
 HZMLurvqunzgyOca+s/+qWE=
X-Google-Smtp-Source: ABdhPJyp7C79PxBF7uZn3lregSoa281RnSLQCXE+KUZc7B+ARBEKAZjda80oBT+xOEEB9jnpuieyQA==
X-Received: by 2002:a05:6214:238e:b0:435:3700:d65 with SMTP id
 fw14-20020a056214238e00b0043537000d65mr26126189qvb.65.1651222995596; 
 Fri, 29 Apr 2022 02:03:15 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a05622a13ce00b002f20a695972sm1556709qtk.14.2022.04.29.02.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 02:03:15 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: bskeggs@redhat.com
Subject: [PATCH] drm/nouveau: simplify the return expression of
 nouveau_debugfs_init()
Date: Fri, 29 Apr 2022 09:03:09 +0000
Message-Id: <20220429090309.3853003-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

Simplify the return expression.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 1cbe01048b93..76b621f99916 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -255,19 +255,13 @@ nouveau_drm_debugfs_init(struct drm_minor *minor)
 int
 nouveau_debugfs_init(struct nouveau_drm *drm)
 {
-	int ret;
-
 	drm->debugfs = kzalloc(sizeof(*drm->debugfs), GFP_KERNEL);
 	if (!drm->debugfs)
 		return -ENOMEM;
 
-	ret = nvif_object_ctor(&drm->client.device.object, "debugfsCtrl", 0,
+	return nvif_object_ctor(&drm->client.device.object, "debugfsCtrl", 0,
 			       NVIF_CLASS_CONTROL, NULL, 0,
 			       &drm->debugfs->ctrl);
-	if (ret)
-		return ret;
-
-	return 0;
 }
 
 void
-- 
2.25.1


