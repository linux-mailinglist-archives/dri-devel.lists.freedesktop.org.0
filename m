Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE943AFBCAB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 22:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC5310E06F;
	Mon,  7 Jul 2025 20:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NetFmC6y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3D210E06F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 20:39:44 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-311e2cc157bso2966380a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 13:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1751920784; x=1752525584;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mwMbCxduJvQpuL8tDph9hciu7NlgSqkUI8OIMy21Nb4=;
 b=NetFmC6yDeEaL7sjRXZzsY9jX6dSbxDssTlZL9c2Iq0En+B1Pup14BLUUtULwTO+fX
 mUfPA9IRFBjxKKG7xysyhG9zu8Nz2DMGkOTZivHOfzoLEPcI4h/bunUKMTwoxbynB1/I
 KDYBw822RcKGD3qw46RGtpm/5+exiRaRISu/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751920784; x=1752525584;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mwMbCxduJvQpuL8tDph9hciu7NlgSqkUI8OIMy21Nb4=;
 b=FGDG7UK0HmWS0TJIl7RzPuWw1/VN8Tfw+o1dRSSOyk56wHZZJ6Tzom4V1D0PG3Xh6n
 gojTySr3EOKYue+7Ej1lJZvyEwnC1JrctfHRZ95C/fUBXMJVUK869OqCy0VC3xetuTeI
 IV6WBjntgtTpUDkKsqxfMgkAk5PMhk3Zrlb3XzOSf2aCmHZ+svSUmsDVuMhpuUTTK2Db
 0nPUEK0hX/40EYqBa3N+2mpiVp5JXkqTpm2NAonSeLdbqf0ejtidGDnzt71TeFrlRHoR
 MSenl2GnlXVUaMQZyrcQJaJo4IiLBOfVzPQQDFyesEUm87GHEtQ+kcKJqMh1hFb/4vlU
 dXgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVJotWmeYnOr7XemncCbX0zdqc0eV6mCDaaBnJZVKHCZEbsD9z2gqYAk/yH8UUlTFu3YEdB2iDGhI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKQrf/CND+SFdfjFR6aQNUMA5iZ9t7gY/QDAPj3DiGwQ9kamsE
 B/T1HX52M2K8zusgvqYVTNWYSTwm51rg2ckENJdb+XxgPgbf9M/EYTpM4ZUqgy+ghg==
X-Gm-Gg: ASbGncuAq2wrFi1dqLZofIt9Yi8mvOBtT1T07Ergy0B2tbMzECMtptFykfO5v77esuO
 zsKSMRFf2y2dWdRAjdqMiJehIXZgtC/YiFQ3f6AhXXNch+2yGWUl/ncBuAhFGpr/zLG5JwgOXcM
 ALqL3/BBWkE91UpuwllPaUo9p+5uOJXYcFfZF7cbOXZZRh0ffHCg56XNjRMoEB7jv9UyM+SqogU
 PQRR9UrCVN5HZpeXLYgYcT/6/BdjiBP6jgqsPC75omqD4VYAMDiVJXOx4GGkrKA9kcxPOHMoRUE
 pb2oHSzlv/kJ6WnkjFOw+IWpM5+1etCSZH7QY+Ko5q6Y2UMat3tJKrijKdTi1CpyDFqfp89DyXt
 958nUD5NvipcpYgGgjLw9DEft4VKZSIKfO0hLzUtrvjgemK/x64QUwhlO6hLXC1BG
X-Google-Smtp-Source: AGHT+IFjOIQs/VTfDtGbkb7vjR/A1TXOHwx3oFJa5olA1Z+oTpANUdhXg2mxAhVYP0zlSKax/DiqKg==
X-Received: by 2002:a17:90b:1b4f:b0:2fa:157e:c790 with SMTP id
 98e67ed59e1d1-31c21c92d88mr483856a91.5.1751920784393; 
 Mon, 07 Jul 2025 13:39:44 -0700 (PDT)
Received: from justonli3.c.googlers.com.com
 (206.138.168.34.bc.googleusercontent.com. [34.168.138.206])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c21eddf04sm171912a91.45.2025.07.07.13.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 13:39:43 -0700 (PDT)
From: Juston Li <justonli@chromium.org>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Yiwei Zhang <zzyiwei@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Juston Li <justonli@chromium.org>
Subject: [PATCH v5 1/2] gpu/trace: make TRACE_GPU_MEM configurable
Date: Mon,  7 Jul 2025 13:38:22 -0700
Message-ID: <20250707203849.545312-1-justonli@chromium.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
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

Move the source to a better place in Device Drivers -> Graphics support
now that its configurable.

v4:
 - Move source location (Tvrtko)

v3:
 - Patch introduced to replace per-driver config (Lucas)

Signed-off-by: Juston Li <justonli@chromium.org>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/Kconfig           |  2 --
 drivers/gpu/trace/Kconfig | 11 ++++++++++-
 drivers/video/Kconfig     |  1 +
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/Kconfig b/drivers/Kconfig
index 7c556c5ac4fdd..c5edbd2288a19 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -209,8 +209,6 @@ source "drivers/thunderbolt/Kconfig"
 
 source "drivers/android/Kconfig"
 
-source "drivers/gpu/trace/Kconfig"
-
 source "drivers/nvdimm/Kconfig"
 
 source "drivers/dax/Kconfig"
diff --git a/drivers/gpu/trace/Kconfig b/drivers/gpu/trace/Kconfig
index c24e9edd022e6..cd3d19c4a201c 100644
--- a/drivers/gpu/trace/Kconfig
+++ b/drivers/gpu/trace/Kconfig
@@ -1,4 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 config TRACE_GPU_MEM
-	bool
+	bool "Enable GPU memory usage tracepoints"
+	default n
+	help
+	  Choose this option to enable tracepoints for tracking
+	  global and per-process GPU memory usage. Intended for
+	  performance profiling and required for Android.
+
+	  Tracepoint availability varies by GPU driver.
+
+	  If in doubt, say "N".
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 5df981920a945..96adceab2df00 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -70,5 +70,6 @@ if FB_CORE || SGI_NEWPORT_CONSOLE
 
 endif
 
+source "drivers/gpu/trace/Kconfig"
 
 endmenu
-- 
2.50.0.727.gbf7dc18ff4-goog

