Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B40E3B2D879
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 11:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2AF10E6D9;
	Wed, 20 Aug 2025 09:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eta2IeCp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B3A10E6D6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:37:05 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oXIM019721
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +4qsMCsuJLF/Arg3bzvJueMrIMOL81tADEhGamW6w3E=; b=Eta2IeCpPVduWutr
 mLbN2yijJPM7lIQFPjgfCD49PLZaNK4+bs6DRx1rft5yPtfefZtDm2CSie/sNTPU
 vAD+2dfeEmM57HoAH9GyCz+xS4nbmJ09vLb0xeNSOB23SMwsYmGkrYnLovppbYUD
 Z2M3eg1HLU5J5tOTaoPwQ3EaP9+s7SHPxPR4z9KI31MtJEZY8GCJ+VbmNiBY/Le9
 8WOCcg6T6plb+dWh18xJGkCCcx2M+GLfK06xEJaEJGnUE1Kbevwni3cxS+xZzN5P
 xV7WU8RusXSsOqayLOa7/k88yzevMfWJDlK48UWVIGYEQADaOrC5hf6sERRZjm6v
 SZ7evQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5291761-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:37:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-244582e9d17so16144455ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 02:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755682623; x=1756287423;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+4qsMCsuJLF/Arg3bzvJueMrIMOL81tADEhGamW6w3E=;
 b=lfVM44yJzOXCf5lvrqwiKmQzqGGsQ4mq/qkhdBprxEzH6vdh0m5KkSJNLzmxH/ovAp
 2Tes9s/+JNal9zYv1gd85HLi3U6wyeMbSzRmmGMuZ8SXInZpobBy7iCezVeOerRw2q2m
 p8wOfqYd3kp0c5xlok2aEHeUlHyeg2+gtI5uVViU3g13rMPdW5zgJZgQIIO9/HTX/tD/
 VeD2J2OPkYzxv3AHE04rbiYB7rxkenFVlNML7UYZvfllJRBKskbzT2CLJWrRsGb3LJsu
 WhWuTIHZ8lNasMkiUQm0Wpe9LhpkmAEndxAOUXmTznhqEBI3Q3PcEQhO7OehAa2kmeWk
 pzHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEllN1+lPh1qYqY/mHriP+pmtRJ0UwlAiwP87bWUx9aPHheM+K1UFlvwmR2syolx/yPr5sCaMluHw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJxJJ2b1D/RXjCbg0kYxCxErqel3l43dEZmtF8wufUeE5SfCTX
 S2ySUXQDGhbFn/NxiADNSHNrp+rzStELgORYUa/k8zWAdwxbzsHoPyZqjT19MpITJxw5LTPtVG0
 Km8Ijbknudk3g8JvLSShqS+56SrmxfH418q/4J5VilEmt6qnWlP5rzORGvO0FvZNcd1CYcuE=
X-Gm-Gg: ASbGncu6c2cQdJQaY0/brMF71PzQnmUdq4Lxt8AUNcc2ECkhbUpEbvpmzcK7EZWBk0N
 Vbmz+PzVnzaH6ujtan8O8Xr+REDeWFbCGLbJK8Va8NTXvTKIC1jEjtB0ywcsawaxT5WWYDWyv8j
 hhTBOGAr6K152m1lApCkY4QvEFQspAKZMOJiVm8cRnFFeFCPiP9kG6OwaSu+DbD4VASXZCeCVMA
 h9PTyJa2EfFxKCAF5FexgFoiJyb+nspqQ4UoNXRTyzDE/x1yT7g2uWmMuV0pXFbRzouiHcu0Rnt
 5xu+AsIjU2bln+qmqgBoW5/rtDrkECki6MjJ1Hi+spdXq4a32S6xHSdcIbxMXgvu4nuK6lZilCh
 WyO2J8MC4GrdJ/yddXYIisi3qF75qMjV8xbC5VR5mz+oHzbiySKz/RprK
X-Received: by 2002:a17:903:33c7:b0:235:737:7a8 with SMTP id
 d9443c01a7336-245ef14b727mr9669865ad.3.1755682622779; 
 Wed, 20 Aug 2025 02:37:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrk5SksRA9uk/VyNvSYVTS1g5ngAwy3hrnfRKLAYmDynktsIKlvJe3cRKfQKJHfe1IWjn2CA==
X-Received: by 2002:a17:903:33c7:b0:235:737:7a8 with SMTP id
 d9443c01a7336-245ef14b727mr9669465ad.3.1755682622228; 
 Wed, 20 Aug 2025 02:37:02 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4ec100sm20954305ad.116.2025.08.20.02.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 02:37:01 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 17:34:53 +0800
Subject: [PATCH v3 11/14] phy: qcom: qmp-usbc: Finalize USB/DP switchable
 PHY support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-add-displayport-support-for-qcs615-platform-v3-11-a43bd25ec39c@oss.qualcomm.com>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 quic_lliu6@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755682521; l=12787;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=q8YyvwtouFMxjAMATiwtXLflnc9t4c5fbKwPwNsKBOc=;
 b=qb0n/4KULl8bjq/PMNhyOpEtquCRY8hjsAPJhbcTOCVqp0WV8UZgIyN/vFG1hAQjeWIDUcMP5
 l04ahsgBfPaCKeog7XH16xeYZp+6FXuwzUjyD1btpk/3F9XrPkIsNPk
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-GUID: jnqXV0t3lz4UaNvl-Z-sG5YfLiAT5JGQ
X-Proofpoint-ORIG-GUID: jnqXV0t3lz4UaNvl-Z-sG5YfLiAT5JGQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX38qathWFibaf
 5Eso6GtCLGo2L8JyXFKKNbhW8uBcZRoL0L+OoPscyi8AYhdvj/OL4pH1k097+mYDkDgOLOtayQ7
 RiPp+cjMQLvfIuZHa3X1uJ5E1EdkPlioxTbn1q+d8+IyG3HXexJYDbqjW0lgXn8xyBdxAcVwPyY
 /C9QU/Hvry8K3UgeBkdc6xO2PO9gsq6h9RM+aJQBlqYiPv/xFyktDTCS3fn0DlkfWpMq/yiukZe
 rv68l2exrpCVR9HdDC2l8JldzAfghTMA1uoVuKYlkVLcjzckSsxWfSfGst2ptMocmfkextBXAWH
 D1muhP/M+PIJ7viuImwJyjp5bcCk+pckOSD9a7YksHXV+yafTuaAX4AdEqORLPVR1sQ+s+QQMqb
 3q6rw0I3zPJgxcZsKjMOC7ySz9GEOA==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a5973f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=s_XQLyGCJITBpQSLS4cA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

Complete USB/DP switchable PHY integration by adding DP clock
registration, aux bridge setup, and DT parsing. Implement clock
provider logic for USB and DP branches, and extend PHY translation
to support both USB and DP instances.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 331 ++++++++++++++++++++++++++++---
 1 file changed, 299 insertions(+), 32 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 821398653bef23e1915d9d3a3a2950b0bfbefb9a..74b9f75c8864efe270f394bfbfd748793dada1f5 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -995,6 +995,11 @@ static int qmp_usbc_usb_power_on(struct phy *phy)
 	qmp_configure(qmp->dev, qmp->serdes, cfg->serdes_tbl,
 		      cfg->serdes_tbl_num);
 
+	if (IS_ERR(qmp->pipe_clk)) {
+		return dev_err_probe(qmp->dev, PTR_ERR(qmp->pipe_clk),
+				     "pipe clock not defined\n");
+	}
+
 	ret = clk_prepare_enable(qmp->pipe_clk);
 	if (ret) {
 		dev_err(qmp->dev, "pipe_clk enable failed err=%d\n", ret);
@@ -1365,11 +1370,13 @@ static int __maybe_unused qmp_usbc_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(qmp->pipe_clk);
-	if (ret) {
-		dev_err(dev, "pipe_clk enable failed, err=%d\n", ret);
-		clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
-		return ret;
+	if (!IS_ERR(qmp->pipe_clk)) {
+		ret = clk_prepare_enable(qmp->pipe_clk);
+		if (ret) {
+			dev_err(dev, "pipe_clk enable failed, err=%d\n", ret);
+			clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
+			return ret;
+		}
 	}
 
 	qmp_usbc_disable_autonomous_mode(qmp);
@@ -1422,9 +1429,23 @@ static int qmp_usbc_clk_init(struct qmp_usbc *qmp)
 	return devm_clk_bulk_get_optional(dev, num, qmp->clks);
 }
 
-static void phy_clk_release_provider(void *res)
+static struct clk_hw *qmp_usbc_clks_hw_get(struct of_phandle_args *clkspec, void *data)
 {
-	of_clk_del_provider(res);
+	struct qmp_usbc *qmp = data;
+
+	if (clkspec->args_count == 0)
+		return &qmp->pipe_clk_fixed.hw;
+
+	switch (clkspec->args[0]) {
+	case QMP_USB43DP_USB3_PIPE_CLK:
+		return &qmp->pipe_clk_fixed.hw;
+	case QMP_USB43DP_DP_LINK_CLK:
+		return &qmp->dp_link_hw;
+	case QMP_USB43DP_DP_VCO_DIV_CLK:
+		return &qmp->dp_pixel_hw;
+	}
+
+	return ERR_PTR(-EINVAL);
 }
 
 /*
@@ -1453,8 +1474,11 @@ static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
 
 	ret = of_property_read_string(np, "clock-output-names", &init.name);
 	if (ret) {
-		dev_err(qmp->dev, "%pOFn: No clock-output-names\n", np);
-		return ret;
+		char name[64];
+
+		/* Clock name is not mandatory. */
+		snprintf(name, sizeof(name), "%s::pipe_clk", dev_name(qmp->dev));
+		init.name = name;
 	}
 
 	init.ops = &clk_fixed_rate_ops;
@@ -1463,19 +1487,7 @@ static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
 	fixed->fixed_rate = 125000000;
 	fixed->hw.init = &init;
 
-	ret = devm_clk_hw_register(qmp->dev, &fixed->hw);
-	if (ret)
-		return ret;
-
-	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &fixed->hw);
-	if (ret)
-		return ret;
-
-	/*
-	 * Roll a devm action because the clock provider is the child node, but
-	 * the child node is not actually a device.
-	 */
-	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
+	return devm_clk_hw_register(qmp->dev, &fixed->hw);
 }
 
 #if IS_ENABLED(CONFIG_TYPEC)
@@ -1660,6 +1672,235 @@ static int qmp_usbc_parse_tcsr(struct qmp_usbc *qmp)
 	return 0;
 }
 
+static int qmp_usbc_parse_usb3dp_dt(struct qmp_usbc *qmp)
+{
+	struct platform_device *pdev = to_platform_device(qmp->dev);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	const struct qmp_usbc_offsets *offs = cfg->offsets;
+	struct device *dev = qmp->dev;
+	void __iomem *base;
+	int ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	qmp->dp_serdes = base + offs->dp_serdes;
+	qmp->dp_tx = base + offs->dp_txa;
+	qmp->dp_tx2 = base + offs->dp_txb;
+	qmp->dp_dp_phy = base + offs->dp_dp_phy;
+	qmp->serdes = base + offs->serdes;
+	qmp->pcs = base + offs->pcs;
+	if (offs->pcs_misc)
+		qmp->pcs_misc = base + offs->pcs_misc;
+	qmp->tx = base + offs->tx;
+	qmp->rx = base + offs->rx;
+
+	qmp->tx2 = base + offs->tx2;
+	qmp->rx2 = base + offs->rx2;
+
+	ret = qmp_usbc_clk_init(qmp);
+	if (ret)
+		return ret;
+
+	qmp->pipe_clk = devm_clk_get(dev, "pipe");
+	if (IS_ERR(qmp->pipe_clk)) {
+		/* usb3dp allow no pipe clk define */
+		if (cfg->type == QMP_PHY_USBC_USB3_ONLY)
+			return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
+						"failed to get pipe clock\n");
+	}
+
+	return 0;
+}
+
+/*
+ * Display Port PLL driver block diagram for branch clocks
+ *
+ *              +------------------------------+
+ *              |         DP_VCO_CLK           |
+ *              |                              |
+ *              |    +-------------------+     |
+ *              |    |   (DP PLL/VCO)    |     |
+ *              |    +---------+---------+     |
+ *              |              v               |
+ *              |   +----------+-----------+   |
+ *              |   | hsclk_divsel_clk_src |   |
+ *              |   +----------+-----------+   |
+ *              +------------------------------+
+ *                              |
+ *          +---------<---------v------------>----------+
+ *          |                                           |
+ * +--------v----------------+                          |
+ * |    dp_phy_pll_link_clk  |                          |
+ * |     link_clk            |                          |
+ * +--------+----------------+                          |
+ *          |                                           |
+ *          |                                           |
+ *          v                                           v
+ * Input to DISPCC block                                |
+ * for link clk, crypto clk                             |
+ * and interface clock                                  |
+ *                                                      |
+ *                                                      |
+ *      +--------<------------+-----------------+---<---+
+ *      |                     |                 |
+ * +----v---------+  +--------v-----+  +--------v------+
+ * | vco_divided  |  | vco_divided  |  | vco_divided   |
+ * |    _clk_src  |  |    _clk_src  |  |    _clk_src   |
+ * |              |  |              |  |               |
+ * |divsel_six    |  |  divsel_two  |  |  divsel_four  |
+ * +-------+------+  +-----+--------+  +--------+------+
+ *         |                 |                  |
+ *         v---->----------v-------------<------v
+ *                         |
+ *              +----------+-----------------+
+ *              |   dp_phy_pll_vco_div_clk   |
+ *              +---------+------------------+
+ *                        |
+ *                        v
+ *              Input to DISPCC block
+ *              for DP pixel clock
+ *
+ */
+static int qmp_dp_pixel_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	switch (req->rate) {
+	case 1620000000UL / 2:
+	case 2700000000UL / 2:
+	/* 5.4 and 8.1 GHz are same link rate as 2.7GHz, i.e. div 4 and div 6 */
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static unsigned long qmp_dp_pixel_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	const struct qmp_usbc *qmp;
+	const struct phy_configure_opts_dp *dp_opts;
+
+	qmp = container_of(hw, struct qmp_usbc, dp_pixel_hw);
+
+	dp_opts = &qmp->dp_opts;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		return 1620000000UL / 2;
+	case 2700:
+		return 2700000000UL / 2;
+	case 5400:
+		return 5400000000UL / 4;
+	default:
+		return 0;
+	}
+}
+
+static const struct clk_ops qmp_dp_pixel_clk_ops = {
+	.determine_rate	= qmp_dp_pixel_clk_determine_rate,
+	.recalc_rate	= qmp_dp_pixel_clk_recalc_rate,
+};
+
+static int qmp_dp_link_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	switch (req->rate) {
+	case 162000000:
+	case 270000000:
+	case 540000000:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static unsigned long qmp_dp_link_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	const struct qmp_usbc *qmp;
+	const struct phy_configure_opts_dp *dp_opts;
+
+	qmp = container_of(hw, struct qmp_usbc, dp_link_hw);
+	dp_opts = &qmp->dp_opts;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+	case 2700:
+	case 5400:
+		return dp_opts->link_rate * 100000;
+	default:
+		return 0;
+	}
+}
+
+static const struct clk_ops qmp_dp_link_clk_ops = {
+	.determine_rate	= qmp_dp_link_clk_determine_rate,
+	.recalc_rate	= qmp_dp_link_clk_recalc_rate,
+};
+
+static int phy_dp_clks_register(struct qmp_usbc *qmp, struct device_node *np)
+{
+	struct clk_init_data init = { };
+	char name[64];
+	int ret;
+
+	snprintf(name, sizeof(name), "%s::link_clk", dev_name(qmp->dev));
+	init.ops = &qmp_dp_link_clk_ops;
+	init.name = name;
+	qmp->dp_link_hw.init = &init;
+	ret = devm_clk_hw_register(qmp->dev, &qmp->dp_link_hw);
+	if (ret < 0) {
+		dev_err(qmp->dev, "link clk reg fail ret=%d\n", ret);
+		return ret;
+	}
+
+	snprintf(name, sizeof(name), "%s::vco_div_clk", dev_name(qmp->dev));
+	init.ops = &qmp_dp_pixel_clk_ops;
+	init.name = name;
+	qmp->dp_pixel_hw.init = &init;
+	ret = devm_clk_hw_register(qmp->dev, &qmp->dp_pixel_hw);
+	if (ret) {
+		dev_err(qmp->dev, "pxl clk reg fail ret=%d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int qmp_usbc_register_clocks(struct qmp_usbc *qmp, struct device_node *np)
+{
+	int ret;
+
+	if (!IS_ERR(qmp->pipe_clk)) {
+		ret = phy_pipe_clk_register(qmp, np);
+		if (ret)
+			return ret;
+	}
+
+	if (qmp->cfg->type == QMP_PHY_USBC_USB3_DP) {
+		ret = phy_dp_clks_register(qmp, np);
+		if (ret)
+			return ret;
+	}
+
+	return devm_of_clk_add_hw_provider(qmp->dev, qmp_usbc_clks_hw_get, qmp);
+}
+
+static struct phy *qmp_usbc_phy_xlate(struct device *dev, const struct of_phandle_args *args)
+{
+	struct qmp_usbc *qmp = dev_get_drvdata(dev);
+
+	if (args->args_count == 0)
+		return qmp->usb_phy;
+
+	switch (args->args[0]) {
+	case QMP_USB43DP_USB3_PHY:
+		return qmp->usb_phy;
+	case QMP_USB43DP_DP_PHY:
+		return qmp->dp_phy;
+	}
+
+	return ERR_PTR(-EINVAL);
+}
+
 static int qmp_usbc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1703,16 +1944,32 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	/* Check for legacy binding with child node. */
-	np = of_get_child_by_name(dev->of_node, "phy");
-	if (np) {
-		ret = qmp_usbc_parse_usb_dt_legacy(qmp, np);
-	} else {
+	if (qmp->cfg->type == QMP_PHY_USBC_USB3_DP) {
 		np = of_node_get(dev->of_node);
-		ret = qmp_usbc_parse_usb_dt(qmp);
+
+		ret = qmp_usbc_parse_usb3dp_dt(qmp);
+		if (ret) {
+			dev_err(qmp->dev, "parse DP dt fail ret=%d\n", ret);
+			goto err_node_put;
+		}
+
+		ret = drm_aux_bridge_register(dev);
+		if (ret) {
+			dev_err(qmp->dev, "aux bridge reg fail ret=%d\n", ret);
+			goto err_node_put;
+		}
+	} else {
+		/* Check for legacy binding with child node. */
+		np = of_get_child_by_name(dev->of_node, "phy");
+		if (np) {
+			ret = qmp_usbc_parse_usb_dt_legacy(qmp, np);
+		} else {
+			np = of_node_get(dev->of_node);
+			ret = qmp_usbc_parse_usb_dt(qmp);
+		}
+		if (ret)
+			goto err_node_put;
 	}
-	if (ret)
-		goto err_node_put;
 
 	pm_runtime_set_active(dev);
 	ret = devm_pm_runtime_enable(dev);
@@ -1724,7 +1981,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	 */
 	pm_runtime_forbid(dev);
 
-	ret = phy_pipe_clk_register(qmp, np);
+	ret = qmp_usbc_register_clocks(qmp, np);
 	if (ret)
 		goto err_node_put;
 
@@ -1737,9 +1994,19 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 
 	phy_set_drvdata(qmp->usb_phy, qmp);
 
+	if (qmp->cfg->type == QMP_PHY_USBC_USB3_DP) {
+		qmp->dp_phy = devm_phy_create(dev, np, &qmp_usbc_dp_phy_ops);
+		if (IS_ERR(qmp->dp_phy)) {
+			ret = PTR_ERR(qmp->dp_phy);
+			dev_err(dev, "failed to create PHY: %d\n", ret);
+			goto err_node_put;
+		}
+		phy_set_drvdata(qmp->dp_phy, qmp);
+	}
+
 	of_node_put(np);
 
-	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	phy_provider = devm_of_phy_provider_register(dev, qmp_usbc_phy_xlate);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
 

-- 
2.34.1

