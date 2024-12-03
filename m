Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BC39E11C0
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 04:32:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A43E10E238;
	Tue,  3 Dec 2024 03:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="pNEFAVvj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74E410E1BA;
 Tue,  3 Dec 2024 03:32:19 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2Ij4Il029895;
 Tue, 3 Dec 2024 03:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=+koN14AkPH5cbJW8GFc0BD
 B9LCPmlXdpHR7UxmEVBqw=; b=pNEFAVvjeVzH0feyJD5aOJfqBv/y02rdZoGECX
 ccCb0+fRv6tyaEQR+O9z+hesd9Kdbd8/anW+EzoUihs2RW4VTw+NV77+hWESzewc
 yqwVVrIT/vDElz8VZk4viKa1hqbUTKr6JLMqA89FejZKCtlZX2XgaSUtD3YvQan8
 QkH/EtmwsHj3utg5dQF6GK4+mAEr2GjMlttUKc4h/PrbyyVbX27qMTzYwf4AKb6a
 w9qalnu04qC6v03oPFq9mQgWy6jP3Ou7GZOlfSNlKV3Xc48w9vMnwzurc/ciTIsz
 u//RJ2pG1xAcWBvaKDekW4VSsxJD50ozxSRqJY3AZSZ5K7Og==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437v07pkv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2024 03:32:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B33WDMl000622
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 3 Dec 2024 03:32:13 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 19:32:12 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/4] dt-bindings: msm/dp: add support for pixel clock to
 driver another stream
Date: Mon, 2 Dec 2024 19:31:38 -0800
Message-ID: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJt7TmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIKGbUhCfW1wSn5SZl5KZl16sa25qbJaWlmyZmGqUpgTUVVCUmpZZATY
 xOra2FgC2foF8YQAAAA==
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Mahadevan <quic_mahap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733196732; l=1372;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=UL/D4HUBGef/EKZ8I7dUaDW7FZ3Tk/uobmzx6KHFVdo=;
 b=FnnvSRuAZrHxsabPrgtWA16H4eqhH28gAVF1KKn8zoBetN3NXh8aHCVEaZ7cYWgbgOBQj0+Kk
 qxRxb1jSTP1Dz084jtUhTuERnJnrzu/a5oXfnPvkYp8V9qCDyMSTkGw
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: dH28tjyciau9RPwdpOWTzasf4-B1FbZU
X-Proofpoint-GUID: dH28tjyciau9RPwdpOWTzasf4-B1FbZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 adultscore=0 mlxlogscore=825 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412030028
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

On some MSM chipsets, the display port controller is capable of supporting
two streams. To drive the second stream, the pixel clock for the corresponding
stream needs to be enabled. In order to add the bindings for the pixel clock
for the second stream, fixup the documentation of some of the bindings to
clarify exactly which stream they correspond to, then add the new bindings.

In addition, to help out with reviews for dp-controller bindings, add myself
as the maintainter.

This change was made on top of [1] which fixes a warning on the sa8775p
bindings.

[1]: https://patchwork.freedesktop.org/patch/624068/

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
Abhinav Kumar (4):
      dt-bindings: display: msm: dp-controller: document pixel clock stream
      dt-bindings: display: msm: dp-controller: document clock parents better
      dt-bindings: display/msm: add stream 1 pixel clock binding
      dt-bindings: display: msm: dp: update maintainer entry

 .../bindings/display/msm/dp-controller.yaml        | 41 +++++++++++++++++++---
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  9 +++--
 2 files changed, 43 insertions(+), 7 deletions(-)
---
base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
change-id: 20241202-dp_mst_bindings-7536ffc9ae2f

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

