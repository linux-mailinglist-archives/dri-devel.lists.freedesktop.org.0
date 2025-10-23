Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D9ABFFBA9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 09:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFDA10E8C4;
	Thu, 23 Oct 2025 07:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bo4C36Or";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF3A10E8C4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:22 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6YaRK018153
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=2+NE/Af1iO8
 IikWgwbLW4+s7TSryYrkY5597Cn42VwI=; b=bo4C36Or2X678XLhHCUndFZMhMz
 yQ25fxDnxRYWsv3Aacu9H0FI4VXgNj/84LJU4ElLmAo6POqapgG9BxJ1gN8K4q/G
 nhqJy9J/XgioGMQCA7cuKw/nmH3OO+luZdHzwbHDa3DExrm09BJ21/nfJFE5ITrG
 C5/tJxmD5dnvsaBpbtRydKhILEn+GnRE5QSBDVh+bkzu/wY0x42mMC3OI4oDZygt
 7IZj7ZlznFefeX/6eiAx+SbammfKZQoYWZfCfpjYn0fhfut0Wmpk9agLI6RbZfuy
 9/SWYRrgSOG6Mw6Qm1UZhh2Kjbs0ZochMAZ4v+mzMXt0oAuJyOZsvafL7+w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsd4bd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-28c58e009d1so14344005ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 00:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761206121; x=1761810921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2+NE/Af1iO8IikWgwbLW4+s7TSryYrkY5597Cn42VwI=;
 b=fzHYXL+LHY2QjsWUO0ClS/CLHk2LJAFNS9w3v3S5MhS3VI4zIsguuelH66SPOqkBG/
 D4CETai7Py+n6ai+6ty4slNHcEROZwGhsLtnhh+9qXaEOPh1zPhH2bATCfNJz7lHcXZN
 +JwhsceoLdzQFnyL1tZwrZBZmFu621kim3kDjz6BTmHJHlqi2LwlyA0uKyfNp0vMXVA7
 c2ReIX5iL1qZZ4ceV5RXVgjDje0ZA2COO1We7pP2jkh0wfS4xLj811RL22B3OxoP9/ZF
 O0HvNCN/U/vQ98363vXvFKECdITLJ/b/q4h+i59yxES6D/1o2lPFBFehyyvtZqdVTWeF
 BDIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFVaMlC3xAxTei6Q+j/HYp4yVEYTDhS5mD99Ksc+QABNlE7WBcMaM1gxO6q1+JaX6W/iVs6oRsC8k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDWAluXZ0yNrc3zZmKIumFm6UEGokpL1JoGnayBO2nCyEYhflC
 uxw5JPksBTA/fRzc/iMlYg+13Yq6mKkWRh6TcRnmbjJ03dFqx7ZW9232HXC0LjRnepdZnDxd+2E
 dg1WdPXVFdvNd3y+bVRya4zjqYANAcfB5zGkV64BieBgaCqL+vBgyCT8iPX7DcIrSJRzxiRA=
X-Gm-Gg: ASbGnctrm6hjMnmG0RvERH1N8vAfwmhlSgKxsXeBl/ZcU50sf7qe1EMoasLlfYUcadp
 kUunwmXh4CNYLORMiNsW0GdHNky3gKFmjoC/g6gYoINYxQQ5/P8Y0kn0PP04PivZkVg+MZMNJak
 Ep7xEqHT1pOga7439skGZ6QTaNAL0bsvpb2qpSqVzagDWQ3VW9paip9EsDLXrTn3wUB1zEvto/B
 RfkI3D2vfRj3J+ZmPYf1LxEs6ddn6hj/FuL8FEoKjesVvnnFrZ7LQe/4sSYIGG3nKEfhM3rtr3C
 pKgpr5xJWbbHN/hLZrELATyfgJElUvK9XL70qMsFM2Goz9hxVkoJPe/pEX1xzbzaOQg/t3G1G1T
 ukXEmtIUg5u5sySSxC6quFvb3u7sIA9EhtdR7bB2zCla3mciT0w==
X-Received: by 2002:a17:903:1c3:b0:26f:7db2:3e1e with SMTP id
 d9443c01a7336-290cbc3efc4mr334314345ad.47.1761206121114; 
 Thu, 23 Oct 2025 00:55:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJ9mxG0mQE4e2d0wtdtC0Pzf4q1nK4RIrpRbfpCU1mVr5UFw6tRXlVqC8ZjctkbkmykKWyhA==
X-Received: by 2002:a17:903:1c3:b0:26f:7db2:3e1e with SMTP id
 d9443c01a7336-290cbc3efc4mr334313815ad.47.1761206120651; 
 Thu, 23 Oct 2025 00:55:20 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2946e1231b0sm14371265ad.97.2025.10.23.00.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 00:55:20 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH 03/12] drm/msm/dpu: Compatible with Kaanapali interrupt
 register
Date: Thu, 23 Oct 2025 15:53:52 +0800
Message-Id: <20251023075401.1148-4-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX+zO0TZ/UNFlQ
 VMuygo2UdDO/cCPDZjEpf9htbcrL9wIGGUjyOiwkin2WAhLS4+M2+XHPmRDOxqcCX67G9jWrfOP
 d8nFdpORZi/ybked3vuzfS/lBeYlmg94kHLLW/oKd2rQJLqpkchz2i5b0yFfKEQ2xSCK/k0M46g
 /VSRbPHAk3UKx8TdC6epRxAvwQ1DwHpCZHvJPItt41KVGkvshLLOw9NzrQGaIPOYPpz2r28MWt4
 889Z9xZd/n3OZdNiud5zA8llbQBazD57wfzitGB3aM1fhG8baeJgltiG1ZMcFUKPiW+aLlG+ydl
 HchROVjDSXd0urgRo3FHE+IuIhVxRmCVsDvigqnq+1fMNqSISgqgSXxoU+fYhB70MqEUu8aKcbJ
 M2zsnOpY0kin/cqDuqnHwzlDB/IdZA==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68f9df6a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=53IYeV4kbo9ohMI6A7gA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: C2-gJG6B0wUWxstgDzcZOucGLyGHqkD9
X-Proofpoint-ORIG-GUID: C2-gJG6B0wUWxstgDzcZOucGLyGHqkD9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190
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

DPU version 13 introduces changes to the interrupt register
layout. Update the driver to support these modifications for
proper interrupt handling.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 89 ++++++++++++++++++-
 1 file changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 49bd77a755aa..8d265581f6ec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -40,6 +40,15 @@
 #define MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x004)
 #define MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x008)
 
+#define MDP_INTF_REV_13xx_OFF(intf)			(0x18D000 + 0x1000 * (intf))
+#define MDP_INTF_REV_13xx_INTR_EN(intf)			(MDP_INTF_REV_13xx_OFF(intf) + 0x1c0)
+#define MDP_INTF_REV_13xx_INTR_STATUS(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c4)
+#define MDP_INTF_REV_13xx_INTR_CLEAR(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c8)
+#define MDP_INTF_REV_13xx_TEAR_OFF(intf)		(0x18D800 + 0x1000 * (intf))
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

