Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 097318D5E50
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 11:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F1310E20C;
	Fri, 31 May 2024 09:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gZZctsip";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADC610E20C;
 Fri, 31 May 2024 09:32:14 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42101a2ac2cso8556305e9.0; 
 Fri, 31 May 2024 02:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717147933; x=1717752733; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=plB5SAM6IxvDio+P+8hN6eVaq+FHOovulQhKLCG8UQo=;
 b=gZZctsipAXslFsjPaTFLcgH3MqUjDUKPZGdakrvB09EObbRCD16TNipoQpHPGew0nV
 e3Ku7Mirtry1GfpAWapkrANBkWu/N1ASw5TZtu9z8CFAt+JidpdHDBbO3ATDnou/A1fk
 YDJdzbcbX1KH/sHhKQAGS6dWdIKzUp+P7v3StPXCoZsxMBYlKCK7KZ0b8a+EEKJsMLsv
 Y+PJ43dm1hTqYri6mFBRqLqtDby5SFnCbkqDRinO3c+zNjGKAXE8FPuc4fK8299oMIP+
 I+623cEsQkCN/QIqY2pv/i6/lzpLYkLRRz7M5aC2nTIVb4/JYxoC4IAjKWUbrwjXA2Sb
 IrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717147933; x=1717752733;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=plB5SAM6IxvDio+P+8hN6eVaq+FHOovulQhKLCG8UQo=;
 b=cOv1TfLZlGeewoUHTD1QUPo0py5BcQ0KTNzGsSrhSs/Ot9MO9TFfdAHZFUjX7KVcyK
 VBPQjf6oqfH50IkhrzMWrfp/06OYGwUydUokua6RtNvOakCDnEZENQdV1C16AAxBXE9s
 LxcCCFNpXRYbbPotOHl+bM71QYfVdBX/ilJ9rI1zQU+ts0oBTlpeAnp1mGrOVjp1Nkbq
 M4F5CzBoH7KIK8wxDnOaU9m40fDYf0yy+EYTBZwfqu5ES2FPAXdzU7orQFOOiHGL0anQ
 gE7qVPtxxO+CHfYXmKY0XUJwyP1/MY/tVoOQLpoj350YlJF0dOhprm1X2acUpsNyTSTW
 I1ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7xUFjU2v/wfgNtXKRwhAQHFouWgMNZ/3503lrvCx8hYM+pGzymFSsQYOaXIextDc0xHAfBcvvRQru17LVhoQO8sExvyvMVRxB4aiIZJB72/XIkAKIF13wKCwDWZ14Sb77G20SBYZSXaB4jCmJdQ==
X-Gm-Message-State: AOJu0YwzzZc7DgfXZLeZ6R3zrNFFd+E6EwtLojE1I2qxT+xZd8OKAdAh
 nnsT+bAqmUuRhl2WjvtH/37IAhVauDvIEdde6Mj0h5yAQcZyRHzj
X-Google-Smtp-Source: AGHT+IE0bKHCwG5bfyvuPS7N7Apz8rTAjCab6PPLcxedkbysqK6uLhGHr5+E0AiGg3Sxa4fUof6gSg==
X-Received: by 2002:a05:600c:4f95:b0:420:151e:b205 with SMTP id
 5b1f17b1804b1-4212e0d30cdmr12779385e9.39.1717147932369; 
 Fri, 31 May 2024 02:32:12 -0700 (PDT)
Received: from localhost
 (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4212709d4c7sm49326525e9.38.2024.05.31.02.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 02:32:11 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Hung <alex.hung@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/display: Fix a handful of spelling mistakes
Date: Fri, 31 May 2024 10:32:11 +0100
Message-Id: <20240531093211.498880-1-colin.i.king@gmail.com>
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

There are a few spelling mistakes in dml2_printf messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c      | 6 +++---
 .../display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c  | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index 8062144a5a6d..e7e6751f4477 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -5731,7 +5731,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		dml2_printf("DML: Tvm: %fus - time to fetch vm\n", s->TimeForFetchingVM);
 		dml2_printf("DML: Tr0: %fus - time to fetch first row of data pagetables\n", s->TimeForFetchingRowInVBlank);
 		dml2_printf("DML: Tsw: %fus = time to fetch enough pixel data and cursor data to feed the scalers init position and detile\n", (double)s->LinesToRequestPrefetchPixelData * s->LineTime);
-		dml2_printf("DML: To: %fus - time for propogation from scaler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime);
+		dml2_printf("DML: To: %fus - time for propagation from scaler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime);
 		dml2_printf("DML: Tvstartup - TSetup - Tcalc - TWait - Tpre - To > 0\n");
 		dml2_printf("DML: Tslack(pre): %fus - time left over in schedule\n", p->VStartup * s->LineTime - s->TimeForFetchingVM - 2 * s->TimeForFetchingRowInVBlank - (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime - p->TWait - p->TCalc - *p->TSetup);
 		dml2_printf("DML: row_bytes = dpte_row_bytes (per_pipe) = PixelPTEBytesPerRow = : %u\n", p->PixelPTEBytesPerRow);
@@ -8268,7 +8268,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	dml2_printf("DML::%s: mode_lib->ms.DCFCLK = %f\n", __func__, mode_lib->ms.DCFCLK);
 	dml2_printf("DML::%s: mode_lib->ms.FabricClock = %f\n", __func__, mode_lib->ms.FabricClock);
 	dml2_printf("DML::%s: mode_lib->ms.uclk_freq_mhz = %f\n", __func__, mode_lib->ms.uclk_freq_mhz);
-	dml2_printf("DML::%s: urgent latency tolarance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
+	dml2_printf("DML::%s: urgent latency tolerance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
 #endif
 
 	mode_lib->ms.support.OutstandingRequestsSupport = true;
@@ -11089,7 +11089,7 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 				if (display_cfg->plane_descriptors[k].immediate_flip && mode_lib->mp.ImmediateFlipSupportedForPipe[k] == false) {
 					mode_lib->mp.ImmediateFlipSupported = false;
 #ifdef __DML_VBA_DEBUG__
-					dml2_printf("DML::%s: Pipe %0d not supporing iflip!\n", __func__, k);
+					dml2_printf("DML::%s: Pipe %0d not supporting iflip!\n", __func__, k);
 #endif
 				}
 			}
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
index f2e2250d28d3..6eb3fec87ec1 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
@@ -1988,7 +1988,7 @@ bool dml2_core_shared_mode_support(struct dml2_core_calcs_mode_support_ex *in_ou
 	dml2_printf("DML::%s: mode_lib->ms.FabricClock = %f\n", __func__, mode_lib->ms.FabricClock);
 	dml2_printf("DML::%s: mode_lib->ms.uclk_freq_mhz = %f\n", __func__, mode_lib->ms.uclk_freq_mhz);
 	dml2_printf("DML::%s: max_urgent_latency_us = %f\n", __func__, mode_lib->ms.support.max_urgent_latency_us);
-	dml2_printf("DML::%s: urgent latency tolarance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
+	dml2_printf("DML::%s: urgent latency tolerance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
 #endif
 
 	mode_lib->ms.support.OutstandingRequestsSupport = true;
@@ -8131,7 +8131,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		dml2_printf("DML: Tvm: %fus - time to fetch vm\n", s->TimeForFetchingVM);
 		dml2_printf("DML: Tr0: %fus - time to fetch first row of data pagetables\n", s->TimeForFetchingRowInVBlank);
 		dml2_printf("DML: Tsw: %fus = time to fetch enough pixel data and cursor data to feed the scalers init position and detile\n", (double)s->LinesToRequestPrefetchPixelData * s->LineTime);
-		dml2_printf("DML: To: %fus - time for propogation from scaler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime);
+		dml2_printf("DML: To: %fus - time for propagation from scaler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime);
 		dml2_printf("DML: Tvstartup - TSetup - Tcalc - TWait - Tpre - To > 0\n");
 		dml2_printf("DML: Tslack(pre): %fus - time left over in schedule\n", p->VStartup * s->LineTime - s->TimeForFetchingVM - 2 * s->TimeForFetchingRowInVBlank - (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime - p->TWait - p->TCalc - *p->TSetup);
 		dml2_printf("DML: row_bytes = dpte_row_bytes (per_pipe) = PixelPTEBytesPerRow = : %u\n", p->PixelPTEBytesPerRow);
@@ -10959,7 +10959,7 @@ bool dml2_core_shared_mode_programming(struct dml2_core_calcs_mode_programming_e
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

