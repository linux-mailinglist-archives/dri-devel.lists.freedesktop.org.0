Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C183912BB
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CAE6EC35;
	Wed, 26 May 2021 08:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F186B6EC2F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:37 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id p7so178957wru.10
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qrtEkiWPh1VsC0TCpSiXhurw/AoAcdO+uVVz+pBsZfQ=;
 b=ezhWvGsdrmBxcn9brdcQNASBFzEUTDY+CWlPgn0LfRwhFwjnRx1C0WPMxVEA3cgFqx
 WNqu7WDp6Md98NycpVBE0w/QwtnsWHdzC2G/PMJF/Pj0oZYQaE2FRO2OKiuUJtb3e+Us
 q/x37uy5grJyPcj8LwAYfYfKDw4HSnk1YD9ub9NF6LKYv3FFhFH4EYk6M8sY3G9lvsrI
 Rp98ZAsTPJuUjduDt8a717DmOenksFyeISlJYJrDv+53r7X/TmADYbGRizlOS94//FBy
 qhpNPhsEEQoeRoyfwdYWCK8H6vamKnyAczb2BX5tZn9JpqB9FSs54fYUpPfH4b9poA5u
 jwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qrtEkiWPh1VsC0TCpSiXhurw/AoAcdO+uVVz+pBsZfQ=;
 b=AO8nCJekrqCfuxDFurpsa4iEx/nWj4yFEN+BdIASQLXr+9OF2jNCT/0sByCxDQm/Mr
 d02oLBFQPiB3W+LiTcaVn8Zs7oV0He/gYOdQBgb2vbKZDwGHLHxoWIUr0agUTzxZks49
 /5/hfPJ/++90eZ3h3h6l+AVuu/Gw6NGZFQMr+w0vnYUnqq36MjPDW9tdDUVIUgD9Aqxb
 dr6oq4G4HPLirvovi3SddLG+INVz2ahpXB25Lq+PwrcPoRTalhcDbUDFbv/4bjqQVP2n
 /l9w5CgkMD+HfEVlge1rn1JH1g5YnBtARceydeByDeTPoO6paluBSklfhPlthjZ3yUSz
 z+Og==
X-Gm-Message-State: AOAM531iR+DkkO9DUD7RubrU6MIfAaK0AsLWzm/VxiLhTad8E9kodBiT
 TsoMFVGj8KXlywpGq0CMv7CrOg==
X-Google-Smtp-Source: ABdhPJzZzHw3tZBUns2t0+wWPmVsHNPAlKPZ4UZNuMBF9U/LCq6esrCB+KvyMAs+4MnFN1yCu4+QBw==
X-Received: by 2002:a5d:6484:: with SMTP id o4mr30586678wri.8.1622018856595;
 Wed, 26 May 2021 01:47:36 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:36 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 06/34] drm/amd/pm/powerplay/hwmgr/vega10_hwmgr: Kernel-doc
 headers must contain function names
Date: Wed, 26 May 2021 09:46:58 +0100
Message-Id: <20210526084726.552052-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:547: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:603: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:629: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:1006: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:1155: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:1608: warning: expecting prototype for Populates single SMC GFXSCLK structure using the provided engine clock(). Prototype was for vega10_populate_single_gfx_level() instead
 drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:1663: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:1713: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:1862: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:2546: warning: expecting prototype for Initializes the SMC table and uploads it(). Prototype was for vega10_init_smc_table() instead
 drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:2922: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Evan Quan <evan.quan@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 .../drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c | 26 +++++++++++--------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
index 31c61ac3bd5e1..25979106fd255 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
@@ -544,7 +544,7 @@ static int vega10_get_socclk_for_voltage_evv(struct pp_hwmgr *hwmgr,
 
 #define ATOM_VIRTUAL_VOLTAGE_ID0             0xff01
 /**
- * Get Leakage VDDC based on leakage ID.
+ * vega10_get_evv_voltages - Get Leakage VDDC based on leakage ID.
  *
  * @hwmgr:  the address of the powerplay hardware manager.
  * return:  always 0.
@@ -600,7 +600,7 @@ static int vega10_get_evv_voltages(struct pp_hwmgr *hwmgr)
 }
 
 /**
- * Change virtual leakage voltage to actual value.
+ * vega10_patch_with_vdd_leakage - Change virtual leakage voltage to actual value.
  *
  * @hwmgr:         the address of the powerplay hardware manager.
  * @voltage:       pointer to changing voltage
@@ -626,7 +626,7 @@ static void vega10_patch_with_vdd_leakage(struct pp_hwmgr *hwmgr,
 }
 
 /**
- * Patch voltage lookup table by EVV leakages.
+ * vega10_patch_lookup_table_with_leakage - Patch voltage lookup table by EVV leakages.
  *
  * @hwmgr:         the address of the powerplay hardware manager.
  * @lookup_table:  pointer to voltage lookup table
@@ -1003,7 +1003,7 @@ static int vega10_setup_asic_task(struct pp_hwmgr *hwmgr)
 }
 
 /**
- * Remove repeated voltage values and create table with unique values.
+ * vega10_trim_voltage_table - Remove repeated voltage values and create table with unique values.
  *
  * @hwmgr:      the address of the powerplay hardware manager.
  * @vol_table:  the pointer to changing voltage table
@@ -1152,7 +1152,7 @@ static void vega10_trim_voltage_table_to_fit_state_table(
 }
 
 /**
- * Create Voltage Tables.
+ * vega10_construct_voltage_tables - Create Voltage Tables.
  *
  * @hwmgr:  the address of the powerplay hardware manager.
  * return:  always 0
@@ -1595,7 +1595,8 @@ static int vega10_populate_smc_link_levels(struct pp_hwmgr *hwmgr)
 }
 
 /**
- * Populates single SMC GFXSCLK structure using the provided engine clock
+ * vega10_populate_single_gfx_level - Populates single SMC GFXSCLK structure
+ *                                    using the provided engine clock
  *
  * @hwmgr:      the address of the hardware manager
  * @gfx_clock:  the GFX clock to use to populate the structure.
@@ -1660,7 +1661,8 @@ static int vega10_populate_single_gfx_level(struct pp_hwmgr *hwmgr,
 }
 
 /**
- * Populates single SMC SOCCLK structure using the provided clock.
+ * vega10_populate_single_soc_level - Populates single SMC SOCCLK structure
+ *                                    using the provided clock.
  *
  * @hwmgr:     the address of the hardware manager.
  * @soc_clock: the SOC clock to use to populate the structure.
@@ -1710,7 +1712,8 @@ static int vega10_populate_single_soc_level(struct pp_hwmgr *hwmgr,
 }
 
 /**
- * Populates all SMC SCLK levels' structure based on the trimmed allowed dpm engine clock states
+ * vega10_populate_all_graphic_levels - Populates all SMC SCLK levels' structure
+ *                                      based on the trimmed allowed dpm engine clock states
  *
  * @hwmgr:      the address of the hardware manager
  */
@@ -1859,7 +1862,8 @@ static int vega10_populate_single_memory_level(struct pp_hwmgr *hwmgr,
 }
 
 /**
- * Populates all SMC MCLK levels' structure based on the trimmed allowed dpm memory clock states.
+ * vega10_populate_all_memory_levels - Populates all SMC MCLK levels' structure
+ *                                     based on the trimmed allowed dpm memory clock states.
  *
  * @hwmgr:  the address of the hardware manager.
  * return:   PP_Result_OK on success.
@@ -2537,7 +2541,7 @@ static void vega10_check_dpm_table_updated(struct pp_hwmgr *hwmgr)
 }
 
 /**
- * Initializes the SMC table and uploads it
+ * vega10_init_smc_table - Initializes the SMC table and uploads it
  *
  * @hwmgr:  the address of the powerplay hardware manager.
  * return:  always 0
@@ -2919,7 +2923,7 @@ static int vega10_stop_dpm(struct pp_hwmgr *hwmgr, uint32_t bitmap)
 }
 
 /**
- * Tell SMC to enabled the supported DPMs.
+ * vega10_start_dpm - Tell SMC to enabled the supported DPMs.
  *
  * @hwmgr:   the address of the powerplay hardware manager.
  * @bitmap:  bitmap for the features to enabled.
-- 
2.31.1

