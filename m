Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E1AA6ADAB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE8310E6C1;
	Thu, 20 Mar 2025 18:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mioWcy+w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B27510E6A8;
 Thu, 20 Mar 2025 18:53:51 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-85ae131983eso125362839f.0; 
 Thu, 20 Mar 2025 11:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496831; x=1743101631; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GOnjwrNgNXmQwo8Xc/3OEw5JLT52e2RrDPlaTkjrhJY=;
 b=mioWcy+wQFGKpipymYUGE5TB6k4kqIv/AAg77kKxLs/4XKgEDew3zuqTXWIA2sTNVM
 bVr0SXm9aujVoB4mXcPN6S1KYt0UX9OKZwvxgRHlnHcUNK8DkR8jCuwB1y9AAeU1pycb
 Mo9Vj5mCKAxOFCDipUmB1AoziyToWphmhDfNulrOTmphqMBu+CVkS5mK8PjMAOUYVRy4
 1qcS9EIzjzeH81/XoHAXFdrChHVEjZk5SQvtAkSsyTCfF4U2tDIKgxcstDl8NgzkM3y/
 HRqMUVlws3Y9c184H5VJGgJAVkTv6WIZZdwfkDg23HGUqE7TRKfJAKfW8/SgabO9wc57
 PVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496831; x=1743101631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GOnjwrNgNXmQwo8Xc/3OEw5JLT52e2RrDPlaTkjrhJY=;
 b=R3acM36SDMhxhsJuJXlzDV0UUfABrGEr2tjgN7hJqMzfzHIlsgRAZAjXA6w3xAj508
 ICd/eJ4a7N2nME9i+GOE30W0qfd2x0rvDrt1N3aFICSkNLmq0MJcUYRuajRz00nLJauX
 ucxJt/ReymFrmWuU40+RX4B7a2bttJT7gL71M+1WZL32HrSJAC1FTwVkp4ahydQ0m39y
 YkczFoBG4YPlWE2oe8/++TG8+pBMDGaoBY32YcQlFoegVc9Syd0MPAm7B4gWQdLWCiAR
 81UKCm9SOYWgNurTWE0hfjV9DVP7vb7NucF9xwlkDTC1NgwMfBvZA0Ei1DCWAfdUCUrd
 HS4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA3KXVCE2/L9iOA7vAOIlCFgUFiGv2RvBdeiqWm0CklCVRe5QK8jIKyu3ZK6lwOYGEjor2PggD@lists.freedesktop.org,
 AJvYcCUHUGamU/7LRS24JyECb7w1xcyC8HqSzw2v92ki6o8XmOpaTTmteNbQCOTQAFRoBe7FcsbSWS9UNZDe1dizsg==@lists.freedesktop.org,
 AJvYcCUxCYYFrdHdFSEa0GLBdfNLiHi7GoT5tAHCKGO3O8C28Z+iiIWgWT7Cep6jXbgPaEqha+xCu7p/zaOE@lists.freedesktop.org,
 AJvYcCVnFdhpK2N6qbfrvBvql+FQY9BujUkF/s3BApRSSvjHqv1nU0xsRhvydxY5jguqBLKSrGrq7+JxgkB6@lists.freedesktop.org,
 AJvYcCVzTy3wsL6/CXtpcW9QgzHYaaiPExJN8ZTSls8jxp47v7yObFfRrgTZxCzGfk1jBx/eoEjzQYN2iIZk+fq8JgnJIA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfWYpiuko3x3Q1N9xotoXX8jGdX8ON3Y8szLSECLh8bFmfuG29
 0s9aj8X9p5Y9QydX24Yw5khMADGdPPat8ILCrbBNCCvXP67N79Nx
X-Gm-Gg: ASbGncug1d2VAlQhaHUjQQjLbL6R9RJ/TEnJnmNnWrYJtJotwcAqcMxtvdslzLnU76+
 J9bcM+fqgJPTyI/LehlSvG6ZrM1OJjSM2Ntz9QTPTgvgDZxopg0W6KQp+10KhMRgV9RRNZfbuz6
 k2ROA0CK4+30K+sMkLCxoUQS5d6PJN8w4OhOVLZsNtHiN8mdvzlcfFZ9ySjR3Jsv38VEHBN5Mb3
 zCqvEliOd7S0yewWXPLZNaQaEtGHEvASt8nZC029vjZPfbPDBCCzwqwR/C2QZ/fv2OHQH0eAwes
 QD4gvaITerDWVBpaMCi8uMTSpZNlIbORIis/O7RCDjzzoGCKO39dyShw2frfTe4LanJQkj+WRr4
 uQw==
X-Google-Smtp-Source: AGHT+IEkXfyfgc8DOtUffsyGAP4ytd6cOqEMSx2D4ufj2/8LvypyXJa5qCoVaVVDmcFvkRtysEUacQ==
X-Received: by 2002:a05:6602:3a01:b0:85b:3d1c:87d7 with SMTP id
 ca18e2360f4ac-85e2ca36477mr39378439f.3.1742496830852; 
 Thu, 20 Mar 2025 11:53:50 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:50 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 41/59] drm-dyndbg: DRM_CLASSMAP_USE in drm_crtc_helper
Date: Thu, 20 Mar 2025 12:52:19 -0600
Message-ID: <20250320185238.447458-42-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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
2.49.0

