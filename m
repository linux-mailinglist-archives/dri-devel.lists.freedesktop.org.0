Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ADF97E494
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 03:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2CB10E35A;
	Mon, 23 Sep 2024 01:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="QBr7ddZj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37E010E354;
 Mon, 23 Sep 2024 01:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=0V2AdfgE23jS7hBIUEzp4BsZ0ty7sP1XLQloMvwgZOc=; b=QBr7ddZjimhR3pK5
 /Amz5CPf/6CBLQ38h+GLfjAr9adVboARmO9+K5OohmdlGKiNXEudlawNVqqDNDCHbmdHxViRSVyNJ
 8IJ82MDD6/djEl+Nlt2CDrhR9nsamtqVxyduqLsf9B4i0F7wPq8oU3RGWpYtoxinOxUcg6P8kXov1
 Wxv4AT64FKRXXqsd31RMMWZ33rOFmFY/n51FffBgzT6/ykTsaTpIKi6vgtOb6OKlcM+ofFk7BFuG1
 UMC/PtK+ckoH31Q0dI5FIwzcYNLya6gtw3fQoXQy7/Yf42aKDrqnmRasrrEPgQ4YFdvMvtXa7Ksct
 Ot5pA3rQ3VmFmub4YQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1ssXow-006k2k-2p;
 Mon, 23 Sep 2024 01:24:58 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/5] drm/amdgpu: Remove unused amdgpu_atpx functions
Date: Mon, 23 Sep 2024 02:24:43 +0100
Message-ID: <20240923012446.4965-3-linux@treblig.org>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240923012446.4965-1-linux@treblig.org>
References: <20240923012446.4965-1-linux@treblig.org>
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

amdgpu_atpx_dgpu_req_power_for_displays has been unused since
commit bdb1ccb080da ("drm/amdgpu: remove ATPX_DGPU_REQ_POWER_FOR_DISPLAYS
check when hotplug-in")

amdgpu_atpx_get_dhandle has been unused since commit
f9b7f3703ff9 ("drm/amdgpu/acpi: make ATPX/ATCS structures global (v2)")

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h              |  8 --------
 drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c | 12 ------------
 2 files changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index c654668e2a56..f360296fc9da 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1452,23 +1452,15 @@ void amdgpu_register_atpx_handler(void);
 void amdgpu_unregister_atpx_handler(void);
 bool amdgpu_has_atpx_dgpu_power_cntl(void);
 bool amdgpu_is_atpx_hybrid(void);
-bool amdgpu_atpx_dgpu_req_power_for_displays(void);
 bool amdgpu_has_atpx(void);
 #else
 static inline void amdgpu_register_atpx_handler(void) {}
 static inline void amdgpu_unregister_atpx_handler(void) {}
 static inline bool amdgpu_has_atpx_dgpu_power_cntl(void) { return false; }
 static inline bool amdgpu_is_atpx_hybrid(void) { return false; }
-static inline bool amdgpu_atpx_dgpu_req_power_for_displays(void) { return false; }
 static inline bool amdgpu_has_atpx(void) { return false; }
 #endif
 
-#if defined(CONFIG_VGA_SWITCHEROO) && defined(CONFIG_ACPI)
-void *amdgpu_atpx_get_dhandle(void);
-#else
-static inline void *amdgpu_atpx_get_dhandle(void) { return NULL; }
-#endif
-
 /*
  * KMS
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c
index 375f02002579..3893e6fc2f03 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c
@@ -89,18 +89,6 @@ bool amdgpu_is_atpx_hybrid(void)
 	return amdgpu_atpx_priv.atpx.is_hybrid;
 }
 
-bool amdgpu_atpx_dgpu_req_power_for_displays(void)
-{
-	return amdgpu_atpx_priv.atpx.dgpu_req_power_for_displays;
-}
-
-#if defined(CONFIG_ACPI)
-void *amdgpu_atpx_get_dhandle(void)
-{
-	return amdgpu_atpx_priv.dhandle;
-}
-#endif
-
 /**
  * amdgpu_atpx_call - call an ATPX method
  *
-- 
2.46.1

