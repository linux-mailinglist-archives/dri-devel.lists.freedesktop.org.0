Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3400D2B7107
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 22:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34CC36E0EE;
	Tue, 17 Nov 2020 21:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA3F6E0EE
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 21:40:36 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id s13so34394wmh.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 13:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bIB8bSz5TraZ7JKJUYQ73ZoAc9q7vZwvYRJWISiBqBQ=;
 b=iXN5OGOEce9eSx0uthv8i7jmX/dUEeeeOH+v++gtLWaFaVSgTYYSmfFcFUpsPHiU+8
 V/lmI440YRR3ucFQfF7mntZjhtVFogNNmPGERlUzyWKcZRCaf8g//2vAspg4Mq7gObWm
 pGz4hunk50HVfSj754tOagTFGcMjTGn3nnJvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bIB8bSz5TraZ7JKJUYQ73ZoAc9q7vZwvYRJWISiBqBQ=;
 b=GJTAps1dtixoPMIjrSx2VjA4q92Q8IQwhRsGEHetv1CiDQ8PhVcim0bm7RNS2HqqKj
 j6+Q0WF1dFqqo0gFGJhSmOCAFSefctrIXAWw+aVNZ1dmMnpTJBaYCqPBRjRMUSX8gwcJ
 hbph/cDR2n8VLuZp0CMXPhgrX22Xmf6o8PQdw3EEfcpFLa+qEZxcA9Pky3Ib/5SZD2R5
 +vU2MTEdvxFlpJ9BrZpS5JD98Oy7F19ihk3QIB0NPNix4DA+EFfSHX8ibN56QUp6tKdZ
 mOe2PrxGKzyzCyTIY7kGqF4h1isTtutC1v4cOQESMbPNB6cT+Y4mBP75UZcPTpAPvjHI
 lxLg==
X-Gm-Message-State: AOAM53265RvDXOKZ56Yg9lFaj5WX0/vpA/njl/BjPCtdelnkfFIQl8s8
 1TDAPD+hvhK9r2P6EWDolSXVMcAWyc1eNA==
X-Google-Smtp-Source: ABdhPJykdfp/Bf+SbOzNmwEfj4qe9pzUAYSo03p7aztZXC8gO+kDOaSj2NBqEbRRaNv7cxNLEyOfBw==
X-Received: by 2002:a1c:3d6:: with SMTP id 205mr1101247wmd.85.1605649235345;
 Tue, 17 Nov 2020 13:40:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w17sm5438932wru.82.2020.11.17.13.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 13:40:34 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] char/agp: Disable frontend without CONFIG_DRM_LEGACY
Date: Tue, 17 Nov 2020 22:40:29 +0100
Message-Id: <20201117214029.591896-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's probably full of bugs ready for exploiting by userspace. And
there's not going to be any userspace for this without any of the drm
legacy drivers enabled too. So just couple it together.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Adam Jackson <ajax@redhat.com>
---
 drivers/char/agp/Makefile | 6 +++++-
 drivers/char/agp/agp.h    | 5 +++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/char/agp/Makefile b/drivers/char/agp/Makefile
index cb2497d157f6..90ed8c789e48 100644
--- a/drivers/char/agp/Makefile
+++ b/drivers/char/agp/Makefile
@@ -1,7 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
-agpgart-y := backend.o frontend.o generic.o isoch.o
+agpgart-y := backend.o generic.o isoch.o
 
+ifeq ($(CONFIG_DRM_LEGACY),y)
 agpgart-$(CONFIG_COMPAT)	+= compat_ioctl.o
+agpgart-y			+= frontend.o
+endif
+
 
 obj-$(CONFIG_AGP)		+= agpgart.o
 obj-$(CONFIG_AGP_ALI)		+= ali-agp.o
diff --git a/drivers/char/agp/agp.h b/drivers/char/agp/agp.h
index 4eb1c772ded7..bb09d64cd51e 100644
--- a/drivers/char/agp/agp.h
+++ b/drivers/char/agp/agp.h
@@ -186,8 +186,13 @@ int agp_add_bridge(struct agp_bridge_data *bridge);
 void agp_remove_bridge(struct agp_bridge_data *bridge);
 
 /* Frontend routines. */
+#if IS_ENABLED(CONFIG_DRM_LEGACY)
 int agp_frontend_initialize(void);
 void agp_frontend_cleanup(void);
+#else
+static inline int agp_frontend_initialize(void) { return 0; }
+static inline void agp_frontend_cleanup(void) {}
+#endif
 
 /* Generic routines. */
 void agp_generic_enable(struct agp_bridge_data *bridge, u32 mode);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
