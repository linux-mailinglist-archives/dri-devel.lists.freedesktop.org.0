Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD10B89EA2
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 16:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FB510EA09;
	Fri, 19 Sep 2025 14:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYoNGJBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8C410EA04
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 14:25:40 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J8tfP5022858
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 14:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s8Gat07gp3MRVOt4L/O159z0k7jLmrjqvCt4T7tTz2A=; b=kYoNGJBsNNDc+8ib
 pPKFA6X9HZyMwtM90sOBw4APhI9lfXd4YL9+1TZY71KnolX35ZqJxVcsAWaPogA0
 0j9x9ZjdwYot1Pd1T7OE7xJZNjJnobc4pMH6JY8VzaVhxb8pEnnFnMk8kn8XbZwy
 yQY6t/SYQJN7llRf6NntbdnMfdhQvI99oqoVfSHqdrm6d67zuEhhvOhZTZA2eXXF
 bBe+TosxQdo6HpyR/eDoftakW7g5UcTjL9puKV8arBk8vMxIbQvYMRs2WsEtV3t5
 MGtpB2sk/kX06MNRSnsN4fADMUTNFQ9ek5VqGNS6H/eTD8aaWnvP+yAEtoKo5+lK
 Fawmnw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxy2nmy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 14:25:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-26dcd7e816fso925785ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 07:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758291939; x=1758896739;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s8Gat07gp3MRVOt4L/O159z0k7jLmrjqvCt4T7tTz2A=;
 b=Zv8PucT3NfGueYKgHlzhDXmRwDDofnucv4djru17+0eX2/oaJkAw0QSwZveJYl0h2+
 1aSTXq9dvOBcODy6wTzDIhjaud/NvBEs7Jh/FYyvwQVuS4MLBKTALupK/RgMidY/7wZp
 +DUfqUujEIDyR9JI6o0j9d5RJYk4NnoE5O8chVVciVvtmzn8DqPDlH29lD8IouQthrFG
 3xgL4i2P/xt7SC3By5CLNRfJvqobEEFPQ/eLe4RtxHn7bJ5X3CjVZj8Z1TunWiDmGsUo
 SZtdxcv5LsW1H5B3yOkLyd2SOnPcxaxD54vmcGKyClkyhvdKjXBsXuwgoDhBW1FLUKqo
 ogog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDxl1wJTZM83V5bB8qWgNH2qJLtfTdLMJ0UM6XH3NXImTP3o/Q1cruKFc3IK3R8aFzqaFUroiA/GU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyArJAgy3PngUch0kBI7QYTBbyD7Xo7UHVb5NoN3yU5zj2rX8Xg
 vKMc4SJuVPLp2LjvvF5rewh/8VIaOyaQ8QR5da5hwl4tlvxMkaiRDpMCr5I9xkBNmZInL9Laus7
 pJKfdEmUZKC1stiJHc4mdfxV4AnytcT0SvSP/lAgHh5AbUGIuYGqcEqT/A1NpICBBL2yepeQ=
X-Gm-Gg: ASbGncsRsN0ceHu54TMwxAYsR60i73MrnofWGv0MWWVtB5lZ2GVtDv0oiPR5cAMZQ7N
 CovKaK7PsE+qGnefwk+cP208QLXSfdl/qh+yT20g1HBbd++mf1Krj4D6fWsKmF/A4Ur7rp0Y4tU
 Ik6BmRgqGnwSiF5gnbNwL1Q6S0Emx1D+Eqq3AgA6XUJsIRWin/+hux+YIKMkY+YNFKfD0Cs21D9
 lVmA9IlBgQrjftJrUNB6f4MF9p+3J2zkUJt0dAaGxbM4jVhk8m2DZ29jPN+rK6KFhYOs2wSkXrd
 P4/dUMckFYuohRsN9L72hA91Tiv8EHtMo6p3P+WB7NVnemARtJEHEzy24z//lkz4ABPix/6y8lF
 EHVhEpyGb0tpOEQ==
X-Received: by 2002:a17:902:e783:b0:264:cda8:7fd3 with SMTP id
 d9443c01a7336-269ba524fcamr23697555ad.6.1758291939369; 
 Fri, 19 Sep 2025 07:25:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1kN5CdBbgtNitx8qEDVbtTkUx50Cb0tShRZ+81fS8AlMsoBbd1UoYI7x3OsJPQoi2b5RSdQ==
X-Received: by 2002:a17:902:e783:b0:264:cda8:7fd3 with SMTP id
 d9443c01a7336-269ba524fcamr23697235ad.6.1758291938856; 
 Fri, 19 Sep 2025 07:25:38 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26e80409ee3sm2210035ad.80.2025.09.19.07.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 07:25:38 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 22:24:22 +0800
Subject: [PATCH v5 05/14] phy: qcom: qmp-usbc: Move reset config into PHY cfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-add-displayport-support-for-qcs615-platform-v5-5-eae6681f4002@oss.qualcomm.com>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758291894; l=3439;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=u9wOAKxkjnamI2H2q1squA5Lj0dD2o8MZknhelsq6I0=;
 b=EpbxVqfS5D6TBeLH+5VJDRNxVNdHBlYL1HJL3hVzX00jjVkBmU6I99OLKvT9n5mef4nA5F7SY
 q2yh4lEpjsFChCZm6w6UcLrKNnVneXfAfMOtixmvqW4eKiMpIvPd7MI
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXwWxMsq39j3sK
 UV6iBRrh/c3EBIXym8ZLviGWu1xvu2gC+fwIZ9NjZiqaAzT4LA303FhNZzIYShrcmKyGq73btUP
 gUPSJ4F2FvnYYw17gO0p8y16F40UldzILNqkWc9cpJPNgc5Oeo6/V3X2Nq4GAo3l4Xjq1F/EZ53
 Yulhko0j02gJYqY5JgPsL42qlR/ZkimexGtJMoIgC0k81+HW9vWOcfNXmY3XPqwn8n5Ve4CQuut
 wjOJ/H9vSiEf6mqYFKu3/FKADpGhr9BjSwX11OezamTYt6PwkXPbRN9u+Qg5m+HtajIp/yuKIxY
 hwnoNDt18yhUtMN55xurh1zBjBRADVp3Ui4/bdXAmKDLaNcJWEDgpBScMLTmU1myJlih4adjHUL
 p+4iXtoH
X-Proofpoint-ORIG-GUID: hpPqdbtHyKcWJx-8LWxR84imdoBg5pzg
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cd67e4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=RqUhitWEW_Btmly2q4YA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: hpPqdbtHyKcWJx-8LWxR84imdoBg5pzg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
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

Move resets to qmp_phy_cfg for per-PHY customization. Keep legacy DT
path on the old hardcoded list; non-legacy path uses cfg->reset_list.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 3b48c69f9c3cb7daec495ebc281b83fe34e56881..3d228db9ef0882eb76e7ab9e82f8122fa9cfe314 100644
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
 
@@ -428,6 +429,10 @@ static const char * const usb3phy_reset_l[] = {
 	"phy_phy", "phy",
 };
 
+static const char * const usb3dpphy_reset_l[] = {
+	"phy_phy", "dp_phy",
+};
+
 static const struct regulator_bulk_data qmp_phy_msm8998_vreg_l[] = {
 	{ .supply = "vdda-phy", .init_load_uA = 68600 },
 	{ .supply = "vdda-pll", .init_load_uA = 14200 },
@@ -464,6 +469,8 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.rx_tbl_num             = ARRAY_SIZE(msm8998_usb3_rx_tbl),
 	.pcs_tbl                = msm8998_usb3_pcs_tbl,
 	.pcs_tbl_num            = ARRAY_SIZE(msm8998_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list              = qmp_phy_msm8998_vreg_l,
 	.num_vregs              = ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
 	.regs                   = qmp_v3_usb3phy_regs_layout,
@@ -480,6 +487,8 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list		= qmp_phy_sm2290_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_sm2290_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
@@ -496,6 +505,8 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(sdm660_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list		= qmp_phy_msm8998_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
@@ -512,6 +523,8 @@ static const struct qmp_phy_cfg qcs615_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list		= qmp_phy_qcs615_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
@@ -1051,8 +1064,7 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
 				     "failed to get pipe clock\n");
 	}
 
-	ret = qmp_usbc_reset_init(qmp, usb3phy_reset_l,
-				 ARRAY_SIZE(usb3phy_reset_l));
+	ret = qmp_usbc_reset_init(qmp, cfg->reset_list, cfg->num_resets);
 	if (ret)
 		return ret;
 

-- 
2.34.1

