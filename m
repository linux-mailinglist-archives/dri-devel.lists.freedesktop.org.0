Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2CFB2D87A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 11:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AEA10E6DB;
	Wed, 20 Aug 2025 09:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ABGIdaKn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0B810E6D6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:37:12 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oj5h024584
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HXCMXoEHSzzPkbhgvQAI0rYXROuTcAwPw7wz3hIiRiE=; b=ABGIdaKnG4GHl2d8
 vhzi1spaRkB4HIzlUvaFsFgyz+Ych12at+Y94WxbqxngGfSBcAiBlAEkSSLZQ+yK
 3Q778BjukosfUQutkunRWvB1rKdkhTiEvuD0wK71oudArQ/H2V3anmvFA+HTvFmD
 hrCIbnHWyY2OJyDEesWXDDIHM6HTqs0wIbhgDh4Yn+W5VgJ289C+bUIXgY4E9wnh
 XyJ+0ufZB1A+adwMhhSzGTpMXproXEg2I+IAZ+WdLsS18QIOWKbnmqUJiQy9Vcbd
 VLfOYbJ6tJVF3xdp1iJYLaZcxbpvILupixWDSaqeFRJCMDoOzM0YBmLKtCd+l3fc
 k8ozVg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52917qx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:37:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b47643b96ccso122787a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 02:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755682631; x=1756287431;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HXCMXoEHSzzPkbhgvQAI0rYXROuTcAwPw7wz3hIiRiE=;
 b=gS8FmP0iVDfHUeEvWTls/zMPR46d88oxhO2tWTTpzAhgohHNXGHLAVMxqkIhs5CVgm
 AmBK2ALEDbp3FEbsqjcWlQ6Vv6WTkKG81NQCt9EsOlBYveTgBIDLjFafDkfEms/WzwRO
 xQ+ZLVV79nBy/Rhl1U1mE4v0pn4e62LsqFns3BfRLqJw/bA3YmsiC3oG95KNG6BqiR/w
 w9n0r5nV4NNa+AT3xoA61mouJv4TRHLWMIl+szFl/HaLYooxKeCWP+gluFqEeAfczjkf
 VA3IcaMU4g+yEZCNArYuXxfZCg0nvNZz+E0yQRdSPrZpSbz1tMXwkNSqWDwafk8IWBRk
 /0Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPmFxonwyizwA/WioITlTHI25+04rRwTiH/4u7evSJ7naNHQc1yph6O0W818xmz9o1HJZisxcNfSo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxG3oOUOdS593H1TUkkCLalewPpc6WtHbLF9UJDL0cjxCyAoJjz
 Dsz7QnxMINcVsSQo1/XAvp2GjgC7ldPG+bsWufmq/zo4cr6XI1sVXGek9qHkNu1Ew+SprvhLKjS
 vG7ozDqLyRmFExWsqKIVZrY6gVzBTaucTOcTOfUHp7rm5glQ4S7ZbkoU5twjDtVc7fyRsnCU=
X-Gm-Gg: ASbGncuIvP0AJzX6KcB4W7BlyeV/B9BzorjOA6H9iKfslqPsbIt7cWYlSfl8QLl1XGp
 uAJsZQaVLW7YjLSfjFXneJz2Q2qonFCJSclS45WDzqYJbDos4t3RNa2xE1udCswWA1E+vBD/kc2
 eP6RIDvPPZBRfl2fSdC/kmGnFQBBzDTj+KgOjn9zlbqFVFMepMu8751FzgzAerz38FWPgS8Aq5P
 45MYRHhmu0J0FBG6QHigz3hW+OqOZsAraeTzVSYCxwGvv7HlKn2e1pTIt6vcKRv3/Y0TkZATO02
 +hTmN1Nf+V48J+LVMNzWVJvMk6LO5i81BoVffaEWFBjh4AWX5FB71BKPlzfrdFiTfdMK9iJ1Cpp
 jbIO5t02Oib0cESLoSLCaVIDS0Bl/EtMyRI0QMWqNhfO4qJ7v5DC2b39C
X-Received: by 2002:a17:903:1c7:b0:240:71db:fd0 with SMTP id
 d9443c01a7336-245ef25bccemr12961345ad.8.1755682630842; 
 Wed, 20 Aug 2025 02:37:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9n+Y8mt33jA5ru0MGM6k0vMA0mnbToTLiA24zruGDf9ewnDEOM2CMV/Nmr32brvdMMc9ajg==
X-Received: by 2002:a17:903:1c7:b0:240:71db:fd0 with SMTP id
 d9443c01a7336-245ef25bccemr12960945ad.8.1755682630363; 
 Wed, 20 Aug 2025 02:37:10 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4ec100sm20954305ad.116.2025.08.20.02.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 02:37:10 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 17:34:54 +0800
Subject: [PATCH v3 12/14] phy: qcom: qmp-usbc: Add QCS615 DP PHY compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-add-displayport-support-for-qcs615-platform-v3-12-a43bd25ec39c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755682521; l=1063;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=TLXmf7CMeiTC8Z6DwRlj4bLrhrN7dz3DcuKvJOyLkT0=;
 b=tYrwmSqZ7+5gVwIwT7A3TBOs5j5jdX94tAHdFyRh09FRVFwfiHNuGNctJEVjLCL+44jGzT5KO
 VMggrWG6o4GB2Lt8oNsfF0Hw4vF+8wqfhzzMSaHydvX/vBS/00DQKsZ
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a59747 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=3lua1KrjtZAvismTP1MA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 1zb_8unTeM3ZwUfdwOWa2TM2EcrAhSRz
X-Proofpoint-GUID: 1zb_8unTeM3ZwUfdwOWa2TM2EcrAhSRz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX6oOG0dhrrHDx
 dfI/MFuWQKnYTMEYCmORj3gmdInlYjLvoZB2aV2OlMON0eWHSH8e6OmfrnFbgIdB31SN92ZASx9
 KPAikK6GfIPMLbeZTr3M9Zqe8Trv+Hwm2UfTQLNlrEBLQnBLqO3ImP4mDh8PpBZB29riYfIkUI/
 dPvBVV/1oYT+W0svWlXa5hqTW0iWGrXz5YTHHQWlLOKSs2of8+PiFPlmGXLs45kRwqa+I2HWc40
 i3dJUHpwB5jcAKkP9JhwFho7K8Z9znixbeSeFAgDeOlIbAOtOYgpr2wx0JWaO0KXimmaU8qScBt
 O90aFvly8bByEROk/TmklG/P9w6/tflPXfN3HSEOeh//yBxtBS9GsvrIvIfigULfD/OMTGYHgR5
 WmxLbLYUlSLctnXL8VC53nckNm/EnA==
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

Introduce qcs615-qmp-usb3-dp-phy compatible string to associate QCS615
platform with its USB/DP switchable PHY configuration. This enables the
driver to apply the correct setup for PHYs that support mode switching
between USB and DisplayPort.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 74b9f75c8864efe270f394bfbfd748793dada1f5..d56e334d58576d15a9ac047abe40a479e790a324 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -2022,6 +2022,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
 	}, {
 		.compatible = "qcom,qcm2290-qmp-usb3-phy",
 		.data = &qcm2290_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,qcs615-qmp-usb3-dp-phy",
+		.data =  &qcs615_usb3dp_phy_cfg,
 	}, {
 		.compatible = "qcom,qcs615-qmp-usb3-phy",
 		.data = &qcm2290_usb3phy_cfg,

-- 
2.34.1

