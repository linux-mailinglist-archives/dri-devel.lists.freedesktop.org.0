Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D54B7BCF69
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 19:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755D910E060;
	Sun,  8 Oct 2023 17:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AFE10E060;
 Sun,  8 Oct 2023 17:27:58 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-690fe10b6a4so3116035b3a.3; 
 Sun, 08 Oct 2023 10:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696786078; x=1697390878; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BzfXCsQu/Q0hXc6cMTaBxtMOorrmDS4rTq/PmtsDLkg=;
 b=k0tLksv9iFziN5YkMTMQ2Gl9kh/h7Sme/VgG8K9pZ0yZcX4VzOMEFedYXo51wo47u5
 gtmf4wFLpCuOPYFQDN8OR4BCjCtyZ6o7llr/oQUSKqxQ8o7v9n0gRvLHu3s9lGogJjxr
 11NGdvkop5Y0xrsp0EFHQ+rOufEKdiXW32U9cC9/GwewB8DaI14AZJCErr665UMh8ruw
 FSUXyjVrwbNjC6fBBdrr4M4S8oItR97yRu9l1TTLYlBIT4cp4ZToYq1ibKtIzWrUxC6n
 HOrkCMTIvdWrT5SR4hSWSdGGOjLbzrj2hQeD8WbjiQUXA7Lj+TBdabdb/heWBwhgdrj1
 j9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696786078; x=1697390878;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BzfXCsQu/Q0hXc6cMTaBxtMOorrmDS4rTq/PmtsDLkg=;
 b=dOzjxrT/KwFV1lU0FYPnCjxTDRsACULRPdm3fiq2I2L0FZv0jXhurP2fxbV3vLKcQN
 n/cUOLXxmTw9/Ir7ObHlRH/a6CVzqXsWcUgqwSq+rAsrwK8KMn+8G51a9x2Wlh5dT8Zj
 KCvcvkMATZYcXu0bH0Lo29ecUcw0e+JLEY7A98KXhw258Jd/eheIB7d9TmznzcFWLEye
 mj017ESHi2zQAht9OxOpfs1VBYd0zPJ9MCf4oKpqAGlcI6BPi43jQXy1u90jWB8xdlB0
 SDbHu13248WZKzSxC58h0GdwUseUKxdHnQ0Y4DPxq92Gi+A2KSvipnC6uQme/8yYPyAC
 RCcA==
X-Gm-Message-State: AOJu0YyQ+/sZZuEdZ6TChLkWvA8sV3NPKkZB10kc7amHL/z7/02QcAX+
 vcYeAoVZQz4sPV0qcN1Yc+A=
X-Google-Smtp-Source: AGHT+IGVV1a8Zl3qzOuqXTOr9NjpPrkVpV2NcWSVfv6hw4u0w8K/y495AYJteCxRj6PggadLQjlKQA==
X-Received: by 2002:a05:6a00:2d8c:b0:68f:c078:b0b6 with SMTP id
 fb12-20020a056a002d8c00b0068fc078b0b6mr16178897pfb.10.1696786078493; 
 Sun, 08 Oct 2023 10:27:58 -0700 (PDT)
Received: from localhost.localdomain ([27.5.160.191])
 by smtp.gmail.com with ESMTPSA id
 m9-20020aa79009000000b00690d4c16296sm4789435pfo.154.2023.10.08.10.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 10:27:58 -0700 (PDT)
From: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
To: kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau: Fixing indentation and adding License Identifier
 tag
Date: Sun,  8 Oct 2023 22:57:51 +0530
Message-Id: <20231008172751.21953-1-bragathemanick0908@gmail.com>
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

On running checkpatch.pl to nouveau_drm.h identified
few warnings. Fixing them in this patch

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
+/*

WARNING: space prohibited between function name and open parenthesis '('
+#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW (DRM_COMMAND_BASE +
DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)

Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
---
 include/uapi/drm/nouveau_drm.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index 8d7402c13e56..900ca4f1ebe5 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright 2005 Stephane Marchesin.
  * All Rights Reserved.
@@ -448,15 +449,15 @@ struct drm_nouveau_svm_bind {
 
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

