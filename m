Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F13924A84
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3284810E6DD;
	Tue,  2 Jul 2024 21:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PMkbJMTd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E9110E6ED;
 Tue,  2 Jul 2024 21:58:58 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-7f649f7868dso113927639f.2; 
 Tue, 02 Jul 2024 14:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957538; x=1720562338; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=94MIkUtYPNbEjf2ABNxMIbyceZTrdE5XkTP/b1VTHKc=;
 b=PMkbJMTdPdQr/dHpB6HVSZwPemuDsBX8+EheYur1j5c5BUO5o/bxYQGyydOAh2nLtD
 hB3nuQ8LziMNkXWC17sgiI6oN6BK6FpyYI0gUKtUvhdgCRHoC5fvpVOsYUuvDCFdO4yk
 aETnkz22ZeyTjMBfVXBHNSaXGswKEB/fc2qWBdjUSRbOc5kS0htKdiJ90Duq/wOL27uN
 cY5GIUOHk3N1fKMQ0PBy0WegI0UdcHs4hi4ZC4p6qIhMhcMTbns/wQ2rR6g1/65wRz+0
 0lw2Zd2vbuhyMeXjoDMCLqmu30JiBtFxd2eLche2+Zrprl/Q2PzbQeU/KNy8mblLjNLi
 V4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957538; x=1720562338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=94MIkUtYPNbEjf2ABNxMIbyceZTrdE5XkTP/b1VTHKc=;
 b=t/wU1dqvHQy+eoLo7Aul7G3J7KM7ks566CRVsybPGVFIh1ZkB8X3Tgdw8TKC2H4AsU
 41zhrdjv3GkCK5NV2oxyzZDPDVhBl/91t4P9vC9wPzoKK02z4prHdFtxEMgbmXfACCBa
 2gh4H+xXv1XBzhQvHHNxmq54cMl1JMvmK/8rtxkVWPab1PR9/LRI6pb3/1fuYu+tFXs1
 IiHvYlngQu35nSl1WzrEh1M9/eDDA2Y3HNqctZX3bj+D2ZPmtcLh+EPRmlTNbyxRQ6nv
 Mobe6IJMQYnkZ7/+P7AOImRox2I/bBYPR3f3p6dtKF/+9yDKCWlWD4fYgoFgW3fidjpf
 Xt8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvrMg7CQNZQBW8zS0xbud8HolHftCdATDKh2iU9rw7+AEm+CvZK+QwIxy3rhW4kUx8O+1LDZn2q3EhmUKBKFZxNXSF7PEEPTgZRsrpXkheCdbMF5bZ8qXYhbqWG+MxB5gHdt9ZXhiYNWNwb8arPldRZzitYDMjP4bSJQC6t2ceKRrkh8P3e5yRzSIHG7v/xkTvanENVT6WDmJJmmy9L4w9+Nai6XfhNj6kj4L5oxagjRNQOD0=
X-Gm-Message-State: AOJu0YxWXR2EMTEw2gRKPV7toAEyjhzb/J+tD9m1kXPNrWH5jrHNH9vB
 pceloqG+/0GOLAMdm6M2OO5MBfsAICWpo+LpS1ZQlHBgD8/yv6Oc
X-Google-Smtp-Source: AGHT+IEeyfoDsrnF6r4ABpMFuIX2eN+Lbm0YqA2PfdZDRQYY0jl8O9vciO2Q9HKa3iN91XoM/brm0g==
X-Received: by 2002:a05:6602:600d:b0:7f6:5035:1826 with SMTP id
 ca18e2360f4ac-7f650351c42mr444802439f.11.1719957538015; 
 Tue, 02 Jul 2024 14:58:58 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:57 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 34/53] drm-dyndbg: DRM_CLASSMAP_USE in i915 driver
Date: Tue,  2 Jul 2024 15:57:27 -0600
Message-ID: <20240702215804.2201271-38-jim.cromie@gmail.com>
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
 drivers/gpu/drm/i915/i915_params.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index de43048543e8..dccf12d05105 100644
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

