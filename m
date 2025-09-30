Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7D0BAB885
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B099C10E4F6;
	Tue, 30 Sep 2025 05:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="inl1RaCM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D752F10E4F5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:50:42 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4I0Ks027982
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 F7tggrQW35L+r9nA1vDz59ADeEIVjvvAvwMehI9EefQ=; b=inl1RaCMeUglYjC8
 tITm+ASQG186K9STW7mIvEThu+ylXopHsEUUZSLGyHNneob8rF44gOqoL5gEjk6B
 vYwxmaHBtHnhEp3QFRjryoBQwsQPWolhyUD+a7zMwB7zpdRH6KXz7PPE48AzCKLh
 llrqLu1H1GmWyRQ79XCzG77mSxUUcmJxV2/uYI9DWc/N+h1uQ+eFGk7m+Rl5BYOg
 LtvuoefoHX4QeUzlrZryLyLNul0w5FqGgWMd0kU0c3B+KEmf/dbBl7ii9PYXr5R0
 Z0eiHhreqTrpKomS7kp8cniqkkoN3s3HkF/j4sLOXYmUbcy2BpS1NpvW8F7Hnegz
 cVnxlA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851fq51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:50:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-33428befb83so6268199a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 22:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759211441; x=1759816241;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F7tggrQW35L+r9nA1vDz59ADeEIVjvvAvwMehI9EefQ=;
 b=UpjWN0xYapChHQ4XD/3iA1sf1lNNCw60xQ1LGeSNB14VqPEjbyBHY8nf+6m36PiNEF
 nJt4C0doPZXr4yqMTpGkU4ou8C4Ad0nsj+F9AwHVBvEBe3vhhUhNLz3XJSoFiwlGN6G8
 HI6l1GG95T3n3Fkv5tPviRq0tqohkhWnXzzAZimTzFH07kmq4hqg6Axmc9YeK9vBoaU7
 U6sTiLoC2TnDkmYCvOzJNAs90EZZrTtOzvZVzxoOP2PGEUFGFnj+PoAuFcCYxpFgLTv1
 sPlgNQSAUTpMk9G5PIiov+RTOSK1HuSuOI23XCLLHCMM5dftELMj0EsPwicr0FH3ds0h
 kJCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7+9H4YGKYY8gN0m9IU7WgTdC9Zb1iRoclCyx6kpWkOahJE7kscrqN+m0urOC8aZu44XLdyQuFIA0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/TTF8DZWllGFehyav/tOeN0/qFVYvvUJkEO2sjavXVCXGk7iH
 XyRdyaHs+nQWOiZb8Y7hCIqIKfw/H4F3zh8xgkb5qWmMxHAnuHi38FsZ2VPvBfsElkPm+M1s9os
 2+Q0TyI5IDcJ5QCiDutxJSdXR/hGGpKB7FreH5gZe3EOVS+FRAbW60GzSy03SfeSsOGCPuoE=
X-Gm-Gg: ASbGncvfEr6eCgZ9pMAJqNJwHkRFjTL2QDW+gwc/CKq7K6CA8aYuMPSVyEwZFsST39+
 4LdBrjaM36uUTCe2JCDq3p9MxMZ5MO+oN+I3RrVNIddE67TaKR02HIENa2c0sIddwZ3Bt/NtM2F
 fvf967xqCIk1vYB5QSddxQPRwgQj77vEe9C5DsZJGaqZy0eBxEvXXumSSht56IxtIleBC8T2h24
 zZvSm+zdH1ULwVTeuO2GbzoFtukLdEq7csRmS2Y5TFQXVTTCCQ374lVymrUShigm3DKaoXJqUKd
 5P+8WMJsr3d4AI9f9piT15nFkojZ6R1Q18HXweuRae4xPXSaIHwkFVpfKokMR80Sh3duKw==
X-Received: by 2002:a17:90b:3ec9:b0:330:bca5:13d9 with SMTP id
 98e67ed59e1d1-3342a2ed8f8mr16860578a91.32.1759211440597; 
 Mon, 29 Sep 2025 22:50:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUClMtiALwEZBTNv2EIqQ9cpUZDWBXrYItPYJDbMXvCLk9AJWSNN5pTsS86XXlWwKJL37amg==
X-Received: by 2002:a17:90b:3ec9:b0:330:bca5:13d9 with SMTP id
 98e67ed59e1d1-3342a2ed8f8mr16860541a91.32.1759211440085; 
 Mon, 29 Sep 2025 22:50:40 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 22:50:39 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:18:12 +0530
Subject: [PATCH 07/17] drm/msm/adreno: Move gbif_halt() to adreno_gpu_func
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-kaana-gpu-support-v1-7-73530b0700ed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=3805;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=EOCg+mGbEPCTFPOISLhEtf74Qtn/T6aGtxymMlc3OJg=;
 b=sq9fp1aH6Pcd4wBIzpytDz1wK3LwXQhNCTjV0qmHPnmNmNaZ2nD9irTtZQnCQRt1TkHngIyGp
 A2PWHqR5qNZCBoThU7g59zFNa96k2z+uXx2crV0tRBkpSCJX8JYjVqH
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68db6fb2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=W_sW28Yvd0frASqVc48A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX1WDxz9pPfynI
 1ic5zP178l5H4jVFyVO2n/25Ph0HB7RwmyJ5UHW5I9C9VeXgTuioxGpsjWaioJhYDrWPg7lZSwD
 nkCf/FyfKTcyU5fSp7Rvyz3/mz9DNPXPDLCbMeXYOevh7dEoNcamJABiZrQ04SRuGQqoqo2j9jK
 NjfR4avKxXgjVJSgO4r1W6bcI3vYjgpnt/d4tk3tztJ8Uks5GyJXyVLqWH4jYH0w5ypuDx/j9xt
 nTMEyyLV1y901QIWI571IRCXjU/IVB15rv/qJQX7qGegEh8o17QhhMDn0Zte7jEbdOyBoYX4nJs
 6SkGijfvVveHvMr5qeL2V6hhRK6ayjjLmAIYTdP59VeUf4Q5SSINwQTkl5mITP37TqBSLOkaPn9
 uVcQxtoi83Rr12TINl3anLURc8hXGA==
X-Proofpoint-ORIG-GUID: IlZaW5731ATbKi1b4fRGZLXHhZ4bC_A7
X-Proofpoint-GUID: IlZaW5731ATbKi1b4fRGZLXHhZ4bC_A7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032
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

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 7 +++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e22106cafc394ef85f060e4f70596e55c3ec39a4..fc717c9474ca5bdd386a8e4e19f43abce10ce591 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1050,7 +1050,7 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	/* Halt the gmu cm3 core */
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
 
-	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 	/* Reset GPU core blocks */
 	a6xx_gpu_sw_reset(gpu, true);
@@ -1222,7 +1222,7 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 	if (ret)
 		goto force_off;
 
-	a6xx_bus_clear_pending_transactions(adreno_gpu, a6xx_gpu->hung);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, a6xx_gpu->hung);
 
 	/* tell the GMU we want to slumber */
 	ret = a6xx_gmu_notify_slumber(gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 63aa3f8205085441c7cf8d391befacacd3aefc32..02725d28c607e7815587e9589c8344da3341c78d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1578,7 +1578,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
 	if (adreno_has_gmu_wrapper(adreno_gpu)) {
 		/* Drain the outstanding traffic on memory buses */
-		a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+		adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 		/* Reset the GPU to a clean state */
 		a6xx_gpu_sw_reset(gpu, true);
@@ -2289,7 +2289,7 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	mutex_lock(&a6xx_gpu->gmu.lock);
 
 	/* Drain the outstanding traffic on memory buses */
-	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 	if (adreno_is_a619_holi(adreno_gpu))
 		a6xx_sptprac_disable(gmu);
@@ -2658,6 +2658,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.submit_flush = a6xx_flush,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2689,6 +2690,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_get_timestamp,
 	.submit_flush = a6xx_flush,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
 
 const struct adreno_gpu_funcs a7xx_gpu_funcs = {
@@ -2723,4 +2725,5 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.submit_flush = a6xx_flush,
 	.feature_probe = a7xx_gpu_feature_probe,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index f5e23e0022060a726377faca125d57c7553c8493..991481adf2261f09912786ada3574f9f144953c0 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -79,6 +79,7 @@ struct adreno_gpu_funcs {
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
 	void (*submit_flush)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 	int (*feature_probe)(struct msm_gpu *gpu);
+	void (*bus_halt)(struct adreno_gpu *adreno_gpu, bool gx_off);
 };
 
 struct adreno_reglist {

-- 
2.51.0

