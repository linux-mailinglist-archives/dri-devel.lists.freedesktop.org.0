Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6468C597CE0
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 06:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE11B5BB1;
	Thu, 18 Aug 2022 04:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546F5B5B3F;
 Thu, 18 Aug 2022 04:17:28 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27I4H4CD010221;
 Thu, 18 Aug 2022 04:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=y5Wja1p/9P93G5DwYgWzDk04yKR4AAF3vxxCF5pAYHk=;
 b=m0fZfpVDLE6q5XF/etnOObtm7jktzGrcPfLkOMXftwKv2DkqRQCg4LZDStr46GFiF30i
 8Lp3PCxeBXraXKzMNVCpyFVO1UFXGbGfDhrXsubOcjp2Rm7t9WFQ8kPEwZV+cgphnfEw
 O042i4JX6zatcaTv+4qsLIm50BhrcrK9NM/1f0CiNOZ+BUs3RwoSjhp303v7zwvpMhox
 cqSBWmY9+Bc1LJ/XX4BKAqTttWpmTjd7zt5yrSN0fEkMZqLJE8I4lg8Hc4uL0EsI7l0b
 PQt8fK441CnNLqXPKZiPVosHTqqtVJoSfqkzepWMzDw5Y+3wsycxMCM9w5iEXoAc0vCq OQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j12hhjkr7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Aug 2022 04:17:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27I4HJl5018189
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Aug 2022 04:17:21 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 17 Aug 2022 07:58:20 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "Stephen
 Boyd" <swboyd@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 1/5] dt-bindings: clk: qcom: Support gpu cx gdsc reset
Date: Wed, 17 Aug 2022 20:27:50 +0530
Message-ID: <20220817202609.v2.1.I68b749219741db01356a42d782f74265d29a2ac3@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1660748274-39239-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1660748274-39239-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: N-HfNhZ7wV-EqeKr-8eOr---1VQlCwx3
X-Proofpoint-ORIG-GUID: N-HfNhZ7wV-EqeKr-8eOr---1VQlCwx3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_02,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208180014
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

