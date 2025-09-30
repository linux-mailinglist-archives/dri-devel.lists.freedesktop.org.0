Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6BCBAB860
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A40910E4EF;
	Tue, 30 Sep 2025 05:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lt/QzqV2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD4910E4F0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:50:20 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HfNH024615
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 b3KVfEGjSay2MX7CoJvLOzV1CqboHslXk9pdc9qozsE=; b=Lt/QzqV2PX0S0ruc
 9FWTfzCCUYcj+zhi2JgJw3zmuSYHFNZMybigdd8EJV3x4fVNPlNqnx8UurLNECAW
 gws+NNgNM9/UKdVNpMw+M5b73MCaGr0L/HqhJ9ZwxQq35nnQ8RHWG49xjbtKmt7X
 rEbUWklmsdd+s3bePJey5K9eVrBmJuhyw7E37nQG7VjF3YElTsNWiexjeEE9CMNK
 GQEGJUyhfpn/h8Nmq19Y4JX0NUD9LdSvQvG6N37/TQN/xaUUH+VpDItV9NL+3GLv
 0IgqdowmcND1Fd7UBVlF92ASDyBah9lThER1cUZj/TItiDw5UO3I5tKaAGYRWhiK
 WjCcPA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n04y2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:50:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-32ee157b9c9so4792189a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 22:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759211418; x=1759816218;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b3KVfEGjSay2MX7CoJvLOzV1CqboHslXk9pdc9qozsE=;
 b=Uopt/0KVXYoPK5ZG927FYsISI1VSy6AgZZE20/D/Iwy0bp5uoXKX8q+XnUo7nz2UGc
 TLxr/wBv6v+giWGYwEkQBkwOLIGCDwz6w9koCIZafsW6MvtzszV4u0fw7kE1enPJiDhM
 ZOmry432XoV7ubeOraoT+PMxb8frljZnFFfk6ZJoJV/UC+m9yXEQIohQEVp3WGpPKXp1
 gdyuiVnXeH4FXz/8TS7ZY32QStCoJAf8Y+I/KAyWZv2SQMzH72nzHj/Yh4YMjgQrBwll
 /0vFxCEH5V6kvNKOt08HBgt5TR1NwgbjJ8657AydVuoepl+yseGUSqYY5ExUTufbKvFl
 1x0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSRloBoVuRrTdwzKDkGp6iYEVyKRzVbe/5yAGUoBQj+TWB3RgS2SsZ3mMWyeRnlCgTJRG/ecUB3gI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzgg2qlQ3zKlEaaGlHj21kzZZmQrp1S8tpMkXbnU+kYjNLMysxJ
 p4SIaeqRJyEIH6MDwCn5qkXtmO/X6GFbVxOMNA+LWCd9/W2+2JkjDgacUchcPQgdFxGqEkNe+B5
 hzonWS5DqEaqeztv3kWz3crPh98VRG9ZfX3UuYN3ihRS05atIh07Z/pOLEhUIauaYhaY8BNE=
X-Gm-Gg: ASbGnctlHGF7HzCuOq+JF1Z6CT2fGG7yaufVsrRCpr0Tpat88f47ytj68bYRBuWvgXw
 +cGa+5+h4u5cq0etYC0bpRuUjmdzXcePqUgQ9QxzKNoxV8hkeZm6q5OwLvqbIZGiMvV/dr8+eDn
 8zCSibwwGS9xczkTI5Wshd1/BI+ys49AsZNPGfhzJLnWRq/9GRcgwAl8SGJcO4+ijhgXfQ6Qnx6
 m3Txu27EvHrgCBSZOkSX9UZ3dDeXuY2SAUVhHreSguoVzzRBJcIyQ4txrx9BcJxN1i3V287PQp1
 w/AFFsD83c77l59kfDGQpofzemRvEcTR4sKUBPoohyT9xZXX6q/8W/Q8uEWOlA5ZzcEXRQ==
X-Received: by 2002:a17:90b:314c:b0:32e:96b1:fb6e with SMTP id
 98e67ed59e1d1-3342a29906dmr20304934a91.18.1759211417994; 
 Mon, 29 Sep 2025 22:50:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo0RE2YKa4ZygxZu6kxjp8Q2RIAaVkJ/MyZNvDXmSDipKXnnMeHOY/Pjn5S54HjeUH61NjDQ==
X-Received: by 2002:a17:90b:314c:b0:32e:96b1:fb6e with SMTP id
 98e67ed59e1d1-3342a29906dmr20304912a91.18.1759211417534; 
 Mon, 29 Sep 2025 22:50:17 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 22:50:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:18:09 +0530
Subject: [PATCH 04/17] drm/msm/adreno: Create adreno_func->submit_flush()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-kaana-gpu-support-v1-4-73530b0700ed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=2662;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=HQNn0GpSr5MaoATHj12j1OfeIQxkRKUAuDUx63OS8o0=;
 b=R/N87ADKLI885gc4zTsGjeVFnAH7lthAW1ze2DZJAlARQpSnNO9Y+gAiY+MUbS9j70fOi7I4V
 Whw/OBdpDLmDwFAQAOu1zNCO8SxfWv4eBVJ1taJgS1R0W3pl7D4FPDR
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: MrD6rWTm2JA7jdD1-BEN1SCu39mZw9Lc
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68db6f9b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=geZ1VMdEqvdXz0YL0KoA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: MrD6rWTm2JA7jdD1-BEN1SCu39mZw9Lc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX6gHDOay1yAot
 PcXTBB//WQ3zrqLcGUQ8hupgQW81Ecbs5c6mKL74Av3DDtO63fE8dHtdoUuOisqMXY3gfkaWH+G
 MfZWr4jEtOZYWy74snCEfzkrinbt3GV1Em9uLnlFshiZOfkgnVrAt8NtqssW6KZI14j/vtAeQIg
 XsnhOTtLH+3cz2cTozmYw3OPUmvvKtkXH89Ad6pwnV70eEo0pRhi/3+O6gWNOujCzHvr83OO6Ip
 fbdao/xdJfMrCUutsU4KuRgka1BsknSm24aN+HKj6JRgXnCSGgLj3LCj+bnnVMEOb35cbUDerbN
 a8Ush+Ocy6wX7ZGPCJkq9R0Quohus0P8pO74U0iUSpUoejJwnzHfMnHHCpkz1RLxnYIpqKP4Gnw
 XjQHWvf30pM6F5I9haeLfXdXl18YNA==
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

To dynamically decide the right flush routine, convert a6xx_flush to an
adreno_func op. This will help us to reuse a7xx_submit() along with
a8xx_flush op.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 7 +++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b8f8ae940b55f5578abdbdec6bf1e90a53e721a5..9cc2f008388929f0c8e8f70a3e3e79fb4d35ab38 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -391,7 +391,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
 
-	a6xx_flush(gpu, ring);
+	adreno_gpu->funcs->submit_flush(gpu, ring);
 }
 
 static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
@@ -591,7 +591,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
 
-	a6xx_flush(gpu, ring);
+	adreno_gpu->funcs->submit_flush(gpu, ring);
 
 	/* Check to see if we need to start preemption */
 	a6xx_preempt_trigger(gpu);
@@ -2557,6 +2557,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.sysprof_setup = a6xx_gmu_sysprof_setup,
 	},
 	.get_timestamp = a6xx_gmu_get_timestamp,
+	.submit_flush = a6xx_flush,
 };
 
 static const struct adreno_gpu_funcs funcs_gmuwrapper = {
@@ -2586,6 +2587,7 @@ static const struct adreno_gpu_funcs funcs_gmuwrapper = {
 		.progress = a6xx_progress,
 	},
 	.get_timestamp = a6xx_get_timestamp,
+	.submit_flush = a6xx_flush,
 };
 
 static const struct adreno_gpu_funcs funcs_a7xx = {
@@ -2618,6 +2620,7 @@ static const struct adreno_gpu_funcs funcs_a7xx = {
 		.sysprof_setup = a6xx_gmu_sysprof_setup,
 	},
 	.get_timestamp = a6xx_gmu_get_timestamp,
+	.submit_flush = a6xx_flush,
 };
 
 struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 390fa6720d9b096f4fa7d1639645d453d43b153a..77b1c73ff8946fb0f8ff279e16c973cade50c130 100644
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

