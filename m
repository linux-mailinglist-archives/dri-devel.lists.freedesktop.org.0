Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 074BAD01B28
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 09:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B35E10E6B8;
	Thu,  8 Jan 2026 08:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EgyO5cpL";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DWLqHbOB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C7510E6B6
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 08:58:35 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6088rikA4050027
 for <dri-devel@lists.freedesktop.org>; Thu, 8 Jan 2026 08:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=I87OukHNOgS
 eTgoOXQALSi1N6P0XQunpMCBrwQ4g5NU=; b=EgyO5cpLCmQJtQc+ko+psolgag/
 M2vuNo6IauR1zeaA6kYPYLp2Q2nwQeid6mjhEaYQHvDr1hLjb9fwZv569AcmpHEF
 PFvUDJN+5J3RDHVFQ9sEoAQ/gZK26aZz7p+MxlFwcr86RsI8YsPgEc1iKqxc/uM8
 aQIubd3N4+dCAJDEaT/U9bmUyq9U5tflRFZipJf5aA3Ip2r/CgJg8AlpDIdJdDvc
 frNhdSC2dWGB7YkaliQrjzDDVSp72+vaRpdp9NZlNjFJPi2d5HG6Zz/XvBh8T5ho
 B5WxgrgGa/VTR9+dnN085pze1P48aPtK11QcqIx7MsjjF3d5K2EDCpl03gQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj2n8hamm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 08:58:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b2e2342803so765130085a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 00:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767862713; x=1768467513;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I87OukHNOgSeTgoOXQALSi1N6P0XQunpMCBrwQ4g5NU=;
 b=DWLqHbOB6yHdruyR7MBoGCEynPEY09X8qnLZGQjzsbTdqibZeQscuqULuN/S5HzNPL
 1u7bISx+F6sxa4IP4roKOAYMID1mF9wCFSnCUDuwjNFrA4h/rReNvjxDBChPM/kwd/gQ
 qizT0pyy7DTe5PwpcTdzwi5qzEpZ1fncI0sgDSR4Jp0gDvo1ECHMwBCgwVu0EwyxnuyB
 pbTnOikiPn3ESht91kxNkylOl94HRoXN7nahN1Zhk+UxMok8F9yI5ohAqRIOj1RxQfG+
 giKKntLZ+eT0jjCOjksJn7zq0Buk4bvfX+lOWhZLZ0j9dCwdneRgRQC3Yo9UNTv0klvn
 BAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767862713; x=1768467513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I87OukHNOgSeTgoOXQALSi1N6P0XQunpMCBrwQ4g5NU=;
 b=l0HzuqcAFKmyCQnmcFiUFPuma0dOeYxmluMybiRO8TZIIxbLzriP9R81YpGNqyEFre
 xurdUaotufb4LkYo69arXrwqgAaDBO4i+jV+XjyJup4TnUZBRS0F2q3dpZIBL0mWXX+h
 wuU+nX1VSxVKB4vZOZog3OzILrdgtCl6a0J6Tmc+/CnkGvkQLd+6NgT58idsAZiPrHAX
 ABqLZTGPZU2uSL3BaFBfLV2k+irtupm7h1M/esQMf4N+GJDKBCvdTvMZc5HB5HpfS5pI
 CuVNTlJHEUlTYDTnAFbVXBl8tguEG77OTNMvBmWc3mwI87X2DdU2MctZ16Ls6a0ZBxD4
 FkHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwbSF1sS2BxpIHC0D2iVkW2kSaP+5JbGIfg9La15dudFsW6ddOwVfs9oUxKQ4RfXmtuu2qjWo1EIc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyi8LSnQsKd6ix797JuT6gTWOgIB+5GtJSX5GgPfkWHLtL8LRnq
 zTRoxyYnmZfFgU1zQLaWl6o8nX8794rayZZ9pe/8WXslROR/EkGTER6jw3hRaQqZacN8rwSUMiw
 yOH17XUILWrwtzWCnduWLc5a/D02AeRdd+p5lPFenCCQzVL0Uu+Xk9P17cM8hOLDkTufGH84=
X-Gm-Gg: AY/fxX7keoa3plYL0d0SoApYiKTD8rR5sxyVBxpdvCe+0tSXZd3aVdCdurkno7V7s1F
 KYK4A8IHTBPRC579DtGCmI5MP2QM8u845H4w2bbj9nAiukhYog/p3bjKTMdZIOPR6j2RyeJQ5XK
 VS9V6KHO4eEQ4/L4fbdW4DZmpi5Lj51UXEQ6QD9wy+71LAJ+mcQ//faORWZZO269HnGPZ+cYlZW
 LK7sdRJtDnju79GZgkiTETOZ4pqcfLI1HxSPH/sP6kGj9TKg8pV1ksgYqK8zDmB70/RqYYMG5cs
 Hkg4Q05YhahDOd2psIj/6fPwepDBz0r7iWHakBSRrrMfrHOIBKiCXUSjdmw6ywQXAaZ/5CjvNqe
 k7jr8VEgIFt+OKR1IUqiTDak7wYoG684DEaQ4M4HBpaFDhZRWKtYxihSFmGyaTc5NezI=
X-Received: by 2002:a05:620a:4041:b0:89f:4306:2a50 with SMTP id
 af79cd13be357-8c3893dca8bmr714702585a.42.1767862713561; 
 Thu, 08 Jan 2026 00:58:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfxm2xgH03Bu5IXbZUM440zcT0kVGZx2cBef6lPp0OA3bAIQjoWiw52T8xxLeMMMV86G9Nhg==
X-Received: by 2002:a05:620a:4041:b0:89f:4306:2a50 with SMTP id
 af79cd13be357-8c3893dca8bmr714699485a.42.1767862713159; 
 Thu, 08 Jan 2026 00:58:33 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:58:32 -0800 (PST)
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
Subject: [PATCH v5 08/12] drm/msm/dpu: Add interrupt registers for DPU 13.0.0
Date: Thu,  8 Jan 2026 16:56:55 +0800
Message-Id: <20260108085659.790-9-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d+j4CBjE c=1 sm=1 tr=0 ts=695f71ba cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=RfJNy9JZAWTFlj1jTG0A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: z6A1FWkJ9nLKG2F-AK-3OrerVI7z4UqE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX1UaNTTSJcb3e
 SYJNbPE6mc67bjpLJzRPJP2W0NL8Zzy+3a6u5qPq42XGDDAxxLOzMotrkN9Y3GXXxwD/0NCmRLE
 55vPumfl0r/9ZxNJh0LgZDdbQ1zp4pa9zlsyKfEDNrKI1YM+nO2J4dzkaZ8A4nDO6+3nB6N/krR
 o6Y9AyvekI00NaT4IoxI6UEjb7/bxnEoDLNNf38c3bx8WDmlgPc2CYJ59f+6YrxiDJSUGKorhSS
 4aKtHOcHdOcNVENnO+X7/d11cZ7PEYLLRbkjFl7Ku9Iu09kHAB7LJjZv7cBfINKfBbkJLVNUMhS
 gdVPFVwssnUa6mrDCM7cjtBFyULuYfRzj3eEQ0FAqrAU91NxB9ZgZ2LyTTnAjZcwcd83vxP6aXd
 lcdSj2TFdaO9DdXzt5WGnV1riJrMZG1qKOUpnrOCPtSG3cmyhXuooBkWSsjawqLxS2+OlWY+81X
 Nr7aya6RgoImXnuOm1w==
X-Proofpoint-GUID: z6A1FWkJ9nLKG2F-AK-3OrerVI7z4UqE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080059
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

