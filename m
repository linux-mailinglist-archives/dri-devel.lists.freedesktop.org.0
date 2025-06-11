Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC97AD5383
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 13:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59EAA10E626;
	Wed, 11 Jun 2025 11:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQLqZHu4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E97210E623
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 11:16:18 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BAncdC002606
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 11:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 V3j1uc9440Aqe3s91zqfhD9O3nYuGwVY1biiyW8GV5w=; b=cQLqZHu4SR959/cD
 TVEoC9cM62pYtKr1pOEuu/dPCBJVrmgCV6r3nt+B9H/IJRBngV3bpbKVaauWrxOX
 NtI1FB6Q6bB3lP7NKFPMkU8JssHjvBolmsvNzUfGKlFAULd04wl1UrbHMZeCVVlF
 IzmIwYfEmm1NEwm/iB6Ww8iyai/spB8TU/Jr+ddaClhfyh6KYyzpWP6BZWG6OiFo
 AQLFwV/ZNvBF1HeEYsRPEIi+o65cNUhxxyWJs2KIOgu8OG1iq3iMKUIq/q+7MViH
 weR4MJ5JpLqaEqIMbvol54w/Q/S+Zdh0lg7VziYOsPT2Zk3QfxgZKSmmCwJv3Mhz
 VNY2Ww==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4778cwg24m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 11:16:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-747cebffd4eso5175685b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 04:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749640576; x=1750245376;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V3j1uc9440Aqe3s91zqfhD9O3nYuGwVY1biiyW8GV5w=;
 b=EB5kMD3B/3YlpBXN86hme//hjnfbY/q6h0RSj3OK/wDDrlsFPltaMlR1SifUD/scw4
 F+iqGlVy1ms+ISAjbuSnPnrETcLj4S2SQK23CrVAIcCQY0w5gs2J7YyPNaNjCA+grBMM
 qs4qxo0RqZvdSJXkQ7hxqZBkMXqexlnTLAVSWIq9RmBKhJaumohsL++0MaRFAIihSm2D
 XsbUFSLrrz05ithex9/DJYupcYb2SQVJK7//oRzKEZTqc3ANbNA13SfAgP/LVw74HAZZ
 wgbNmc/fKfuVqenKgunQEawaHfDzwQ78VwKSrcIfKkEX+1MNPb413gAPop4pdPUFAR8y
 wAEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUeSv6rih6UCIwy2JXR6GctNuYioQNX7tWYWpXOEA1Ruq3+QDsVrGoOH08eP3F6EX1tYb4h/kcj2Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPsSDyuW8BPNgS/NsQPweL3jan+l7fLd1SOZAb5Ek9GZXFog/4
 Yo+K1fiYEiOLBjyNYLz+gAi0RzXszFPu10GU/gcmQ+n8/Z0ZZ0sSoDKS6TaDV8S3udDdihKRDnn
 aXFRkUvL/5lebC7sS/zroTZleP1fz+QTydZm0VLpVUtYJoUl9O2Yg6mCTK9N/h/CV10yC2pg=
X-Gm-Gg: ASbGnctTnlVbhrdM7RCdSlEUL/EV+kDvYOzb5otCWa4llyjhXKftgHt/hiqp+KmDrgt
 62vMznsSJfAT6/a5QA92RqeyZx0idzVn3syJEv0BFJ4IBxCzA+FV/yHZdJh0qNFvSQjIzq5kSZZ
 0A5pe1CZx9TXY/NPM2OefmKBRmouZZLblZEsaEGppXKfmLV2VleXUecg1yOUnXn4Rmud+Reg2IJ
 Cea1fYlAZ4OX/iyasC6KFDnMBoTydCcxRfRxKvr2My8A9pqQYH76C+4MzwT9rc5/0a48pxctVd0
 hvl+J/FkW7S8FozsBAS4dk82nP8KIuvc
X-Received: by 2002:a05:6a00:3e18:b0:740:aa31:fe66 with SMTP id
 d2e1a72fcca58-7486cb59a04mr3951284b3a.4.1749640576371; 
 Wed, 11 Jun 2025 04:16:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAG34Pvkev4y/hpRlus2OjuQHXtSd81WCCELRlR9luC9dphyxucxaLNk7Bj0pfHjdJyK31pg==
X-Received: by 2002:a05:6a00:3e18:b0:740:aa31:fe66 with SMTP id
 d2e1a72fcca58-7486cb59a04mr3951226b3a.4.1749640575915; 
 Wed, 11 Jun 2025 04:16:15 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0e9d57sm8820772b3a.160.2025.06.11.04.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 04:16:15 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 16:45:33 +0530
Subject: [PATCH v2 3/4] drm/msm/adreno: Add Adreno X1-45 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-x1p-adreno-v2-3-5074907bebbd@oss.qualcomm.com>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
In-Reply-To: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749640547; l=2022;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=+s4ITcXnEPYZYROUKwHmQyjB4wKU/KPjLzqOm960DLE=;
 b=1BufoQl+K2Mq+EwIqeygORUYFrLK7REnSATB3nejAesVra4H4dodAXHO6ddF72x+zhVjfsmKF
 jPpmZU5C+rVDlrz0Lfd80Nhf8eY9DdVkZHaoRrQdu7TxWUm3e+ZDLWa
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=AaixH2XG c=1 sm=1 tr=0 ts=68496581 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=25T8ekUwwafyqMypFLMA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 7_Mxcw0NanePse1Si5_ktE0CXI9tj5aw
X-Proofpoint-GUID: 7_Mxcw0NanePse1Si5_ktE0CXI9tj5aw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5NiBTYWx0ZWRfX3na39/ZNreWB
 d3LDaufYGvEEjKF5QETc9JG1pRXcD28bzT6B6mwc1HQ6udHElU3rYvdYncrBKF5a7JnlY34KaRg
 rWa4QbIMG2jS1NjfKuOWHajhiL4nyGY1VZF/W9KFoK2U/oRsFg9y6ZQYbW5JDhmkKemUGmNeZoE
 z/MWxoqsYKXxXPKsSLlrOUFIcJyI/eMZyBkELJo7ekf2brz5cQCDUrmX11YQ29YiumIb9OirZTI
 LTgzKMxHqmAe167qzQsxwQqBIzWQG9E197L3ehpDIav76vvqk+Aen3pTeL4aiEFbe39X9M1J8PZ
 7jj+pDVWPkQburw8aMtlx8dKpAy6QGhpS//KEZs0KTpsqJqGOytxfRiSRqb60e51byctuqBvKpR
 FcQw8t04B3MDQqQNoEz6eYBV1N3TY+ftJyYAmCJRGg1HYPBq65VhOG6BJjpXnr2uCu4M3zuz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110096
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

Add support for Adreno X1-45 GPU present Snapdragon X1P42100
series of compute chipsets. This GPU is a smaller version of
X1-85 GPU with lower core count and smaller internal memories.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 38 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 70f7ad806c34076352d84f32d62c2833422b6e5e..2db748ce7df57a9151ed1e7f1b025a537bb5f653 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1474,6 +1474,44 @@ static const struct adreno_info a7xx_gpus[] = {
 			},
 		},
 		.preempt_record_size = 3572 * SZ_1K,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x43030c00),
+		.family = ADRENO_7XX_GEN2,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen71500_sqe.fw",
+			[ADRENO_FW_GMU] = "gen71500_gmu.bin",
+		},
+		.gmem = SZ_1M + SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION,
+		.init = a6xx_gpu_init,
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a740_hwcg,
+			.protect = &a730_protect,
+			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.gmu_chipid = 0x70f0000,
+			.gmu_cgc_mode = 0x00020222,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(3),
+					.perfmode_bw = 16500000,
+				},
+				{ /* sentinel */ },
+			},
+		},
+		.preempt_record_size = 4192 * SZ_1K,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 294, 1 },
+			{ 263, 2 },
+			{ 141, 3 },
+		),
 	}
 };
 DECLARE_ADRENO_GPULIST(a7xx);

-- 
2.48.1

