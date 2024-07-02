Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 453F8924A77
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D4A10E6E2;
	Tue,  2 Jul 2024 21:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ATWWM0jC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282A510E6DC;
 Tue,  2 Jul 2024 21:58:51 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-7f3d2d441e4so148773939f.2; 
 Tue, 02 Jul 2024 14:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957530; x=1720562330; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MxDd/jlN1Gw8bPV0q5UJew/A89joWXWCEanlG0C3i6Q=;
 b=ATWWM0jChlaXkrt5gwn5hqXssyy3wjUSV2GyqvwJGOu/mkjwDLaDx701sCwc1NcJHl
 chwNxne5xC48ve3g3Ql+6C90P8yZkRiSHNxSCcIl8S13v0bPzgcMb/btlykbAwtWfCHD
 XZA3eHYBlN51ASUKFqIxSDwwQChMJ6GjXVMu9hm+RLkt5yFuLiEb34m9DOQQqC0/6aC9
 U7cgEpStFcXwgCteaffvyl5QbjP2Y2xD7Xf3ZzrnH1tCCW14KRro46uNEYcJTdjRIgEa
 4wO6U4uKodNGW6swcj2YBlwzx5a6deZ2rauVEn0qFaFLCREMlTMBvoQzAXBec9ci/u4J
 9AuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957530; x=1720562330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MxDd/jlN1Gw8bPV0q5UJew/A89joWXWCEanlG0C3i6Q=;
 b=NihAeXPVUjPEkNE6mq09vYY6Qtl7lyfSHyJrGzSTD27gBOF12gVCmOPC6UYugoVR6f
 u9/0p9cOCpqwcuoamm0xDy5Hno1F+XioMKeuUaaVqzwR08mRf+UTbE4KAusLnvEWnNeU
 bWy1QxEsiqk8MQDlxBWoFBHeEumU/NDtmenG533MBWgqz4nYFkfl5JkXwbdrY+eutgMk
 ymhB8Kxmm+p2ETPF2O/zzilY+tVSdtcRXPsjtBeDvqOsJMdb6M0utbpX+KV5rP+spu9D
 aOYPdZkTeD6H2PMcPHp4o0QUsdgkciN0Z+7c7ls1XyhPE3di0cek8bvf1KlAQRfwVfRK
 M+DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD6EOMA5eiqAen+Q2ZwI5Ind+wxjMjLR4qBK25CR/gE2Waf5sdxWtCkWoJcbYCuBB6Iz/uDgOlb2l/W9sV6Ww0QtB86k5S/zqsNWuDYMxur+pYu9VlLlmZTx8H2PsVIwJujaOHULhEHnxBeCttQqp2EJqwsr6sRd4+9XnWbSF5UumyVMlenEzFqOFBl3kWRqpTxqNZ7PiDhqg188mCUycPxKo3IIS0St3p5IEKrqreibjAg7Q=
X-Gm-Message-State: AOJu0YyvTj7D6Z+FD2KMCcqBaqYh3jcnNVe4kI9I4BOqTPYUi9AGjTN6
 KbHurwqeuM+vauzNTBgSc4CKqDpMTJpKhasx9zIgC83Kt9A3h6Ax
X-Google-Smtp-Source: AGHT+IHA5cWQwG7sGQgG2GsZbHmX9YOZDWo74Sg5hZzfWG9rJh2QlSDlAZETNf1gZpS7tHAO3w2Pzw==
X-Received: by 2002:a05:6602:1816:b0:7f6:1f87:70c7 with SMTP id
 ca18e2360f4ac-7f62ee1b1d7mr1169478639f.11.1719957530383; 
 Tue, 02 Jul 2024 14:58:50 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:49 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 30/52] drm-dyndbg: adapt drm core to use dyndbg classmaps-v2
Date: Tue,  2 Jul 2024 15:57:20 -0600
Message-ID: <20240702215804.2201271-31-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dyndbg's CLASSMAP-v1 api was broken; DECLARE_DYNDBG_CLASSMAP tried to
do too much.  Its replaced by DRM_CLASSMAP_DEFINE, which creates &
EXPORTs the classmap when CONFIG_DRM_USE_DYNAMIC_DEBUG=y, for direct
reference by drivers.

The drivers still use DECLARE_DYNDBG_CLASSMAP for now, so they still
redundantly re-declare the classmap, but we can convert the drivers
later to DYNDBG_CLASSMAP_USE

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 25 +++++++++++++------------
 include/drm/drm_print.h     |  8 ++++++++
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 699b7dbffd7b..4a5f2317229b 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -55,18 +55,19 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
 #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
 module_param_named(debug, __drm_debug, ulong, 0600);
 #else
-/* classnames must match vals of enum drm_debug_category */
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+/* classnames must match value-symbols of enum drm_debug_category */
+DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
+		    DRM_UT_CORE,
+		    "DRM_UT_CORE",
+		    "DRM_UT_DRIVER",
+		    "DRM_UT_KMS",
+		    "DRM_UT_PRIME",
+		    "DRM_UT_ATOMIC",
+		    "DRM_UT_VBL",
+		    "DRM_UT_STATE",
+		    "DRM_UT_LEASE",
+		    "DRM_UT_DP",
+		    "DRM_UT_DRMRES");
 
 static struct ddebug_class_param drm_debug_bitmap = {
 	.bits = &__drm_debug,
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 9cc473e5d353..905fc25bf65a 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -140,6 +140,14 @@ enum drm_debug_category {
 	DRM_UT_DRMRES
 };
 
+#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
+#define DRM_CLASSMAP_DEFINE(...) DYNDBG_CLASSMAP_DEFINE(__VA_ARGS__)
+#define DRM_CLASSMAP_USE(name)   DYNDBG_CLASSMAP_USE(name)
+#else
+#define DRM_CLASSMAP_DEFINE(...)
+#define DRM_CLASSMAP_USE(name)
+#endif
+
 static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
 {
 	return unlikely(__drm_debug & BIT(category));
-- 
2.45.2

