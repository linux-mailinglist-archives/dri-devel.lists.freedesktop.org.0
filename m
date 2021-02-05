Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2AE3106C5
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 09:33:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F336F399;
	Fri,  5 Feb 2021 08:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x561.google.com (mail-pg1-x561.google.com
 [IPv6:2607:f8b0:4864:20::561])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC98F6E14D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 02:55:54 +0000 (UTC)
Received: by mail-pg1-x561.google.com with SMTP id o7so3551950pgl.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 18:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=cVsRhsCRwnHV+/wfAVetiaNEAkab3Kv3lRCDNx7lxcI=;
 b=I6w/7lRz2p2gPDZkUvZvkqku9CPMQBNDqB8ywHjFeWiMReT1bqVXIspBOrSbpfsjKY
 p6GPSLtaK89AVULrNYEdsM33WeeeT+aGBqyyJqjEIAy0ghVdVFGJ4zX2d8qZV0yBfEzQ
 d6OGN/WIyDK5tkeQdqrK6V7BpjxWik1mFOJGEuJltuZsbhGIa/LjvwTZW8+0t7TPyUM2
 v97TDHBHq1d589uXqmBJjrZbWaWj/xxfPNuy0VcAmHgJxwzbylbMoWPP93GRghMagyos
 f/rxFGfSEqFi5eyTXOhtoEDC+BWP6eMGfmf4jd5p6rOm8R9sWZoHFJhzYierftFBge5C
 PrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cVsRhsCRwnHV+/wfAVetiaNEAkab3Kv3lRCDNx7lxcI=;
 b=lTQFuAbPm4YjQDqllHPTiGEJ4rmVEAk6A/1ZnncoV1t8RbwRjomVbhSI2MNCqyADyL
 GasIxUb8wKpvnx2C20Ftz1B57dIRTdfDofwmk03r5doLubwfRBYufwXjjxQ+fa2eMe5c
 +Y2ISa97BONdJrXqPCVgIjnGMmSI2/TvMsWg4mLcVo2Zaq6s/ka2oMOU7wvOsKaPEWFk
 R3et1hBH9xeuGi+/SQDIrDNrndhBS7Bjakpit19JlBKbwyUGeUofHJLc8c5Q3oejdEob
 qmtYjMDUahL6drtJeesBke70Ev/f09yM1XIRtVpq0AtfHKJDYr7c1GbiNW5AM430q3w5
 o56g==
X-Gm-Message-State: AOAM533S8dHxLe0jYoCjcSSoF/1omOerctppsBNmJJW2CFyDuiuT839s
 56NOk4XRj4YQFEIfWyCu6Qoqcd+RsWFxaQ4vWL3eKzdx3Sp6PQ==
X-Google-Smtp-Source: ABdhPJzWlRZoUpmQ2gTBTcBiGH5C1SZ7l1ULW57W07PLs2Y5IThpEqJ20CMbIB4Lgc62WoVQWU1hlM1YH04f
X-Received: by 2002:a63:dd42:: with SMTP id g2mr2073061pgj.285.1612493754236; 
 Thu, 04 Feb 2021 18:55:54 -0800 (PST)
Received: from DESKTOP-G3VVM7A.localdomain (c-24-5-176-39.hsd1.ca.comcast.net.
 [24.5.176.39])
 by smtp-relay.gmail.com with ESMTPS id lb5sm980392pjb.17.2021.02.04.18.55.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Feb 2021 18:55:54 -0800 (PST)
X-Relaying-Domain: lagfreegames.com
From: James Park <jpark37@lagfreegames.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: DRM_FOURCC_STANDALONE macro support
Date: Thu,  4 Feb 2021 18:54:26 -0800
Message-Id: <1612493666-757-1-git-send-email-jpark37@lagfreegames.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Fri, 05 Feb 2021 08:33:33 +0000
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

Use DRM_FOURCC_STANDALONE to include drm_fourcc.h without drm.h.

Copy type definitions from drm.h to drm_fourcc.h, and wrap with
DRM_BASIC_TYPED_DEFINED to avoid redundant inclusion.

This will allow code to avoid unnecessary definitions.

Signed-off-by: James Park <jpark37@lagfreegames.com>
---
 include/uapi/drm/drm.h        | 35 ++++++++++++++++++++++++++++-------
 include/uapi/drm/drm_fourcc.h | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+), 7 deletions(-)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 808b48a..5640062 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -36,23 +36,25 @@
 #ifndef _DRM_H_
 #define _DRM_H_
 
+/**
+ * DRM_BASIC_TYPES_DEFINED section exists in both drm.h and drm_fourcc.h files.
+ * Do not modify the section in one file without updating the other!
+ */
+
+#ifndef DRM_BASIC_TYPES_DEFINED
+#define DRM_BASIC_TYPES_DEFINED
+
 #if defined(__KERNEL__)
 
 #include <linux/types.h>
-#include <asm/ioctl.h>
-typedef unsigned int drm_handle_t;
 
 #elif defined(__linux__)
 
 #include <linux/types.h>
-#include <asm/ioctl.h>
-typedef unsigned int drm_handle_t;
 
-#else /* One of the BSDs */
+#else /* Not Linux */
 
 #include <stdint.h>
-#include <sys/ioccom.h>
-#include <sys/types.h>
 typedef int8_t   __s8;
 typedef uint8_t  __u8;
 typedef int16_t  __s16;
@@ -62,6 +64,25 @@ typedef uint32_t __u32;
 typedef int64_t  __s64;
 typedef uint64_t __u64;
 typedef size_t   __kernel_size_t;
+
+#endif
+
+#endif /* DRM_BASIC_TYPES_DEFINED */
+
+#if defined(__KERNEL__)
+
+#include <asm/ioctl.h>
+typedef unsigned int drm_handle_t;
+
+#elif defined(__linux__)
+
+#include <asm/ioctl.h>
+typedef unsigned int drm_handle_t;
+
+#else /* One of the BSDs */
+
+#include <sys/ioccom.h>
+#include <sys/types.h>
 typedef unsigned long drm_handle_t;
 
 #endif
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 723c8e2..5e5f4cf 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -24,7 +24,42 @@
 #ifndef DRM_FOURCC_H
 #define DRM_FOURCC_H
 
+/**
+ * DRM_BASIC_TYPES_DEFINED section exists in both drm.h and drm_fourcc.h files.
+ * Do not modify the section in one file without updating the other!
+ */
+
+#ifndef DRM_BASIC_TYPES_DEFINED
+#define DRM_BASIC_TYPES_DEFINED
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
+#endif /* DRM_BASIC_TYPES_DEFINED */
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
