Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 600BD7EB0D8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 14:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAE810E0F8;
	Tue, 14 Nov 2023 13:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FC010E0F8;
 Tue, 14 Nov 2023 13:28:01 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-5bdf5a025c1so3654564a12.0; 
 Tue, 14 Nov 2023 05:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699968480; x=1700573280; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pJTc18Dq8cauhdDP2mnhlAYqSmKqYG3BV6eLgfA16hg=;
 b=DDBBk3PmFESc/iRHbwUynevY757+53iDmqqHm8HBZ/6V/8w+y+CIBtKi4w04mZiQub
 aPnVzGCC0yuxXiKrkIyHRkLyzpkUyoFkH7PYLLHE4vKWaF6YHkdjrqLwoMLNqfEKgiCw
 pIge8MS3WK5HV+ihroqaCsxtcEAJ5iFtQmR/sediuV0lenXlks2HlTBfqST0om0vHd7C
 l7v5MVa8l2JxH4m4M6MYaG87Bxakrj0Tcg4QgQDINTyUfOlFkktuABoyiOYo7UhT1YG+
 FB1dGQyqj6bJjTGq3NhSy719hsfphN0+fUTpLcJxkP0Tkba17jDZvR9AfMEJsjm4psjj
 NXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699968480; x=1700573280;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pJTc18Dq8cauhdDP2mnhlAYqSmKqYG3BV6eLgfA16hg=;
 b=JT+kf+5mp4Mhrc46a/3BHISyggyfNI4o0hM4/DaMlFmD3R+qVb9KAfieOfYNPspvrc
 wXk9K86Vsod5LvViZOebbJZjR2GOHhOEUqzVqZdPwc6463IpLkDGT0iJci1/hzZWG4Ab
 vWo4TwcCApGJI1r0yhACZsisj6R1t7tcD65nAjWJuKc9fbSflEafaSAAH/LHjRqM1ijH
 W3bYXFfyiDavwh7l1Vh6mcI+xbuf4jj7FoMJYZOAQhx9OZZ22+KZZVU0feXnC8OSKGAt
 qLsSD1wLWMYOaoDaL95iAeLPRFO+jrFow2MKGJ45gpgw6wg2pjs8UCv0YOkI8fv/onTX
 Go5Q==
X-Gm-Message-State: AOJu0YxW8gsQ2WXKjX6qk6kyN5eMdMPSdAG1hkB06QI3yDTmvm+g0oXB
 to6cD/ROm5MvDyfRvl1iI5Q=
X-Google-Smtp-Source: AGHT+IEFXKIj+sDkAvDnBoLBTuw0fzrerZqXQZe0oLFbbujfd/4KdXIpoOLoh0oHAIbyA28Mh549uw==
X-Received: by 2002:a17:90b:1c82:b0:27c:f80a:2c8a with SMTP id
 oo2-20020a17090b1c8200b0027cf80a2c8amr6619797pjb.0.1699968480499; 
 Tue, 14 Nov 2023 05:28:00 -0800 (PST)
Received: from anfanite396-Predator-PH315-51.gateway.iitmandi.ac.in
 ([14.139.34.151]) by smtp.gmail.com with ESMTPSA id
 22-20020a17090a001600b0027ceac90684sm5896451pja.18.2023.11.14.05.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 05:28:00 -0800 (PST)
From: Dipam Turkar <dipamt1729@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH] Remove custom dumb_map_offset implementation in msm driver
Date: Tue, 14 Nov 2023 18:57:13 +0530
Message-Id: <20231114132713.403443-1-dipamt1729@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: freedreno@lists.freedesktop.org, Dipam Turkar <dipamt1729@gmail.com>,
 sean@poorly.run, quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make msm use drm_gem_create_map_offset() instead of its custom
implementation for associating GEM object with a fake offset. Since,
we already have this generic implementation, we don't need the custom
implementation and it is better to standardize the code for GEM based drivers.

Signed-off-by: Dipam Turkar <dipamt1729@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c |  2 +-
 drivers/gpu/drm/msm/msm_gem.c | 21 ---------------------
 drivers/gpu/drm/msm/msm_gem.h |  2 --
 3 files changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index a428951ee539..86a15992c717 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1085,7 +1085,7 @@ static const struct drm_driver msm_driver = {
 	.open               = msm_open,
 	.postclose          = msm_postclose,
 	.dumb_create        = msm_gem_dumb_create,
-	.dumb_map_offset    = msm_gem_dumb_map_offset,
+	.dumb_map_offset    = drm_gem_dumb_map_offset,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index db1e748daa75..489694ef79cb 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -671,27 +671,6 @@ int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			MSM_BO_SCANOUT | MSM_BO_WC, &args->handle, "dumb");
 }
 
-int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
-		uint32_t handle, uint64_t *offset)
-{
-	struct drm_gem_object *obj;
-	int ret = 0;
-
-	/* GEM does all our handle to object mapping */
-	obj = drm_gem_object_lookup(file, handle);
-	if (obj == NULL) {
-		ret = -ENOENT;
-		goto fail;
-	}
-
-	*offset = msm_gem_mmap_offset(obj);
-
-	drm_gem_object_put(obj);
-
-fail:
-	return ret;
-}
-
 static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 8ddef5443140..dc74a0ef865d 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -139,8 +139,6 @@ struct page **msm_gem_pin_pages(struct drm_gem_object *obj);
 void msm_gem_unpin_pages(struct drm_gem_object *obj);
 int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 		struct drm_mode_create_dumb *args);
-int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
-		uint32_t handle, uint64_t *offset);
 void *msm_gem_get_vaddr_locked(struct drm_gem_object *obj);
 void *msm_gem_get_vaddr(struct drm_gem_object *obj);
 void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);
-- 
2.34.1

