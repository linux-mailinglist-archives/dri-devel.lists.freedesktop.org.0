Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 925B8B9DC39
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 09:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1FF10E852;
	Thu, 25 Sep 2025 07:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="h7wC7Db8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2C610E850
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:05:56 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0lZMi025572
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GrguMAXW+fsIhAkyrPq5HAaKMZ1Mc4h2NG633gQkApg=; b=h7wC7Db8Qy9+pqRg
 27cIvsmRzrzh77Y7Oni14zgKZ1z9R5KMU7kktkrm4RTLreYWhbJX9YwFFW3xpkw3
 X33ZSCuAtnjH+m2Gcmx0t4+agws4INoC9r0A7uqOfAFLfU+sb3gtwZnodkNFKTz2
 gMCqV5B2WHBcHQJVCHGChQ0lSglrVKZVyPoOGpkIVEIF2mmMZdtblruMcHvwO7kE
 XyjgCMTcp994DuWkv/2gqRaDao92xMk04VcKL8yCZ6Csaxh23OvKckYaVfpdFJyQ
 mLs20y/PXl0yOvtFDe2l4/k6vv5yD1kep4XiCmIDE+HRZ9svAGSymsxt5H3sRBNF
 j1dUaQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyeyf1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:05:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3327e438680so141472a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 00:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758783955; x=1759388755;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GrguMAXW+fsIhAkyrPq5HAaKMZ1Mc4h2NG633gQkApg=;
 b=w8lP/ix5An8GCqIZlBUkcc/9V/2bfBas0PGcXT1SpjUcICzgWgl12PFQhXrPeia8yc
 vI5HSdb3gvM7yz7Xeen85IF2Fj7++M9LxDSHV8QJFR9dkX7ApAdkvRjaKxiKYL4jBZBq
 fgZZ7PEJwQIHr2mp4t3kDeIjePeb0oDwrpVdVLqz77M8aHn+pSwYowoSuxdTrTIeNbZt
 yDcLJOZNtubiJEIUnjRI4OulucwMq+OZbsEoBZdhImvjS0S8RyJXLadu3qJcTc8ZvxzJ
 CJZ+7MQYfWHLsKCKiu7bWOv3/GBb9KdjtK6HhLFJ+pZf2Vr7sXTqnagZLOZl2W9RfjKg
 lhRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdK6N2lVYVJ59GmxHTlxAPr80Oop7YcVoxaAFdbNOqGdyd7EdGMKNreMlLvO4LLKUndaOh9UOo43k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/q5wLcv/7pQyEWyF9vM1QQs6FEB6S5QDDCeOuI2ATsGgpeVs7
 kGek2IuKFeXoRSyi8+Gkm7pU4rzTSWCX1ffXElQnXPh/mYr1kMLShi5CxEmbZ2LtHWxdUQP7VOk
 +CFczXrOnXAJHmOpj7LoyzBukhcmk11MU9GeIwbu8dycilXObkzwPvKX8NpmX1CApq3s3l84=
X-Gm-Gg: ASbGnctWvjlINhviL7Y8HD+T8FRDzS0JEdCA039M/g9KZsjsSwZnC/VhLwfluROCuzj
 ivtMsPLmG75Ie6RSYykS1QR0opgFgdHUTXFnu4vGE4z/Fwy5qa7YSVb1CcOXVwe2HmexCBh8DTA
 tmhLbxDpZXoPawqyuceys0l+zdf+qUlDRES5ghWUn4t09AGIfqEoAChPw6x6UOU4mVtKGi3katE
 oKIccIc+yDX+Z5Xhkl9eBl27HDC9f4w2E24wn1EBqaB0uTitoNUdDWQEmuDEU+5Lb/0fQ4XRMne
 G7oVEEgwXkQ4wAlBHKXXyUg/nWNCHt8xeS+e0sxB89NH4zUgY9jAAQ4a/BBhcY1u8xJpYgO9T8v
 7GUxnK+z6xfkmS3Bt5yrH4tYwuW+ImEfqlKHrQzb19cNDdJ1LT4ipio8d
X-Received: by 2002:a17:90b:4b87:b0:32e:8c14:5cfb with SMTP id
 98e67ed59e1d1-3342a22be84mr1423283a91.1.1758783954716; 
 Thu, 25 Sep 2025 00:05:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiGLGl2UMupnuQtpEa9ZZfBh6eqEqcbNFWWTUDdSOwpa28BBCD0SysDLrBKUXsdg4C53UiFQ==
X-Received: by 2002:a17:90b:4b87:b0:32e:8c14:5cfb with SMTP id
 98e67ed59e1d1-3342a22be84mr1423240a91.1.1758783954248; 
 Thu, 25 Sep 2025 00:05:54 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3342a2bd584sm914253a91.0.2025.09.25.00.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 00:05:53 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:04:51 +0800
Subject: [PATCH v6 05/14] phy: qcom: qmp-usbc: Move reset config into PHY cfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-add-displayport-support-for-qcs615-platform-v6-5-419fe5963819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758783909; l=3308;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=xkXgNM4liwYFuSUu6liFsyLgM/OZQSJZDsJNBIKnRJI=;
 b=J0gdvfqjAFOidyttJubhcvzBjqP1Zm2wCBXo2NSulNdAolL4liaYtKEaBz9IcvDS151zoaVyg
 bqAqIBWVTU1C4VROc9+fi0LDhH2w5lPAT/FoB4VT18AwGr6Q8XpxwWx
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-GUID: Om4vtm5I8-sQQUtVcMOtZHGoIW5wbrlU
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d4e9d3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=zr9GHpnC6WUyfWqp_BsA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX+n/58SWzX1gR
 xGqdHY3iU6LrBtrIbq13NDtzO/ckOkPaUyQV6/L4L8yxiH71+qTWmuOyqCJGX6tvwSsUnuWlQCU
 TD+Nw6Cp/+PkBWxFnRLpmn4uHqJ+/903U0Njf47tZsrkH9hcmtnmqyaNteULrtT00yNFJ+Y3mDA
 uyGmv/gtjwrk1+uelbsi/vEVZ3AaU1O3Y3zdvc2gDbJPfrmj9TeExdB+TYozyYtYjIo6ThepuOQ
 WD2K/JQqLFIoDEEqsZ2HfLe6ipFLoePNT0EP7bNaaWv3uclKOxJF67/iwx/IIh/afP//1MRn7sP
 wLEGQpQYKMLgbvYSwaWeAI1qALAWKZk/eVq8dW4IJw1DClaQ7fPHm4XakYx3Pqgj7pMsmfRtOxb
 2K5g2L/e
X-Proofpoint-ORIG-GUID: Om4vtm5I8-sQQUtVcMOtZHGoIW5wbrlU
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

The original reset list only works for USB-only PHYs. USB3DP PHYs require
different reset names such as "dp_phy", so they need a separate list.

Moving reset configuration into qmp_phy_cfg allows per-PHY customization
without adding special-case logic in DT parsing. The legacy DT path keeps
using the old hardcoded list, while non-legacy paths use cfg->reset_list.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 3b48c69f9c3cb7daec495ebc281b83fe34e56881..f9e20f43435c050e33e9490343a4693a339d692a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -335,7 +335,8 @@ struct qmp_phy_cfg {
 	int (*configure_dp_phy)(struct qmp_usbc *qmp);
 	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
 
-	/* regulators to be requested */
+	const char * const *reset_list;
+	int num_resets;
 	const struct regulator_bulk_data *vreg_list;
 	int num_vregs;
 
@@ -464,6 +465,8 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.rx_tbl_num             = ARRAY_SIZE(msm8998_usb3_rx_tbl),
 	.pcs_tbl                = msm8998_usb3_pcs_tbl,
 	.pcs_tbl_num            = ARRAY_SIZE(msm8998_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list              = qmp_phy_msm8998_vreg_l,
 	.num_vregs              = ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
 	.regs                   = qmp_v3_usb3phy_regs_layout,
@@ -480,6 +483,8 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list		= qmp_phy_sm2290_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_sm2290_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
@@ -496,6 +501,8 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(sdm660_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list		= qmp_phy_msm8998_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
@@ -512,6 +519,8 @@ static const struct qmp_phy_cfg qcs615_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list		= qmp_phy_qcs615_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
@@ -1051,8 +1060,7 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
 				     "failed to get pipe clock\n");
 	}
 
-	ret = qmp_usbc_reset_init(qmp, usb3phy_reset_l,
-				 ARRAY_SIZE(usb3phy_reset_l));
+	ret = qmp_usbc_reset_init(qmp, cfg->reset_list, cfg->num_resets);
 	if (ret)
 		return ret;
 

-- 
2.34.1

