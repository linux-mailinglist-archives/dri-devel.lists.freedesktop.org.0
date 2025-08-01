Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD75B18701
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 20:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB0B10E8DD;
	Fri,  1 Aug 2025 18:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKlD83Pp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E3C10E8E0
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 18:00:24 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571HfcN0019605
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 18:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=c4KQRsxVztP
 sTBbcxsf/rU0NN9GCrtgWESCaGZHxR9Y=; b=kKlD83PpUsSxT+R9tgtLKssh7oa
 axtF6CJtuTg5VLR1lshYjT5/h82lbogM/aA8syWTCnGjh+JXEDBI9rsaZ0T1Iv6U
 JihWXcgAAaUxL5EV36kx/BSpbuyYFRxK6J0QiTt19S+87SbaeNNWOm7d0nXOr5p3
 QWbz2beTVcQgppV+Ok7D4tlCyFHXAIFcNED1k9B0l+RvIoxFI4ZLxiVjVW1AUio9
 haVhuAL4ZSQHHGvyWvv/oQ+/6GKE+qsfbeMFuTzgJep3tY0OknlZcBvcFzVRqlQo
 KZMKqEnEQIpeBtmWX+IGWLIwT6ayQiu3weljB1rfEHWIFqbBDKGuuOxOs+w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48887g5a0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 18:00:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-31edd69d754so1175481a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 11:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754071222; x=1754676022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c4KQRsxVztPsTBbcxsf/rU0NN9GCrtgWESCaGZHxR9Y=;
 b=Y7LLHLdG6qWRXner34N+Yog6TgEpiDIjmfT96M16+wIO9IR+9plPbYa7nj8XgsD9u0
 cwiPV4yxjhmYb8i4i3pNdwP4egw4NaFQvO8f2+YDzDIAG+d+Yj8tJL2R+RQXn9vrKPWf
 zf6yDeRtWV0KsVPnfNZa9wrDyBcrc3S1wRr8Bj7Z+YzOVuTvnR9EyuIwbKMhr821qL9m
 /kCgzrsJWeGWlUMAdR9Nr+d8q0wnfk72DVQPZ/wMwykvpY8tgk5kLW8U58yGc3nUa5OR
 ckmDeY6JKc9bMkH0nw3sPY7HWetkp1g7BuMJbF3P7mFggubjqU3c/a/7KyS4edcnxwiV
 R7ng==
X-Gm-Message-State: AOJu0YxIfD8Z7d7DjA02yshrgLPMT2mIJSwUXAfg4I9a0wZzsYBL6MGV
 laBcAvhh52aBNE1c8QNyA2rFBDExZPoCmA0TZmG0EYN0kVnJNgtPMyFY0FY7/quqruyseW2zaDh
 0jjUIP6UdiYNyU2khhZbBZwuzyFNt9rv2v1f0uZ5l5COYDfP4FOuo5wx4fM9EejtRMA8MpnbaQ+
 iicgs=
X-Gm-Gg: ASbGnctHWxOl6JPwUfNJYabab/FvqZoCYLTutqrODEL5n3EszS4oHperGmgGowYUfOw
 FyA5QGDLnNVhCjIRZH1Fnbdx9IZMF6y/gjttTByuRkOd3hyKxa9s9WT85O22esQWu7bTYbEe2c+
 KahifAjE4iRO6afHldIcu8zhIHf0DzRKySeoKrvSJUYojAV42KadS0ZP2DsgVqy/46DlnxomCJL
 RXtSfteFee3azRAP60V5VhTt9s25JoSECpKlFkdhVH4VbgqVSXMOtqw/PTxBAE7vwpKi4UaseU2
 leulIvJ5Wwls8PmDlp/yITgVn2+sMpx6xqUENgL6emRwJShhav8=
X-Received: by 2002:a17:90b:1d4c:b0:312:959:dc42 with SMTP id
 98e67ed59e1d1-321161f13afmr971398a91.11.1754071222046; 
 Fri, 01 Aug 2025 11:00:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuZ5/YHyU5W5/PGpq9mfkW8lN3EVfPrvr2fz5DIS9QKgNMf1X1fXg1DmF3I6ux4H1PpGawMA==
X-Received: by 2002:a17:90b:1d4c:b0:312:959:dc42 with SMTP id
 98e67ed59e1d1-321161f13afmr971344a91.11.1754071221443; 
 Fri, 01 Aug 2025 11:00:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b422bb0be58sm3946576a12.57.2025.08.01.11.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 11:00:20 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 5/7] drm/msm: Fix a7xx debugbus read
Date: Fri,  1 Aug 2025 11:00:02 -0700
Message-ID: <20250801180009.345662-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
References: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vdn3PEp9 c=1 sm=1 tr=0 ts=688d00b7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=aM-jV3debDdmslfU2skA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: SurKIlkNWezoLeJ_JGryaicd-f03FpQa
X-Proofpoint-GUID: SurKIlkNWezoLeJ_JGryaicd-f03FpQa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEzOCBTYWx0ZWRfXwNdb+V0X+Qny
 6F9zkAu6mSV4m+G1fEiIQslVt2T+QRACpY0EJcZ8vhTbLH1pjgKCM6YEViGghmVzCXH7PVr/MsF
 6YUvBbqYoU7K4f4x2Z0Rh4sohlfj1tLtwLjuRpfkjCY1NAbwE7y/trgZ+PHOWICgzImBSrZG1f0
 TMl0vQoIPS9ZtSI3MLEe8oO6TZgESO5tzrYNr984CN2pnkHjAp6JVCGDIt7XQU8xsPDRcuBncxD
 N57j7stplee7SOgqE9OgtCh2luF4M0udArvGCbf1FlbjaNv7MGh9cEV/SN0N2zvVO1ZGRtZa9zg
 bTICZzkG+006bh75M1fP2oYKICtWlt72i5t2rPfTj4vdiHe5Mdg9VeHk0Tv/0nq2s3yLggGJnTF
 gwbHj9wka0L1cRfecy9Q1v+dn4ThrT+ONerh8b40NQj5gO2UUj2uIxCxqHTa77lqxw8PAIQp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010138
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

The bitfield positions changed in a7xx.

v2: Don't open-code the bitfield building
v3: Also fix cx_debugbus

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   | 32 ++++++++++++++-----
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 14 +++++++-
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 173c14f215a7..2c7a52fb0b9b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -174,8 +174,15 @@ static int a6xx_crashdumper_run(struct msm_gpu *gpu,
 static int debugbus_read(struct msm_gpu *gpu, u32 block, u32 offset,
 		u32 *data)
 {
-	u32 reg = A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
-		A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	u32 reg;
+
+	if (to_adreno_gpu(gpu)->info->family >= ADRENO_7XX_GEN1) {
+		reg = A7XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
+			A7XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	} else {
+		reg = A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
+			A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	}
 
 	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_A, reg);
 	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_B, reg);
@@ -198,11 +205,18 @@ static int debugbus_read(struct msm_gpu *gpu, u32 block, u32 offset,
 	readl((ptr) + ((offset) << 2))
 
 /* read a value from the CX debug bus */
-static int cx_debugbus_read(void __iomem *cxdbg, u32 block, u32 offset,
+static int cx_debugbus_read(struct msm_gpu *gpu, void __iomem *cxdbg, u32 block, u32 offset,
 		u32 *data)
 {
-	u32 reg = A6XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_INDEX(offset) |
-		A6XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_BLK_SEL(block);
+	u32 reg;
+
+	if (to_adreno_gpu(gpu)->info->family >= ADRENO_7XX_GEN1) {
+		reg = A7XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_INDEX(offset) |
+			A7XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_BLK_SEL(block);
+	} else {
+		reg = A6XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_INDEX(offset) |
+			A6XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_BLK_SEL(block);
+	}
 
 	cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_A, reg);
 	cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_B, reg);
@@ -315,7 +329,8 @@ static void a6xx_get_debugbus_block(struct msm_gpu *gpu,
 		ptr += debugbus_read(gpu, block->id, i, ptr);
 }
 
-static void a6xx_get_cx_debugbus_block(void __iomem *cxdbg,
+static void a6xx_get_cx_debugbus_block(struct msm_gpu *gpu,
+		void __iomem *cxdbg,
 		struct a6xx_gpu_state *a6xx_state,
 		const struct a6xx_debugbus_block *block,
 		struct a6xx_gpu_state_obj *obj)
@@ -330,7 +345,7 @@ static void a6xx_get_cx_debugbus_block(void __iomem *cxdbg,
 	obj->handle = block;
 
 	for (ptr = obj->data, i = 0; i < block->count; i++)
-		ptr += cx_debugbus_read(cxdbg, block->id, i, ptr);
+		ptr += cx_debugbus_read(gpu, cxdbg, block->id, i, ptr);
 }
 
 static void a6xx_get_debugbus_blocks(struct msm_gpu *gpu,
@@ -526,7 +541,8 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
 			int i;
 
 			for (i = 0; i < nr_cx_debugbus_blocks; i++)
-				a6xx_get_cx_debugbus_block(cxdbg,
+				a6xx_get_cx_debugbus_block(gpu,
+					cxdbg,
 					a6xx_state,
 					&cx_debugbus_blocks[i],
 					&a6xx_state->cx_debugbus[i]);
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index d860fd94feae..86fab2750ba7 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -594,10 +594,14 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0600" name="DBGC_CFG_DBGBUS_SEL_A"/>
 	<reg32 offset="0x0601" name="DBGC_CFG_DBGBUS_SEL_B"/>
 	<reg32 offset="0x0602" name="DBGC_CFG_DBGBUS_SEL_C"/>
-	<reg32 offset="0x0603" name="DBGC_CFG_DBGBUS_SEL_D">
+	<reg32 offset="0x0603" name="DBGC_CFG_DBGBUS_SEL_D" variants="A6XX">
 		<bitfield high="7" low="0" name="PING_INDEX"/>
 		<bitfield high="15" low="8" name="PING_BLK_SEL"/>
 	</reg32>
+	<reg32 offset="0x0603" name="DBGC_CFG_DBGBUS_SEL_D" variants="A7XX-">
+		<bitfield high="7" low="0" name="PING_INDEX"/>
+		<bitfield high="24" low="16" name="PING_BLK_SEL"/>
+	</reg32>
 	<reg32 offset="0x0604" name="DBGC_CFG_DBGBUS_CNTLT">
 		<bitfield high="5" low="0" name="TRACEEN"/>
 		<bitfield high="14" low="12" name="GRANU"/>
@@ -3796,6 +3800,14 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0030" name="CFG_DBGBUS_TRACE_BUF2"/>
 </domain>
 
+<domain name="A7XX_CX_DBGC" width="32">
+	<!-- Bitfields shifted, but otherwise the same: -->
+	<reg32 offset="0x0000" name="CFG_DBGBUS_SEL_A" variants="A7XX-">
+		<bitfield high="7" low="0" name="PING_INDEX"/>
+		<bitfield high="24" low="16" name="PING_BLK_SEL"/>
+	</reg32>
+</domain>
+
 <domain name="A6XX_CX_MISC" width="32" prefix="variant" varset="chip">
 	<reg32 offset="0x0001" name="SYSTEM_CACHE_CNTL_0"/>
 	<reg32 offset="0x0002" name="SYSTEM_CACHE_CNTL_1"/>
-- 
2.50.1

