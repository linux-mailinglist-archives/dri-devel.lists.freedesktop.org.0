Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC43C4804E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB8C10E472;
	Mon, 10 Nov 2025 16:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQUKhzqo";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="izeLDiVj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789C110E46E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:39:06 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AAFiw5r1809228
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WKibWSrUWripKfBtWsfTympYKLBOlYD+nhQZn/FVCxg=; b=EQUKhzqokJW3UCgb
 lUStWYh9MO6cD+zNjSDLutwBmspsn+lVBRiz3s/hwSJFUslCm9kDSciti1HaANoP
 0LCGEVCgprEznyG7HIHI4yzb3CNH9ki/rmaDjF+b/mHxMAS9/A+2uLhYNg2i5USw
 55F3Yd5/SwwrbMy6zuvZy6Z3vta0X9NkW8xCBjUY7GT3i66/VXXCB61IczV4prcv
 hrt88dFaLWyyB74vxtE7p7xfkSuJ2nmeuz/9W57knNx8O0cb1OQdfGHuQr8bNO1x
 VAxGBvArQLAf3LpRIoNimzupM5SOqYGfRMSh/YWTJQqtTwOzQWJH2s1w8FBb7nKJ
 3N2Iww==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab5m1jkxw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:39:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3436d81a532so5311643a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 08:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762792745; x=1763397545;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WKibWSrUWripKfBtWsfTympYKLBOlYD+nhQZn/FVCxg=;
 b=izeLDiVjShGZdisuBHTJvI4shJhv4YFl8xeYqU/Ik6LyIRfNcqCMd9Qpbt+qNm09Pd
 i8Z8MQbxVK0sees7Q5NoSyQak4iMcr/yjzGLu+JB01JtTK3PaMlPF0lk+ripinu4FoDT
 atj5VSnoCCeaegdk2E9bdZQjBv4xafQQMP5iHRbwbA1+SJDCuS5DtQ2dZO68+3HSWPLV
 fgYhaF3+a2EYswOR0s1ZJSQQoH+zsUCDmpNEAmEkY2yA96vmoBDaAvtVzSodvGhXVJ9F
 Oxw8+1CdZfbCck9v+VDsaQj0PKUOzFWP1l0/lrBfHCswQsS1LNbjrqYDV2mDY8J1V9Va
 MNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762792745; x=1763397545;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WKibWSrUWripKfBtWsfTympYKLBOlYD+nhQZn/FVCxg=;
 b=ErQUKbPXZgbIjWZbcZcTVXiSufOdtHRll6iyiqLcD3aiUK5Luk5iGKKevVRwTsx4n5
 IYQ/a6bXKGDw0cWyjZHyGWpCIcwuKsOpQntJj+eT1EyMSLnBp97aTavADLRdgFaTXevS
 eVJ+0KoyG3ocQjTUU4UuQITlc5OoSnDty82fVra0j6gdILfLtLP0ZfQ0k/XmOtE4vr1D
 lx1t54ddV0flDeF/IJODngmYf/QHqYduoS+bSTzzmo1dHWLaJ/ABY8tGQcpxYwanVerr
 GdKo4nsLnIvb6Y1BxPqyK9YMsyNQiLrlJt1Kcg8VMgajLhcjjiQENDQstMWn5nWqBCes
 g1Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl1dac+iOozC+Em5iMnFenaxRmi9HefhSLx7ESyDfA/zXkfX6z3RJopdyCsDF44OjUWmIU0CKD0bE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwV9MF9MXoWX+ZMIvpQ3HuyF/Do0NHyGPaqkyYGFY8Y78cLMdYI
 CN+7+Zez/fVdVabEVwtsVYdP5J+RJ677Pl99TSulfw/vwTBiTMqesEZv7gPp2FnVhwPioxXgjVz
 lmUZ10es7zVkBf8YU+PUfaovby3EXR4adPo0bgvZ360MymTNJD/8mlt5k3TMT7K1H6mZb8a4=
X-Gm-Gg: ASbGncshyXzrGvknSp9pV1ugcv9+tMZJXPwfqpOgqeG9r+I6F3OyvisUhcnL3h+OK8A
 oOe2/pX8+c6zo/pJgmZ/b9NUDBkhSpNIA1P4khNg+D9nNYdy2Bkuf9sYkBYoxdIoXhblg8szlo5
 oaSrwc5oKbhxPUmYR8dTfRbUbpqmn1M1a2uO1HHu+EbLCNwu+qgQvp1/jPei+8nJ/Dadx2NhilS
 hwKJfA+MPdKy/RECy70BMQNYxR7AYVVruArIR+tznpXK7zXsaz817eLoFFzNeEH0aDBIzAt8mPb
 vJfIRYIFiIu5ff4ILWHzLukAhBLgS2xhS08Mc08tzRrMlwCXoI7mEVGwxl2eLGseX2CMjQAV7KE
 wpkDqPBKfJ8epewygZz1lTcw=
X-Received: by 2002:a17:90b:1c8e:b0:340:ba29:d3b6 with SMTP id
 98e67ed59e1d1-3436cb1209fmr12752609a91.6.1762792745222; 
 Mon, 10 Nov 2025 08:39:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHQA2IWMXamJLpaNer6zgOuLzI6Ik83UCBpaA75HoppwknGF27iOTm6iO2NwkR1P9RuzAm7g==
X-Received: by 2002:a17:90b:1c8e:b0:340:ba29:d3b6 with SMTP id
 98e67ed59e1d1-3436cb1209fmr12752559a91.6.1762792744693; 
 Mon, 10 Nov 2025 08:39:04 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:39:04 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:13 +0530
Subject: [PATCH v2 07/21] drm/msm/adreno: Add MMU fault handler to
 adreno_gpu_func
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-7-bef18acd5e94@oss.qualcomm.com>
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
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=2490;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=FV6xLDthA453vaD5oogIe+3kjmqh0dTIHuw+y3wfzsc=;
 b=TbMQN2jeHbfSzsXvNtITuiiGmAIjAd8wamkBaIOa6vE0PSVAN1N+TZjArgXIn5hVVUYEREIPx
 e9HotsFB4BODpcPk1sAT2+SANyLk02r+uI0pgfpOwVIuHYPptV6085/
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX2py3SZIjuCDr
 QtCyTkNS+ClU/XNw5vd+BnNTXsVi1UQoAyKHOgkNCAFLTCKjM+lr4IxqECfExuED+iQ6r95eHpZ
 mWH1Oq1o7nn+eCTN4BrfjuWEA3oTNhi8mxxT2/5CeE1vDrW0IWkiMdj3bjWOw96Qc0JLhciSMp+
 cHRDlM97MKl0Whjap6Yv2wIzEPDlNfAWXPKxHxM1z8KXqVZEmJJkVqae8YWT1L1HBn20GtYnw1r
 Qym7JV6REg4UgUCY59VjVL4JUJ1YQJBUIBCKscNx2QFNyFVVfca7r8M176hDoarPg2fQWA47xLt
 y/5UhpYVdYjLtUUhZi7JaHArTTEQhR+87dheTidq1D3kAQ9W3/hlaXDUtcRklSKl5F0ozB6n9sJ
 UA3OxfSN8l6ZFIb8xHPIICedVc0OPw==
X-Authority-Analysis: v=2.4 cv=TsXrRTXh c=1 sm=1 tr=0 ts=69121529 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i9YFFn0sWQDpYGFnbDoA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: sGHhD-Np7_HcTcZZLf_jr8SSwSU1v1we
X-Proofpoint-GUID: sGHhD-Np7_HcTcZZLf_jr8SSwSU1v1we
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 5 ++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7a87f6407abf..51d32c66512e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2619,7 +2619,7 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
 
 	msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
-				  a6xx_fault_handler);
+				  adreno_gpu->funcs->mmu_fault_handler);
 
 	ret = a6xx_calc_ubwc_config(adreno_gpu);
 	if (ret) {
@@ -2665,6 +2665,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.submit_flush = a6xx_flush,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2697,6 +2698,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 	.get_timestamp = a6xx_get_timestamp,
 	.submit_flush = a6xx_flush,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
 
 const struct adreno_gpu_funcs a7xx_gpu_funcs = {
@@ -2731,4 +2733,5 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.submit_flush = a6xx_flush,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index acdc51dbec79..50359f2be5d5 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -79,6 +79,7 @@ struct adreno_gpu_funcs {
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
 	void (*submit_flush)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 	void (*bus_halt)(struct adreno_gpu *adreno_gpu, bool gx_off);
+	int (*mmu_fault_handler)(void *arg, unsigned long iova, int flags, void *data);
 };
 
 struct adreno_reglist {

-- 
2.51.0

