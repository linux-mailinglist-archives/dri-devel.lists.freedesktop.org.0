Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AC3D23849
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 10:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C123A10E725;
	Thu, 15 Jan 2026 09:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B3AduXVj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UoUbX/Gh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DE510E720
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:29:13 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6fcjK606204
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=I87OukHNOgS
 eTgoOXQALSi1N6P0XQunpMCBrwQ4g5NU=; b=B3AduXVji1zoURleuuOhK3oQdx7
 6NRuvXB+sflMwvuDIv1ZbZwrMlthUaCrt+U4unJw/WxvIWFyNwrXg82klH8/5um2
 pPqulZV8fDFIXu4C0uAeQ7lwhEC3BHYelfi3xQII+X0dDph5cur20zGmuIJNIFjz
 sukWJw5FFfiY3hiUXzejcvu17NNZv7lEQ7+Hy181VvHmpO2zdXB6jtPXNgOa4NJp
 2GuM1PTYnV7tsRlcEtklwvSgdVR554fx3ultDjj1frl9uwGI+/NBDGSVcyK54zb1
 Oyaw2y6qyWIh9M6Lch2vmoBVfemxVw+c+pd+M3MpjH9mxvsAvQTsUOq3PGQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptna0jkh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:29:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88a47331c39so15892156d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 01:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768469352; x=1769074152;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I87OukHNOgSeTgoOXQALSi1N6P0XQunpMCBrwQ4g5NU=;
 b=UoUbX/GhrxjSKqYts63qoiTAYNWDLvR0LYNHFggSOF8Ljj2EGM0crfiJJGP8byGpYA
 J5DVYxFRc/LT74Gi/Txwfa+DYoWMiR1BVjqKUGgUwbLzz7O2NeQA42HPJZxAkTS/Vdyj
 1gknXPgH7tKpKEwcuUVJ0k545nKecDyQ/yEggSMzGV283wWf4D+xnWxW0JIWfR4BM42s
 U8Rh7rBg3Qgyz35zpdlMibBeDWttEx8lRJvTT4FTd3m7UPQCn3AJv4j8StetOBkQHgIm
 iNVkGWANSboXGUsic0NGOT2fIOpkc44rHGEc+8rjGcRat0HfqdogTX4JUm6eX54FBnNj
 lPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768469352; x=1769074152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I87OukHNOgSeTgoOXQALSi1N6P0XQunpMCBrwQ4g5NU=;
 b=gqeRKAbDG14VxVPMNttx9V9XKjHz7V9Wpvil6WbvrnIPDEFpGInhsemoLHOG0j9jM2
 Kv34QQ1XPEj6nstz0vhIsHhPnZL28tjGa2n5DmyuUIU8vQP67RTeWSj0kfnbW9Uy5am6
 iBLbDr5K16+P4Og1WMyONi+uENUQUkjoeCOrFHctsFEIVsiNKu/jLtGo+MOuNydY4tUL
 1HhEKdwkr9h7BRflb+kHNWuLbxxtfUP8rN8gedI65hXHxMIAieMjGqHvZ8p6msnyEu/h
 YeCRlp84K2xzpTcJXTV879tEf3TxYRniQgvfvP7jd6n7d00aau53/wWzRX1hg/sInotb
 nYsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5YalLQK5/4uYC1Zw4BPR5Z85xyhNulC+j1tTPDoqKHxSqGGsSezPwwuKmkJrctllaoMangIMNG9o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+mJdoMt4EFHKf1xX90mE0EKdEhCbA+AzlxUxkJbg0hOFo3gme
 06WVqjp7A8hJkqfVu9GgqF6+fwFbbSpz2uvXiyAscMiwqLCM6wOoCnUar5ATDJ1aUEttO+mQFXZ
 bfoO39/ImUbAfmpRaNeCY91bJF8fI3l4LfcXQuSN3aASG77OsR8/8wkBBuvPG2F1xu6TUzg4=
X-Gm-Gg: AY/fxX4TJThpwDNd/SgG5UeY+3orNoZUezJuBp8WpZh62BCR1ttj5DiIIrttF1ZPBDp
 U5TwNcdKVMJaG89sHJ57zpaq8qZU560giciyIVKiaSY994jGBOWHmGkJjfdl5P4dlWZg4GeOdTL
 N08HhG/G+yGZcB+zq44Y8+Bw1OE/q+45JoAzFfVD405h2i2yOHavGDCVrQjbY5+1Py6LwWpN1Bo
 8vFXe/5CcZhoKWwUyYpkzqqnVAmA5Ki2SqBPnvOPTzoUCT8NdNUrlwxsDmspfS9FzfQCPEjCGq5
 wfjIFEGiwP6fq+Edk6UMDTxP7FbAPVUC5FkHWglrxhNFNLJHhZuSgVUdszOLg8EcbwvwrNiJNyz
 ow01i6ND57m+q7ORQ+pnTM8ZtFQf/5aV7O94iesk6y4sIIn4hskwwmJ9hXR0PPYpoKIA=
X-Received: by 2002:a05:6214:5182:b0:880:5193:10fb with SMTP id
 6a1803df08f44-892743c8cc0mr83008406d6.54.1768469351679; 
 Thu, 15 Jan 2026 01:29:11 -0800 (PST)
X-Received: by 2002:a05:6214:5182:b0:880:5193:10fb with SMTP id
 6a1803df08f44-892743c8cc0mr83008096d6.54.1768469351265; 
 Thu, 15 Jan 2026 01:29:11 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 01:29:11 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 08/12] drm/msm/dpu: Add interrupt registers for DPU 13.0.0
Date: Thu, 15 Jan 2026 17:27:45 +0800
Message-Id: <20260115092749.533-9-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: glbdmI0MGKBDxn21870cDyobMyXP_Vai
X-Proofpoint-ORIG-GUID: glbdmI0MGKBDxn21870cDyobMyXP_Vai
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfX/34oT/KuVq1M
 RxK1/G06GU3E6fTTLgv22BFR7/jIj/FIaFFPfvCUckep1Q8l+0JXLP8LcRAwTb3MOtQqfWFB/o9
 NB5SVDrriV6ss/Hf66LHqQztYlMX4nrWJ4JrUXrO3BUsAvjdzFf1OhezKMQp2Xuph89fPUdiDBN
 7cisRghZYckiknUBQc3JSN++7IODiYktr/yfltidleg5z+OkwMaAn+/hZuptLakNz9kR6Us0jx4
 GO1FO0wfL2ceeUrFmJuwoDRzjDiBRbrhAAhzSeYQoJSqHKYf884F0GpylYNSM4CgmRMIVh7RAHU
 sH3A2lpihKhbqttljS8GCrGJydxy91cfsWVNqiMDfgKK/4P7IWDv2NFWfaZVU52jPTIU2Cute4Y
 xzM7DLayssad7fJVrodApv+eqITDLNSs6CQQ+uYpm6ku7zNrV3WyZsGDjfJp40qNTDgq5yAIjxn
 M63lSk+Jk0VHTjIfhOg==
X-Authority-Analysis: v=2.4 cv=fsHRpV4f c=1 sm=1 tr=0 ts=6968b368 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=RfJNy9JZAWTFlj1jTG0A:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150065
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

