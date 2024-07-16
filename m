Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F2893312D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B03410E861;
	Tue, 16 Jul 2024 19:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aWT7BIEQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C609610E839;
 Tue, 16 Jul 2024 18:59:09 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-7fd3dbc01deso6040639f.0; 
 Tue, 16 Jul 2024 11:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156349; x=1721761149; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O4fvGJdIiqN/FgQMIjeZ3X03BzfZdJ4Rgy3d37CjnOY=;
 b=aWT7BIEQ8x1VCgBwPbdpbUOH8z7eawU+3zQ3diZ7COZoKr1DvahHyhYRhor2XLDSDD
 L5/N+dXZE45yN/xu/5W1BWaKUTjf076QwnnV/Cn97FkLqDfQEWkrBjXiBLjxeZB9cjEO
 0qelpueX8pcF1Vt+Mm2/5YYaadbPmldF6GwWjZc9Z2fv4Ivb2g2LDt5Dmibgg686Tr6A
 0t3zQlG+6ewBWjZd8+bkAB1nYzVws//Bs3iyAxrAxReOs27bm4U7Z1YtMLIip3rCtrvW
 CLsJUa0SLw3pMyY0x6PZ6LrHyNtSq0/dLvcj5xDykOi5BuJ6z7nwSggKJM06pGeXvMU/
 gTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156349; x=1721761149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O4fvGJdIiqN/FgQMIjeZ3X03BzfZdJ4Rgy3d37CjnOY=;
 b=vqX23F9YcIjQhWymwa0VGs3LRrhspxLov36Q1yUOWX2ANWmHaf7Py/xooJ+qrFcL7X
 41w7b79LFmIv+qL86Muo9nswi73d6k0ppVr6r0jErZ/jSkKcOaYsTJnPWcG+x5cRxH4N
 Uj7BexVJJ3gXGJtQjf/98lOPDlZU02K14GSQkVMe3/mIJh4gKev0FVhl2nTEoVycA9Li
 5h1tOMVX4hz77Qe72wmKasXIOmZv4+s6s2u//GWOn0SKW9j7rn3rRjmUyq4lkkJ4Kfm+
 /Bj8LIZceWQ77uzQ5UX/I1t6ms/9AZf7l+L3nYME+zZCHGaJ3zWRn21ECc4Z7thoS1N1
 2/ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR9WwbQgfBV0Ha+TQ852+H5kjOoDqv+mDZwklQ8PybQQyODwGX0LLODXfGYyKybqSeUBJe4YAvZEKpPGb8dx8mwPvZXh5Zi/rKGaf//ppsCNzROq237YJ8gsCkNPC2tFq30UZ5xcGLUdVy0dPfOONqekBio3MHThX0CWUOo2U0gyOL9J1r6Z6T2VHvQkSLZa1rL04ZktwI/iZwn4P7VSUiM1yr+1Qumx8p4zEdRUhigN/TaNo=
X-Gm-Message-State: AOJu0YyPd1p4lskxkUfRjiRoLkCD5NCQCBGFGWuxR0IJ7BXqq0Eehpic
 1l/Yg1jVqzdaBGlAsg84voXaBhbTo+/LJtBMq+pSoN8/79TbgM11
X-Google-Smtp-Source: AGHT+IEoPFvoLU8se7cKFs7615nIvxsDK/GhCsg3TpkmqEyVLb7MNLpf5NEeCEideKkhW1/TmoHWuw==
X-Received: by 2002:a05:6602:154c:b0:7fa:2902:aec5 with SMTP id
 ca18e2360f4ac-816c578db22mr35533339f.17.1721156348981; 
 Tue, 16 Jul 2024 11:59:08 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:08 -0700 (PDT)
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
Subject: [PATCH v9-resend 34/54] drm-dyndbg: DRM_CLASSMAP_USE in
 drm_crtc_helper
Date: Tue, 16 Jul 2024 12:57:46 -0600
Message-ID: <20240716185806.1572048-35-jim.cromie@gmail.com>
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
 drivers/gpu/drm/drm_crtc_helper.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 0955f1c385dd..1d08d759f238 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -50,17 +50,7 @@
 
 #include "drm_crtc_helper_internal.h"
 
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
 
 /**
  * DOC: overview
-- 
2.45.2

