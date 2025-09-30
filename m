Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CC0BAB891
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D4F10E4F4;
	Tue, 30 Sep 2025 05:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gifKMrKc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECD110E4F3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:50:50 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HVhT024443
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hUYDtG14iwXt6CshtaDwxA9smtoMJnlMfawF2rRoaMg=; b=gifKMrKclxrtGxLk
 4rBp68Bl5B0XrOiBHgo+Ek0HHOeetPON/+M+lYt2jf4elx+NMkNH2DQcgy/w3qFp
 v7osQynKfDhFxD0Qx1W1tQgtLFxRDTe8pc2jdzRaMS39dfJcqu4NEqn/aYhq1tkd
 OtmsZrfIrMxPmtCG3Ym1+/oM8JcIds+wGGQHvdXcH0VX2l2QdWMZfTi1ZIz8ufnP
 C9A1zvQ8Wehp/JZxQN8PVbTOGIa/SErqVUcDj1UqjAWl7mGX319OwnLPCU6+nDUM
 75CKEeaPghDkO2EJ1e4TY64P9zsGqxdlnZDzFYiv8VO++0293ceG4lKOkG6uxeYh
 MHBNcA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n051a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:50:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b57c2371182so4770407a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 22:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759211448; x=1759816248;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hUYDtG14iwXt6CshtaDwxA9smtoMJnlMfawF2rRoaMg=;
 b=mBiTciVqHh9WbD2wJT6u3Qo7029AnsMKDVwqWAOlGBQITRrBT8IU/G1lKsbOU9Ibuo
 qT7rxHWgqaC1F6SwvKWdcF0cmugtW0KA5VYEIzFoZVw+9NYkzA5Hr51TjZD8H4KkktEA
 cpcKwPfqfXNuyLW5u7FUh4b5nZXEcfouIfNzYlx38Xa5jmhDWK/XQFu46pHYd91C5iaU
 hjFHx550GPtjfq5Sp1dzd1Rn0JDsjP1ZtPIv4YgDgtLhWwmgZk6DXVCGjXHhV+9FHDAn
 2y7ONtF5KLJxPK5sufnc+mCwuBfnR9/7RoKrAhZp52okq9TmihAbW0Y75a5rzz925gqa
 G4fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA3VJW2FnFnQOm1i5jJQ5vqQKz7o+foiQTK0PLJIluWh7IkTL1JaSAV4iMgZxLlwLUdxzjTvqeF90=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLulPNtLdvPlXKDkuvFUtGslK32Xr5qdVgGSIAHJZc8mLbW/X0
 Zjik5sBwg9ntEte4SbTXoFbSnueM+1OL7QqUZtReIiV/kiBXWfjCmihcKjR4HwayaKpnl7jwweu
 TIT4gL8kPXOUNqaSvMc67xziljhueGWEHvKOYUBKaUcKJtuouTjE12O+VF0NVxd3a1hED3fk=
X-Gm-Gg: ASbGncvXFF9881bLmxF7SWTPE3rwVHvkep3KQ4+Ejo8YwqjorsM4yGpps2qxY8sAHnV
 ppdaVZ4u/BJJVYcHg+jZtaGzfvz0/s5NQYC/B1EmRmh9c9hHol5jIOLlsNY6vRuqiaP/2vAp8UI
 keE7wKDdPEd+LoldHbdLwCOeTNxvaAhA7zQ+/lAEhJaVaj4RLlPrtfoFNwuBrevrIG9hkz80Imk
 XRm7ZUtuIZ6U8WqtYuN8y8M1Nr0DXp1aAujjpqgZmcUMJCCWWULWkcZXKLSF1Po8iQ6EIKLOKtP
 yJw2qPqw/yaZVdKwdeyFdqMSlgnUk4Lb10WvyDoj1BSo1/Tg0jfDrigSWEl0rdroWUm7uA==
X-Received: by 2002:a17:90b:1a86:b0:32e:e186:726d with SMTP id
 98e67ed59e1d1-3342a2e08a1mr17586676a91.31.1759211448073; 
 Mon, 29 Sep 2025 22:50:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBv29jZXzsR2GHyzv4/aiF55cKo23OPq++pHW+jUt6OPLZ0TQSWk4QbBrVwj5PowUQlBWBaw==
X-Received: by 2002:a17:90b:1a86:b0:32e:e186:726d with SMTP id
 98e67ed59e1d1-3342a2e08a1mr17586627a91.31.1759211447597; 
 Mon, 29 Sep 2025 22:50:47 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 22:50:47 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:18:13 +0530
Subject: [PATCH 08/17] drm/msm/adreno: Add MMU fault handler to adreno_gpu_func
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-kaana-gpu-support-v1-8-73530b0700ed@oss.qualcomm.com>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=2518;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=iTx0Dgw6/NGdDmnjDpXwtxM3ls+MrtO4sIvE3+opA2Q=;
 b=MrGaWbf42ncH24JynsUmGMasa2mINaJed6eMYoi/gzz6Y7t9s0yIQ5H8PlIqlwA9cPDCLVgVF
 vIbOkIclF6NBtnDJY0fAqoMVfUB0LG8GNmKX4udlGZcehELqKzVLBu/
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 8q3AZgQ9VDp899bb3Oj2Fs0NxfSI_1kh
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68db6fb9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=s_9S_yPA7-Eg1sbpcaoA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 8q3AZgQ9VDp899bb3Oj2Fs0NxfSI_1kh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX38xwPziral32
 DxEN+FdXoyOpPcwa2IPPXkQhsdtB6N14o0tvI2wThOZIU2hl28NQNrU/MmJlTarHg0/65lgNDec
 3/DHhkMNBtjdJU2VibWF1vrwgWw7vK0pu2nWbBQuc51dTD4ROrcbk3FMG/9rMSzrXpRd+AknsG+
 ytdyYbZRbVxK0Scf3mP9YMkL+QTIYO8YaMzlyvlfifBIugHf4Gnyh/qx7142sJ8HnV1l35oPS+O
 xxhd1/2qFSkIHttELxvZhQ3nNiD/vaVAdmQjGJf/cV2CX0lbmxMIUXu8HNYUUURefynD13e27Jl
 sSiw2Iv8b5709tECer463buztNplCby2MR4WgpAw88KxZNAKtbRlDXqaosxN3U1zSq0C0sQAPdF
 0JXAdlAH6QFudOBk81XD0gxlV32wyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001
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

Move MMU fault handler for each generation to adreno function list. This
will help to use common code for mmu pagefault handler registration between
a6x/a7x and a8x layer.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 5 ++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 02725d28c607e7815587e9589c8344da3341c78d..27168f3a7264f2651cb41c8d59e6dc80ddba4262 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2613,7 +2613,7 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
 
 	msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
-				  a6xx_fault_handler);
+				  adreno_gpu->funcs->mmu_fault_handler);
 
 	ret = a6xx_calc_ubwc_config(adreno_gpu);
 	if (ret) {
@@ -2659,6 +2659,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.submit_flush = a6xx_flush,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2691,6 +2692,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 	.get_timestamp = a6xx_get_timestamp,
 	.submit_flush = a6xx_flush,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
 
 const struct adreno_gpu_funcs a7xx_gpu_funcs = {
@@ -2726,4 +2728,5 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	.submit_flush = a6xx_flush,
 	.feature_probe = a7xx_gpu_feature_probe,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 991481adf2261f09912786ada3574f9f144953c0..b27974d97c7512ecae326eb2d22238330d6c52f0 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -80,6 +80,7 @@ struct adreno_gpu_funcs {
 	void (*submit_flush)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 	int (*feature_probe)(struct msm_gpu *gpu);
 	void (*bus_halt)(struct adreno_gpu *adreno_gpu, bool gx_off);
+	int (*mmu_fault_handler)(void *arg, unsigned long iova, int flags, void *data);
 };
 
 struct adreno_reglist {

-- 
2.51.0

