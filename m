Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0019B486ED
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 10:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343DD10E418;
	Mon,  8 Sep 2025 08:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DL/KVD5S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C90210E418
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 08:27:29 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5888GHYo029434
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 08:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RghYj3as/mFUON2I1wz5/fAj1x0bQSOJ2EkHGXZdsjY=; b=DL/KVD5SICPxQjay
 eFeelu87pJEtE6WyPpe/TbrQuhFmqAbxXEanWRa/HYkLRTbZY7bI0FXBkaVzQdIE
 XPtj0wNfimWN/yIk+vkgzff6kxC5Q2xAjGeY3SYxZzOodUwVAwhXSkVelgDuvbQ3
 UhV3NAlaukznrCuXfrc5FQ5GUFVW9h2EU6MAC0Wpl+rQI6wcPOb1nAghI/hmaUpS
 qeHVDlYITnLeChBHx3g30JBfcuAsa1o3z5mORSAhs/h+kz+hcuVUOFgIsdNudpHb
 /opQeMcoZhQ39scN412unwnlClsCTwR9L/vToA1RvX+TJ/4DY9R4tMPiPKgHh68v
 WFRR0Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapc1xf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 08:27:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7724bca103dso3323930b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 01:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320046; x=1757924846;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RghYj3as/mFUON2I1wz5/fAj1x0bQSOJ2EkHGXZdsjY=;
 b=WHmoHNc+ka8ScsvjQu9JdOZ0Wj1jGTuWDlyio6TNF/s7TbIKBdXcPEyRlyMltU34O2
 rglGXw0xEC4JftzIJARe04IdY35YTTkArHD/jJldAtBsAhdnXoaho96t3fsx0NZngd8b
 2A/dE7jEGdaDXn+UCprAmt4Jp+dSq4fMB6Wzi99PeQOFNGMAa8+gI9EGneOeJ4FvsNUG
 /Uxy8VGjxhkptgIakGgKXtmv441KBni/ciC6v1Rvyy5cl3QIL5p9dcoTuHa+WZ0dBGcp
 iY4U7e2TfXnkjASS0KAOo4vRUEo8n9Lrf1j1AmD43TwUUIwrFki/qOH456Gijhf2udKy
 2U4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGMhKt+KH8bVUtYqCFfPqWJx5yPfLEThLQoO/PIlJxYHHaYnhiFPaIBGPicYpGUH1FQQ5Gc4Qbq/U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyy7mYAxeO3mmMQBt5cXzRgSIu3Aw1GxqhX2Z2OGa3fmifMEWOz
 O2w9rPFdcCTj8kRxjNIuNTMSdxpbRk1bnyp4lcv9t06pmWUO9G0DCdxalkzr0AeQm51x8lMYinR
 qKqgY6bj0ZRqViw8m/EYBzguNPtFtdwFV8L2F3VtLgAEE9CIPXLEIXN7a8/kUzHSTVEz28Hg=
X-Gm-Gg: ASbGncuA6Q3VF6MgPUTm8839f97L0ujTzvfDoUqqlzSbxzMAClVz0h5ysphEW1RmVgM
 ADEfZ0PEkzAK9PNXNsC6lTQJeO5k9LYfIs/oRFlv+EHp7jLIxWeutw3ArDKzL2PhiRcjZA+ap1u
 YaUJjEeYOwn1dtrWsERzL4zv41Qjbui4WX5r8fPQj/IOGgN0Xm7nhaTLMDKnKFV1ca8KtbTIoTC
 Eo2K1u6uk+4/fgf4XmpoMIeKvmg4upbTYUmOvwWRMvvJnkftHinyvo0aZfNkrkkKUDI/Q/wXEqh
 lVIZ06T2yHHPpJDLIfkHbXngr2xzRQYjvZAiqtpsLgYwBdsLIS2RWXirwABk6cIJ
X-Received: by 2002:a05:6a00:1996:b0:76e:885a:c338 with SMTP id
 d2e1a72fcca58-7742de69de2mr8431453b3a.30.1757320046241; 
 Mon, 08 Sep 2025 01:27:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx1RcsKkYV36SjKV6SXfFHKm2oYnM/mkT0SUBQ3saOJZigojpOYtZEoUOvIGnympk/b5UAYA==
X-Received: by 2002:a05:6a00:1996:b0:76e:885a:c338 with SMTP id
 d2e1a72fcca58-7742de69de2mr8431408b3a.30.1757320045741; 
 Mon, 08 Sep 2025 01:27:25 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:27:25 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:56:54 +0530
Subject: [PATCH v2 01/16] drm/msm: Update GMU register xml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-1-631b1080bf91@oss.qualcomm.com>
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
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=2416;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ji+f74TQTXhSJNywxVcexEvz4zhxi/UIu3IXlExTfoA=;
 b=bIRH6FXgHyR7N5ev4ctKZhftLdIKx0rpAmxgC6FNREj2Ax/ZvRvRsRJ3P1WOqGT3PxAMxB+2i
 sTYaqLCBQxkCyNiUTjyCpWkLVGXVXmHRSBynKixHcZVw3pr5Q4iSj6O
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68be936f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=FORX3M3cBL6yUa9eRaQA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 3GWIo17yu_tXbn5ICihEzOhHbAM2xpp3
X-Proofpoint-ORIG-GUID: 3GWIo17yu_tXbn5ICihEzOhHbAM2xpp3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX1ThvbxI9TCt4
 vfgRulmsRpwkFgo+f/hhSDwtxHFb9+yqQh2biFHwqp6bMa8Y6jPVxp379znPnBIAaNN8fCygGm3
 2w+My+beSYBY4azYfcGS/kRhzWajDmIxrTZO0FZkiC7Q5j6zvQHmWxNuKd6drSG2WKGoQyskT5h
 YHdc7Dsn/g4RO4NZL3KycbXP0GeFI/IKvIRCgtESjPIq7ckpu0Vzg+ZF6MDDkNPos2YcHebY9ai
 WC98qiUKFPB8B0OEzxsM1J/e7I3M8WV6zbP/DvFe9mHd7zPrTpGQqgtg5L1jC6m/GT8l9K2XyMM
 myC5z8/b1zkIQr0jGyJuWWwW0Nn15PLCApT1wZb4q0SV2oWUEe36CvMsdUeczWK2xkXxZTB8PmG
 +IHwbCu9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

Update GMU register xml with additional definitions for a7x family.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
index 3d2cc339b8f19c8d24b2c9144569b2364afc5ebc..b15a242d974d6b42133171c8484d3b0413f2d3a4 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
@@ -99,6 +99,10 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<bitfield name="GX_HM_GDSC_POWER_OFF" pos="6" type="boolean"/>
 		<bitfield name="GX_HM_CLK_OFF" pos="7" type="boolean"/>
 	</reg32>
+	<reg32 offset="0x50d0" name="GMU_SPTPRAC_PWR_CLK_STATUS" variants="A7XX">
+		<bitfield name="GX_HM_GDSC_POWER_OFF" pos="0" type="boolean"/>
+		<bitfield name="GX_HM_CLK_OFF" pos="1" type="boolean"/>
+	</reg32>
 	<reg32 offset="0x50e4" name="GMU_GPU_NAP_CTRL">
 		<bitfield name="HW_NAP_ENABLE" pos="0"/>
 		<bitfield name="SID" low="4" high="8"/>
@@ -127,6 +131,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x5088" name="GMU_ALWAYS_ON_COUNTER_L"/>
 	<reg32 offset="0x5089" name="GMU_ALWAYS_ON_COUNTER_H"/>
 	<reg32 offset="0x50c3" name="GMU_GMU_PWR_COL_KEEPALIVE"/>
+	<reg32 offset="0x50c4" name="GMU_PWR_COL_PREEMPT_KEEPALIVE"/>
 	<reg32 offset="0x5180" name="GMU_HFI_CTRL_STATUS"/>
 	<reg32 offset="0x5181" name="GMU_HFI_VERSION_INFO"/>
 	<reg32 offset="0x5182" name="GMU_HFI_SFR_ADDR"/>
@@ -228,6 +233,12 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x03ee" name="RSCC_TCS1_DRV0_STATUS"/>
 	<reg32 offset="0x0496" name="RSCC_TCS2_DRV0_STATUS"/>
 	<reg32 offset="0x053e" name="RSCC_TCS3_DRV0_STATUS"/>
+	<reg32 offset="0x05e6" name="RSCC_TCS4_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x068e" name="RSCC_TCS5_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x0736" name="RSCC_TCS6_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x07de" name="RSCC_TCS7_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x0886" name="RSCC_TCS8_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x092e" name="RSCC_TCS9_DRV0_STATUS" variants="A7XX"/>
 </domain>
 
 </database>

-- 
2.50.1

