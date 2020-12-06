Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61DA2D0C59
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:58:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A416E7F5;
	Mon,  7 Dec 2020 08:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x461.google.com (mail-pf1-x461.google.com
 [IPv6:2607:f8b0:4864:20::461])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348AA89FD9
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 00:40:20 +0000 (UTC)
Received: by mail-pf1-x461.google.com with SMTP id b26so6501738pfi.3
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Dec 2020 16:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2Ir2Mj45Rjtgd5ovlyuO/QieTXMmSu7pmNTviFKI44s=;
 b=UFXOSS/+uSqDjASY/xTda/2BxIkFvQf/VjVlWEJPcAtJz2ciLcpETNVgzvvCQGEXJv
 NS0rRC6OqdzFe3HPR2p2xsPDWxXcsgBS+Ojm/kk2bfGIpTCqN5oPnLhjjI0T5UpYjjcP
 J56uTzrsx7WqIk0jPk3Ym+reY1t73US8ii1t3tsYxm8j5k3Z0GuxvNOqAW9Y/XVxIak4
 OY8W46HkMhlmJ4pOTXzFlx6mHs4R6QiJxE7jmauFH69ziTC7mvgjA6panpL9q/wZNgQQ
 K4QCIoSCUompFjbfz9mKkKFZKsgO/oSvOzCY8ucAC5yBR9+kGFfGWJyueRgF7Oqx8n7w
 6MgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2Ir2Mj45Rjtgd5ovlyuO/QieTXMmSu7pmNTviFKI44s=;
 b=SNwHzQEPjkyLsVcesJxwgnoJ3h++pL+y226D4tXWgM7Gani+ccIiaF/geY/FkNWHvX
 oNAFOAJ3D/LyGDC9b6nLH795fmBX8lqib8s42SPxaTfLx6DvbaVSXYcI+2N3FofCKJh6
 uRNfgSN8qfsoz7b/JxRoIwAPvnakUyIlakujmLqOce3BoHSu5AcfGXf/orB4vdbf2/GS
 pkA3CoH8AxEIsRS7yt1Dx4QyYuhqpR6S+4ZSAyNHKGzxW9Jck7EmzmSFyFO0FzYwIB8Z
 cj49ewph7CNjOd5WB8RciZcEiYxZ+TteruLLq/j5mmMkDEr+DkH/JM/ckkcCYBwFRj60
 Vabw==
X-Gm-Message-State: AOAM533KLA8QDK5WMU21MoPLWFeVS5OTN5j+dHOELsqmDAGAUhJzq17Z
 D9EMyqOaYO6hW7UN80lVBJuMnKLkI3DRyWXtdT5r2OkVI/pNRg==
X-Google-Smtp-Source: ABdhPJx+8/iH+9SZYTd3XCM+fKm3GXvkFxJUEMq6KosSvZd4Xh69BIkzQF2LexmDVakOYxvLGiV35pyKFope
X-Received: by 2002:aa7:9087:0:b029:197:daff:a9a8 with SMTP id
 i7-20020aa790870000b0290197daffa9a8mr10068876pfa.26.1607215219847; 
 Sat, 05 Dec 2020 16:40:19 -0800 (PST)
Received: from DESKTOP-G3VVM7A.localdomain (c-24-5-176-39.hsd1.ca.comcast.net.
 [24.5.176.39])
 by smtp-relay.gmail.com with ESMTPS id nu5sm807680pjb.14.2020.12.05.16.40.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 05 Dec 2020 16:40:19 -0800 (PST)
X-Relaying-Domain: lagfreegames.com
From: James Park <jpark37@lagfreegames.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
Date: Sat,  5 Dec 2020 16:39:31 -0800
Message-Id: <1607215171-36-2-git-send-email-jpark37@lagfreegames.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607215171-36-1-git-send-email-jpark37@lagfreegames.com>
References: <CABjik9dirbf13ZiVBvufitGJXja6Xvn=EqTG_VtvBHjaAwJATg@mail.gmail.com>
 <1607215171-36-1-git-send-email-jpark37@lagfreegames.com>
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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

Create drm_basic_types.h to define types previously defined by drm.h.

Use DRM_FOURCC_STANDALONE to include drm_fourcc.h, replacing drm.h
dependency with drm_basic_types.h.

This will allow Mesa to port code to Windows more easily.

Signed-off-by: James Park <jpark37@lagfreegames.com>
---
 include/uapi/drm/drm.h             | 14 ++--------
 include/uapi/drm/drm_basic_types.h | 52 ++++++++++++++++++++++++++++++++++++++
 include/uapi/drm/drm_fourcc.h      |  4 +++
 3 files changed, 58 insertions(+), 12 deletions(-)
 create mode 100644 include/uapi/drm/drm_basic_types.h

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 808b48a..a7f38fc 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -36,32 +36,22 @@
 #ifndef _DRM_H_
 #define _DRM_H_
 
+#include "drm_basic_types.h"
+
 #if defined(__KERNEL__)
 
-#include <linux/types.h>
 #include <asm/ioctl.h>
 typedef unsigned int drm_handle_t;
 
 #elif defined(__linux__)
 
-#include <linux/types.h>
 #include <asm/ioctl.h>
 typedef unsigned int drm_handle_t;
 
 #else /* One of the BSDs */
 
-#include <stdint.h>
 #include <sys/ioccom.h>
 #include <sys/types.h>
-typedef int8_t   __s8;
-typedef uint8_t  __u8;
-typedef int16_t  __s16;
-typedef uint16_t __u16;
-typedef int32_t  __s32;
-typedef uint32_t __u32;
-typedef int64_t  __s64;
-typedef uint64_t __u64;
-typedef size_t   __kernel_size_t;
 typedef unsigned long drm_handle_t;
 
 #endif
diff --git a/include/uapi/drm/drm_basic_types.h b/include/uapi/drm/drm_basic_types.h
new file mode 100644
index 0000000..b3c00bb
--- /dev/null
+++ b/include/uapi/drm/drm_basic_types.h
@@ -0,0 +1,52 @@
+/*
+ * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.
+ * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
+ * All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef _DRM_BASIC_TYPES_H_
+#define _DRM_BASIC_TYPES_H_
+
+#if defined(__KERNEL__)
+
+#include <linux/types.h>
+
+#elif defined(__linux__)
+
+#include <linux/types.h>
+
+#else /* One of the BSDs */
+
+#include <stdint.h>
+typedef int8_t   __s8;
+typedef uint8_t  __u8;
+typedef int16_t  __s16;
+typedef uint16_t __u16;
+typedef int32_t  __s32;
+typedef uint32_t __u32;
+typedef int64_t  __s64;
+typedef uint64_t __u64;
+typedef size_t   __kernel_size_t;
+
+#endif
+
+#endif
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 82f3278..5eb07a5 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -24,7 +24,11 @@
 #ifndef DRM_FOURCC_H
 #define DRM_FOURCC_H
 
+#ifdef DRM_FOURCC_STANDALONE
+#include "drm_basic_types.h"
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
