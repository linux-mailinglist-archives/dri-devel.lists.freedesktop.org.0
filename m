Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721EB924A80
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33C010E6E9;
	Tue,  2 Jul 2024 21:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WFq0a40c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD8510E6DC;
 Tue,  2 Jul 2024 21:58:54 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-7eba486df76so868039f.0; 
 Tue, 02 Jul 2024 14:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957534; x=1720562334; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UK1rhky1L0Uh2dLu61vy8boLc9OqspSM7tQ5uDrS370=;
 b=WFq0a40coKMKuuIa78KcYOxzpV9uy+CAvu9I8wQRUzxFWwGSpdCehAn5RZqE/YP8da
 SJIFpNNLFlY/hwj4z8q8/hNutKiJBNuMc+RiSR4nD7mw0M8yFTSa9Z4cMzIiDQZjXFxY
 Tskvq795SVZAVeuQOC4P5a2v5zHAfdCMok5w/cj5hOqHtzcOTSgw8yJB0vSRTAy+35gg
 dRszIvZMz7H2Trn4NZxgIeqhY3wO6cWm0KUiIMnBdhVx8grBCdjta5bwdZAicqVF0/aP
 NgxacFhYq4pD/Rb2HmT2GsRRIVg+SBwz+qtLg5b2E1C1OdMyGMOP/0AHrZDrHmMNyxSO
 Q1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957534; x=1720562334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UK1rhky1L0Uh2dLu61vy8boLc9OqspSM7tQ5uDrS370=;
 b=ZhEmx5dTUij3oEsQjHQUrHr+F64XuXgT0o3LaOiI9Xrar+FSsBzp5V7XNt0BerVIed
 bCMPR3DARqE1eaEkc4GBDdwIWwhNKxUpJIcXbdRZl1CL+YCeUE0smOtsF+k/PsRosPag
 yM6g2WALd/BO4cEVcIW56fWw61zlZWGqTcU0FwC6N0vjTlk7DkBsYgNpJnyUkDI/3dRV
 6kR+7NoWbAkIWSFkLrTcBRc1ATZBqprY1Q2lBE0W0kqc1os9PlINs+ySatzeyxab1d33
 ie93rxMPzc/WiMCHmCaypYcHEgtxa1v0ublAa+F9NOGEyvTQ2HrHRg4xmq339gLlO9O9
 YSMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIjzcCQz7f6AwZYr90n9r/MCopIHFNTcjUsnpIBvk8nwRV0PdZxV4nbbt8rOWQOocNQzWXBr8v4hkqCOHrrtjUrak7/EG4elEffKPjEIRBmO/hnMvJhsa1jvBAEyKfdEiWtro99d6zyL4pQlH0V7WfBZBLN72PmtAgx39FvbiTY0ndZfswoCuifpq01zz4ZKns4dHufXF62BXUoZP6HJCPQGpTTh+KP73DzaccH5D6hGutIEg=
X-Gm-Message-State: AOJu0YxWDcIwvjs04QHby3Ucc1xhzwCu09wLA+vFpI46Ou+VRsXogX6e
 cF6g5Z1ej0hkLotE9EvqiL9YZnO1eh78c3oAvaYCrhviVzY9ONqx
X-Google-Smtp-Source: AGHT+IGYp0RboRXc4AYNUXGuU4aFvoVlXDTzLDPuxZv6t3qpmmIpFtCdOXEccDrNUTrugIVGTZM8hg==
X-Received: by 2002:a05:6602:2558:b0:7eb:dac1:16bf with SMTP id
 ca18e2360f4ac-7f61f5243e0mr650832239f.6.1719957533818; 
 Tue, 02 Jul 2024 14:58:53 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:53 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 32/52] drm-dyndbg: DRM_CLASSMAP_USE in amdgpu driver
Date: Tue,  2 Jul 2024 15:57:23 -0600
Message-ID: <20240702215804.2201271-34-jim.cromie@gmail.com>
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

