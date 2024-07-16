Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7EA933154
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D674D10E87A;
	Tue, 16 Jul 2024 19:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Svquqb/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9FA10E299;
 Tue, 16 Jul 2024 18:59:12 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-8046f65536dso6077739f.1; 
 Tue, 16 Jul 2024 11:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156351; x=1721761151; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qc7kDWbr1ZOLQ8+EMlKcMIOk0gPIa550UiXaV/Fsdqw=;
 b=Svquqb/r0XD9ndeS9kJZT5r76kjZrtcPlIqiZ9Kx01h9fSvI5Ktvk/l+MemU3g8dsk
 sbu71kc9Wj08BRj6cBgsJtR/tq9OfEFKOAukEV5L/cQza23ybWG0KSq134YO7uLOOE5T
 LmK8Rmni7goG3VVYSvyNIbMEFejJROsQ7IISX95vRWLGhLNfq55Sy5X3+v1HYFiND9KX
 c9jKQ7T61umSAsqQQfYWwvXR/DBQwIpqqB+tdB85Se9wiBk7z5BDiUMw6DRmAT+KVGun
 wxAq9asGla7KeGgNhkGojyQ/wqxWr3R3X2vRlwxAw/iCXBfbrzz65JaVIJAC0fgEHwHz
 4b0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156351; x=1721761151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qc7kDWbr1ZOLQ8+EMlKcMIOk0gPIa550UiXaV/Fsdqw=;
 b=WW7YW+DK6M5OH/bavXYwnIozlagJTshQ6xT9Y0ZQra3Dq0AElR3WUIsVUVAbPrswgJ
 J/T5Y9TuGCVOigDM/p+6saSzkdzAPQdxktZOXOLTlatKwek9X29wm/kI9rso4ICkRDdQ
 t7sqiT11ONkRkNSUrbabPCri6NYnmzPivppp/a6jQIin3Z046eLVrIWs00CsrJ+6fLFG
 rmO2+K6IFp9Vl94Nj22fPADkEt65j9tHs03GdjPVhQ8QNEQlJE+gF98v4b2XkSVgxlmV
 BRw84B2xDujv5KxW4bouj5HMrS/zashY/g/gy9/lpPiWXqrZQvn7/TmcgueGJ8n6/+Pc
 6DmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7OMqSRPuQ26TSOlZ16/h5rGomJmD8U5tEDfN2nY37lpbCfoOouQb+AKeQidwzsKZaB+wbhbgjeWZhtdO1bid6vTcfBis4fzqLCY85IRFhSjeDnnUfAffQWoEBGRSEyvmr0E9+0pbMVW+FLs9QKXatJW85KFxZ5lvNBtstzUBI7idzXn9STc4w14cSf5FLJVhsrJ5CyQ3aVlOlq/z7CdFI31pyk8u/MN2YPptKUO8UGLl2DcY=
X-Gm-Message-State: AOJu0YzCLr5JevZrmpNBbWcxnNKYFhTP/sts08DkdCySUYFYzcljwJ8G
 kKc1Avdfz3cMAnpCN0SELMzu2pPD8YaaxNtW1iCz45wajApvm8li
X-Google-Smtp-Source: AGHT+IHniHFngXKTceOiLqztTPmU7D7E7YPzARR6ATJ7IKtQAVjxB0kHb2reQWR1pBYIGtzlOj9sIw==
X-Received: by 2002:a5d:9f52:0:b0:7f6:565d:9046 with SMTP id
 ca18e2360f4ac-816c52c12c9mr28199839f.19.1721156351398; 
 Tue, 16 Jul 2024 11:59:11 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:11 -0700 (PDT)
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
Subject: [PATCH v9-resend 36/54] drm-dyndbg: DRM_CLASSMAP_USE in nouveau
Date: Tue, 16 Jul 2024 12:57:48 -0600
Message-ID: <20240716185806.1572048-37-jim.cromie@gmail.com>
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
 drivers/gpu/drm/nouveau/nouveau_drm.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a947e1d5f309..27995c0c9b31 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -72,17 +72,7 @@
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
2.45.2

