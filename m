Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBmAF30wlGnQAQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 10:10:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C4914A38F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 10:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DDD10E4A7;
	Tue, 17 Feb 2026 09:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="X9VT7sPf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEB210E4A5;
 Tue, 17 Feb 2026 09:10:16 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61H8v8ig048690; Tue, 17 Feb 2026 09:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=mplPsqcwhOJ4zG9QmprXvgo9v7eBbknE/op
 rEMGOhvk=; b=X9VT7sPf/XnXABUV8u+1oa0rb/ftVxRb7jK5jbNPFl3dBQQU3oY
 YoFsCa4M2yTfBitsDv8KdU1TI5vAun3zF0BrUR8gvOld0+1gboTHCmx0tJLU0uIA
 kpYED2ziq8FDQy9Z18x7q5Oo7ZyY/hNpY3VVyXQPRp4tCJwgweyKvZXYgJ0FNESS
 hUHjAPA2+Sdr35iZTjk7LBC31neOt8sjoqaMzINDOKUU35vWqmtKhykPoLPG/5RK
 wDmXa/N4DXVjZmsYzn7WilSa7bd4sEWt6PcFZRtsiRTCm68lIqubnX3oSSMC2zSK
 4kzHDmm/Jk0VFAxunSTdu6ZpLd44BvAb/OQ==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6d81s7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Feb 2026 09:10:03 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61H99wCw032449; 
 Tue, 17 Feb 2026 09:09:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4caj4m6kaf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Feb 2026 09:09:58 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61H99wkn032433;
 Tue, 17 Feb 2026 09:09:58 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 61H99wcJ032428
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Feb 2026 09:09:58 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id 5E7BA5CB; Tue, 17 Feb 2026 14:39:57 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
 dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
Subject: [PATCH v7 0/2] Add DSI display support for QCS8300 target
Date: Tue, 17 Feb 2026 14:39:53 +0530
Message-Id: <20260217090955.2446470-1-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=bqVBxUai c=1 sm=1 tr=0 ts=6994306b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=RHkTxhJYF7RHL4dZ0YsA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3NSBTYWx0ZWRfXzFiklDimpMwf
 +VVATknpVKprSmHbtepLFCJVnpUBx7xMNlFhf8EDBm+YQ+4AJuydfFoV6uvhCGzJ3yK7bPQWDTS
 UZleEBoeDfEwZciDzGtU9AYcdHpZOQ+seT+t8uFEbbqZ135f2KBYP4K0PVVBHgV9kuzUJh67OAg
 J5e/BERO7XMLjKNVVfd9dLFPqYQCNYy42unEEu5dKAEC00UvB5ARBXWm58drori/Xoxckz+UiOX
 RIjJpXBwAClPxIkGPGCqTMShrpa/4xzcizrO+y8a7S00PaSoXOOT9+tLqLDtct/BjhWbm7uskpJ
 T8W2/sqdkyOsBo55jHm8Vxc2MOWbp7qZ/ynhVa3fAWV9DneTmqNNVXz6SFsU8pkefO8+UYALxoX
 Ky6VQ/BZSClc85feQmr+ZvfLT3USm4uRD2JZbPokmWjB+0UhjX5UvMZ9eu8ApNllIcDaQR9mGbr
 xvjPjxcPX0SCCc0mp6A==
X-Proofpoint-GUID: wIL9atNv9jY-_35MhwcpqdlkP4R1NYG2
X-Proofpoint-ORIG-GUID: wIL9atNv9jY-_35MhwcpqdlkP4R1NYG2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170075
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[quicinc.com,gmail.com,oss.qualcomm.com,poorly.run,somainline.org,kernel.org,intel.com,linaro.org,ideasonboard.com,marek.ca,kwiboo.se];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[quicinc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_amakhija@quicinc.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 00C4914A38F
X-Rspamd-Action: no action

This series enables the support for DSI to DP bridge port
(labeled as DSI0) of the Qualcomm's QCS8300 Ride platform.

QCS8300 SoC has DSI controller v2.5.1 and DSI PHY v4.2.
The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.

---

Changes in v7: Addressed review comments from Loic Poulain
   - Added refgen supply for mdss_dsi [Loic Poulain]
   - Link to v6:
     https://lore.kernel.org/all/20260124203925.2614008-1-quic_amakhija@quicinc.com/

Changes in v6: Addressed review comments from Konard
   - Dt binding patches are merged in v5.
   - Patch 1: Added new line at few palces and corret the regsiter
     size.[Konard]
   - Patch 2: Correct the order of the regulators and added new
     line.[Konard]
   - Link to v5:
     https://lore.kernel.org/all/20260104134442.732876-1-quic_amakhija@quicinc.com/

Changes in v5: Addressed review comments from Krzysztof
   - Patch 1: Updated commit description. [Krzysztof]
   - Patch 2: Updated commit description.
   - Patch 3: Added reviewed by tag from Krzysztof. [Krzysztof]
   - Link to v4:
     https://lore.kernel.org/all/20251225152134.2577701-1-quic_amakhija@quicinc.com/
 
Changes in v4: Addressed review comments from konard and Krzysztof
   - Patch 1: Update commit description to clarify PHY compatible string
              details.[Krzysztof]
   - Patch 2: Update commit description to clarify CTRL compatible string
              details.
   - Patch 4: Added new lines at few places. [konard]
   - Patch 5: 
            - Moved regulator always-on and boot-on properties at the end of
              the node. [konard]
            - Added new lines at few places. [konard]
            - Made the tlmm gpios entries sorted based on gpio index
              number. [Konard]
            - Drop output-high property. [konard]
   - Link to v3 :
     https://lore.kernel.org/all/20251125013302.3835909-1-quic_amakhija@quicinc.com/

Changes in v3: Addressed review comments from konard and Dmitry
   - Patch 2: Remove qcom,qcs8300-dsi-ctrl from clk details. [Dmitry]
   - Remove PHY and CTRL driver support. The CTRL and PHY versions for
     Monaco are the same as LeMans, and Monaco will use the same CTRL
     and PHY based on the fallback compatible string [Dmitry/Konard]
   - Patch 5: Rename the regulator used and arrange the compatible, reg,
     address and size cell for i2cmux in proper order. [Dmitry]
   - Link to v2:
     https://lore.kernel.org/all/20251006013924.1114833-1-quic_amakhija@quicinc.com/

Changes in v2: Addressed review comments from Konard and Dmitry
   - Patch 1: Documented the qcom,qcs8300-dsi-phy-5nm compatible string.
   - Patch 2: Documented the qcom,qcs8300-dsi-ctrl compatible string.
   - Patch 3:
           - Added qcom,qcs8300-dsi-ctrl and qcom,qcs8300-dsi-phy-5nm
             compatible strings
             to the Device Tree bindings. [Dmitry/Konard]
           - Fixed indentation issue. [Dmitry]
           - Drop the extra empty line. [Dmitry]
   - Patch 4: Added PHY driver support for qcom,qcs8300-dsi-phy-5nm.
   - Patch 5: Added CTRL driver support for qcom,qcs8300-dsi-ctrl.
   - Patch 6: Included qcom,qcs8300-dsi-ctrl and
     qcom,qcs8300-dsi-phy-5nm compatible strings in the Device Tree. [Dmitry/Konard]
   - Link to v1:
     https://lore.kernel.org/all/20250925053602.4105329-1-quic_amakhija@quicinc.com/

Ayushi Makhija (2):
  arm64: dts: qcom: qcs8300: add Display Serial Interface device nodes
  arm64: dts: qcom: qcs8300-ride: add anx7625 DSI to DP bridge node

 arch/arm64/boot/dts/qcom/monaco.dtsi      | 107 ++++++++++++-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 179 ++++++++++++++++++++++
 2 files changed, 285 insertions(+), 1 deletion(-)

base-commit: 350adaf7fde9fdbd9aeed6d442a9ae90c6a3ab97 ("next-20260216")
-- 
2.34.1

