Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40160B14FC7
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 16:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A335C10E65E;
	Tue, 29 Jul 2025 14:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g6wM7N4l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAC510E65D
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:50 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T88I1O003999
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=V9+fcbz7W94
 r3G/u7UQJHN/TfdQW561mZf8p47PIeZU=; b=g6wM7N4lQvCzapGTjsB24ecQdnP
 AZKmCtkvjBv21XGHYm8aWaC+7I76LlAa2KB9QE8lCJvj8qwgnFfprxqu86+uw/WG
 FmQiSjoc5ug0xhf88AG5LhRtKEmAgulTy/1cn4tRNff1OvmFxN+gznutqPG9sGHF
 x+vlR73Y1jpcIKBdTvVH6RMXS8EiSvu/Za1cARBm9L4u0XO3xM/+o1pOobtct5Vq
 grnn4JEVp+dspPJ/18t9WcQHWDfc8zkB1b2Ye6/cAXTD4nVo9PIFr+ULuZH3agAO
 TNLen4WvhzPmqFop6LZq102scGiPpbq3m1ltK/r2T6FAZ4QfyXNp5FbySTA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2gek7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-235c897d378so68754575ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 07:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753801068; x=1754405868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V9+fcbz7W94r3G/u7UQJHN/TfdQW561mZf8p47PIeZU=;
 b=skEDUFez8kVpNJwINYuROWJIZ6bofQpeCFgb3uQu74eBCrLEEZOuTyiKzhxzi29uGJ
 5OTsj3BHjXbOGSwd5TxAHp47eZmdU6dQApqDlwMhHaYql+rFZBB23nWgZfPcO+3T7Bgq
 vCW5zWvfsHvU9v8Phw1OATW5hwk+nQ1THnQLlmaYHfrkgHT+DIJfyVmecTPtok8nD8/T
 8/TQ4WED+yaRuHaLhxkGx/xCdOD0Zd4K20v5CaSw+mLO+4HLdGnW7zxCwcVCOMh0lwjW
 qQ1hAXoNMk19XXrj5pG+kvEFvvv9eq/9/oZ3xlUmG9aewhsI3/zAE9uwHkJQnGxWnqEH
 p7uA==
X-Gm-Message-State: AOJu0Yxgx6a1BKa3BvvqtezjI1C2EKLcQmYCrAeQIJVqIQAowayJhVqk
 xfWiJ68kijWVvbvDNNgHpbPH/y1RougFuYehlDjMGcIp+nrprnwdP9piQmLluGh777bblWa2ZAm
 nyxRu2rShg23t1n5X34vwg855iFKd2U1GiBkSXo2+TEwgibv9ENVtSU83epqe2xd2pyt8ZObwdF
 rF5dQ=
X-Gm-Gg: ASbGncvZpsElK3ggtYfVnv0XV9gFVBPBrujFd2u+CnglkiDmeM7xcdUM2bZptZ9kD9A
 173TbRpwGWq/DoHbckDDclfA7clGCi8APQ2ZkEyMrTlKkT7mIisd6+Jan/iUEe1lL9MI1mz4+Nv
 1hRsFAY1Qx1HQSJm/TKV5JNqQAEfjyRJv/YfD9rGhwFAsNqhmAveidtroQEOKZEiec3h+szKmQA
 QBIrGax0GzDN+gKjL4Y6rR00m9hTz2xa+pQ0SOawrH5eNrPiwgJhbwhBTpSrXfOxiIUZAakoRYb
 F8VCy5wn/Ec4p94+VBuIaLKY2SyyXnJZ0UpJHGgsomKAbSb2/bc=
X-Received: by 2002:a17:903:2451:b0:240:92d1:5cd3 with SMTP id
 d9443c01a7336-24092d165cbmr2863275ad.20.1753801067900; 
 Tue, 29 Jul 2025 07:57:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjD1LFBD1KVpA0YlTQXKqialrZE77rREWeWa02W98WBwqwV+/tbJVbfbaFAXRlp8TRRBpndg==
X-Received: by 2002:a17:903:2451:b0:240:92d1:5cd3 with SMTP id
 d9443c01a7336-24092d165cbmr2862505ad.20.1753801067077; 
 Tue, 29 Jul 2025 07:57:47 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24025f5a3ecsm49977215ad.136.2025.07.29.07.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 07:57:46 -0700 (PDT)
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
Subject: [PATCH v2 7/7] drm/msm: Fix a7xx TPL1 cluster snapshot
Date: Tue, 29 Jul 2025 07:57:24 -0700
Message-ID: <20250729145729.10905-8-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
References: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CgUQjtwvlk-2tyutBH41tIE2akcQnQCZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDExNCBTYWx0ZWRfXxt832HetglsS
 YZz5VDQsfyVfyS38EEpDD2/N3xx0gGgnkJ3NR7ZW3HK2g0iG7O5nPRAnNQ4yFk7VIeDvM6rcsR+
 NwwxnKPSoWE5V64wkmoEZ+oryg+LBpe5ipSvtq5mBMb7M6s4dgJWhSA2r2IvyXYKg469oG1vkMD
 okt9OLS8j/S1r4Ywa24VZrRyy9UYlFzvKo1ZaCFbkstJb2s7rSzup3jKNZFv7L3m/4zX3aQaUM1
 s2BJU3wHkaRIympQsKO6BgvRGM+m9yGXntYeD0kcoz+VqT9h6uU1zbDj8e4MNbngJQfrJ28g8Uv
 07XmdViTz0AYHqf+cnLcspQt9fZbVzvtWi+6VFl+l5My6DFsnW3twHkiJRh9UkcVUF5PW4rvYpW
 QfAO0G/y4SiHnbNDuwLl/K62JKqXIOmfgcuwDPnNEp8u8kF9UmXVOdTWz6qVlg5KcfSFEv31
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=6888e16d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=zhZQclFZcvAaLIcfx54A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: CgUQjtwvlk-2tyutBH41tIE2akcQnQCZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290114
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

Later gens have both a PIPE_BR and PIPE_NONE section.  The snapshot tool
seems to expect this for x1-85 as well.  I guess this was just a bug in
downstream kgsl, which went unnoticed?

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h | 11 +++++++++--
 drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h |  2 ++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
index afcc7498983f..04b49d385f9d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
@@ -668,12 +668,19 @@ static const u32 gen7_0_0_sp_noncontext_pipe_lpac_usptp_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_noncontext_pipe_lpac_usptp_registers), 8));
 
-/* Block: TPl1 Cluster: noncontext Pipeline: A7XX_PIPE_BR */
-static const u32 gen7_0_0_tpl1_noncontext_pipe_br_registers[] = {
+/* Block: TPl1 Cluster: noncontext Pipeline: A7XX_PIPE_NONE */
+static const u32 gen7_0_0_tpl1_noncontext_pipe_none_registers[] = {
 	0x0b600, 0x0b600, 0x0b602, 0x0b602, 0x0b604, 0x0b604, 0x0b608, 0x0b60c,
 	0x0b60f, 0x0b621, 0x0b630, 0x0b633,
 	UINT_MAX, UINT_MAX,
 };
+static_assert(IS_ALIGNED(sizeof(gen7_0_0_tpl1_noncontext_pipe_none_registers), 8));
+
+/* Block: TPl1 Cluster: noncontext Pipeline: A7XX_PIPE_BR */
+static const u32 gen7_0_0_tpl1_noncontext_pipe_br_registers[] = {
+	 0x0b600, 0x0b600,
+	 UINT_MAX, UINT_MAX,
+};
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_tpl1_noncontext_pipe_br_registers), 8));
 
 /* Block: TPl1 Cluster: noncontext Pipeline: A7XX_PIPE_LPAC */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
index 6569f12bf12f..772652eb61f3 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
@@ -573,6 +573,8 @@ static const struct gen7_sptp_cluster_registers gen7_2_0_sptp_clusters[] = {
 		gen7_0_0_sp_noncontext_pipe_lpac_usptp_registers, 0xaf80 },
 	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
 		gen7_0_0_tpl1_noncontext_pipe_br_registers, 0xb600 },
+	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_NONE, 0, A7XX_USPTP,
+		gen7_0_0_tpl1_noncontext_pipe_none_registers, 0xb600 },
 	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_LPAC, 0, A7XX_USPTP,
 		gen7_0_0_tpl1_noncontext_pipe_lpac_registers, 0xb780 },
 	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_STATE,
-- 
2.50.1

