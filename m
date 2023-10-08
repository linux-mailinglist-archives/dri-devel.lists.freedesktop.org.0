Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C92307BCCE2
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 09:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB1810E086;
	Sun,  8 Oct 2023 07:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF0A10E086;
 Sun,  8 Oct 2023 07:06:52 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-57b74782be6so1987893eaf.2; 
 Sun, 08 Oct 2023 00:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696748811; x=1697353611; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xaaQmfAOdlMr/G3DN8Nw6V4MkQHgrZFbaXHumsVfrFA=;
 b=MB3E+YKvM8HnnbLKGqS0fkuQ6+B8xC7a/yBifXwNZU3QWZNnSM58YJUjiB1asfaeG7
 YxEM0z7NAjS86syLcuRsJuEIsdFAndlrVCRswWimR/oiWZpGMToBtiq3w1GnNy+DXL7Z
 sxym6aj3rRNHun3uemAWFFX2Bw2O8lQ8uKSP4otnsR46yzmkmEgnDdYwRyH7ZDV81VJT
 STXbtWwJsdKAu8B9RtjW20Ns7vxUgIRghr3ZJP+W3oE5dHmVcgGMh0hFdO7tdjD/pH2B
 s1x6eq98n+bQKCONw1bT4ryPeIAa0P4hIAb8RCRe5bvWVLJdYr4zWYqLEWg0TnNOOZi6
 yTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696748811; x=1697353611;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xaaQmfAOdlMr/G3DN8Nw6V4MkQHgrZFbaXHumsVfrFA=;
 b=kH0T07cVJtFghcbnjQV5mwXNQSlH51SDPr+ugcMwTiOH7upvBvIYgn5WsGPVig1wFX
 OYTNAJeq1JOafFUqSmsD0Ph5qWeCoe1e383t4vvf2jBB9/ZjZH/yYZRkBlArgcvQ0Rkd
 j9ju/uaP/w6V0QhoCE56imnXWfaoH8PLe5wTZyV3NRrFoSNz3dQJCwsNzJpUKxN0NgHJ
 Q/asIy6/9pmG/Kb38GX4GxIMfjKq8oCYhpQETY5pYBr2Gj69UHrYn6QHcihxeyTByY5V
 cYnqqKJamuLtiuHbp9l9oPcLSULMasxNHC4ZeSZaVEo584WyVqTUsGFQMUNcwHBuvz7l
 V4Jg==
X-Gm-Message-State: AOJu0YxizT5riD5hnHqOwvkc6zoiaW4qk/IKKTSZL2k12Ff6gnJW2SPv
 T+HwReRs9fL0WvbPNPWhsYqswYqzOd0=
X-Google-Smtp-Source: AGHT+IHjlQJlc1v/QJINcsLjzBlw3z4Y2om9X4TNhRdSRpyR3bjky2WaVc7uXpVm3uLtbUZ8+CZ6UQ==
X-Received: by 2002:a05:6358:63a7:b0:14b:d9de:3008 with SMTP id
 k39-20020a05635863a700b0014bd9de3008mr14338878rwh.5.1696748811195; 
 Sun, 08 Oct 2023 00:06:51 -0700 (PDT)
Received: from localhost.localdomain ([27.5.160.191])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a637258000000b0055c178a8df1sm2290356pgn.94.2023.10.08.00.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 00:06:50 -0700 (PDT)
From: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
To: kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau: fix kernel-doc warning
Date: Sun,  8 Oct 2023 12:36:18 +0530
Message-Id: <20231008070618.20640-1-bragathemanick0908@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Identified below document warning in latest linux-next.
./include/uapi/drm/nouveau_drm.h:49: warning: Cannot understand
* @NOUVEAU_GETPARAM_EXEC_PUSH_MAX: on line 49 - I thought it was a doc line

Also, on running checkpatch.pl to nouveau_drm.h identified
few more warnings/errors and fixing them in this patch

Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
---
 include/uapi/drm/nouveau_drm.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index eaf9f248619f..a523ca5aa865 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -46,7 +46,7 @@ extern "C" {
 #define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
 
 /**
- * @NOUVEAU_GETPARAM_EXEC_PUSH_MAX
+ * NOUVEAU_GETPARAM_EXEC_PUSH_MAX:
  *
  * Query the maximum amount of IBs that can be pushed through a single
  * &drm_nouveau_exec structure and hence a single &DRM_IOCTL_NOUVEAU_EXEC
@@ -458,15 +458,15 @@ struct drm_nouveau_svm_bind {
 
 #define DRM_IOCTL_NOUVEAU_GETPARAM           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GETPARAM, struct drm_nouveau_getparam)
 #define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC      DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)
-#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
+#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW(DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
 
 #define DRM_IOCTL_NOUVEAU_SVM_INIT           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_SVM_INIT, struct drm_nouveau_svm_init)
 #define DRM_IOCTL_NOUVEAU_SVM_BIND           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_SVM_BIND, struct drm_nouveau_svm_bind)
 
 #define DRM_IOCTL_NOUVEAU_GEM_NEW            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_NEW, struct drm_nouveau_gem_new)
 #define DRM_IOCTL_NOUVEAU_GEM_PUSHBUF        DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_PUSHBUF, struct drm_nouveau_gem_pushbuf)
-#define DRM_IOCTL_NOUVEAU_GEM_CPU_PREP       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_PREP, struct drm_nouveau_gem_cpu_prep)
-#define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
+#define DRM_IOCTL_NOUVEAU_GEM_CPU_PREP       DRM_IOW(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_PREP, struct drm_nouveau_gem_cpu_prep)
+#define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
 #define DRM_IOCTL_NOUVEAU_GEM_INFO           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
 
 #define DRM_IOCTL_NOUVEAU_VM_INIT            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)
-- 
2.34.1

