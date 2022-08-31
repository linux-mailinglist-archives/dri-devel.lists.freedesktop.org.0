Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D77D55A7591
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 07:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FB610E191;
	Wed, 31 Aug 2022 05:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84C210E191;
 Wed, 31 Aug 2022 05:19:13 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27V1FugI002336;
 Wed, 31 Aug 2022 05:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=y5Wja1p/9P93G5DwYgWzDk04yKR4AAF3vxxCF5pAYHk=;
 b=SQYIBfIN+DbKxp4XCbcMYuxr+PrmsvAFidS0p3A9pQGPh3q1Dq7U3dz9gXPeGI6L4UO0
 gn0wGAy+6xFnm7NZPE6AcWUD116Na5KNZegWStoQ79a9D3QoCq6PHCK01R8lP3C4N+nO
 vVil4H7N+hUIA+hzgkFNXMNQHVmTgQtnL5wMBv/SyaZy1OmaMEFOkF/YLH489sdfC4Qk
 qt7wA/x+r6CxFHMJKQIu5GX2D3x3/iFX5AyuBixq0bPfD2G9fl14/lERf4pO/ORw7Gy+
 F0mphYDOrZwU+o/VOMfjc/zBibeyW46PJMT1q1ZAGCHxcIAvi3B1YxVwK5S8giUtLQWy tg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j9n862eay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Aug 2022 05:19:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27V5J6tW029268
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Aug 2022 05:19:06 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 30 Aug 2022 22:19:00 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "Stephen
 Boyd" <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v6 1/6] dt-bindings: clk: qcom: Support gpu cx gdsc reset
Date: Wed, 31 Aug 2022 10:48:22 +0530
Message-ID: <20220831104741.v6.1.I68b749219741db01356a42d782f74265d29a2ac3@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1661923108-789-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1661923108-789-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: z7t5iSuY-9gZpeBEK57muvso-hJ2-br3
X-Proofpoint-ORIG-GUID: z7t5iSuY-9gZpeBEK57muvso-hJ2-br3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_03,2022-08-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 impostorscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208310025
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
Cc: devicetree@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 krzysztof.kozlowski@linaro.org, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add necessary definitions in gpucc bindings to ensure gpu cx gdsc collapse
through 'reset' framework for SC7280.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

(no changes since v1)

 include/dt-bindings/clock/qcom,gpucc-sc7280.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gpucc-sc7280.h b/include/dt-bindings/clock/qcom,gpucc-sc7280.h
index 669b23b..843a31b 100644
--- a/include/dt-bindings/clock/qcom,gpucc-sc7280.h
+++ b/include/dt-bindings/clock/qcom,gpucc-sc7280.h
@@ -32,4 +32,7 @@
 #define GPU_CC_CX_GDSC				0
 #define GPU_CC_GX_GDSC				1
 
+/* GPU_CC reset IDs */
+#define GPU_CX_COLLAPSE				0
+
 #endif
-- 
2.7.4

