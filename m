Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A66A293310A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BCA10E859;
	Tue, 16 Jul 2024 19:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y4c67htu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBDB10E839;
 Tue, 16 Jul 2024 18:59:07 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-7fb93b2e2a3so4689539f.1; 
 Tue, 16 Jul 2024 11:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156346; x=1721761146; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wA7EEvNcqBzVLrMMb21MWcD/ne6Fagi31tYXyTCW1gg=;
 b=Y4c67htun//cMK2tSjgt4HR6pN+cnzND8Lqh8nukiHaDOiJx4Ja0c8V9eQRGEukMQr
 m9jwtDWBPe6bxcbvPmg/WtPXve7fODjp5aIHacSb/5Aiji5S2+0SQPABojU7MsicdmHs
 1PqMN9xVk+6WzLX3dftTtpy96LwzI9w2TCDoceEJ2/nLqRDPPPLZUVPnNzvUaYq2RpRh
 F4mKpKzWLbsqreVfScMUYov2PuBX2OXIjrgP+7tm9n1I+BfGyudQePZBUhXpkIza1D4j
 Lh09aKBy5hA7ET/O/2/2cCGE4dOVXNkzNKnqUklDDTAqok46eJylX93JUjrTU54J3ZBY
 105w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156346; x=1721761146;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wA7EEvNcqBzVLrMMb21MWcD/ne6Fagi31tYXyTCW1gg=;
 b=mxXFFkV9/BmDFhpeaxoTa9i0j4p17u1nW601k9CNpRSt5h2DTdPbHnydW+xLHNDwDR
 /vzLvvMBeR0Y3OA1YZ4qEwv87nqi7RWF9o9iulsdWUn45kV1kNFp33VcKjRCPYx7nFfk
 /TYJOevOiBPoxt591tmD0YjrICPUypUCLHedL4M5GuECSAhNwmB71ND2b27y/dQGT2MK
 uR3WTXcf6uJXgukvmQ9Xrxqe6oOu3b+JY6zSj8CAWIWEV1KXpKLLKzdhg0See7bYWeNT
 LroGyz7nqn5+N8DSe8B7R04qvRVc29pLDC4yqcfilnE11AWMelynL+U3LBjI5IpJ4dWU
 rnaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEeLLC9Z9bHznSGZcWY6C4ymaNjAM7kmDweOXjx68F3fTK05kTclTSHX8rTeHDKNTLv2w6Is/ZKXgJhXE+zn2PzhggaGDbA1b8d8Uh/hBo9VkM2NJXLDnZKZ4iRglT4WnGLU1epoPUQHtMs/bkHrm1pYF3cudZEFNFNdZgJe1zTi1IV6Q9LzM0gHi7lGDnwuhbnLFTxF6ZHtgR8bVKMlGLbltpYkCa4LDuudFkbjfJ76i31Wc=
X-Gm-Message-State: AOJu0YxS379pnWRe+mWBa0tyVzqtpMQtuXSk9665A244s/PLNzHtOs6b
 bxBD4T5fQUk51r7HKTjRXgDz6zCgpVLXAjjcXwfYU5HzxZkF/hlR
X-Google-Smtp-Source: AGHT+IEhC47yLHdZQK/ojVAnON7EakJJDxnjzB59bSxRuEzqdArkdfVAg42BfhkcRtZiTR0u/zHvDA==
X-Received: by 2002:a05:6602:15d3:b0:806:f495:3b34 with SMTP id
 ca18e2360f4ac-816c2a1fbfamr43897839f.2.1721156346283; 
 Tue, 16 Jul 2024 11:59:06 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:05 -0700 (PDT)
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
Subject: [PATCH v9-resend 32/54] drm-dyndbg: DRM_CLASSMAP_USE in amdgpu driver
Date: Tue, 16 Jul 2024 12:57:44 -0600
Message-ID: <20240716185806.1572048-33-jim.cromie@gmail.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index ea14f1c8f430..83763d37566d 100644
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

