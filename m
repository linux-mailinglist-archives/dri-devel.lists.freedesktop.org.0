Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4444B924A8D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3039C10E6F1;
	Tue,  2 Jul 2024 21:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OG5NfYBH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF79E10E6F1;
 Tue,  2 Jul 2024 21:59:02 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-7eee7728b00so189227439f.3; 
 Tue, 02 Jul 2024 14:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957542; x=1720562342; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qc7kDWbr1ZOLQ8+EMlKcMIOk0gPIa550UiXaV/Fsdqw=;
 b=OG5NfYBH3zrmBuE15ytzmM3nbC11GR4xL4nP3f2CKmq5VRDmq0/Ms6BpW1e3wHo6no
 QcHF0sH57PtCmQhD685FcTWRhAqOC9Y1TAVtBzO09LYqECcN+pBUr4dlQALmTgAJ2u5P
 eI2M+gl5fiNc58GYMdSs6W/pbk1LKIC2simOcQhaoQDL0EtyUbr8kZ0pKxJ8hU8f2yKK
 d4ZWYkZeD2pnAX/irRcTrCFCegv0xK8qGAfCxaeKl2rid+CgX0zsjLMD6kFQASyd7wfA
 5BgjxNIpX8R/zaiC8UBiWe71+ti2wAwnNL8CGQLM5rRa6Bri3vvRKwSSK6jadKsltSAi
 oxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957542; x=1720562342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qc7kDWbr1ZOLQ8+EMlKcMIOk0gPIa550UiXaV/Fsdqw=;
 b=q88Pnaka+KbyacR4hOQ9tNcgseSUpw9mwafvIKyJ5KpRd2Z4IpTQR8Iug1JsPE10yX
 pGHNbO8cJNeRt3asfJemN8rpMf01IPgKh7PVS59B5hP44gIgMFsbElXVBilxMiQHBPor
 uMqwwOiyKSLjVQElCrtBkBOQuiidgPLhann3KIaH1lpoJRXapovdYBU1I5oGkMYLsMjB
 Rg/Aof00z1o3ykrMEBEWBCTCQn2GKPkSldwI5aw0eSUbKF4c9kUeie82PODbzqlRD7Sc
 wp34jOJtClfG2u3zBRo4GMPxjs8ijMROf0VDiJGKIMZXXbCQtZ8M4O7Iki1rkLf7EhMb
 LeSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBVYuyQrv91IJl+N0Typnjxv4BIQMLrjUqnAUp/m/2BS/t8UUG9Wn0WrsHAJ8m+g2AMDFAwjwU/XG+AW4SUNBGu43LW6Xy0oHDD5FqrlaMDV7I8sq9GXrfG1vqBaxUc4/nAbqyWJaKj9mm3V5Zn3zxL2TQIT9a3sPMJ5NXd3xOfPvVOEWRaN/psnM/PYHE3p55yk3pzix/pHDy4BEFoApH8wIMH5ibfGX4VnOylWxvg7FX4CE=
X-Gm-Message-State: AOJu0Yyy4PNVu4PFFmgPqFEESjshD4ntqiz/URmwP7tM7ITlKVbHxufz
 Eh05Ui3ds0s9nGDDNfHM+DlC0HzdKd+EMPX80wWlm702JtCDhLzs
X-Google-Smtp-Source: AGHT+IEDyc9E1PwwY+Pk3LT0DP2fwrHuyrUsNmUtygBhUpQrRyXS1AQocEBRzUzkRTfsja1fYVr45A==
X-Received: by 2002:a05:6602:54:b0:7f3:d795:d9f9 with SMTP id
 ca18e2360f4ac-7f62ee82b18mr1067791539f.18.1719957542151; 
 Tue, 02 Jul 2024 14:59:02 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:01 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 36/52] drm-dyndbg: DRM_CLASSMAP_USE in nouveau
Date: Tue,  2 Jul 2024 15:57:31 -0600
Message-ID: <20240702215804.2201271-42-jim.cromie@gmail.com>
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

