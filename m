Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FF8ABE4FC
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 22:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979BF10E5CD;
	Tue, 20 May 2025 20:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3dJNNAR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9DB10E5D8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 20:45:02 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGi9Ok019007
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 20:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /Sf2sU8QXkUGxm3P0AkiZVGagcMsU33MoJLUJ+ohpOA=; b=C3dJNNARlXSOF45i
 H5f1Pc01AsAAyW9FnJBGQaa+Up3p+aBetbxEkgSKJDGrsyURtLg/4gB4qkSGoByC
 4dMaZWPNNMWc2mOw3sRPfbgiBIqJW4tehq2WT0U4crMb73sllQSp1jKJTCFEh/hD
 SgL2uvb+TpLv0SEBirrFnW7F2Lp1lVDm7sXThNAP20lRw3T3+cuSON9bAYceGGRn
 Gi4AZ4GWrSxUiWT/1hX3a3o7MFpr+wxPV6zBBOOQvEUyARhJN59gTcDU6rMwFlHm
 pmExE9Mh/h/LdJGyuMwlJ7K9hj5ZDs3vp6G0uH5ZGnf+0E2lx6RZX/1vnd/X2tkf
 8bFqYw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh58khb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 20:45:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f8d3f48f35so50385886d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 13:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747773900; x=1748378700;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Sf2sU8QXkUGxm3P0AkiZVGagcMsU33MoJLUJ+ohpOA=;
 b=AMjDAciJmniFGNdS8F0i8QQ4O515/r79tAHXPgo434MQ9lsCJPbku7/giRs2iGhSaY
 KkEUJpGpVfrAzdXcjU5TK3pngvaPU2zQyhzYhE5f31hkDbfGprjYni9Vo7ZNjfhnOMWz
 jQpthdGWNs5KUaev0dyYZu2SoFI3vKvMVPkj0jCfXZ8vDyUWZ4zbvalcD32GD0A5XRnd
 lt8Q7sDG0Uo1pusxvz0aBDCZTNSl49MKhJOQWTrxq309zQb89NZNHLttCCsWcVtOzWvd
 siBLQCKaisoMOXUC5NOckIBKNEmxNGVQUoF94lG3hCe0Ad+cYNF2RdZto1EXvH+mu7iK
 fgZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaOcm1+zMcP/hoiQJ20hiLBNGmzjtROpU5RL0/kKtOhsRcPdR5jvwIfzLxh43GzqY6hzRmPnKBBKk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyb7sTd8RZEQ+4MWVuh1Gc6ykBVTp1FEFvvelTpsPJrFqZw32Il
 9cgixBA2NDw4zdaiVbNQc6xoIlydi9FryrCpkRwSvPPSXWZyMx9dOemWXZRXZwMYFTovqjxOgQs
 yK0Dqi7ZoALPLHCqYHYlZjiV3TJJNSA8pyQPIpQg/VD5/0+sTbGhe4zHfhwTrlXnYsD7ByoU=
X-Gm-Gg: ASbGncsj7lM2Jlf8IYoXTxvbIUmC5cWTuDKgCcoUHLZrOY8MkEbGjPwRy6IFBCHtEKk
 cA6UWPgs7he/neltdJLhPblZTdzqzD/5vQyJ1yhMex74hRMuTqKw023Hir3gVBkvNXtSPC+oMX9
 KN6dWjrHTQW+tScw5fHnI+ImFbpksBozwP+hlUg7WNQNWlZHmdw8DiCBRQdPFci8tRqoauiGEXh
 N15RKuOhu2MV0vACfEuDvUFdLIOBbbX3lfuCwnvU/PxuhajfJm7UyBbx3DdClzIRYqWJ1WT/6ii
 ze/PnPPCnOQWdxZ6O0qP/8AG/jiqm/UXxV+Cobl4jLCa0sSUKa17Jbs5WrYH9joSoAIijc/okbK
 wieXRm9sDtlNLe+fJEUCE5CpH
X-Received: by 2002:a05:6214:c44:b0:6f4:cbcf:5d46 with SMTP id
 6a1803df08f44-6f8b08abafamr270835986d6.20.1747773900309; 
 Tue, 20 May 2025 13:45:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkl3tYdKo+pWUTiMv0OZy1z1/H2i6Pu6K1fr3RwR2mOhW5QPjQAgjsg8qK75X0E913s7m2+A==
X-Received: by 2002:a05:6214:c44:b0:6f4:cbcf:5d46 with SMTP id
 6a1803df08f44-6f8b08abafamr270835476d6.20.1747773899749; 
 Tue, 20 May 2025 13:44:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f163ccsm2497950e87.39.2025.05.20.13.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 13:44:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 20 May 2025 23:44:46 +0300
Subject: [PATCH v4 4/5] phy: qualcomm: add MSM8974 HDMI PHY support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-fd-hdmi-phy-v4-4-fcbaa652ad75@oss.qualcomm.com>
References: <20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com>
In-Reply-To: <20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-phy@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9501;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OLeHIuWSpgzTAy71HK+ckC1M4XfY8GW2xAOao+NEl5g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoLOnADZDprVDGwWXUwTqicXYzKiBiMS6cMbgwJ
 0tObEbYNeaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCzpwAAKCRCLPIo+Aiko
 1VvnCACIHW4tm/rezTFxV5k0KC6tY8sIjJ7QP1EMNHSIUVA+jtHmBlgKw3r9wH5v5e02UVI+/ai
 SqiBYVgiFNbA3ntKgZAaT9VH8zB0mXG/VGhzGyLn6zjSQkxtggwlj7Z5VRV6XrTOCGUZXDri1vX
 wIkOC9Mq4QWADyueq0S0PN6i0DiaEDO5276irvv9z92cm4c5rEf/meJU1nZF1N2IMMdBjpCMsup
 jJ8299G1xEom+XFhhCQHYTxPTE+dW5E7v6sY8oJ8QAgBu20vR+O6OSLR1EI4IUAEbVm9szcGwyt
 dI+B3+gyYpCcbwhEuinCGbARHJCh0Qjdls1o08l1Rh0GJXPT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2OCBTYWx0ZWRfX2Q8RlJQstZUk
 BKyeOhZcTsBq9vu6n8JxRlJm6O2tsN7Yx3dlUowEF5slINpWwgJMfVdkuhWBUIDLGik6/RzI4Fs
 NIjKosFnREALngWpf0Je6T31Bhm3zLTmA2CW7pA9J3JPRlgg0/AzDDxfrtzEtHedmqxEeuNZVW0
 24jBSv1Sea8HLtApdG1qDOCSk6Bn3mvYdU6YU0WfkwSwFjFkbpknToV4iJ7zAsVzcAZ2y1r/RIR
 A4lrtOe3Cce/yGf9SdVuqXW+0XJ/xeE/IteJwxv2aRppZre/O6imj0Tstquuaujh4Jo7OOrb/VH
 iev2J3SK9rxYUXtcaxeYlzQKiLBkThr3Snhfn/aagZo0KKIJ7mRcbHLjJxUxAArFrh+RHZKfF6N
 eEkhfTWc9R9gTeuanMzpUmwdYjoulkPq0ExnMp57TQgco+c4OJEZGqIPcZsz50jhTSUdURld
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682ce9cd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=wq9x00DRF7jIeu_RijoA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NAsq675qrV-wkoSB6f2H5CW9KNl4Ws_W
X-Proofpoint-ORIG-GUID: NAsq675qrV-wkoSB6f2H5CW9KNl4Ws_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=913 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200168
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Add support for HDMI PHY on Qualcomm MSM8974 / APQ8074 platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c | 259 +++++++++++++++++++++++++++++
 1 file changed, 259 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c b/drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c
index db7fa2df1a369d3889daab922c21ed8b71d733be..059afe5504639e65ef4e0c5f09eee9615f1413c1 100644
--- a/drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c
+++ b/drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c
@@ -10,6 +10,7 @@
 #include <linux/iopoll.h>
 
 #include "phy-qcom-hdmi-preqmp.h"
+#include "phy-qcom-uniphy.h"
 
 #define REG_HDMI_8x74_ANA_CFG0					0x00000000
 #define REG_HDMI_8x74_ANA_CFG1					0x00000004
@@ -31,8 +32,261 @@
 #define REG_HDMI_8x74_BIST_PATN3				0x00000048
 #define REG_HDMI_8x74_STATUS					0x0000005c
 
+#define HDMI_8974_VCO_MAX_FREQ 1800000000UL
+#define HDMI_8974_VCO_MIN_FREQ  600000000UL
+
+#define HDMI_8974_COMMON_DIV 5
+
+static void qcom_uniphy_setup(void __iomem *base, unsigned int ref_freq,
+			      bool sdm_mode,
+			      bool ref_freq_mult_2,
+			      bool dither,
+			      unsigned int refclk_div,
+			      unsigned int vco_freq)
+{
+	unsigned int int_ref_freq = ref_freq * (ref_freq_mult_2 ? 2 : 1);
+	unsigned int div_in_freq = vco_freq / refclk_div;
+	unsigned int dc_offset = div_in_freq / int_ref_freq - 1;
+	unsigned int sdm_freq_seed;
+	unsigned int val;
+	unsigned int remain = div_in_freq - (dc_offset + 1) * int_ref_freq;
+
+	sdm_freq_seed = mult_frac(remain, 0x10000, int_ref_freq);
+
+	val = (ref_freq_mult_2 ? BIT(0) : 0) |
+		((refclk_div - 1) << 2);
+	writel(val, base + UNIPHY_PLL_REFCLK_CFG);
+
+	writel(sdm_mode ? 0 : 0x40 + dc_offset, base + UNIPHY_PLL_SDM_CFG0);
+
+	writel(dither ? 0x40 + dc_offset : 0, base + UNIPHY_PLL_SDM_CFG1);
+
+	writel(sdm_freq_seed & 0xff, base + UNIPHY_PLL_SDM_CFG2);
+
+	writel((sdm_freq_seed >> 8) & 0xff, base + UNIPHY_PLL_SDM_CFG3);
+
+	writel(sdm_freq_seed >> 16, base + UNIPHY_PLL_SDM_CFG4);
+
+	ref_freq = ref_freq * 5 / 1000;
+	writel(ref_freq & 0xff, base + UNIPHY_PLL_CAL_CFG8);
+
+	writel(ref_freq >> 8, base + UNIPHY_PLL_CAL_CFG9);
+
+	vco_freq /= 1000;
+	writel(vco_freq & 0xff, base + UNIPHY_PLL_CAL_CFG10);
+
+	writel(vco_freq >> 8, base + UNIPHY_PLL_CAL_CFG11);
+}
+
+static unsigned long qcom_uniphy_recalc(void __iomem *base, unsigned long parent_rate)
+{
+	unsigned long rate;
+	u32 refclk_cfg;
+	u32 dc_offset;
+	u64 fraq_n;
+	u32 val;
+
+	refclk_cfg = readl(base + UNIPHY_PLL_REFCLK_CFG);
+	if (refclk_cfg & BIT(0))
+		parent_rate *= 2;
+
+	val = readl(base + UNIPHY_PLL_SDM_CFG0);
+	if (val & 0x40) {
+		dc_offset = val & 0x3f;
+		fraq_n = 0;
+	} else {
+		dc_offset = readl(base + UNIPHY_PLL_SDM_CFG1) & 0x3f;
+		fraq_n = readl(base + UNIPHY_PLL_SDM_CFG2) |
+			(readl(base + UNIPHY_PLL_SDM_CFG3) << 8);
+	}
+
+	rate = (dc_offset + 1) * parent_rate;
+	rate += mult_frac(fraq_n, parent_rate, 0x10000);
+
+	rate *= (refclk_cfg >> 2) * 0x3 + 1;
+
+	return rate;
+}
+
+static const unsigned int qcom_hdmi_8974_divs[] = {1, 2, 4, 6};
+
+static unsigned long qcom_hdmi_8974_pll_recalc_rate(struct clk_hw *hw,
+						    unsigned long parent_rate)
+{
+	struct qcom_hdmi_preqmp_phy *hdmi_phy = hw_clk_to_phy(hw);
+	u32 div_idx = hdmi_pll_read(hdmi_phy, UNIPHY_PLL_POSTDIV1_CFG);
+	unsigned long rate = qcom_uniphy_recalc(hdmi_phy->pll_reg, parent_rate);
+
+	return  rate / HDMI_8974_COMMON_DIV / qcom_hdmi_8974_divs[div_idx & 0x3];
+}
+
+static long qcom_hdmi_8974_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+					  unsigned long *parent_rate)
+{
+	return clamp(rate,
+		     HDMI_8974_VCO_MIN_FREQ / HDMI_8974_COMMON_DIV / 6,
+		     HDMI_8974_VCO_MAX_FREQ / HDMI_8974_COMMON_DIV / 1);
+}
+
+static const struct clk_ops qcom_hdmi_8974_pll_ops = {
+	.recalc_rate = qcom_hdmi_8974_pll_recalc_rate,
+	.round_rate = qcom_hdmi_8974_pll_round_rate,
+};
+
+static int qcom_hdmi_msm8974_phy_find_div(unsigned long long pixclk)
+{
+	int i;
+	unsigned long long min_freq = HDMI_8974_VCO_MIN_FREQ / HDMI_8974_COMMON_DIV;
+
+	if (pixclk > HDMI_8974_VCO_MAX_FREQ / HDMI_8974_COMMON_DIV)
+		return -E2BIG;
+
+	for (i = 0; i < ARRAY_SIZE(qcom_hdmi_8974_divs); i++) {
+		if (pixclk >= min_freq / qcom_hdmi_8974_divs[i])
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+static int qcom_hdmi_msm8974_phy_pll_set_rate(struct qcom_hdmi_preqmp_phy *hdmi_phy)
+{
+	unsigned long long pixclk = hdmi_phy->hdmi_opts.tmds_char_rate;
+	unsigned long vco_rate;
+	unsigned int div;
+	int div_idx = 0;
+
+	div_idx = qcom_hdmi_msm8974_phy_find_div(pixclk);
+	if (WARN_ON(div_idx < 0))
+		return div_idx;
+
+	div = qcom_hdmi_8974_divs[div_idx];
+	vco_rate = pixclk * HDMI_8974_COMMON_DIV * div;
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_GLB_CFG, 0x81);
+
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0x01);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_VCOLPF_CFG, 0x19);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_LPFR_CFG, 0x0e);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_LPFC1_CFG, 0x20);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_LPFC2_CFG, 0x0d);
+
+	qcom_uniphy_setup(hdmi_phy->pll_reg, 19200000, true, true, true, 1, vco_rate);
+
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_LKDET_CFG0, 0x10);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_LKDET_CFG1, 0x1a);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_LKDET_CFG2, 0x05);
+
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_POSTDIV1_CFG, div_idx);
+
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_POSTDIV2_CFG, 0x00);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_POSTDIV3_CFG, 0x00);
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_CAL_CFG2, 0x01);
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_PD_CTRL0, 0x1f);
+	udelay(50);
+
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0x0f);
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_PD_CTRL1, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG2, 0x10);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG0, 0xdb);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG1, 0x43);
+	if (pixclk == 297000) {
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG2, 0x06);
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG3, 0x03);
+	} else if (pixclk == 268500) {
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG2, 0x05);
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG3, 0x00);
+	} else {
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG2, 0x02);
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG3, 0x00);
+	}
+
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_VREG_CFG, 0x04);
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_DCC_CFG0, 0xd0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_DCC_CFG1, 0x1a);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_TXCAL_CFG0, 0x00);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_TXCAL_CFG1, 0x00);
+
+	if (pixclk == 268500)
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_TXCAL_CFG2, 0x11);
+	else
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_TXCAL_CFG2, 0x02);
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_TXCAL_CFG3, 0x05);
+	udelay(200);
+
+	return 0;
+}
+
+static int qcom_hdmi_msm8974_phy_pll_enable(struct qcom_hdmi_preqmp_phy *hdmi_phy)
+{
+	int ret;
+	unsigned long status;
+
+	/* Global enable */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_GLB_CFG, 0x81);
+
+	/* Power up power gen */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_PD_CTRL0, 0x00);
+	udelay(350);
+
+	/* PLL power up */
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0x01);
+	udelay(5);
+
+	/* Power up PLL LDO */
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0x03);
+	udelay(350);
+
+	/* PLL power up */
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0x0f);
+	udelay(350);
+
+	/* Poll for PLL ready status */
+	ret = readl_poll_timeout(hdmi_phy->pll_reg + UNIPHY_PLL_STATUS,
+				 status, status & BIT(0),
+				 100, 2000);
+	if (ret) {
+		dev_warn(hdmi_phy->dev, "HDMI PLL not ready\n");
+		goto err;
+	}
+
+	udelay(350);
+
+	/* Poll for PHY ready status */
+	ret = readl_poll_timeout(hdmi_phy->phy_reg + REG_HDMI_8x74_STATUS,
+				 status, status & BIT(0),
+				 100, 2000);
+	if (ret) {
+		dev_warn(hdmi_phy->dev, "HDMI PHY not ready\n");
+		goto err;
+	}
+
+	return 0;
+
+err:
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0);
+	udelay(5);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_GLB_CFG, 0);
+
+	return ret;
+}
+
 static int qcom_hdmi_msm8974_phy_power_on(struct qcom_hdmi_preqmp_phy *hdmi_phy)
 {
+	int ret;
+
+	ret = qcom_hdmi_msm8974_phy_pll_set_rate(hdmi_phy);
+	if (ret)
+		return ret;
+
+	ret = qcom_hdmi_msm8974_phy_pll_enable(hdmi_phy);
+	if (ret)
+		return ret;
+
 	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG0,   0x1b);
 	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_ANA_CFG1,   0xf2);
 	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_BIST_CFG0,  0x0);
@@ -49,6 +303,10 @@ static int qcom_hdmi_msm8974_phy_power_off(struct qcom_hdmi_preqmp_phy *hdmi_phy
 {
 	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_PD_CTRL0, 0x7f);
 
+	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0);
+	udelay(5);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_GLB_CFG, 0);
+
 	return 0;
 }
 
@@ -67,5 +325,6 @@ const struct qcom_hdmi_preqmp_cfg msm8974_hdmi_phy_cfg = {
 	.power_on = qcom_hdmi_msm8974_phy_power_on,
 	.power_off = qcom_hdmi_msm8974_phy_power_off,
 
+	.pll_ops = &qcom_hdmi_8974_pll_ops,
 	.pll_parent = &msm8974_hdmi_pll_parent,
 };

-- 
2.39.5

