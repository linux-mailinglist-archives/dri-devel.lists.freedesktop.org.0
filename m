Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EF1C3D66A
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 21:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64F810E9D0;
	Thu,  6 Nov 2025 20:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="djKPG81Z";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aI02t634";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339DD10E9CC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 20:50:36 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A6GoH6g2165156
 for <dri-devel@lists.freedesktop.org>; Thu, 6 Nov 2025 20:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JccV+6IyOO556Zmn4rJDwpip4whsdVZr5T4fwf4mOp4=; b=djKPG81Zw2HGUt5x
 xRkW32n/AygXo2dQvHVlzYahr9ecWmIU0DzYSxAW87He1Ut3/qQbmv5oqVb4ymXy
 Jxe2QjABvKrAGeK6fsygR9EE3MwwkXcoAJa5De5BpE4wHt1cnEsvEpXWlMY1Csyh
 NYFEcdozX6HbEHdlv8JU55EDiO3vSi4sLV0cHqeFbHFwSRw2nsTfMdhvIu1ahbmu
 yungMHMlft7HUJcBhySlB/YZeIRGxS2Yg0FCSMDk9s+2rGZzTgcQSHAt/Sa3/YUA
 aq4Thhly7YMdq0VcIsMzvoCcgvxsbedAQh/NSGrfXR+J8L4Z9ePZtkY+NPTykNXY
 vV2/ng==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8g6euj2y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 20:50:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b57cf8dba28so54833a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 12:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762462234; x=1763067034;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JccV+6IyOO556Zmn4rJDwpip4whsdVZr5T4fwf4mOp4=;
 b=aI02t634V/0Wyy1CsELX4DzIYnJrYfwml3PFf/77gNcxbItrce76jZQ2VKqrh8X7Ld
 trZ+ksOMjRQu1Wu0Ip1rc1xKT7Uara/ku5XG2PtTSZcjiSeVqIjMpY07yo+BDBzEjrIZ
 81KASj6mHImzwzsbMfi0bbrcjGR7EMuR44LG9btlv1dn1rNVP1gfWedr25dq9RspvaMF
 svgHxyJOBGAcksN70GGY1k2Z30ezQxOjnX3fTieY5FJeL6cyUvPtWM0vFv5VcC8Ii8CH
 vGf9lVmVNmviIaib/ksR+8jMPm/x2XGYsuG/XuzLtyrdLj5r4akrzbgLwvS7tr/GFzQL
 Q++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762462234; x=1763067034;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JccV+6IyOO556Zmn4rJDwpip4whsdVZr5T4fwf4mOp4=;
 b=cOfr/RIjonIsLNvH8OEVJ4oeSrkx5dOGLrscbGoCl/IlezGGoK7Gb0DftFwdBbXR1r
 FVObvHlw+vtxWnv9FAJax8YJtp5SW+jj6xgcDBJ/cyXehZLjhi6JWftPq5Q1KSOzybXn
 heJ0fx9MB/koxM/XlLrbtHF6GPX0ZHZG6Z0PahYMenIJud2Rkzbocl8IoeVGulUm0suA
 hkcZ55nCfrusKwICutItIK4Ncbl7dPshCZeBPccsfWSW+uLKjVXNHXUfsRar+8Sizx5V
 m4+u2j5iK84onNJOxRubnYyZcuoNxXcvtq7bLwsdAsAdOSJR3AFHIDexsI2uJXEofcr7
 Jmpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGElgmnNnijdmuxIhnnqf8ahdbvIwuEdwYybqbHK4AgpHf3NhoZV/H7sVJ2T04PjBFgfUdRArEI9Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyhN2JgL3Y/2tfuU9bjyot3kjpdPrq++bro9jJnWmX9rB61db6
 T9A6UysrIusiBu6k/5u1ljSEsn9DygnTA4jgSE9tfP/tjBfw4WXvCNjceUPvDjF+xkDYx1YDty7
 Snr+PzZGInN1K+RiSSvEIWQTGaEKixs6zYks5M3VFaMj3XdU4u9appAnFda7D/Gx8OrTI0Nk=
X-Gm-Gg: ASbGncu96efuiCkcvFC6aUVD/pty0dwzcQ1ogLdEiEvr0zRFfgnLo3tvW5pCvaSdjcr
 U0hT0XsXR6hg5ejfxiY9wE5FQYHZTIZZRSZnfAk/QvwYl+fLL3zlSk2XztdqAVxsn4ay496+68B
 0wuMIHEebrcNIQ7ybFy2i6a0aiG7sclAgDub20tes3Up4Iq2HANerNjwIeGX5HWfShMfxiZID2g
 IjNm8TUlAJtM3fDkqthwYyvlb3WeGzxnwqxSslRzX80vuuuD8i6/OmcLzLg08lE+73Imixv9/14
 QBhJtXyzTlkCQSMs/gbKfzlAKIYoCM/yisoDza7ffgFnQIIBzUO1H7oUkUgLWzAnMYWXoT1jl2t
 Sk9pcMeofOrGtI0RH+q4aakM=
X-Received: by 2002:a17:902:d2c6:b0:26d:58d6:3fb2 with SMTP id
 d9443c01a7336-297c03d2afcmr8690525ad.12.1762462233783; 
 Thu, 06 Nov 2025 12:50:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGI4M5cydDllEsH9fKhOAtl1iSSmzikjwrQnCMOcAHr1ZicT407HG8U/vmH0KHy4xUnBpNL4g==
X-Received: by 2002:a17:902:d2c6:b0:26d:58d6:3fb2 with SMTP id
 d9443c01a7336-297c03d2afcmr8690125ad.12.1762462233198; 
 Thu, 06 Nov 2025 12:50:33 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651042c24sm37408815ad.50.2025.11.06.12.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 12:50:32 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 07 Nov 2025 02:20:06 +0530
Subject: [PATCH v2 1/6] drm/msm/a6xx: Add support for Adreno 612
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-qcs615-spin-2-v2-1-a2d7c4fbf6e6@oss.qualcomm.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
In-Reply-To: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762462219; l=11518;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vHpWpzMQqLB4QHVoGDlvrj+UXwxIE9eSTGI302gk+yg=;
 b=OjLXZnh9gt3Hl1SOGZAo5uVA7Is1TJvOKuvGNZFojN7TzWsgvUxvopKgtStHQl2cmeI1BzOxa
 VFesv8pn0UoDwxFUsQxz329J5+M8J/r4Y+BPgheXG4Wd2UM0UkZTdMG
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDE2OSBTYWx0ZWRfX/SObijd5bIM5
 MIr+oJrLhyIkZFLIAQZG7gTcMAar7JMAqZST0AdwE6pTkk6XwClluJPnOqgVkcBA3YNdq62Pd+2
 PbSAQ0TnjFvwWgh49LwM7J1uPV9xvRH/mesY5wqtsa/Ari5S32/mG8uCScYQtharzj4M6CTzves
 ccT5u44WC885dMJGHoa2c/sCef+u19dDtUMfNDLcPjaQNjeqBjrZ7BAiNWkBSbLfipgKTSxaFJo
 t6gYg4uqNs0zhELXYGEYZWDwLT9M9rQwvEDrodWCaKSDMc9mAk5TTTC62J88vvlnaxZVRtmA54r
 114D+rj38OjPRU5jxnpZr+f7sDJIT5fFRmnOJABwc1KxOqvsEzceKMLe1+0v6STN/2g9Uip3xT4
 w74upetwMML2A6i/2mVDVQnFRdl2Sg==
X-Authority-Analysis: v=2.4 cv=D5FK6/Rj c=1 sm=1 tr=0 ts=690d0a1b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=sS_TVDJU5kuvE9dQCNkA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: i3YvD69_ZA0zMVlQoQXxyJs9KbWkHikt
X-Proofpoint-ORIG-GUID: i3YvD69_ZA0zMVlQoQXxyJs9KbWkHikt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060169
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

From: Jie Zhang <quic_jiezh@quicinc.com>

Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
of A615 GPU.

A612 has a new IP called Reduced Graphics Management Unit or RGMU
which is a small state machine which helps to toggle GX GDSC
(connected to CX rail) to implement IFPC feature. It doesn't support
any other features of a full fledged GMU like clock control, resource
voting to rpmh etc. So we need linux clock driver support like other
gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
This patch skips RGMU core initialization and act more like a
gmu-wrapper case.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c   | 16 ++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       | 23 ++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 45 +++++++++++++++++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  3 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     | 16 ++++++++--
 6 files changed, 90 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 44df6410bce1..5db01fa2ed44 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -705,6 +705,22 @@ static const struct adreno_info a6xx_gpus[] = {
 			{ 157, 3 },
 			{ 127, 4 },
 		),
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x06010200),
+		.family = ADRENO_6XX_GEN1,
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a612_rgmu.bin",
+		},
+		.gmem = (SZ_128K + SZ_4K),
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a612_hwcg,
+			.protect = &a630_protect,
+			.gmu_cgc_mode = 0x00000022,
+			.prim_fifo_threshold = 0x00080000,
+		},
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06010500),
 		.family = ADRENO_6XX_GEN1,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 4e6dc16e4a4c..d9ffe9e93ad9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -350,12 +350,18 @@ static const struct a6xx_gmu_oob_bits a6xx_gmu_oob_bits[] = {
 /* Trigger a OOB (out of band) request to the GMU */
 int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 {
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	int ret;
 	u32 val;
 	int request, ack;
 
 	WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
 
+	/* Skip OOB calls since RGMU is not enabled */
+	if (adreno_has_rgmu(adreno_gpu))
+		return 0;
+
 	if (state >= ARRAY_SIZE(a6xx_gmu_oob_bits))
 		return -EINVAL;
 
@@ -395,10 +401,16 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 /* Clear a pending OOB state in the GMU */
 void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 {
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	int bit;
 
 	WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
 
+	/* Skip OOB calls since RGMU is not enabled */
+	if (adreno_has_rgmu(adreno_gpu))
+		return;
+
 	if (state >= ARRAY_SIZE(a6xx_gmu_oob_bits))
 		return;
 
@@ -1900,7 +1912,8 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 	gmu->mmio = NULL;
 	gmu->rscc = NULL;
 
-	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
+	if (!adreno_has_gmu_wrapper(adreno_gpu) &&
+	    !adreno_has_rgmu(adreno_gpu)) {
 		a6xx_gmu_memory_free(gmu);
 
 		free_irq(gmu->gmu_irq, gmu);
@@ -1942,6 +1955,13 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	/* Mark legacy for manual SPTPRAC control */
 	gmu->legacy = true;
 
+	/* RGMU requires clocks */
+	ret = devm_clk_bulk_get_all(gmu->dev, &gmu->clocks);
+	if (ret < 0)
+		goto err_clk;
+
+	gmu->nr_clocks = ret;
+
 	/* Map the GMU registers */
 	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
 	if (IS_ERR(gmu->mmio)) {
@@ -1981,6 +2001,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 err_mmio:
 	iounmap(gmu->mmio);
 
+err_clk:
 	/* Drop reference taken in of_find_device_by_node */
 	put_device(gmu->dev);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b8f8ae940b55..779c1da7c46d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -612,15 +612,26 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 
 	if (adreno_is_a630(adreno_gpu))
 		clock_cntl_on = 0x8aa8aa02;
-	else if (adreno_is_a610(adreno_gpu))
+	else if (adreno_is_a610(adreno_gpu) || adreno_is_a612(adreno_gpu))
 		clock_cntl_on = 0xaaa8aa82;
 	else if (adreno_is_a702(adreno_gpu))
 		clock_cntl_on = 0xaaaaaa82;
 	else
 		clock_cntl_on = 0x8aa8aa82;
 
-	cgc_delay = adreno_is_a615_family(adreno_gpu) ? 0x111 : 0x10111;
-	cgc_hyst = adreno_is_a615_family(adreno_gpu) ? 0x555 : 0x5555;
+	if (adreno_is_a612(adreno_gpu))
+		cgc_delay = 0x11;
+	else if (adreno_is_a615_family(adreno_gpu))
+		cgc_delay = 0x111;
+	else
+		cgc_delay = 0x10111;
+
+	if (adreno_is_a612(adreno_gpu))
+		cgc_hyst = 0x55;
+	else if (adreno_is_a615_family(adreno_gpu))
+		cgc_hyst = 0x555;
+	else
+		cgc_hyst = 0x5555;
 
 	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
 			state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
@@ -714,6 +725,9 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		cfg->ubwc_swizzle = 0x7;
 	}
 
+	if (adreno_is_a612(gpu))
+		cfg->highest_bank_bit = 14;
+
 	if (adreno_is_a618(gpu))
 		cfg->highest_bank_bit = 14;
 
@@ -1288,7 +1302,7 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_CP_LPAC_PROG_FIFO_SIZE, 0x00000020);
 
 	/* Setting the mem pool size */
-	if (adreno_is_a610(adreno_gpu)) {
+	if (adreno_is_a610(adreno_gpu) || adreno_is_a612(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 48);
 		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_DBG_ADDR, 47);
 	} else if (adreno_is_a702(adreno_gpu)) {
@@ -1321,7 +1335,8 @@ static int hw_init(struct msm_gpu *gpu)
 	a6xx_set_ubwc_config(gpu);
 
 	/* Enable fault detection */
-	if (adreno_is_a730(adreno_gpu) ||
+	if (adreno_is_a612(adreno_gpu) ||
+	    adreno_is_a730(adreno_gpu) ||
 	    adreno_is_a740_family(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0xcfffff);
 	else if (adreno_is_a690(adreno_gpu))
@@ -1576,7 +1591,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	 */
 	gpu->active_submits = 0;
 
-	if (adreno_has_gmu_wrapper(adreno_gpu)) {
+	if (adreno_has_gmu_wrapper(adreno_gpu) || adreno_has_rgmu(adreno_gpu)) {
 		/* Drain the outstanding traffic on memory buses */
 		a6xx_bus_clear_pending_transactions(adreno_gpu, true);
 
@@ -2229,6 +2244,12 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		goto err_bulk_clk;
 
+	ret = clk_bulk_prepare_enable(gmu->nr_clocks, gmu->clocks);
+	if (ret) {
+		clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clks);
+		goto err_bulk_clk;
+	}
+
 	if (adreno_is_a619_holi(adreno_gpu))
 		a6xx_sptprac_enable(gmu);
 
@@ -2242,8 +2263,10 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 err_set_opp:
 	mutex_unlock(&a6xx_gpu->gmu.lock);
 
-	if (!ret)
+	if (!ret) {
 		msm_devfreq_resume(gpu);
+		a6xx_llc_activate(a6xx_gpu);
+	}
 
 	return ret;
 }
@@ -2284,6 +2307,8 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 
 	trace_msm_gpu_suspend(0);
 
+	a6xx_llc_deactivate(a6xx_gpu);
+
 	msm_devfreq_suspend(gpu);
 
 	mutex_lock(&a6xx_gpu->gmu.lock);
@@ -2295,6 +2320,7 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 		a6xx_sptprac_disable(gmu);
 
 	clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clks);
+	clk_bulk_disable_unprepare(gmu->nr_clocks, gmu->clocks);
 
 	pm_runtime_put_sync(gmu->gxpd);
 	dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
@@ -2673,7 +2699,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 4);
 	else if (is_a7xx)
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 1);
-	else if (adreno_has_gmu_wrapper(adreno_gpu))
+	else if (adreno_has_gmu_wrapper(adreno_gpu) ||
+		 of_device_is_compatible(node, "qcom,adreno-rgmu"))
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmuwrapper, 1);
 	else
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
@@ -2689,7 +2716,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	if (adreno_is_a618(adreno_gpu) || adreno_is_7c3(adreno_gpu))
 		priv->gpu_clamp_to_idle = true;
 
-	if (adreno_has_gmu_wrapper(adreno_gpu))
+	if (adreno_has_gmu_wrapper(adreno_gpu) || adreno_has_rgmu(adreno_gpu))
 		ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
 	else
 		ret = a6xx_gmu_init(a6xx_gpu, node);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 4c7f3c642f6a..838150ff49ab 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1596,7 +1596,8 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 	/* Get the generic state from the adreno core */
 	adreno_gpu_state_get(gpu, &a6xx_state->base);
 
-	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
+	if (!adreno_has_gmu_wrapper(adreno_gpu) &&
+	    !adreno_has_rgmu(adreno_gpu)) {
 		a6xx_get_gmu_registers(gpu, a6xx_state);
 
 		a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 4b5a4edd0702..71400d8999c9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1189,6 +1189,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	/* Only handle the core clock when GMU is not in use (or is absent). */
 	if (adreno_has_gmu_wrapper(adreno_gpu) ||
+	    adreno_has_rgmu(adreno_gpu) ||
 	    adreno_gpu->info->family < ADRENO_6XX_GEN1) {
 		/*
 		 * This can only be done before devm_pm_opp_of_add_table(), or
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 390fa6720d9b..25ee6b277fe2 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -392,6 +392,16 @@ static inline int adreno_is_a610(const struct adreno_gpu *gpu)
 	return adreno_is_revn(gpu, 610);
 }
 
+static inline int adreno_is_a612(const struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x06010200;
+}
+
+static inline bool adreno_has_rgmu(const struct adreno_gpu *gpu)
+{
+	return adreno_is_a612(gpu);
+}
+
 static inline int adreno_is_a618(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 618);
@@ -466,9 +476,9 @@ static inline int adreno_is_a610_family(const struct adreno_gpu *gpu)
 {
 	if (WARN_ON_ONCE(!gpu->info))
 		return false;
-
-	/* TODO: A612 */
-	return adreno_is_a610(gpu) || adreno_is_a702(gpu);
+	return adreno_is_a610(gpu) ||
+	       adreno_is_a612(gpu) ||
+	       adreno_is_a702(gpu);
 }
 
 /* TODO: 615/616 */

-- 
2.51.0

