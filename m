Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBFC5BB686
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 07:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FA110E16C;
	Sat, 17 Sep 2022 05:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE9C710E51F;
 Fri, 16 Sep 2022 20:11:44 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28GHj5Wo015663;
 Fri, 16 Sep 2022 20:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=MnCtvurojOKWqoJGxPx1Ps1jn61rPnLaggpC/sspea4=;
 b=XgNq1qILXfGtcG9oMD+wpHR0kB8JluDHzBffB4M0BDICE9jmmdQ5Z3i9Z7bdTktk5TPA
 5wp8nYp9r8WO+TutaO0p3OLPrg4gO86rrtaLSajHh602Oopn1rXdk1iRlsu16GbRgJD5
 n+PMMnYLj+3kTsi/tU9kTMyB8Jbnd2HR8WHYNNWXXDNurR6SvOjEhHcrKRiVMye2coZc
 K+NnHZ1tD6N0aGVcBshc9xidkEVf8zHd+LVKbbPALlirECDr1rhYsj8C6IBOjjPX1YNx
 BWkBjb91wLXn7n4kiWTuPA1YKGES12q0pzmcbBkR2bNSikOe+Gh2eOVebn7VMTXVwnfU 9Q== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jm93acv7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Sep 2022 20:11:40 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28GK0Z1Q017193
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Sep 2022 20:00:35 GMT
Received: from core-thresher1.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Fri, 16 Sep 2022 13:00:34 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 1/7] dt-bindings: msm/dp: Add SDM845 and SC8280XP
 compatibles
Date: Fri, 16 Sep 2022 13:00:22 -0700
Message-ID: <20220916200028.25009-2-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220916200028.25009-1-quic_bjorande@quicinc.com>
References: <20220916200028.25009-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: CzHPQfmVCo2m1iDUWP9NWy9RIlp5LCv6
X-Proofpoint-ORIG-GUID: CzHPQfmVCo2m1iDUWP9NWy9RIlp5LCv6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_12,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0
 mlxlogscore=829 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209160144
X-Mailman-Approved-At: Sat, 17 Sep 2022 05:33:33 +0000
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
Cc: devicetree@vger.kernel.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Add compatibles for the DisplayPort and Embedded DisplayPort blocks in
Qualcomm SDM845 and SC8280XP platforms.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index f2515af8256f..a1dc3a13e1cf 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -21,6 +21,9 @@ properties:
       - qcom,sc7280-edp
       - qcom,sc8180x-dp
       - qcom,sc8180x-edp
+      - qcom,sc8280xp-dp
+      - qcom,sc8280xp-edp
+      - qcom,sdm845-dp
       - qcom,sm8350-dp
 
   reg:
-- 
2.17.1

