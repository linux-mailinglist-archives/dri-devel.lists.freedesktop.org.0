Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC2AD01B3D
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 09:59:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECAB910E6BC;
	Thu,  8 Jan 2026 08:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lakzr7BG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gaHRhBHO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD55310E6BE
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 08:59:00 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6084PXDi2593346
 for <dri-devel@lists.freedesktop.org>; Thu, 8 Jan 2026 08:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=54GDJZyJzbH
 Wm0MrtQpD7VyvgqcpHZYlLhoVJwL7bN4=; b=lakzr7BGXoXaqnX93ruFWQq4iMw
 3FynUPGHYsM9mVzpgDdFf5pLpddwJ7GenZpP+ltZ4R8/3yzsRn+W308uFf1+qDTi
 qo+f6bO2jmO98DR5VNctGhIURJEQIxjvZjlQGFOcOASOz6Rv8RwfzFVz94b9H9hy
 4Biz/48eNGIECrYhhtgWjlv1zYYhkbe72412DBdoF3izvTHyNFunpb0vdfl2s75K
 bHPP+QRzKaWkOgS2/q/NsTgjIxdlUbmfbIirV0p6aBTyPxgxYOsm7pyvcz/e5rQ4
 m0/FF2eU3sdpFLG+Bm0RsOTpW82r83AAo454CTVFAMZOKIAPaR9pTRxHyCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn29418x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 08:58:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8bb0ae16a63so346941585a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 00:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767862738; x=1768467538;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=54GDJZyJzbHWm0MrtQpD7VyvgqcpHZYlLhoVJwL7bN4=;
 b=gaHRhBHOMdsVPtRL8epOX6VaLmFI2uHvfFQ2BJebWZu4ibDBkBH19RcdBsGdLQBn/C
 m7IY/GMDor64skcxhZ14IiBbFp4J16QSM1yZLgjsagFy5iTj6JGM5Nie/28k0I0QiUG0
 7g9XbeaOiHpsgCOU8Wy0UGBH+67WL5u6nt355YThOsvZ4dv93/LQx8IwQ7dQOHULJHH3
 961wIOFiDJ7C4RUwGU9290HAysXfyTjE2b+wWkdF3Yu4mbpWErGZPDcFcWgGnewEKyg4
 Sgu/ePNhsI2JsJ6kKvDuOv6O4eH3L0G84Irmhl6HTV2hJOH72KD0hwlVsK6Ay42z5/dn
 RsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767862738; x=1768467538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=54GDJZyJzbHWm0MrtQpD7VyvgqcpHZYlLhoVJwL7bN4=;
 b=Qt0WXT1uzUZ0dZ9I0UPpbnVQnWCgdtFwQeQGfEaGMazFhgF4d54jrdWK4zAc28867V
 G/rb1K1nZgTpsyosQwDGUCDvdjbbdSE3e60+0/afRhmEYf74Qb/XFLI69+Y9r3HYPfIB
 sNbUqgjR/jwJupE3fyHlWH0pwGZ3cmTcVPYh0FIJ7fxKMNu+6IgNozIACamFn7NEfbit
 9FxjHXDjZH9UV/pPsjfR77taS854ZEjhXzrV8N+QNLRPXfesDCXamAv15xeHB/zES+qC
 v0c3+M4Z72ACraOJYPwxoqGpP0B80wVvOxIrknM1k77DqrbgDT+LLMre2QOj7vvSCt1C
 eEgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrCybldH/URDTvfLCyjfcSAK9cZZfvAX8K0rTlahSc72faADWzufF5bTXO5dgxWQfruXvwdID5fGM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMb/S/kM7MJiFvZtjiAGp3YHt8k14uj86UFH0P2rhS3wmuZjfI
 a6BV+uWyNMOqoeWAaqbw09zJ0R7cdzsQqHtiulMCZ9CyBA/n1/Gs1uboJGa94kajFytyInIcXVj
 zo35a8d42PdRYtFISoc22oM1K0odlKOUGV7+tKS5bzkbqBfyCjjX3tlsGSY8JA7FsONWF2Cg=
X-Gm-Gg: AY/fxX4S3V7OeOPov0Xso/w9dSsP2YkXnpSwBP4k47fn6yx1IxKu0p95D3AmEwg1Hhx
 hzKxFg+61ooJ+6S5/RSQ5woMLb3dDUDNaJ80tRxdZrfLiztwB32oYEq9Wz7vQ//9etKGLJqaj6h
 jWC9Xw0KSHWUyllhK+l8qrc23zO6IYE+ltbzvGXQnnA3sOFMbQGmFpSNXXQMSadD8n0XbcSIKYR
 EgOYJL4sR3WgSyBAxm5ozb9cLkxfyeANWkkIZ7hW2Gerq3vsBgUdd3doQvoF6GU91fxcdv+n5rh
 JyW6JJv+DCqg/1b7qTm6Wu/362UtipAVU3ihzegLVoWm8LItFwf5GgrN+Tn1hu/gK/YrqPgzyGp
 nVEYjWbvigHayWX6k4r0W4IujivDsh9HoB2fzZf3wwDn5Rwyg3BLB99C9U09qHmTay6c=
X-Received: by 2002:a05:620a:f0c:b0:8a9:ef98:6b34 with SMTP id
 af79cd13be357-8c3893cd9e6mr665635185a.56.1767862738346; 
 Thu, 08 Jan 2026 00:58:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDPTpg2nfUyWmprD2xyTpkUnn0XmXeqUYRDeQUfDgMTzG3+mwfDEmQ/DqJk3PymsQw8p4x6g==
X-Received: by 2002:a05:620a:f0c:b0:8a9:ef98:6b34 with SMTP id
 af79cd13be357-8c3893cd9e6mr665631685a.56.1767862737861; 
 Thu, 08 Jan 2026 00:58:57 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:58:57 -0800 (PST)
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
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH v5 11/12] drm/msm/dpu: Add Kaanapali WB support
Date: Thu,  8 Jan 2026 16:56:58 +0800
Message-Id: <20260108085659.790-12-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1CgDaCaAUssZs2hAk35_u546yl7ka30f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfXyfoa6L0kaQNO
 qfYchouWTjbRmtuQgOg/ea6cMzIDbmEFxoCZpXHWGIY9UQica8vPOCUREZgKCUftDh6ryS2rlVg
 Kt0MQ9DmkuMMDxtnaCnTFdYHNN+CR/yhFg6wLhmqduUfpqmT/25LlkyAe1rIEW2+27n7CGNx4xM
 l+/QzSSiyb0X2n+VFewW4A9IluT3dZtKkJDS6YBXUxMqlGbi4zwSh1u8e4Eg9a9ckp7EJB6taJA
 HxgHQaitkTCK43wzyoUoSk+GD4jBP5IeiEbSq8rKvEnpD2UmdSaXvzOkwlRCcbLOz87X0UWiLKi
 A++VSXWD2Def8SsRNJ5sO4ZrVi4Ln2r96DpxM1ePcKQ7DwajVBTgv67Hwo0iE1hx7OZPpQePsJ6
 XK6GV73ZiZTwVQ45soCkPcFHGuTScG51XABOvNrlq1WHi68UH8f7RJL2gkzJRje9OSGiM48ej/A
 9gfI0E6Nr014C5EcWAg==
X-Authority-Analysis: v=2.4 cv=P7k3RyAu c=1 sm=1 tr=0 ts=695f71d3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kCfvZJGldO2mi53t-5YA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 1CgDaCaAUssZs2hAk35_u546yl7ka30f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
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

Add support for Kaanapali WB, which introduce register
relocations, use the updated registeri definition to ensure
compatibility.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 478a091aeccf..006dcc4a0dcc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -148,6 +148,15 @@ static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
 			      cfg);
 }
 
+static void dpu_hw_wb_setup_qos_lut_v13(struct dpu_hw_wb *ctx,
+					struct dpu_hw_qos_cfg *cfg)
+{
+	if (!ctx || !cfg)
+		return;
+
+	_dpu_hw_setup_qos_lut_v13(&ctx->hw, cfg);
+}
+
 static void dpu_hw_wb_setup_cdp(struct dpu_hw_wb *ctx,
 				const struct msm_format *fmt,
 				bool enable)
@@ -202,8 +211,12 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
 	if (test_bit(DPU_WB_XY_ROI_OFFSET, &features))
 		ops->setup_roi = dpu_hw_wb_roi;
 
-	if (test_bit(DPU_WB_QOS, &features))
-		ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut;
+	if (test_bit(DPU_WB_QOS, &features)) {
+		if (mdss_rev->core_major_ver >= 13)
+			ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut_v13;
+		else
+			ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut;
+	}
 
 	if (test_bit(DPU_WB_CDP, &features))
 		ops->setup_cdp = dpu_hw_wb_setup_cdp;
-- 
2.34.1

