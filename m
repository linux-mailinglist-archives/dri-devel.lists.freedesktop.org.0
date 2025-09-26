Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDFEBA2B86
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 09:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DB110E9EB;
	Fri, 26 Sep 2025 07:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RPr50GtY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2F610E9E3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 07:27:03 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q6kfdA000869
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 07:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IxgE0hKaY239kxGeqZ+8x/JCG89cRYkF0bkaQ2dVCzM=; b=RPr50GtYbu331Fr7
 6uqZL8bF1SLiEM8h0rMRK7Udfa0FjSNLHTAH536sn9KLs5OZwRYgoA0+MYVxfnIb
 +DtCXyrAdMytGHio40wjlWUA8g7rOC2uLsbGJt8mUilxcve6RT9HIuv8VdTfDLeF
 fekZsobX+NLsC9IJcHUXF1uLM862eOqTFNCkq3JNeY3jIx3F+hNNo/VSxGXyhoHI
 6qxyyi/3fl2UpMVBoOGpUALAZRzpmq6teE84eJf9tu/yUQsggNgUqncj9GzMOUiI
 zkxys/hj4LXHOmzzIU7u9jvRbvo8vtKss+g9ejNzRuuNKMTDj8yWksKirSWmTmrU
 CaunvQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0tsw49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 07:27:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-32559972951so478969a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 00:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758871622; x=1759476422;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IxgE0hKaY239kxGeqZ+8x/JCG89cRYkF0bkaQ2dVCzM=;
 b=CSpgduZYgKEmsNZyRm7Jl/fGgqWX5JQ9ofeuGB3v4IkXSn5vwxNe7QHnXHMXTh6RKN
 6lcKXQ9VtBdep+o53J9TdvVHQPwQV4v+dl4LqjsyC4fCl6pYEZbuLV3mh9RSTnW44V+/
 MwvnFnxDtICVejzkB6zZKxD5aAyDTnZsxv3R0hXmUajGLMEaU6IxSLXWZckRWEunKLLO
 Xf+R3IChnH/T+uc82F+YK+MgkKNPgg6s+mFH9vj3Q0W5ONmEWTSyr/GDOB49EQlViBMl
 dUX9djoPW+FIAyqTM8xGhBBw9l1leegPUwCjXUjqgap4Szy/D5OuHpzO2tvShSr4jywQ
 Yfug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdl80EG3PcFjhx4DWHnSsLnICIcFEsv0RCigDOv9OufeOz8fbyumIoALb29WY3PBmG8ZAk6CTqogk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBfcxcLWf69OK16Tv3GCkjK7mpj9JR4sqv3UfZDQOqJCseZyKy
 mt0wuAsRF9It34wT/OsJ2ZbGnXvTKdbjLmwDYukrlr4tgT+vq65+eO3/XO+NdCklf7nSwztVTlI
 r7pN0ueCqUVvzIKOrCxRD/gnx33uOCauA7E3IgfrCVQWwtd7nTSgN09iM4BjNjqUmKFb2uF8=
X-Gm-Gg: ASbGncsdgdrfydnhgOHQ4NHIp4B2s2TpDOzB5qlLJLSu0dhfkVEgEzpuzYdBt9Jnl5r
 MTbtwdjLw319rVFyk5M6E8FkFRzibAQv8Gggr7R2ZZNd2nnfTGp9kmZLy7i37K2/3eVB4kn3oGU
 bwYiwjc2qnA5r7a+a4NDjXYV3NYdTRw6Kpy165nbdH5OEWbRVkDoTgKp+WEkRww+hjEMkGzhrnj
 psAaulTdyYbeUp/Dsfchrh6cTujT+bRjtPc1gkMzLMexSmRj4qLwYPCuM8GeIUnnQ7bdHPX3wGp
 YnT4rFuOwkfvrQx7GrObjzc+JXkRANJfmr4oGQVYoxbF3GiOzXoYn6afYI8Hecmt2jR1StxHiy7
 oFzIqbzpRsEZxIKc20snvBqtaKpTQ3JdFPHWHDMYVO9U2zEsyiVyhQJm4
X-Received: by 2002:a17:902:ec85:b0:272:f27d:33bd with SMTP id
 d9443c01a7336-27ed44d5f06mr43818455ad.0.1758871621697; 
 Fri, 26 Sep 2025 00:27:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELcGDRUyHhDjRuK+sfwMHvaCkFijxaFU/1OQEc5tsi7wGyfqnm7Rd7vXgkx97Obwa2yIJ71Q==
X-Received: by 2002:a17:902:ec85:b0:272:f27d:33bd with SMTP id
 d9443c01a7336-27ed44d5f06mr43817965ad.0.1758871621114; 
 Fri, 26 Sep 2025 00:27:01 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed671d8a2sm45117985ad.55.2025.09.26.00.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 00:27:00 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 15:25:43 +0800
Subject: [PATCH v7 07/14] phy: qcom: qmp-usbc: Move USB-only init to
 usb_power_on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-add-displayport-support-for-qcs615-platform-v7-7-dc5edaac6c2b@oss.qualcomm.com>
References: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
In-Reply-To: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758871563; l=2424;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=2OW0hX9TF4LQlObLysgxoFrzLXkqUgu/cavYoT3SHP8=;
 b=o+EwyMZL/K98MOCjTKEANPF15zjybJyWzaygL2LdekPrK23Nbpo2cRjW2t65GTczfpyFcNO1A
 Kq6j6hcnQLdCpTI5xm9JEDlxg1/Xuwp+qm75/ijFHpz6J4XrHFoaCPB
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=I9Vohdgg c=1 sm=1 tr=0 ts=68d64047 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JIg05Gv9We-wtn8mShgA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: TECRsMKo4Iu7362o6HjiHITkrPCQq6JR
X-Proofpoint-ORIG-GUID: TECRsMKo4Iu7362o6HjiHITkrPCQq6JR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX/Wwr8dMOCkfZ
 TJwJe5ixyvDC0qqHGNQMzl6sO9QfC9puf1ZRJOe1I7z36kCoMe4rp1aiuf4QuOP8VKQWeSbDT1G
 vxfY1HqAGdnOM4+qGFRZIaOxosreYllFvp/IwB26a8sU4Zk/dbL6/Q3PW9Fllgpt+y8BuccFGB2
 K/zF1NVqOaU/F/rzwHY3+mdomRImoCtfJMKaGk2Dg2bhW348CJ+VzvujSHqGLS8Z44zSS4zI2uO
 BbVcmynuel8NdXODKLAZGiM/Rm20WnXkAzxd0DAdTHhTW2+sbSvPFgo60sXlsbiXD2VPjXYFxZA
 VdylNMeTJsBfe5GZTcdN5sCYSmr/1gJulDQwnckVO/bTwyabPK0/pKTGwpQ1KaVB0a4vWiJVeuY
 o2L7gOHfY/ztWJM5ikqzy5VEWwSJ4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

