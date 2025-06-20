Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D61AE1454
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 08:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE3010EB1D;
	Fri, 20 Jun 2025 06:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z7zW9rHg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF9510EB1D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 06:55:27 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JHpjFH024069
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 06:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /cra5HUnd+Onw8p9cvyHZDcLODFatDJov6W4y7HTf2Q=; b=Z7zW9rHgAvjhnm+7
 kYL4yUZtbz0UIW6nnqrODR/VmfF+4C/5FGxkDS/zx7TzGL8C9Ct2iiAdlwdUKpSZ
 SiAukqYqYzbaxcmKz4RTPXLA74cmmJNFYTepJ36kl/Ew21UnfcnQw3wUO7LwPE3E
 w+5A1jmH402taX7tIQjYAY9JjCgmshTMMQAW/jzUi7xFIcCsfxGstp5AKbgJitbQ
 SVWfbuzSyugfgB4/jWj98hadZnGarfXFrmDy+CI7pw+cXYlyzMIK71KxJHTB2nkN
 S2P37muGUrtu8FvQ+BzKlYl1gG9jtEYfhRGz+lwHnUPZM+O0j1DvBunp3V5nHH52
 5X/gmw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47bw13ebpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 06:55:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-23507382e64so16233875ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 23:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750402515; x=1751007315;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/cra5HUnd+Onw8p9cvyHZDcLODFatDJov6W4y7HTf2Q=;
 b=CrREYloaMo1JYPFJS8tUcugaAZNk+h/jf7MvkjEQMKsDuimOyml1jZ7KmwCbPJMTS7
 ItTBY2MBiDGCigKi1v0Z35BCsIRHVG5MR/pqZZl3aZYvsZGO0W/wX2y7Qfc+tCfMGSeO
 C4JjD73l6h9Y5h7nticnpuHiHS9+5D86+uPqv8ZlM9JrVcoYRPUP9It8RPBGrHCbhue7
 /Jt3ii8VFzrIjpwCTB1MJ1ndmUjL3j0vMkbGG7urFiMov5cWFDhks+w52U3i0vMIz74R
 nwgpv6+TmN3DmP06zmeGhu9qpd+h+PkPifjQN7nzk7D6ZXdPf0/HQ/xhMp/2BF7KzF7S
 4iCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXBZNsMoVKQigLbEZgcjV0l+wDVXk+dYjixUvB+Svg0DJ/4PGkFojx64oGn/maqfw4sQFtXQO1nRM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySfkoD4gAl2AW1i3gXBLtJKsdWHlcUxUfHaTXkCwgJzQqAD4hk
 t09AZZMIOtGfjyTB2tD4phRzroWouB0OCDyTnZrTux1d4fi//5L0evNrFT3rEIyJCbaY/8QzYUx
 +3qswc/N5gegnqPAan6yY4mBGtBbiiVMfbQ4aHTZPXpT/+mx5LK95bUFbc1xCbMOn/saO5wU=
X-Gm-Gg: ASbGnctDAE+vyfOd04Y/q1o++ep460olHnaE5BGfz8OkCUndRnwFZkNz4o+WbZ6KVmQ
 bAIv30M4fHGsgy+cSOyouypuB/adttCUoYS+Jho6CT/uwrKXuCg9z8v3I/hjyNdECnlF2Q7CXx/
 SiIugTo1ehmUwxzHEoTtskZs2oGkO/7xl4+jJkZ3e2ooPXbKPZ5MQloSgtRdQppmxB0ZPrGAE67
 ZFADPC/oAwmfxnsy88i9Xa9zRQNwAN0QdPIKlYtZoRxj92mCmebmIACxRzktxsgDFFD7W9KmNfy
 xMB43LdjX/yGBKYoDUMFZ+jUcojL/ipf
X-Received: by 2002:a17:903:1b66:b0:234:c5c1:9b5f with SMTP id
 d9443c01a7336-237d99064ccmr28616735ad.16.1750402515074; 
 Thu, 19 Jun 2025 23:55:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiXAnjhsU81dzFSNF8XeE5n0aYS1wi4Wc4hIGCqzrClvvAQg3nAWi7A56J6kwNx3saDQ1gfA==
X-Received: by 2002:a17:903:1b66:b0:234:c5c1:9b5f with SMTP id
 d9443c01a7336-237d99064ccmr28616285ad.16.1750402514633; 
 Thu, 19 Jun 2025 23:55:14 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d8701c0csm10636185ad.223.2025.06.19.23.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 23:55:14 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 12:24:30 +0530
Subject: [PATCH v3 3/4] drm/msm/adreno: Add Adreno X1-45 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-x1p-adreno-v3-3-56398c078c15@oss.qualcomm.com>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
In-Reply-To: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750402486; l=2100;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=cb1ncv5kKe+9beezyK8P8PEh4cB50d4o5qsPw+1gBfI=;
 b=6DsTJ1+fRdhEPD5dnhpU8R/Gz1ebwrb9QGaqZxTAvYnxQjpNbqZZnZeVEtrXDr6XOrbHpho2d
 D3lSYE0SnesC8otPnX0urguqEuklaUZlab1toQoIuaDx+Bast0rjRDM
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=QbBmvtbv c=1 sm=1 tr=0 ts=685505de cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=gxl3bz0cAAAA:8
 a=xcvD53-FQScLkYWh0o0A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: NfFmKskCDV-uVLXf95_YUHn_4HDKFq_b
X-Proofpoint-GUID: NfFmKskCDV-uVLXf95_YUHn_4HDKFq_b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA1MSBTYWx0ZWRfX1YTvPCydizi9
 2D5hqtnhnNcBK4hS8g85c+EVMp61Wr25PXK9yw1mNLyBjp/c6YRSVzumPVW+IbHky0wZcwHXa4T
 JhybhEpuV0nD+8J5e29L8Ck/2KxfIKYHElh9soJXqtvPPlwHPtND+cavknWiYsqqTOe+dhH+XWj
 2jhINI05Ydf590J9KAG75TE0EBEqYxMW3vfIsTk78g7EdK76GQeiw15E+LexcM5qk+k7X/2DxiO
 vPXumOuGMf2KKtNF8gGg2aKr10tVQQ2/osyjuSoZC8THO4I45I9ssqL2fZPMdobb6UuGY71a55p
 8Jr94mP4tw5dBW5NAo67EeiNvJDOzYUIP1dEryrR3OoTOmFrsErKuGZZzjWRznhXHzuqIu1XNJT
 Xwgvx1G379Ut9qD8C/HsZBes/PZ+Flr0HxXU9xh9MpQSndE3zuJQmRUGvf6+dRueNUOFsTVS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200051
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
Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 39 +++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 70f7ad806c34076352d84f32d62c2833422b6e5e..7748f92919b883bbcea839a61158ab52e6e4e79d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1474,6 +1474,45 @@ static const struct adreno_info a7xx_gpus[] = {
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
+			{ 233, 3 },
+			{ 141, 4 },
+		),
 	}
 };
 DECLARE_ADRENO_GPULIST(a7xx);

-- 
2.48.1

