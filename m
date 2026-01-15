Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A670DD2386D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 10:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0509810E72F;
	Thu, 15 Jan 2026 09:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fngj9iO2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZ2nhaUf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F8710E72B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:29:37 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6gIQv608160
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ROM7fWPFWUz
 cmTgkmDPvcUNBg1ta7vfdGwJEX44Q0B4=; b=Fngj9iO2ztJCKq0RZTyVTe+d7HU
 3m8wcb9vIxsO4XFUBQRggRwPSIx3lJ5yaFO3vgT48pD+fVJqBnBxqi8uXFBMzc1q
 aSTSpIe+WBTg2ehIWrxprqvJsA0qHnIiX8gbDtifMow8mcGm+67E5NNajjF3nDjE
 3KJYO49INrlbWdicwP712CabM7h3uqfnYSsFGcP0oYRcpCPDSrrGcFtfyN99mJ9j
 FMWDi0phLFY3lEm+HFDhryI54Nv/Bz76bSfMorgznch6LLGSIrp/99peZwqss0Im
 u21pLMGdd/FQnZWynlj3QV/VtTeXIGvwHOKFh01e5v7cYx41C/TR/VMFwtQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptna0jn7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:29:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a360b8086so18240556d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 01:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768469376; x=1769074176;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ROM7fWPFWUzcmTgkmDPvcUNBg1ta7vfdGwJEX44Q0B4=;
 b=iZ2nhaUfRFaR/zB8ITHxoxswLxRXgYDtBuIxNj59LUSWuwwwA9peBJcVHkvLX9+iyW
 mCemNuqBi4FXrzstnwvqxp2SFymK8TQgsILd94cNZOmKOnRLZTKJPYZYbaNkFpyKuoSp
 6pvVdPBMdy4sB+XTPQwXoO7g6QpgZaIigLzz1xwWcT2Kv9gu2cgcEamF/HI/4qQD5f+6
 rYPBrsheIGHfFxphNXLSgA52fDm4clIYSpZb5/LaH0NeKyZBiqq9WKNxmihEslnW4iyW
 fIKB/OToWLiqYlMzikRPlz4D0bAgenU2O/5SmMA2cVBbgRYGu3IgykhrUWJaRROoQSCe
 bQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768469376; x=1769074176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ROM7fWPFWUzcmTgkmDPvcUNBg1ta7vfdGwJEX44Q0B4=;
 b=Zcv6Xz9mxTscWVvR211jrrisflBBv7b//+WvaL1dIvlnmnggJLjOJS8NngL8pCR8Ii
 4gvP0XiABnbGPUpkLQmZF5tl+t9FfRarsP2hecApxQ6y/KqBhOfZtoVIh4IIWaeBAsZv
 bW9nNs7hDz6Z3S5H0E7trY5a9Y10YVSUWUoP+C1zt1+OYIq7Q1YwMlf7jPXi7ddkczqW
 Bd/MRFRUUKjXQUnUuj71a251Iqji8v3mgu61dUQCNw9PyNuXjQWo/IyyNRSnDYm9RcEl
 zuDw7FD97x4SmPtMCxIiWF6KuOhklZNXSO5qR207VH2+6WOUsN2/VWJKtM+VJhX0Yysk
 zlsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVihtY7o4p5fmNpW+jV6IH68Wo0XfcaI6WgMKKMK6OZ641Vw5NTs2NJTuqwPrd+uPk2TsdqMY0rd9U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHLCNg0TW4alOeVgdDtP7Wzv7zygmOnDtCBVINoxSDIyoV8mHI
 xAvwhnYeLcNcsoADirUwFGiehO+BIqHE67rJQxhHcCYa+l/XFuQS/bulDVPvWzG09+6g9dtqrj5
 2dPI++TtAQPzZVszkCq9esKpsn2ZuMIF+Bx+3NjzBnSV1EM3jBeA/xSMfGVi+afxex7cxP7I=
X-Gm-Gg: AY/fxX4kJBXs/Erfhy5na19KGQbn6gDlSlWE6ML9PkaHZ7jHDkCk4Cr2BCLdRRbScFD
 fOe/UuLl4i0Ssx7mtuAcc7+A9+RYPhvvHiLq4fc1Ep6jHJio5OeIUkshJJ2dc9ofSGc0BMqTvbK
 DfOgQgcJQdn/oIpZ4ZgXkw8tDQtAsAAiSEU0HqbAeEMkaEqTQiE0rHld6v6hCGsJDNFCqY0RKM8
 oA6Buvq2zODxf83d7UQ/Z2KUgIrlGzUkMHfPdGq3sDH7F+HIrqsMyExiZAzSP253k9Yo6cc5C9W
 Mt6ByXRXSdf/8i2dQNrjsUa5EQdU/HIJAfHWBrklmBr0aM/+8xCXl9oCX/msJIGCrZ6ow9v5Yxy
 399+LIeIMfwUn1E+Cxl8rmduTuXGKKUM8MWlFBgbnMwpjqIrz65/UUWRXmYRe9joKU+w=
X-Received: by 2002:ad4:5e87:0:b0:88a:2444:36e9 with SMTP id
 6a1803df08f44-89275c87512mr75285236d6.67.1768469375898; 
 Thu, 15 Jan 2026 01:29:35 -0800 (PST)
X-Received: by 2002:ad4:5e87:0:b0:88a:2444:36e9 with SMTP id
 6a1803df08f44-89275c87512mr75285086d6.67.1768469375520; 
 Thu, 15 Jan 2026 01:29:35 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 01:29:35 -0800 (PST)
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
Subject: [PATCH v6 11/12] drm/msm/dpu: Add Kaanapali WB support
Date: Thu, 15 Jan 2026 17:27:48 +0800
Message-Id: <20260115092749.533-12-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: O5nWFPSnTmlGd063VQZK4Pwjm_ZViajM
X-Proofpoint-ORIG-GUID: O5nWFPSnTmlGd063VQZK4Pwjm_ZViajM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfX9tr6QETQkYFl
 0XlDmgyY9/fRnaixQGXTlqbuaQUf4N0ymfA08KQ0SDJnFxSDFCnonSuPxNns7JAu5Ks03S/F1lv
 0kzyld8Q5qkue3Qv8ZFILct4W28qZ0NVfkBuyMqgk4LXO62XYOtRHl5TzF/gFwTYg3X6WURlDmS
 3LtqR0VkuS1J8M6d/U2S7T+1ustUfPa9TPoKu7ZD0ovv8WaUUnrlsQdzt/26k19H3koxWlvvoSr
 EO5J32txXBdsLC47dOm/ZJ2dkIYI2IDXQqEfrKgQ4bGulCD0Mg0dom5dnL/gHSKepCoS5mrpkZs
 RS4MUpj4sAW7/k3U410wPnyv5Ylp1rS//IXu8eNhPLaf8rq/C3W1lprYyLKrLryhCMSTj6e0T/Q
 wz2DOWT4CRcWoXxaFr2+Kt1Pr8D4m9zUfkukQ7tFoHE7hybf7LrOq/dFOIzfSR/KDILlsd8PjZx
 K9n29UGRFIGZ08ZaN7A==
X-Authority-Analysis: v=2.4 cv=fsHRpV4f c=1 sm=1 tr=0 ts=6968b380 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kCfvZJGldO2mi53t-5YA:9 a=iYH6xdkBrDN1Jqds4HTS:22
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

Add support for Kaanapali WB, which introduce register
relocations, use the updated registeri definition to ensure
compatibility.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 478a091aeccf..4da4bd6a997c 100644
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
+	dpu_hw_setup_qos_lut_v13(&ctx->hw, cfg);
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

