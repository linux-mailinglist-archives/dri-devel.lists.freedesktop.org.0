Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C606933113
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF8110E863;
	Tue, 16 Jul 2024 19:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gOXFsKwA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3285710E299;
 Tue, 16 Jul 2024 18:59:08 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3856b7be480so544175ab.0; 
 Tue, 16 Jul 2024 11:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156347; x=1721761147; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W+5ldzNpNWEVuNo6jiIyzFS2EBImxXk+RE6JhqbDago=;
 b=gOXFsKwA6su4eW/CreO41nPeFMFQn0K0bed+/xQBiNfqTZ9G15+KM36YV6lG8Zg5mx
 FusWDhbQXXZyFD6nGc9f4Z1oWzGu3yFBPZ9kgvB1KV8T0uxDTtZJr9llPp0O1VTaLFeY
 K4PgF7xcMw++SxY7sY2tdrHRUXBTgR3q/cYIW3/6t8klmbK9J0ZCs5pzk1Equw5ogKq8
 kj5RiVl75iSs912qlhw7JRdP6bP7crPWO4mk5mTT3PUFh/vlpIxsr/CIHH2phKH1zoH/
 atwufghdIbiF56GCFuVlp5/p7L0MOPeKCjQF1cA+jTPBtRPMJI3+30IwCxSe7zCH461A
 4LzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156347; x=1721761147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W+5ldzNpNWEVuNo6jiIyzFS2EBImxXk+RE6JhqbDago=;
 b=RHIV3YfyWVcPiJle32Zls9ox6uSEnqpL35xpeyzB4cbrp5QWbxDp/b46bwhoM3Cbe/
 dIDTUuNzbxYd2x/VDgEpdb+jF8XPFUGpx08TFQIFuIfB10fCZeO/Uv+9QkAs5WvNlAhe
 t22pesGbEYJJnXHgeelvMgDcXhH+6rolwWYnKI7LEUAfbp7G9r63Z4l+5azt/B8YhKJT
 sAo1v7zmnkkjBIfMDiq2v85119slnvlKD7oMfR29OwM+I+4eSCYvpSVsQVVkOKKOcPHE
 NctTg0co5/HfIi2TfcgjXjBQBj8MZUYDsedi1p73v3BK4jlWSTl7KFFLYC8USAQaFe20
 Ko/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkxmXyNcmwYtcHswDt4Y9aSPDcPqYNbx3UyyKhcyM50oWIO9k5jf4xsKoJ0G88g0txsYk1SuLf7Gi0++kCyMwNneunlrk5BwPU7r+lo65ot5w6CREHeZT7Qc90hcb3l5bkqX6A6KVDABUzV1YO1HJmmHFg+XSFuMgDKl4blkKPmK65y98HepAB+bL17E/ADXs2Y2sn6ZxfdJrrnr3RMfHwRLzaZlONZSbyPZ+BmhTPuCR9NY4=
X-Gm-Message-State: AOJu0YygDbUChKCcZlmJE6ltX/Au/6gg8iFpw2PeBKnCf7QbJ1oXJuWB
 S8zE6qQ5c9rswAH25qnijGjYPiXgdvhLW4iA/c4+5zEbIAx3Sg2A
X-Google-Smtp-Source: AGHT+IFVgXPtcAVN/LY3hiWBdgpsl/UgaLXlcklh8fq4iOux4ImC/Nd3IFqSrYYu5bPD2ZMJxqpWYw==
X-Received: by 2002:a05:6602:601b:b0:80b:8cb:e9a2 with SMTP id
 ca18e2360f4ac-816c39b5f53mr48171639f.9.1721156347462; 
 Tue, 16 Jul 2024 11:59:07 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:07 -0700 (PDT)
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
Subject: [PATCH v9-resend 33/54] drm-dyndbg: DRM_CLASSMAP_USE in i915 driver
Date: Tue, 16 Jul 2024 12:57:45 -0600
Message-ID: <20240716185806.1572048-34-jim.cromie@gmail.com>
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
 drivers/gpu/drm/i915/i915_params.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 8c00169e3ab7..a8f51f138895 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -29,17 +29,7 @@
 #include "i915_params.h"
 #include "i915_drv.h"
 
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
 
 #define i915_param_named(name, T, perm, desc) \
 	module_param_named(name, i915_modparams.name, T, perm); \
-- 
2.45.2

