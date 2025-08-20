Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A250CB2D877
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 11:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD5E10E6D3;
	Wed, 20 Aug 2025 09:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i5i5K51V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F0D10E6D3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:36:55 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1pJPO025245
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EiqMoI4JzvXNo2OI+vMv9/E2sr+3B1BPWFAmLWZP5+Y=; b=i5i5K51VzY3VjdIJ
 aS94w234CiSxu8WBqcM8K8tHRM9nkPNobo14VgGiiRVieIY8Lru0jaIgiOj37Gte
 hsc6iTqyIeUqgs3TsH3gtfDptsrCPZvOdtMtM7zIm1d4eNwFHw+djTixIsnHG1W4
 CJnT4b9aD1ZmbpIojN0gd88Mk3KqhSnfd91da/2nenq2j3Zv+VPVhI+ttjYz2MV/
 TmGbnAVmlsEIbMPUMiF31Dwq+rShi0LdbScbRp0xssLr/vdWWtPOOnspO6+dKZJd
 GqGm3K3rtefD9gYUzIe18m2IDYsyqbe+8pD2axC+mUqBhgaZiYQa0hS/uTSqnRjR
 WRg9/A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52917pr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:36:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-24457f484d6so15316045ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 02:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755682614; x=1756287414;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EiqMoI4JzvXNo2OI+vMv9/E2sr+3B1BPWFAmLWZP5+Y=;
 b=rTm+63ObIl6dkNcYfglhqUBg6aN2zSxy1CK+uZTO0USr+pwXI4SvZFm+7Jnj7SVYkr
 VxlESyIktAQCkbYtqS0i6cK+cvk4IgW0tdZEf2wzoApN81SlZcyM5EKo59WXQa2a66Zv
 sbW1s/JpohsD8Pmea0ivv8tI6TRO0JksOSl11FqJmUmogY43HkibJ+tqZDGlyk97rb/+
 HNKgGSn6Wvck2LomQ+G2KDz7bjZPyeFPYJhU+OK1GL7GPZ4x+Fp/MvyP7icXQM1TlLje
 6TripLadc5iO9DBHlTtNRUdIe/I60Ak/voHEhrrhwn6VUti+y+KhLxSPJx7Cvw4WXBZd
 VY8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsoC6aoH9cY6GqTJDaEQEmgLhdDt4VuJQ9SYOdHYRDrVuhhQpP52e67isnu/0qeaGBAcRuTlprxzI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGpGvH8Ixqb+YaGRAwfYKsyafMlBkDRWXkJGw+z1h5Y7iPc1yW
 eRiM7IhzRvBkVe+IY78vfxbkfhHj3IBo7SKOtdf87Fdl2uOvD3S/b5YKGTporG0eH15rRTF2n4K
 JQ4oIFGNbTb4qqhyrXuZPfz3EjjbG45ivYrudIw4WRrx2QfNoZgZW6yUJhIpfBhxpNMZo53FAFu
 NHJQg=
X-Gm-Gg: ASbGncsS2v8GDIfu594Gw1WAJbwYEKRLRMEH1rwzAvPH1oe7ZPrY6gPkPNhQYTQ3VDm
 6NPCbV43sRbqrUtZyCvenDtI4aMRjOcruuoAJnfIhfaA8+WLcme90difbGC/VGLmJJohLhHaFL/
 04Pt/x6SPtVgnX1s3jgNs7vxKRhhfwthKjvcgaSf5wJWoaRmUPHfsZTzIlhSSaP/Wwpzhmp9T1Z
 zbBQ7uEcylZS0tngoeoiCI+NtlSuARQgQmwOJqclVOwcIcDHJ9Nsyk+0/mHp3DmxR9AJqkrU8QM
 +LTuvfR8Em4TXAeXwCS+36902AR11LDHbggLegrNRGkRaroAKiDWGBL7ZNVNxJp0WJH5ZRT5oSe
 FYTQOOQaIjWG8cQ1kZhvFlvjLTgbnU+i+CLywbot7HRGr6kpDuHALJ5yE
X-Received: by 2002:a17:902:daca:b0:234:a734:4abe with SMTP id
 d9443c01a7336-245ef1194b6mr14859865ad.1.1755682613870; 
 Wed, 20 Aug 2025 02:36:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEV7XczXGg+baMxpdPCDKJVe4daNFvXZ8uriv0ZV0NgSr3ufsFfCG+bU3sovl88l80hbl3fxQ==
X-Received: by 2002:a17:902:daca:b0:234:a734:4abe with SMTP id
 d9443c01a7336-245ef1194b6mr14859415ad.1.1755682613297; 
 Wed, 20 Aug 2025 02:36:53 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4ec100sm20954305ad.116.2025.08.20.02.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 02:36:53 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 17:34:52 +0800
Subject: [PATCH v3 10/14] phy: qcom: qmp-usbc: Add TCSR parsing and USB/DP
 mode mutex handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-add-displayport-support-for-qcs615-platform-v3-10-a43bd25ec39c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755682521; l=4819;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=8SfAQGpi+yUv2dTRnynA3znbrVsz13vaL37uOPN+CiE=;
 b=NZbfeQ7MIews2c994APJqTp1cKp2WwFGhQ9P3iCZ9j30J14hF6JXR77pmUSBHOcaZgXBF4Iut
 APGQfDl0cyiDRdS4epEMP/Xd4Y2x5f3zQA8w1SnQupEMTBo2cBLsRgy
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a59737 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=tJYjrKaco4gsmSPR8FUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: CDPHcFD3exdvx0DsJWq5Gvb5IS3sQaQy
X-Proofpoint-GUID: CDPHcFD3exdvx0DsJWq5Gvb5IS3sQaQy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXyrgdvTB6eWjl
 XD21yBQb7lK/MSokQsB4QDE6cCLL1suXCoHPDOTFL92agn49zzNQo3dIEJrSeTniBF7cMg4B9lw
 Y6y8UyiNex1rd2v5DumISrjA89av8SUU0BzaFXIykFB0FXjE8rcIX3XJTRLBfjjAKmQMjPyNJRL
 Fqwl3mv5cdsEs3TTm6w2C2FUtNzUpQ67s0ygdyF7+Uh4nuU7gM4PAfjr/RmPU0BeBLlpp6b2iaU
 Oe+aw/D98K03WHDZb4d4R7+GsTIVcgniWt+SRep3mh19dAlWf01SGyYUSutp8a6QLbxMb+Ckpsm
 dEJxXTxACaybE3wTrWwXGsclcwqY5l2LsU9WuDEpBvZfu6hCSlMJiC0NrHXu9uLGG2dscsuFwov
 e0WA15IxEfYmBQCFdTVEhGrc6dEZxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
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

Parse TCSR registers to support DP mode signaling via dp_phy_mode_reg.
Introduce mutual exclusion between USB and DP PHY modes to prevent
simultaneous activation. Also update com_init/com_exit to reflect DP
mode initialization and cleanup.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 60 +++++++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index a1495a2029cf038bb65c36e42d0a4f633e544558..821398653bef23e1915d9d3a3a2950b0bfbefb9a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -674,7 +674,7 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
 	.num_vregs		= ARRAY_SIZE(qmp_phy_usbdp_vreg_l),
 };
 
-static int qmp_usbc_com_init(struct phy *phy)
+static int qmp_usbc_com_init(struct phy *phy, bool is_dp)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -704,15 +704,20 @@ static int qmp_usbc_com_init(struct phy *phy)
 	if (ret)
 		goto err_assert_reset;
 
-	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
+	if (!is_dp) {
+		qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
 
 #define SW_PORTSELECT_VAL			BIT(0)
 #define SW_PORTSELECT_MUX			BIT(1)
-	/* Use software based port select and switch on typec orientation */
-	val = SW_PORTSELECT_MUX;
-	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
-		val |= SW_PORTSELECT_VAL;
-	writel(val, qmp->pcs_misc);
+		/* Use software based port select and switch on typec orientation */
+		val = SW_PORTSELECT_MUX;
+		if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
+			val |= SW_PORTSELECT_VAL;
+		writel(val, qmp->pcs_misc);
+	}
+
+	if (qmp->tcsr_map && qmp->dp_phy_mode_reg)
+		regmap_write(qmp->tcsr_map, qmp->dp_phy_mode_reg, is_dp);
 
 	return 0;
 
@@ -733,6 +738,9 @@ static int qmp_usbc_com_exit(struct phy *phy)
 
 	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
 
+	if (qmp->tcsr_map && qmp->dp_phy_mode_reg)
+		regmap_write(qmp->tcsr_map, qmp->dp_phy_mode_reg, 0);
+
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
 	return 0;
@@ -1045,6 +1053,17 @@ static int qmp_usbc_usb_power_off(struct phy *phy)
 	return 0;
 }
 
+static int qmp_check_mutex_phy(struct qmp_usbc *qmp, bool is_dp)
+{
+	if ((is_dp && qmp->usb_init_count) ||
+	    (!is_dp && qmp->dp_init_count)) {
+		dev_err(qmp->dev, "%s PHY busy\n", is_dp ? "USB" : "DP");
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
 static int qmp_usbc_usb_enable(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
@@ -1052,7 +1071,11 @@ static int qmp_usbc_usb_enable(struct phy *phy)
 
 	mutex_lock(&qmp->phy_mutex);
 
-	ret = qmp_usbc_com_init(phy);
+	ret = qmp_check_mutex_phy(qmp, false);
+	if (ret)
+		goto out_unlock;
+
+	ret = qmp_usbc_com_init(phy, false);
 	if (ret)
 		goto out_unlock;
 
@@ -1103,7 +1126,11 @@ static int qmp_usbc_dp_enable(struct phy *phy)
 
 	mutex_lock(&qmp->phy_mutex);
 
-	ret = qmp_usbc_com_init(phy);
+	ret = qmp_check_mutex_phy(qmp, true);
+	if (ret)
+		goto dp_init_unlock;
+
+	ret = qmp_usbc_com_init(phy, true);
 	if (ret)
 		goto dp_init_unlock;
 
@@ -1467,7 +1494,7 @@ static int qmp_usbc_typec_switch_set(struct typec_switch_dev *sw,
 		qmp_usbc_usb_power_off(qmp->usb_phy);
 		qmp_usbc_com_exit(qmp->usb_phy);
 
-		qmp_usbc_com_init(qmp->usb_phy);
+		qmp_usbc_com_init(qmp->usb_phy, false);
 		qmp_usbc_usb_power_on(qmp->usb_phy);
 	}
 
@@ -1602,13 +1629,13 @@ static int qmp_usbc_parse_usb_dt(struct qmp_usbc *qmp)
 	return 0;
 }
 
-static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
+static int qmp_usbc_parse_tcsr(struct qmp_usbc *qmp)
 {
 	struct of_phandle_args tcsr_args;
 	struct device *dev = qmp->dev;
 	int ret;
 
-	/*  for backwards compatibility ignore if there is no property */
+	/*  for backwards compatibility ignore if there is 1 or no property */
 	ret = of_parse_phandle_with_fixed_args(dev->of_node, "qcom,tcsr-reg", 1, 0,
 					       &tcsr_args);
 	if (ret == -ENOENT)
@@ -1623,6 +1650,13 @@ static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
 
 	qmp->vls_clamp_reg = tcsr_args.args[0];
 
+	ret = of_parse_phandle_with_fixed_args(dev->of_node, "qcom,tcsr-reg", 1, 1,
+					       &tcsr_args);
+	if (ret == -ENOENT)
+		return 0;
+
+	qmp->dp_phy_mode_reg = tcsr_args.args[0];
+
 	return 0;
 }
 
@@ -1665,7 +1699,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = qmp_usbc_parse_vls_clamp(qmp);
+	ret = qmp_usbc_parse_tcsr(qmp);
 	if (ret)
 		return ret;
 

-- 
2.34.1

