Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556BD924A8C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE2510E6EF;
	Tue,  2 Jul 2024 21:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DihhHGoT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D737D10E6DF;
 Tue,  2 Jul 2024 21:59:01 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-7f620f349f9so193149739f.0; 
 Tue, 02 Jul 2024 14:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957541; x=1720562341; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Axn4TdT8TpzxyaaFFwTK+y02x0fRA+xhIqgCPO86CS8=;
 b=DihhHGoTjANxuaUg8J1dqOi6jZykQklU+d4NkHNSoCP7ZUpK8soLrkaWob5dl32TZ5
 uniz/Azi0qekqIhc7PIIC+17K0DUVNmhZhtr1/0cXlhWjdPgXwTlfItGkff3ptjjj6jk
 YU6qf4z5BetI0eVQxlLDXYf8fZShIlrND+y+89UPr7oCIHPjL+7jBBi8M5s1Ueknpk0y
 7fEJCCTS36MIreSxj5sqviVu+IIHw8iy9ZNtJXPFZscshOXkxo7rMZlOz/brT4/kksJM
 5SnC0LGS+s9KqGIJdGS21viNP3IJ0KCw1SB9ms/SgjFXe5cMFXIu7UYpwi7r/unkwSgq
 gb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957541; x=1720562341;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Axn4TdT8TpzxyaaFFwTK+y02x0fRA+xhIqgCPO86CS8=;
 b=GqbRUkv77vS/WB81OTscOKn02lH1MZfeeHs2eMw3cib+bB2bW3C1K7/WHqxSAwaG1o
 4n5r1Q2BKDh0E9rKdGTHDZM6eQnTXNb3TrQaVqYeOGu9ZfQJQAy6SO7aihGdm+PHdZgD
 ljlcxoBL+qcXiliBtuCBE+LOfPW7ITunSjpk6jZMsk1vrnqfq70wHetJEY10FQFN1WGx
 21xLnlY9zAKN4qpzI9Sl9HsusLnbY0q+qFvS5SOnfZfQ2NtNuOciaxhJYnvfMbhBSB04
 /HhoxVqmJhNumWOFWIgkj5/jIG0Mb+T0qrqtJpHFyBKuKAb6qoTtXRXWoNx16HFMsIBR
 H0ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuqUYhAlNXgkEbOwEUpz4y5nzBWpGcDUb23vk/qKPA+arJW5AMR7ILRWF7jft7mNZaOJQz3ELgaBSITxJ3wL/8njGDG0eLdpuEMj0T/+rhK3gyn3a9yr9DNkOwZLPx1gZ3FhZowzD3cabJmkXeI4AwRQ/OTjPmeuR9WYG1Xy6cPEgVoN2hpXd6ed+fBPSlCb8dNsxseyMSh/C/zTV8d8H0LXWzTxLqMkMU4py6797G//Jj/vA=
X-Gm-Message-State: AOJu0YyDrEZiWOT4OtfWV5WmGZzi9jyWXfXh4J6/A070iNd1I7R2kGFV
 Ut12cbkyazKSuu3q0uxYjZBCkI2PUhqf8O81fVOGb5KaYIWn688E
X-Google-Smtp-Source: AGHT+IHjv9k2KwZ55PoCGQdZFNcDsK4OFlHELx0TrRLo/YHjIbxVBPr7YJh6jsm+YsFDmma01GPMGA==
X-Received: by 2002:a5d:841a:0:b0:7f3:eda9:8037 with SMTP id
 ca18e2360f4ac-7f62ee3d7famr1042777939f.7.1719957541077; 
 Tue, 02 Jul 2024 14:59:01 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:00 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 36/53] drm-dyndbg: DRM_CLASSMAP_USE in drm_dp_helper
Date: Tue,  2 Jul 2024 15:57:30 -0600
Message-ID: <20240702215804.2201271-41-jim.cromie@gmail.com>
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

