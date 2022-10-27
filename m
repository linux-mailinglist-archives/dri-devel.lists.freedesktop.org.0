Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9758E60F8BA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 15:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE6210E634;
	Thu, 27 Oct 2022 13:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7407A10E58B;
 Thu, 27 Oct 2022 08:59:15 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id h14so905225pjv.4;
 Thu, 27 Oct 2022 01:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KU8QUlmyL8K+kL2JWwcrY9MKfup5fHZG57Xenhinxbw=;
 b=KSYKzgO5bo3EHVAA36BTCInDIsYnBhnaVYPX+l79AEiJNHcUstKm85vMi+JzUs58uT
 KFiUXNGJ/611sUUzd3msbLK+C1jVwIw2PS9/nrxVQfwcoUCRYCxr3+ziWgsz9dXszTBS
 tJbRKzhe9vifba5gzjAE1VvW0iWAcxeEAKjsU6oOaZ8fhMAAfBmIDTBhl6t5XrM8r8cq
 zuErgoZ02sCkHxrTHNTz0VTnQapSoABy8hdOQCvFGV1OG0O+uvpVqcVXZ820awkYLViW
 cBcJbRq54zdVXKarPITq8c5P8AvJZ8F8Zv5sAliAdwQ/A2dYlQIKgZ59yjixxLsdAyVl
 /+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KU8QUlmyL8K+kL2JWwcrY9MKfup5fHZG57Xenhinxbw=;
 b=aLKoToHD/hcO1KOQrzQ79F1vS3EcrR0CSzTrbhDACF6p32CEwLCzeEJLoLUDneERM+
 jxzrwceIiFqv0m4kOoS4WUUxuoRADUPxasmvh+X9M6ewcXrL4Lmn+Z/lmgOkRUyNPuWq
 crdmaIwioqeokogZvQ14bMJFIyRYs7o7ZLb8ybY6Jy4HAzGDWBXpsfgjCyPEO3o3utSA
 4B4/7uaFiFqGBrghiuXb5izTKI3bJh7sx4Epo3IkLA4TJk0OfKH7FteRE4KWbJlGkASJ
 L3sXLOCMA2VIOrMXRZ04MlLQqrEJkYIK/O4YN5KRZ3EscnOYXfEQrlK//5J92RurAGVk
 ZSWA==
X-Gm-Message-State: ACrzQf0hMwFVVtInIgUJAKKTRqHLq3a9NP27oC4uf+2ttlgIZuPAM5Py
 qFog2p4sS+G+Tq6PSr1D17I=
X-Google-Smtp-Source: AMsMyM66ukX1ctNL2P50qsKqcWsCvPccrwS7iSlv8cUwHi9AKQis3RBSWyzfcOhwA1zmjNtdfZSwmw==
X-Received: by 2002:a17:902:dac5:b0:186:a687:e082 with SMTP id
 q5-20020a170902dac500b00186a687e082mr20920145plx.84.1666861155009; 
 Thu, 27 Oct 2022 01:59:15 -0700 (PDT)
Received: from mail.google.com (122-58-209-93-fibre.sparkbb.co.nz.
 [122.58.209.93]) by smtp.gmail.com with ESMTPSA id
 23-20020a631357000000b0046f1e8cb30dsm635717pgt.26.2022.10.27.01.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 01:59:14 -0700 (PDT)
Date: Thu, 27 Oct 2022 21:59:04 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Victor Zhao <Victor.Zhao@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Evan Quan <evan.quan@amd.com>,
 Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
 Isabella Basso <isabbasso@riseup.net>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] [next] drm/amdgpu: clean up unused constants, macros and
 includes
Message-ID: <Y1pIWKbPi1GtPfE9@mail.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 27 Oct 2022 13:12:44 +0000
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
Cc: linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove include directives in which header is already included via
another header (atombios.h -> atom.h). Remove unused constants and
macros.

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h              | 3 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 0e6ddf05c23c..dc55e60c2e4a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -245,10 +245,8 @@ extern int amdgpu_vcnfw_log;
 #define AMDGPU_VM_MAX_NUM_CTX			4096
 #define AMDGPU_SG_THRESHOLD			(256*1024*1024)
 #define AMDGPU_DEFAULT_GTT_SIZE_MB		3072ULL /* 3GB by default */
-#define AMDGPU_WAIT_IDLE_TIMEOUT_IN_MS	        3000
 #define AMDGPU_MAX_USEC_TIMEOUT			100000	/* 100 ms */
 #define AMDGPU_FENCE_JIFFIES_TIMEOUT		(HZ / 2)
-#define AMDGPU_DEBUGFS_MAX_COMPONENTS		32
 #define AMDGPUFB_CONN_LIMIT			4
 #define AMDGPU_BIOS_NUM_SCRATCH			16
 
@@ -1227,7 +1225,6 @@ int emu_soc_asic_init(struct amdgpu_device *adev);
 #define amdgpu_asic_set_vce_clocks(adev, ev, ec) (adev)->asic_funcs->set_vce_clocks((adev), (ev), (ec))
 #define amdgpu_get_pcie_lanes(adev) (adev)->asic_funcs->get_pcie_lanes((adev))
 #define amdgpu_set_pcie_lanes(adev, l) (adev)->asic_funcs->set_pcie_lanes((adev), (l))
-#define amdgpu_asic_get_gpu_clock_counter(adev) (adev)->asic_funcs->get_gpu_clock_counter((adev))
 #define amdgpu_asic_read_disabled_bios(adev) (adev)->asic_funcs->read_disabled_bios((adev))
 #define amdgpu_asic_read_bios_from_rom(adev, b, l) (adev)->asic_funcs->read_bios_from_rom((adev), (b), (l))
 #define amdgpu_asic_read_register(adev, se, sh, offset, v)((adev)->asic_funcs->read_register((adev), (se), (sh), (offset), (v)))
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
index b81b77a9efa6..0c3448dc4951 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
@@ -26,7 +26,6 @@
 #include "atomfirmware.h"
 #include "amdgpu_atomfirmware.h"
 #include "atom.h"
-#include "atombios.h"
 #include "soc15_hw_ip.h"
 
 union firmware_info {
-- 
2.37.3

