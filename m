Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377EDB0B5DC
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 14:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A3310E371;
	Sun, 20 Jul 2025 12:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="S2nGre/c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256D210E366
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:12 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K4pRnc019181
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iodIgk/L8QB4ge9Y+/jSW8XFUE8s1k9FL5byuKE4NvM=; b=S2nGre/cXuPhUyvS
 OHjhKyqQkk8+CikNXs2Dn2+cnxDmzDg3GyqgNYFTeH0c1NPu6fso6/9R+fLt6o+2
 f5jJRUgmwqDK4UmrAbuV49BYmBP97ruJsXnd+JCH9lKXgj43WagjC9cf0a2+uIi/
 cNfg1pAzN594hCrHdCIV48za/EEVxLyTs0g4ASB0eHJ+nwCtRcVXMOQvwDRBMmov
 vTQYrFLP0MOinP3o58/aJ7vjJQY4WjfndDY3zez0FIdfJmfZmmwt+GMe8Zh8G1tc
 lIt0eNuJdnL+RQa7M963ySea9dWXi4X8qX9Ond161rwaVkk9H0mzBAd5Pa+wiMRd
 P7JziA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804hmj40c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7494999de28so4728022b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 05:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013831; x=1753618631;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iodIgk/L8QB4ge9Y+/jSW8XFUE8s1k9FL5byuKE4NvM=;
 b=Sshp+hw5ExMN1vH3U/JtX5sOT6AAyhwSbLCM657geN7F8XPwsj/1ZRkTV69c/nJYo7
 Z/iyuYtAVFzAff63jrg/UeMKqgXYu3yR4HzXyGzXtQdtaUOGYV7dgel3QDmZDMFwtLaC
 fXNBRruE4eBELa+/N5tfs1lUyZCoK5RBV62IfKVHAezqe13MOYqAZNdT1sS4F3zI10bg
 w/X9Ga6PBI/uYRFUk29yIQj1y9gZC7wZBLaVCfS4wV2yngK20ZlsOGBtHhH2fnqLKckJ
 kZgNDRJaGD9K8Zw8jZQ32ruPQJDYazMU+yp7IJZxe8BIubOSx0MXwqAfofXYyJE6ru9L
 jnNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuJTmhuyR88r0MmC7XDcvPYm9A56gVkbf7h7RgHM+rS5jPaMd4D9qTpJ8X2iTdLKehF3NVXr3aqHc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyg4QKyE7HpdxpyDkNAj7NLJmNAgDxuB2ShgcseyD0yqvYQ+Arc
 N60r6lHZ2uFuED8nvPWJbFIAGs1NRrNR15H7m28Ms5cUzrZUv0ZzHp0GqyTGqPjTtwZGO9Vq/0p
 qNZKUYag0MyZDe0b4zMaNB2ydlrRuBM/qce2GBKaCNK6qLz/JZfpBntLR3zlkVrfxmeSB39c=
X-Gm-Gg: ASbGncvG9b902t+sd5oW0k8wMGaEXmN/qKYXbGbhulVV+ZqwobxJqitzLIPK5Zj+Tn0
 mM9LKs36qMgmvhEUNtyarA8bn13CjjJ5UGQHz7+cLjtxAxS616ExYw0PHFRVeNqzHNYYlt0sX9h
 z/hYaj6flZ9gf9iVlLpTUEO6UxmFTHriOQhZGpEv9RdvGbYc6/x5fV5DRSzOwSier85vH2woYoB
 epYltCsoHIEdkFTe/xD2MEa542xj637z3/643nsKGfgPb8v3cqYYgL3mohprQPBGj4BMtkzqO3+
 GgWQ9T76O2ifL56tBbm41pZrR5UwQJcOQ52GxEJKC9/q44GTgpRQ4LsdB3n54NEW
X-Received: by 2002:a05:6a00:bd93:b0:751:6ff5:df35 with SMTP id
 d2e1a72fcca58-758492e7360mr21100159b3a.8.1753013830625; 
 Sun, 20 Jul 2025 05:17:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/CXB44kkPPPn7fl486Zg4Gshdd/qJ9odt44ajNXKqNQtvHzEfy+qVaVf9sbWGquP8YOhZkg==
X-Received: by 2002:a05:6a00:bd93:b0:751:6ff5:df35 with SMTP id
 d2e1a72fcca58-758492e7360mr21100112b3a.8.1753013830078; 
 Sun, 20 Jul 2025 05:17:10 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:17:09 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:06 +0530
Subject: [PATCH 05/17] drm/msm/a6xx: Fix PDC sleep sequence
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-5-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=4069;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=z+NQFcUOlBBJ4DQEQXpJKA9QI7YpwGdG8wbRFqQ/bb8=;
 b=rsUSAlAzVOIW2BjmLa8jLaadNUl1ZlR3UfgTXqzEB13F1QSizKzMr6SvFnED++obtYCLs2gGR
 6UyinetYUluB6JRGy8COHDciHcr/XUsoptGlZPtedaYUva0OMFFcvlg
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 6OC6UCbaDp1jdK9cQnlvPTDT0dYDEEOD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExNyBTYWx0ZWRfXyuv+SnuQGoVn
 spid9KywmHktbHU10jLUxhiveStH3mip5vTAQ3/d5w0XfPkjwNreKPliSP1tvUbDLCeLRQqImkL
 PxQpWc++uIoMX4EcvS3P457e3Iqt1VU0C186IcExVhLKLkP9Fmatish6VJL5OM1PFK70OY5b9EW
 4fUCc5FJtuwUz35+D8Gka72bArJ77mjWBJ3dvVs8KXKejLJkkN+R8pxTsLvdQtPPBqRYSwWsbWm
 ArTQ1L97HXjN7MAVUPl8av2VX7vlHEeVOYsJuSt3ukCm9PAxs4VNR+49Br/ZbDvk5xFUimeF9o+
 SIDhgNaMrmhYyc4dyVG3rW1yXMUM4yQ+Sby+OCq6WezYPR9UtJEpUPnG4IpCiIhQnjanElhTzqX
 JXTIFeJvl2pFPsT46qG8EKOdHpex172GNFaC3zUHtJKto20v0UaPwrXkgn8+7Z+9A7N7YJMJ
X-Authority-Analysis: v=2.4 cv=Navm13D4 c=1 sm=1 tr=0 ts=687cde47 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=R1CZgRJynTePKTnkIkwA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 6OC6UCbaDp1jdK9cQnlvPTDT0dYDEEOD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200117
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

Since the PDC resides out of the GPU subsystem and cannot be reset in
case it enters bad state, utmost care must be taken to trigger the PDC
wake/sleep routines in the correct order.

The PDC wake sequence can be exercised only after a PDC sleep sequence.
Additionally, GMU firmware should initialize a few registers before the
KMD can trigger a PDC sleep sequence. So PDC sleep can't be done if the
GMU firmware has not initialized. Track these dependencies using a new
status variable and trigger PDC sleep/wake sequences appropriately.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 30 +++++++++++++++++++-----------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  6 ++++++
 2 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 3bebb6dd7059782ceca29f2efd2acee24d3fc930..4d6c70735e0892ed87d6a68d64f24bda844e5e16 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -279,6 +279,8 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
 	if (ret)
 		DRM_DEV_ERROR(gmu->dev, "GMU firmware initialization timed out\n");
 
+	set_bit(GMU_STATUS_FW_START, &gmu->status);
+
 	return ret;
 }
 
@@ -528,6 +530,9 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
 	int ret;
 	u32 val;
 
+	if (!test_and_clear_bit(GMU_STATUS_PDC_SLEEP, &gmu->status))
+		return 0;
+
 	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, BIT(1));
 
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_RSCC_CONTROL_ACK, val,
@@ -555,6 +560,11 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
 	int ret;
 	u32 val;
 
+	if (test_and_clear_bit(GMU_STATUS_FW_START, &gmu->status))
+		return;
+
+	/* TODO: should we skip if IFPC is not enabled */
+
 	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1);
 
 	ret = gmu_poll_timeout_rscc(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0,
@@ -563,6 +573,8 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
 		DRM_DEV_ERROR(gmu->dev, "Unable to power off the GPU RSC\n");
 
 	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 0);
+
+	set_bit(GMU_STATUS_PDC_SLEEP, &gmu->status);
 }
 
 static inline void pdc_write(void __iomem *ptr, u32 offset, u32 value)
@@ -691,8 +703,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	/* ensure no writes happen before the uCode is fully written */
 	wmb();
 
-	a6xx_rpmh_stop(gmu);
-
 err:
 	if (!IS_ERR_OR_NULL(pdcptr))
 		iounmap(pdcptr);
@@ -852,19 +862,15 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	else
 		gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
 
-	if (state == GMU_WARM_BOOT) {
-		ret = a6xx_rpmh_start(gmu);
-		if (ret)
-			return ret;
-	} else {
+	ret = a6xx_rpmh_start(gmu);
+	if (ret)
+		return ret;
+
+	if (state == GMU_COLD_BOOT) {
 		if (WARN(!adreno_gpu->fw[ADRENO_FW_GMU],
 			"GMU firmware is not loaded\n"))
 			return -ENOENT;
 
-		ret = a6xx_rpmh_start(gmu);
-		if (ret)
-			return ret;
-
 		ret = a6xx_gmu_fw_load(gmu);
 		if (ret)
 			return ret;
@@ -1046,6 +1052,8 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 
 	/* Reset GPU core blocks */
 	a6xx_gpu_sw_reset(gpu, true);
+
+	a6xx_rpmh_stop(gmu);
 }
 
 static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index b2d4489b40249b1916ab4a42c89e3f4bdc5c4af9..034f1b4e5a3fb9cd601bfbe6d06d64e5ace3b6e7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -117,6 +117,12 @@ struct a6xx_gmu {
 
 	struct qmp *qmp;
 	struct a6xx_hfi_msg_bw_table *bw_table;
+
+/* To check if we can trigger sleep seq at PDC. Cleared in a6xx_rpmh_stop() */
+#define GMU_STATUS_FW_START	0
+/* To track if PDC sleep seq was done */
+#define GMU_STATUS_PDC_SLEEP	1
+	unsigned long status;
 };
 
 static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)

-- 
2.50.1

