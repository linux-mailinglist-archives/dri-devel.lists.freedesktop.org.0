Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF76924AA9
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD7210E6FC;
	Tue,  2 Jul 2024 21:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VeOf4UyH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E9910E6FD;
 Tue,  2 Jul 2024 21:59:17 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-7f5f7ecacc0so203296439f.0; 
 Tue, 02 Jul 2024 14:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957556; x=1720562356; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pIsdMzCagTnPqkjtDJJFzcS6RuUfrVRwKo+d8V5q9yk=;
 b=VeOf4UyHwwDAgF/xcqBvqH2qDgdYNuq+AmjnToKB3vS13zn71v1Q2NvNPw6Oef5CLX
 BkkkeOLBV2jkwlMBYkZCFPP7tjBweDo5Ji+UXARm8QOR99f3NTGt5tk9oGFaNgSsZf6v
 X01/BfRRMvmDwgPeu0L+R8JqG76lv/0dGrbX1B9FZCn9mxIju7WatMsMN2RfkgOr0X5T
 5J7Lk0zXojnzvDIJnamo9vPs4yizlQgJvmViCdzwFkRyXfRSp+4ERl/p7wCg1i0O/9aS
 vIgKW+HbK7cYhkw0j5Lza+46dbwcnnL18UDh075aW826Bq8/m3Svci9hEVXpmxcQS2YI
 nR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957556; x=1720562356;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pIsdMzCagTnPqkjtDJJFzcS6RuUfrVRwKo+d8V5q9yk=;
 b=xFcr9gu/SGevMOkoXAjmOGvo2NgW1IcYCRYdEqnotqCbJt6ulyLh2tX0qhtpHXPigO
 Q2eBIgB9bwmuzk49N+HzY6R/suO/SMJoDSXugdYRw8+dvmnESzkGw70tNieWN5tKRpal
 ctnwI2MCpu3N78Dclkey/sIXeJHW96cIjUL/971uRUKZw3qmEnDONUY/srW2drUWAsfR
 zw37wwiiyz0L9ZxfOxbeq1z7raTPdizmkWnxtXQcQr2QPssd9aJAtk9p7ojEGBHZ0Dqz
 jdZA8hVd3TdO9hKVAOkNAZc5wf9nG/n/0ezGqS4WTg+tGU10wPHiGMjn1R7WuRu4G8lS
 1TDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn/Mx2cKWjShM635oig/7QFYZRCkUCGDlzHEXqJvLy9js6NIV4dtq+QJ5OQQWJCW81CPqAjM4RAtkiba0zs9YyFyPLmJTHivzJCknCzDfZXR8faE8v3clOdEUG63Go7ygkfbDTnuyslayYmff878GEf+bEx0vehYdNcrJ7M2rDxxPUioG5vFV9Igqdhw0pgFJCXpXo3IKuCSIj1GmoNz4BhY+4JOLm039gdqdRA6nzVFKDOrU=
X-Gm-Message-State: AOJu0YzxVr3jW0pO3fsxGoFy0Zmz5s0Dyi0pbbUGaUUnEu2IDvT7LkHF
 yIvqzos0ZoOcqnqBvavfw1I7G4ZNoBseE9mQ3YI6SOghACOEZhbn
X-Google-Smtp-Source: AGHT+IHkqfivsiD8dHTonTZAnkys7OGTa2LDBnrQBx2fInhOiG5IlwUdftnx+Nl9cVfwsK85+z/TuA==
X-Received: by 2002:a5d:9544:0:b0:7f6:1f20:f137 with SMTP id
 ca18e2360f4ac-7f62ee3cc32mr1102400639f.5.1719957556538; 
 Tue, 02 Jul 2024 14:59:16 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:16 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 43/53] drm-dyndbg: add DRM_CLASSMAP_USE to etnaviv
Date: Tue,  2 Jul 2024 15:57:44 -0600
Message-ID: <20240702215804.2201271-55-jim.cromie@gmail.com>
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

etnaviv has 5 DRM_UT_CORE debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs as well as plain-old pr_debug()s

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 6500f3999c5f..1d1ddbedcb5a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -25,6 +25,8 @@
 #include "etnaviv_mmu.h"
 #include "etnaviv_perfmon.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * DRM operations:
  */
-- 
2.45.2

