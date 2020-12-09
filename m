Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 797CA2D5561
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 09:26:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769486EA4D;
	Thu, 10 Dec 2020 08:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x864.google.com (mail-qt1-x864.google.com
 [IPv6:2607:f8b0:4864:20::864])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF54E6E9EC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 11:03:21 +0000 (UTC)
Received: by mail-qt1-x864.google.com with SMTP id k4so577147qtj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 03:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8YaD/6Evjmg3Bqe/RSCj7qhkyb7tbfbZhCqdfnK1wME=;
 b=GHgD59h7WfpTSzPLMT9+FEnbk5RZOcaoyerbH9LJC9NEAuE/CCTo5A56EfNRv4o7ZP
 1M/JShL/FtTmzTEPlKJTdgwYi1m7St1S+iZwYw48pIr3UJNsxz4spYnH/ekMQxEoH0Wl
 nprQTGTvD3nn0hfBVe0VBRuzD7uGpgBuQV1W7whUCUb8xec1RrCAOW692Orss0rNpw+m
 M5P0pMF9sfNBrNkoxbI+QvsZOWJD7WaZlnBMLixA2hJiUu7S2UobCj1UNmEzCoxh97ms
 yJrKaUkLWPV4iIYyHLf6MwGM2PHP29EaIMN3qI9x3p55x51DOR1oGfkbDQHO5BTyI8PF
 wPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8YaD/6Evjmg3Bqe/RSCj7qhkyb7tbfbZhCqdfnK1wME=;
 b=LtBA415FrSpjBm0b0sISy+rDP7y68Hp0Wr3PcXcNaCl4YPFLFLkD9MNoPXtNCiVCqT
 uR8pDNMzVo95iLfgg+45My+sb7PX7ZAxmzPjZp6k2JhVHX/S6zhWwYW4gmdKEbq2Yi/c
 Lv7FjIdfCIrrkKqb8BGEo5vMjHOCB2pMPNDrATNksmjRLR0nySY1nlPiIaGr8g6ig/Zr
 Ab2yodM4Jf0LhrE7JLhyqymRMCsELL7QcgJjs3qVArcSe5L0U/kwK8NWcE7/dt5MU9AW
 Mx1iz7jZKCybqJxYIlzD7LYlLk9jmCaAuDQgTL4ebE+uQjX3qbz00KTAQoXjCz9H3PaB
 dOdg==
X-Gm-Message-State: AOAM531GiJcesGDLE+bx2mBM6PTxS6vMockki4v+drMg7qZ14gyTrPyL
 gj+NaU7v+mkV2iMYADDccyqwf9rQTsNEYyg5t4Q9jiRBp+qCYw==
X-Google-Smtp-Source: ABdhPJx0b1OflrW+LLooHu8PEhxjIueGsIFFbpso5thAlRuYLFKW6iGkg4kEbjzZxGKWz+B6F/y8G7/bt9wa
X-Received: by 2002:ac8:4818:: with SMTP id g24mr2336007qtq.252.1607511800893; 
 Wed, 09 Dec 2020 03:03:20 -0800 (PST)
Received: from DESKTOP-G3VVM7A.localdomain (c-24-5-176-39.hsd1.ca.comcast.net.
 [24.5.176.39])
 by smtp-relay.gmail.com with ESMTPS id b18sm166117qkg.7.2020.12.09.03.03.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Dec 2020 03:03:20 -0800 (PST)
X-Relaying-Domain: lagfreegames.com
From: James Park <jpark37@lagfreegames.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: drm_basic_types.h, DRM_FOURCC_STANDALONE
Date: Wed,  9 Dec 2020 03:03:10 -0800
Message-Id: <1607511790-817-2-git-send-email-jpark37@lagfreegames.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607511790-817-1-git-send-email-jpark37@lagfreegames.com>
References: <VOvpgkJSLSX_nWnr-hgXPJUyndzrUMaHHFos_Smu67du13TLRRPLDpySE45bht1cGd_xTsGoQbJ5gGT4Ofzmji1lXa5eZNCkmUf8QkUyWx0=@emersion.fr>
 <1607511790-817-1-git-send-email-jpark37@lagfreegames.com>
X-Mailman-Approved-At: Thu, 10 Dec 2020 08:25:40 +0000
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
