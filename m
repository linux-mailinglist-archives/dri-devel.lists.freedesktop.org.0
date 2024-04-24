Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E5A8B0FC0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 18:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83DD10E2CB;
	Wed, 24 Apr 2024 16:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CQ5HO/43";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6AD910E2CB;
 Wed, 24 Apr 2024 16:28:13 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-41b09fb205dso360575e9.0; 
 Wed, 24 Apr 2024 09:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713976092; x=1714580892; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JGTvGTdmOEkfpJBObdVGs6RBZIv2agsPt8BWCLj0PV0=;
 b=CQ5HO/43ii1W5uvdspx6L8aH7fzWAuGLc6m8jT3bh4dGqhUOMCTZrx8Dgt1bMAY3PB
 26YbSuTjPLXo2PO2enBue4Ti325JAdjz5l9VoQjxrDf8QDswapmpGX7lijpNQuPIEqM4
 Avf06HArAjHW3DQIve5wMXEoGjof7FDDq95EHPb9jHyE2vqKSiiFMzgpxW0UCphcZ1nV
 rE6f60WIzzVs4ybK3qk+uvoImlNiyWmIUyPd9s3o4pzXBEcgBoQKt2PKNCRj0e2GTWPH
 lscTdeIw61CFinMSX+RVUSLqGzUUIgbqxVp1NxWdop+KZZ1pbTj6i+/vZjIJJtWHtg2I
 kyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713976092; x=1714580892;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JGTvGTdmOEkfpJBObdVGs6RBZIv2agsPt8BWCLj0PV0=;
 b=CwY3gc5/9pGzELi+h9Ei5de7XJHhgNqag8z+TixGudnBbx1xie9Az12XJqjvZIUYMr
 CbxfI/5UXujrXn6Mu1cpvTT3YJcfoIKOMdL8RWKwPmnouwdZ8euRUBwJ+H1vb9Ji1Ckq
 ljB4ckF6uW9fhhF4AAYi+6/1acIAL3Qz5CVDdshTS0/F1HYUAq/Yk2KvfUgvbitBrFT2
 MnvoYmtFrJn7fzx+R59fEjwiiDUc8BH78D/LFSUdju6al8h3maaaZWUIMSCUgyAuoPb/
 4nHrrcBaHbr7tLSW9AysO2aUFgjUWIVm8GzCqBJzYmgy2JUvQieajVwMW1On6efnPb0F
 Ehqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSbA+eKX2P8axFIrNryGa2c4eF0X+tpUmrWp0Lys7yA5ZZd3mh3Rb9IFTUfhPzzqQX5C+JN/BoEToaMiFTHsNjStiiUeuTZEMPovYtRAhabTmqudqTAvHkRbIcqFNRlPgLFOWcQwgQqeufVDv16g==
X-Gm-Message-State: AOJu0YwCU84yjoEAUXZWwNf8B6F1T4pxGSPmo5gooDqUDL71R71+FQ01
 LW1XFrQNcRPKBdky6+Z9BrRFmCuDBW/CM5lUJjDiHrcxYq3g6t5dkgGvMHVX
X-Google-Smtp-Source: AGHT+IFdyfgobu/a315DB2FtmY2cDEDxZGBYPtzRDMgTf+H7kT/QhdAaIfpMUsGqdQEDXdl5Xf1h1Q==
X-Received: by 2002:a05:600c:4f93:b0:419:cc9b:420a with SMTP id
 n19-20020a05600c4f9300b00419cc9b420amr2380021wmq.1.1713976091917; 
 Wed, 24 Apr 2024 09:28:11 -0700 (PDT)
Received: from localhost
 (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a05600c450d00b00417f700eaeasm24543125wmo.22.2024.04.24.09.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 09:28:11 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/display: Fix spelling various spelling mistakes
Date: Wed, 24 Apr 2024 17:28:09 +0100
Message-Id: <20240424162809.3948457-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

There are various spelling mistakes in dml2_printf messages, fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c      | 6 +++---
 .../display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c  | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index 846b0ae48596..2dea5965d02f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -5566,7 +5566,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		dml2_printf("DML: Tvm: %fus - time to fetch vm\n", s->TimeForFetchingVM);
 		dml2_printf("DML: Tr0: %fus - time to fetch first row of data pagetables\n", s->TimeForFetchingRowInVBlank);
 		dml2_printf("DML: Tsw: %fus = time to fetch enough pixel data and cursor data to feed the scalers init position and detile\n", (double)s->LinesToRequestPrefetchPixelData * s->LineTime);
-		dml2_printf("DML: To: %fus - time for propogation from scaler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime);
+		dml2_printf("DML: To: %fus - time for propagation from scaler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime);
 		dml2_printf("DML: Tvstartup - TSetup - Tcalc - TWait - Tpre - To > 0\n");
 		dml2_printf("DML: Tslack(pre): %fus - time left over in schedule\n", p->VStartup * s->LineTime - s->TimeForFetchingVM - 2 * s->TimeForFetchingRowInVBlank - (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime - p->TWait - p->TCalc - *p->TSetup);
 		dml2_printf("DML: row_bytes = dpte_row_bytes (per_pipe) = PixelPTEBytesPerRow = : %u\n", p->PixelPTEBytesPerRow);
@@ -7825,7 +7825,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	dml2_printf("DML::%s: mode_lib->ms.FabricClock = %f\n", __func__, mode_lib->ms.FabricClock);
 	dml2_printf("DML::%s: mode_lib->ms.uclk_freq_mhz = %f\n", __func__, mode_lib->ms.uclk_freq_mhz);
 	dml2_printf("DML::%s: max_urgent_latency_us = %f\n", __func__, mode_lib->ms.support.max_urgent_latency_us);
-	dml2_printf("DML::%s: urgent latency tolarance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
+	dml2_printf("DML::%s: urgent latency tolerance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
 	dml2_printf("DML::%s: ROBSupport = %u\n", __func__, mode_lib->ms.support.ROBSupport);
 #endif
 
@@ -10603,7 +10603,7 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 				if (display_cfg->plane_descriptors[k].immediate_flip && mode_lib->mp.ImmediateFlipSupportedForPipe[k] == false) {
 					mode_lib->mp.ImmediateFlipSupported = false;
 #ifdef __DML_VBA_DEBUG__
-					dml2_printf("DML::%s: Pipe %0d not supporing iflip!\n", __func__, k);
+					dml2_printf("DML::%s: Pipe %0d not supporting iflip!\n", __func__, k);
 #endif
 				}
 			}
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
index 0ef77a89d984..d1d4fe062d4e 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
@@ -2023,7 +2023,7 @@ bool dml2_core_shared_mode_support(struct dml2_core_calcs_mode_support_ex *in_ou
 	dml2_printf("DML::%s: mode_lib->ms.FabricClock = %f\n", __func__, mode_lib->ms.FabricClock);
 	dml2_printf("DML::%s: mode_lib->ms.uclk_freq_mhz = %f\n", __func__, mode_lib->ms.uclk_freq_mhz);
 	dml2_printf("DML::%s: max_urgent_latency_us = %f\n", __func__, mode_lib->ms.support.max_urgent_latency_us);
-	dml2_printf("DML::%s: urgent latency tolarance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
+	dml2_printf("DML::%s: urgent latency tolerance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
 	dml2_printf("DML::%s: ROBSupport = %u\n", __func__, mode_lib->ms.support.ROBSupport);
 #endif
 
@@ -8174,7 +8174,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		dml2_printf("DML: Tvm: %fus - time to fetch vm\n", s->TimeForFetchingVM);
 		dml2_printf("DML: Tr0: %fus - time to fetch first row of data pagetables\n", s->TimeForFetchingRowInVBlank);
 		dml2_printf("DML: Tsw: %fus = time to fetch enough pixel data and cursor data to feed the scalers init position and detile\n", (double)s->LinesToRequestPrefetchPixelData * s->LineTime);
-		dml2_printf("DML: To: %fus - time for propogation from scaler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime);
+		dml2_printf("DML: To: %fus - time for propagation from scaler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime);
 		dml2_printf("DML: Tvstartup - TSetup - Tcalc - TWait - Tpre - To > 0\n");
 		dml2_printf("DML: Tslack(pre): %fus - time left over in schedule\n", p->VStartup * s->LineTime - s->TimeForFetchingVM - 2 * s->TimeForFetchingRowInVBlank - (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime - p->TWait - p->TCalc - *p->TSetup);
 		dml2_printf("DML: row_bytes = dpte_row_bytes (per_pipe) = PixelPTEBytesPerRow = : %u\n", p->PixelPTEBytesPerRow);
@@ -10994,7 +10994,7 @@ bool dml2_core_shared_mode_programming(struct dml2_core_calcs_mode_programming_e
 				if (display_cfg->plane_descriptors[k].immediate_flip && mode_lib->mp.ImmediateFlipSupportedForPipe[k] == false) {
 					mode_lib->mp.ImmediateFlipSupported = false;
 #ifdef __DML_VBA_DEBUG__
-					dml2_printf("DML::%s: Pipe %0d not supporing iflip!\n", __func__, k);
+					dml2_printf("DML::%s: Pipe %0d not supporting iflip!\n", __func__, k);
 #endif
 				}
 			}
-- 
2.39.2

