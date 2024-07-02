Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF97E924A7F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA7610E6EB;
	Tue,  2 Jul 2024 21:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i60weS71";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BBE10E6DC;
 Tue,  2 Jul 2024 21:58:55 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-7f624e70870so253605039f.3; 
 Tue, 02 Jul 2024 14:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957535; x=1720562335; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UK1rhky1L0Uh2dLu61vy8boLc9OqspSM7tQ5uDrS370=;
 b=i60weS71qjR1cmbPxH80g4E29ifwPSbgiTskn4tPfFeEGUR3nLDIYTaAMHGIGTH9sl
 8u1Egugxd31G/YaDNMb6I4zpUw0RMIO5NZbWGo2yF+ifot5qH/oiKN9em2pqp+UkFyyn
 +EHjoF2wPVVJeHAwpBw/s4coVUYTo/TH/Mf2ghYrZlt6iEXYL3lrxCQczHDKYXSueURb
 omWmyFTognoMXxUQvY9fkAKvRy8/HKbzvsB57zLiIf1h8tCK2jmEO3yFxeY7fYYNwRwi
 KXiTB638tj+VbfOnyzrXyLENHYdxgsw78mpFk4DNMzR1Mjr/0rGcvxTyiXKxhGRU4BAQ
 obKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957535; x=1720562335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UK1rhky1L0Uh2dLu61vy8boLc9OqspSM7tQ5uDrS370=;
 b=DrjbDbFl632SJGuDkV3iqn2znjtNJpC9y6wRDH4qDouBsXsASN0BO9jkJg5eeon2J5
 hsoH7KRSxDlethA8IIACJfRsla5DJh+oSdhpTdSQEa+H4kep301LXxLr/o4d5E43OZHE
 Po+qrmwQoz0QbSSzMkT9+1M0vFfb3UCMHkpNrzh28iiHAwosER739qj6xt8ploE6hF55
 Gz9xyB9NO+uTVLJ1m/NUFETuy0LPYvaaJ2zUbo6+1tOJ3KN3XcOJrzan8hmBfr1H0a+z
 8xYyIaOGjwITgZk2UliDsLikw2PQBDjP4Eaf5AzSnCtk3AI5ayIYx/BZo/IsrNByhC/S
 tCmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6bsKT/fFKX9e6VFqy7/uad5grxElFb8WeziXvCCUwBItBX0b9ISNiN7JIkpKy0o6330fpwAsy/VLOYJ5MHs024u9QUPvaeSBDtSAqpAm8y2uQC+93+pKsnYiEXq5YkP3+Kmq5glJqYQzLMNnVJdtt8mH6v5QckAO8dEaUNcllGcC5DZfJA3MuDI9kPTpcdHypQbN2JWGeN1TNdT4ZyfwAZmXBXSmAP5VTwDwJ2FCmklXpYNk=
X-Gm-Message-State: AOJu0Yw/nY7wNoZYaxdfePxWEFsDpLe+7SKEIyyCzIejYu+KJxTPRF2T
 q4CK9wih97zYVB89wmC2NwroNklKcr9HblEqsbbbc/0geIOUYXbT
X-Google-Smtp-Source: AGHT+IHLc/l4rSLolOTsFYm7TsKqkhWE4Jfzo0NU47TaXhV5RuwQAoXmcV+1NSMfPYNESCW3q8/CLQ==
X-Received: by 2002:a6b:6106:0:b0:7f6:2e72:e81b with SMTP id
 ca18e2360f4ac-7f62ee168f6mr1110047139f.4.1719957534832; 
 Tue, 02 Jul 2024 14:58:54 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:54 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 33/53] drm-dyndbg: DRM_CLASSMAP_USE in amdgpu driver
Date: Tue,  2 Jul 2024 15:57:24 -0600
Message-ID: <20240702215804.2201271-35-jim.cromie@gmail.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index e4277298cf1a..b287f0cfd8fa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -217,17 +217,7 @@ int amdgpu_damage_clips = -1; /* auto */
 
 static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
 
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
 
 struct amdgpu_mgpu_info mgpu_info = {
 	.mutex = __MUTEX_INITIALIZER(mgpu_info.mutex),
-- 
2.45.2

