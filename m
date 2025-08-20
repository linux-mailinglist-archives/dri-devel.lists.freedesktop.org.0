Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA841B2D85F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 11:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4D710E6CE;
	Wed, 20 Aug 2025 09:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OEBx/f7d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114B610E6CC
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:35:57 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oaCi025126
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KremxR/fdj+4yZkCD6l4YcPqvbUwj0XC7MX02usfcFo=; b=OEBx/f7dojKoO2YA
 fmETBW6HDsxPTnSI5c8CEK+WT7o0wm5viNrzr6Ehf3a8l1wYK+wzVe2eeN4XwGhd
 Qvu4ynm8XgYRBzCZxjBkmS44On+f05EtFlvsnV4sanvVwqkY50BCvEAL+JLi0xHF
 Jt7HSMyonQOikejr028W1jcwBKNBkHi3eKRJvaFJPYDLQOFRxEwaK/GMJG9YF9TF
 Aj54tGShz0o2ueJplP3P4OtF2ahP77Js5RTgdOhnvpVexEwF4YkHPDQhu5ZvcXeC
 XCbYXQdD0cQIfyXFnIeI30meBW0a9tY3scpsdQtdPRifHPj9RqRLkRZ/aM9YmJiZ
 i+VA1A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a97wj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:35:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-24457f53ef3so12891925ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 02:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755682555; x=1756287355;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KremxR/fdj+4yZkCD6l4YcPqvbUwj0XC7MX02usfcFo=;
 b=Beq7ukjeOcGHMUK6QlKtHQ0Fd+daKEp2Oq7s8krpfaLc6AnK+qBjDDHDDC1CS4IKXJ
 BfJ5ScledyPZ/ouZ9X2eLcdd/+fZFQ3iW5ZjFqtlYA/rgZ7aZRGOIPq+gVX0LBgRWO4E
 nFXkt+jcZ2r9vCKeMJa04mfPzErMHmd1B6+nz9K7lidVy0OUVU/Mzqogrf/lGoOS8F6t
 72cSK/qZ5JINqHLeXe7uUYoenKGfksD/Fylzm9mX/IKaScb/ZAEBpaH1MXyPue++C/YB
 uBohbg0w/jB7rrQ9adLgqcanT34prrpzg62gyZV0HyT5nITFr98eVbTEx+CCVBkIzSlE
 DPyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0z4c3q/uvLLfSKiu3GxoTrEPA2cSxAS+CV+mg3j5Gz5dy4mScR27uuleUsBejM1zPkQcYpdWxwZM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTE8z13/G820Vy6JgLv5qy79ro5vjC/GPtI/8k9JkYT1BeJocO
 EKDHREfw7oLJrxY+/Pzddao6MyiEJwrEuxyglYFNJcm1GvYuL2rfDe8u7PqerQo+XWj5a/QT8dk
 F2EHX3MyzgSppD8N7WVYDUe46/FPup54RJdm/7wiuADPPYmi3s5pDWJf7q+b4YbnQN3D+/fE=
X-Gm-Gg: ASbGnctE3CLPUN5abtx6euOg9SrFxr3zHNadom6jRgpDUMTKErl6AJWd3I+wf7uJ8cq
 BemdVOno/Jo+NyWsRNH26ci7FYPcLKdwa0fv5/yqlMVtVNi76n2+84JNFuKVpLqKruNr1Jh+sjz
 CLDRLF8vZrM13wbDFvQxTxsLw992LB45UedARlvsCEx97/eZ3dI2j8LCMcFrwM93pSOktajpWGL
 Yx9vtfbSjOKoqMtwkICYjOxSmi6JmyN1HFRZrAnDMeWzqEekxt+CVUDIqOnthaBJP1A6ezNpoVp
 nRZlsvENxREMyOJI88v5du1w6hE/VbGQz+HLYpiLeX4Nf7+Arn/qN0hQIzMZ4Q//pgW97QyOOlV
 YFJ6234SR9EV/pAhEsB4mS/DVPSIHRqxgbcVSyBdlH3mliO/2/HwPAoSX
X-Received: by 2002:a17:902:db07:b0:240:8717:e393 with SMTP id
 d9443c01a7336-245ef1b11a1mr13338355ad.5.1755682555521; 
 Wed, 20 Aug 2025 02:35:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOuhWktbrcrDHeFOfst5iEN/rJ7sUVUpNSLrTofNGaNjn7vDoRdUzbp4Tc22bjyNQhKT6XXg==
X-Received: by 2002:a17:902:db07:b0:240:8717:e393 with SMTP id
 d9443c01a7336-245ef1b11a1mr13338105ad.5.1755682554931; 
 Wed, 20 Aug 2025 02:35:54 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4ec100sm20954305ad.116.2025.08.20.02.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 02:35:54 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 17:34:45 +0800
Subject: [PATCH v3 03/14] phy: qcom: qmp-usbc: Rename USB-specific ops to
 prepare for DP support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-add-displayport-support-for-qcs615-platform-v3-3-a43bd25ec39c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755682520; l=5566;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=iBT4igeHspL9hgxnK6l3In281lZLVL/IRtCY/kLzQbg=;
 b=npOAsieBjEiQjezC1X2f6X8bACFkJXRiMeuFJLH8HY8b6LNRqTa6PRVHCn+z6BVwkY4ctBsbv
 BsHOfwvagVbA+x4hKtNIaBpCuXSlDN+5OWBQwrJgCCyMKqJZp20g46A
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: FCzaxjvJSP5MH5vCAR2Hx7hu2S5ANhtV
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a596fc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=1G2GM3MvUDnZ3pEch4IA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: FCzaxjvJSP5MH5vCAR2Hx7hu2S5ANhtV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXy8l3ZMv7H1zX
 CsZegeer3ddWbaVadZ4AXmNuNiirugvTpwupSjurRRe+pUUIYfRmjJmPtjNGPjqvErMrTeM7vaS
 kMRQm/ZitLdA2OVZo0UEdZfbso+ZzpKNvbF920LE+aMSMBS9v59R//PRThuVvv32dN/Z58z5xW9
 XPFRx1ecyvvx7Z1SFuxeG6hOgXoT222C/EfvlAyswT/tfdDhTLUbR+dFBVwg4XD/eQZ9RZmsJYN
 KfyT67r2crNtFAafSshkmzmmuCxJNiug0zIu477dBaIuRsnBOurqpzUwD2YxsyiNrJ3Q5AB0BzD
 0PuTCLfVRO5Fwacw84a5RHLY2xNZRMA0R+Gb/ASGmXnBh0rFr8QpmVTF2jg/WcC4VVIxZCtrcLl
 qbqHE1K6s447oPEnozC6e96sIv7NGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
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

To support following DisplayPort (DP) mode over the Type-C PHY, rename
USB-specific functions and ops to clearly separate them from common or
DP-related logic.

This is a preparatory cleanup to enable USB + DP dual mode.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 50 ++++++++++++++++----------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 5e7fcb26744a4401c3076960df9c0dcbec7fdef7..e484caec2be20121cfe287c507b17af28fb9f211 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -454,7 +454,7 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
-static int qmp_usbc_init(struct phy *phy)
+static int qmp_usbc_com_init(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -504,7 +504,7 @@ static int qmp_usbc_init(struct phy *phy)
 	return ret;
 }
 
-static int qmp_usbc_exit(struct phy *phy)
+static int qmp_usbc_com_exit(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -518,7 +518,7 @@ static int qmp_usbc_exit(struct phy *phy)
 	return 0;
 }
 
-static int qmp_usbc_power_on(struct phy *phy)
+static int qmp_usbc_usb_power_on(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -566,7 +566,7 @@ static int qmp_usbc_power_on(struct phy *phy)
 	return ret;
 }
 
-static int qmp_usbc_power_off(struct phy *phy)
+static int qmp_usbc_usb_power_off(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -587,20 +587,20 @@ static int qmp_usbc_power_off(struct phy *phy)
 	return 0;
 }
 
-static int qmp_usbc_enable(struct phy *phy)
+static int qmp_usbc_usb_enable(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	int ret;
 
 	mutex_lock(&qmp->phy_mutex);
 
-	ret = qmp_usbc_init(phy);
+	ret = qmp_usbc_com_init(phy);
 	if (ret)
 		goto out_unlock;
 
-	ret = qmp_usbc_power_on(phy);
+	ret = qmp_usbc_usb_power_on(phy);
 	if (ret) {
-		qmp_usbc_exit(phy);
+		qmp_usbc_com_exit(phy);
 		goto out_unlock;
 	}
 
@@ -611,19 +611,19 @@ static int qmp_usbc_enable(struct phy *phy)
 	return ret;
 }
 
-static int qmp_usbc_disable(struct phy *phy)
+static int qmp_usbc_usb_disable(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	int ret;
 
 	qmp->usb_init_count--;
-	ret = qmp_usbc_power_off(phy);
+	ret = qmp_usbc_usb_power_off(phy);
 	if (ret)
 		return ret;
-	return qmp_usbc_exit(phy);
+	return qmp_usbc_com_exit(phy);
 }
 
-static int qmp_usbc_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+static int qmp_usbc_usb_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 
@@ -632,10 +632,10 @@ static int qmp_usbc_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 	return 0;
 }
 
-static const struct phy_ops qmp_usbc_phy_ops = {
-	.init		= qmp_usbc_enable,
-	.exit		= qmp_usbc_disable,
-	.set_mode	= qmp_usbc_set_mode,
+static const struct phy_ops qmp_usbc_usb_phy_ops = {
+	.init		= qmp_usbc_usb_enable,
+	.exit		= qmp_usbc_usb_disable,
+	.set_mode	= qmp_usbc_usb_set_mode,
 	.owner		= THIS_MODULE,
 };
 
@@ -865,11 +865,11 @@ static int qmp_usbc_typec_switch_set(struct typec_switch_dev *sw,
 	qmp->orientation = orientation;
 
 	if (qmp->usb_init_count) {
-		qmp_usbc_power_off(qmp->phy);
-		qmp_usbc_exit(qmp->phy);
+		qmp_usbc_usb_power_off(qmp->phy);
+		qmp_usbc_com_exit(qmp->phy);
 
-		qmp_usbc_init(qmp->phy);
-		qmp_usbc_power_on(qmp->phy);
+		qmp_usbc_com_init(qmp->phy);
+		qmp_usbc_usb_power_on(qmp->phy);
 	}
 
 	mutex_unlock(&qmp->phy_mutex);
@@ -907,7 +907,7 @@ static int qmp_usbc_typec_switch_register(struct qmp_usbc *qmp)
 }
 #endif
 
-static int qmp_usbc_parse_dt_legacy(struct qmp_usbc *qmp, struct device_node *np)
+static int qmp_usbc_parse_usb_dt_legacy(struct qmp_usbc *qmp, struct device_node *np)
 {
 	struct platform_device *pdev = to_platform_device(qmp->dev);
 	struct device *dev = qmp->dev;
@@ -969,7 +969,7 @@ static int qmp_usbc_parse_dt_legacy(struct qmp_usbc *qmp, struct device_node *np
 	return 0;
 }
 
-static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
+static int qmp_usbc_parse_usb_dt(struct qmp_usbc *qmp)
 {
 	struct platform_device *pdev = to_platform_device(qmp->dev);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -1075,10 +1075,10 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	/* Check for legacy binding with child node. */
 	np = of_get_child_by_name(dev->of_node, "phy");
 	if (np) {
-		ret = qmp_usbc_parse_dt_legacy(qmp, np);
+		ret = qmp_usbc_parse_usb_dt_legacy(qmp, np);
 	} else {
 		np = of_node_get(dev->of_node);
-		ret = qmp_usbc_parse_dt(qmp);
+		ret = qmp_usbc_parse_usb_dt(qmp);
 	}
 	if (ret)
 		goto err_node_put;
@@ -1097,7 +1097,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
-	qmp->phy = devm_phy_create(dev, np, &qmp_usbc_phy_ops);
+	qmp->phy = devm_phy_create(dev, np, &qmp_usbc_usb_phy_ops);
 	if (IS_ERR(qmp->phy)) {
 		ret = PTR_ERR(qmp->phy);
 		dev_err(dev, "failed to create PHY: %d\n", ret);

-- 
2.34.1

