Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D33CC2D940C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:18:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B586E0E8;
	Mon, 14 Dec 2020 08:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834C76E9FE;
 Fri, 11 Dec 2020 19:32:58 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id i3so7603564pfd.6;
 Fri, 11 Dec 2020 11:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=yscUIRHphl57WTyf7pGrRDrrRirSs+LIMlStQDJD4h4=;
 b=kib8ptgiRi9Rpdv6SG90FgWZNGMv+QBwMSyvNZEOI+E3xw4yMRam/Hkhl7jak8VM72
 lb1F9B1ldb8e7tWPyBs12wNTH0gBXWoFF/yigXwSKKZ/AKcfSjcn5zjh/9/rZHn9H+Zy
 AY4x4Gq6kAP1fW1GVteqh7TPmL44K2LUkTwIhGOXkxKqi2tytAJaquScpcjqbcZ9d6cA
 +hX0zfxK5QWFfeiqaHZ7IDXNF4N0TGPBBWp82y9AtqO3OZek9Y9LzqfO3dZLhOLWo6cL
 fvwXPjSTGhr7f9KQhBPCljyMCuxs1IeXYDrP6ZcAKRFvmyBLUDgMl+/MOpcVR6EnLKF5
 st0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=yscUIRHphl57WTyf7pGrRDrrRirSs+LIMlStQDJD4h4=;
 b=njvaFRNnLMJDGcMhUxEXw7IM3SbnfMdRqWYjsCg3waNrPpTMRfWfOPyegjWFDJP3mG
 0xvbEishlYdltgUOlrGbSG+KkdgO5wr0X9+KgJkm6BwTgmCTKrkf4YnShOllNw/iaL28
 NJHWS8WnckjW19iljNIPNMpSvAMF+kMzGSV8uKArTa6bV8uk50CSFEAO/U8B0cF4584F
 kDyxLHEfB2zUD/dHCxxI8ab3r/vEAp0oKEslzLsCPpJq3D1Dkko6lTBseYoaxVj2mADb
 qXXlgkT5Wdv9bBXjf/zFhMX95D5ueMqDNhGa5C1RogirqN7iF67jrc7+oUXUAw2EGxyA
 uigg==
X-Gm-Message-State: AOAM5333GpA3K1NuiK1YFiAKSmVR3mVPiMfXeiYX6Le5G/bbgCT/sREn
 L6IrqX+Omh30xBdiabDRGG8=
X-Google-Smtp-Source: ABdhPJwNoprX3DSMJJo2m05JcKw/NAnRSHHEbiQfyblS4U00fTfoqZ+1MngiJ6ryWSsX0IcYHDITLA==
X-Received: by 2002:a63:e849:: with SMTP id a9mr13179684pgk.300.1607715178001; 
 Fri, 11 Dec 2020 11:32:58 -0800 (PST)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.179.87.107])
 by smtp.gmail.com with ESMTPSA id z126sm10934993pfz.120.2020.12.11.11.32.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Dec 2020 11:32:57 -0800 (PST)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 nicholas.kazlauskas@amd.com, Rodrigo.Siqueira@amd.com,
 aurabindo.pillai@amd.com, stylon.wang@amd.com, eryk.brol@amd.com,
 hersenxs.wu@amd.com
Subject: [PATCH] drm/amd/display: Fixed kernel test robot warning
Date: Sat, 12 Dec 2020 01:02:36 +0530
Message-Id: <1607715156-4258-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Mon, 14 Dec 2020 08:17:40 +0000
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
Cc: Souptick Joarder <jrdr.linux@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kernel test robot throws below warning ->

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5349:5:
warning: no previous prototype for 'amdgpu_dm_crtc_atomic_set_property'
[-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5349:5:
warning: no previous prototype for function
'amdgpu_dm_crtc_atomic_set_property' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5373:5:
warning: no previous prototype for 'amdgpu_dm_crtc_atomic_get_property'
[-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5373:5:
warning: no previous prototype for function
'amdgpu_dm_crtc_atomic_get_property' [-Wmissing-prototypes]

As these functions are only used inside amdgpu_dm.c, these can be
made static.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 313501c..e6d069d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5328,7 +5328,7 @@ static void dm_crtc_reset_state(struct drm_crtc *crtc)
 }
 
 #ifdef CONFIG_DEBUG_FS
-int amdgpu_dm_crtc_atomic_set_property(struct drm_crtc *crtc,
+static int amdgpu_dm_crtc_atomic_set_property(struct drm_crtc *crtc,
 					    struct drm_crtc_state *crtc_state,
 					    struct drm_property *property,
 					    uint64_t val)
@@ -5352,7 +5352,7 @@ int amdgpu_dm_crtc_atomic_set_property(struct drm_crtc *crtc,
 	return 0;
 }
 
-int amdgpu_dm_crtc_atomic_get_property(struct drm_crtc *crtc,
+static int amdgpu_dm_crtc_atomic_get_property(struct drm_crtc *crtc,
 					    const struct drm_crtc_state *state,
 					    struct drm_property *property,
 					    uint64_t *val)
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
