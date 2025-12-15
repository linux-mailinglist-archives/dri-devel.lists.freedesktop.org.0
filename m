Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FC7CBCFD6
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 09:40:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A6C10E3AC;
	Mon, 15 Dec 2025 08:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ipzbHdt3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZRnXts1E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3991A10E3AA
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:55 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BEMQmDk3647722
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ZtV4X5cR6Ur
 U16OtyrxKymwqQ6A4WNFYALAmfpTs2C4=; b=ipzbHdt3Z5lcQmn0jzbJcgXpN8W
 UfprVbrjyX2o7v4dGazqeKJk+z5+z+uEbkqeUyfRq3tdTAqZZeBbAfaylR0r3/J+
 lM+oCBP9415T45FFHQCSYOZrKMNnEf4B8iITcmo41KaIUtgvLutINk1QzFUAciXR
 QURaJOUNHdf9E2q6yV0+vxJzc8IncDdukXeePj8U5oigDWQ6Ixv4TVya4DpuiAeL
 lQg6+g9/0Aa7vdp1rUxSH/xYKMWx1rBRwlwekvDjqrcGPjBjueYOLG6i/Vtboz/e
 VJdvnfzKirxhGtf7OWixKI78Hu/Tr9CPXfB+vVa092DLKnkWJSbqRgv1SXA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11a7uruq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4f1dea13d34so43461371cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 00:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765788054; x=1766392854;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZtV4X5cR6UrU16OtyrxKymwqQ6A4WNFYALAmfpTs2C4=;
 b=ZRnXts1E/C4/y9fa0aFevIXJT3ob8musKninTtUSFukif82/FnAUmPpBkl0I1+xSiU
 h4XSxnQ0/hrRbFnAA+LpbFmDxZDfcVbhwheGEO5Z30YQXEcwPnZggi6tNMpIXTQDD2t3
 mYqRoQwr7YyZ1kU0XX3FGijf5Of0Oah7tmDO4rHhpc5dN4PopoIIXyuzn1WdBNu/9KV+
 iWqm3DkAj+SLHyctuq9KtSQaATq1mrjHGbWUkOAunCtK8KwjM4/dn7cYdCYac8VUS02F
 9vlqKJZP8iVOSs5AlxAne6tqZeZnqocvIGmYbfaNizPsale1LCVZXSI2Di4JKmvXkF3A
 faVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765788054; x=1766392854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZtV4X5cR6UrU16OtyrxKymwqQ6A4WNFYALAmfpTs2C4=;
 b=tmoMQEVwPS4u4/RPdFyWCTCtCcm8VvyiKop0wRI+Dt36lBnYkiz6Tdy0y2DrmOqYQV
 gjtNQ5q5SCHn74VX86vhNbRP6GOJH9o1ehKiy9aD5LbytaVy5aigwfWdl8yDphNQeZBA
 Vzhx2rScKi+GTaguWdIVlJy+wPmKe6mRAm2SpZG/x3oOe1Fh9/cvRRPETZhSohc5y3rU
 FWZjZrmrBAi2m372bs/oQY+RhoQaZI2KpZFP5nUbsujohKafcyj7hK2auz74EfQAePAv
 1R5031Xgzfb+0Tk+zowVXCLdoaf9JbjypaZgOHCDUS1GP6GhFJKc+pDqSjSVxHsKdmoL
 WaIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC/hUvvHuB1w2KbevEE6+NJmANf551bTzzTSZ0lIlnylY3Irt8zRMA/W1bULDX3QbG5YeSaW67yrY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwOMnm8jKCkQvIcRZSAJqlHuQqFpPmCccdVJnQYw1uOjN32MMy
 ddb/ep2LHAy7cVTCOetPEWb/6p9yFwFpBX+jQNim4SyTKgfuIIy0P3IuAegt0xjvE3btcCa+84c
 tet97umDaCe52ISxqMRO+ATxoZa898SwcQZ6CTUaIIZVsU+0nOg6JO7+24RBR/CfvpMbl2oI=
X-Gm-Gg: AY/fxX7IVnoC5i17xU9kTqeS+O3nKQx91Z3eJeOk222D/tdyqHXtUJPEnhjLXn3VCnz
 sTZj6dbpM4EObxQS227sOZPM/kfSBlQvv1NIChG+REQubLAbdGqA2+hCBVs1fbehZEhNHHm5+Qo
 5wZaMBRJQH9Eg/A/md+GP3QZ62ELgNwIxq7+y8OUB2iEmlNOu0ecwjNvdaySAtkgl0SdnAAajiB
 nrpaex7jpQJSMIyXT/UdaImX1wj34KdxcGiiV65nH6501D2c/2MBgX0PQ27WZ64++rtZHMdVsic
 OEOi/SSXXi4gU+Kl0Rso83icsd4/J1mCmlQMvBWBF7+G4/tNTv2zj5EGu/KiBtkQVnqceEmiR5w
 K18Apyun3gVZHvD9Wnjnad1/msd0YxycvpJOa9v2x03tr5tRjbaj+gPl/cCTMGF1SDzY=
X-Received: by 2002:ac8:5794:0:b0:4f1:c6c4:dbcf with SMTP id
 d75a77b69052e-4f1d05e1994mr118120851cf.41.1765788053699; 
 Mon, 15 Dec 2025 00:40:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/1noZeIOiPTqPNhvlgm4f0gFz0fAc6cRFHkHLSAhxls+TIUbS04EGECkvuqYtOB+uQYVx2A==
X-Received: by 2002:ac8:5794:0:b0:4f1:c6c4:dbcf with SMTP id
 d75a77b69052e-4f1d05e1994mr118120621cf.41.1765788053258; 
 Mon, 15 Dec 2025 00:40:53 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 00:40:52 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com
Subject: [PATCH v3 08/11] drm/msm/dpu: Add interrupt registers for DPU 13.0.0
Date: Mon, 15 Dec 2025 16:38:51 +0800
Message-Id: <20251215083854.577-9-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MiBTYWx0ZWRfX2gtWu0PTOy8E
 3XX5lyPnup28vldkOh1YWboldl4imjipFRvxYc5hej3bb8FNp7BZUG67t7ChSzQ0N6r908nZyqg
 U70Vf8UXGhOyxGnxCyqZKZe1Ove96fd4KuqhNf6VwOmHw4hP+gCKmypKE4F7GIZKLowe3iPU30q
 A+e7h2pKKK+ygFM+4j2KpQ4dq17Y3jUAVw62Beu/Smp9QoAbD/1Rn64nA0tA2u2EpRHt7zVDjXa
 5kFEZKjwyHicWMZwmjSJmigvOOaKcK7EYfrYIy0y0pj7w6btuJRUdZxS64qrHo8g/y+NlwMHmxU
 Guntcn7MwgRX1lK0cmnR3cTCgkpnvR7vlKDlMdUp5sTYU3qeBO7v9xsyzJrIeqra/0ElyIyI1MH
 yAXUGZJc1KVg18+TMf8wCfCO5KhVoQ==
X-Proofpoint-ORIG-GUID: SgfLs3L29LsVmgCyk3YdEsS2moR0jrxw
X-Proofpoint-GUID: SgfLs3L29LsVmgCyk3YdEsS2moR0jrxw
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=693fc996 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=RfJNy9JZAWTFlj1jTG0A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150072
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

