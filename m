Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C3DC4802A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9BB10E458;
	Mon, 10 Nov 2025 16:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFVzynHl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="irRczIuR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E876E10E458
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:38:41 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AABZgAZ3271132
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kqWzdHtLoSmSQ6c0tUp8mHto9/TmfMwNT7KQvhP7HUY=; b=IFVzynHlJh5eKUpt
 vp/AObknorlijD1QCapu+T6Yp76FHLHmjT2bhy46ViLm0DZhGTM6WNbO4qVIwnEn
 bNj6KvspKG2/Wu7OOM8OoDtgyy6ZvnB6Bb2jpnYX09I9BSxUFFPYx8Qpc96c7qMa
 3nKvFkj4JYNFkCNi46vvJc0OISyFpTZgJ0TERLDAp3sUn2mdBf1b01im0iYSowVK
 DDkOWqYDPTG0/Agucg/evTQayNbayFnSrkvPAZjKLZIHYl3pebZekGipUCcFxszK
 E90CksT9wMcYJMJsFiSoEj4kk33afgUCQ0RxbOWmqCrpJtcExzed1kF1XD3Z9+E0
 SWN+Xw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abfafrvk8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:38:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3439fe6229aso1551558a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 08:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762792721; x=1763397521;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kqWzdHtLoSmSQ6c0tUp8mHto9/TmfMwNT7KQvhP7HUY=;
 b=irRczIuRIzh/RgDjIo4Lj2AiuKzxMLrpvBcvxkWQwfStfJwxsWx9066/O4gZzVuKch
 GUIEMLZoZexXyaoB+WVFtRuS2ZDAMaUZZOVnOgCokwMfJukT5U1qifvxU2eEAmS9FGe+
 xeSjTrdlyf9C/HsADDv5yLX4c2HWpX4XxU0JC/8aJqQHOdwxGm8xk7jSRaaNjIpPbTED
 kcP/jK3BAjTXnLm3N1djMy7wIxcuz/loEK1B4tEO6pxNGN2yYyd3IGsOp/KFKJ0qMjv3
 WA9qUqBLYy/Y24f3gCgc7PZJgpQ/8tkbzHB/qSOo98HfGNKsFQctNtaqWWroueRCwxMB
 uBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762792721; x=1763397521;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kqWzdHtLoSmSQ6c0tUp8mHto9/TmfMwNT7KQvhP7HUY=;
 b=eeF1m7lORgV3WGq3gaM0tD72BiER40JRuTCTuBNY4XMVzhzozBi4CHNG5+7Bfs11G6
 HusBS1ASaVeJEK9QqWAkrIvU5e64vk+EXZ3Y6PhYNlfFMmKKdnH2N7lUvDb3/aIb2v4A
 3u7r4M09tvJehSfxeEDYy1KFcrubK/LMAvJej5m7bTcKNIHxLzVUAjifo9Rp6jbnqNnS
 FHzTEebXrExv88IKi+oxoc+RyqxTKlnYaZnPQHEXuZSNjuub73Pn+jzgRidiAaZK65jb
 Ym3MUoUa5Yarsxtrcaia2Rg4Ql5s91v4vCrj7GO48ZxzypcyZmeSlL0TyisIRh+JEWBd
 Uo5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd7IMKLqK8PciDQ2dqvT7wa6VLaaj/usUvxMR0aRsWyA58plqay1tVOwfmU0nGpiJOSy+ynIstf2U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwU8LhHZWS2yJyGSC/DgKn1KgZfza3rGbBFNP/FTggZlzwNcqsc
 YdaGn9LlErXq+3M2IT0+0/lqrhVKcWt9Q8n1g9BaaArFXUh+sXmhlL1GyOk5iYxzRyZF+jiJNeD
 Zi4gUDGkvFZwV/wAD7seS5xgybMVAQXBpm6+526YJOFotO7in7eBPBujpM3wpNLqq2fVL6HA=
X-Gm-Gg: ASbGncuQoGvzU66bceyYW3Eil78gjHwffz5ZCUw1g3es/JWIwN92PPsZ/zXhPpzSTzi
 JKPenuhdbWFyrAWpnKZgK2HHXm0ZnsHF7KHYpdDSYCNsQ13LJ9p4WQP2zP/48qmQnbRwsb6vC1R
 YDkB+zPq9g2tqmfr9apDcpBdZaeTkXcEH90Vo0pJXa++JgF5NBICIltsrct1o0MRRw6MhaRJHGb
 QZmwJkmJgg0uaAsoc9fiTFW1z95WvgLor4TUq262ZSpBq1FOMFrPVQTmnOE3p6exL0gT76sJLvw
 zGPE8+k0tN8NssMM81Z96ibxXvvopJN/wcr5qxC62aarwzYRHvzTVsEtJ5tzRlePX81k/s3LwcZ
 tRvdvyHKkTWa70547Ppc1UDo=
X-Received: by 2002:a17:90a:da8c:b0:340:9d78:59 with SMTP id
 98e67ed59e1d1-343befa5329mr27608a91.3.1762792720779; 
 Mon, 10 Nov 2025 08:38:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFa+U0rNARWTCaF7lT0o/+MjPISBIEKRbY/WloUig3k1nekUFejy3Fa2ZzeHzIccBq6UKyi0w==
X-Received: by 2002:a17:90a:da8c:b0:340:9d78:59 with SMTP id
 98e67ed59e1d1-343befa5329mr27560a91.3.1762792720235; 
 Mon, 10 Nov 2025 08:38:40 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:38:39 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:10 +0530
Subject: [PATCH v2 04/21] drm/msm/adreno: Create
 adreno_func->submit_flush()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-4-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=2550;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=SpYPI0Dwwc05293klD0NCzpYJPQgyGdGUUEDRA+kgpo=;
 b=iljtrUe9v0tW0jYWcmnPgbIA1ijJ1IP3iqFE5kXmMTtN9/lE1waAYHqHOrPWj1SCMCrqoTurw
 LUilb1BA64mCClDRQ7wVSRi9QxYoF7J+ZjuTcEWO4spE9icQT8LZMnC
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: wv8bM5fu9-1yKAnygncdGAgUvX45FO2G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX1zSBUEb3iBdY
 k1Hw6sKRnnGpS9nTIzc4DOFpqyyeqqBHvXiMBBpIIpPxxmKBGR6SYWiO7t6/tjJAn1H+SDf7rSj
 tbwem6VuqDZmeXPpVPMaQEUZFhDMAheALUf4qFdN1+vrZn2epzH0f6EN0UQbpPb7J3DRe4FeooA
 9CHPoXpoNTCvijyABV+9nXxVTpQTtJalHh3T06XFznFcxfVbNg1xd8eUwWZyKfn0r6/gTt9OxVR
 Mtx4oDLuboPOeND38QZ0j6nQqy7thbaMjHcbuVavm6o7jGIu/xaRLPo+fHxg76c3Mt8ctAYYH8z
 1D8rp0gPzO9WBFB47NwJ26FDn0wjq4L1hR1fWzXSUBnRvVI85cZYscySBUJeNqbysmSz/9XxGpc
 q3bA2q76b8xLqGzpYW3CG7xPUMBZPQ==
X-Authority-Analysis: v=2.4 cv=UZJciaSN c=1 sm=1 tr=0 ts=69121511 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=geZ1VMdEqvdXz0YL0KoA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: wv8bM5fu9-1yKAnygncdGAgUvX45FO2G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100140
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

To dynamically decide the right flush routine, convert a6xx_flush to an
adreno_func op. This will help us to reuse a7xx_submit() along with
a8xx_flush op.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 7 +++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6f7ed07670b1..b675a512e7ca 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -397,7 +397,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
 
-	a6xx_flush(gpu, ring);
+	adreno_gpu->funcs->submit_flush(gpu, ring);
 }
 
 static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
@@ -597,7 +597,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
 
-	a6xx_flush(gpu, ring);
+	adreno_gpu->funcs->submit_flush(gpu, ring);
 
 	/* Check to see if we need to start preemption */
 	a6xx_preempt_trigger(gpu);
@@ -2563,6 +2563,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.sysprof_setup = a6xx_gmu_sysprof_setup,
 	},
 	.get_timestamp = a6xx_gmu_get_timestamp,
+	.submit_flush = a6xx_flush,
 };
 
 static const struct adreno_gpu_funcs funcs_gmuwrapper = {
@@ -2592,6 +2593,7 @@ static const struct adreno_gpu_funcs funcs_gmuwrapper = {
 		.progress = a6xx_progress,
 	},
 	.get_timestamp = a6xx_get_timestamp,
+	.submit_flush = a6xx_flush,
 };
 
 static const struct adreno_gpu_funcs funcs_a7xx = {
@@ -2624,6 +2626,7 @@ static const struct adreno_gpu_funcs funcs_a7xx = {
 		.sysprof_setup = a6xx_gmu_sysprof_setup,
 	},
 	.get_timestamp = a6xx_gmu_get_timestamp,
+	.submit_flush = a6xx_flush,
 };
 
 struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 390fa6720d9b..77b1c73ff894 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -74,6 +74,7 @@ enum adreno_family {
 struct adreno_gpu_funcs {
 	struct msm_gpu_funcs base;
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
+	void (*submit_flush)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 };
 
 struct adreno_reglist {

-- 
2.51.0

