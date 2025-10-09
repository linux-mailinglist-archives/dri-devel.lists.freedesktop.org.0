Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D051CBC7A07
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 09:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C7810E92C;
	Thu,  9 Oct 2025 07:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Kvx8PLbf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A8410E186;
 Thu,  9 Oct 2025 07:11:55 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996F6X3020782;
 Thu, 9 Oct 2025 07:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:date:from:in-reply-to:message-id:references:subject:to; s=
 qcppdkim1; bh=6yo1A3JLCxACrqVHWbcJeP5T5dsEr4aNwhpgyw5mhpA=; b=Kv
 x8PLbfm2jRbvKSja+dboPXigfTIrClJUlYpJ0UYUaAqu9y0yeER+HQcothNOf65l
 RP9e5AfI2JeU6BNPju/0UwyuDoxkvWzKbDSZvva2n8HiXT93bLvuoDy8KsHTBMLF
 37Mp3bRfOdZuV+fxNMKWDHcQ6v978IAZRvxhzHc59vi1V1awzu3xFEGh1ImWWi8S
 QinLuMS9+bj0BmMTIZ4gl6Uvz7FRnNjzAXNt+3M0uoL0VUmkeRYkVz7gGABJWBwu
 ppkbwA3jiaCC9qFei6c0cEisr895RYIIQUaVgd8IFR1pp+DakVeSzUQwylwxScyk
 yV1NEMDXHlv4jJA445dw==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nstk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 07:11:47 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5997BhJu002155; 
 Thu, 9 Oct 2025 07:11:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 49jvnmbgxx-1;
 Thu, 09 Oct 2025 07:11:43 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5997BgAq002132;
 Thu, 9 Oct 2025 07:11:42 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-riteshk-hyd.qualcomm.com
 [10.147.241.247])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 5997Bgpa002127;
 Thu, 09 Oct 2025 07:11:42 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2314801)
 id 9D1A55015BA; Thu,  9 Oct 2025 12:41:41 +0530 (+0530)
From: Ritesh Kumar <quic_riteshk@quicinc.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, mani@kernel.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 vkoul@kernel.org, kishon@kernel.org, cros-qcom-dts-watchers@chromium.org
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 quic_vproddut@quicinc.com
Subject: [PATCH 2/5] dt-bindings: display/msm: update edp phy example
Date: Thu,  9 Oct 2025 12:41:24 +0530
Message-Id: <20251009071127.26026-3-quic_riteshk@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251009071127.26026-1-quic_riteshk@quicinc.com>
References: <20251009071127.26026-1-quic_riteshk@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: U04LzMRHByU87a_nhjx2RuhKMzSafAGl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX32uR7k9FI73a
 aSNB3SafRGZtpHH244K5rYdT6e2M9XjydSzz+YJekXIR8rOo3g2E7NqxSSAprKHrVD6L5ZWIA14
 nsaplUO2l+hSUOzjPAwEBWCtV/dMTrFfJj+QD3aK8i7HtluqP2zD1SLTNmpVoAuSTsZqaRbBF5J
 mxM1kJOz3Ep50J3HmNMom2zJpZcclnakCLP78qzYZHvRLVwYxSPm6wmBXTf1Ycwh49elJa50MYH
 9sj16BarFEL5ey9aRI15z5tvlR6Oe+SUhVeVtduCHxRLrn8Kv0x7+P1rtb3k0BShc7KKaLw6bU6
 RzeiD7M+bBVwFbAPz2tjSFknCTD3EBS8Zm+O3IQjAbxjYgkntPFgDyldXQTbNa8HHqcndXQvsPR
 PgAcR5BQsRuQmHlFsM/Vb8xaHCb7ag==
X-Proofpoint-GUID: U04LzMRHByU87a_nhjx2RuhKMzSafAGl
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e76033 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=oEHEdq8NKjjnXOn0XdMA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1011 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

Update clock entry in edp phy example node of sa8775p and
sc7280 to add edp referece clock.

Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
---
 .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml  | 6 ++++--
 .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml   | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index e2730a2f25cf..5c0fa95244d7 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -200,9 +200,11 @@ examples:
                   <0x0aec2000 0x1c8>;
 
             clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
-                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
+                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+                     <&gcc GCC_EDP_REF_CLKREF_EN>;
             clock-names = "aux",
-                          "cfg_ahb";
+                          "cfg_ahb",
+                          "edp_ref";
 
             #clock-cells = <1>;
             #phy-cells = <0>;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index b643d3adf669..02568b6e349e 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -357,10 +357,12 @@ examples:
                   <0xaec2600 0xa0>,
                   <0xaec2000 0x1c0>;
 
-            clocks = <&rpmhcc RPMH_CXO_CLK>,
+            clocks = <&dispcc DISP_CC_MDSS_EDP_AUX_CLK>,
+                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
                      <&gcc GCC_EDP_CLKREF_EN>;
             clock-names = "aux",
-                          "cfg_ahb";
+                          "cfg_ahb",
+                          "edp_ref";
 
             #clock-cells = <1>;
             #phy-cells = <0>;
-- 
2.17.1

