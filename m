Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 948422D5E75
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDC86EAA2;
	Thu, 10 Dec 2020 14:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc63.google.com (mail-oo1-xc63.google.com
 [IPv6:2607:f8b0:4864:20::c63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF37C6EA4A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 09:13:12 +0000 (UTC)
Received: by mail-oo1-xc63.google.com with SMTP id i18so1106588ooh.5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 01:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OZPmxxw56UZy44SeTXd+0TVQh79ExqhpLRdJnf0ou/A=;
 b=ObF7DS7rvsKT5BEJG00hmY+/FlqMU0pJ8Fdk+4wBZEOeZ3SoO2RqnV1WyFzyJdcVjV
 aAh5/leY1nDp1PSNMc9wTIrBdusjS5YHHr+Xun8qxyIWL9j4HGsgmzv8u+/87fymwAZZ
 9R06ptBSV4TrjIAh23EZD7VLpHofs6VWLacueREtDXXcQ7oReCzomD4ck2fQK4gZsvI1
 A7IZjjIqOib750u+ywnkS1bOAJPuINcSK99oKWk22MHs8FhppEKYLrRZhU2pW6WqwQTX
 0+hPL0N6SoAkLu5ruwz2tkYzzPcnZt/a9dziEuX48VTmRpYudl/MqtG4yDw25hEaGNab
 A2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OZPmxxw56UZy44SeTXd+0TVQh79ExqhpLRdJnf0ou/A=;
 b=pMXyR0e53E3Cl8njYYEapsjnRn+vPg4Vx0KaoTZ7+fpsMBV0R6FyGABfIIXEvEYSgt
 D0m08crBbITWAwYvBdPj26n0YWq8uNj/Mo+U8zU2x/lV7iIjBQax/vNCM/5R0SYs/Qos
 uxaEaZFLUz4Wea5lIpauO19GA+7O5v6Xgz61MXuV+5NoE/c6lO9+rLSGHlKFz5TU+eQu
 ua9E2PJSmVOSTlCBkFMqxxemOQTw8uRCwtMrgDkt7A2wGOrYvcDiX+tmt7LoAJ1J8UhX
 gmWiOY/HiX1Ec73uM7VtJ3/CwsSixRKA2FzBVH7Arw4WEcXI+/qH4reY8bvIghy3wMfd
 iSJw==
X-Gm-Message-State: AOAM530gfD8aKYh2n5583qxpGwvCCu10iKUhBKJVBjWz8mVz53IZvS99
 kFrE/B/JBwh8FaKcluyNs58oFuuyBo7n/brnkGgxl5+KgE0yiA==
X-Google-Smtp-Source: ABdhPJyz4bimv05r0XNECsgajax6G5DopcomoBYbv8LiXzGqAP+xP64bpM9ojfGJduWZWrGa5MBuGyHuIVQp
X-Received: by 2002:a4a:be81:: with SMTP id o1mr5222453oop.25.1607591592234;
 Thu, 10 Dec 2020 01:13:12 -0800 (PST)
Received: from DESKTOP-G3VVM7A.localdomain (c-24-5-176-39.hsd1.ca.comcast.net.
 [24.5.176.39])
 by smtp-relay.gmail.com with ESMTPS id q24sm744353oov.1.2020.12.10.01.13.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Dec 2020 01:13:12 -0800 (PST)
X-Relaying-Domain: lagfreegames.com
From: James Park <jpark37@lagfreegames.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
Date: Thu, 10 Dec 2020 01:12:54 -0800
Message-Id: <1607591574-949-2-git-send-email-jpark37@lagfreegames.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607591574-949-1-git-send-email-jpark37@lagfreegames.com>
References: <20201210103553.1ae238d2@eldfell>
 <1607591574-949-1-git-send-email-jpark37@lagfreegames.com>
X-Mailman-Approved-At: Thu, 10 Dec 2020 14:48:10 +0000
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

Use DRM_FOURCC_STANDALONE to include drm_fourcc.h without drm.h.

This will allow Mesa to port code to Windows more easily.

Signed-off-by: James Park <jpark37@lagfreegames.com>
Acked-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
---
 include/uapi/drm/drm.h             | 12 ++-------
 include/uapi/drm/drm_basic_types.h | 52 ++++++++++++++++++++++++++++++++++++++
 include/uapi/drm/drm_fourcc.h      |  4 +++
 3 files changed, 58 insertions(+), 10 deletions(-)
 create mode 100644 include/uapi/drm/drm_basic_types.h

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 808b48a..d9ba922 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -36,6 +36,8 @@
 #ifndef _DRM_H_
 #define _DRM_H_
 
+#include "drm_basic_types.h"
+
 #if defined(__KERNEL__)
 
 #include <linux/types.h>
@@ -50,18 +52,8 @@ typedef unsigned int drm_handle_t;
 
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
index 0000000..da1f2c0
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
+#else /* Not Linux */
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
index 82f3278..539870f 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -24,7 +24,11 @@
 #ifndef DRM_FOURCC_H
 #define DRM_FOURCC_H
 
+#include "drm_basic_types.h"
+
+#ifndef DRM_FOURCC_STANDALONE
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
