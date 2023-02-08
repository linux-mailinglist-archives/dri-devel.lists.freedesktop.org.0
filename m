Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF1E68E6A4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 04:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D167310E696;
	Wed,  8 Feb 2023 03:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0E410E041;
 Wed,  8 Feb 2023 03:41:03 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3183BAf8025099; Wed, 8 Feb 2023 03:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=FAlupgPtYEREsKOhTYO1Yc7WAUH2hfOn5ObZq+1Jjok=;
 b=Ss4v1QR1u8Am503pzMCsOgSqkjGN3JF8SDYLkIwQJuGBZYrAc2tdW9t6QjvpKO0TueC3
 2SrLYm+BRGT8C5lYk0ltnc0cx1AgEyr/7wcA8vwpbykJjocs58s4A2PSMkmuEC6Myecy
 3Lv4Y+ymoqitOyZ+6+3xXXnm0KdOSIDY3z8Vx2dqtUqa0EL/RCEFf2+wL9Yekv+CojfM
 8Z9+0PusG6JJ5XqkQOi1LqPS5OyBCuqlgfT9A5VhsI4v8qIkgpuRwXBDXj5JRwoM+RHc
 5/NzdKf3/sq9eSwtbU0Aa+Jtq2mLRRuHfpKuzxCib2sC2ItgASOetZCMZCzl5YOoQt+L 0A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nm1yf0946-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 03:40:59 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3183ewNR020947
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Feb 2023 03:40:58 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 7 Feb 2023 19:40:58 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: 
Subject: [PATCH 0/3] drm/msm/adreno: GPU support on SC8280XP
Date: Tue, 7 Feb 2023 19:40:49 -0800
Message-ID: <20230208034052.2047681-1-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: vQejRFqRvUO6SVpjx1FXyIm_1p1FWFf0
X-Proofpoint-GUID: vQejRFqRvUO6SVpjx1FXyIm_1p1FWFf0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_15,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 impostorscore=0 mlxscore=0 phishscore=0 clxscore=1015
 mlxlogscore=779 suspectscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302080031
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
Cc: devicetree@vger.kernel.org, mani@kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, johan@kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series introduces support for A690 in the DRM/MSM driver and
enables it for the two SC8280XP laptops.

Bjorn Andersson (3):
  drm/msm/adreno: Add Adreno A690 support
  arm64: dts: qcom: sc8280xp: Add GPU related nodes
  arm64: dts: qcom: sc8280xp: Enable GPU related nodes

 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     |  26 +++
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    |  26 +++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 171 ++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 120 +++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c         |  34 ++++
 drivers/gpu/drm/msm/adreno/adreno_device.c    |  14 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  10 +-
 7 files changed, 396 insertions(+), 5 deletions(-)

-- 
2.39.1

