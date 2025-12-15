Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB66CBCFEC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 09:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267CF10E24E;
	Mon, 15 Dec 2025 08:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IMlkt72e";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a1zkxSge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33FA10E3AA
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:41:19 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BF0KEV43202811
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=mcJrBJUG+Yq
 TOokZC0kC+clKjD1pzzdK2ox6Ib8S9Lo=; b=IMlkt72eb5gos02XitgHXaSzfGH
 KQfTFkeQcN2GIL25bAkK7mb0lgHBLBfITdij8Ydc+tfYYYxmjy2ABxOwPgngj90g
 QFzzEJBMi1uFF3hnkrC1fCgnByPKHYd3D2YYN+YIETru3GVlZ/bmMNtqPXBy9cQn
 3rmApxE54D1o+ySYy22Y5zhmLNo68ctH3x5ZHqOhLIfMiBmwW5Jp3TEPV+FMFe36
 qvhdnY5MZITqzguU+/YsoLqmdRxjMHW0C4C89UTWOA7NXLM8ppslTOgRr30Cspf8
 cKTL9nbf1FKaynB+n2doS3YPjlU75SGNb9DfAU2mwMWcO1y5wn1A7HgW8qg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b119akrs8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:41:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b24a25cff5so922250485a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 00:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765788078; x=1766392878;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mcJrBJUG+YqTOokZC0kC+clKjD1pzzdK2ox6Ib8S9Lo=;
 b=a1zkxSgeECz4pezizqXY+NKLjoN3LP7ofFe6MpHo6C5dsKSzMkrDDcCoZ3lwbV/nqW
 ZQMryv/gUnNLo1BiAyglnzONi+QvIPLO2to/Xz+n2vuejg52nyYnbqKummoZsoiAeK4z
 pmfp+q98oarN7+RdF/vP6bWpHVQIemopJub3jJcjq4nnuCwHOwOc7204bNuCEedN7bu4
 ynlTT4wq5wWUtCggtj/XZHjLlDH6mxXC5SCHgSUGl5RWrmfaeVZCQv49WrQ1ZRb6qfKm
 AkEbfDgL2vtE+aoChLO6HV6UYQs8Mr8eKyEdn8wtoQgaJuhhQpL99TABsk7CNk0Wxc0Y
 UOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765788078; x=1766392878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mcJrBJUG+YqTOokZC0kC+clKjD1pzzdK2ox6Ib8S9Lo=;
 b=MwY7EiMlhskWgx6EKDJddVuk+53Osjtk0XIST5Npsqof697/f0s4601FJqs8xtIgov
 /8Q05+8wos1vor8dTngNdtgkQf8wYnFALS+Fxm5IxAgXx65OEleohgtmPpBnP0AiS5Kq
 SpYVBf2dKOWmAuJRsTLWSa5BS9Uh8V+Sa+HB39x8hqckGO6aHQ9LIfKJZmS5m0m+LstS
 fr5Y3P6V0ijvIP5jC2TlBEU1jFcZoLBhYIHaA/cJD0fvh4ZYs8cekLR11IryGEDI5QK5
 kW4IrGRKRZUKiA3+hWqbUDOrr0QLxgglN758Fvh4iYYxs36NoZEiylYns72Zx0T1BWkZ
 f1OQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViXLLW1QtdbzomSo3Kq+OcJ3PX0z3zvFyc6O2JTM4P9kNtS9kPXnZqYuBXMpu1WgNtM3EXzMW2/i4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywa1yENMN4I9Rn1FPmu7X0svMF3OAa/cF2IyMlQYlq0Nr5VoH+4
 dDpguEU2+qbWt1nYRSqpKdBUgUYsDXV5mcBsR3M4T/o+VG22oe1Tw4l+CDQpn67RPJI7+hoEFCQ
 3UApVBrM/VD6itCGYMxiU5lphRKT0+DFln6Dx/DsGhpoUIFK3P4FFtVcA588vIwIlpIkInv8=
X-Gm-Gg: AY/fxX6XrQ4lalR5dyzf4kt4MOjGnFxmzo76Abv0VWAjhCaqicWTQY9z6tSi1AOazTg
 qLz85D/IgIbYWDHRBM4e0hSSJsJ/xdEUq4j1k8ErSOA6IQ1+UrAFsIMbXEX81M9Ql6PGnXbQJJ4
 dnxGQEFX/g08xAEb+iLa7STkeXR09BL2MPW361ZFKw2/fJgr6ugtTcgon9mbkbWNNfP+GqvA9k8
 /4BEm5gxz8F9+m6fXPxaOTkg1HC0UZWVYKjjeG6LU0/KbUwGRDf+u519HYV3lTvTq8iIZiWj9b7
 8I1LG2T9/SZMypapKRwOyEdKEPNqW4QLN+zSdTLA2LcC/L+9K3NQyJMOGC8oFXIZj3iPe7fSiUj
 f9Xfb+PSVWH8MN8TqCrAapzEt0x3JZFeYPPQwxOVW7LSn5U+FayBZYivFzy+6dDk3Q48=
X-Received: by 2002:ac8:5705:0:b0:4f1:b9e8:1d34 with SMTP id
 d75a77b69052e-4f1d0622c8dmr130916051cf.61.1765788078247; 
 Mon, 15 Dec 2025 00:41:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmtkT2FrMh3A8JdAyzZzQ/M03hiq4FyGZ//hLnndI9tiGgF2mYveq2bp23FrW4NwiKA12JGQ==
X-Received: by 2002:ac8:5705:0:b0:4f1:b9e8:1d34 with SMTP id
 d75a77b69052e-4f1d0622c8dmr130915751cf.61.1765788077748; 
 Mon, 15 Dec 2025 00:41:17 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 00:41:17 -0800 (PST)
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
Subject: [PATCH v3 11/11] drm/msm/dpu: Add Kaanapali SSPP sub-block support
Date: Mon, 15 Dec 2025 16:38:54 +0800
Message-Id: <20251215083854.577-12-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ftPRpV4f c=1 sm=1 tr=0 ts=693fc9af cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=J8Rk1CmWvRk3UPPSVzgA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MiBTYWx0ZWRfX/zK8SlSzoLoo
 n95UdtbVSOS5o3R6ut7YStk6JRN0KvrYOPvtWppahv9EZWDZGoeERSlI3sRXU1lAO3J2eZnBRLN
 Ic58yw+ojJ2VuxNrKUMLnAtdKTikXb1cJwVrmE/a8lOpjt19Vihih8SgDmX0b/uXvGR8VB49+c+
 8m5qDyF1TUtaO6/ojRaDe0hPOUZu81kpEIWbC1o0UuuYwUL+BfmyC9jjHjg8CIQlW5IzMWV6JK9
 dFdqgoxCbm8ZENCyQ7/VfzhD84N3QdE6FjSb3DxzkMxoNqSW0YnWPJ+ntzSXZt+N8GcpUh1XhE9
 Nw48w5otd756PsWZ8O/0ly/5bBwKGOFrOKvhDS2LGuaDiyyfq+3532KiUA8QsSFcVUrHH5URjq5
 mmZPtkJbsZLvbjVeQ27i8vpqiWP72w==
X-Proofpoint-ORIG-GUID: QRWgiv4_at59USGibYkC8_Wb8sPmks1Y
X-Proofpoint-GUID: QRWgiv4_at59USGibYkC8_Wb8sPmks1Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
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

Add support for Kaanapali platform SSPP sub-blocks, which
introduce structural changes including register additions,
removals, and relocations. Add the new common and rectangle
blocks, and update register definitions and handling to
ensure compatibility with DPU v13.0.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile                  |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++++++++
 4 files changed, 330 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 8aa7d07303fb..8b94c5f1cb68 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -86,6 +86,7 @@ msm-display-$(CONFIG_DRM_MSM_DPU) += \
 	disp/dpu1/dpu_hw_lm.o \
 	disp/dpu1/dpu_hw_pingpong.o \
 	disp/dpu1/dpu_hw_sspp.o \
+	disp/dpu1/dpu_hw_sspp_v13.o \
 	disp/dpu1/dpu_hw_dspp.o \
 	disp/dpu1/dpu_hw_merge3d.o \
 	disp/dpu1/dpu_hw_top.o \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 7ed28009c463..f7f1914d4537 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -729,7 +729,10 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
 
 	hw_pipe->mdss_ver = mdss_rev;
 
-	_setup_layer_ops(hw_pipe, hw_pipe->cap->features, mdss_rev);
+	if (mdss_rev->core_major_ver >= 13)
+		dpu_hw_sspp_init_v13(hw_pipe, hw_pipe->cap->features, mdss_rev);
+	else
+		_setup_layer_ops(hw_pipe, hw_pipe->cap->features, mdss_rev);
 
 	return hw_pipe;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index c6b19cb4d158..309af4183ba3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -383,5 +383,9 @@ void dpu_hw_setup_solidfill_impl(struct dpu_sw_pipe *pipe,
 void dpu_hw_sspp_setup_qos_ctrl_impl(struct dpu_hw_sspp *ctx,
 				     bool danger_safe_en, u32 ctrl_off);
 
+void dpu_hw_sspp_init_v13(struct dpu_hw_sspp *c,
+			  unsigned long features,
+			  const struct dpu_mdss_version *mdss_rev);
+
 #endif /*_DPU_HW_SSPP_H */
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
new file mode 100644
index 000000000000..e78a20b45300
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
@@ -0,0 +1,321 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/printk.h>
+#include <linux/soc/qcom/ubwc.h>
+
+#include "dpu_hw_sspp.h"
+
+/* >= v13 DPU */
+/* CMN Registers -> Source Surface Processing Pipe Common SSPP registers */
+/*      Name                                  Offset */
+#define SSPP_CMN_CLK_CTRL                0x0
+#define SSPP_CMN_CLK_STATUS              0x4
+#define SSPP_CMN_MULTI_REC_OP_MODE       0x10
+#define SSPP_CMN_ADDR_CONFIG             0x14
+#define SSPP_CMN_CAC_CTRL                0x20
+#define SSPP_CMN_SYS_CACHE_MODE          0x24
+#define SSPP_CMN_QOS_CTRL                0x28
+
+#define SSPP_CMN_FILL_LEVEL_SCALE                0x3c
+#define SSPP_CMN_FILL_LEVELS                     0x40
+#define SSPP_CMN_STATUS                          0x44
+#define SSPP_CMN_FETCH_DMA_RD_OTS                0x48
+#define SSPP_CMN_FETCH_DTB_WR_PLANE0             0x4c
+#define SSPP_CMN_FETCH_DTB_WR_PLANE1             0x50
+#define SSPP_CMN_FETCH_DTB_WR_PLANE2             0x54
+#define SSPP_CMN_DTB_UNPACK_RD_PLANE0            0x58
+#define SSPP_CMN_DTB_UNPACK_RD_PLANE1            0x5c
+#define SSPP_CMN_DTB_UNPACK_RD_PLANE2            0x60
+#define SSPP_CMN_UNPACK_LINE_COUNT               0x64
+#define SSPP_CMN_TPG_CONTROL                     0x68
+#define SSPP_CMN_TPG_CONFIG                      0x6c
+#define SSPP_CMN_TPG_COMPONENT_LIMITS            0x70
+#define SSPP_CMN_TPG_RECTANGLE                   0x74
+#define SSPP_CMN_TPG_BLACK_WHITE_PATTERN_FRAMES  0x78
+#define SSPP_CMN_TPG_RGB_MAPPING                 0x7c
+#define SSPP_CMN_TPG_PATTERN_GEN_INIT_VAL        0x80
+
+/*RECRegisterset*/
+/*Name        Offset*/
+#define SSPP_REC_SRC_FORMAT                             0x0
+#define SSPP_REC_SRC_UNPACK_PATTERN                     0x4
+#define SSPP_REC_SRC_OP_MODE                            0x8
+#define SSPP_REC_SRC_CONSTANT_COLOR                     0xc
+#define SSPP_REC_SRC_IMG_SIZE                           0x10
+#define SSPP_REC_SRC_SIZE                               0x14
+#define SSPP_REC_SRC_XY                                 0x18
+#define SSPP_REC_OUT_SIZE                               0x1c
+#define SSPP_REC_OUT_XY                                 0x20
+#define SSPP_REC_SW_PIX_EXT_LR                          0x24
+#define SSPP_REC_SW_PIX_EXT_TB                          0x28
+#define SSPP_REC_SRC_SIZE_ODX                           0x30
+#define SSPP_REC_SRC_XY_ODX                             0x34
+#define SSPP_REC_OUT_SIZE_ODX                           0x38
+#define SSPP_REC_OUT_XY_ODX                             0x3c
+#define SSPP_REC_SW_PIX_EXT_LR_ODX                      0x40
+#define SSPP_REC_SW_PIX_EXT_TB_ODX                      0x44
+#define SSPP_REC_PRE_DOWN_SCALE                         0x48
+#define SSPP_REC_SRC0_ADDR                              0x4c
+#define SSPP_REC_SRC1_ADDR                              0x50
+#define SSPP_REC_SRC2_ADDR                              0x54
+#define SSPP_REC_SRC3_ADDR                              0x58
+#define SSPP_REC_SRC_YSTRIDE0                           0x5c
+#define SSPP_REC_SRC_YSTRIDE1                           0x60
+#define SSPP_REC_CURRENT_SRC0_ADDR                      0x64
+#define SSPP_REC_CURRENT_SRC1_ADDR                      0x68
+#define SSPP_REC_CURRENT_SRC2_ADDR                      0x6c
+#define SSPP_REC_CURRENT_SRC3_ADDR                      0x70
+#define SSPP_REC_SRC_ADDR_SW_STATUS                     0x74
+#define SSPP_REC_CDP_CNTL                               0x78
+#define SSPP_REC_TRAFFIC_SHAPER                         0x7c
+#define SSPP_REC_TRAFFIC_SHAPER_PREFILL                 0x80
+#define SSPP_REC_PD_MEM_ALLOC                           0x84
+#define SSPP_REC_QOS_CLAMP                              0x88
+#define SSPP_REC_UIDLE_CTRL_VALUE                       0x8c
+#define SSPP_REC_UBWC_STATIC_CTRL                       0x90
+#define SSPP_REC_UBWC_STATIC_CTRL_OVERRIDE              0x94
+#define SSPP_REC_UBWC_STATS_ROI                         0x98
+#define SSPP_REC_UBWC_STATS_WORST_TILE_ROW_BW_ROI0      0x9c
+#define SSPP_REC_UBWC_STATS_TOTAL_BW_ROI0               0xa0
+#define SSPP_REC_UBWC_STATS_WORST_TILE_ROW_BW_ROI1      0xa4
+#define SSPP_REC_UBWC_STATS_TOTAL_BW_ROI1               0xa8
+#define SSPP_REC_UBWC_STATS_WORST_TILE_ROW_BW_ROI2      0xac
+#define SSPP_REC_UBWC_STATS_TOTAL_BW_ROI2               0xb0
+#define SSPP_REC_EXCL_REC_CTRL                          0xb4
+#define SSPP_REC_EXCL_REC_SIZE                          0xb8
+#define SSPP_REC_EXCL_REC_XY                            0xbc
+#define SSPP_REC_LINE_INSERTION_CTRL                    0xc0
+#define SSPP_REC_LINE_INSERTION_OUT_SIZE                0xc4
+#define SSPP_REC_FETCH_PIPE_ACTIVE                      0xc8
+#define SSPP_REC_META_ERROR_STATUS                      0xcc
+#define SSPP_REC_UBWC_ERROR_STATUS                      0xd0
+#define SSPP_REC_FLUSH_CTRL                             0xd4
+#define SSPP_REC_INTR_EN                                0xd8
+#define SSPP_REC_INTR_STATUS                            0xdc
+#define SSPP_REC_INTR_CLEAR                             0xe0
+#define SSPP_REC_HSYNC_STATUS                           0xe4
+#define SSPP_REC_FP16_CONFIG                            0x150
+#define SSPP_REC_FP16_CSC_MATRIX_COEFF_R_0              0x154
+#define SSPP_REC_FP16_CSC_MATRIX_COEFF_R_1              0x158
+#define SSPP_REC_FP16_CSC_MATRIX_COEFF_G_0              0x15c
+#define SSPP_REC_FP16_CSC_MATRIX_COEFF_G_1              0x160
+#define SSPP_REC_FP16_CSC_MATRIX_COEFF_B_0              0x164
+#define SSPP_REC_FP16_CSC_MATRIX_COEFF_B_1              0x168
+#define SSPP_REC_FP16_CSC_PRE_CLAMP_R                   0x16c
+#define SSPP_REC_FP16_CSC_PRE_CLAMP_G                   0x170
+#define SSPP_REC_FP16_CSC_PRE_CLAMP_B                   0x174
+#define SSPP_REC_FP16_CSC_POST_CLAMP                    0x178
+
+static inline u32 dpu_hw_sspp_calculate_rect_off(enum dpu_sspp_multirect_index rect_index,
+						 struct dpu_hw_sspp *ctx)
+{
+	return (rect_index == DPU_SSPP_RECT_SOLO || rect_index == DPU_SSPP_RECT_0) ?
+		ctx->cap->sblk->sspp_rec0_blk.base : ctx->cap->sblk->sspp_rec1_blk.base;
+}
+
+static void dpu_hw_sspp_setup_multirect_v13(struct dpu_sw_pipe *pipe)
+{
+	struct dpu_hw_sspp *ctx = pipe->sspp;
+
+	if (!ctx)
+		return;
+
+	dpu_hw_setup_multirect_impl(pipe, ctx, SSPP_CMN_MULTI_REC_OP_MODE);
+}
+
+static void dpu_hw_sspp_setup_format_v13(struct dpu_sw_pipe *pipe,
+					 const struct msm_format *fmt, u32 flags)
+{
+	struct dpu_hw_sspp *ctx = pipe->sspp;
+	u32 op_mode_off, unpack_pat_off, format_off;
+	u32 ubwc_ctrl_off, ubwc_err_off;
+	u32 offset;
+
+	if (!ctx || !fmt)
+		return;
+
+	offset = dpu_hw_sspp_calculate_rect_off(pipe->multirect_index, ctx);
+
+	op_mode_off = offset + SSPP_REC_SRC_OP_MODE;
+	unpack_pat_off = offset + SSPP_REC_SRC_UNPACK_PATTERN;
+	format_off = offset + SSPP_REC_SRC_FORMAT;
+	ubwc_ctrl_off = offset + SSPP_REC_UBWC_STATIC_CTRL;
+	ubwc_err_off = offset + SSPP_REC_UBWC_ERROR_STATUS;
+
+	dpu_hw_setup_format_impl(pipe, fmt, flags, ctx, op_mode_off,
+				 unpack_pat_off, format_off, ubwc_ctrl_off, ubwc_err_off);
+}
+
+static void dpu_hw_sspp_setup_pe_config_v13(struct dpu_hw_sspp *ctx,
+					    struct dpu_hw_pixel_ext *pe_ext)
+{
+	struct dpu_hw_blk_reg_map *c;
+	u8 color;
+	u32 lr_pe[4], tb_pe[4];
+	const u32 bytemask = 0xff;
+	u32 offset = ctx->cap->sblk->sspp_rec0_blk.base;
+
+	if (!ctx || !pe_ext)
+		return;
+
+	c = &ctx->hw;
+	/* program SW pixel extension override for all pipes*/
+	for (color = 0; color < DPU_MAX_PLANES; color++) {
+		/* color 2 has the same set of registers as color 1 */
+		if (color == 2)
+			continue;
+
+		lr_pe[color] = ((pe_ext->right_ftch[color] & bytemask) << 24) |
+			       ((pe_ext->right_rpt[color] & bytemask) << 16) |
+			       ((pe_ext->left_ftch[color] & bytemask) << 8) |
+			       (pe_ext->left_rpt[color] & bytemask);
+
+		tb_pe[color] = ((pe_ext->btm_ftch[color] & bytemask) << 24) |
+			       ((pe_ext->btm_rpt[color] & bytemask) << 16) |
+			       ((pe_ext->top_ftch[color] & bytemask) << 8) |
+			       (pe_ext->top_rpt[color] & bytemask);
+	}
+
+	/* color 0 */
+	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_LR + offset, lr_pe[0]);
+	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_TB + offset, tb_pe[0]);
+
+	/* color 1 and color 2 */
+	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_LR_ODX + offset, lr_pe[1]);
+	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_TB_ODX + offset, tb_pe[1]);
+}
+
+static void dpu_hw_sspp_setup_rects_v13(struct dpu_sw_pipe *pipe,
+					struct dpu_sw_pipe_cfg *cfg)
+{
+	struct dpu_hw_sspp *ctx = pipe->sspp;
+	u32 src_size_off, src_xy_off, out_size_off, out_xy_off;
+	u32 offset;
+
+	if (!ctx || !cfg)
+		return;
+
+	offset = dpu_hw_sspp_calculate_rect_off(pipe->multirect_index, ctx);
+
+	src_size_off = offset + SSPP_REC_SRC_SIZE;
+	src_xy_off = offset + SSPP_REC_SRC_XY;
+	out_size_off = offset + SSPP_REC_OUT_SIZE;
+	out_xy_off = offset + SSPP_REC_OUT_XY;
+
+	dpu_hw_setup_rects_impl(pipe, cfg, ctx, src_size_off,
+				src_xy_off, out_size_off, out_xy_off);
+}
+
+static void dpu_hw_sspp_setup_sourceaddress_v13(struct dpu_sw_pipe *pipe,
+						struct dpu_hw_fmt_layout *layout)
+{
+	struct dpu_hw_sspp *ctx = pipe->sspp;
+	int i;
+	u32 offset, ystride0, ystride1;
+
+	if (!ctx)
+		return;
+
+	offset = dpu_hw_sspp_calculate_rect_off(pipe->multirect_index, ctx);
+
+	for (i = 0; i < ARRAY_SIZE(layout->plane_addr); i++)
+		DPU_REG_WRITE(&ctx->hw, offset + SSPP_REC_SRC0_ADDR + i * 0x4,
+			      layout->plane_addr[i]);
+
+	ystride0 = (layout->plane_pitch[0]) | (layout->plane_pitch[2] << 16);
+	ystride1 = (layout->plane_pitch[1]) | (layout->plane_pitch[3] << 16);
+
+	DPU_REG_WRITE(&ctx->hw, offset + SSPP_REC_SRC_YSTRIDE0, ystride0);
+	DPU_REG_WRITE(&ctx->hw, offset + SSPP_REC_SRC_YSTRIDE1, ystride1);
+}
+
+static void dpu_hw_sspp_setup_solidfill_v13(struct dpu_sw_pipe *pipe, u32 color)
+{
+	struct dpu_hw_sspp *ctx = pipe->sspp;
+	u32 const_clr_off;
+	u32 offset;
+
+	if (!ctx)
+		return;
+
+	offset = dpu_hw_sspp_calculate_rect_off(pipe->multirect_index, ctx);
+	const_clr_off = offset + SSPP_REC_SRC_CONSTANT_COLOR;
+
+	dpu_hw_setup_solidfill_impl(pipe, color, ctx, const_clr_off);
+}
+
+static void dpu_hw_sspp_setup_qos_lut_v13(struct dpu_hw_sspp *ctx,
+					  struct dpu_hw_qos_cfg *cfg)
+{
+	if (!ctx || !cfg)
+		return;
+
+	_dpu_hw_setup_qos_lut_v13(&ctx->hw, cfg);
+}
+
+static void dpu_hw_sspp_setup_qos_ctrl_v13(struct dpu_hw_sspp *ctx,
+					   bool danger_safe_en)
+{
+	if (!ctx)
+		return;
+
+	dpu_hw_sspp_setup_qos_ctrl_impl(ctx, danger_safe_en, SSPP_CMN_QOS_CTRL);
+}
+
+static void dpu_hw_sspp_setup_cdp_v13(struct dpu_sw_pipe *pipe,
+				      const struct msm_format *fmt,
+				      bool enable)
+{
+	struct dpu_hw_sspp *ctx = pipe->sspp;
+	u32 offset = 0;
+
+	if (!ctx)
+		return;
+
+	offset = dpu_hw_sspp_calculate_rect_off(pipe->multirect_index, ctx);
+	dpu_setup_cdp(&ctx->hw, offset + SSPP_REC_CDP_CNTL, fmt, enable);
+}
+
+static bool dpu_hw_sspp_setup_clk_force_ctrl_v13(struct dpu_hw_sspp *ctx, bool enable)
+{
+	static const struct dpu_clk_ctrl_reg sspp_clk_ctrl = {
+		.reg_off = SSPP_CMN_CLK_CTRL,
+		.bit_off = 0
+	};
+
+	return dpu_hw_clk_force_ctrl(&ctx->hw, &sspp_clk_ctrl, enable);
+}
+
+void dpu_hw_sspp_init_v13(struct dpu_hw_sspp *c,
+			  unsigned long features, const struct dpu_mdss_version *mdss_rev)
+{
+		c->ops.setup_format = dpu_hw_sspp_setup_format_v13;
+		c->ops.setup_rects = dpu_hw_sspp_setup_rects_v13;
+		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress_v13;
+		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill_v13;
+		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config_v13;
+
+		if (test_bit(DPU_SSPP_QOS, &features)) {
+			c->ops.setup_qos_lut = dpu_hw_sspp_setup_qos_lut_v13;
+			c->ops.setup_qos_ctrl = dpu_hw_sspp_setup_qos_ctrl_v13;
+		}
+
+		if (test_bit(DPU_SSPP_CSC, &features) ||
+		    test_bit(DPU_SSPP_CSC_10BIT, &features))
+			c->ops.setup_csc = dpu_hw_sspp_setup_csc;
+
+		if (test_bit(DPU_SSPP_SMART_DMA_V1, &c->cap->features) ||
+		    test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
+			c->ops.setup_multirect = dpu_hw_sspp_setup_multirect_v13;
+
+		if (test_bit(DPU_SSPP_SCALER_QSEED3_COMPATIBLE, &features))
+			c->ops.setup_scaler = dpu_hw_sspp_setup_scaler3;
+
+		if (test_bit(DPU_SSPP_CDP, &features))
+			c->ops.setup_cdp = dpu_hw_sspp_setup_cdp_v13;
+
+		c->ops.setup_clk_force_ctrl = dpu_hw_sspp_setup_clk_force_ctrl_v13;
+}
-- 
2.34.1

