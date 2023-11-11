Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C59247E8863
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 03:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F69E10E24A;
	Sat, 11 Nov 2023 02:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D4E10E24A
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 02:41:46 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-66cfc96f475so15479386d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 18:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699670506; x=1700275306; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=msNrrEN0bZwqIlYo+MsvtI+OgOD1hUza7H9RwsFo/P4=;
 b=LZMTYPPqtHrMOFwHlL4/uhUICc4Tv9LgKpA/55lsxnD05T1XpDxbjKnnezpS0gmKj6
 Rcs89y0xg3Cf5T1zRxMDYGSyn3iPLqnnMPzXi8hk9x+UOM4ksiKx/lc2xti4+xa+GhXG
 IaseUE/JsPP17Ty6Lo2VrD3loNHHdEoRZ5/cHPZ+NoeFok65ZmewJfCPgPSiqPXDGoEc
 3HZRTotIoofhrukFUD5rVjjazgJM9g+Tn8aTRqjkTqTmRB2kwuYJP6ziM0OmsT8Z/8zF
 zAGDwOWphWkizivj7CfIXwm3yC6vDsmpjBbB6B5SzAiL9ZvBEd/MM7Hm9UIi9shhgGLs
 6nQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699670506; x=1700275306;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=msNrrEN0bZwqIlYo+MsvtI+OgOD1hUza7H9RwsFo/P4=;
 b=gOc/i78B/v3+mWj5MCk81tDJo6npV0cOB7qjR6gM42fCV+9+Q20Cbl68DEisnVzyED
 excxYRRmVDIjIzHZNAXtwvxJc51NVICWAF13zBu4uW6G7Fjz3T2CDhMZJKDUZAVcy3Qs
 WreW6FID1YM0a7y3+F1tWhYDfqyyHeLTYt3l3i0fbrhjRhD6HGZBSoE8i0XWwEZzZpt0
 /3KL38s3toXMI2IEALvUOwPGVaia/ZRbZ4TrDy9X/qL22JQL5NuXQ88PPxUllpXBqkHr
 2SVLuR2xYf+hdR97mqYsDtaHKxjU45gPj+HLRyZMvnoiqjCi7LmjPsfhja3D1oNGDtOL
 Mu3g==
X-Gm-Message-State: AOJu0YzrA5I7QJCO/J9gQk0QPznfcXYK/yHVKtn5qRi5AKauyDDXO1TP
 8EKkTXMdZWYUDi1b3ddi27A=
X-Google-Smtp-Source: AGHT+IEItfmxshsDKVqO/tBJl8NjyHU2T8EBRtv7IusqkXaaD86HXi8wxIfWSqstn1wYd4683lLZrQ==
X-Received: by 2002:a0c:ea4a:0:b0:66d:65ae:18f6 with SMTP id
 u10-20020a0cea4a000000b0066d65ae18f6mr956796qvp.50.1699670505800; 
 Fri, 10 Nov 2023 18:41:45 -0800 (PST)
Received: from localhost.localdomain ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a0cfde8000000b0065aff6b49afsm279814qvu.110.2023.11.10.18.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 18:41:45 -0800 (PST)
From: Luben Tuikov <ltuikov89@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH] Revert "drm/sched: Define pr_fmt() for DRM using pr_*()"
Date: Fri, 10 Nov 2023 21:41:31 -0500
Message-ID: <20231111024130.11464-2-ltuikov89@gmail.com>
X-Mailer: git-send-email 2.42.1
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
Cc: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>, Luben Tuikov <ltuikov89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 36245bd02e88e68ac5955c2958c968879d7b75a9.

Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
---
 include/drm/drm_print.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index e8fe60d0eb8783..a93a387f8a1a15 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -26,20 +26,6 @@
 #ifndef DRM_PRINT_H_
 #define DRM_PRINT_H_
 
-/* Define this before including linux/printk.h, so that the format
- * string in pr_*() macros is correctly set for DRM. If a file wants
- * to define this to something else, it should do so before including
- * this header file.
- *
- * It is encouraged code using pr_err() to prefix their format with
- * the string "*ERROR* ", to make it easier to scan kernel logs. For
- * instance,
- *   pr_err("*ERROR* <the rest of your format string here>", args).
- */
-#ifndef pr_fmt
-#define pr_fmt(fmt) "[drm] " fmt
-#endif
-
 #include <linux/compiler.h>
 #include <linux/printk.h>
 #include <linux/seq_file.h>

base-commit: 540527b1385fb203cc4513ca838b4de60bbbc49a
-- 
2.42.1

