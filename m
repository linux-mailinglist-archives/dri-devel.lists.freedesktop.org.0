Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72418924A8F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D650010E6DF;
	Tue,  2 Jul 2024 21:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W7B7RwEQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F7C10E6E6;
 Tue,  2 Jul 2024 21:59:04 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-7e21dfbc310so177447139f.1; 
 Tue, 02 Jul 2024 14:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957543; x=1720562343; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qc7kDWbr1ZOLQ8+EMlKcMIOk0gPIa550UiXaV/Fsdqw=;
 b=W7B7RwEQXDkUp4Y8s3xjUL2EubDTh15y8kDR9XK41jBwNkedNcoSSEfB1xxRVCiM40
 ezZHAb7OiZ8DbjG13Ds/cQcyIQI/Sxll1Gg9Rgp/4DDbiGhF3sVkn/32CVKGJRInoJgd
 VeTXxVNx0yf55P6ukBvPpZ/cDmJjsiZ3liBltRgUNbS1iywNCZWs/FItSAuV+cGHJjxb
 RXoge3623nopVQHqN9bbfoWUr43IobXp+jg9oABphxED8O2iFdU68E//SjJZSX8e2i21
 n0NOtamGm6udNRkKkcYXJskSfS0EjKVmKwoAJAEC8cpF7qCaBx3XwdQrlzQTo1c3HDLJ
 3ZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957543; x=1720562343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qc7kDWbr1ZOLQ8+EMlKcMIOk0gPIa550UiXaV/Fsdqw=;
 b=St9jtzKSpet4bmFVRMc5IeLe1sQPWbY2RpVQ7Q/QKxh/3vtG8BPA5eURVQb2Ef7gsX
 K/VcJD2iS5fiW3Cj3fipdznVDDNn7Q/pf+cqAhbgm1MM1K4mHEybG+QUXPDfde1jVDUd
 KdxQC/br+gZYi7EIBVXJR0ekuwmSOWJiJ/1ehUTEWqq6ryjotd5vNyIYdalVVQaDAMXa
 DZXXhuXTK1TITOSSec0dVwPcs1Dc7B9sV1R+1F5S8Wzwkh/aqyqsHz2iR18iBxKj2Civ
 gXRK7gluO5kC3Mec2T3H4ykdCk6rb1hZn/8jKPztlcAWoS1vVNyVOskhEN+H/wWZ7zrK
 5syw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3tCxXIoQXicSNMJJ4dB15tmsd5euIvA9opwBgheK6zgW5mH833y6peskcE7JuvSdcwewjhdG0YdEgBIXg08wgXX1YS3pcsohJKCNztOculH9Y0l8x0m1z6hnAd+P8/c2zY83IUvwoIbmUyncZkLe6vC6fhAtfZgfess46K3cPPszfi1hEXffIPKC5PTKL4l18FsJObOZTMhpwJg4qZG/RG4dmfrIvoTV7p0yILrT+Qxs2PF4=
X-Gm-Message-State: AOJu0Yzyoh6ne3iYmjETv48/Q6940SeydtK8Wj3dDSNQcbzVuITPr36n
 XiCsddf1Ch2aHEPmWkqUugqcaZi2ggSz6iyVdG88+b3Tj9C3xle4
X-Google-Smtp-Source: AGHT+IFU7HE3OnORXf/jPfIvwK8ZL9okfkzaVw0Y9XlHErXhQ5Il5ia22RtTXqA/C72TmprohxCaoA==
X-Received: by 2002:a5e:a819:0:b0:7eb:c68b:8250 with SMTP id
 ca18e2360f4ac-7f62ee8d422mr1089812139f.18.1719957543284; 
 Tue, 02 Jul 2024 14:59:03 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:02 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 37/53] drm-dyndbg: DRM_CLASSMAP_USE in nouveau
Date: Tue,  2 Jul 2024 15:57:32 -0600
Message-ID: <20240702215804.2201271-43-jim.cromie@gmail.com>
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

Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
DRM_CLASSMAP_USE.  This refs the defined & exported classmap, rather
than re-declaring it redundantly, and error-prone-ly.

This resolves the appearance of "class:_UNKNOWN_" in the control file
for the driver's drm_dbg()s.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a947e1d5f309..27995c0c9b31 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -72,17 +72,7 @@
 #include "nouveau_uvmm.h"
 #include "nouveau_sched.h"
 
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
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 MODULE_PARM_DESC(config, "option string to pass to driver core");
 static char *nouveau_config;
-- 
2.45.2

