Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D500924A8A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DE410E6E3;
	Tue,  2 Jul 2024 21:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YAWKxsuH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE30210E6E3;
 Tue,  2 Jul 2024 21:59:00 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3738690172eso21849045ab.1; 
 Tue, 02 Jul 2024 14:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957540; x=1720562340; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Axn4TdT8TpzxyaaFFwTK+y02x0fRA+xhIqgCPO86CS8=;
 b=YAWKxsuHUrAtE7uiysVYAR/wvkofBMHKx3aeOyUj6EfLZ1hrTndLgRh45CzGhUjhof
 Gr6NPn3W82IWebyXeiYs34WdUcjeMZZsosFbRmF0hEbS6TNI00fjqRuqVWmwBSIf4KVv
 RxLVzlzcQ89KKmpQiuQxkbMGrrBMn1TBTEvfzSWoHqgj5wymmBgoUm2YrpT6LRrTTQ3f
 eDLRTRKvr1FAUP2flbGzGOFnyuNh9oz/bqoPtDpx61ec+yCl38tGqIHhe4DO/7Ey7nkC
 BFrda7UXTG8x08BpzVBOugRgsBkJ6OBcTdvleiHC77aOvcunp11pa3Cl3+RBF5nneT5N
 jR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957540; x=1720562340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Axn4TdT8TpzxyaaFFwTK+y02x0fRA+xhIqgCPO86CS8=;
 b=Cr2HizaK8V6TGYuGSxHRWBvkTRGNOsUTJ0cPvIu+lGxC1nOu7JSaAZpdtTh90hgo0i
 1p17e1QMofQ42I2iquO7DA6UPGM6AyLdsrmL+iOZPwycA550TkwcAtmtripSVjglW68J
 4gy5ul2W26A9x5oeNkp+U+0GzCEH240wcO0IBR4xPPB2kF8N/Ma8PEfbGLWLS4WNMDs1
 YHAHqSh9k5P5yrMXLLsse6isOmOTLg+TPaT42krjvhRKJIuAADnzWzwza3Lz2I+kW0H4
 A9ReZjEBz2MzwknEXZXQcNT55uJqvs4idEtt/HvQeqG5XrCGRBWmyXryZqHskwEdgEO+
 fuvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoIFJ1LHZBKUv7QnOFWgoRrsiqdb6DbBvNRjXnVf9aDB4EVEmXi0cVWyf6tpz2LF6PrXKm2N+k6Bf4i9rnJWy1N2G9HfNl8XAexBiZ+NdJycIgBqw58GFfNyNCyOBlknUtkR53BBsERg7yFocoQNKkbbDREkaKk26L2rPR3Q5sF4lX3vya/TlY7bH2FpQRPDfq19UHNaGnBYHAWDuPlTkb82pFd7mb/RCOuc/mzu2DlUi/i3k=
X-Gm-Message-State: AOJu0YxgBDRhdqEdmKkGTHDJdNqLDu9vHuXu5M8+hOJuS9HTsaZmkNjL
 fbfE4XzXcH/iAFksSs54dVuHA6MTFu6Zggfq44zjB+QG+sbxD9cp
X-Google-Smtp-Source: AGHT+IHaOAftkhtE+ssHNVJW7rv5RWXdozZEgyV+TC4e5xBaWpxyJ+CZnnidhCATtDhgoR7BAYqalA==
X-Received: by 2002:a6b:d117:0:b0:7ea:fc3a:fff6 with SMTP id
 ca18e2360f4ac-7f62ee1da28mr1167201539f.6.1719957540118; 
 Tue, 02 Jul 2024 14:59:00 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:59 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 35/52] drm-dyndbg: DRM_CLASSMAP_USE in drm_dp_helper
Date: Tue,  2 Jul 2024 15:57:29 -0600
Message-ID: <20240702215804.2201271-40-jim.cromie@gmail.com>
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
 drivers/gpu/drm/display/drm_dp_helper.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index f5d4be897866..d3a7df09846f 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -41,17 +41,7 @@
 
 #include "drm_dp_helper_internal.h"
 
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
 
 struct dp_aux_backlight {
 	struct backlight_device *base;
-- 
2.45.2

