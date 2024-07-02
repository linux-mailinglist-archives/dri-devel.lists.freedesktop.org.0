Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 752BB924A88
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2FE10E6ED;
	Tue,  2 Jul 2024 21:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RASZiSGz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78AC10E6E3;
 Tue,  2 Jul 2024 21:58:59 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-7f62bb42938so154641139f.2; 
 Tue, 02 Jul 2024 14:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957539; x=1720562339; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0SUm8Nyqte9xAsE2tQLuwSyCdCfAncJgW1l33uKzz4o=;
 b=RASZiSGzBISE+oN1MrboB4PK4Nep4VHnkt5dqgNt+X5dng3n8sgCQYR+PAhsAK6BlC
 G3ixjeOFgl3ZiwkU7VocRRULd6jZ0JLjVCwvYhS+PYYWW1xUBqXeDJCRvbSKblF9lzi1
 yxIv9QpNoMute3m16p755giZ1IGVe3vAZ4t1JLHqo0VcbCXZUABupSMwHzuCC7AP7k66
 dGbYdQu/WqMK0NvgnbGgrr2Hgiw7+UtX8V2PISHDnq06iO9XctkieDEofOthw4PBqfkq
 xhpX/K46ajS6wPa8B/WW1QrJnzrIToq3QsxsHMwDfrGQWpLN9lcuK+c7/W+Onp2tCX9d
 TzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957539; x=1720562339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0SUm8Nyqte9xAsE2tQLuwSyCdCfAncJgW1l33uKzz4o=;
 b=Ks9f4Y5QA84uKsM9/mLACEyGASrcH3snsFoIM1AnjELIb3hIiIqakElbm4JtzLpMwH
 MSTbx57MxJVChxulYlUf5aPkGFMu6eiFWVKWXGIA5STueQVQtcmI2gv4Xed3xBGE92HD
 Hhv2NBfkpaIi4Frh2I7eGGPg03N93F5W58cc3lhR079d/aaHWkswl7/9eytiiIwtTF2O
 4KYGgCW4NAi7b6E4j0suNanYXz6oJOdrTsnahwQJNVUyWxrJqr2GqybKbxi9QE7YeWFd
 MsZw+plH9AItKIBe6YNJZ1Dkp4/b1daqbayY0ZW0Ju1Gq263hVFp7wbPbpEsyzILgePE
 k9Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZszmKZnvzJe3puwKc1xHmanTnbkm/cZhfLq1/Q72smWojidOtWyq+VSaW6q+SxdMIbzV2acCwIB9jkuz3lIq8FI2dwc1kzGdH8LvtAmhID5apQ6jLjsBWHLaaOcMxqABp03YNEqhUegTOhfZebN2iiJMwko43nQUdFo3Ayrs56dpSr9pcwzs0xSOyG6GH3AEf3/5ACk7ckvfoudWGpY4qrxz/mP7gtyZHFKjWe/2PtegdBhE=
X-Gm-Message-State: AOJu0YyWIrmi7fGPSy4qi9Z6yqJ1BA/Bki6pZwwLB3IGxMCKPBizbUc1
 RwZ76RZT93V5pdVTNbt3+pLnvmqRXn62t6wTo/Tn9bccnWSYPTtf
X-Google-Smtp-Source: AGHT+IEUnJOZJMWFZCPfI0cb1ttS0mdFvKdodraHs1JHxvSWaTiAIpWzxzSmb2Z5C00Z5H72ikNb1w==
X-Received: by 2002:a5e:d606:0:b0:7eb:d640:274 with SMTP id
 ca18e2360f4ac-7f62ee622b1mr1057821039f.10.1719957538981; 
 Tue, 02 Jul 2024 14:58:58 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:58 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 35/53] drm-dyndbg: DRM_CLASSMAP_USE in drm_crtc_helper
Date: Tue,  2 Jul 2024 15:57:28 -0600
Message-ID: <20240702215804.2201271-39-jim.cromie@gmail.com>
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

