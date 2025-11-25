Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 334A7C838D2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 07:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8146410E355;
	Tue, 25 Nov 2025 06:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BaDg3Zts";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qm7SXLOH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C1610E354
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:49:39 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP4wKL91672539
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ZtV4X5cR6Ur
 U16OtyrxKymwqQ6A4WNFYALAmfpTs2C4=; b=BaDg3ZtschB6e07Sx+8ui2qu92j
 9TRotQC8bRrFgSaxJRMlwBy06ZFM0ODpA4mzF+3/aBRFjLiwjkxbY/01l+IJDdR3
 ex/vOTHgvLXqVGqY1HafwDgswbSXZ1XeMku35Cf07u0lUuBExXjEzEvlNWEmwHfc
 wuhCACETM+G6TedGUtjyo4JrAQFf+mHP+02PKbap/iGELYorDD0jPxchBKMx2MQI
 Vt0M3wS9o1l3gKYIQ/9R4jjlCldWfDadUQ2F+dFnpaFjHzqxLeZxIiG01cKR/zTa
 SQoSh5VBddicuvxyaU0K3wtXlXAayE7sjWrQ+DqdcIgJyj62sIhHaPk0dtA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an5w809s1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:49:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ed79dd4a47so128719921cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 22:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764053378; x=1764658178;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZtV4X5cR6UrU16OtyrxKymwqQ6A4WNFYALAmfpTs2C4=;
 b=Qm7SXLOHEr/Th36egIdEIUwTa30dh0TLcdinqG9hyX2tP27eQ/T80l/6QxbN3diveB
 ZjSMIupHeW0z9oMyZbj3PeyUTHr+//kVM7lTuq2wbgOHKp55zoRKNGo8AGZ+7uog8hP6
 4OuZjNisYRWp47xcyZepzCVDx8uUy4Pwiqe55oQR/zkD3Re5io4fleneKiVmoYsFHVIz
 ZncSwAZbQaoJ6BOpR8o+AJrDNTVbIcUObQPr7uJB4QybI5JbTnCQkouV3vv6reoiLe2L
 GXTDKTJBvty8wPtzcMpFe+3k7X+lvuiTC1qFTexNwFL+a+OGVL/AZUDIa1LmS84QH/m9
 pPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764053378; x=1764658178;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZtV4X5cR6UrU16OtyrxKymwqQ6A4WNFYALAmfpTs2C4=;
 b=YuolbFzvrMoHu7hTzHOMobs6WXnoq8jiLbhlH+j4EsGb56qlObTOhDcFXmL1c2Crk1
 0+4mLgHsPokYLJVRkMyBNS5c3xS3jLraIap9aK0Rlu1YY0J5VgF56A2FSOWkV1ovLK/P
 Ur/PVMUUUg1Re9csTg/A1GG4oIY0awgTfoLLMBPO/FUgBuVmbVzqgcYo71KpLCs+xJSA
 00s6Bn/knsXREKsci2BZHw65AW+4CcTi91GeekKI+OS37OatnRCqVxgH0yeiK8Z5golj
 Rd/PnR2aN4A6Vmf9T4lXPiJ7TqTBgUbVcpyZF+/1VM1eB/gY8QfH6YMlbdzKBnHBYvcr
 z0Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWno35s637PCblon5p1t29ep+w1mq+SoKif8Ih6isbTO/+fZuH/5vj4AQE6BYcFCUGjzAIEciPyego=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdmCeV8UnlP0SpCjj5bpu3XFXO9j3yEmRB1640Sa5qOM3R1t/J
 ld3GieLArBCbvW9auzcLkFAoRIGSF+EIdtM1WNUSOnnD17KfyiPkOcHkQKfVZSZ601DSB5E5dQ8
 QXD7tsgyOjsPpiWOYOcXTlPesFmQ3mdf98wIE5F/jqOqElrKbuY//r7J5QBwdpsYjUleP614=
X-Gm-Gg: ASbGncsBedPIQyS4GORRnKQ2jLS4ExyrMscyiPSlstOkVWuo72eKhrthgTSYkEo5kBu
 aks/Jgqmxmd7Kqi2LA66R8LmCW1ZpVoT1vNvWv+q8QzQ5xB6PzuzKxIYqEuilUhjHjM21/9Bv5m
 YXePud8gXBx+/NQsjtLZe6F8Zy1w6anzCLaWuEdlacCONvsCdzbhT8iNQNVgcy7088+yJNe1bgK
 R8Tz7yYYZisKZurO7Bqsv2yRNUXL24X2cb8AbIOulx/LwNFwgYl2n9gdksbrN8bZk/4qhFrqomw
 Ku0wVy8VVG5zVcfRdefig7YGx9lBQfTRi/F1/FcmLHhwMuWJjHGYnaWq/SqLfye6HxKdsJBGP5u
 i0wkgridkAxoiB1Gil8AycQ12I8l9XUWcVVApFsD99T6TS3kOa+LTEejeE8MVcyRzZ7dAZCg=
X-Received: by 2002:a05:622a:282:b0:4b6:299d:dfe4 with SMTP id
 d75a77b69052e-4ee588643b0mr179856201cf.32.1764053378332; 
 Mon, 24 Nov 2025 22:49:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHm/Df/TMVkbw0+C52gzCmwzm6S2/Yi7LKlRQTQ1LKoSX7qQJ5OsrNdtob4J3N0FtyBo01Ycg==
X-Received: by 2002:a05:622a:282:b0:4b6:299d:dfe4 with SMTP id
 d75a77b69052e-4ee588643b0mr179855831cf.32.1764053377853; 
 Mon, 24 Nov 2025 22:49:37 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 22:49:37 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 yuanjie.yang@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v2 08/10] Add interrupt registers for DPU 13.0.0
Date: Tue, 25 Nov 2025 14:47:56 +0800
Message-Id: <20251125064758.7207-9-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfX96IU0z3ZRHdT
 vqu6Vxh/hpe1nwSIDH3dflWcI3WumRVOgDEbXsKUKVJmHbBKYxiUF7ZmBC8L6u4MChKGq/8qh4q
 7zmR3zBcV6PW1nx/Bv6AurA/J+9+dfYrKsf7JNC7i5T/dOTnHzChWVM8IxWu96AcTGP8t8Kx5pB
 kYC/HukE0n9gtB71bCTv1K0WW+p9LWJPX9kZ9IUVaxotIWd8gkDJhpeznJxsLtnETbxk8P9SkPw
 D2DeGBDwSpo+OC4727b/88e9efk8ojQGoyG1j49YHeuM43418uNfwFMvdwnXf3jUrHEA2nPWol9
 slD749GNVDvFZ39bJlK0j8Vc02jE5EM+z7dAsHE4sELTJwPXIVoVHEkbn/jjsh6f2yvU6edRO5L
 ks0WNI2SM7Emj3qksAvLobGEiSZbBA==
X-Authority-Analysis: v=2.4 cv=RvTI7SmK c=1 sm=1 tr=0 ts=69255183 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=RfJNy9JZAWTFlj1jTG0A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 41DWIdOhRo0kNdPJqtelainZ9goNOvO1
X-Proofpoint-GUID: 41DWIdOhRo0kNdPJqtelainZ9goNOvO1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250054
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

DPU version 13.0.0 introduces changes to the interrupt register
layout. Update the driver to support these modifications for
proper interrupt handling.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 89 ++++++++++++++++++-
 1 file changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 49bd77a755aa..5b7cd5241f45 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -40,6 +40,15 @@
 #define MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x004)
 #define MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x008)
 
+#define MDP_INTF_REV_13xx_OFF(intf)			(0x18d000 + 0x1000 * (intf))
+#define MDP_INTF_REV_13xx_INTR_EN(intf)			(MDP_INTF_REV_13xx_OFF(intf) + 0x1c0)
+#define MDP_INTF_REV_13xx_INTR_STATUS(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c4)
+#define MDP_INTF_REV_13xx_INTR_CLEAR(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c8)
+#define MDP_INTF_REV_13xx_TEAR_OFF(intf)		(0x18d800 + 0x1000 * (intf))
+#define MDP_INTF_REV_13xx_INTR_TEAR_EN(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x000)
+#define MDP_INTF_REV_13xx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x004)
+#define MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x008)
+
 /**
  * struct dpu_intr_reg - array of DPU register sets
  * @clr_off:	offset to CLEAR reg
@@ -199,6 +208,82 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
 	},
 };
 
+/*
+ * dpu_intr_set_13xx -  List of DPU interrupt registers for DPU >= 13.0
+ */
+static const struct dpu_intr_reg dpu_intr_set_13xx[] = {
+	[MDP_SSPP_TOP0_INTR] = {
+		INTR_CLEAR,
+		INTR_EN,
+		INTR_STATUS
+	},
+	[MDP_SSPP_TOP0_INTR2] = {
+		INTR2_CLEAR,
+		INTR2_EN,
+		INTR2_STATUS
+	},
+	[MDP_SSPP_TOP0_HIST_INTR] = {
+		HIST_INTR_CLEAR,
+		HIST_INTR_EN,
+		HIST_INTR_STATUS
+	},
+	[MDP_INTF0_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(0),
+		MDP_INTF_REV_13xx_INTR_EN(0),
+		MDP_INTF_REV_13xx_INTR_STATUS(0)
+	},
+	[MDP_INTF1_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(1),
+		MDP_INTF_REV_13xx_INTR_EN(1),
+		MDP_INTF_REV_13xx_INTR_STATUS(1)
+	},
+	[MDP_INTF1_TEAR_INTR] = {
+		MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(1),
+		MDP_INTF_REV_13xx_INTR_TEAR_EN(1),
+		MDP_INTF_REV_13xx_INTR_TEAR_STATUS(1)
+	},
+	[MDP_INTF2_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(2),
+		MDP_INTF_REV_13xx_INTR_EN(2),
+		MDP_INTF_REV_13xx_INTR_STATUS(2)
+	},
+	[MDP_INTF2_TEAR_INTR] = {
+		MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(2),
+		MDP_INTF_REV_13xx_INTR_TEAR_EN(2),
+		MDP_INTF_REV_13xx_INTR_TEAR_STATUS(2)
+	},
+	[MDP_INTF3_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(3),
+		MDP_INTF_REV_13xx_INTR_EN(3),
+		MDP_INTF_REV_13xx_INTR_STATUS(3)
+	},
+	[MDP_INTF4_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(4),
+		MDP_INTF_REV_13xx_INTR_EN(4),
+		MDP_INTF_REV_13xx_INTR_STATUS(4)
+	},
+	[MDP_INTF5_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(5),
+		MDP_INTF_REV_13xx_INTR_EN(5),
+		MDP_INTF_REV_13xx_INTR_STATUS(5)
+	},
+	[MDP_INTF6_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(6),
+		MDP_INTF_REV_13xx_INTR_EN(6),
+		MDP_INTF_REV_13xx_INTR_STATUS(6)
+	},
+	[MDP_INTF7_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(7),
+		MDP_INTF_REV_13xx_INTR_EN(7),
+		MDP_INTF_REV_13xx_INTR_STATUS(7)
+	},
+	[MDP_INTF8_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(8),
+		MDP_INTF_REV_13xx_INTR_EN(8),
+		MDP_INTF_REV_13xx_INTR_STATUS(8)
+	},
+};
+
 #define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_BIT(irq_idx)))
 
 static inline bool dpu_core_irq_is_valid(unsigned int irq_idx)
@@ -507,7 +592,9 @@ struct dpu_hw_intr *dpu_hw_intr_init(struct drm_device *dev,
 	if (!intr)
 		return ERR_PTR(-ENOMEM);
 
-	if (m->mdss_ver->core_major_ver >= 7)
+	if (m->mdss_ver->core_major_ver >= 13)
+		intr->intr_set = dpu_intr_set_13xx;
+	else if (m->mdss_ver->core_major_ver >= 7)
 		intr->intr_set = dpu_intr_set_7xxx;
 	else
 		intr->intr_set = dpu_intr_set_legacy;
-- 
2.34.1

