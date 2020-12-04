Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5032CE9E7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663026EC8B;
	Fri,  4 Dec 2020 08:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x263.google.com (mail-oi1-x263.google.com
 [IPv6:2607:f8b0:4864:20::263])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318746E125
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 04:54:30 +0000 (UTC)
Received: by mail-oi1-x263.google.com with SMTP id k26so4907715oiw.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Dec 2020 20:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RhGluzPCY0jaDSnYVUVSvourf+NQsLHxj23edA1YAL0=;
 b=JFKOfq9V+WGj1sVzt2voaQy3RnRUtppk8jcilN4VQRUKeK1is5RwmBUvrF4gscDx9k
 TmISbus178URUPreOTU/Uw0L55nTlA1lWGYnHUQ4TG7haJ7KZWBxBDGRoVAFBfuilGxo
 reYyKVRk6OLYYG3ugv1w7IOW4950jYFXZ8WzT43iA2cUVFsCxPT1XtQ3VqfJrWziHZyU
 r8+yjVlhSjbCLgjStTwn6ndU9IuaoMxrbHKvMOJq4NeejDtRD/61i11WijxxUjfbJDUQ
 Zn3i1RKwbqDKfu6TvwnYXmZ7bNfY5J8ngJtltwYxjqqsQZCMa7z206THrysqQLE4fX5R
 VtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RhGluzPCY0jaDSnYVUVSvourf+NQsLHxj23edA1YAL0=;
 b=pJUH6Z0kbx+6aZFsI1IayJkDjfyF/V3ctmZaOkElMU+zept6ixu8ZE8XK3kuWirYg2
 xgg++sd2Vx81Ok+Z1QCzaTIiC7sGW2XR9oFzXKLpBfVrhaQKUrYCsjRZNiy/QuaAkQu2
 ORx1wBOWVAJERgpu2JEr8RN8CYfBibV9DQinZRonmrn7uSN/cH9EJMXP8aw20tUsMuF5
 RmcS8palf4zuZUo+nm1zpAl2PZxonP/9jjW44qV8jW/JOoHSwH+gWrDwRncWBPPInmJW
 A9oIAe2o2dXGCqA8H58ISlaStP8YZTc1GNlofl9APGhei6QrnsgVH6ZD0Jwdj7DNO95V
 psMA==
X-Gm-Message-State: AOAM531uc+qDlLPg1VhBVga/+hiAg1zqI7gyPHtk11kN025/vvLD2qO0
 HOxcPiSNbR4w268mnf4WscXHqz5o5l5z7xQlw9G5YUJly2puvg==
X-Google-Smtp-Source: ABdhPJxjAgeoQMiPzEksBvG2rH9Fz4xzORTTCuA+dVQZYVkwW3iKOrv40s9pL4Hoe0fcXbQAWw1P/fu9WV12
X-Received: by 2002:aca:ea87:: with SMTP id i129mr2027343oih.166.1607057669453; 
 Thu, 03 Dec 2020 20:54:29 -0800 (PST)
Received: from DESKTOP-G3VVM7A.localdomain (c-24-5-176-39.hsd1.ca.comcast.net.
 [24.5.176.39])
 by smtp-relay.gmail.com with ESMTPS id g12sm229922oos.21.2020.12.03.20.54.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Dec 2020 20:54:29 -0800 (PST)
X-Relaying-Domain: lagfreegames.com
From: James Park <jpark37@lagfreegames.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Allow drm_fourcc.h without including drm.h
Date: Thu,  3 Dec 2020 20:53:37 -0800
Message-Id: <1607057617-145-2-git-send-email-jpark37@lagfreegames.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607057617-145-1-git-send-email-jpark37@lagfreegames.com>
References: <CAKMK7uG3JbUuaJ3UUTHgeYCKnD9+n_bbeX=xka9o+TLJHwHJZQ@mail.gmail.com>
 <1607057617-145-1-git-send-email-jpark37@lagfreegames.com>
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:33 +0000
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
Cc: James Park <jpark37@lagfreegames.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DRM_FOURCC_STANDALONE guard to skip drm.h dependency.

This will allow Mesa to port code to Windows more easily.

Signed-off-by: James Park <jpark37@lagfreegames.com>
---
 include/uapi/drm/drm_fourcc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 82f3278..159a9d0 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -24,7 +24,13 @@
 #ifndef DRM_FOURCC_H
 #define DRM_FOURCC_H
 
+#ifdef DRM_FOURCC_STANDALONE
+#include <stdint.h>
+typedef uint32_t __u32;
+typedef uint64_t __u64;
+#else
 #include "drm.h"
+#endif
 
 #if defined(__cplusplus)
 extern "C" {
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
