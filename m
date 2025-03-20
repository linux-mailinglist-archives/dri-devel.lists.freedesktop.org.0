Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2090FA6ADB6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9D910E6C7;
	Thu, 20 Mar 2025 18:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jmHn0hGA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD0810E6C5;
 Thu, 20 Mar 2025 18:53:53 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-85b42db7b69so12875539f.0; 
 Thu, 20 Mar 2025 11:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496833; x=1743101633; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PH1+tp+xqUGCykXZdLvGRvCsZKn18R+wsUvu6RBydR0=;
 b=jmHn0hGATMcLojRUFF+ivs0+7Pw+VaaJ2W7xxGU03+GcuNUgYN7P0gPopgk5Pwpauo
 IwFw4aTB4irRGnWsPoAyoPhAvXZanCVGE8QXJfnG6OUNx7UcQkdd23imY6pIeazIArmT
 waggU9BonpccJErgboWdwaoJ6frDLtwO5vviDZNuCnrdoYclT63TzNkxWk9x1YbKk/DS
 FiyrAw8doqdcbGEJIZXdIhOmrJkX4OEwe0pV3dc8ox0nUDIApxg0m3q2liEinl394dHf
 JCZ8WwGyL4JdEUQITqLxQZM78i5lqgCsA4F20krd30eoKKO3RbnWgnQFXTNKsYWt6AqW
 6sDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496833; x=1743101633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PH1+tp+xqUGCykXZdLvGRvCsZKn18R+wsUvu6RBydR0=;
 b=GsbeWzcQcqw6HZCj+k6t5towZRkKOLsYFXYin5TY+QXSXeJnb6hqnDdvKcA39w8//Y
 MNvbjwJBAegFoqjLYN6xd/hBgzFeLckgd6f7JOCw5/wXDokbgePNhYTK4vbW6NHcCb1O
 ukDgmy6fqPtS/JlDYr1yspdAGizvIAG+4qtZNitzGdWkYBbnd0rN+q+QBklj+yi+XZYt
 an66mK/dXI0so9Jx/KCMDVwFkVq9EwZSTFmFHI9Lvx5SCLlc+LB4FbUNbjReUIVhlJ3M
 shydn7Qaz/pSO37hdqfzUBtgrrnWG5P0Om2Rcun9FhrqvujAd8tuyhcgzzxl3dAJAfkl
 MZgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5Da2jva7yeHxkLQYuuj4sWlBh+4SBVqqMr3J9eJJN2PX9chr0GSqc0pFMEtITxQ+PXP4g7CMG@lists.freedesktop.org,
 AJvYcCUEmhe3snq7cD7Rx4yxQJebb9BoEJzWLnsSF9WXaij0mwtmVScp0tWYxY/suv74shqi9b21+wkufZuz@lists.freedesktop.org,
 AJvYcCUn0xX0ONGoKaijISDSUkqrr0ZTHTrdjFeSruqzK+CfXifStmjPlI21tXEUVjJpa8v6CYW3PzAOq+Hb@lists.freedesktop.org,
 AJvYcCV2M/C4FiY+odJ8D+HwPTj5oImDzG/67wa73EVKQg3CYdvfUWjewE4r+zUGVqpHL4P0k1JLv/JYPGjqSMDQWw==@lists.freedesktop.org,
 AJvYcCXrRsZ6zV/NtGiAqbk9S+boX76/mvq3B031F/cBsGSkc5pfgZp5uhKQ0fJsb603zrPqcwhIRpL4X6nW6xol1h2Zpw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz41LEeAUlxv/AQ9YSKRrF3e4tdBZTjWpxDvR7N53FIm4nb25dc
 Zjwwc5+SpPiSAvQ85pneEeDTqurhTpVftBKb/UCuLTtbEO5GPjOi
X-Gm-Gg: ASbGncu7jtY7KDBbf21F6in17wq9WsHxrfJgsszKBVQm3tWiyjCbFO42otxw85BhzKU
 55XfLQ14RAw0A3uzx7biHUx+LH034786jYhlFBf0QUE6VwYBKxqr6pK/+21zB0YzQAxKOm6w4ZY
 DvIyw2HjC331e5PxP0R2IYjpSYyyrvE7ab6ggkiltV9AMvVesp7lqtXEr/jyGSvr/J1hY+iSwDA
 sq7OE1J2Bv4UJo/UM7AW9R6UB7yFJqNMmgAxPlejYHlQ5W9nzR17wZzVqWBNhnOuQnUKdAJ8/ce
 IO6a6aSeMPbUusMXy9t1WU48I+z3N20D/yAa5nNSGizayGU5UToZoPpl9MtY3hE0eRzhEzVQtsn
 FGw==
X-Google-Smtp-Source: AGHT+IERrpcV67cSumqUx8Ys7+zY1a9PbB2qOVJ7aGj8lv1MneNGgrFe8EVAoLmayS6rXv/6VpfxtA==
X-Received: by 2002:a05:6602:4142:b0:85b:3407:c8c with SMTP id
 ca18e2360f4ac-85e2cb0f65emr41157539f.11.1742496832935; 
 Thu, 20 Mar 2025 11:53:52 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:52 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 43/59] drm-dyndbg: DRM_CLASSMAP_USE in nouveau
Date: Thu, 20 Mar 2025 12:52:21 -0600
Message-ID: <20250320185238.447458-44-jim.cromie@gmail.com>
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
 drivers/gpu/drm/nouveau/nouveau_drm.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 5664c4c71faf..bdecd27efabf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -74,17 +74,7 @@
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
2.49.0

