Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOxYHf73eWkE1QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:50:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02482A0D3D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523DC10E6AB;
	Wed, 28 Jan 2026 11:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="IPBwy8Sf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D02410E6A6;
 Wed, 28 Jan 2026 11:50:18 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60SBdwgu1750484; Wed, 28 Jan 2026 11:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=3tYuMK+/KLT
 A3ip7uzmFrFV6U1Nmf8CxPhphnFoPdfk=; b=IPBwy8SfoBL3bSAw1TK6MHOGncp
 9vfkMEUl4NGWs4rQwiweBIdRsME/gGr72XCUapzETPsMSU/bZ6YjET14DXD9q5Lk
 1ZAS4ZIUrpwm2qbMCFGDN6XL80GSFYtGpNooDyKNAckgRWIDxqXhNWABgRzrop9P
 aJLA24ou8bWyKuBMMXIz1lHdgAVGbj+ipk9RBZaiAzm+becbRuEnBknVhGhvceM5
 0sg80vlRtoi4XyxfBInB1VJ1RFVt4m747DiIzzUpsJpBwZmfuWC0rEK/GUvp2Iaq
 uiHmDoLXeklltZGHj+HpPkScaxP40mCa9nMWCB1jPjzIp3NkepkdWaG0K6g==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byhsj810u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jan 2026 11:49:08 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60SBn5nM004231; 
 Wed, 28 Jan 2026 11:49:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4bvq5mgsj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jan 2026 11:49:05 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60SBn5rI004095;
 Wed, 28 Jan 2026 11:49:05 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-riteshk-hyd.qualcomm.com
 [10.213.102.118])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60SBn4Bk004088
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jan 2026 11:49:05 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2314801)
 id 38DF15DB; Wed, 28 Jan 2026 17:19:04 +0530 (+0530)
From: Ritesh Kumar <quic_riteshk@quicinc.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_mahap@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 mani@kernel.org, James.Bottomley@HansenPartnership.com,
 martin.petersen@oracle.com, vkoul@kernel.org, kishon@kernel.org,
 cros-qcom-dts-watchers@chromium.org
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 quic_vproddut@quicinc.com
Subject: [PATCH v4 1/2] dt-bindings: phy: qcom-edp: Add reference clock for
 sa8775p eDP PHY
Date: Wed, 28 Jan 2026 17:18:49 +0530
Message-ID: <20260128114853.2543416-2-quic_riteshk@quicinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128114853.2543416-1-quic_riteshk@quicinc.com>
References: <20260128114853.2543416-1-quic_riteshk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: JsU5XzEfAhPiFMY_35aHI4GBpdPWVWDK
X-Authority-Analysis: v=2.4 cv=GbMaXAXL c=1 sm=1 tr=0 ts=6979f7b5 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=CGB5f--vUc36iqpOADYA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: JsU5XzEfAhPiFMY_35aHI4GBpdPWVWDK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5NyBTYWx0ZWRfX/zuEfuQrMrNw
 Qqu5aompy93eWnKStuIA1ZAcrxuHY7Re1LeC8meTMoS9XMNWnCtP/Zs/Qp0bnBiMA7KUAwhWBBv
 ddQuTpmmbpCX8SLCQ5yYlhgxqY8sy2py+phvHsLhJjGhlZumDeK64PG3OBsSeCHm/XWg+e/wbfx
 uaHV9aPDFOvHxrL9HqWBBN8jMR+UmPv1rBe/vK2rkpQoT38t/0Mbsl88zxdQEHmI/On8/YzYW7H
 9OP9A+kZgOpQNxHR98azYpqmroDXaqC3CUkTqxQyH8Dlom+S1Ib++1M9sGc/Nf+dLg+Yjt2blf4
 GyWfSjRi5Bv0X+H2dCJULzGEkRm7IJugJXS8Q5f1di8PyVO0Dgfp9Wp3g1A2TRbE1eutdimTyxa
 vAzKBXh/jCSXrsLc5d+X6d8x/5ywcK7EtK4e0vye6T0++R/F/yqGtHPNAL+FSJeebI29XFfqp33
 4y/bHD98OAihGPDK47w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280097
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,quicinc.com,HansenPartnership.com,oracle.com,chromium.org];
	DKIM_TRACE(0.00)[quicinc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_riteshk@quicinc.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,quicinc.com:dkim,quicinc.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 02482A0D3D
X-Rspamd-Action: no action

The initial sa8775p eDP PHY binding contribution missed adding support for
voting on the eDP reference clock. This went unnoticed because the UFS PHY
driver happened to enable the same clock.

After commit 77d2fa54a945 ("scsi: ufs: qcom : Refactor phy_power_on/off
calls"), the eDP reference clock is no longer kept enabled, which results
in the following PHY power-on failure:

phy phy-aec2a00.phy.10: phy poweron failed --> -110

To fix this, explicit voting for the eDP reference clock is required.
This patch adds the eDP reference clock for sa8775p eDP PHY and updates
the corresponding example node.

Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
---
 .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml  | 6 ++++--
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml     | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index e2730a2f25cf..6c827cf9692b 100644
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
+                          "ref";
 
             #clock-cells = <1>;
             #phy-cells = <0>;
diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index 4a1daae3d8d4..0bf8bf4f66ac 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -74,6 +74,7 @@ allOf:
         compatible:
           enum:
             - qcom,glymur-dp-phy
+            - qcom,sa8775p-edp-phy
             - qcom,x1e80100-dp-phy
     then:
       properties:
-- 
2.34.1

