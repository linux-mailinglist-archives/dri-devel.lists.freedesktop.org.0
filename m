Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3B3BA2B8A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 09:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CCA10E9E6;
	Fri, 26 Sep 2025 07:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Am2o/AMX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E495910E9E4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 07:26:49 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q6uwdv001061
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 07:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 psRlzFRQmGXeUGSfcVjnYNDBFIL2wBL8tNvEcKPV1ss=; b=Am2o/AMXBkDOuFFj
 BN0xG6G7ndAIzTRIHxAE36OEiTYgcM1VU8HPwWUq78Ip1cVhmPlC6GD7FLsngtG5
 L/tZDjrIxOIUpVd0LVxZ0w9yLI+SDdsT24k20+VGXTA2TleoODYzrhjm2uINyXFf
 ZiWzyR4PucPH7V770vC9Sr9LT/Ine0VUnMF5iU2XJGQe404VH3Ghd7g/XZ+dNasA
 IejgBMNV7XNTSn3TNBlQnsmbTQczcuRvV9DFkfrdD5Cq14vTg3UgmRuyGP5NkDk1
 cnjP+YNvxyfByuS91zl9Y65E1QPvjSr/utupNvDqAgKThWBsUq88H3NZ7L6X/kbw
 GDWs9g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0tsw2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 07:26:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-25bcad10907so4516035ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 00:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758871608; x=1759476408;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=psRlzFRQmGXeUGSfcVjnYNDBFIL2wBL8tNvEcKPV1ss=;
 b=gedVZSUI3hyAuwToTbt/D91C+yoa0G1dfUrBeJVaZLPjJ2oo3p6KbJBMOZTsHRHXJi
 dwxO6n83yACkSUgrMGQn5loJ6mjFV1iOtZssoO/jjtRYfs3aqjLOJeQzz8OQepVtFcMm
 DIIvRusz+9rnqGXfgSLuJ4iUZ2Qmb5UdipKBX+FO/rRu+0Io4foSr4ibPNVxfXQnvD9Y
 pavxltBh78J4VsizuNKG4IpSZOlpCQgyEIQe5jKDuc3V+BNr0rM/PsFZrsPDKNs4RkAx
 s4yP7QiFdZo0OF8uOKFBSFdDkHR9eMpUSurNYz7fbpjR8HfcWDD7//qyphwzHjt3ZyCC
 f3Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYtdldKnBjv4mILuqDMJFAHoVMgTb7ZiMVvaVzIpSW1L1zwNuRSUD5a/zoijxXfFupnXuBqm3Rls0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuaFZaNb9qwDy3NrjOTnZcmAr8ikJzwy25/3Csjd1tb4PjVGce
 ABIKZM7GfrQEtY+XBt/8zDLpbOJTQsNFii3YqfedvBGCaJ9PNNqinnrxV3DvJQ5r4iV56EPJiXj
 gSk6+fZN3IDCXOCqGGwtQXdEJiyWZWCEoa/DcsRz0uAhsWScbhlCo7zG7ArEyXPCimi6reFQ=
X-Gm-Gg: ASbGncu55iih7dMoUodve84ykNkmye17hF0qJ4a8jIqQOBHhnsAqzAOYt279LIxA+qR
 Yok8RhNMmSQ5KSlmGjgVAgEx+DeNheVfvXT+jrGI8oOw3l3hO6v4Acoe+TbQX3rgpa6GHCMXM+Z
 TOE3M2g3+4Nys2UZQJlzTnU3Oto9G/8yv/J/fp2ZQlgXH/sCPut1b//3GdFD0hfWq407jdAsvas
 XymddMzlzvgd3tMsBx4hkPGTrdRgbjZ7S49OWhHbqtsOaiQ95PQ6idnQTU2yYabH9dMiHtMqh89
 qqIDJRapzXQIf2QgpaM05R4eMUXPbKs6tXeAs1ihbITr+FP7zrop1BRYOcS5OFhApr7RTPEsEx7
 ZT/GoAPTYz1UY4wwhKRqzln94y8XIMGr9G2ivKiYZML4oBY+/YufGUwNZ
X-Received: by 2002:a17:902:a507:b0:25a:4437:dbb7 with SMTP id
 d9443c01a7336-27ed49d5fedmr27989955ad.4.1758871607679; 
 Fri, 26 Sep 2025 00:26:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxSAyhiw2MTcI/NmqZ98HAKqPc0hfqQBjKkbuKjAc9epuCdvKvreEt1D4+pSfhH0QsIo9TKw==
X-Received: by 2002:a17:902:a507:b0:25a:4437:dbb7 with SMTP id
 d9443c01a7336-27ed49d5fedmr27989565ad.4.1758871607181; 
 Fri, 26 Sep 2025 00:26:47 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed671d8a2sm45117985ad.55.2025.09.26.00.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 00:26:46 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 15:25:41 +0800
Subject: [PATCH v7 05/14] phy: qcom: qmp-usbc: Move reset config into PHY cfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-add-displayport-support-for-qcs615-platform-v7-5-dc5edaac6c2b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758871563; l=3375;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=ELWG8LiwmiYEyfPeDUlMXNqM8qMgGsCS4xblAlTbEJQ=;
 b=zmaVB07r32HmpVtcC+B5C54IYIVDvs8vEclG5sjAMe5L1XwWEnY4ERzGLG5jFl4Ib+AzZzwOO
 Eh2N5d9F6fcDBHXUGGh9YHirwHvVYYYGpwjrhJLv5FPRK30pA0p4H6/
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=I9Vohdgg c=1 sm=1 tr=0 ts=68d64039 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=zr9GHpnC6WUyfWqp_BsA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: yhTAIwukKICzVsyJJOXfRtk1Leag3hmH
X-Proofpoint-ORIG-GUID: yhTAIwukKICzVsyJJOXfRtk1Leag3hmH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX4V02vwOMseY7
 3OMt/awKh0jInpSzfRrfukEIQW+4X8jergevXH55snw7PPTlDjV2w8vUbbSpHctdQD0Vmmae7hT
 7lKHSpoYJAL4mkdBopOSUYmuiv1MWYAZthZhJdAG0SPIxmr1K4c2zJgwBfr8R4KMQNd/ckFJPWP
 lmT5Sbxocac0ywUMYmLFT7r+jvXQUfuFIAog+nf0srzej5Ink4WaEyBY0FkmuuSq/EP8n5r5H1h
 XcWI9hP9MkCmJyFhD4nldG54uB2cNcZ6j3jmIEH0f0aCQHCWl7vUlmP8KE6jzmGDLdIr2cL7Yw6
 HlA9CwyVj+Ind6Kv1+HptETP19WrM1hbgJcph3ESmYfIqQGc5AUahdi9A1p/9yDgeLUdLNZ6OPR
 MfEykSLrYfzbqYCQz6yMMYMXWE9Dvw==
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

The original reset list only works for USB-only PHYs. USB3DP PHYs require
different reset names such as "dp_phy", so they need a separate list.

Moving reset configuration into qmp_phy_cfg allows per-PHY customization
without adding special-case logic in DT parsing. The legacy DT path keeps
using the old hardcoded list, while non-legacy paths use cfg->reset_list.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

