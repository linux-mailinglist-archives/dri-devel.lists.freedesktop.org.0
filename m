Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE551C684CD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:52:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A24310E459;
	Tue, 18 Nov 2025 08:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4kJqj7H";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LXhnuwHz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522C210E457
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:52:13 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI6V9YT384218
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eLaq0rEgvGtAfaQgBbzK+2z25S35G2xyAjIzDCq9mo8=; b=i4kJqj7HGJxBNHRd
 pTEmc03++M247mGtaHLvboxPV3bu9Cx4W7q9AzCFwldc6x6PFEwFQzlLT9olFPP6
 2F5xkVympvifrfPP/vdT0hCLa5elzwumkQ5poAPy/8MnxSpxRIziIjxzlIms8yKN
 R/aiXuF+BX5ORsP3dQ0xnf0QJccd8vVxxA7NYJVWNWM8nW/zEk2aSmMfEKqTYSNv
 5Tuh7izfesavFYjF8D7zHjqiIw8nvVZuvRHuDoNjaspnkdyhWR7JkOliPrFy3Yx/
 I6VcanGEQ4/4exxEZ9IAo8tBmPAamx+JagxHjp/S4KHGnDrl1G4MLd7XD8i9Hpba
 gYAZSg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agag8ht1c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:52:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-295fbc7d4abso67826855ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 00:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763455932; x=1764060732;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eLaq0rEgvGtAfaQgBbzK+2z25S35G2xyAjIzDCq9mo8=;
 b=LXhnuwHzLDil41FI84moHyJDECYSN2XIkjHtDQDrwp/y2C/PyfYDFzUwMQRTGciSN4
 n8znay3Dtxab93NzhJvzyAIi1hxTCHKrMK3TUDROWKZsXiRaYQHRTpLKeY73kyNdwOIA
 OYqyH4jdwYgDqTYF97mQcTjX0XjZZQyEY2Fw8yn4VhEzyLFsL82bo3J4gLlOXUcMtvcO
 tc/ZmPOT9c1jju3qJANOk55bkXkMNhkoF12vVeb6RudNLzT1+ItevI7g5Sd5uL4z8JmC
 px+jlcdGo20CIrPBv6o3+P+kdUPqBG+CijYQFLU+9qrXB09d7FeI8d7uvBlLdlFjr+v6
 hzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763455932; x=1764060732;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eLaq0rEgvGtAfaQgBbzK+2z25S35G2xyAjIzDCq9mo8=;
 b=HkDzMej0aHAcHuu2COHqY89KYDJl4ptGQMt/DOQ03q3mOFwV1zC3qbLcsitlK/X6wj
 NBhVZLltRSxKLZR2QueY/DLEXZ0eXu1+JcAa8LISXREfUOokp9zmixvzFgPoXF2VPW6g
 fUr0zUsK0X8ku6T8gJWqnS/S9HzBEMV56I6gWmMefqI/i05NA5CBND3kM9UQ3Uwt2TIK
 /N7+PSB+s5+Hs4sirQsiWY3e+FjpLMaJlGtnD+W4AHmCnvhNjgOeWd5TlAAX0ZAso/Ux
 RB8pPeIsMU+s2b4+zfZsdLtP5pCfrhbTs0S5khOLWQiemPRzTdu1eObxSsB49l+rzzCu
 Ykrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV++u9WiQ9gpN1mKRfDONZ7ItITzSu730IgR1zkbRpR3Lu0eCwpBNlZpfNRyIT60rwvcxG7tCNIAV4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUwXVhPFlXyz0DU45OoyHvJEia//20wxn1je90geapMGaWmkJf
 KICGvmGQwX3+k3vZVm6uSg+EXkDwn3wBUfWRHLjGb6SPunBFEJK2JGKRJw6jj657Y61emgf4hzm
 PeLhz4jy/PtmRDKByJ7sMTOs24HDauZnatZWR+NjT/aFMamdLmMcCiPl0HYH2I7CWGsF2/Fg=
X-Gm-Gg: ASbGncuaGukxxmOLkz3RLbRSEWH1zdGpIJZUbXycFlEuhwA17NoPKyO2hXzw5EIR4xb
 VeWFc5qA/e2jVrSwRZWKNG4+jVnN+Rm4jc+aY0Uefcnq2StoVHMg8aVcYZXgaKajKHdWWIOz1pB
 kDNbzo0YNstpaKTvIwEHZ9k/COyF4Y65d2jRbFzMpfTMjp9o3BWjSXeAeqBVWMBQrWR77NjBKMz
 +LI2xLp2DQDK7aAvrQ416QLfqdGp6qANnNJekH11yvr2cWTws0SqgTCSPy0wjVKbsGiSzWMBMJu
 MH8r8M9HsVEfhLqq/vKmq7XDZqnX/Vq6ZfQA0HN/LB7Rqcjwu4CnpSoh1HQxZ21HJxrqJmFqfCo
 DXWQHcC0TEpRhMy5g76JoiQA=
X-Received: by 2002:a17:903:40c9:b0:295:98a1:7ddb with SMTP id
 d9443c01a7336-2986a76b80emr187942335ad.61.1763455932065; 
 Tue, 18 Nov 2025 00:52:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuRmrBbc/dLnfpzW67vqiSzLvO2GCc3zw2G2+R4D6v4gByj5OD0N9KHMTWShzhMrZVfqzGpA==
X-Received: by 2002:a17:903:40c9:b0:295:98a1:7ddb with SMTP id
 d9443c01a7336-2986a76b80emr187942015ad.61.1763455931526; 
 Tue, 18 Nov 2025 00:52:11 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 00:52:11 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:34 +0530
Subject: [PATCH v4 07/22] drm/msm/adreno: Move gbif_halt() to adreno_gpu_func
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-7-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=3603;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vVeIWVb6/O65xXMPCwHkJepVe1RNfzVF3KjNUn+Tu2I=;
 b=mn64hAX+PZCwaGr9mtLhPoTUQxvBfGlWdpJjGyPWSsKD2Excv+y0rvk1aaeOYO1krY2o7l16G
 MVdWNEfEquICZqxHjf1KDyr3BVVz/H3kL63znYGY+Af/M1j6u9EoU4w
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: ZXGlejcY61PYtMPGjD_ELMzX0ke6GKE5
X-Proofpoint-ORIG-GUID: ZXGlejcY61PYtMPGjD_ELMzX0ke6GKE5
X-Authority-Analysis: v=2.4 cv=G6sR0tk5 c=1 sm=1 tr=0 ts=691c33bc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=W_sW28Yvd0frASqVc48A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX0cAR4My0oTfB
 W9bf4Ja1cyYcZ+NkEwmmOFmdF9oyEPsIb0lIADno5ueG3K+gpqYKPDquJkHYTEZ+TshykfOnSyy
 nc0a+xS3XhBqb7grw6Nv4N02Pav+u+83g5TrxOixyy2zdp1EKCAPnXR7fZYRm2Xzuicjp8Shi2r
 MYRcXyMblUGFVcS9DXKqtf2NdGnwSoiyaAhI/N6oHd+dhWM2p8r8UJeaWJmRtJ1YojgmPMhVtaL
 6RIw2GIHNk3LMrhroycQ3hLovci3rzKQIi9TXdVwzqD0+QYnOO4O/TREihFIfpXuDdXUmupJIFO
 EuwnT/sBlGEegmq4Hi0l3q17F0NQUNPRwBKPTcFK5RO+uVVETmYbqlWsioVLvwoAgt0nTr0rabq
 su3Bv8Y6F3CDymQhmSQJ4/YeE12SBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180069
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

Move the gbif halt fn to adreno_gpu_func so that we can call different
implementation from common code. This will come handy when we implement
A8x layer.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 7 +++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 52653ad376fc..b0be246b44ab 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1079,7 +1079,7 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	/* Halt the gmu cm3 core */
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
 
-	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 	/* Reset GPU core blocks */
 	a6xx_gpu_sw_reset(gpu, true);
@@ -1251,7 +1251,7 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 	if (ret)
 		goto force_off;
 
-	a6xx_bus_clear_pending_transactions(adreno_gpu, a6xx_gpu->hung);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, a6xx_gpu->hung);
 
 	/* tell the GMU we want to slumber */
 	ret = a6xx_gmu_notify_slumber(gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ba95b29855a3..575f2f9d3b1d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1595,7 +1595,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
 	if (adreno_has_gmu_wrapper(adreno_gpu) || adreno_has_rgmu(adreno_gpu)) {
 		/* Drain the outstanding traffic on memory buses */
-		a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+		adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 		/* Reset the GPU to a clean state */
 		a6xx_gpu_sw_reset(gpu, true);
@@ -2316,7 +2316,7 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	mutex_lock(&a6xx_gpu->gmu.lock);
 
 	/* Drain the outstanding traffic on memory buses */
-	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 	if (adreno_is_a619_holi(adreno_gpu))
 		a6xx_sptprac_disable(gmu);
@@ -2685,6 +2685,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2715,6 +2716,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_get_timestamp,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
 
 const struct adreno_gpu_funcs a7xx_gpu_funcs = {
@@ -2747,4 +2749,5 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 335acd5feb82..08bb601b3bd3 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -77,6 +77,7 @@ struct adreno_gpu_funcs {
 	struct msm_gpu_funcs base;
 	struct msm_gpu *(*init)(struct drm_device *dev);
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
+	void (*bus_halt)(struct adreno_gpu *adreno_gpu, bool gx_off);
 };
 
 struct adreno_reglist {

-- 
2.51.0

