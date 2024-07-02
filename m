Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EDA923E35
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 14:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877BB10E03B;
	Tue,  2 Jul 2024 12:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q8XcPGIo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2363E10E03B;
 Tue,  2 Jul 2024 12:56:56 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-424ad991cbbso32172205e9.0; 
 Tue, 02 Jul 2024 05:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719925014; x=1720529814; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YoQ/61cpIlq23fw1rt3UkH/Z4+LvwLvWjVxNM41NCbU=;
 b=Q8XcPGIo3h9hXmAsB6MQRpJNxx4pozfPHOayqSALb6s3DV2Stxcx5dJz1AxkfcYi/X
 6yZEGYzHpZeQ3u/H6KdNpbsUzHZATHRrHdW9QYmwNrgZqpmqUyVeCFkxQ5UaHm/V0Tkp
 9QnsXU25ZTWol2AysHbNF5PblxQooTglYTPb4D63wcekNXi9rmszZ2kN5tqS3hpzF43D
 P+jJijdcq8fV6bj94+ib0x4hqcGAtOMjkU99EWObA6qGVt5y3/9pA8tgEWD8mPhcThut
 ABvQfyY44fkfl6wOJnwwZ8qgHxso2PBpc5vOXDzik2N87+RwP+aq0DevqiwDhK41pRpQ
 DbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719925014; x=1720529814;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YoQ/61cpIlq23fw1rt3UkH/Z4+LvwLvWjVxNM41NCbU=;
 b=SQRqgZSu3b4OYI8sisrpO0R+cqJdtbCzisuh/GwZ5uowfWuU3TZODCJ5vgf6Z8d9aH
 HZw7nsn5UdUIOIBOObU2k0+V+nQbenzogKp2D1eUb/x/IG4FruDCN4matFuxeXI4DA75
 gwsIADFnW1+MCRp7KRJD6JgH1QzHdDlDggUxLKiVc4w9bovyMiBdnQCRALYGwwlOp/Wi
 o3WmqG5Zimtgf7gdSnbhQE/gLb3SODcRFk8gwfAPec1Ghr4kDi3IJSUmXrBpiAhWK7Ly
 f+NfeoZ/hBwpjhCSR9M9OcQA+3UGyPEYHd8ueaniMQxglFKvbefoc0iS0ALDzgevR6la
 YAVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtwNSK5WBeaOF5g9nfk8AKsUUzuHrfOeC7aNRD85czf8zUX2L2YsV/pW1R+t08SyqvpkGgPj5e0YTHCibd6oy3tlzUsDjTX41bpTLinV/saNOivN+ouXGlVVhBwGTdyQ0j73msak4UZfFSQ7JhNSsX
X-Gm-Message-State: AOJu0Yxe+rYaySqXOQiarMBYy05kHzTE4zMxZ1c3sx1G3X9G617Iul8V
 D30c6iB+58a3yP2w+dqFQ78HqTl/9BrAB4W+TgOjIO5UV1dAqbqs0ldm4/+M
X-Google-Smtp-Source: AGHT+IEYqxcKoSUuV31HIzyw6179vvS9bQ6eQ9/DLU8+XoHgtUYwt2C5x81Kj//GgA+A4LvucwO9Fg==
X-Received: by 2002:a05:6000:178a:b0:367:4354:52c2 with SMTP id
 ffacd0b85a97d-3677c3b429cmr4438052f8f.22.1719925014091; 
 Tue, 02 Jul 2024 05:56:54 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fc429sm13145533f8f.68.2024.07.02.05.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 05:56:53 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 02 Jul 2024 13:56:30 +0100
Subject: [PATCH 1/3] drm/msm: Update a6xx register XML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240702-msm-tiling-config-v1-1-adaa6a6e4523@gmail.com>
References: <20240702-msm-tiling-config-v1-0-adaa6a6e4523@gmail.com>
In-Reply-To: <20240702-msm-tiling-config-v1-0-adaa6a6e4523@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719925012; l=103553;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=ZdMtMRO31X+V6beuvRso7CJsy/NAyt2fvdnd65aN32s=;
 b=ZidxvcppsEx8bvJ7/Ljr1UXzKw4AN+WfEyK/mfMpY3IgrlhNzUKS0+EP8vwSoV+udyeaDTtdj
 95BWY2z7CGtBRBlzqnlryXsPAXf1FiUzxD1P7pDtknnXK5hLFDcDmRB
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
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

Update to Mesa commit 81fd13913a97 ("freedreno: Fix RBBM_NC_MODE_CNTL
variants").

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 1617 ++++++++++++++++++++++++-
 1 file changed, 1603 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 2dfe6913ab4f..53a453228427 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -1198,6 +1198,1552 @@ to upconvert to 32b float internally?
 	<value value="0x3" name="TESS_CCW_TRIS"/>
 </enum>
 
+<enum name="a7xx_cp_perfcounter_select">
+	<value value="0" name="A7XX_PERF_CP_NEVER_COUNT"/>
+	<value value="1" name="A7XX_PERF_CP_ALWAYS_COUNT"/>
+	<value value="2" name="A7XX_PERF_CP_BUSY_GFX_CORE_IDLE"/>
+	<value value="3" name="A7XX_PERF_CP_BUSY_CYCLES"/>
+	<value value="4" name="A7XX_PERF_CP_NUM_PREEMPTIONS"/>
+	<value value="5" name="A7XX_PERF_CP_PREEMPTION_REACTION_DELAY"/>
+	<value value="6" name="A7XX_PERF_CP_PREEMPTION_SWITCH_OUT_TIME"/>
+	<value value="7" name="A7XX_PERF_CP_PREEMPTION_SWITCH_IN_TIME"/>
+	<value value="8" name="A7XX_PERF_CP_DEAD_DRAWS_IN_BIN_RENDER"/>
+	<value value="9" name="A7XX_PERF_CP_PREDICATED_DRAWS_KILLED"/>
+	<value value="10" name="A7XX_PERF_CP_MODE_SWITCH"/>
+	<value value="11" name="A7XX_PERF_CP_ZPASS_DONE"/>
+	<value value="12" name="A7XX_PERF_CP_CONTEXT_DONE"/>
+	<value value="13" name="A7XX_PERF_CP_CACHE_FLUSH"/>
+	<value value="14" name="A7XX_PERF_CP_LONG_PREEMPTIONS"/>
+	<value value="15" name="A7XX_PERF_CP_SQE_I_CACHE_STARVE"/>
+	<value value="16" name="A7XX_PERF_CP_SQE_IDLE"/>
+	<value value="17" name="A7XX_PERF_CP_SQE_PM4_STARVE_RB"/>
+	<value value="18" name="A7XX_PERF_CP_SQE_PM4_STARVE_IB1"/>
+	<value value="19" name="A7XX_PERF_CP_SQE_PM4_STARVE_IB2"/>
+	<value value="20" name="A7XX_PERF_CP_SQE_PM4_STARVE_IB3"/>
+	<value value="21" name="A7XX_PERF_CP_SQE_PM4_STARVE_FSDT"/>
+	<value value="22" name="A7XX_PERF_CP_SQE_PM4_STARVE_SDS"/>
+	<value value="23" name="A7XX_PERF_CP_SQE_MRB_STARVE"/>
+	<value value="24" name="A7XX_PERF_CP_SQE_RRB_STARVE"/>
+	<value value="25" name="A7XX_PERF_CP_SQE_VSD_STARVE"/>
+	<value value="26" name="A7XX_PERF_CP_VSD_DECODE_STARVE"/>
+	<value value="27" name="A7XX_PERF_CP_SQE_PIPE_OUT_STALL"/>
+	<value value="28" name="A7XX_PERF_CP_SQE_SYNC_STALL"/>
+	<value value="29" name="A7XX_PERF_CP_SQE_PM4_WFI_STALL"/>
+	<value value="30" name="A7XX_PERF_CP_SQE_SYS_WFI_STALL"/>
+	<value value="31" name="A7XX_PERF_CP_WAIT_ON_OTHER_PIPE"/>
+	<value value="32" name="A7XX_PERF_CP_OUTPUT_BLOCKED"/>
+	<value value="33" name="A7XX_PERF_CP_SQE_T4_EXEC"/>
+	<value value="34" name="A7XX_PERF_CP_SQE_LOAD_STATE_EXEC"/>
+	<value value="35" name="A7XX_PERF_CP_SQE_SAVE_SDS_STATE"/>
+	<value value="36" name="A7XX_PERF_CP_SQE_DRAW_EXEC"/>
+	<value value="37" name="A7XX_PERF_CP_SQE_CTXT_REG_BUNCH_EXEC"/>
+	<value value="38" name="A7XX_PERF_CP_SQE_EXEC_PROFILED"/>
+	<value value="39" name="A7XX_PERF_CP_MEMORY_POOL_EMPTY"/>
+	<value value="40" name="A7XX_PERF_CP_MEMORY_POOL_SYNC_STALL"/>
+	<value value="41" name="A7XX_PERF_CP_MEMORY_POOL_ABOVE_THRESH"/>
+	<value value="42" name="A7XX_PERF_CP_MEMORY_POOL_BELOW_THRESH"/>
+	<value value="43" name="A7XX_PERF_CP_AHB_WR_STALL_PRE_DRAWS"/>
+	<value value="44" name="A7XX_PERF_CP_AHB_STALL_SQE_GMU"/>
+	<value value="45" name="A7XX_PERF_CP_AHB_STALL_SQE_WR_OTHER"/>
+	<value value="46" name="A7XX_PERF_CP_AHB_STALL_SQE_RD_OTHER"/>
+	<value value="47" name="A7XX_PERF_CP_CLUSTER_FE_U_EMPTY"/>
+	<value value="48" name="A7XX_PERF_CP_CLUSTER_FE_S_EMPTY"/>
+	<value value="49" name="A7XX_PERF_CP_CLUSTER_SP_VS_EMPTY"/>
+	<value value="50" name="A7XX_PERF_CP_CLUSTER_VPC_US_EMPTY"/>
+	<value value="51" name="A7XX_PERF_CP_CLUSTER_VPC_VS_EMPTY"/>
+	<value value="52" name="A7XX_PERF_CP_CLUSTER_GRAS_EMPTY"/>
+	<value value="53" name="A7XX_PERF_CP_CLUSTER_SP_PS_EMPTY"/>
+	<value value="54" name="A7XX_PERF_CP_CLUSTER_VPC_PS_EMPTY"/>
+	<value value="55" name="A7XX_PERF_CP_CLUSTER_PS_EMPTY"/>
+	<value value="56" name="A7XX_PERF_CP_PM4_DATA"/>
+	<value value="57" name="A7XX_PERF_CP_PM4_HEADERS"/>
+	<value value="58" name="A7XX_PERF_CP_VBIF_READ_BEATS"/>
+	<value value="59" name="A7XX_PERF_CP_VBIF_WRITE_BEATS"/>
+	<value value="60" name="A7XX_PERF_CP_SQE_INSTR_COUNTER"/>
+	<value value="61" name="A7XX_PERF_CP_CLUSTER_FE_US_FULL"/>
+	<value value="62" name="A7XX_PERF_CP_CLUSTER_FE_S_FULL"/>
+	<value value="63" name="A7XX_PERF_CP_CLUSTER_SP_VS_FULL"/>
+	<value value="64" name="A7XX_PERF_CP_CLUSTER_VPC_US_FULL"/>
+	<value value="65" name="A7XX_PERF_CP_CLUSTER_VPC_VS_FULL"/>
+	<value value="66" name="A7XX_PERF_CP_CLUSTER_GRAS_FULL"/>
+	<value value="67" name="A7XX_PERF_CP_CLUSTER_SP_PS_FULL"/>
+	<value value="68" name="A7XX_PERF_CP_CLUSTER_VPC_PS_FULL"/>
+	<value value="69" name="A7XX_PERF_CP_CLUSTER_PS_FULL"/>
+	<value value="70" name="A7XX_PERF_CP_ICACHE_MISSES"/>
+	<value value="71" name="A7XX_PERF_CP_ICACHE_HITS"/>
+	<value value="72" name="A7XX_PERF_CP_ICACHE_STALL"/>
+	<value value="73" name="A7XX_PERF_CP_DCACHE_MISSES"/>
+	<value value="74" name="A7XX_PERF_CP_DCACHE_HITS"/>
+	<value value="75" name="A7XX_PERF_CP_DCACHE_STALLS"/>
+	<value value="76" name="A7XX_PERF_CP_AQE_SQE_STALL"/>
+	<value value="77" name="A7XX_PERF_CP_SQE_AQE_STARVE"/>
+	<value value="78" name="A7XX_PERF_CP_ISR_CYCLES"/>
+	<value value="79" name="A7XX_PERF_CP_SQE_MD8_STALL_CYCLES"/>
+	<value value="80" name="A7XX_PERF_CP_SQE_MESH_EXEC_CYCLES"/>
+	<value value="81" name="A7XX_PERF_CP_AQE_NUM_AS_CHUNKS"/>
+	<value value="82" name="A7XX_PERF_CP_AQE_NUM_MS_CHUNKS"/>
+	<value value="83" name="A7XX_PERF_CP_S_SKEW_BUFFER_FULL"/>
+	<value value="84" name="A7XX_PERF_CP_S_SKEW_BUFFER_ABOVE_THRESH"/>
+</enum>
+
+<enum name="a7xx_rbbm_perfcounter_select">
+	<value value="0" name="A7XX_PERF_RBBM_NEVER_COUNT"/>
+	<value value="1" name="A7XX_PERF_RBBM_US_ALWAYS_COUNT"/>
+	<value value="2" name="A7XX_PERF_RBBM_US_ALWAYS_ON"/>
+	<value value="3" name="A7XX_PERF_RBBM_US_STATUS_MASKED"/>
+	<value value="4" name="A7XX_PERF_RBBM_US_PC_BUSY"/>
+	<value value="5" name="A7XX_PERF_RBBM_US_COM_BUSY"/>
+	<value value="6" name="A7XX_PERF_RBBM_US_DCOM_BUSY"/>
+	<value value="7" name="A7XX_PERF_RBBM_US_VBIF_BUSY"/>
+	<value value="8" name="A7XX_PERF_RBBM_US_VSC_BUSY"/>
+	<value value="9" name="A7XX_PERF_RBBM_US_UCHE_BUSY"/>
+	<value value="10" name="A7XX_PERF_RBBM_US_HLSQ_BUSY"/>
+	<value value="11" name="A7XX_PERF_RBBM_S_HLSQ_BUSY"/>
+	<value value="12" name="A7XX_PERF_RBBM_S_PC_BUSY"/>
+	<value value="13" name="A7XX_PERF_RBBM_S_TESS_BUSY"/>
+	<value value="14" name="A7XX_PERF_RBBM_S_TSEFE_BUSY"/>
+	<value value="15" name="A7XX_PERF_RBBM_S_TSEBE_BUSY"/>
+	<value value="16" name="A7XX_PERF_RBBM_S_RAS_BUSY"/>
+</enum>
+
+<enum name="a7xx_pc_perfcounter_select">
+	<value value="0" name="A7XX_PERF_PC_NEVER_COUNT"/>
+	<value value="1" name="A7XX_PERF_PC_US_BUSY_CYCLES"/>
+	<value value="2" name="A7XX_PERF_PC_US_WORKING_CYCLES"/>
+	<value value="3" name="A7XX_PERF_PC_US_UCHE_OUTSTANDING_TRANS"/>
+	<value value="4" name="A7XX_PERF_PC_US_PASS1_TF_STALL_CYCLES"/>
+	<value value="5" name="A7XX_PERF_PC_US_STARVE_CYCLES_FOR_INDEX"/>
+	<value value="6" name="A7XX_PERF_PC_US_STARVE_CYCLES_FOR_TF"/>
+	<value value="7" name="A7XX_PERF_PC_US_STARVE_CYCLES_FOR_VIZ_STREAM"/>
+	<value value="8" name="A7XX_PERF_PC_US_STARVE_CYCLES_DI"/>
+	<value value="9" name="A7XX_PERF_PC_US_VIS_STREAMS_LOADED"/>
+	<value value="10" name="A7XX_PERF_PC_US_INSTANCES"/>
+	<value value="11" name="A7XX_PERF_PC_US_DEAD_PRIM"/>
+	<value value="12" name="A7XX_PERF_PC_US_SLICE_LIVE_PRIM"/>
+	<value value="13" name="A7XX_PERF_PC_US_3D_DRAWCALLS"/>
+	<value value="14" name="A7XX_PERF_PC_US_2D_DRAWCALLS"/>
+	<value value="15" name="A7XX_PERF_PC_US_NON_DRAWCALL_GLOBAL_EVENTS"/>
+	<value value="16" name="A7XX_PERF_PC_US_MESH_DRAWS"/>
+	<value value="17" name="A7XX_PERF_PC_US_MESH_DEAD_DRAWS"/>
+	<value value="18" name="A7XX_PERF_PC_US_MESH_MVIS_EN_DRAWS"/>
+	<value value="19" name="A7XX_PERF_PC_US_MESH_DEAD_PRIM"/>
+	<value value="20" name="A7XX_PERF_PC_US_MESH_LIVE_PRIM"/>
+	<value value="21" name="A7XX_PERF_PC_US_MESH_PA_EN_PRIM"/>
+	<value value="22" name="A7XX_PERF_PC_US_STARVE_CYCLES_FOR_MVIS_STREAM"/>
+	<value value="23" name="A7XX_PERF_PC_US_STARVE_CYCLES_PREDRAW"/>
+	<value value="24" name="A7XX_PERF_PC_US_STALL_CYCLES_COMPUTE_GFX"/>
+	<value value="25" name="A7XX_PERF_PC_US_STALL_CYCLES_GFX_COMPUTE"/>
+	<value value="26" name="A7XX_PERF_PC_US_PREDRAW_STALLS"/>
+	<value value="27" name="A7XX_PERF_PC_US_DP0_INPUT_STALLS"/>
+	<value value="28" name="A7XX_PERF_PC_US_DP1_INPUT_STALLS"/>
+	<value value="29" name="A7XX_PERF_PC_US_BR_STALLS_BV_WORKLOAD"/>
+	<value value="30" name="A7XX_PERF_PC_US_BV_STALLS_BR_WORKLOAD"/>
+	<value value="31" name="A7XX_PERF_PC_US_PASSPAIR_STALL"/>
+	<value value="32" name="A7XX_PERF_PC_US_STALL_CYCLES_UCHE0"/>
+	<value value="33" name="A7XX_PERF_PC_US_STALL_CYCLES_UCHE1"/>
+	<value value="34" name="A7XX_PERF_PC_US_UCHE_0_TRANS"/>
+	<value value="35" name="A7XX_PERF_PC_US_UCHE_1_TRANS"/>
+	<value value="36" name="A7XX_PERF_PC_US_BV_STALLED_BY_ATTR"/>
+	<value value="37" name="A7XX_PERF_PC_US_BV_STARVED_BY_RARB"/>
+	<value value="38" name="A7XX_PERF_PC_US_VPC_PRIM_COUNT_STALLS_BR"/>
+	<value value="39" name="A7XX_PERF_PC_US_VPC_PRIM_COUNT_STALLS_BV"/>
+	<value value="40" name="A7XX_PERF_PC_US_BV_STALLED_BY_UCHE_FEEDBACK"/>
+	<value value="41" name="A7XX_PERF_PC_US_VSD_RARB_DVIZ_FULL"/>
+	<value value="42" name="A7XX_PERF_PC_US_VSD_RARB_PVIZ_FULL"/>
+	<value value="43" name="A7XX_PERF_PC_US_VSD_RARB_TVIZ_FULL"/>
+	<value value="44" name="A7XX_PERF_PC_US_DP0_RARB_FULL"/>
+	<value value="45" name="A7XX_PERF_PC_US_DP1_RARB_FULL"/>
+	<value value="46" name="A7XX_PERF_PC_US_DP0_LIVE_PRIM"/>
+	<value value="47" name="A7XX_PERF_PC_US_DP1_LIVE_PRIM"/>
+	<value value="48" name="A7XX_PERF_PC_US_BV2BR_SWITCH"/>
+	<value value="49" name="A7XX_PERF_PC_US_BR2BV_SWITCH"/>
+	<value value="50" name="A7XX_PERF_PC_US_STALL_CYCLES_PC_S"/>
+	<value value="51" name="A7XX_PERF_PC_RESERVED_51"/>
+	<value value="52" name="A7XX_PERF_PC_RESERVED_52"/>
+	<value value="53" name="A7XX_PERF_PC_RESERVED_53"/>
+	<value value="54" name="A7XX_PERF_PC_RESERVED_54"/>
+	<value value="55" name="A7XX_PERF_PC_RESERVED_55"/>
+	<value value="56" name="A7XX_PERF_PC_RESERVED_56"/>
+	<value value="57" name="A7XX_PERF_PC_RESERVED_57"/>
+	<value value="58" name="A7XX_PERF_PC_RESERVED_58"/>
+	<value value="59" name="A7XX_PERF_PC_RESERVED_59"/>
+	<value value="60" name="A7XX_PERF_PC_S_BUSY_CYCLES"/>
+	<value value="61" name="A7XX_PERF_PC_S_WORKING_CYCLES"/>
+	<value value="62" name="A7XX_PERF_PC_S_STALL_CYCLES_VFD"/>
+	<value value="63" name="A7XX_PERF_PC_S_STALL_CYCLES_VPC_FE"/>
+	<value value="64" name="A7XX_PERF_PC_S_STALL_CYCLES_TESS"/>
+	<value value="65" name="A7XX_PERF_PC_S_STALL_CYCLES_VFD_ONLY"/>
+	<value value="66" name="A7XX_PERF_PC_S_STALL_CYCLES_VPC_ONLY"/>
+	<value value="67" name="A7XX_PERF_PC_S_VPC_PRIMITIVES"/>
+	<value value="68" name="A7XX_PERF_PC_S_VERTEX_HITS"/>
+	<value value="69" name="A7XX_PERF_PC_S_IA_VERTICES"/>
+	<value value="70" name="A7XX_PERF_PC_S_IA_PRIMITIVES"/>
+	<value value="71" name="A7XX_PERF_PC_S_HS_INVOCATIONS"/>
+	<value value="72" name="A7XX_PERF_PC_S_DS_INVOCATIONS"/>
+	<value value="73" name="A7XX_PERF_PC_S_VS_INVOCATIONS"/>
+	<value value="74" name="A7XX_PERF_PC_S_GS_INVOCATIONS"/>
+	<value value="75" name="A7XX_PERF_PC_S_DS_PRIMITIVES"/>
+	<value value="76" name="A7XX_PERF_PC_S_TESS_BUSY_CYCLES"/>
+	<value value="77" name="A7XX_PERF_PC_S_TESS_WORKING_CYCLES"/>
+	<value value="78" name="A7XX_PERF_PC_S_TESS_STALL_CYCLES_PC"/>
+	<value value="79" name="A7XX_PERF_PC_S_TESS_STARVE_CYCLES_PC"/>
+	<value value="80" name="A7XX_PERF_PC_S_TESS_SETUP_ACTIVE"/>
+	<value value="81" name="A7XX_PERF_PC_S_TESS_PID_ACTIVE"/>
+	<value value="82" name="A7XX_PERF_PC_S_TESS_PRIM_GEN_ACTIVE"/>
+	<value value="83" name="A7XX_PERF_PC_S_TESS_FACTOR_TRANS"/>
+	<value value="84" name="A7XX_PERF_PC_S_TESS_PC_UV_TRANS"/>
+	<value value="85" name="A7XX_PERF_PC_S_TESS_PC_UV_PATCHES"/>
+	<value value="86" name="A7XX_PERF_PC_S_MESH_VS_WAVES"/>
+</enum>
+
+<enum name="a7xx_vfd_perfcounter_select">
+	<value value="0" name="A7XX_PERF_VFD_NEVER_COUNT"/>
+	<value value="1" name="A7XX_PERF_VFD_BUSY_CYCLES"/>
+	<value value="2" name="A7XX_PERF_VFD_STALL_CYCLES_UCHE"/>
+	<value value="3" name="A7XX_PERF_VFD_STALL_CYCLES_VPC_ALLOC"/>
+	<value value="4" name="A7XX_PERF_VFD_STALL_CYCLES_SP_INFO"/>
+	<value value="5" name="A7XX_PERF_VFD_STALL_CYCLES_SP_ATTR"/>
+	<value value="6" name="A7XX_PERF_VFD_STARVE_CYCLES_UCHE"/>
+	<value value="7" name="A7XX_PERF_VFD_RBUFFER_FULL"/>
+	<value value="8" name="A7XX_PERF_VFD_ATTR_INFO_FIFO_FULL"/>
+	<value value="9" name="A7XX_PERF_VFD_DECODED_ATTRIBUTE_BYTES"/>
+	<value value="10" name="A7XX_PERF_VFD_NUM_ATTRIBUTES"/>
+	<value value="11" name="A7XX_PERF_VFD_UPPER_SHADER_FIBERS"/>
+	<value value="12" name="A7XX_PERF_VFD_LOWER_SHADER_FIBERS"/>
+	<value value="13" name="A7XX_PERF_VFD_MODE_0_FIBERS"/>
+	<value value="14" name="A7XX_PERF_VFD_MODE_1_FIBERS"/>
+	<value value="15" name="A7XX_PERF_VFD_MODE_2_FIBERS"/>
+	<value value="16" name="A7XX_PERF_VFD_MODE_3_FIBERS"/>
+	<value value="17" name="A7XX_PERF_VFD_MODE_4_FIBERS"/>
+	<value value="18" name="A7XX_PERF_VFD_TOTAL_VERTICES"/>
+	<value value="19" name="A7XX_PERF_VFDP_STALL_CYCLES_VFD"/>
+	<value value="20" name="A7XX_PERF_VFDP_STALL_CYCLES_VFD_INDEX"/>
+	<value value="21" name="A7XX_PERF_VFDP_STALL_CYCLES_VFD_PROG"/>
+	<value value="22" name="A7XX_PERF_VFDP_STARVE_CYCLES_PC"/>
+	<value value="23" name="A7XX_PERF_VFDP_VS_STAGE_WAVES"/>
+	<value value="24" name="A7XX_PERF_VFD_STALL_CYCLES_PRG_END_FE"/>
+	<value value="25" name="A7XX_PERF_VFD_STALL_CYCLES_CBSYNC"/>
+</enum>
+
+<enum name="a7xx_hlsq_perfcounter_select">
+	<value value="0" name="A7XX_PERF_HLSQ_NEVER_COUNT"/>
+	<value value="1" name="A7XX_PERF_HLSQ_BUSY_CYCLES"/>
+	<value value="2" name="A7XX_PERF_HLSQ_STALL_CYCLES_SP_STATE"/>
+	<value value="3" name="A7XX_PERF_HLSQ_STALL_CYCLES_SP_FS_STAGE"/>
+	<value value="4" name="A7XX_PERF_HLSQ_UCHE_LATENCY_CYCLES"/>
+	<value value="5" name="A7XX_PERF_HLSQ_UCHE_LATENCY_COUNT"/>
+	<value value="6" name="A7XX_PERF_HLSQ_STALL_CYCLES_UCHE"/>
+	<value value="7" name="A7XX_PERF_HLSQ_RESERVED_7"/>
+	<value value="8" name="A7XX_PERF_HLSQ_RESERVED_8"/>
+	<value value="9" name="A7XX_PERF_HLSQ_RESERVED_9"/>
+	<value value="10" name="A7XX_PERF_HLSQ_COMPUTE_DRAWCALLS"/>
+	<value value="11" name="A7XX_PERF_HLSQ_FS_DATA_WAIT_PROGRAMMING"/>
+	<value value="12" name="A7XX_PERF_HLSQ_DUAL_FS_PROG_ACTIVE"/>
+	<value value="13" name="A7XX_PERF_HLSQ_DUAL_VS_PROG_ACTIVE"/>
+	<value value="14" name="A7XX_PERF_HLSQ_FS_BATCH_COUNT_ZERO"/>
+	<value value="15" name="A7XX_PERF_HLSQ_VS_BATCH_COUNT_ZERO"/>
+	<value value="16" name="A7XX_PERF_HLSQ_WAVE_PENDING_NO_QUAD"/>
+	<value value="17" name="A7XX_PERF_HLSQ_WAVE_PENDING_NO_PRIM_BASE"/>
+	<value value="18" name="A7XX_PERF_HLSQ_STALL_CYCLES_VPC_BE"/>
+	<value value="19" name="A7XX_PERF_HLSQ_RESERVED_19"/>
+	<value value="20" name="A7XX_PERF_HLSQ_RESERVED_20"/>
+	<value value="21" name="A7XX_PERF_HLSQ_VSBR_STALL_CYCLES"/>
+	<value value="22" name="A7XX_PERF_HLSQ_FS_STALL_CYCLES"/>
+	<value value="23" name="A7XX_PERF_HLSQ_LPAC_STALL_CYCLES"/>
+	<value value="24" name="A7XX_PERF_HLSQ_BV_STALL_CYCLES"/>
+	<value value="25" name="A7XX_PERF_HLSQ_VSBR_DEREF_CYCLES"/>
+	<value value="26" name="A7XX_PERF_HLSQ_FS_DEREF_CYCLES"/>
+	<value value="27" name="A7XX_PERF_HLSQ_LPAC_DEREF_CYCLES"/>
+	<value value="28" name="A7XX_PERF_HLSQ_BV_DEREF_CYCLES"/>
+	<value value="29" name="A7XX_PERF_HLSQ_VSBR_S2W_CYCLES"/>
+	<value value="30" name="A7XX_PERF_HLSQ_FS_S2W_CYCLES"/>
+	<value value="31" name="A7XX_PERF_HLSQ_LPAC_S2W_CYCLES"/>
+	<value value="32" name="A7XX_PERF_HLSQ_BV_S2W_CYCLES"/>
+	<value value="33" name="A7XX_PERF_HLSQ_VSBR_WAIT_FS_S2W"/>
+	<value value="34" name="A7XX_PERF_HLSQ_FS_WAIT_VS_S2W"/>
+	<value value="35" name="A7XX_PERF_HLSQ_LPAC_WAIT_VS_S2W"/>
+	<value value="36" name="A7XX_PERF_HLSQ_BV_WAIT_FS_S2W"/>
+	<value value="37" name="A7XX_PERF_HLSQ_RESERVED_37"/>
+	<value value="38" name="A7XX_PERF_HLSQ_FS_WAIT_SAME_VS_S2W"/>
+	<value value="39" name="A7XX_PERF_HLSQ_FS_STARVING_SP"/>
+	<value value="40" name="A7XX_PERF_HLSQ_VS_DATA_WAIT_PROGRAMMING"/>
+	<value value="41" name="A7XX_PERF_HLSQ_BV_DATA_WAIT_PROGRAMMING"/>
+	<value value="42" name="A7XX_PERF_HLSQ_STPROC_WAVE_CONTEXTS_VS"/>
+	<value value="43" name="A7XX_PERF_HLSQ_STPROC_WAVE_CONTEXT_CYCLES_VS"/>
+	<value value="44" name="A7XX_PERF_HLSQ_STPROC_WAVE_CONTEXTS_FS"/>
+	<value value="45" name="A7XX_PERF_HLSQ_STPROC_WAVE_CONTEXT_CYCLES_FS"/>
+	<value value="46" name="A7XX_PERF_HLSQ_STPROC_WAVE_CONTEXTS_BV"/>
+	<value value="47" name="A7XX_PERF_HLSQ_STPROC_WAVE_CONTEXT_CYCLES_BV"/>
+	<value value="48" name="A7XX_PERF_HLSQ_STPROC_WAVE_CONTEXTS_LPAC"/>
+	<value value="49" name="A7XX_PERF_HLSQ_STPROC_WAVE_CONTEXT_CYCLES_LPAC"/>
+	<value value="50" name="A7XX_PERF_HLSQ_SPTROC_STCHE_WARMUP_INC_VS"/>
+	<value value="51" name="A7XX_PERF_HLSQ_SPTROC_STCHE_WARMUP_INC_FS"/>
+	<value value="52" name="A7XX_PERF_HLSQ_SPTROC_STCHE_WARMUP_INC_BV"/>
+	<value value="53" name="A7XX_PERF_HLSQ_SPTROC_STCHE_WARMUP_INC_LPAC"/>
+	<value value="54" name="A7XX_PERF_HLSQ_SPTROC_STCHE_MISS_INC_VS"/>
+	<value value="55" name="A7XX_PERF_HLSQ_SPTROC_STCHE_MISS_INC_FS"/>
+	<value value="56" name="A7XX_PERF_HLSQ_SPTROC_STCHE_MISS_INC_BV"/>
+	<value value="57" name="A7XX_PERF_HLSQ_SPTROC_STCHE_MISS_INC_LPAC"/>
+	<value value="58" name="A7XX_PERF_HLSQ_VSBR_S2W_CYCLES_SP"/>
+	<value value="59" name="A7XX_PERF_HLSQ_FS_S2W_CYCLES_SP"/>
+	<value value="60" name="A7XX_PERF_HLSQ_LPAC_S2W_CYCLES_SP"/>
+	<value value="61" name="A7XX_PERF_HLSQ_BV_S2W_CYCLES_SP"/>
+	<value value="62" name="A7XX_PERF_HLSQ_L2STC_REQ_HLSQ"/>
+	<value value="63" name="A7XX_PERF_HLSQ_L2STC_REQ_HLSQ_HIT"/>
+	<value value="64" name="A7XX_PERF_HLSQ_L2STC_REQ_SP"/>
+	<value value="65" name="A7XX_PERF_HLSQ_L2STC_REQ_SP_HIT"/>
+	<value value="66" name="A7XX_PERF_HLSQ_L2STC_REQ_INS_HLSQ"/>
+	<value value="67" name="A7XX_PERF_HLSQ_L2STC_REQ_INS_HLSQ_HIT"/>
+	<value value="68" name="A7XX_PERF_HLSQ_L2STC_REQ_INS_SP"/>
+	<value value="69" name="A7XX_PERF_HLSQ_L2STC_REQ_INS_SP_HIT"/>
+	<value value="70" name="A7XX_PERF_HLSQ_L2STC_REQ_UCHE"/>
+	<value value="71" name="A7XX_PERF_HLSQ_L2STC_LATENCY_CYCLES"/>
+	<value value="72" name="A7XX_PERF_HLSQ_L2STC_LATENCY_COUNT"/>
+	<value value="73" name="A7XX_PERF_HLSQ_L2STC_STALL_SP_MISS_REQ"/>
+	<value value="74" name="A7XX_PERF_HLSQ_L2STC_BANK0_REPLACEMENT"/>
+	<value value="75" name="A7XX_PERF_HLSQ_L2STC_BANK1_REPLACEMENT"/>
+	<value value="76" name="A7XX_PERF_HLSQ_L2STC_BANK2_REPLACEMENT"/>
+	<value value="77" name="A7XX_PERF_HLSQ_L2STC_BANK3_REPLACEMENT"/>
+	<value value="78" name="A7XX_PERF_HLSQ_S2W_STALL_BY_MISS_RETURN"/>
+	<value value="79" name="A7XX_PERF_HLSQ_MISS_RETURN_STALL_BY_S2W"/>
+	<value value="80" name="A7XX_PERF_HLSQ_STPROC_L0_STALL_INS_RD"/>
+	<value value="81" name="A7XX_PERF_HLSQ_STPROC_L0_INS_MISS"/>
+	<value value="82" name="A7XX_PERF_HLSQ_STPROC_L0_INS_HIT"/>
+	<value value="83" name="A7XX_PERF_HLSQ_STPROC_L0_INS_LATENCY_COUNT"/>
+	<value value="84" name="A7XX_PERF_HLSQ_STPROC_L0_INS_LATENCY_CYCLE"/>
+	<value value="85" name="A7XX_PERF_HLSQ_STPROC_DPS_RUN_COUNT"/>
+	<value value="86" name="A7XX_PERF_HLSQ_STPROC_DPS_RUN_CYCLE"/>
+	<value value="87" name="A7XX_PERF_HLSQ_VSDP_BR_QUERY_REQ"/>
+	<value value="88" name="A7XX_PERF_HLSQ_VSDP_BV_QUERY_REQ"/>
+	<value value="89" name="A7XX_PERF_HLSQ_VSDP_BR_QUERY_REQ_WHEN_BV_PENDING"/>
+	<value value="90" name="A7XX_PERF_HLSQ_VSDP_BR_QUERY_BUSY"/>
+	<value value="91" name="A7XX_PERF_HLSQ_VSDP_BV_QUERY_BUSY"/>
+	<value value="92" name="A7XX_PERF_HLSQ_VSDP_BR_QUERY_FAIL"/>
+	<value value="93" name="A7XX_PERF_HLSQ_VSDP_BV_QUERY_FAIL"/>
+	<value value="94" name="A7XX_PERF_HLSQ_VS_CTXT_BUF_FULL_BLOCK_CPI"/>
+	<value value="95" name="A7XX_PERF_HLSQ_FS_CTXT_BUF_FULL_BLOCK_CPI"/>
+	<value value="96" name="A7XX_PERF_HLSQ_BV_CTXT_BUF_FULL_BLOCK_CPI"/>
+	<value value="97" name="A7XX_PERF_HLSQ_VS_CONST_BUF_FULL_BLOCK_CPI"/>
+	<value value="98" name="A7XX_PERF_HLSQ_FS_CONST_BUF_FULL_BLOCK_CPI"/>
+	<value value="99" name="A7XX_PERF_HLSQ_BV_CONST_BUF_FULL_BLOCK_CPI"/>
+	<value value="100" name="A7XX_PERF_HLSQ_VS_INS_BUF_FULL_BLOCK_CPI"/>
+	<value value="101" name="A7XX_PERF_HLSQ_FS_INS_BUF_FULL_BLOCK_CPI"/>
+	<value value="102" name="A7XX_PERF_HLSQ_BV_INS_BUF_FULL_BLOCK_CPI"/>
+	<value value="103" name="A7XX_PERF_HLSQ_VS_DES_BUF_FULL_BLOCK_CPI"/>
+	<value value="104" name="A7XX_PERF_HLSQ_FS_DES_BUF_FULL_BLOCK_CPI"/>
+	<value value="105" name="A7XX_PERF_HLSQ_BV_DES_BUF_FULL_BLOCK_CPI"/>
+	<value value="106" name="A7XX_PERF_HLSQ_PRIMITIVE_COUNT"/>
+	<value value="107" name="A7XX_PERF_HLSQ_LPAC2BV_SWITCH_CNT"/>
+	<value value="108" name="A7XX_PERF_HLSQ_BV2LPAC_SWITCH_CNT"/>
+	<value value="109" name="A7XX_PERF_HLSQ_LPAC2BV_SWITCH_CYC"/>
+	<value value="110" name="A7XX_PERF_HLSQ_BV2LPAC_SWITCH_CYC"/>
+	<value value="111" name="A7XX_PERF_HLSQ_VSDP_BV2BR_SWITCH_CYC"/>
+</enum>
+
+<enum name="a7xx_vpc_perfcounter_select">
+	<value value="0" name="A7XX_PERF_VPC_NEVER_COUNT"/>
+	<value value="1" name="A7XX_PERF_VPC_FE_BUSY_CYCLES"/>
+	<value value="2" name="A7XX_PERF_VPC_FE_WORKING_CYCLES"/>
+	<value value="3" name="A7XX_PERF_VPC_FE_STALL_CYCLES_VFD_WACK"/>
+	<value value="4" name="A7XX_PERF_VPC_FE_STARVE_CYCLES_SP"/>
+	<value value="5" name="A7XX_PERF_VPC_FE_PC_PRIMITIVES"/>
+	<value value="6" name="A7XX_PERF_VPC_FE_SP_COMPONENTS"/>
+	<value value="7" name="A7XX_PERF_VPC_FE_STALL_CYCLES_VPCRAM_POS"/>
+	<value value="8" name="A7XX_PERF_VPC_FE_VS_BUSY_CYCLES"/>
+	<value value="9" name="A7XX_PERF_VPC_FE_VS_WORKING_CYCLES"/>
+	<value value="10" name="A7XX_PERF_VPC_FE_NUM_VPCRAM_READ_POS"/>
+	<value value="11" name="A7XX_PERF_VPC_FE_WIT_FULL_CYCLES"/>
+	<value value="12" name="A7XX_PERF_VPC_FE_VPCRAM_FULL_CYCLES"/>
+	<value value="13" name="A7XX_PERF_VPC_FE_NUM_VPCRAM_WRITE"/>
+	<value value="14" name="A7XX_PERF_VPC_FE_STALL_CYCLES_TSE_FE"/>
+	<value value="15" name="A7XX_PERF_VPC_FE_STALL_CYCLES_VPC_US"/>
+	<value value="16" name="A7XX_PERF_VPC_FE_TSE_FE_PRIMITIVES"/>
+	<value value="17" name="A7XX_PERF_VPC_FE_GS_PRIMITIVES"/>
+	<value value="18" name="A7XX_PERF_VPC_FE_TSE_FE_TRANSACTIONS"/>
+	<value value="19" name="A7XX_PERF_VPC_FE_STALL_CYCLES_CCU"/>
+	<value value="20" name="A7XX_PERF_VPC_FE_NUM_WM_HIT"/>
+	<value value="21" name="A7XX_PERF_VPC_FE_STALL_DQ_WACK"/>
+	<value value="22" name="A7XX_PERF_VPC_FE_STALL_CYCLES_PRG_END_FE"/>
+	<value value="23" name="A7XX_PERF_VPC_FE_STALL_CYCLES_PRG_END_VPCVS"/>
+	<value value="24" name="A7XX_PERF_VPC_FE_POSRAM_FULL_CYCLES"/>
+	<value value="25" name="A7XX_PERF_VPC_FE_GMEM_NOP_FULL_CYCLES"/>
+	<value value="26" name="A7XX_PERF_VPC_FE_GMEM_POS_FULL_CYCLES"/>
+	<value value="27" name="A7XX_PERF_VPC_FE_BOTTLENECK"/>
+	<value value="28" name="A7XX_PERF_VPC_US_BUSY_CYCLES"/>
+	<value value="29" name="A7XX_PERF_VPC_US_WORKING_CYCLES"/>
+	<value value="30" name="A7XX_PERF_VPC_US_STARVE_CYCLES_TSE_FE"/>
+	<value value="31" name="A7XX_PERF_VPC_US_PTUS_FULL"/>
+	<value value="32" name="A7XX_PERF_VPC_US_COMP_INVIS_PRIM_COUNT"/>
+	<value value="33" name="A7XX_PERF_VPC_US_STALL_CYCLES_VSC"/>
+	<value value="34" name="A7XX_PERF_VPC_US_STALL_CYCLES_VPC_BE"/>
+	<value value="35" name="A7XX_PERF_VPC_US_STALL_CYCLES_UCHE"/>
+	<value value="36" name="A7XX_PERF_VPC_US_STREAMOUT_TRANSACTION"/>
+	<value value="37" name="A7XX_PERF_VPC_US_NUM_GMEM_READ_SO"/>
+	<value value="38" name="A7XX_PERF_VPC_US_STARVE_CYCLES_UCHE_RD"/>
+	<value value="39" name="A7XX_PERF_VPC_US_STALL_CYCLES_PRG_END_VPCUS"/>
+	<value value="40" name="A7XX_PERF_VPC_US_STARVE_CYCLES_REORDER"/>
+	<value value="41" name="A7XX_PERF_VPC_US_BOTTLENECK"/>
+	<value value="42" name="A7XX_PERF_VPC_RESERVED_42"/>
+	<value value="43" name="A7XX_PERF_VPC_RESERVED_43"/>
+	<value value="44" name="A7XX_PERF_VPC_RESERVED_44"/>
+	<value value="45" name="A7XX_PERF_VPC_BE_BUSY_CYCLES"/>
+	<value value="46" name="A7XX_PERF_VPC_BE_WORKING_CYCLES"/>
+	<value value="47" name="A7XX_PERF_VPC_BE_STALL_CYCLES_TSE_BE"/>
+	<value value="48" name="A7XX_PERF_VPC_BE_TSE_BE_PRIMITIVES"/>
+	<value value="49" name="A7XX_PERF_VPC_BE_TSE_BE_TRANSACTIONS"/>
+	<value value="50" name="A7XX_PERF_VPC_BE_STARVE_CYCLES_LRZ"/>
+	<value value="51" name="A7XX_PERF_VPC_BE_LRZ_ASSIGN_PRIMITIVES"/>
+	<value value="52" name="A7XX_PERF_VPC_BE_RB_VISIBLE_PRIMITIVES"/>
+	<value value="53" name="A7XX_PERF_VPC_BE_STARVE_CYCLES_RB"/>
+	<value value="54" name="A7XX_PERF_VPC_BE_STALL_CYCLES_HLSQ_PRIM_ALLOC"/>
+	<value value="55" name="A7XX_PERF_VPC_BE_STALL_CYCLES_SP_LM"/>
+	<value value="56" name="A7XX_PERF_VPC_BE_NUM_PA_REQ"/>
+	<value value="57" name="A7XX_PERF_VPC_BE_NUM_LM_REQ_HIT"/>
+	<value value="58" name="A7XX_PERF_VPC_BE_NUM_ATTR_REQ_LM"/>
+	<value value="59" name="A7XX_PERF_VPC_BE_LM_TRANSACTION"/>
+	<value value="60" name="A7XX_PERF_VPC_BE_PS_BUSY_CYCLES"/>
+	<value value="61" name="A7XX_PERF_VPC_BE_PS_WORKING_CYCLES"/>
+	<value value="62" name="A7XX_PERF_VPC_BE_STALL_CYCLES_CCHE"/>
+	<value value="63" name="A7XX_PERF_VPC_BE_STARVE_CYCLES_CCHE"/>
+	<value value="64" name="A7XX_PERF_VPC_BE_LM_FULL_WAIT_FOR_INTP_END"/>
+	<value value="65" name="A7XX_PERF_VPC_BE_CCHE_REQBUF_FULL"/>
+	<value value="66" name="A7XX_PERF_VPC_BE_CCHE_NUM_POS_REQ"/>
+	<value value="67" name="A7XX_PERF_VPC_BE_STALL_CYCLES_LM_ACK"/>
+	<value value="68" name="A7XX_PERF_VPC_BE_STALL_CYCLES_PRG_END_VPCPS"/>
+	<value value="69" name="A7XX_PERF_VPC_BE_POS_OVERFETCH_ATTR"/>
+	<value value="70" name="A7XX_PERF_VPC_BE_BOTTLENECK"/>
+</enum>
+
+<enum name="a7xx_tse_perfcounter_select">
+	<value value="0" name="A7XX_PERF_TSE_NEVER_COUNT"/>
+	<value value="1" name="A7XX_PERF_TSE_BE_BUSY_CYCLES"/>
+	<value value="2" name="A7XX_PERF_TSE_BE_CLIPPING_CYCLES"/>
+	<value value="3" name="A7XX_PERF_TSE_BE_STALL_CYCLES_RAS"/>
+	<value value="4" name="A7XX_PERF_TSE_BE_STALL_CYCLES_LRZ_BARYPLANE"/>
+	<value value="5" name="A7XX_PERF_TSE_BE_STALL_CYCLES_LRZ_ZPLANE"/>
+	<value value="6" name="A7XX_PERF_TSE_BE_STARVE_CYCLES_PC"/>
+	<value value="7" name="A7XX_PERF_TSE_BE_INPUT_PRIM"/>
+	<value value="8" name="A7XX_PERF_TSE_BE_INPUT_NULL_PRIM"/>
+	<value value="9" name="A7XX_PERF_TSE_BE_TRIVAL_REJ_PRIM"/>
+	<value value="10" name="A7XX_PERF_TSE_BE_CLIPPED_PRIM"/>
+	<value value="11" name="A7XX_PERF_TSE_BE_ZERO_AREA_PRIM"/>
+	<value value="12" name="A7XX_PERF_TSE_BE_FACENESS_CULLED_PRIM"/>
+	<value value="13" name="A7XX_PERF_TSE_BE_ZERO_PIXEL_PRIM"/>
+	<value value="14" name="A7XX_PERF_TSE_BE_OUTPUT_NULL_PRIM"/>
+	<value value="15" name="A7XX_PERF_TSE_BE_OUTPUT_VISIBLE_PRIM"/>
+	<value value="16" name="A7XX_PERF_TSE_BE_CINVOCATION"/>
+	<value value="17" name="A7XX_PERF_TSE_BE_CPRIMITIVES"/>
+	<value value="18" name="A7XX_PERF_TSE_BE_2D_INPUT_PRIM"/>
+	<value value="19" name="A7XX_PERF_TSE_BE_2D_ALIVE_CYCLES"/>
+	<value value="20" name="A7XX_PERF_TSE_BE_CLIP_PLANES"/>
+	<value value="21" name="A7XX_PERF_TSE_BE_EMPTY_BBOX_KILLED_PRIM"/>
+	<value value="22" name="A7XX_PERF_TSE_BE_ST1_VP_PARAMS_CACHE_MISS"/>
+	<value value="23" name="A7XX_PERF_TSE_BE_ST2_VPORT_VP_PARAMS_CACHE_MISS"/>
+	<value value="24" name="A7XX_PERF_TSE_BE_ST2_SCISSOR_VP_PARAMS_CACHE_MISS"/>
+	<value value="25" name="A7XX_PERF_TSE_BE_ILLEGAL_BOUNDING_BOX_PRIM"/>
+	<value value="26" name="A7XX_PERF_TSE_BE_VP_OUT_IS_NAN"/>
+	<value value="27" name="A7XX_PERF_TSE_BE_EXCLUDED_PRIM"/>
+	<value value="28" name="A7XX_PERF_TSE_BE_EARLY_CULL_CLIPPED_PRIM"/>
+	<value value="29" name="A7XX_PERF_TSE_BE_BR_STALLS_DUETO_BV_CLIP"/>
+	<value value="30" name="A7XX_PERF_TSE_BE_BR_STALLS_DUETO_BV_POLY"/>
+	<value value="31" name="A7XX_PERF_TSE_BE_BV_STALLS_DUETO_BR_CLIP"/>
+	<value value="32" name="A7XX_PERF_TSE_BE_BV_STALLS_DUETO_BR_POLY"/>
+	<value value="33" name="A7XX_PERF_TSE_BE_BV_STALLS_DUETO_BR"/>
+	<value value="34" name="A7XX_PERF_TSE_FE_BUSY_CYCLES"/>
+	<value value="35" name="A7XX_PERF_TSE_FE_STALL_CYCLES_VPC_US"/>
+	<value value="36" name="A7XX_PERF_TSE_FE_STARVE_CYCLES_PC"/>
+	<value value="37" name="A7XX_PERF_TSE_FE_INPUT_PRIM"/>
+	<value value="38" name="A7XX_PERF_TSE_FE_INPUT_NULL_PRIM"/>
+	<value value="39" name="A7XX_PERF_TSE_FE_TRIVAL_REJ_PRIM"/>
+	<value value="40" name="A7XX_PERF_TSE_FE_ZERO_AREA_PRIM"/>
+	<value value="41" name="A7XX_PERF_TSE_FE_FACENESS_CULLED_PRIM"/>
+	<value value="42" name="A7XX_PERF_TSE_FE_ZERO_PIXEL_PRIM"/>
+	<value value="43" name="A7XX_PERF_TSE_FE_OUTPUT_NULL_PRIM"/>
+	<value value="44" name="A7XX_PERF_TSE_FE_OUTPUT_VISIBLE_PRIM"/>
+	<value value="45" name="A7XX_PERF_TSE_FE_CINVOCATION"/>
+	<value value="46" name="A7XX_PERF_TSE_FE_CPRIMITIVES"/>
+	<value value="47" name="A7XX_PERF_TSE_FE_CLIP_PLANES"/>
+	<value value="48" name="A7XX_PERF_TSE_FE_EMPTY_BBOX_KILLED_PRIM"/>
+	<value value="49" name="A7XX_PERF_TSE_FE_ST1_VP_PARAMS_CACHE_MISS"/>
+	<value value="50" name="A7XX_PERF_TSE_FE_ST2_VPORT_VP_PARAMS_CACHE_MISS"/>
+	<value value="51" name="A7XX_PERF_TSE_FE_ST2_SCISSOR_VP_PARAMS_CACHE_MISS"/>
+	<value value="52" name="A7XX_PERF_TSE_FE_ILLEGAL_BOUNDING_BOX_PRIM"/>
+	<value value="53" name="A7XX_PERF_TSE_FE_VP_OUT_IS_NAN"/>
+	<value value="54" name="A7XX_PERF_TSE_FE_EXCLUDED_PRIM"/>
+	<value value="55" name="A7XX_PERF_TSE_FE_EARLY_CULL_CLIPPED_PRIM"/>
+	<value value="56" name="A7XX_PERF_TSE_FE_BR_STALLS_DUETO_BV_CLIP"/>
+	<value value="57" name="A7XX_PERF_TSE_FE_BR_STALLS_DUETO_BV_POLY"/>
+	<value value="58" name="A7XX_PERF_TSE_FE_BV_STALLS_DUETO_BR_CLIP"/>
+	<value value="59" name="A7XX_PERF_TSE_FE_BV_STALLS_DUETO_BR_POLY"/>
+	<value value="60" name="A7XX_PERF_TSE_FE_BV_STALLS_DUETO_BR"/>
+	<value value="61" name="A7XX_PERF_TSE_BE_STALL_CYCLES_LRZ_PRIM"/>
+</enum>
+
+<enum name="a7xx_ras_perfcounter_select">
+	<value value="0" name="A7XX_PERF_RAS_NEVER_COUNT"/>
+	<value value="1" name="A7XX_PERF_RAS_BUSY_CYCLES"/>
+	<value value="2" name="A7XX_PERF_RAS_SUPERTILE_ACTIVE_CYCLES"/>
+	<value value="3" name="A7XX_PERF_RAS_STALL_CYCLES_LRZ"/>
+	<value value="4" name="A7XX_PERF_RAS_STARVE_CYCLES_TSE"/>
+	<value value="5" name="A7XX_PERF_RAS_SUPER_TILES"/>
+	<value value="6" name="A7XX_PERF_RAS_8X4_TILES"/>
+	<value value="7" name="A7XX_PERF_RAS_MASKGEN_ACTIVE"/>
+	<value value="8" name="A7XX_PERF_RAS_FULLY_COVERED_SUPER_TILES"/>
+	<value value="9" name="A7XX_PERF_RAS_FULLY_COVERED_8X4_TILES"/>
+	<value value="10" name="A7XX_PERF_RAS_PRIM_KILLED_INVISILBE"/>
+	<value value="11" name="A7XX_PERF_RAS_SUPERTILE_GEN_ACTIVE_CYCLES"/>
+	<value value="12" name="A7XX_PERF_RAS_LRZ_INTF_WORKING_CYCLES"/>
+	<value value="13" name="A7XX_PERF_RAS_BLOCKS"/>
+	<value value="14" name="A7XX_PERF_RAS_FALSE_PARTIAL_STILE"/>
+	<value value="15" name="A7XX_PERF_RAS_SLICE_BLOCK_NONEMTPY"/>
+	<value value="16" name="A7XX_PERF_RAS_SLICE_BLOCK_EMPTY"/>
+	<value value="17" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_0_WORKING_CC_L2"/>
+	<value value="18" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_1_WORKING_CC_L2"/>
+	<value value="19" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_2_WORKING_CC_L2"/>
+	<value value="20" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_3_WORKING_CC_L2"/>
+	<value value="21" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_4_WORKING_CC_L2"/>
+	<value value="22" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_5_WORKING_CC_L2"/>
+	<value value="23" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_6_WORKING_CC_L2"/>
+	<value value="24" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_7_WORKING_CC_L2"/>
+	<value value="25" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_8_WORKING_CC_L2"/>
+	<value value="26" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_9_WORKING_CC_L2"/>
+	<value value="27" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_10_WORKING_CC_L2"/>
+	<value value="28" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_11_WORKING_CC_L2"/>
+	<value value="29" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_12_WORKING_CC_L2"/>
+	<value value="30" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_13_WORKING_CC_L2"/>
+	<value value="31" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_14_WORKING_CC_L2"/>
+	<value value="32" name="A7XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_15_WORKING_CC_L2"/>
+</enum>
+
+<enum name="a7xx_uche_perfcounter_select">
+	<value value="0" name="A7XX_PERF_UCHE_NEVER_COUNT"/>
+	<value value="1" name="A7XX_PERF_UCHE_BUSY_CYCLES"/>
+	<value value="2" name="A7XX_PERF_UCHE_STALL_CYCLES_ARBITER"/>
+	<value value="3" name="A7XX_PERF_UCHE_VBIF_STALL_WRITE_DATA"/>
+	<value value="4" name="A7XX_PERF_UCHE_STARVED_CYCLES_VBIF_DECMP"/>
+	<value value="5" name="A7XX_PERF_UCHE_STALL_CYCLES_DECMP"/>
+	<value value="6" name="A7XX_PERF_UCHE_ARBITER_STALL_CYCLES_VBIF"/>
+	<value value="7" name="A7XX_PERF_UCHE_VBIF_LATENCY_CYCLES"/>
+	<value value="8" name="A7XX_PERF_UCHE_VBIF_LATENCY_SAMPLES"/>
+	<value value="9" name="A7XX_PERF_UCHE_DCMP_LATENCY_SAMPLES"/>
+	<value value="10" name="A7XX_PERF_UCHE_DCMP_LATENCY_CYCLES"/>
+	<value value="11" name="A7XX_PERF_UCHE_READ_REQUESTS_SP"/>
+	<value value="12" name="A7XX_PERF_UCHE_READ_REQUESTS_TP"/>
+	<value value="13" name="A7XX_PERF_UCHE_READ_REQUESTS_TP_UBWC"/>
+	<value value="14" name="A7XX_PERF_UCHE_READ_REQUESTS_TP_GBIF"/>
+	<value value="15" name="A7XX_PERF_UCHE_READ_REQUESTS_TP_GMEM"/>
+	<value value="16" name="A7XX_PERF_UCHE_READ_REQUESTS_VFD"/>
+	<value value="17" name="A7XX_PERF_UCHE_READ_REQUESTS_VPC"/>
+	<value value="18" name="A7XX_PERF_UCHE_READ_REQUESTS_HLSQ"/>
+	<value value="19" name="A7XX_PERF_UCHE_READ_REQUESTS_LRZ"/>
+	<value value="20" name="A7XX_PERF_UCHE_READ_REQUESTS_PC"/>
+	<value value="21" name="A7XX_PERF_UCHE_WRITE_REQUESTS_SP"/>
+	<value value="22" name="A7XX_PERF_UCHE_WRITE_REQUESTS_LRZ"/>
+	<value value="23" name="A7XX_PERF_UCHE_WRITE_REQUESTS_VPC"/>
+	<value value="24" name="A7XX_PERF_UCHE_WRITE_REQUESTS_VSC"/>
+	<value value="25" name="A7XX_PERF_UCHE_VBIF_READ_BEATS_SP"/>
+	<value value="26" name="A7XX_PERF_UCHE_VBIF_READ_BEATS_TP"/>
+	<value value="27" name="A7XX_PERF_UCHE_VBIF_READ_BEATS_VFD"/>
+	<value value="28" name="A7XX_PERF_UCHE_VBIF_READ_BEATS_VPC"/>
+	<value value="29" name="A7XX_PERF_UCHE_VBIF_READ_BEATS_HLSQ"/>
+	<value value="30" name="A7XX_PERF_UCHE_VBIF_READ_BEATS_LRZ"/>
+	<value value="31" name="A7XX_PERF_UCHE_VBIF_READ_BEATS_PC"/>
+	<value value="32" name="A7XX_PERF_UCHE_VBIF_READ_BEATS_CH0"/>
+	<value value="33" name="A7XX_PERF_UCHE_VBIF_READ_BEATS_CH1"/>
+	<value value="34" name="A7XX_PERF_UCHE_VBIF_WRITE_BEATS_CH0"/>
+	<value value="35" name="A7XX_PERF_UCHE_VBIF_WRITE_BEATS_CH1"/>
+	<value value="36" name="A7XX_PERF_UCHE_GMEM_READ_BEATS"/>
+	<value value="37" name="A7XX_PERF_UCHE_GMEM_WRITE_BEATS"/>
+	<value value="38" name="A7XX_PERF_UCHE_UBWC_READ_BEATS"/>
+	<value value="39" name="A7XX_PERF_UCHE_UBWC_WRITE_BEATS"/>
+	<value value="40" name="A7XX_PERF_UCHE_EVICTS"/>
+	<value value="41" name="A7XX_PERF_UCHE_BANK_REQ0"/>
+	<value value="42" name="A7XX_PERF_UCHE_BANK_REQ1"/>
+	<value value="43" name="A7XX_PERF_UCHE_BANK_REQ2"/>
+	<value value="44" name="A7XX_PERF_UCHE_BANK_REQ3"/>
+	<value value="45" name="A7XX_PERF_UCHE_BANK_REQ4"/>
+	<value value="46" name="A7XX_PERF_UCHE_BANK_REQ5"/>
+	<value value="47" name="A7XX_PERF_UCHE_BANK_REQ6"/>
+	<value value="48" name="A7XX_PERF_UCHE_BANK_REQ7"/>
+	<value value="49" name="A7XX_PERF_UCHE_TPH_REF_FULL"/>
+	<value value="50" name="A7XX_PERF_UCHE_TPH_VICTIM_FULL"/>
+	<value value="51" name="A7XX_PERF_UCHE_TPH_EXT_FULL"/>
+	<value value="52" name="A7XX_PERF_UCHE_RAM_READ_REQ"/>
+	<value value="53" name="A7XX_PERF_UCHE_RAM_WRITE_REQ"/>
+	<value value="54" name="A7XX_PERF_UCHE_LONG_LINE_ALL_EVICTS"/>
+	<value value="55" name="A7XX_PERF_UCHE_LONG_LINE_PARTIAL_EVICTS"/>
+	<value value="56" name="A7XX_PERF_UCHE_TPH_CONFLICT_CL_CCHE"/>
+	<value value="57" name="A7XX_PERF_UCHE_TPH_CONFLICT_CL_OTHER"/>
+	<value value="58" name="A7XX_PERF_UCHE_DBANK_CONFLICT_CL_CCHE"/>
+	<value value="59" name="A7XX_PERF_UCHE_DBANK_CONFLICT_CL_OTHER_CLIENTS"/>
+	<value value="60" name="A7XX_PERF_UCHE_CCHE_TPH_QUEUE_FULL"/>
+	<value value="61" name="A7XX_PERF_UCHE_CCHE_DPH_IO_QUEUE_FULL"/>
+	<value value="62" name="A7XX_PERF_UCHE_CCHE_DPH_CMDPOOL_FULL"/>
+	<value value="63" name="A7XX_PERF_UCHE_EVICTS_SP"/>
+	<value value="64" name="A7XX_PERF_UCHE_EVICTS_LRZ"/>
+	<value value="65" name="A7XX_PERF_UCHE_READ_REQUESTS_VPCUS"/>
+	<value value="66" name="A7XX_PERF_UCHE_READ_REQUESTS_VFD_BYPASS_BV"/>
+	<value value="67" name="A7XX_PERF_UCHE_READ_REQUESTS_VFD_BYPASS_BR"/>
+	<value value="68" name="A7XX_PERF_BYPC_FULL"/>
+	<value value="69" name="A7XX_PERF_BYPC_FULL_CCHE_STALL"/>
+	<value value="70" name="A7XX_PERF_BYPC_VHUB_STALL"/>
+	<value value="71" name="A7XX_PERF_BYPD_FULL"/>
+	<value value="72" name="A7XX_PERF_BYPD_FULL_GBIF_STALL"/>
+	<value value="73" name="A7XX_PERF_VHUB_PTABLE_FULL"/>
+	<value value="74" name="A7XX_PERF_DHUB_PTABLE_FULL"/>
+	<value value="75" name="A7XX_PERF_UCHE_RESERVED_75"/>
+	<value value="76" name="A7XX_PERF_UCHE_RESERVED_76"/>
+	<value value="77" name="A7XX_PERF_UCHE_RESERVED_77"/>
+	<value value="78" name="A7XX_PERF_UCHE_RESERVED_78"/>
+	<value value="79" name="A7XX_PERF_UCHE_RESERVED_79"/>
+	<value value="80" name="A7XX_PERF_UCHE_RESERVED_80"/>
+	<value value="81" name="A7XX_PERF_UCHE_RESERVED_81"/>
+	<value value="82" name="A7XX_PERF_UCHE_RESERVED_82"/>
+	<value value="83" name="A7XX_PERF_UCHE_RESERVED_83"/>
+	<value value="84" name="A7XX_PERF_UCHE_RESERVED_84"/>
+	<value value="85" name="A7XX_PERF_UCHE_RESERVED_85"/>
+	<value value="86" name="A7XX_PERF_UCHE_RESERVED_86"/>
+	<value value="87" name="A7XX_PERF_UCHE_RESERVED_87"/>
+	<value value="88" name="A7XX_PERF_UCHE_RESERVED_88"/>
+	<value value="89" name="A7XX_PERF_UCHE_RESERVED_89"/>
+	<value value="90" name="A7XX_PERF_UCHE_RESERVED_90"/>
+	<value value="91" name="A7XX_PERF_UCHE_RESERVED_91"/>
+	<value value="92" name="A7XX_PERF_UCHE_RESERVED_92"/>
+	<value value="93" name="A7XX_PERF_UCHE_RESERVED_93"/>
+	<value value="94" name="A7XX_PERF_UCHE_RESERVED_94"/>
+	<value value="95" name="A7XX_PERF_UCHE_RESERVED_95"/>
+	<value value="96" name="A7XX_PERF_UCHE_RESERVED_96"/>
+	<value value="97" name="A7XX_PERF_UCHE_RESERVED_97"/>
+	<value value="98" name="A7XX_PERF_UCHE_RESERVED_98"/>
+	<value value="99" name="A7XX_PERF_UCHE_RESERVED_99"/>
+	<value value="100" name="A7XX_PERF_UCHE_RESERVED_100"/>
+	<value value="101" name="A7XX_PERF_UCHE_RESERVED_101"/>
+	<value value="102" name="A7XX_PERF_UCHE_RESERVED_102"/>
+	<value value="103" name="A7XX_PERF_UCHE_RESERVED_103"/>
+	<value value="104" name="A7XX_PERF_UCHE_RESERVED_104"/>
+	<value value="105" name="A7XX_PERF_UCHE_RESERVED_105"/>
+	<value value="106" name="A7XX_PERF_UCHE_RESERVED_106"/>
+	<value value="107" name="A7XX_PERF_UCHE_RESERVED_107"/>
+	<value value="108" name="A7XX_PERF_UCHE_RESERVED_108"/>
+	<value value="109" name="A7XX_PERF_UCHE_RESERVED_109"/>
+	<value value="110" name="A7XX_PERF_UCHE_RESERVED_110"/>
+	<value value="111" name="A7XX_PERF_UCHE_RESERVED_111"/>
+	<value value="112" name="A7XX_PERF_UCHE_RESERVED_112"/>
+	<value value="113" name="A7XX_PERF_UCHE_RESERVED_113"/>
+	<value value="114" name="A7XX_PERF_UCHE_RESERVED_114"/>
+	<value value="115" name="A7XX_PERF_UCHE_RESERVED_115"/>
+	<value value="116" name="A7XX_PERF_UCHE_RESERVED_116"/>
+	<value value="117" name="A7XX_PERF_UCHE_RESERVED_117"/>
+	<value value="118" name="A7XX_PERF_UCHE_RESERVED_118"/>
+	<value value="119" name="A7XX_PERF_UCHE_RESERVED_119"/>
+	<value value="120" name="A7XX_PERF_UCHE_RESERVED_120"/>
+	<value value="121" name="A7XX_PERF_UCHE_RESERVED_121"/>
+	<value value="122" name="A7XX_PERF_UCHE_RESERVED_122"/>
+	<value value="123" name="A7XX_PERF_UCHE_RESERVED_123"/>
+	<value value="124" name="A7XX_PERF_UCHE_RESERVED_124"/>
+	<value value="125" name="A7XX_PERF_UCHE_RESERVED_125"/>
+	<value value="126" name="A7XX_PERF_UCHE_RESERVED_126"/>
+	<value value="127" name="A7XX_PERF_UCHE_RESERVED_127"/>
+	<value value="128" name="A7XX_PERF_CCHE_BUSY_CYCLES"/>
+	<value value="129" name="A7XX_PERF_CCHE_STALL_CYCLES_UCHE"/>
+	<value value="130" name="A7XX_PERF_CCHE_UCHE_STALL_WRITE_DATA"/>
+	<value value="131" name="A7XX_PERF_CCHE_UCHE_LATENCY_CYCLES"/>
+	<value value="132" name="A7XX_PERF_CCHE_UCHE_LATENCY_SAMPLES"/>
+	<value value="133" name="A7XX_PERF_CCHE_READ_REQUESTS_SP_TOTAL"/>
+	<value value="134" name="A7XX_PERF_CCHE_READ_REQUESTS_SP_UBWC"/>
+	<value value="135" name="A7XX_PERF_CCHE_READ_REQUESTS_SP_GBIF"/>
+	<value value="136" name="A7XX_PERF_CCHE_READ_REQUESTS_SP_GMEM"/>
+	<value value="137" name="A7XX_PERF_CCHE_READ_REQUESTS_TP_TOTAL"/>
+	<value value="138" name="A7XX_PERF_CCHE_READ_REQUESTS_TP_UBWC"/>
+	<value value="139" name="A7XX_PERF_CCHE_READ_REQUESTS_TP_GBIF"/>
+	<value value="140" name="A7XX_PERF_CCHE_READ_REQUESTS_TP_GMEM"/>
+	<value value="141" name="A7XX_PERF_CCHE_READ_REQUESTS_VFD_TOTAL"/>
+	<value value="142" name="A7XX_PERF_CCHE_READ_REQUEST_VFD_GMEM"/>
+	<value value="143" name="A7XX_PERF_CCHE_READ_REQUEST_VFD_GBIF"/>
+	<value value="144" name="A7XX_PERF_CCHE_READ_REQUESTS_LRZ"/>
+	<value value="145" name="A7XX_PERF_CCHE_READ_REQUESTS_VPC"/>
+	<value value="146" name="A7XX_PERF_CCHE_WRITE_REQUESTS_SP"/>
+	<value value="147" name="A7XX_PERF_CCHE_WRITE_REQUESTS_LRZ"/>
+	<value value="148" name="A7XX_PERF_CCHE_READ_REQUESTS_GMEM"/>
+	<value value="149" name="A7XX_PERF_CCHE_WRITE_REQUESTS_GMEM"/>
+	<value value="150" name="A7XX_PERF_CCHE_UCHE_READ_BEATS_TP"/>
+	<value value="151" name="A7XX_PERF_CCHE_UCHE_READ_BEATS_VFD"/>
+	<value value="152" name="A7XX_PERF_CCHE_UCHE_READ_BEATS_SP"/>
+	<value value="153" name="A7XX_PERF_CCHE_UCHE_READ_BEATS_VPC"/>
+	<value value="154" name="A7XX_PERF_CCHE_UCHE_READ_BEATS_LRZ"/>
+	<value value="155" name="A7XX_PERF_CCHE_UCHE_READ_BEATS_CH0"/>
+	<value value="156" name="A7XX_PERF_CCHE_UCHE_READ_BEATS_CH1"/>
+	<value value="157" name="A7XX_PERF_CCHE_GMEM_READ_BEATS_VPC"/>
+	<value value="158" name="A7XX_PERF_CCHE_GMEM_READ_BEATS_TP"/>
+	<value value="159" name="A7XX_PERF_CCHE_GMEM_READ_BEATS_SP"/>
+	<value value="160" name="A7XX_PERF_CCHE_GMEM_READ_BEATS_VFD"/>
+	<value value="161" name="A7XX_PERF_CCHE_BANK_REQ0"/>
+	<value value="162" name="A7XX_PERF_CCHE_BANK_REQ1"/>
+	<value value="163" name="A7XX_PERF_CCHE_BANK_REQ2"/>
+	<value value="164" name="A7XX_PERF_CCHE_BANK_REQ3"/>
+	<value value="165" name="A7XX_PERF_CCHE_BANK_REQ4"/>
+	<value value="166" name="A7XX_PERF_CCHE_BANK_REQ5"/>
+	<value value="167" name="A7XX_PERF_CCHE_BANK_REQ6"/>
+	<value value="168" name="A7XX_PERF_CCHE_BANK_REQ7"/>
+	<value value="169" name="A7XX_PERF_CCHE_BANK_REQ8"/>
+	<value value="170" name="A7XX_PERF_CCHE_BANK_REQ9"/>
+	<value value="171" name="A7XX_PERF_CCHE_BANK_REQ10"/>
+	<value value="172" name="A7XX_PERF_CCHE_BANK_REQ11"/>
+	<value value="173" name="A7XX_PERF_CCHE_BANK_REQ12"/>
+	<value value="174" name="A7XX_PERF_CCHE_BANK_REQ13"/>
+	<value value="175" name="A7XX_PERF_CCHE_BANK_REQ14"/>
+	<value value="176" name="A7XX_PERF_CCHE_BANK_REQ15"/>
+	<value value="177" name="A7XX_PERF_CCHE_GBANK_REQ0"/>
+	<value value="178" name="A7XX_PERF_CCHE_GBANK_REQ1"/>
+	<value value="179" name="A7XX_PERF_CCHE_GBANK_REQ2"/>
+	<value value="180" name="A7XX_PERF_CCHE_GBANK_REQ3"/>
+	<value value="181" name="A7XX_PERF_CCHE_TPH_REF_FULL"/>
+	<value value="182" name="A7XX_PERF_CCHE_TPH_VICTIM_FULL"/>
+	<value value="183" name="A7XX_PERF_CCHE_TPH_EXT_FULL"/>
+	<value value="184" name="A7XX_PERF_CCHE_RAM_READ_REQ"/>
+	<value value="185" name="A7XX_PERF_CCHE_RAM_WRITE_REQ"/>
+	<value value="186" name="A7XX_PERF_CCHE_TPH_CONFLICT_CL"/>
+	<value value="187" name="A7XX_PERF_CCHE_DBANK_CONFLICT"/>
+	<value value="188" name="A7XX_PERF_CCHE_TPH_QUEUE_FULL"/>
+	<value value="189" name="A7XX_PERF_CCHE_DPH_QUEUE_FULL"/>
+	<value value="190" name="A7XX_PERF_CCHE_OPH_QUEUE_FULL"/>
+	<value value="191" name="A7XX_PERF_CCHE_WACK_QUEUE_FULL"/>
+	<value value="192" name="A7XX_PERF_CCHE_GMEM0_LOCAL_RD_REQUEST"/>
+	<value value="193" name="A7XX_PERF_CCHE_GMEM0_LOCAL_WR_REQUEST"/>
+	<value value="194" name="A7XX_PERF_CCHE_GMEM1_LOCAL_RD_REQUEST"/>
+	<value value="195" name="A7XX_PERF_CCHE_GMEM1_LOCAL_WR_REQUEST"/>
+	<value value="196" name="A7XX_PERF_CCHE_GMEM0_REMOTE_RD_REQUEST"/>
+	<value value="197" name="A7XX_PERF_CCHE_GMEM0_REMOTE_WR_REQUEST"/>
+	<value value="198" name="A7XX_PERF_CCHE_GMEM1_REMOTE_RD_REQUEST"/>
+	<value value="199" name="A7XX_PERF_CCHE_GMEM1_REMOTE_WR_REQUEST"/>
+	<value value="200" name="A7XX_PERF_CCHE_STALL_CYCLES_TP"/>
+</enum>
+
+<enum name="a7xx_tp_perfcounter_select">
+	<value value="0" name="A7XX_PERF_TP_NEVER_COUNT"/>
+	<value value="1" name="A7XX_PERF_TP_BUSY_CYCLES"/>
+	<value value="2" name="A7XX_PERF_TP_STALL_CYCLES_UCHE"/>
+	<value value="3" name="A7XX_PERF_TP_LATENCY_CYCLES"/>
+	<value value="4" name="A7XX_PERF_TP_LATENCY_TRANS"/>
+	<value value="5" name="A7XX_PERF_TP_FLAG_FIFO_DELAY_SAMPLES"/>
+	<value value="6" name="A7XX_PERF_TP_FLAG_FIFO_DELAY_CYCLES"/>
+	<value value="7" name="A7XX_PERF_TP_L1_CACHELINE_REQUESTS"/>
+	<value value="8" name="A7XX_PERF_TP_L1_CACHELINE_MISSES"/>
+	<value value="9" name="A7XX_PERF_TP_SP_TP_TRANS"/>
+	<value value="10" name="A7XX_PERF_TP_TP_SP_TRANS"/>
+	<value value="11" name="A7XX_PERF_TP_OUTPUT_PIXELS"/>
+	<value value="12" name="A7XX_PERF_TP_FILTER_WORKLOAD_16BIT"/>
+	<value value="13" name="A7XX_PERF_TP_FILTER_WORKLOAD_32BIT"/>
+	<value value="14" name="A7XX_PERF_TP_QUADS_RECEIVED"/>
+	<value value="15" name="A7XX_PERF_TP_QUADS_OFFSET"/>
+	<value value="16" name="A7XX_PERF_TP_QUADS_SHADOW"/>
+	<value value="17" name="A7XX_PERF_TP_QUADS_ARRAY"/>
+	<value value="18" name="A7XX_PERF_TP_QUADS_GRADIENT"/>
+	<value value="19" name="A7XX_PERF_TP_QUADS_1D"/>
+	<value value="20" name="A7XX_PERF_TP_QUADS_2D"/>
+	<value value="21" name="A7XX_PERF_TP_QUADS_BUFFER"/>
+	<value value="22" name="A7XX_PERF_TP_QUADS_3D"/>
+	<value value="23" name="A7XX_PERF_TP_QUADS_CUBE"/>
+	<value value="24" name="A7XX_PERF_TP_DIVERGENT_QUADS_RECEIVED"/>
+	<value value="25" name="A7XX_PERF_TP_PRT_NON_RESIDENT_EVENTS"/>
+	<value value="26" name="A7XX_PERF_TP_OUTPUT_PIXELS_POINT"/>
+	<value value="27" name="A7XX_PERF_TP_OUTPUT_PIXELS_BILINEAR"/>
+	<value value="28" name="A7XX_PERF_TP_OUTPUT_PIXELS_MIP"/>
+	<value value="29" name="A7XX_PERF_TP_OUTPUT_PIXELS_ANISO"/>
+	<value value="30" name="A7XX_PERF_TP_OUTPUT_PIXELS_ZERO_LOD"/>
+	<value value="31" name="A7XX_PERF_TP_FLAG_CACHE_REQUESTS"/>
+	<value value="32" name="A7XX_PERF_TP_FLAG_CACHE_MISSES"/>
+	<value value="33" name="A7XX_PERF_TP_L1_5_L2_REQUESTS"/>
+	<value value="34" name="A7XX_PERF_TP_2D_OUTPUT_PIXELS"/>
+	<value value="35" name="A7XX_PERF_TP_2D_OUTPUT_PIXELS_POINT"/>
+	<value value="36" name="A7XX_PERF_TP_2D_OUTPUT_PIXELS_BILINEAR"/>
+	<value value="37" name="A7XX_PERF_TP_2D_FILTER_WORKLOAD_16BIT"/>
+	<value value="38" name="A7XX_PERF_TP_2D_FILTER_WORKLOAD_32BIT"/>
+	<value value="39" name="A7XX_PERF_TP_TPA2TPC_TRANS"/>
+	<value value="40" name="A7XX_PERF_TP_L1_MISSES_ASTC_1TILE"/>
+	<value value="41" name="A7XX_PERF_TP_L1_MISSES_ASTC_2TILE"/>
+	<value value="42" name="A7XX_PERF_TP_L1_MISSES_ASTC_4TILE"/>
+	<value value="43" name="A7XX_PERF_TP_L1_5_COMPRESS_REQS"/>
+	<value value="44" name="A7XX_PERF_TP_L1_5_L2_COMPRESS_MISS"/>
+	<value value="45" name="A7XX_PERF_TP_L1_BANK_CONFLICT"/>
+	<value value="46" name="A7XX_PERF_TP_L1_5_MISS_LATENCY_CYCLES"/>
+	<value value="47" name="A7XX_PERF_TP_L1_5_MISS_LATENCY_TRANS"/>
+	<value value="48" name="A7XX_PERF_TP_QUADS_CONSTANT_MULTIPLIED"/>
+	<value value="49" name="A7XX_PERF_TP_FRONTEND_WORKING_CYCLES"/>
+	<value value="50" name="A7XX_PERF_TP_L1_TAG_WORKING_CYCLES"/>
+	<value value="51" name="A7XX_PERF_TP_L1_DATA_WRITE_WORKING_CYCLES"/>
+	<value value="52" name="A7XX_PERF_TP_PRE_L1_DECOM_WORKING_CYCLES"/>
+	<value value="53" name="A7XX_PERF_TP_BACKEND_WORKING_CYCLES"/>
+	<value value="54" name="A7XX_PERF_TP_L1_5_CACHE_WORKING_CYCLES"/>
+	<value value="55" name="A7XX_PERF_TP_STARVE_CYCLES_SP"/>
+	<value value="56" name="A7XX_PERF_TP_STARVE_CYCLES_UCHE"/>
+	<value value="57" name="A7XX_PERF_TP_STALL_CYCLES_UFC"/>
+	<value value="58" name="A7XX_PERF_TP_FORMAT_DECOMP_POINT"/>
+	<value value="59" name="A7XX_PERF_TP_FILTER_POINT_FP16"/>
+	<value value="60" name="A7XX_PERF_TP_FILTER_POINT_FP32"/>
+	<value value="61" name="A7XX_PERF_TP_LATENCY_FIFO_FULL"/>
+	<value value="62" name="A7XX_PERF_TP_RESERVED_62"/>
+	<value value="63" name="A7XX_PERF_TP_RESERVED_63"/>
+	<value value="64" name="A7XX_PERF_TP_RESERVED_64"/>
+	<value value="65" name="A7XX_PERF_TP_RESERVED_65"/>
+	<value value="66" name="A7XX_PERF_TP_RESERVED_66"/>
+	<value value="67" name="A7XX_PERF_TP_RESERVED_67"/>
+	<value value="68" name="A7XX_PERF_TP_RESERVED_68"/>
+	<value value="69" name="A7XX_PERF_TP_RESERVED_69"/>
+	<value value="70" name="A7XX_PERF_TP_RESERVED_70"/>
+	<value value="71" name="A7XX_PERF_TP_RESERVED_71"/>
+	<value value="72" name="A7XX_PERF_TP_RESERVED_72"/>
+	<value value="73" name="A7XX_PERF_TP_RESERVED_73"/>
+	<value value="74" name="A7XX_PERF_TP_RESERVED_74"/>
+	<value value="75" name="A7XX_PERF_TP_RESERVED_75"/>
+	<value value="76" name="A7XX_PERF_TP_RESERVED_76"/>
+	<value value="77" name="A7XX_PERF_TP_RESERVED_77"/>
+	<value value="78" name="A7XX_PERF_TP_RESERVED_78"/>
+	<value value="79" name="A7XX_PERF_TP_RESERVED_79"/>
+	<value value="80" name="A7XX_PERF_TP_RESERVED_80"/>
+	<value value="81" name="A7XX_PERF_TP_RESERVED_81"/>
+	<value value="82" name="A7XX_PERF_TP_RESERVED_82"/>
+	<value value="83" name="A7XX_PERF_TP_RESERVED_83"/>
+	<value value="84" name="A7XX_PERF_TP_RESERVED_84"/>
+	<value value="85" name="A7XX_PERF_TP_RESERVED_85"/>
+	<value value="86" name="A7XX_PERF_TP_RESERVED_86"/>
+	<value value="87" name="A7XX_PERF_TP_RESERVED_87"/>
+	<value value="88" name="A7XX_PERF_TP_RESERVED_88"/>
+	<value value="89" name="A7XX_PERF_TP_RESERVED_89"/>
+	<value value="90" name="A7XX_PERF_TP_RESERVED_90"/>
+	<value value="91" name="A7XX_PERF_TP_RESERVED_91"/>
+	<value value="92" name="A7XX_PERF_TP_RESERVED_92"/>
+	<value value="93" name="A7XX_PERF_TP_RESERVED_93"/>
+	<value value="94" name="A7XX_PERF_TP_RESERVED_94"/>
+	<value value="95" name="A7XX_PERF_TP_RESERVED_95"/>
+	<value value="96" name="A7XX_PERF_TP_RESERVED_96"/>
+	<value value="97" name="A7XX_PERF_TP_RESERVED_97"/>
+	<value value="98" name="A7XX_PERF_TP_RESERVED_98"/>
+	<value value="99" name="A7XX_PERF_TP_RESERVED_99"/>
+	<value value="100" name="A7XX_PERF_TP_RESERVED_100"/>
+	<value value="101" name="A7XX_PERF_TP_RESERVED_101"/>
+	<value value="102" name="A7XX_PERF_TP_RESERVED_102"/>
+	<value value="103" name="A7XX_PERF_TP_RESERVED_103"/>
+	<value value="104" name="A7XX_PERF_TP_RESERVED_104"/>
+	<value value="105" name="A7XX_PERF_TP_RESERVED_105"/>
+	<value value="106" name="A7XX_PERF_TP_RESERVED_106"/>
+	<value value="107" name="A7XX_PERF_TP_RESERVED_107"/>
+	<value value="108" name="A7XX_PERF_TP_RESERVED_108"/>
+	<value value="109" name="A7XX_PERF_TP_RESERVED_109"/>
+	<value value="110" name="A7XX_PERF_TP_RESERVED_110"/>
+	<value value="111" name="A7XX_PERF_TP_RESERVED_111"/>
+	<value value="112" name="A7XX_PERF_TP_RESERVED_112"/>
+	<value value="113" name="A7XX_PERF_TP_RESERVED_113"/>
+	<value value="114" name="A7XX_PERF_TP_RESERVED_114"/>
+	<value value="115" name="A7XX_PERF_TP_RESERVED_115"/>
+	<value value="116" name="A7XX_PERF_TP_RESERVED_116"/>
+	<value value="117" name="A7XX_PERF_TP_RESERVED_117"/>
+	<value value="118" name="A7XX_PERF_TP_RESERVED_118"/>
+	<value value="119" name="A7XX_PERF_TP_RESERVED_119"/>
+	<value value="120" name="A7XX_PERF_TP_RESERVED_120"/>
+	<value value="121" name="A7XX_PERF_TP_RESERVED_121"/>
+	<value value="122" name="A7XX_PERF_TP_RESERVED_122"/>
+	<value value="123" name="A7XX_PERF_TP_RESERVED_123"/>
+	<value value="124" name="A7XX_PERF_TP_RESERVED_124"/>
+	<value value="125" name="A7XX_PERF_TP_RESERVED_125"/>
+	<value value="126" name="A7XX_PERF_TP_RESERVED_126"/>
+	<value value="127" name="A7XX_PERF_TP_RESERVED_127"/>
+	<value value="128" name="A7XX_PERF_TP_FORMAT_DECOMP_BILINEAR"/>
+	<value value="129" name="A7XX_PERF_TP_PACKED_POINT_BOTH_VALID_FP16"/>
+	<value value="130" name="A7XX_PERF_TP_PACKED_POINT_SINGLE_VALID_FP16"/>
+	<value value="131" name="A7XX_PERF_TP_PACKED_POINT_BOTH_VALID_FP32"/>
+	<value value="132" name="A7XX_PERF_TP_PACKED_POINT_SINGLE_VALID_FP32"/>
+</enum>
+
+<enum name="a7xx_sp_perfcounter_select">
+	<value value="0" name="A7XX_PERF_SP_NEVER_COUNT"/>
+	<value value="1" name="A7XX_PERF_SP_BUSY_CYCLES"/>
+	<value value="2" name="A7XX_PERF_SP_ALU_WORKING_CYCLES"/>
+	<value value="3" name="A7XX_PERF_SP_STALL_CYCLES_VPC_BE"/>
+	<value value="4" name="A7XX_PERF_SP_STALL_CYCLES_TP"/>
+	<value value="5" name="A7XX_PERF_SP_STALL_CYCLES_UCHE"/>
+	<value value="6" name="A7XX_PERF_SP_STALL_CYCLES_RB"/>
+	<value value="7" name="A7XX_PERF_SP_NON_EXECUTION_CYCLES"/>
+	<value value="8" name="A7XX_PERF_SP_WAVE_CONTEXTS"/>
+	<value value="9" name="A7XX_PERF_SP_WAVE_CONTEXT_CYCLES"/>
+	<value value="10" name="A7XX_PERF_SP_FS_STAGE_WAVE_CYCLES"/>
+	<value value="11" name="A7XX_PERF_SP_FS_STAGE_WAVE_SAMPLES"/>
+	<value value="12" name="A7XX_PERF_SP_VS_STAGE_WAVE_CYCLES"/>
+	<value value="13" name="A7XX_PERF_SP_VS_STAGE_WAVE_SAMPLES"/>
+	<value value="14" name="A7XX_PERF_SP_FS_STAGE_DURATION_CYCLES"/>
+	<value value="15" name="A7XX_PERF_SP_VS_STAGE_DURATION_CYCLES"/>
+	<value value="16" name="A7XX_PERF_SP_WAVE_CTRL_CYCLES"/>
+	<value value="17" name="A7XX_PERF_SP_WAVE_LOAD_CYCLES"/>
+	<value value="18" name="A7XX_PERF_SP_WAVE_EMIT_CYCLES"/>
+	<value value="19" name="A7XX_PERF_SP_WAVE_NOP_CYCLES"/>
+	<value value="20" name="A7XX_PERF_SP_WAVE_WAIT_CYCLES"/>
+	<value value="21" name="A7XX_PERF_SP_WAVE_FETCH_CYCLES"/>
+	<value value="22" name="A7XX_PERF_SP_WAVE_IDLE_CYCLES"/>
+	<value value="23" name="A7XX_PERF_SP_WAVE_END_CYCLES"/>
+	<value value="24" name="A7XX_PERF_SP_WAVE_LONG_SYNC_CYCLES"/>
+	<value value="25" name="A7XX_PERF_SP_WAVE_SHORT_SYNC_CYCLES"/>
+	<value value="26" name="A7XX_PERF_SP_WAVE_JOIN_CYCLES"/>
+	<value value="27" name="A7XX_PERF_SP_LM_LOAD_INSTRUCTIONS"/>
+	<value value="28" name="A7XX_PERF_SP_LM_STORE_INSTRUCTIONS"/>
+	<value value="29" name="A7XX_PERF_SP_LM_ATOMICS"/>
+	<value value="30" name="A7XX_PERF_SP_GM_LOAD_INSTRUCTIONS"/>
+	<value value="31" name="A7XX_PERF_SP_GM_STORE_INSTRUCTIONS"/>
+	<value value="32" name="A7XX_PERF_SP_GM_ATOMICS"/>
+	<value value="33" name="A7XX_PERF_SP_VS_STAGE_TEX_INSTRUCTIONS"/>
+	<value value="34" name="A7XX_PERF_SP_VS_STAGE_EFU_INSTRUCTIONS"/>
+	<value value="35" name="A7XX_PERF_SP_VS_STAGE_FULL_ALU_INSTRUCTIONS"/>
+	<value value="36" name="A7XX_PERF_SP_VS_STAGE_HALF_ALU_INSTRUCTIONS"/>
+	<value value="37" name="A7XX_PERF_SP_FS_STAGE_TEX_INSTRUCTIONS"/>
+	<value value="38" name="A7XX_PERF_SP_FS_STAGE_CFLOW_INSTRUCTIONS"/>
+	<value value="39" name="A7XX_PERF_SP_FS_STAGE_EFU_INSTRUCTIONS"/>
+	<value value="40" name="A7XX_PERF_SP_FS_STAGE_FULL_ALU_INSTRUCTIONS"/>
+	<value value="41" name="A7XX_PERF_SP_FS_STAGE_HALF_ALU_INSTRUCTIONS"/>
+	<value value="42" name="A7XX_PERF_SP_FS_STAGE_BARY_INSTRUCTIONS"/>
+	<value value="43" name="A7XX_PERF_SP_VS_INSTRUCTIONS"/>
+	<value value="44" name="A7XX_PERF_SP_FS_INSTRUCTIONS"/>
+	<value value="45" name="A7XX_PERF_SP_ADDR_LOCK_COUNT"/>
+	<value value="46" name="A7XX_PERF_SP_UCHE_READ_TRANS"/>
+	<value value="47" name="A7XX_PERF_SP_UCHE_WRITE_TRANS"/>
+	<value value="48" name="A7XX_PERF_SP_EXPORT_VPC_TRANS"/>
+	<value value="49" name="A7XX_PERF_SP_EXPORT_RB_TRANS"/>
+	<value value="50" name="A7XX_PERF_SP_PIXELS_KILLED"/>
+	<value value="51" name="A7XX_PERF_SP_ICL1_REQUESTS"/>
+	<value value="52" name="A7XX_PERF_SP_ICL1_MISSES"/>
+	<value value="53" name="A7XX_PERF_SP_HS_INSTRUCTIONS"/>
+	<value value="54" name="A7XX_PERF_SP_DS_INSTRUCTIONS"/>
+	<value value="55" name="A7XX_PERF_SP_GS_INSTRUCTIONS"/>
+	<value value="56" name="A7XX_PERF_SP_CS_INSTRUCTIONS"/>
+	<value value="57" name="A7XX_PERF_SP_GPR_READ"/>
+	<value value="58" name="A7XX_PERF_SP_GPR_WRITE"/>
+	<value value="59" name="A7XX_PERF_SP_FS_STAGE_HALF_EFU_INSTRUCTIONS"/>
+	<value value="60" name="A7XX_PERF_SP_VS_STAGE_HALF_EFU_INSTRUCTIONS"/>
+	<value value="61" name="A7XX_PERF_SP_LM_BANK_CONFLICTS"/>
+	<value value="62" name="A7XX_PERF_SP_TEX_CONTROL_WORKING_CYCLES"/>
+	<value value="63" name="A7XX_PERF_SP_LOAD_CONTROL_WORKING_CYCLES"/>
+	<value value="64" name="A7XX_PERF_SP_FLOW_CONTROL_WORKING_CYCLES"/>
+	<value value="65" name="A7XX_PERF_SP_LM_WORKING_CYCLES"/>
+	<value value="66" name="A7XX_PERF_SP_DISPATCHER_WORKING_CYCLES"/>
+	<value value="67" name="A7XX_PERF_SP_SEQUENCER_WORKING_CYCLES"/>
+	<value value="68" name="A7XX_PERF_SP_LOW_EFFICIENCY_STARVED_BY_TP"/>
+	<value value="69" name="A7XX_PERF_SP_STARVE_CYCLES_HLSQ"/>
+	<value value="70" name="A7XX_PERF_SP_NON_EXECUTION_LS_CYCLES"/>
+	<value value="71" name="A7XX_PERF_SP_WORKING_EU"/>
+	<value value="72" name="A7XX_PERF_SP_ANY_EU_WORKING"/>
+	<value value="73" name="A7XX_PERF_SP_WORKING_EU_FS_STAGE"/>
+	<value value="74" name="A7XX_PERF_SP_ANY_EU_WORKING_FS_STAGE"/>
+	<value value="75" name="A7XX_PERF_SP_WORKING_EU_VS_STAGE"/>
+	<value value="76" name="A7XX_PERF_SP_ANY_EU_WORKING_VS_STAGE"/>
+	<value value="77" name="A7XX_PERF_SP_WORKING_EU_CS_STAGE"/>
+	<value value="78" name="A7XX_PERF_SP_ANY_EU_WORKING_CS_STAGE"/>
+	<value value="79" name="A7XX_PERF_SP_GPR_READ_PREFETCH"/>
+	<value value="80" name="A7XX_PERF_SP_GPR_READ_CONFLICT"/>
+	<value value="81" name="A7XX_PERF_SP_GPR_WRITE_CONFLICT"/>
+	<value value="82" name="A7XX_PERF_SP_GM_LOAD_LATENCY_CYCLES"/>
+	<value value="83" name="A7XX_PERF_SP_GM_LOAD_LATENCY_SAMPLES"/>
+	<value value="84" name="A7XX_PERF_SP_EXECUTABLE_WAVES"/>
+	<value value="85" name="A7XX_PERF_SP_ICL1_MISS_FETCH_CYCLES"/>
+	<value value="86" name="A7XX_PERF_SP_RESERVED_86"/>
+	<value value="87" name="A7XX_PERF_SP_BYPASS_BUSY_CYCLES"/>
+	<value value="88" name="A7XX_PERF_SP_ANY_EU_WORKING_LPAC"/>
+	<value value="89" name="A7XX_PERF_SP_WAVE_ALU_CYCLES"/>
+	<value value="90" name="A7XX_PERF_SP_WAVE_EFU_CYCLES"/>
+	<value value="91" name="A7XX_PERF_SP_WAVE_INT_CYCLES"/>
+	<value value="92" name="A7XX_PERF_SP_WAVE_CSP_CYCLES"/>
+	<value value="93" name="A7XX_PERF_SP_EWAVE_CONTEXTS"/>
+	<value value="94" name="A7XX_PERF_SP_EWAVE_CONTEXT_CYCLES"/>
+	<value value="95" name="A7XX_PERF_SP_LPAC_BUSY_CYCLES"/>
+	<value value="96" name="A7XX_PERF_SP_LPAC_INSTRUCTIONS"/>
+	<value value="97" name="A7XX_PERF_SP_FS_STAGE_1X_WAVES"/>
+	<value value="98" name="A7XX_PERF_SP_FS_STAGE_2X_WAVES"/>
+	<value value="99" name="A7XX_PERF_SP_QUADS"/>
+	<value value="100" name="A7XX_PERF_SP_CS_INVOCATIONS"/>
+	<value value="101" name="A7XX_PERF_SP_PIXELS"/>
+	<value value="102" name="A7XX_PERF_SP_LPAC_DRAWCALLS"/>
+	<value value="103" name="A7XX_PERF_SP_PI_WORKING_CYCLES"/>
+	<value value="104" name="A7XX_PERF_SP_WAVE_INPUT_CYCLES"/>
+	<value value="105" name="A7XX_PERF_SP_WAVE_OUTPUT_CYCLES"/>
+	<value value="106" name="A7XX_PERF_SP_WAVE_HWAVE_WAIT_CYCLES"/>
+	<value value="107" name="A7XX_PERF_SP_WAVE_HWAVE_SYNC"/>
+	<value value="108" name="A7XX_PERF_SP_OUTPUT_3D_PIXELS"/>
+	<value value="109" name="A7XX_PERF_SP_FULL_ALU_MAD_INSTRUCTIONS"/>
+	<value value="110" name="A7XX_PERF_SP_HALF_ALU_MAD_INSTRUCTIONS"/>
+	<value value="111" name="A7XX_PERF_SP_FULL_ALU_MUL_INSTRUCTIONS"/>
+	<value value="112" name="A7XX_PERF_SP_HALF_ALU_MUL_INSTRUCTIONS"/>
+	<value value="113" name="A7XX_PERF_SP_FULL_ALU_ADD_INSTRUCTIONS"/>
+	<value value="114" name="A7XX_PERF_SP_HALF_ALU_ADD_INSTRUCTIONS"/>
+	<value value="115" name="A7XX_PERF_SP_BARY_FP32_INSTRUCTIONS"/>
+	<value value="116" name="A7XX_PERF_SP_ALU_GPR_READ_CYCLES"/>
+	<value value="117" name="A7XX_PERF_SP_ALU_DATA_FORWARDING_CYCLES"/>
+	<value value="118" name="A7XX_PERF_SP_LM_FULL_CYCLES"/>
+	<value value="119" name="A7XX_PERF_SP_TEXTURE_FETCH_LATENCY_CYCLES"/>
+	<value value="120" name="A7XX_PERF_SP_TEXTURE_FETCH_LATENCY_SAMPLES"/>
+	<value value="121" name="A7XX_PERF_SP_FS_STAGE_PI_TEX_INSTRUCTION"/>
+	<value value="122" name="A7XX_PERF_SP_RAY_QUERY_INSTRUCTIONS"/>
+	<value value="123" name="A7XX_PERF_SP_RBRT_KICKOFF_FIBERS"/>
+	<value value="124" name="A7XX_PERF_SP_RBRT_KICKOFF_DQUADS"/>
+	<value value="125" name="A7XX_PERF_SP_RTU_BUSY_CYCLES"/>
+	<value value="126" name="A7XX_PERF_SP_RTU_L0_HITS"/>
+	<value value="127" name="A7XX_PERF_SP_RTU_L0_MISSES"/>
+	<value value="128" name="A7XX_PERF_SP_RTU_L0_HIT_ON_MISS"/>
+	<value value="129" name="A7XX_PERF_SP_RTU_STALL_CYCLES_WAVE_QUEUE"/>
+	<value value="130" name="A7XX_PERF_SP_RTU_STALL_CYCLES_L0_HIT_QUEUE"/>
+	<value value="131" name="A7XX_PERF_SP_RTU_STALL_CYCLES_L0_MISS_QUEUE"/>
+	<value value="132" name="A7XX_PERF_SP_RTU_STALL_CYCLES_L0D_IDX_QUEUE"/>
+	<value value="133" name="A7XX_PERF_SP_RTU_STALL_CYCLES_L0DATA"/>
+	<value value="134" name="A7XX_PERF_SP_RTU_STALL_CYCLES_REPLACE_CNT"/>
+	<value value="135" name="A7XX_PERF_SP_RTU_STALL_CYCLES_MRG_CNT"/>
+	<value value="136" name="A7XX_PERF_SP_RTU_STALL_CYCLES_UCHE"/>
+	<value value="137" name="A7XX_PERF_SP_RTU_OPERAND_FETCH_STALL_CYCLES_L0"/>
+	<value value="138" name="A7XX_PERF_SP_RTU_OPERAND_FETCH_STALL_CYCLES_INS_FIFO"/>
+	<value value="139" name="A7XX_PERF_SP_RTU_BVH_FETCH_LATENCY_CYCLES"/>
+	<value value="140" name="A7XX_PERF_SP_RTU_BVH_FETCH_LATENCY_SAMPLES"/>
+	<value value="141" name="A7XX_PERF_SP_STCHE_MISS_INC_VS"/>
+	<value value="142" name="A7XX_PERF_SP_STCHE_MISS_INC_FS"/>
+	<value value="143" name="A7XX_PERF_SP_STCHE_MISS_INC_BV"/>
+	<value value="144" name="A7XX_PERF_SP_STCHE_MISS_INC_LPAC"/>
+	<value value="145" name="A7XX_PERF_SP_VGPR_ACTIVE_CONTEXTS"/>
+	<value value="146" name="A7XX_PERF_SP_PGPR_ALLOC_CONTEXTS"/>
+	<value value="147" name="A7XX_PERF_SP_VGPR_ALLOC_CONTEXTS"/>
+	<value value="148" name="A7XX_PERF_SP_RTU_RAY_BOX_INTERSECTIONS"/>
+	<value value="149" name="A7XX_PERF_SP_RTU_RAY_TRIANGLE_INTERSECTIONS"/>
+	<value value="150" name="A7XX_PERF_SP_SCH_STALL_CYCLES_RTU"/>
+	<value value="151" name="A7XX_PERF_SP_EFU_WORKING_CYCLES"/>
+	<value value="152" name="A7XX_PERF_SP_BRANCH_TAKEN"/>
+	<value value="153" name="A7XX_PERF_SP_BRANCH_NOT_TAKEN"/>
+	<value value="154" name="A7XX_PERF_SP_BRANCH_INS_DIVERGENCY_COUNT"/>
+	<value value="155" name="A7XX_PERF_SP_BRANCH_INS_COUNT"/>
+	<value value="156" name="A7XX_PERF_SP_PREDICT_TAKEN"/>
+	<value value="157" name="A7XX_PERF_SP_PREDICT_NOT_TAKEN"/>
+	<value value="158" name="A7XX_PERF_SP_PREDICT_INS_DIVERGENCY_COUNT"/>
+	<value value="159" name="A7XX_PERF_SP_PREDICT_INS_COUNT"/>
+	<value value="160" name="A7XX_PERF_SP_CCHE_UAV_TOTAL_REQ"/>
+	<value value="161" name="A7XX_PERF_SP_CCHE_UAV_TOTAL_DUALQUAD"/>
+	<value value="162" name="A7XX_PERF_SP_CCHE_NONUAV_TOTAL_REQ"/>
+	<value value="163" name="A7XX_PERF_SP_CCHE_NONUAV_TOTAL_DUALQUAD"/>
+	<value value="164" name="A7XX_PERF_SP_LB_NONUAV_TOTAL_REQ"/>
+	<value value="165" name="A7XX_PERF_SP_LB_NONUAV_TOTAL_DUALQUAD"/>
+	<value value="166" name="A7XX_PERF_SP_LB_READ_XFER_ALU"/>
+	<value value="167" name="A7XX_PERF_SP_LB_ALU_READ_CONS"/>
+	<value value="168" name="A7XX_PERF_SP_LB_READ_ALU_BLOCK_OTHER"/>
+	<value value="169" name="A7XX_PERF_SP_LB_WRITE_XFER_VPC"/>
+	<value value="170" name="A7XX_PERF_SP_LB_WRITE_VPC_BLOCK_OTHER"/>
+	<value value="171" name="A7XX_PERF_SP_LB_LDST_RW_LM"/>
+	<value value="172" name="A7XX_PERF_SP_LB_LDST_RW_LM_BLOCKED"/>
+	<value value="173" name="A7XX_PERF_SP_LB_LDST_WRITE_CONS"/>
+	<value value="174" name="A7XX_PERF_SP_LB_LDST_WRITE_CONS_BLOCKED"/>
+	<value value="175" name="A7XX_PERF_SP_GPR_READ_BANK"/>
+	<value value="176" name="A7XX_PERF_SP_GPR_WRITE_BANK"/>
+	<value value="177" name="A7XX_PERF_SP_VS_WAVE_REQ_PENDING"/>
+	<value value="178" name="A7XX_PERF_SP_FS_WAVE_REQ_PENDING"/>
+	<value value="179" name="A7XX_PERF_SP_LPAC_WAVE_REQ_PENDING"/>
+	<value value="180" name="A7XX_PERF_SP_WAVE_SPLIT_CNT"/>
+	<value value="181" name="A7XX_PERF_SP_FS_OOO_WAVE_ACC"/>
+</enum>
+
+<enum name="a7xx_rb_perfcounter_select">
+	<value value="0" name="A7XX_PERF_RB_NEVER_COUNT"/>
+	<value value="1" name="A7XX_PERF_RB_BUSY_CYCLES"/>
+	<value value="2" name="A7XX_PERF_RB_STALL_CYCLES_HLSQ"/>
+	<value value="3" name="A7XX_PERF_RB_STALL_CYCLES_FIFO0_FULL"/>
+	<value value="4" name="A7XX_PERF_RB_STALL_CYCLES_FIFO1_FULL"/>
+	<value value="5" name="A7XX_PERF_RB_STALL_CYCLES_FIFO2_FULL"/>
+	<value value="6" name="A7XX_PERF_RB_STARVE_CYCLES_SP"/>
+	<value value="7" name="A7XX_PERF_RB_STARVE_CYCLES_LRZ_TILE"/>
+	<value value="8" name="A7XX_PERF_RB_STARVE_CYCLES_CCU"/>
+	<value value="9" name="A7XX_PERF_RB_STARVE_CYCLES_Z_PLANE"/>
+	<value value="10" name="A7XX_PERF_RB_STARVE_CYCLES_BARY_PLANE"/>
+	<value value="11" name="A7XX_PERF_RB_Z_WORKLOAD"/>
+	<value value="12" name="A7XX_PERF_RB_HLSQ_ACTIVE"/>
+	<value value="13" name="A7XX_PERF_RB_Z_READ"/>
+	<value value="14" name="A7XX_PERF_RB_Z_WRITE"/>
+	<value value="15" name="A7XX_PERF_RB_C_READ"/>
+	<value value="16" name="A7XX_PERF_RB_C_WRITE"/>
+	<value value="17" name="A7XX_PERF_RB_TOTAL_PASS"/>
+	<value value="18" name="A7XX_PERF_RB_Z_PASS"/>
+	<value value="19" name="A7XX_PERF_RB_Z_FAIL"/>
+	<value value="20" name="A7XX_PERF_RB_S_FAIL"/>
+	<value value="21" name="A7XX_PERF_RB_BLENDED_FXP_COMPONENTS"/>
+	<value value="22" name="A7XX_PERF_RB_BLENDED_FP16_COMPONENTS"/>
+	<value value="23" name="A7XX_PERF_RB_PS_INVOCATIONS"/>
+	<value value="24" name="A7XX_PERF_RB_2D_ALIVE_CYCLES"/>
+	<value value="25" name="A7XX_PERF_RB_2D_STARVE_CYCLES_SP"/>
+	<value value="26" name="A7XX_PERF_RB_2D_VALID_PIXELS"/>
+	<value value="27" name="A7XX_PERF_RB_3D_PIXELS"/>
+	<value value="28" name="A7XX_PERF_RB_BLENDER_WORKING_CYCLES"/>
+	<value value="29" name="A7XX_PERF_RB_ZPROC_WORKING_CYCLES"/>
+	<value value="30" name="A7XX_PERF_RB_CPROC_WORKING_CYCLES"/>
+	<value value="31" name="A7XX_PERF_RB_SAMPLER_WORKING_CYCLES"/>
+	<value value="32" name="A7XX_PERF_RB_STALL_CYCLES_CCU_COLOR_READ"/>
+	<value value="33" name="A7XX_PERF_RB_STALL_CYCLES_CCU_COLOR_WRITE"/>
+	<value value="34" name="A7XX_PERF_RB_STALL_CYCLES_CCU_DEPTH_READ"/>
+	<value value="35" name="A7XX_PERF_RB_STALL_CYCLES_CCU_DEPTH_WRITE"/>
+	<value value="36" name="A7XX_PERF_RB_STALL_CYCLES_VPC_BE"/>
+	<value value="37" name="A7XX_PERF_RB_BLENDED_FP32_COMPONENTS"/>
+	<value value="38" name="A7XX_PERF_RB_COLOR_PIX_TILES"/>
+	<value value="39" name="A7XX_PERF_RB_STALL_CYCLES_CCU"/>
+	<value value="40" name="A7XX_PERF_RB_EARLY_Z_ARB3_GRANT"/>
+	<value value="41" name="A7XX_PERF_RB_LATE_Z_ARB3_GRANT"/>
+	<value value="42" name="A7XX_PERF_RB_EARLY_Z_SKIP_GRANT"/>
+	<value value="43" name="A7XX_PERF_RB_VRS_1X1_QUADS"/>
+	<value value="44" name="A7XX_PERF_RB_VRS_2X1_QUADS"/>
+	<value value="45" name="A7XX_PERF_RB_VRS_1X2_QUADS"/>
+	<value value="46" name="A7XX_PERF_RB_VRS_2X2_QUADS"/>
+	<value value="47" name="A7XX_PERF_RB_VRS_2X4_QUADS"/>
+	<value value="48" name="A7XX_PERF_RB_VRS_4X2_QUADS"/>
+	<value value="49" name="A7XX_PERF_RB_VRS_4X4_QUADS"/>
+</enum>
+
+<enum name="a7xx_vsc_perfcounter_select">
+	<value value="0" name="A7XX_PERF_VSC_NEVER_COUNT"/>
+	<value value="1" name="A7XX_PERF_VSC_BUSY_CYCLES"/>
+	<value value="2" name="A7XX_PERF_VSC_WORKING_CYCLES"/>
+	<value value="3" name="A7XX_PERF_VSC_STALL_CYCLES_UCHE"/>
+	<value value="4" name="A7XX_PERF_VSC_EOT_NUM"/>
+	<value value="5" name="A7XX_PERF_VSC_INPUT_TILES"/>
+	<value value="6" name="A7XX_PERF_VSC_TILE_COMP_TRAN"/>
+	<value value="7" name="A7XX_PERF_VSC_TILE_BYPASS_TRAN"/>
+</enum>
+
+<enum name="a7xx_ccu_perfcounter_select">
+	<value value="0" name="A7XX_PERF_CCU_NEVER_COUNT"/>
+	<value value="1" name="A7XX_PERF_CCU_BUSY_CYCLES"/>
+	<value value="2" name="A7XX_PERF_CCU_STALL_CYCLES_RB_DEPTH_RETURN"/>
+	<value value="3" name="A7XX_PERF_CCU_STALL_CYCLES_RB_COLOR_RETURN"/>
+	<value value="4" name="A7XX_PERF_CCU_DEPTH_BLOCKS"/>
+	<value value="5" name="A7XX_PERF_CCU_COLOR_BLOCKS"/>
+	<value value="6" name="A7XX_PERF_CCU_DEPTH_BLOCK_HIT"/>
+	<value value="7" name="A7XX_PERF_CCU_COLOR_BLOCK_HIT"/>
+	<value value="8" name="A7XX_PERF_CCU_PARTIAL_BLOCK_READ"/>
+	<value value="9" name="A7XX_PERF_CCU_GMEM_READ"/>
+	<value value="10" name="A7XX_PERF_CCU_GMEM_WRITE"/>
+	<value value="11" name="A7XX_PERF_CCU_2D_RD_REQ"/>
+	<value value="12" name="A7XX_PERF_CCU_2D_WR_REQ"/>
+	<value value="13" name="A7XX_PERF_CCU_UBWC_COLOR_BLOCKS_CONCURRENT"/>
+	<value value="14" name="A7XX_PERF_CCU_UBWC_DEPTH_BLOCKS_CONCURRENT"/>
+	<value value="15" name="A7XX_PERF_CCU_COLOR_RESOLVE_DROPPED"/>
+	<value value="16" name="A7XX_PERF_CCU_DEPTH_RESOLVE_DROPPED"/>
+	<value value="17" name="A7XX_PERF_CCU_COLOR_RENDER_CONCURRENT"/>
+	<value value="18" name="A7XX_PERF_CCU_DEPTH_RENDER_CONCURRENT"/>
+	<value value="19" name="A7XX_PERF_CCU_COLOR_RESOLVE_AFTER_RENDER"/>
+	<value value="20" name="A7XX_PERF_CCU_DEPTH_RESOLVE_AFTER_RENDER"/>
+	<value value="21" name="A7XX_PERF_CCU_GMEM_EXTRA_DEPTH_READ"/>
+	<value value="22" name="A7XX_PERF_CCU_GMEM_COLOR_READ_4AA"/>
+	<value value="23" name="A7XX_PERF_CCU_GMEM_COLOR_READ_4AA_FULL"/>
+	<value value="24" name="A7XX_PERF_CCU_COLOR_EVB_STALL"/>
+	<value value="25" name="A7XX_PERF_CCU_RENDER_OVERLAP_CRE_C"/>
+	<value value="26" name="A7XX_PERF_CCU_RENDER_OVERLAP_CRE_Z"/>
+	<value value="27" name="A7XX_PERF_CCU_RENDER_STALL_BY_CRE_C"/>
+	<value value="28" name="A7XX_PERF_CCU_RENDER_STALL_BY_CRE_Z"/>
+	<value value="29" name="A7XX_PERF_CCU_FULL_SURFACE_RESOLVE_CYCLES"/>
+	<value value="30" name="A7XX_PERF_CCU_RENDER_OVERLAP_FULL_SURFACE_RESOLVE"/>
+	<value value="31" name="A7XX_PERF_CCU_STALL_BY_FULL_SURFACE_RESOLVE"/>
+	<value value="32" name="A7XX_PERF_CCU_RESERVED_32"/>
+	<value value="33" name="A7XX_PERF_CCU_RESERVED_33"/>
+	<value value="34" name="A7XX_PERF_CCU_RESERVED_34"/>
+	<value value="35" name="A7XX_PERF_CCU_RESERVED_35"/>
+	<value value="36" name="A7XX_PERF_CCU_RESERVED_36"/>
+	<value value="37" name="A7XX_PERF_CCU_RESERVED_37"/>
+	<value value="38" name="A7XX_PERF_CCU_RESERVED_38"/>
+	<value value="39" name="A7XX_PERF_CCU_RESERVED_39"/>
+	<value value="40" name="A7XX_PERF_CCU_RESERVED_40"/>
+	<value value="41" name="A7XX_PERF_CCU_RESERVED_41"/>
+	<value value="42" name="A7XX_PERF_CCU_RESERVED_42"/>
+	<value value="43" name="A7XX_PERF_CCU_RESERVED_43"/>
+	<value value="44" name="A7XX_PERF_CCU_RESERVED_44"/>
+	<value value="45" name="A7XX_PERF_CCU_RESERVED_45"/>
+	<value value="46" name="A7XX_PERF_CCU_RESERVED_46"/>
+	<value value="47" name="A7XX_PERF_CCU_RESERVED_47"/>
+	<value value="48" name="A7XX_PERF_CCU_RESERVED_48"/>
+	<value value="49" name="A7XX_PERF_CCU_RESERVED_49"/>
+	<value value="50" name="A7XX_PERF_CCU_RESERVED_50"/>
+	<value value="51" name="A7XX_PERF_CCU_RESERVED_51"/>
+	<value value="52" name="A7XX_PERF_CCU_RESERVED_52"/>
+	<value value="53" name="A7XX_PERF_CCU_RESERVED_53"/>
+	<value value="54" name="A7XX_PERF_CCU_RESERVED_54"/>
+	<value value="55" name="A7XX_PERF_CCU_RESERVED_55"/>
+	<value value="56" name="A7XX_PERF_CCU_RESERVED_56"/>
+	<value value="57" name="A7XX_PERF_CCU_RESERVED_57"/>
+	<value value="58" name="A7XX_PERF_CCU_RESERVED_58"/>
+	<value value="59" name="A7XX_PERF_CCU_RESERVED_59"/>
+	<value value="60" name="A7XX_PERF_CCU_RESERVED_60"/>
+	<value value="61" name="A7XX_PERF_CCU_RESERVED_61"/>
+	<value value="62" name="A7XX_PERF_CCU_RESERVED_62"/>
+	<value value="63" name="A7XX_PERF_CCU_RESERVED_63"/>
+	<value value="64" name="A7XX_PERF_UFC_L0_TP_HINT_REQUESTS"/>
+	<value value="65" name="A7XX_PERF_UFC_L0_TP_HINT_TAG_MISS"/>
+	<value value="66" name="A7XX_PERF_UFC_L0_TP_HINT_TAG_HIT_RDY"/>
+	<value value="67" name="A7XX_PERF_UFC_L0_TP_HINT_TAG_HIT_NRDY"/>
+	<value value="68" name="A7XX_PERF_UFC_L0_TP_HINT_IS_FCLEAR"/>
+	<value value="69" name="A7XX_PERF_UFC_L0_TP_HINT_IS_ALPHA0"/>
+	<value value="70" name="A7XX_PERF_UFC_L0_TP_HINT_IS_ALPHA1"/>
+	<value value="71" name="A7XX_PERF_UFC_L0_TP_HINT_IS_UNCOMP"/>
+	<value value="72" name="A7XX_PERF_UFC_L0_SP_REQUESTS"/>
+	<value value="73" name="A7XX_PERF_UFC_L0_SP_FILTER_HIT"/>
+	<value value="74" name="A7XX_PERF_UFC_L0_SP_FILTER_MISS"/>
+	<value value="75" name="A7XX_PERF_UFC_L0_SP_REQ_STALLED_CYCLES"/>
+	<value value="76" name="A7XX_PERF_UFC_L0_TP_REQ_STALLED_CYCLES"/>
+	<value value="77" name="A7XX_PERF_UFC_L0_TP_RTN_STALLED_CYCLES"/>
+	<value value="78" name="A7XX_PERF_CCU_RESERVED_78"/>
+	<value value="79" name="A7XX_PERF_CCU_RESERVED_79"/>
+	<value value="80" name="A7XX_PERF_CCU_RESERVED_80"/>
+	<value value="81" name="A7XX_PERF_CCU_RESERVED_81"/>
+	<value value="82" name="A7XX_PERF_CCU_RESERVED_82"/>
+	<value value="83" name="A7XX_PERF_CCU_RESERVED_83"/>
+	<value value="84" name="A7XX_PERF_CCU_RESERVED_84"/>
+	<value value="85" name="A7XX_PERF_CCU_RESERVED_85"/>
+	<value value="86" name="A7XX_PERF_CCU_RESERVED_86"/>
+	<value value="87" name="A7XX_PERF_CCU_RESERVED_87"/>
+	<value value="88" name="A7XX_PERF_CCU_RESERVED_88"/>
+	<value value="89" name="A7XX_PERF_CCU_RESERVED_89"/>
+	<value value="90" name="A7XX_PERF_CCU_RESERVED_90"/>
+	<value value="91" name="A7XX_PERF_CCU_RESERVED_91"/>
+	<value value="92" name="A7XX_PERF_CCU_RESERVED_92"/>
+	<value value="93" name="A7XX_PERF_CCU_RESERVED_93"/>
+	<value value="94" name="A7XX_PERF_CCU_RESERVED_94"/>
+	<value value="95" name="A7XX_PERF_CCU_RESERVED_95"/>
+	<value value="96" name="A7XX_PERF_CCU_RESERVED_96"/>
+	<value value="97" name="A7XX_PERF_CCU_RESERVED_97"/>
+	<value value="98" name="A7XX_PERF_CCU_RESERVED_98"/>
+	<value value="99" name="A7XX_PERF_CCU_RESERVED_99"/>
+	<value value="100" name="A7XX_PERF_CCU_RESERVED_100"/>
+	<value value="101" name="A7XX_PERF_CCU_RESERVED_101"/>
+	<value value="102" name="A7XX_PERF_CCU_RESERVED_102"/>
+	<value value="103" name="A7XX_PERF_CCU_RESERVED_103"/>
+	<value value="104" name="A7XX_PERF_CCU_RESERVED_104"/>
+	<value value="105" name="A7XX_PERF_CCU_RESERVED_105"/>
+	<value value="106" name="A7XX_PERF_CCU_RESERVED_106"/>
+	<value value="107" name="A7XX_PERF_CCU_RESERVED_107"/>
+	<value value="108" name="A7XX_PERF_CCU_RESERVED_108"/>
+	<value value="109" name="A7XX_PERF_CCU_RESERVED_109"/>
+	<value value="110" name="A7XX_PERF_CCU_RESERVED_110"/>
+	<value value="111" name="A7XX_PERF_CCU_RESERVED_111"/>
+	<value value="112" name="A7XX_PERF_CCU_RESERVED_112"/>
+	<value value="113" name="A7XX_PERF_CCU_RESERVED_113"/>
+	<value value="114" name="A7XX_PERF_CCU_RESERVED_114"/>
+	<value value="115" name="A7XX_PERF_CCU_RESERVED_115"/>
+	<value value="116" name="A7XX_PERF_CCU_RESERVED_116"/>
+	<value value="117" name="A7XX_PERF_CCU_RESERVED_117"/>
+	<value value="118" name="A7XX_PERF_CCU_RESERVED_118"/>
+	<value value="119" name="A7XX_PERF_CCU_RESERVED_119"/>
+	<value value="120" name="A7XX_PERF_CCU_RESERVED_120"/>
+	<value value="121" name="A7XX_PERF_CCU_RESERVED_121"/>
+	<value value="122" name="A7XX_PERF_CCU_RESERVED_122"/>
+	<value value="123" name="A7XX_PERF_CCU_RESERVED_123"/>
+	<value value="124" name="A7XX_PERF_CCU_RESERVED_124"/>
+	<value value="125" name="A7XX_PERF_CCU_RESERVED_125"/>
+	<value value="126" name="A7XX_PERF_CCU_RESERVED_126"/>
+	<value value="127" name="A7XX_PERF_CCU_RESERVED_127"/>
+	<value value="128" name="A7XX_PERF_CRE_RESOLVE_EVENTS"/>
+	<value value="129" name="A7XX_PERF_CRE_CONCURRENT_RESOLVE_EVENTS"/>
+	<value value="130" name="A7XX_PERF_CRE_DROPPED_CLEAR_EVENTS"/>
+	<value value="131" name="A7XX_PERF_CRE_ST_BLOCKS_CONCURRENT"/>
+	<value value="132" name="A7XX_PERF_CRE_LRZ_ST_BLOCKS_CONCURRENT"/>
+	<value value="133" name="A7XX_PERF_CRE_SP_UFC_PREFETCH_REQUESTS"/>
+	<value value="134" name="A7XX_PERF_CRE_RESOLVE_CDP_PREFETCH_REQUESTS"/>
+	<value value="135" name="A7XX_PERF_CRE_RESOLVE_UFC_PREFETCH_REQUESTS"/>
+	<value value="136" name="A7XX_PERF_CRE_DR_UFC_PREFTCH_REQUESTS"/>
+</enum>
+
+<enum name="a7xx_lrz_perfcounter_select">
+	<value value="0" name="A7XX_PERF_LRZ_NEVER_COUNT"/>
+	<value value="1" name="A7XX_PERF_LRZ_BUSY_CYCLES"/>
+	<value value="2" name="A7XX_PERF_LRZ_STARVE_CYCLES_RAS"/>
+	<value value="3" name="A7XX_PERF_LRZ_STALL_CYCLES_RB"/>
+	<value value="4" name="A7XX_PERF_LRZ_STALL_CYCLES_VSC"/>
+	<value value="5" name="A7XX_PERF_LRZ_STALL_CYCLES_VPC_BE"/>
+	<value value="6" name="A7XX_PERF_LRZ_STALL_CYCLES_FLAG_ACR"/>
+	<value value="7" name="A7XX_PERF_LRZ_STALL_CYCLES_UCHE"/>
+	<value value="8" name="A7XX_PERF_LRZ_LRZ_READ"/>
+	<value value="9" name="A7XX_PERF_LRZ_LRZ_WRITE"/>
+	<value value="10" name="A7XX_PERF_LRZ_READ_LATENCY"/>
+	<value value="11" name="A7XX_PERF_LRZ_MERGE_CACHE_UPDATING"/>
+	<value value="12" name="A7XX_PERF_LRZ_PRIM_KILLED_BY_MASKGEN"/>
+	<value value="13" name="A7XX_PERF_LRZ_PRIM_KILLED_BY_LRZ"/>
+	<value value="14" name="A7XX_PERF_LRZ_VISIBLE_PRIM_AFTER_LRZ"/>
+	<value value="15" name="A7XX_PERF_LRZ_FULL_8X8_TILES"/>
+	<value value="16" name="A7XX_PERF_LRZ_PARTIAL_8X8_TILES"/>
+	<value value="17" name="A7XX_PERF_LRZ_TILE_KILLED"/>
+	<value value="18" name="A7XX_PERF_LRZ_TOTAL_PIXEL"/>
+	<value value="19" name="A7XX_PERF_LRZ_VISIBLE_PIXEL_AFTER_LRZ"/>
+	<value value="20" name="A7XX_PERF_LRZ_FEEDBACK_ACCEPT"/>
+	<value value="21" name="A7XX_PERF_LRZ_FEEDBACK_DISCARD"/>
+	<value value="22" name="A7XX_PERF_LRZ_FEEDBACK_STALL"/>
+	<value value="23" name="A7XX_PERF_LRZ_STALL_CYCLES_RB_ZPLANE"/>
+	<value value="24" name="A7XX_PERF_LRZ_STALL_CYCLES_RB_BPLANE"/>
+	<value value="25" name="A7XX_PERF_LRZ_RAS_MASK_TRANS"/>
+	<value value="26" name="A7XX_PERF_LRZ_STALL_CYCLES_MVC"/>
+	<value value="27" name="A7XX_PERF_LRZ_TILE_KILLED_BY_IMAGE_VRS"/>
+	<value value="28" name="A7XX_PERF_LRZ_TILE_KILLED_BY_Z"/>
+	<value value="29" name="A7XX_PERF_LRZ_STALL_CYCLES_HLSQ_BATCH"/>
+	<value value="30" name="A7XX_PERF_LRZ_NUM_FLOCK"/>
+</enum>
+
+<enum name="a7xx_cmp_perfcounter_select">
+	<value value="0" name="A7XX_PERF_CMPDECMP_NEVER_COUNT"/>
+	<value value="1" name="A7XX_PERF_CMPDECMP_STALL_CYCLES_ARB"/>
+	<value value="2" name="A7XX_PERF_CMPDECMP_VBIF_LATENCY_CYCLES"/>
+	<value value="3" name="A7XX_PERF_CMPDECMP_VBIF_LATENCY_SAMPLES"/>
+	<value value="4" name="A7XX_PERF_CMPDECMP_VBIF_READ_DATA_CCU"/>
+	<value value="5" name="A7XX_PERF_CMPDECMP_VBIF_WRITE_DATA_CCU"/>
+	<value value="6" name="A7XX_PERF_CMPDECMP_VBIF_READ_REQUEST"/>
+	<value value="7" name="A7XX_PERF_CMPDECMP_VBIF_WRITE_REQUEST"/>
+	<value value="8" name="A7XX_PERF_CMPDECMP_VBIF_READ_DATA"/>
+	<value value="9" name="A7XX_PERF_CMPDECMP_VBIF_WRITE_DATA"/>
+	<value value="10" name="A7XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG1_COUNT"/>
+	<value value="11" name="A7XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG2_COUNT"/>
+	<value value="12" name="A7XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG3_COUNT"/>
+	<value value="13" name="A7XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG4_COUNT"/>
+	<value value="14" name="A7XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG5_COUNT"/>
+	<value value="15" name="A7XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG6_COUNT"/>
+	<value value="16" name="A7XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG8_COUNT"/>
+	<value value="17" name="A7XX_PERF_CMPDECMP_COLOR_WRITE_FLAG1_COUNT"/>
+	<value value="18" name="A7XX_PERF_CMPDECMP_COLOR_WRITE_FLAG2_COUNT"/>
+	<value value="19" name="A7XX_PERF_CMPDECMP_COLOR_WRITE_FLAG3_COUNT"/>
+	<value value="20" name="A7XX_PERF_CMPDECMP_COLOR_WRITE_FLAG4_COUNT"/>
+	<value value="21" name="A7XX_PERF_CMPDECMP_COLOR_WRITE_FLAG5_COUNT"/>
+	<value value="22" name="A7XX_PERF_CMPDECMP_COLOR_WRITE_FLAG6_COUNT"/>
+	<value value="23" name="A7XX_PERF_CMPDECMP_COLOR_WRITE_FLAG8_COUNT"/>
+	<value value="24" name="A7XX_PERF_CMPDECMP_VBIF_READ_DATA_UCHE_CH0"/>
+	<value value="25" name="A7XX_PERF_CMPDECMP_VBIF_READ_DATA_UCHE_CH1"/>
+	<value value="26" name="A7XX_PERF_CMPDECMP_VBIF_WRITE_DATA_UCHE"/>
+	<value value="27" name="A7XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG0_COUNT"/>
+	<value value="28" name="A7XX_PERF_CMPDECMP_COLOR_WRITE_FLAG0_COUNT"/>
+	<value value="29" name="A7XX_PERF_CMPDECMP_COLOR_WRITE_FLAGALPHA_COUNT"/>
+	<value value="30" name="A7XX_PERF_CMPDECMP_CDP_FILTER_HIT"/>
+	<value value="31" name="A7XX_PERF_CMPDECMP_CDP_FILTER_MISS"/>
+	<value value="32" name="A7XX_PERF_CMPDECMP_DEPTH_READ_FLAG0_COUNT"/>
+	<value value="33" name="A7XX_PERF_CMPDECMP_DEPTH_READ_FLAG1_COUNT"/>
+	<value value="34" name="A7XX_PERF_CMPDECMP_DEPTH_READ_FLAG2_COUNT"/>
+	<value value="35" name="A7XX_PERF_CMPDECMP_DEPTH_READ_FLAG3_COUNT"/>
+	<value value="36" name="A7XX_PERF_CMPDECMP_DEPTH_READ_FLAG4_COUNT"/>
+	<value value="37" name="A7XX_PERF_CMPDECMP_DEPTH_READ_FLAG5_COUNT"/>
+	<value value="38" name="A7XX_PERF_CMPDECMP_DEPTH_READ_FLAG6_COUNT"/>
+	<value value="39" name="A7XX_PERF_CMPDECMP_DEPTH_READ_FLAG8_COUNT"/>
+	<value value="40" name="A7XX_PERF_CMPDECMP_COLOR_READ_FLAG0_COUNT"/>
+	<value value="41" name="A7XX_PERF_CMPDECMP_COLOR_READ_FLAG1_COUNT"/>
+	<value value="42" name="A7XX_PERF_CMPDECMP_COLOR_READ_FLAG2_COUNT"/>
+	<value value="43" name="A7XX_PERF_CMPDECMP_COLOR_READ_FLAG3_COUNT"/>
+	<value value="44" name="A7XX_PERF_CMPDECMP_COLOR_READ_FLAG4_COUNT"/>
+	<value value="45" name="A7XX_PERF_CMPDECMP_COLOR_READ_FLAG5_COUNT"/>
+	<value value="46" name="A7XX_PERF_CMPDECMP_COLOR_READ_FLAG6_COUNT"/>
+	<value value="47" name="A7XX_PERF_CMPDECMP_COLOR_READ_FLAG8_COUNT"/>
+</enum>
+
+<enum name="a7xx_gbif_perfcounter_select">
+	<value value="0" name="A7XX_PERF_GBIF_NEVER_COUNT"/>
+	<value value="1" name="A7XX_PERF_GBIF_RESERVED_1"/>
+	<value value="2" name="A7XX_PERF_GBIF_RESERVED_2"/>
+	<value value="3" name="A7XX_PERF_GBIF_RESERVED_3"/>
+	<value value="4" name="A7XX_PERF_GBIF_RESERVED_4"/>
+	<value value="5" name="A7XX_PERF_GBIF_RESERVED_5"/>
+	<value value="6" name="A7XX_PERF_GBIF_RESERVED_6"/>
+	<value value="7" name="A7XX_PERF_GBIF_RESERVED_7"/>
+	<value value="8" name="A7XX_PERF_GBIF_RESERVED_8"/>
+	<value value="9" name="A7XX_PERF_GBIF_RESERVED_9"/>
+	<value value="10" name="A7XX_PERF_GBIF_AXI0_READ_REQUESTS_TOTAL"/>
+	<value value="11" name="A7XX_PERF_GBIF_AXI1_READ_REQUESTS_TOTAL"/>
+	<value value="12" name="A7XX_PERF_GBIF_RESERVED_12"/>
+	<value value="13" name="A7XX_PERF_GBIF_RESERVED_13"/>
+	<value value="14" name="A7XX_PERF_GBIF_RESERVED_14"/>
+	<value value="15" name="A7XX_PERF_GBIF_RESERVED_15"/>
+	<value value="16" name="A7XX_PERF_GBIF_RESERVED_16"/>
+	<value value="17" name="A7XX_PERF_GBIF_RESERVED_17"/>
+	<value value="18" name="A7XX_PERF_GBIF_RESERVED_18"/>
+	<value value="19" name="A7XX_PERF_GBIF_RESERVED_19"/>
+	<value value="20" name="A7XX_PERF_GBIF_RESERVED_20"/>
+	<value value="21" name="A7XX_PERF_GBIF_RESERVED_21"/>
+	<value value="22" name="A7XX_PERF_GBIF_AXI0_WRITE_REQUESTS_TOTAL"/>
+	<value value="23" name="A7XX_PERF_GBIF_AXI1_WRITE_REQUESTS_TOTAL"/>
+	<value value="24" name="A7XX_PERF_GBIF_RESERVED_24"/>
+	<value value="25" name="A7XX_PERF_GBIF_RESERVED_25"/>
+	<value value="26" name="A7XX_PERF_GBIF_RESERVED_26"/>
+	<value value="27" name="A7XX_PERF_GBIF_RESERVED_27"/>
+	<value value="28" name="A7XX_PERF_GBIF_RESERVED_28"/>
+	<value value="29" name="A7XX_PERF_GBIF_RESERVED_29"/>
+	<value value="30" name="A7XX_PERF_GBIF_RESERVED_30"/>
+	<value value="31" name="A7XX_PERF_GBIF_RESERVED_31"/>
+	<value value="32" name="A7XX_PERF_GBIF_RESERVED_32"/>
+	<value value="33" name="A7XX_PERF_GBIF_RESERVED_33"/>
+	<value value="34" name="A7XX_PERF_GBIF_AXI0_READ_DATA_BEATS_TOTAL"/>
+	<value value="35" name="A7XX_PERF_GBIF_AXI1_READ_DATA_BEATS_TOTAL"/>
+	<value value="36" name="A7XX_PERF_GBIF_RESERVED_36"/>
+	<value value="37" name="A7XX_PERF_GBIF_RESERVED_37"/>
+	<value value="38" name="A7XX_PERF_GBIF_RESERVED_38"/>
+	<value value="39" name="A7XX_PERF_GBIF_RESERVED_39"/>
+	<value value="40" name="A7XX_PERF_GBIF_RESERVED_40"/>
+	<value value="41" name="A7XX_PERF_GBIF_RESERVED_41"/>
+	<value value="42" name="A7XX_PERF_GBIF_RESERVED_42"/>
+	<value value="43" name="A7XX_PERF_GBIF_RESERVED_43"/>
+	<value value="44" name="A7XX_PERF_GBIF_RESERVED_44"/>
+	<value value="45" name="A7XX_PERF_GBIF_RESERVED_45"/>
+	<value value="46" name="A7XX_PERF_GBIF_AXI0_WRITE_DATA_BEATS_TOTAL"/>
+	<value value="47" name="A7XX_PERF_GBIF_AXI1_WRITE_DATA_BEATS_TOTAL"/>
+	<value value="48" name="A7XX_PERF_GBIF_RESERVED_48"/>
+	<value value="49" name="A7XX_PERF_GBIF_RESERVED_49"/>
+	<value value="50" name="A7XX_PERF_GBIF_RESERVED_50"/>
+	<value value="51" name="A7XX_PERF_GBIF_RESERVED_51"/>
+	<value value="52" name="A7XX_PERF_GBIF_RESERVED_52"/>
+	<value value="53" name="A7XX_PERF_GBIF_RESERVED_53"/>
+	<value value="54" name="A7XX_PERF_GBIF_RESERVED_54"/>
+	<value value="55" name="A7XX_PERF_GBIF_RESERVED_55"/>
+	<value value="56" name="A7XX_PERF_GBIF_RESERVED_56"/>
+	<value value="57" name="A7XX_PERF_GBIF_RESERVED_57"/>
+	<value value="58" name="A7XX_PERF_GBIF_RESERVED_58"/>
+	<value value="59" name="A7XX_PERF_GBIF_RESERVED_59"/>
+	<value value="60" name="A7XX_PERF_GBIF_RESERVED_60"/>
+	<value value="61" name="A7XX_PERF_GBIF_RESERVED_61"/>
+	<value value="62" name="A7XX_PERF_GBIF_RESERVED_62"/>
+	<value value="63" name="A7XX_PERF_GBIF_RESERVED_63"/>
+	<value value="64" name="A7XX_PERF_GBIF_RESERVED_64"/>
+	<value value="65" name="A7XX_PERF_GBIF_RESERVED_65"/>
+	<value value="66" name="A7XX_PERF_GBIF_RESERVED_66"/>
+	<value value="67" name="A7XX_PERF_GBIF_RESERVED_67"/>
+	<value value="68" name="A7XX_PERF_GBIF_CYCLES_CH0_HELD_OFF_RD_ALL"/>
+	<value value="69" name="A7XX_PERF_GBIF_CYCLES_CH1_HELD_OFF_RD_ALL"/>
+	<value value="70" name="A7XX_PERF_GBIF_CYCLES_CH0_HELD_OFF_WR_ALL"/>
+	<value value="71" name="A7XX_PERF_GBIF_CYCLES_CH1_HELD_OFF_WR_ALL"/>
+	<value value="72" name="A7XX_PERF_GBIF_AXI_CH0_REQUEST_HELD_OFF"/>
+	<value value="73" name="A7XX_PERF_GBIF_AXI_CH1_REQUEST_HELD_OFF"/>
+	<value value="74" name="A7XX_PERF_GBIF_AXI_REQUEST_HELD_OFF"/>
+	<value value="75" name="A7XX_PERF_GBIF_AXI_CH0_WRITE_DATA_HELD_OFF"/>
+	<value value="76" name="A7XX_PERF_GBIF_AXI_CH1_WRITE_DATA_HELD_OFF"/>
+	<value value="77" name="A7XX_PERF_GBIF_AXI_ALL_WRITE_DATA_HELD_OFF"/>
+	<value value="78" name="A7XX_PERF_GBIF_RESERVED_78"/>
+	<value value="79" name="A7XX_PERF_GBIF_RESERVED_79"/>
+	<value value="80" name="A7XX_PERF_GBIF_RESERVED_80"/>
+	<value value="81" name="A7XX_PERF_GBIF_RESERVED_81"/>
+	<value value="82" name="A7XX_PERF_GBIF_RESERVED_82"/>
+	<value value="83" name="A7XX_PERF_GBIF_RESERVED_83"/>
+	<value value="84" name="A7XX_PERF_GBIF_RESERVED_84"/>
+	<value value="85" name="A7XX_PERF_GBIF_RESERVED_85"/>
+	<value value="86" name="A7XX_PERF_GBIF_RESERVED_86"/>
+	<value value="87" name="A7XX_PERF_GBIF_RESERVED_87"/>
+	<value value="88" name="A7XX_PERF_GBIF_RESERVED_88"/>
+	<value value="89" name="A7XX_PERF_GBIF_RESERVED_89"/>
+	<value value="90" name="A7XX_PERF_GBIF_RESERVED_90"/>
+	<value value="91" name="A7XX_PERF_GBIF_RESERVED_91"/>
+	<value value="92" name="A7XX_PERF_GBIF_RESERVED_92"/>
+	<value value="93" name="A7XX_PERF_GBIF_RESERVED_93"/>
+	<value value="94" name="A7XX_PERF_GBIF_RESERVED_94"/>
+	<value value="95" name="A7XX_PERF_GBIF_RESERVED_95"/>
+	<value value="96" name="A7XX_PERF_GBIF_RESERVED_96"/>
+	<value value="97" name="A7XX_PERF_GBIF_RESERVED_97"/>
+	<value value="98" name="A7XX_PERF_GBIF_RESERVED_98"/>
+	<value value="99" name="A7XX_PERF_GBIF_RESERVED_99"/>
+	<value value="100" name="A7XX_PERF_GBIF_RESERVED_100"/>
+	<value value="101" name="A7XX_PERF_GBIF_RESERVED_101"/>
+	<value value="102" name="A7XX_PERF_GBIF_RESERVED_102"/>
+	<value value="103" name="A7XX_PERF_GBIF_RESERVED_103"/>
+	<value value="104" name="A7XX_PERF_GBIF_RESERVED_104"/>
+	<value value="105" name="A7XX_PERF_GBIF_RESERVED_105"/>
+	<value value="106" name="A7XX_PERF_GBIF_RESERVED_106"/>
+	<value value="107" name="A7XX_PERF_GBIF_RESERVED_107"/>
+	<value value="108" name="A7XX_PERF_GBIF_RESERVED_108"/>
+	<value value="109" name="A7XX_PERF_GBIF_RESERVED_109"/>
+	<value value="110" name="A7XX_PERF_GBIF_RESERVED_110"/>
+	<value value="111" name="A7XX_PERF_GBIF_RESERVED_111"/>
+	<value value="112" name="A7XX_PERF_GBIF_RESERVED_112"/>
+	<value value="113" name="A7XX_PERF_GBIF_RESERVED_113"/>
+	<value value="114" name="A7XX_PERF_GBIF_RESERVED_114"/>
+	<value value="115" name="A7XX_PERF_GBIF_RESERVED_115"/>
+	<value value="116" name="A7XX_PERF_GBIF_RESERVED_116"/>
+	<value value="117" name="A7XX_PERF_GBIF_RESERVED_117"/>
+	<value value="118" name="A7XX_PERF_GBIF_RESERVED_118"/>
+	<value value="119" name="A7XX_PERF_GBIF_RESERVED_119"/>
+	<value value="120" name="A7XX_PERF_GBIF_RESERVED_120"/>
+	<value value="121" name="A7XX_PERF_GBIF_RESERVED_121"/>
+	<value value="122" name="A7XX_PERF_GBIF_RESERVED_122"/>
+	<value value="123" name="A7XX_PERF_GBIF_RESERVED_123"/>
+	<value value="124" name="A7XX_PERF_GBIF_RESERVED_124"/>
+	<value value="125" name="A7XX_PERF_GBIF_RESERVED_125"/>
+	<value value="126" name="A7XX_PERF_GBIF_RESERVED_126"/>
+	<value value="127" name="A7XX_PERF_GBIF_RESERVED_127"/>
+	<value value="128" name="A7XX_PERF_GBIF_RESERVED_128"/>
+	<value value="129" name="A7XX_PERF_GBIF_RESERVED_129"/>
+	<value value="130" name="A7XX_PERF_GBIF_RESERVED_130"/>
+	<value value="131" name="A7XX_PERF_GBIF_RESERVED_131"/>
+	<value value="132" name="A7XX_PERF_GBIF_RESERVED_132"/>
+	<value value="133" name="A7XX_PERF_GBIF_RESERVED_133"/>
+	<value value="134" name="A7XX_PERF_GBIF_RESERVED_134"/>
+	<value value="135" name="A7XX_PERF_GBIF_RESERVED_135"/>
+	<value value="136" name="A7XX_PERF_GBIF_RESERVED_136"/>
+	<value value="137" name="A7XX_PERF_GBIF_RESERVED_137"/>
+	<value value="138" name="A7XX_PERF_GBIF_RESERVED_138"/>
+	<value value="139" name="A7XX_PERF_GBIF_RESERVED_139"/>
+	<value value="140" name="A7XX_PERF_GBIF_RESERVED_140"/>
+	<value value="141" name="A7XX_PERF_GBIF_RESERVED_141"/>
+	<value value="142" name="A7XX_PERF_GBIF_RESERVED_142"/>
+	<value value="143" name="A7XX_PERF_GBIF_RESERVED_143"/>
+	<value value="144" name="A7XX_PERF_GBIF_RESERVED_144"/>
+	<value value="145" name="A7XX_PERF_GBIF_RESERVED_145"/>
+	<value value="146" name="A7XX_PERF_GBIF_RESERVED_146"/>
+	<value value="147" name="A7XX_PERF_GBIF_RESERVED_147"/>
+	<value value="148" name="A7XX_PERF_GBIF_RESERVED_148"/>
+	<value value="149" name="A7XX_PERF_GBIF_RESERVED_149"/>
+	<value value="150" name="A7XX_PERF_GBIF_RESERVED_150"/>
+	<value value="151" name="A7XX_PERF_GBIF_RESERVED_151"/>
+	<value value="152" name="A7XX_PERF_GBIF_RESERVED_152"/>
+	<value value="153" name="A7XX_PERF_GBIF_RESERVED_153"/>
+	<value value="154" name="A7XX_PERF_GBIF_RESERVED_154"/>
+	<value value="155" name="A7XX_PERF_GBIF_RESERVED_155"/>
+	<value value="156" name="A7XX_PERF_GBIF_RESERVED_156"/>
+	<value value="157" name="A7XX_PERF_GBIF_READ_BEAT_ALL_CHANNELS"/>
+	<value value="158" name="A7XX_PERF_GBIF_WRITE_BEAT_ALL_CHANNELS"/>
+	<value value="159" name="A7XX_PERF_GBIF_READ_AND_WRITE_BEAT_ALL_CHANNELS"/>
+	<value value="160" name="A7XX_PERF_GBIF_RSC0_REQUESTS_TOTAL"/>
+	<value value="161" name="A7XX_PERF_GBIF_RSC1_REQUESTS_TOTAL"/>
+</enum>
+
+<enum name="a7xx_ufc_perfcounter_select">
+	<value value="0" name="A7XX_PERF_UFC_NEVER_COUNT"/>
+	<value value="1" name="A7XX_PERF_UFC_BUSY_CYCLES"/>
+	<value value="2" name="A7XX_PERF_UFC_READ_DATA_VBIF"/>
+	<value value="3" name="A7XX_PERF_UFC_WRITE_DATA_VBIF"/>
+	<value value="4" name="A7XX_PERF_UFC_READ_REQUEST_VBIF"/>
+	<value value="5" name="A7XX_PERF_UFC_WRITE_REQUEST_VBIF"/>
+	<value value="6" name="A7XX_PERF_UFC_MAIN_HIT_CRE_PREFETCH"/>
+	<value value="7" name="A7XX_PERF_UFC_MAIN_HIT_SP_PREFETCH"/>
+	<value value="8" name="A7XX_PERF_UFC_MAIN_HIT_TP_PREFETCH"/>
+	<value value="9" name="A7XX_PERF_UFC_MAIN_HIT_UBWC_READ"/>
+	<value value="10" name="A7XX_PERF_UFC_MAIN_HIT_UBWC_WRITE"/>
+	<value value="11" name="A7XX_PERF_UFC_MAIN_MISS_CRE_PREFETCH"/>
+	<value value="12" name="A7XX_PERF_UFC_MAIN_MISS_SP_PREFETCH"/>
+	<value value="13" name="A7XX_PERF_UFC_MAIN_MISS_TP_PREFETCH"/>
+	<value value="14" name="A7XX_PERF_UFC_MAIN_MISS_UBWC_READ"/>
+	<value value="15" name="A7XX_PERF_UFC_MAIN_MISS_UBWC_WRITE"/>
+	<value value="16" name="A7XX_PERF_UFC_MAIN_UBWC_RD_NRDY"/>
+	<value value="17" name="A7XX_PERF_UFC_MAIN_UBWC_RD_RDY"/>
+	<value value="18" name="A7XX_PERF_UFC_MAIN_TP_RD_NRDY"/>
+	<value value="19" name="A7XX_PERF_UFC_MAIN_TP_RD_RDY"/>
+	<value value="20" name="A7XX_PERF_UFC_STALL_CYCLES_GBIF_CMD"/>
+	<value value="21" name="A7XX_PERF_UFC_STALL_CYCLES_GBIF_RDATA"/>
+	<value value="22" name="A7XX_PERF_UFC_STALL_CYCLES_GBIF_WDATA"/>
+	<value value="23" name="A7XX_PERF_UFC_STALL_CYCLES_UBWC_WR_FLAG"/>
+	<value value="24" name="A7XX_PERF_UFC_STALL_CYCLES_UBWC_FLAG_RTN"/>
+	<value value="25" name="A7XX_PERF_UFC_STALL_CYCLES_UBWC_EVENT"/>
+	<value value="26" name="A7XX_PERF_UFC_UBWC_REQ_STALLED_CYCLES"/>
+	<value value="27" name="A7XX_PERF_UFC_UBWC_RD_STALLED_CYCLES"/>
+	<value value="28" name="A7XX_PERF_UFC_UBWC_WR_STALLED_CYCLES"/>
+	<value value="29" name="A7XX_PERF_UFC_PREFETCH_STALLED_CYCLES"/>
+	<value value="30" name="A7XX_PERF_UFC_EVICTION_STALLED_CYCLES"/>
+	<value value="31" name="A7XX_PERF_UFC_LOCK_STALLED_CYCLES"/>
+	<value value="32" name="A7XX_PERF_UFC_MISS_LATENCY_CYCLES"/>
+	<value value="33" name="A7XX_PERF_UFC_MISS_LATENCY_SAMPLES"/>
+	<value value="34" name="A7XX_PERF_UFC_L1_CRE_REQUESTS"/>
+	<value value="35" name="A7XX_PERF_UFC_L1_CRE_STALLED_CYCLES"/>
+	<value value="36" name="A7XX_PERF_UFC_L1_CRE_FILTER_HIT"/>
+	<value value="37" name="A7XX_PERF_UFC_L1_CRE_FILTER_MISS"/>
+	<value value="38" name="A7XX_PERF_UFC_L1_SP_REQUESTS"/>
+	<value value="39" name="A7XX_PERF_UFC_L1_SP_STALLED_CYCLES"/>
+	<value value="40" name="A7XX_PERF_UFC_L1_SP_FILTER_HIT"/>
+	<value value="41" name="A7XX_PERF_UFC_L1_SP_FILTER_MISS"/>
+	<value value="42" name="A7XX_PERF_UFC_L1_TP_HINT_REQUESTS"/>
+	<value value="43" name="A7XX_PERF_UFC_L1_TP_STALLED_CYCLES"/>
+	<value value="44" name="A7XX_PERF_UFC_L1_TP_HINT_TAG_MISS"/>
+	<value value="45" name="A7XX_PERF_UFC_L1_TP_HINT_TAG_HIT_RDY"/>
+	<value value="46" name="A7XX_PERF_UFC_L1_TP_HINT_TAG_HIT_NRDY"/>
+</enum>
+
 <domain name="A6XX" width="32" prefix="variant" varset="chip">
 	<bitset name="A6XX_RBBM_INT_0_MASK" inline="no" varset="chip">
 		<bitfield name="RBBM_GPU_IDLE" pos="0" type="boolean"/>
@@ -1584,7 +3130,7 @@ to upconvert to 32b float internally?
 	<reg32 offset="0x050e" name="RBBM_PERFCTR_SRAM_INIT_CMD"/>
 	<reg32 offset="0x050f" name="RBBM_PERFCTR_SRAM_INIT_STATUS"/>
 	<reg32 offset="0x0533" name="RBBM_ISDB_CNT"/>
-	<reg32 offset="0x0534" name="RBBM_NC_MODE_CNTL" variants="A7XX-"/>
+	<reg32 offset="0x0534" name="RBBM_NC_MODE_CNTL"/>
 	<reg32 offset="0x0535" name="RBBM_SNAPSHOT_STATUS" variants="A7XX-"/>
 
 	<!---
@@ -2184,13 +3730,28 @@ to upconvert to 32b float internally?
 		<value value="3" name="BUFFERS_IN_SYSMEM"/>
 	</enum>
 
+	<enum name="a6xx_lrz_feedback_mask">
+		<value value="0x0" name="LRZ_FEEDBACK_NONE"/>
+		<value value="0x1" name="LRZ_FEEDBACK_EARLY_Z"/>
+		<value value="0x2" name="LRZ_FEEDBACK_EARLY_LRZ_LATE_Z"/>
+		<!-- We don't have a flag type and this flags combination is often used -->
+		<value value="0x3" name="LRZ_FEEDBACK_EARLY_Z_OR_EARLY_LRZ_LATE_Z"/>
+		<value value="0x4" name="LRZ_FEEDBACK_LATE_Z"/>
+	</enum>
+
 	<reg32 offset="0x80a1" name="GRAS_BIN_CONTROL" usage="rp_blit">
 		<bitfield name="BINW" low="0" high="5" shr="5" type="uint"/>
 		<bitfield name="BINH" low="8" high="14" shr="4" type="uint"/>
 		<bitfield name="RENDER_MODE" low="18" high="20" type="a6xx_render_mode"/>
+		<doc>Disable LRZ feedback writes</doc>
 		<bitfield name="FORCE_LRZ_WRITE_DIS" pos="21" type="boolean"/>
 		<bitfield name="BUFFERS_LOCATION" low="22" high="23" type="a6xx_buffers_location" variants="A6XX"/>
-		<bitfield name="LRZ_FEEDBACK_ZMODE_MASK" low="24" high="26"/>
+		<doc>
+			Allows draws that don't have GRAS_LRZ_CNTL.LRZ_WRITE but have
+			GRAS_LRZ_CNTL.ENABLE to contribute to LRZ during RENDERING pass.
+			In sysmem mode GRAS_LRZ_CNTL.LRZ_WRITE is not considered.
+		</doc>
+		<bitfield name="LRZ_FEEDBACK_ZMODE_MASK" low="24" high="26" type="a6xx_lrz_feedback_mask"/>
 		<bitfield name="UNK27" pos="27"/>
 	</reg32>
 
@@ -2270,7 +3831,7 @@ to upconvert to 32b float internally?
 			- 0.0 if GREATER
 			- 1.0 if LESS
 		</doc>
-		<bitfield name="FC_ENABLE" pos="3" type="boolean"/>
+		<bitfield name="FC_ENABLE" pos="3" type="boolean" variants="A6XX"/>
 		<!-- set when depth-test + depth-write enabled -->
 		<bitfield name="Z_TEST_ENABLE" pos="4" type="boolean"/>
 		<bitfield name="Z_BOUNDS_ENABLE" pos="5" type="boolean"/>
@@ -2284,7 +3845,7 @@ to upconvert to 32b float internally?
 			Disable LRZ based on previous direction and the current one.
 			If DIR_WRITE is not enabled - there is no write to direction buffer.
 		</doc>
-		<bitfield name="DISABLE_ON_WRONG_DIR" pos="9" type="boolean"/>
+		<bitfield name="DISABLE_ON_WRONG_DIR" pos="9" type="boolean" variants="A6XX"/>
 		<bitfield name="Z_FUNC" low="11" high="13" type="adreno_compare_func" variants="A7XX-"/>
 	</reg32>
 
@@ -2357,7 +3918,10 @@ to upconvert to 32b float internally?
 		<bitfield name="BASE_MIP_LEVEL" low="28" high="31" type="uint"/>
 	</reg32>
 
-	<reg32 offset="0x810b" name="GRAS_UNKNOWN_810B" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0x810b" name="GRAS_LRZ_CNTL2" variants="A7XX-" usage="rp_blit">
+		<bitfield name="DISABLE_ON_WRONG_DIR" pos="0" type="boolean"/>
+		<bitfield name="FC_ENABLE" pos="1" type="boolean"/>
+	</reg32>
 
 	<!-- 0x810c-0x810f invalid -->
 
@@ -2366,7 +3930,10 @@ to upconvert to 32b float internally?
 	<!-- A bit tentative but it's a color and it is followed by LRZ_CLEAR -->
 	<reg32 offset="0x8111" name="GRAS_LRZ_CLEAR_DEPTH_F32" type="float" variants="A7XX-"/>
 
-	<reg32 offset="0x8113" name="GRAS_LRZ_DEPTH_BUFFER_INFO" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0x8113" name="GRAS_LRZ_DEPTH_BUFFER_INFO" variants="A7XX-" usage="rp_blit">
+		<bitfield name="DEPTH_FORMAT" low="0" high="2" type="a6xx_depth_format"/>
+		<bitfield name="UNK3" pos="3"/>
+	</reg32>
 
 	<!-- Always written together and always equal 09510840 00000a62 -->
 	<reg32 offset="0x8120" name="GRAS_UNKNOWN_8120" variants="A7XX-" usage="cmd"/>
@@ -2440,7 +4007,7 @@ to upconvert to 32b float internally?
 		<bitfield name="RENDER_MODE" low="18" high="20" type="a6xx_render_mode"/>
 		<bitfield name="FORCE_LRZ_WRITE_DIS" pos="21" type="boolean"/>
 		<bitfield name="BUFFERS_LOCATION" low="22" high="23" type="a6xx_buffers_location"/>
-		<bitfield name="LRZ_FEEDBACK_ZMODE_MASK" low="24" high="26"/>
+		<bitfield name="LRZ_FEEDBACK_ZMODE_MASK" low="24" high="26" type="a6xx_lrz_feedback_mask"/>
 	</reg32>
 
 	<reg32 offset="0x8800" name="RB_BIN_CONTROL" variants="A7XX-" usage="rp_blit">
@@ -2448,7 +4015,7 @@ to upconvert to 32b float internally?
 		<bitfield name="BINH" low="8" high="14" shr="4" type="uint"/>
 		<bitfield name="RENDER_MODE" low="18" high="20" type="a6xx_render_mode"/>
 		<bitfield name="FORCE_LRZ_WRITE_DIS" pos="21" type="boolean"/>
-		<bitfield name="LRZ_FEEDBACK_ZMODE_MASK" low="24" high="26"/>
+		<bitfield name="LRZ_FEEDBACK_ZMODE_MASK" low="24" high="26" type="a6xx_lrz_feedback_mask"/>
 	</reg32>
 
 	<reg32 offset="0x8801" name="RB_RENDER_CNTL" variants="A6XX" usage="rp_blit">
@@ -2927,7 +4494,10 @@ to upconvert to 32b float internally?
 	<reg32 offset="0x8c2d" name="RB_2D_SRC_SOLID_C1" usage="rp_blit"/>
 	<reg32 offset="0x8c2e" name="RB_2D_SRC_SOLID_C2" usage="rp_blit"/>
 	<reg32 offset="0x8c2f" name="RB_2D_SRC_SOLID_C3" usage="rp_blit"/>
-	<!-- 0x8c34-0x8dff invalid -->
+
+	<reg32 offset="0x8c34" name="RB_UNKNOWN_8C34" variants="A7XX-" usage="cmd"/>
+
+	<!-- 0x8c35-0x8dff invalid -->
 
 	<!-- always 0x1 ? either doesn't exist for a650 or write-only: -->
 	<reg32 offset="0x8e01" name="RB_UNKNOWN_8E01" usage="cmd"/>
@@ -4329,7 +5899,12 @@ to upconvert to 32b float internally?
 	<!-- always 0x100000 or 0x1000000? -->
 	<reg32 offset="0xb600" name="TPL1_DBG_ECO_CNTL" low="0" high="25" usage="cmd"/>
 	<reg32 offset="0xb601" name="TPL1_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
-	<reg32 offset="0xb602" name="TPL1_DBG_ECO_CNTL1" usage="cmd"/>
+	<reg32 offset="0xb602" name="TPL1_DBG_ECO_CNTL1" usage="cmd">
+		<!-- Affects UBWC in some way, if BLIT_OP_SCALE is done with this bit set
+		     and if other blit is done without it - UBWC image may be copied incorrectly.
+		 -->
+		<bitfield name="TP_UBWC_FLAG_HINT" pos="18" type="boolean"/>
+	</reg32>
 	<reg32 offset="0xb604" name="TPL1_NC_MODE_CNTL">
 		<bitfield name="MODE" pos="0" type="boolean"/>
 		<bitfield name="LOWER_BIT" low="1" high="2" type="uint"/>
@@ -4351,7 +5926,8 @@ to upconvert to 32b float internally?
 	<reg32 offset="0xb60b" name="TPL1_BICUBIC_WEIGHTS_TABLE_3" low="0" high="29" variants="A7XX" usage="cmd"/>
 	<reg32 offset="0xb60c" name="TPL1_BICUBIC_WEIGHTS_TABLE_4" low="0" high="29" variants="A7XX" usage="cmd"/>
 
-	<array offset="0xb610" name="TPL1_PERFCTR_TP_SEL" stride="1" length="12"/>
+	<array offset="0xb610" name="TPL1_PERFCTR_TP_SEL" stride="1" length="12" variants="A6XX"/>
+	<array offset="0xb610" name="TPL1_PERFCTR_TP_SEL" stride="1" length="18" variants="A7XX"/>
 
 	<!-- TODO: 4 more perfcntr sel at 0xb620 ? -->
 
@@ -4582,15 +6158,15 @@ to upconvert to 32b float internally?
 		<bitfield name="UNK6" pos="6" type="boolean"/>
 	</reg32>
 
-	<reg32 offset="0xbb00" name="HLSQ_DRAW_CMD">
+	<reg32 offset="0xbb00" name="HLSQ_DRAW_CMD" variants="A6XX">
 		<bitfield name="STATE_ID" low="0" high="7"/>
 	</reg32>
 
-	<reg32 offset="0xbb01" name="HLSQ_DISPATCH_CMD">
+	<reg32 offset="0xbb01" name="HLSQ_DISPATCH_CMD" variants="A6XX">
 		<bitfield name="STATE_ID" low="0" high="7"/>
 	</reg32>
 
-	<reg32 offset="0xbb02" name="HLSQ_EVENT_CMD">
+	<reg32 offset="0xbb02" name="HLSQ_EVENT_CMD" variants="A6XX">
 		<!-- I think only the low bit is actually used? -->
 		<bitfield name="STATE_ID" low="16" high="23"/>
 		<bitfield name="EVENT" low="0" high="6" type="vgt_event_type"/>
@@ -4623,6 +6199,19 @@ to upconvert to 32b float internally?
 		<bitfield name="GFX_BINDLESS" low="14" high="18" type="hex"/>
 	</reg32>
 
+	<reg32 offset="0xab1c" name="HLSQ_DRAW_CMD" variants="A7XX-">
+		<bitfield name="STATE_ID" low="0" high="7"/>
+	</reg32>
+
+	<reg32 offset="0xab1d" name="HLSQ_DISPATCH_CMD" variants="A7XX-">
+		<bitfield name="STATE_ID" low="0" high="7"/>
+	</reg32>
+
+	<reg32 offset="0xab1e" name="HLSQ_EVENT_CMD" variants="A7XX-">
+		<bitfield name="STATE_ID" low="16" high="23"/>
+		<bitfield name="EVENT" low="0" high="6" type="vgt_event_type"/>
+	</reg32>
+
 	<reg32 offset="0xab1f" name="HLSQ_INVALIDATE_CMD" variants="A7XX-" usage="cmd">
 		<doc>
 			This register clears pending loads queued up by

-- 
2.31.1

