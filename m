Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7412D2618
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0166E9BC;
	Tue,  8 Dec 2020 08:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x463.google.com (mail-pf1-x463.google.com
 [IPv6:2607:f8b0:4864:20::463])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAF389E1B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 18:16:38 +0000 (UTC)
Received: by mail-pf1-x463.google.com with SMTP id b26so10860909pfi.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 10:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9PCQJCtHGcbt78oKyLMduI3qhRhK5FQL8fGW261JSag=;
 b=eAbw+HpwQhKdYtLC+av6zXgMY+83EtjEaWbSrk7fkfgMxd4HAhtlnyjE40lOPuUOoo
 druQw4xyo6V94isoXycBmyobZoSuhnrRZayDdCKONtxxV9+XVbBVqig17+isnmBoOxQ7
 Tzu5q1tklBS19XpddoQiuv5TJh8qykdHmAVQlclOb2fOjpr+7+SpeDPgMWzMP1IvyLy4
 yDY4ufF3kuzGRt/bDqcrrbdIAvmVTUcEG+zeM39f3CksBLvIClQCGKAAGG2weswHvjy7
 IEdIAWvrK8qLyKCV/tyGBpV6u+R//k8/FlxjRoqXmZUyubyOHo7Bv6hdcD9FWgIeCP9c
 H+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9PCQJCtHGcbt78oKyLMduI3qhRhK5FQL8fGW261JSag=;
 b=VplgbnqAC/GWIZhnogU7+GhT+TyLgcBNG41LPCydgjuBgDfLefYkGXll/OlThttnLC
 PTcVecFneK2RH6wKAGT2u0K8jBGKKpBe1MW2LpP7EexMqmD6QLtnLdKPqkXOPaw8cOVe
 q2tnAO/8486lT3QAqeM466zwSxNXj5lM0Xy7zCWWMKp9ExuT2s2KAJmbrR7EtqL0GoVp
 +Eob9MuT7pc4EJCL8/SkKNeTocng7IlpTrrceG8FAPjcTK3FFMI6xbalSYit+vZaKwg2
 QdgDSTz6KcrvZ34aqQKD0rxFTdCS7rxzt0FN0jOA0kw+d9GebsPtory09zKeL++90PB3
 s3pQ==
X-Gm-Message-State: AOAM532RXqWJbQb34BGjsOp9Irr/JGxVPihiUCnw9fib7mNVevLIfQ2q
 VJM2kKoi5IdJS+fpiSknBs1JzMlUy19ZQM0Wim5lVfTnSA4l9Q==
X-Google-Smtp-Source: ABdhPJx0P4VuaGsZ/ESvobjKj+N5CcQVQuZVrP5Eq3fBX0Oqp6MmjC3nbwumzY6vKuhT6UbByRD8WRHe1XXE
X-Received: by 2002:a63:4e07:: with SMTP id c7mr19245854pgb.414.1607364998219; 
 Mon, 07 Dec 2020 10:16:38 -0800 (PST)
Received: from DESKTOP-G3VVM7A.localdomain (c-24-5-176-39.hsd1.ca.comcast.net.
 [24.5.176.39])
 by smtp-relay.gmail.com with ESMTPS id c18sm9523pjr.12.2020.12.07.10.16.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Dec 2020 10:16:38 -0800 (PST)
X-Relaying-Domain: lagfreegames.com
From: James Park <jpark37@lagfreegames.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
Date: Mon,  7 Dec 2020 10:15:39 -0800
Message-Id: <1607364939-640-2-git-send-email-jpark37@lagfreegames.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607364939-640-1-git-send-email-jpark37@lagfreegames.com>
References: <202012080129.qAoCOovN-lkp@intel.com>
 <1607364939-640-1-git-send-email-jpark37@lagfreegames.com>
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
