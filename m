Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A24313969
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 17:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E2F6E947;
	Mon,  8 Feb 2021 16:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x361.google.com (mail-ot1-x361.google.com
 [IPv6:2607:f8b0:4864:20::361])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B656E940
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 16:27:32 +0000 (UTC)
Received: by mail-ot1-x361.google.com with SMTP id t25so14733233otc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 08:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=UjaMVAkUm/PvPSzJ6Ox4dyJNaMwYeRAb1DeN5PLuAXY=;
 b=LNuLrbFjide/iQfXvUvyxZ+6u8/wttMxozkZkFXtXXsKZIxCwBq71dFUl4ODKMqQye
 /w5dEVhpsuZwnBGvGm+PRQ+ZZINgjswqjleO+tAGPv2STuHKR1gtMjEGlmUUPNRIVm7S
 Rr21axYojoK53pdZwlja+Lu3nwchXxh7rHlpplWKMx86jqaymQTZonYSv2tGgIr8WIBo
 ynZ2kPnzq1/MmQIOhhOrQqBCRguZtYJEIOoxW/NFXZj7EE0m9IAwCt+zt5GWw+oMe7KW
 0yCdTWYtai2Vj8PCeoU66eRJCE4g/4fcTzcvk0nl4K5+tP2BqO5IcHwIr6gBOa1kcifm
 69YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UjaMVAkUm/PvPSzJ6Ox4dyJNaMwYeRAb1DeN5PLuAXY=;
 b=Ignxtu0Bx2/j6ORz15Uy7uvaZQEpPUvr+wJnfuOOAUDPJOA+pMKRpAgaRkYbDGMHIK
 rcVqZbxab93TpWp1WKEmAaMFNeSXaxE07iX9toNNYOoglm+9NTw0eLje8zddHWl7U3+d
 1QUlfUV8grRtaeR/r/YJzAlWq0oG3WC0DKrpsK1zltF7VZ+3CcNiC8A41RR+nL+jkKyv
 fbVXDdGnq+8u3YZ5Dt8a4whCyeZpSOQyIcULAZX7DtmvrngY1kpT2SbQJC3CJvuAe/eK
 FhzIWFgKo2qK13HRjqIyKVLm+tyom0ASxQieEceqnNi+IDhZJG6qJuh3o6ccVzs2Dcmn
 ahpA==
X-Gm-Message-State: AOAM532yzFsBJJX7VOXyzf/Q7WV3lDGoCIUrJcnSWAeuXUDymQL49bDG
 YF9JcI+X+AahdXKc+7agYmE6VLOD4EDbWb2dEAHAdVwWxwXQ5g==
X-Google-Smtp-Source: ABdhPJyZ7QEYm23rHdSDLnNrvHK8ddaVSiSCCSFhzYLb2HvB8qr4cHR5f4QtjY50mQrZys15Dc0Ea2t5HEZv
X-Received: by 2002:a9d:1d04:: with SMTP id m4mr12817683otm.142.1612801652080; 
 Mon, 08 Feb 2021 08:27:32 -0800 (PST)
Received: from DESKTOP-G3VVM7A.localdomain (c-24-5-176-39.hsd1.ca.comcast.net.
 [24.5.176.39])
 by smtp-relay.gmail.com with ESMTPS id w16sm2102444ott.4.2021.02.08.08.27.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Feb 2021 08:27:32 -0800 (PST)
X-Relaying-Domain: lagfreegames.com
From: James Park <jpark37@lagfreegames.com>
To: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com,
 contact@emersion.fr
Subject: [PATCH v2] drm: DRM_FOURCC_STANDALONE macro support
Date: Mon,  8 Feb 2021 08:26:26 -0800
Message-Id: <1612801586-128-1-git-send-email-jpark37@lagfreegames.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 08 Feb 2021 16:29:08 +0000
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
Acked-by: Simon Ser <contact@emersion.fr>
---
Add Acked-by line to the commit description.

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
