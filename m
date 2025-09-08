Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84048B486F5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 10:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C239B10E44F;
	Mon,  8 Sep 2025 08:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mWI9YHWL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820B810E3F4
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 08:27:42 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587Mt9gW027195
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 08:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jzazIGzZ/t3zV87a3OBQ5k2i0Hby+qyQ7WI+u2m4iEY=; b=mWI9YHWLpV1tGAtZ
 o4n5P0TIcdd8Dy0MGJu9kjUPiyp+vmmhe9xD0KbnlVX6XBEPOVYuJSi6Xxl0yS7a
 yLGEO2LMl4q7K+gPB7FaNWtssafnHdWxze4fGlh6MdwbBpnRkenr9eBrmEt8l1On
 Y+EMMFP0EAWFrCdLrhC9oKXSVT3KhWIEObmSFoC/GgqtWOitn3DTnHB3ecrh6XE5
 AIVjPkg0lmbM+d7PUHhM08azLGseMMeta/KQQk6nB7M3Uf5+x0jXNHm6RGEUU5z9
 TlxWsnSgkzFyvQTKz+Jxdgs9GjC9wtJk+aVNZyKo1albDt+ktUMImG3z29AZP/Zo
 +DlvLg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0ku4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 08:27:41 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7724ff1200eso3754442b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 01:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320060; x=1757924860;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jzazIGzZ/t3zV87a3OBQ5k2i0Hby+qyQ7WI+u2m4iEY=;
 b=G7v5gjxL0OEHjx+UJBQ3bS/wFDLvMdwhgyszVMl7nyXBXu6zKj6I+cn57zCrFRkYVG
 0+ey4Fi3yZkRCVMgia1gPvgOcxwQwdJee2vP41aFX8Em6KDdw+DuExwTBrgHdvUy9R9v
 3PZljJNDG5TM7I9Xc2dpSqKlLAqUxsj1XvhQz926YTWs7bVjNe5Cl2xZtDUvLdlL4+Nz
 BbgH99c2eSI5SOP9mGf0fvVKSsKsu8p1eAa8x9JQvRRlK7yxf6JzkGkzmsL/Mxyb5D0R
 BiNYa3mINhSgBjeTlD+Z827KSe12yHB+ouvEEGQ4kMWPB1oaAHfeP1QoaNAD9pgze6Q6
 GgOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3K7Q3m+HCXtP96/JX7FywUH96HNuboi/tZmmiMDeOGzmBWlBcl2804cbCKp8Tg17T+1+faB4FxTY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLApqEdt9fLfBKs/1LSvbBD2RmA59mwczzSFPYnsYhnQcXCMOu
 YN7Pmtc+2I8AOGP41uhU76VpsPjgMQI3+2ExoAeNJGQIdyGTzTadUqvIfyU0bCV4wqLzjoezcpy
 guj1q8HFMJPo4A0WINVrWa8zQf63sTlWqohams2qIq9/KE8PIlDeIH0+5cCq3jXdDHv/xjgg=
X-Gm-Gg: ASbGncsSb3+mznMUlY/aPZXotVE6YwkUWyRJ6uwrHXAJ+SQNWlhBcDeWSogHCnWJUg/
 cCJghlPDUJOulCW+tMtDO/t8Fa5zbujtXW17LZZ360LXvZm078RfN2xD7KldQ1oX+wcOT6n8Uc1
 BUKBXz9FfSUehBbZt0QoYu74VkWtzhiQG8UHyMGOaxs5CS4CFlvKfxuKnsTHy8c7vgS5l1quA6z
 SE58E9tUXTLm6WFFiHs7pjUgy6CU6L2lHb+3zimOPArpbiB5pDUszPNvQJRwFA/7lVoNOzfVGqz
 m5fsVPypkS5w/uzV9EI6/jniFTASYcNK8f9d30dg3L9uwbFPEHgkKBMlut2Eu9pZ
X-Received: by 2002:a05:6a00:13a0:b0:770:579a:bb84 with SMTP id
 d2e1a72fcca58-7742dca7eb8mr7517546b3a.5.1757320059704; 
 Mon, 08 Sep 2025 01:27:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsPuW308JspzsiBLsT9VDk94w9AdRmHL4vZNlbS733C/aU1uZfvEcmFy4pBw35K0EQ8R8XEw==
X-Received: by 2002:a05:6a00:13a0:b0:770:579a:bb84 with SMTP id
 d2e1a72fcca58-7742dca7eb8mr7517523b3a.5.1757320059121; 
 Mon, 08 Sep 2025 01:27:39 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:27:38 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:56:57 +0530
Subject: [PATCH v2 04/16] drm/msm/a6xx: Fix PDC sleep sequence
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-4-631b1080bf91@oss.qualcomm.com>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=4096;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=giC1WMM/22jbsYABWcvDAeFCcEWVS1OnTn0KmBBmmok=;
 b=Tb5Zcomn1I+DstzVX10EQ5FnDJHdOVbMDBWYloXfnfItaUHkTGKpcpE4K3t4PP6tKwRxxju3G
 JYCJ5GOSGTTCayUcml6GNRYQLBeM/t+yZ0BwdS03XPaBqow4gw9U6UI
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: DESBzjcJrR2fOlsLeWpcQZy9FmhCEF2d
X-Proofpoint-GUID: DESBzjcJrR2fOlsLeWpcQZy9FmhCEF2d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX7ZhjOE60Mdnb
 o8e2bdoZJHachoEJH0P1nQm+HD8PwtxR9e3+Lk2b+dctWYOAOwZpmj0RenEcRXBt7TxuS9cP1o6
 HX1sUpXZM8jMAytS5Zcnary9fkSy6gd8n5xBypoJsMAd/T3XANh61PL3WtSv2YK360MCw1p942W
 yH2qfJm+NR0NGNNgxoJJwEwc9M2yX7xYXsP8vxuEFAnGJh8fjEe4nI50SoYbJOhF1O/YNLkkO+n
 +UuKR84KkgHBQHTNDjnMpqFzPSMFgicsc2rDMooIgbE6r4eeaNaAopjLuUCbZYsU+KB16wo3igB
 4GBAV+EBcZhWSWnAbwy5q2iYfwyMlzd2maGv7oU6rsS4YRMfVFyRx0ueVznCo7BAeBpi+OXbmKa
 jPdiJ89V
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68be937d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=R1CZgRJynTePKTnkIkwA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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

Since the PDC resides out of the GPU subsystem and cannot be reset in
case it enters bad state, utmost care must be taken to trigger the PDC
wake/sleep routines in the correct order.

The PDC wake sequence can be exercised only after a PDC sleep sequence.
Additionally, GMU firmware should initialize a few registers before the
KMD can trigger a PDC sleep sequence. So PDC sleep can't be done if the
GMU firmware has not initialized. Track these dependencies using a new
status variable and trigger PDC sleep/wake sequences appropriately.

Cc: stable@vger.kernel.org
Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 28 +++++++++++++++++-----------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  6 ++++++
 2 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 06870f6596a7cb045deecaff3c95fba32ee84d52..ba593ccfe3c6a2f3a2ea0db3a1435d0668ed7bf2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -279,6 +279,8 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
 	if (ret)
 		DRM_DEV_ERROR(gmu->dev, "GMU firmware initialization timed out\n");
 
+	set_bit(GMU_STATUS_FW_START, &gmu->status);
+
 	return ret;
 }
 
@@ -525,6 +527,9 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
 	int ret;
 	u32 val;
 
+	if (!test_and_clear_bit(GMU_STATUS_PDC_SLEEP, &gmu->status))
+		return 0;
+
 	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, BIT(1));
 
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_RSCC_CONTROL_ACK, val,
@@ -552,6 +557,9 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
 	int ret;
 	u32 val;
 
+	if (test_and_clear_bit(GMU_STATUS_FW_START, &gmu->status))
+		return;
+
 	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1);
 
 	ret = gmu_poll_timeout_rscc(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0,
@@ -560,6 +568,8 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
 		DRM_DEV_ERROR(gmu->dev, "Unable to power off the GPU RSC\n");
 
 	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 0);
+
+	set_bit(GMU_STATUS_PDC_SLEEP, &gmu->status);
 }
 
 static inline void pdc_write(void __iomem *ptr, u32 offset, u32 value)
@@ -688,8 +698,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	/* ensure no writes happen before the uCode is fully written */
 	wmb();
 
-	a6xx_rpmh_stop(gmu);
-
 err:
 	if (!IS_ERR_OR_NULL(pdcptr))
 		iounmap(pdcptr);
@@ -849,19 +857,15 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	else
 		gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
 
-	if (state == GMU_WARM_BOOT) {
-		ret = a6xx_rpmh_start(gmu);
-		if (ret)
-			return ret;
-	} else {
+	ret = a6xx_rpmh_start(gmu);
+	if (ret)
+		return ret;
+
+	if (state == GMU_COLD_BOOT) {
 		if (WARN(!adreno_gpu->fw[ADRENO_FW_GMU],
 			"GMU firmware is not loaded\n"))
 			return -ENOENT;
 
-		ret = a6xx_rpmh_start(gmu);
-		if (ret)
-			return ret;
-
 		ret = a6xx_gmu_fw_load(gmu);
 		if (ret)
 			return ret;
@@ -1046,6 +1050,8 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 
 	/* Reset GPU core blocks */
 	a6xx_gpu_sw_reset(gpu, true);
+
+	a6xx_rpmh_stop(gmu);
 }
 
 static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index d1ce11131ba6746056b3314dccdc3612cf982306..069a8c9474e8beb4ebe84d1609a8d38b44314125 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -117,6 +117,12 @@ struct a6xx_gmu {
 
 	struct qmp *qmp;
 	struct a6xx_hfi_msg_bw_table *bw_table;
+
+/* To check if we can trigger sleep seq at PDC. Cleared in a6xx_rpmh_stop() */
+#define GMU_STATUS_FW_START	0
+/* To track if PDC sleep seq was done */
+#define GMU_STATUS_PDC_SLEEP	1
+	unsigned long status;
 };
 
 static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)

-- 
2.50.1

