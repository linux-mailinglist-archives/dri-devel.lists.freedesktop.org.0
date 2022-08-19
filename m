Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E82559A28A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 18:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A9B10E632;
	Fri, 19 Aug 2022 16:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF0710EBB3;
 Fri, 19 Aug 2022 16:41:15 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27JGbWfu015591;
 Fri, 19 Aug 2022 16:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=y5Wja1p/9P93G5DwYgWzDk04yKR4AAF3vxxCF5pAYHk=;
 b=eypOYiGvXzYToLFBNqywWBW6arNUa1KxS4AGcuk61cNYzRe9JYEQSzNDcXXxoeEIB9Qk
 CuKaFoKFa7dM04YNggEqt6g5krjam0kIHjEISgjluXiIXKOKXupFAmdEHsMYJVCG9I/s
 a8KI0G2/+kLMtGp5YIeetO7l6hyBVkb9zYyAUKJTIz4VOIpMynPLMul2svJO18n0anMQ
 dtNSZejgBeu0p9p0uquwV4n7Ca8wa4PmnCALBSbZNQicbCduwA5tUNLGrQgSqfl3V04k
 WnIrp7iM13MG+skOFZo1NXsoc+qF2VHOo7IZ31RRLbaBqUvOQ5S4iHd2DOdWL0YP1/wg RA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j253khnw7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Aug 2022 16:41:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27JGf80d019026
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Aug 2022 16:41:08 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 19 Aug 2022 09:41:02 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "Stephen
 Boyd" <swboyd@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 1/6] dt-bindings: clk: qcom: Support gpu cx gdsc reset
Date: Fri, 19 Aug 2022 22:10:40 +0530
Message-ID: <20220819221017.v4.1.I68b749219741db01356a42d782f74265d29a2ac3@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1660927246-11327-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1660927246-11327-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: LVkLCeiR2WLM30mcQLPzfbtOasrKZVDS
X-Proofpoint-ORIG-GUID: LVkLCeiR2WLM30mcQLPzfbtOasrKZVDS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_08,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190060
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

