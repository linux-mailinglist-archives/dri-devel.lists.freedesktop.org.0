Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5275ABA9DD
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 13:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA1210E28A;
	Sat, 17 May 2025 11:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EYfwv0ev";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0F510E200;
 Sat, 17 May 2025 03:06:17 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-47662449055so16680611cf.1; 
 Fri, 16 May 2025 20:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747451177; x=1748055977; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZZGXEhveDuCitdT22/K4UxFR+ROBomEnJNWF8hsYQo8=;
 b=EYfwv0evnZcj08BH/uoXrPtcKKIq8X8/8JRDoUH1arv8P4UUt2fCGWhsGBflIo0oiI
 UiWS5e8cN9soRTDGvv8SqzMqP9xKZUT7BTMzY4w/eP034Ak+sqlFC3hohWMUWub//+9s
 uWYc7AfTjGAa2Bwppec4HwVeq0Rvx1kFh31v026OpzJabUNlYfFGaFk6wefckJTQAjiE
 HY6ay9F7Fw48LrfaO9DjkjdCVlzm55qOFKt7jHRkKSg0fwnqykOKUt2M/mbYK42R2RLs
 qe+JvSiCSUrCeMg13rIF/95GsNoI3pcxIK63u77VVekDAJW2ErphiptY2qiD1iGS7pZs
 01WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747451177; x=1748055977;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZZGXEhveDuCitdT22/K4UxFR+ROBomEnJNWF8hsYQo8=;
 b=hn8ZLwV7dumGqlQm02PqjODys3ycjqwwpatV/NecHhMFAkVhL3x9OvQwCg/4Q3qU2Y
 dh/QikpTSzNy+9KzGwh+dMTxzP+x42Qj+DMUSNHoIoEnHX/9TbrNqXP4ok8cOCg4DExR
 EjgdeB3sPvWf11w+uRlSYYPoeYRPOA3GDXlYdpvRoZIElxuEV4LntJYC+uxSYWe4PRJ0
 2aF1K6Mabg1u1rQaG4WIM4BdBZR3oSX80NeTb8HtAnwkf1LSim/sGrFT/ETOYeMQnzWa
 g5J+rwwKI2pRcrXwKq0R8aNyVA7Ht7I+9qPBHXezgutl+wN3YlHm1+pXaBgwZdyCwSXI
 ApCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWinTlke3lb8sLyMKPE9jxu+Rr1/o1XDxuux0nkGhFq0y2PNb6PEeptwKCjOEHmVe2M+WgNIHChO14=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXLlApl6RiNttePjafuwN26qJuibXxme40MMLD2n99qI9lqTsf
 JVBH17j3KPfocLBvZnQZl6sJk2M14LpIv+Mw2DN9ZYkeBoGP3/Vr+Cs=
X-Gm-Gg: ASbGnctfr7KeH2GyB0jGI1qP/HGW1yYRaGeWMikkkYBm9+3F9idtxXD0hR4glCvL7oe
 8w8L2h9Xwaub3XQUByKo+zvaIqqzCo4shdidX9qQEtYUmR1biz/xAOZr26RbgVuTFVS0nY57b1d
 2D2iXURDZRCyIOMyeP2Q9n5biTgQiLd87kqso1+/sc4qcOiBeBmv8x++z/jGeGRjSSSxLS34F6w
 Zi74HVbcS1OKlV0bMZImu2fG6y099ZJUTkEPsXnLKTizkVRa17sfjeHQY+royNkl2lLvmggigfD
 zFmqBYKL66ObJCdf7psW8llaAUjd9SfqLWR4Em2LcCBr2Hf1CmWlRnblN5r6024qKeI0fUdP/pc
 k
X-Google-Smtp-Source: AGHT+IGC2KqqWdKSLgraq4ZAjWt6t+IYKKHBmiJqJ15wcpjY1936g/G59NR3qvc/8AmiYG0AaW0wow==
X-Received: by 2002:a05:622a:2447:b0:48b:512a:a919 with SMTP id
 d75a77b69052e-494ae3500acmr97122961cf.3.1747451176587; 
 Fri, 16 May 2025 20:06:16 -0700 (PDT)
Received: from localhost.localdomain
 ([2a0d:e487:156f:5546:ce07:3a5c:a2f1:3741])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-494ae3cd517sm19165721cf.10.2025.05.16.20.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 20:06:16 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: harry.wentland@amd.com,
	sunpeng.li@amd.com,
	siqueira@igalia.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, jihed.chaibi.dev@gmail.com
Subject: [PATCH 1/2] fixing typo in macro name
Date: Sat, 17 May 2025 05:06:09 +0200
Message-Id: <20250517030609.818725-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 17 May 2025 11:43:17 +0000
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

"ENABLE" is currently misspelled in SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS

PS: checkpatch.pl is complaining about the presence of a space at the
start of drivers/gpu/drm/amd/include/atomfirmware.h line: 1716 
This is propably because this file uses (two) spaces and not tabs.

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h | 2 +-
 drivers/gpu/drm/amd/include/atombios.h                      | 4 ++--
 drivers/gpu/drm/amd/include/atomfirmware.h                  | 2 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c                  | 2 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c         | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h b/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
index 813463ffe..cc4670316 100644
--- a/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
+++ b/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
@@ -424,7 +424,7 @@ struct integrated_info {
 /*
  * DFS-bypass flag
  */
-/* Copy of SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS from atombios.h */
+/* Copy of SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS from atombios.h */
 enum {
 	DFS_BYPASS_ENABLE = 0x10
 };
diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd/include/atombios.h
index b78360a71..a99923b4e 100644
--- a/drivers/gpu/drm/amd/include/atombios.h
+++ b/drivers/gpu/drm/amd/include/atombios.h
@@ -6017,7 +6017,7 @@ typedef struct _ATOM_INTEGRATED_SYSTEM_INFO_V1_7
 #define SYS_INFO_GPUCAPS__TMDSHDMI_COHERENT_SINGLEPLL_MODE                0x01
 #define SYS_INFO_GPUCAPS__DP_SINGLEPLL_MODE                               0x02
 #define SYS_INFO_GPUCAPS__DISABLE_AUX_MODE_DETECT                         0x08
-#define SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS                               0x10
+#define SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS                               0x10
 //ulGPUCapInfo[16]=1 indicate SMC firmware is able to support GNB fast resume function, so that driver can call SMC to program most of GNB register during resuming, from ML
 #define SYS_INFO_GPUCAPS__GNB_FAST_RESUME_CAPABLE                         0x00010000
 
@@ -6460,7 +6460,7 @@ typedef struct _ATOM_INTEGRATED_SYSTEM_INFO_V1_9
 
 // ulGPUCapInfo
 #define SYS_INFO_V1_9_GPUCAPSINFO_DISABLE_AUX_MODE_DETECT                         0x08
-#define SYS_INFO_V1_9_GPUCAPSINFO_ENABEL_DFS_BYPASS                               0x10
+#define SYS_INFO_V1_9_GPUCAPSINFO_ENABLE_DFS_BYPASS                               0x10
 //ulGPUCapInfo[16]=1 indicate SMC firmware is able to support GNB fast resume function, so that driver can call SMC to program most of GNB register during resuming, from ML
 #define SYS_INFO_V1_9_GPUCAPSINFO_GNB_FAST_RESUME_CAPABLE                         0x00010000
 //ulGPUCapInfo[18]=1 indicate the IOMMU is not available
diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/gpu/drm/amd/include/atomfirmware.h
index 0160d65f3..52eb3a474 100644
--- a/drivers/gpu/drm/amd/include/atomfirmware.h
+++ b/drivers/gpu/drm/amd/include/atomfirmware.h
@@ -1713,7 +1713,7 @@ enum atom_system_vbiosmisc_def{
 
 // gpucapinfo
 enum atom_system_gpucapinf_def{
-  SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS  = 0x10,
+  SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS  = 0x10,
 };
 
 //dpphy_override
diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
index 59fae668d..34e71727b 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
@@ -2594,7 +2594,7 @@ static int kv_parse_sys_info_table(struct amdgpu_device *adev)
 				le32_to_cpu(igp_info->info_8.ulNbpStateNClkFreq[i]);
 		}
 		if (le32_to_cpu(igp_info->info_8.ulGPUCapInfo) &
-		    SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS)
+		    SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS)
 			pi->caps_enable_dfs_bypass = true;
 
 		sumo_construct_sclk_voltage_mapping_table(adev,
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c
index 9d3b33446..9b20076e2 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c
@@ -394,7 +394,7 @@ static int smu8_get_system_info_data(struct pp_hwmgr *hwmgr)
 	}
 
 	if (le32_to_cpu(info->ulGPUCapInfo) &
-		SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS) {
+		SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS) {
 		phm_cap_set(hwmgr->platform_descriptor.platformCaps,
 				    PHM_PlatformCaps_EnableDFSBypass);
 	}
-- 
2.39.5

