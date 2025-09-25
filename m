Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAD4B9DC5A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 09:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE14610E857;
	Thu, 25 Sep 2025 07:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mFrevY6y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE50610E858
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:09 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONobqr025518
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IxgE0hKaY239kxGeqZ+8x/JCG89cRYkF0bkaQ2dVCzM=; b=mFrevY6ycobFm4F3
 AKnprbvloiBNdlfGAw6CJph+D1IOBgdWLan8NptDUin9rEm6/9B6rry8SwlTPCKw
 cpoBPbNO4ivPkKV2tvzoXs8n+reW8hA/FShtfkMTolDVB3K5xCOYbwOGu4YTDYxz
 brwxOn/d0Kk351N7oMMKevVB1rS0eNJ3bJpLhMEX52Ah2nRRg69TGN8cuD3499Zc
 kTcy3ybrwGLUMhLEVJlM/lG1ibDdYidh1jUeHLNs+kaBVZRhFmwz4CBfeahQf31V
 oco0IEJc9Pd9STaD1vbJLK2ks2QuLxK6YTrP2FO35hJyh+0ZYvXNZ6fkhnxrLpr9
 9gmjrA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyeyf2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3309eab05d3so190314a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 00:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758783968; x=1759388768;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IxgE0hKaY239kxGeqZ+8x/JCG89cRYkF0bkaQ2dVCzM=;
 b=p9XblvBMSE0guiMb5XOT3xnjoFw5X5OZwHcg7lh+ttzUomQbO7aFoFK7/Tc3+UJJ6J
 NWm4MGOYmrBVdt7Rb8D4nzr6/27ePXTe7qesFAlUnHIoqdDlxpmdRtBgcpf9j/fdtENo
 YUEbYrS32nNb4QUQJdqKInxZU/WLL39EDftVIA3zlQ1tMUP3X0j08FUimYwmEXe9+XDw
 bjcK6S7uxyEB3WB5x11RnyetxW0HX6acrvQIbTkQ1Oh281J57UZpAB/1nAEx1yeKXr3l
 uJf/7zowtlJFbvosPh3dqxUmyO/OdOwV1mPkec6Grk+Yw4YtE1LLVWkEEIRa9TrdW+z7
 ACSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNkXeLYdBCb+paEySpvsGh/OR0n1CqNb8/7uUtxBA6VkxaVlii0GZNMdYMpgQkoXM0NiVv+DfM+OI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyL9BSQdLrlofb0ixvi/JttpMS3r8Oszy/N0Y3MID6HgEit8S/s
 zlEBQmldmyPb20ktqZppQleBOTzj3uiVtawbDDL6GzadE3qRJqYM7ostJbYHubVEBmCg/vppObe
 k/G7/4UNmusFzuObASMRj8JlpUYt2pC9Gy+okq/Af/S7fpVMey16AEakLhTolhMG4u5RVBHk=
X-Gm-Gg: ASbGnctHkBU3oCPELLEf59U8LeeiSP/6KdnUHuQn5zoH43aUc9N57tSj1++qRcSgT43
 mNLDIrPGGKHVzdbUvdvA32GXotnaXKe97dTPTcR9o2SzBL5P9WeqGd2lDb4rGguk6k7SOe8HtO8
 LMMMdtqGq5vBZ+6XzA+lFjG+ywKNFu+CDt6wcQzV2qKSdaWrtvWYVxQCKRRyAnqRBcliniteVb+
 tMrWN6uLgikBzn76H76Z7eTloavsSAOXPrehso6w4qKJ4py3NzklRRaTWBVwgAUe90UQyhAJh/O
 EqnRqA6tSC/438mnSEz0sGeCuHINkGDpr8kN8uhmVbkB0xmbVFTZn/sWFcf6HYYYovqNh2+qzlz
 bgRdEwGvO3kF/7J/+xOPHxRbSgTCqDvP0addfGagUlDFcsEbNntAmTzOG
X-Received: by 2002:a17:90b:1a81:b0:32e:1213:1ec1 with SMTP id
 98e67ed59e1d1-3342a2c1012mr1392342a91.3.1758783968293; 
 Thu, 25 Sep 2025 00:06:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqm4vqi9INx9yrFdrRGXI6EToe4coF15uJ9HBu3jvVIDzDTGN/9Crhz4syIBdRqrXfjzrKqg==
X-Received: by 2002:a17:90b:1a81:b0:32e:1213:1ec1 with SMTP id
 98e67ed59e1d1-3342a2c1012mr1392327a91.3.1758783967897; 
 Thu, 25 Sep 2025 00:06:07 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3342a2bd584sm914253a91.0.2025.09.25.00.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 00:06:07 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:04:53 +0800
Subject: [PATCH v6 07/14] phy: qcom: qmp-usbc: Move USB-only init to
 usb_power_on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-add-displayport-support-for-qcs615-platform-v6-7-419fe5963819@oss.qualcomm.com>
References: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
In-Reply-To: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758783910; l=2424;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=2OW0hX9TF4LQlObLysgxoFrzLXkqUgu/cavYoT3SHP8=;
 b=Zt3LO6ayN2gVmBZz9fMbnffGNND2tPNJsWMfyvfI7ZhWbNlv4laRaW2taqVXBUAQuoOOJ358i
 WNh/BeOChdWDMyylnbxEoajRmPXHQasqALO3KOps5erPlBA080l0SFx
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-GUID: 0xBFL5QVHWu1VO17KZ52j0WBfECSyQpk
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d4e9e1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JIg05Gv9We-wtn8mShgA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX5sYbS2rmFpEI
 /AiMduIuv+FBchbxSjRIRcfA8Q6y4ClgfFbkSyNeywTNFDkNMjxboQ1zcwkmd1beHKejtjYPlRa
 FoN3vlCeBdB1gKhU9WfvMar8JA/01EyHWrZphSEo+AEcLwj0BmvnCICWqg2xiQ/HluHQf+EZuN7
 OzyM7CnV3XZCS9GMNaTRhRcNqpteS1P04nGKPkxUVHRlnbYymXPhCRwyprNf3oSsuJjXkEtH3HN
 7y4WEMHmmwWkGJBHY8Y6wQvNb9naqjoh2RnT0YeDzhgSGazAKFjGdiE59GhumQqF4tahw6ehy5+
 531Jnh9xSnhIhO3MNjmLgR46gSbl44BEIPK/x8ZZr0dXMVYd/B/52UorUNbH7du1Rq9HUbqD3xh
 +OEsyZuQ
X-Proofpoint-ORIG-GUID: 0xBFL5QVHWu1VO17KZ52j0WBfECSyQpk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004
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

The current implementation programs USB-specific registers in
qmp_usbc_com_init(), which is shared by both USB and DP modes. This
causes unnecessary configuration when the PHY is used for DP.

Move USB-only register setup from com_init to qmp_usbc_usb_power_on,
so it runs only for USB mode.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 7139f4dab82fd7b0d1362dddefba178465e76fa4..a971bdc3e767727e69ea07b14d9a036347d365f4 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -30,6 +30,8 @@
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
+#define SW_PORTSELECT_VAL			BIT(0)
+#define SW_PORTSELECT_MUX			BIT(1)
 
 /* set of registers with offsets different per-PHY */
 enum qphy_reg_layout {
@@ -531,8 +533,6 @@ static int qmp_usbc_com_init(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	void __iomem *pcs = qmp->pcs;
-	u32 val = 0;
 	int ret;
 
 	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
@@ -557,16 +557,6 @@ static int qmp_usbc_com_init(struct phy *phy)
 	if (ret)
 		goto err_assert_reset;
 
-	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
-
-#define SW_PORTSELECT_VAL			BIT(0)
-#define SW_PORTSELECT_MUX			BIT(1)
-	/* Use software based port select and switch on typec orientation */
-	val = SW_PORTSELECT_MUX;
-	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
-		val |= SW_PORTSELECT_VAL;
-	writel(val, qmp->pcs_misc);
-
 	return 0;
 
 err_assert_reset:
@@ -599,6 +589,14 @@ static int qmp_usbc_usb_power_on(struct phy *phy)
 	unsigned int val;
 	int ret;
 
+	qphy_setbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
+
+	/* Use software based port select and switch on typec orientation */
+	val = SW_PORTSELECT_MUX;
+	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
+		val |= SW_PORTSELECT_VAL;
+	writel(val, qmp->pcs_misc);
+
 	qmp_configure(qmp->dev, qmp->serdes, cfg->serdes_tbl,
 		      cfg->serdes_tbl_num);
 

-- 
2.34.1

