Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D18924A85
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A955C10E6E0;
	Tue,  2 Jul 2024 21:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h+etWrys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816B210E6EA;
 Tue,  2 Jul 2024 21:58:57 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-7f3d37d6bfdso449339f.1; 
 Tue, 02 Jul 2024 14:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957537; x=1720562337; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0SUm8Nyqte9xAsE2tQLuwSyCdCfAncJgW1l33uKzz4o=;
 b=h+etWrysZgtd7EUslMP5/hTTo3354V8LLjrTPJRgpaCeppZ5SrB1sds+LDRUmdHZ6p
 AUm/61NfF7No5Ay9TFA+J7fqmCiLUd0MmJpImCNjUFjDPlps3fIvpRvUjgtzSNqUFS8f
 N7L8anoLgkxmBUAarltZHk3dclzRZa7pFSqHIfWcweua8eKIu4RibU4nTdyzzfs/+Dsq
 YgXLtzGULcqy7F2fg0UUgv6tO/h1VM/g37ojDmb0NlB2YA3bOJIlJ1xI9NUVXfi4hht2
 FsvLZg9rr//AYjoBVHuGbOQOYOa7UOTiBs4P8h7slcoO1ldBTfCjPM4A8hZWToQWBmrq
 75nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957537; x=1720562337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0SUm8Nyqte9xAsE2tQLuwSyCdCfAncJgW1l33uKzz4o=;
 b=iG7bmesnVLBqnH4iXMhrriQiqcdPiqGbYN51y3u6SvU/zq4UZaf0EfjgljM9fItNTc
 GNr/zP+9nODVBkLVPHD5MN4GRMn2fbjt/fB3gG91HvMj25jyLsYeJnm08OCr+MAyga4P
 sOfDtoeCt8PGfn86Riy5cgP3AwZBguLtB9S13zlqpbD07oPwtIJDG6jDG3Yq7gSfRkIR
 RR+1/vRPXAEj4rl8WIv+Ncoi7u6Z/EUye7ZWtqsrVc93uMfQzUtJ3vbQ+7DDYihSKHJ6
 Y078HEHypvLfwQmTDuEO8yjVnpIW+6chIM6amVHjT8QarbbRe0AEr9SW52qpyL/O2uNV
 Hddw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVAyuSbeR4VmAXeP58foDvJv/tK9N+7X7/k6DzN+WTDCt3MDRnfsJWIh/oR0FhXNccTZ8T96BvL3/L6RgYEImaVpieL+RmFlm6X/bmw4xomm1DLBRiBv3uYKDc8i4cYMdEMXywhssk4l6H7KnjR2aia/Ng607i9ncsVoJvih8Uzn6gqrh5BYHA/XtvYg+MFuiOONGQ8nKguKQJUt8l9JdMQWH4kfJJV3h8bKowMEqxqInnUdQ=
X-Gm-Message-State: AOJu0YzR4kUQUzf1L8rohu0NuOqxC9mwwaT2yMULXwSUWWiN9Ula4kSD
 /7ZS/c9mr/0dtqF0z+OxOTo2zO3W6oh4Gpy8/zp2qyK/QKBREmrW
X-Google-Smtp-Source: AGHT+IED/9tj/T0S2oY6w3s41P63jq6wO6ykpkmAJc3dcy/2ScxeaNeGXWxznCgBmuXHX3egfMu8Vg==
X-Received: by 2002:a5e:8d02:0:b0:7f3:d863:3cd5 with SMTP id
 ca18e2360f4ac-7f61f524391mr662424439f.5.1719957536733; 
 Tue, 02 Jul 2024 14:58:56 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:56 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 34/52] drm-dyndbg: DRM_CLASSMAP_USE in drm_crtc_helper
Date: Tue,  2 Jul 2024 15:57:26 -0600
Message-ID: <20240702215804.2201271-37-jim.cromie@gmail.com>
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
 drivers/gpu/drm/drm_crtc_helper.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 2dafc39a27cb..e9d229a393f4 100644
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

