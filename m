Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B865933119
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A30F10E856;
	Tue, 16 Jul 2024 19:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CnPa57Vt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0019710E844;
 Tue, 16 Jul 2024 18:59:10 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-3815aaa2ab9so247945ab.0; 
 Tue, 16 Jul 2024 11:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156350; x=1721761150; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IzkSEhdc6qQPvOwslzLZ6D0OWHzi5mSETKdlQKCmmYw=;
 b=CnPa57VtHwclfyyhg/wEvdEgqcf1/msUpDyLGowtbASyzbgobrwR1EPQq3v/oD+r//
 5Gh/oKqC3XOe2V5brCJS0hzFM3K3TcWbf2UVoHOtCNvtJaI8MWh4Kktzx/eRnf032d8a
 apo9Fc70eHGCYoux/cSxFK/dRg2PZw7HAaANm9Kn/hbL5VX0D56ujeCYAmzG8i1w53hs
 ObQMhM21NQTlo1bYZr+pQ7Dql66h3i2TQ2RAz1LCcAdGS74xySO08jr9d7s1+hCV3/qB
 MV+QGuvTUDLbj4vl8eshxWKhGfBF51AoyqmoyOFuXRccel9Rq+x8BCmvRExOE8mhl2v6
 pX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156350; x=1721761150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IzkSEhdc6qQPvOwslzLZ6D0OWHzi5mSETKdlQKCmmYw=;
 b=FMWqvUC2G8j/mDT9oNF0QTKCVm/ubnnRBOGcxov5jcVV+b5+M9gGAvNTew2ZGrW/uH
 h1/gjiCKmtypp08O/v742pTu2TzLoB4GjsBKmOZlf4PSc/rKdDR5xuadbm/DkyIOs5P5
 Jc8o9t9qPgx87Gj321uKQDGaDnoZ/GWnoM8OxZv39g+Zuv06GTPP06rOXVXD3P6+dYAk
 CGsWqJpGRRkHlvHg/g+7PbHBPuNPxvjNWDKijgoR5dz7bKLmzvHh+QANiMOUhXKcqgd+
 6qEN/amAYZ8446sXpixvWG9p6wte6tUTDD5KkYVpSye/uIoXY3aroDl3ikn+2BTxJ2Xs
 +Ydg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfIEZbwmFn3MnVCy5MusLBbsIw4k9ICWbduof8yr41/r/nkZTACSTDwvBM1pZX1KCVmT/vZ6z1Etk2y/DMcGyTouJJWu+WQYa7uTPHxO2rMtRCdtQrT9gR3riL7EUz3NaQyRhCJIRQ3WK+F9VgwmnP5AzgxhBptuyHAh6fT520rTrfRVNu7Lju3j36nRjRm3QQA9B0EBMSloutZaymslPYC4+P2AJ2L9jhE2p1hrj/Y+m3yRI=
X-Gm-Message-State: AOJu0YwJvCuP7xxw0QoeS0i9So4KFugF2kIaMGRT0DcCSDn13rXMRLN0
 vIGpDgb7hGyr23Vf01lx8Hk2JpEOkzFrVpOqGVF6ud+dbmWeZkKgkicUdgx4
X-Google-Smtp-Source: AGHT+IEKdNdnUCPqRDB/cRLNi7N28OEYYkl4r/3na57zdfEFy5knZy9YrMuwF5a4lw45gKdShvcnlw==
X-Received: by 2002:a05:6e02:1a42:b0:38b:3985:433e with SMTP id
 e9e14a558f8ab-3950de3a6e2mr1987225ab.7.1721156350166; 
 Tue, 16 Jul 2024 11:59:10 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:09 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Cc: ukaszb@chromium.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernelnewbies@kernelnewbies.org,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9-resend 35/54] drm-dyndbg: DRM_CLASSMAP_USE in drm_dp_helper
Date: Tue, 16 Jul 2024 12:57:47 -0600
Message-ID: <20240716185806.1572048-36-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716185806.1572048-1-jim.cromie@gmail.com>
References: <20240716185806.1572048-1-jim.cromie@gmail.com>
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
index 79a615667aab..26e01845531e 100644
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

