Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9C0C30CD6
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 12:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A14010E276;
	Tue,  4 Nov 2025 11:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAFmWsLU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FAC10E276;
 Tue,  4 Nov 2025 11:44:13 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A48giGt1655300; Tue, 4 Nov 2025 11:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:date:from:message-id:subject:to; s=qcppdkim1; bh=5/S4v6r8YL5E
 hQw/DbiTYL7kr5Q9P8FFX0xAbok2OBM=; b=dAFmWsLUqjUQeZgXivMyWc7EY5fi
 uuPFelNEH6uvwC2+ehBlFVC3huOazFC5BXsP9OT3xN82QF808VdfaQ7J1tnUmGrf
 oiEXUGbCwGg6sZt7wESeaqlj+B+Xze/8xmAQ3hheh9iR/6mZVR995NGMVNULMfYx
 vioq8t+Gm7EhbjeL7TCV7QI9hrbDxLq994mqWUDKxMTh25L9t3Q3h1FpO8d4IJM0
 ea0kJvETOXG7YgpYvadDgOexxZB0WXfWwCQhBZuJmq86/8bsBuwLzEh5DoX71lxj
 8KaE9whJzb55njAEOdFl9R1zTKfm9ld9m6LR8+JTtbyJ0w+x05zbFQ62Iw==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70f1jsem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Nov 2025 11:43:35 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A4BhWpd013471; 
 Tue, 4 Nov 2025 11:43:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4a5b9mg9yy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 04 Nov 2025 11:43:32 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5A4BhW28013456;
 Tue, 4 Nov 2025 11:43:32 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-riteshk-hyd.qualcomm.com
 [10.147.241.247])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 5A4BhVXi013451;
 Tue, 04 Nov 2025 11:43:32 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2314801)
 id EF65F5001D5; Tue,  4 Nov 2025 17:13:30 +0530 (+0530)
From: Ritesh Kumar <riteshk@qti.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, mani@kernel.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 vkoul@kernel.org, kishon@kernel.org, cros-qcom-dts-watchers@chromium.org
Cc: Ritesh Kumar <riteshk@qti.qualcomm.com>, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 quic_vproddut@quicinc.com
Subject: [PATCH v3 0/2] Add edp reference clock for lemans
Date: Tue,  4 Nov 2025 17:13:25 +0530
Message-Id: <20251104114327.27842-1-riteshk@qti.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=JLQ2csKb c=1 sm=1 tr=0 ts=6909e6e8 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=VVwWfd7dDLNrxvkr-osA:9 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA5NiBTYWx0ZWRfX12/8YyVIsgPX
 uFQT35IZo9zXIs3YD8WodGSgRqhxWPaKIVUaSdobhYh8dx7pzy9v4EQALNpkz1DliMiI+4NxYKR
 jjXWzl6Du5lEz6meI9/dGIn4o2rycAXN+MPa8IevMhtMhoKFutoNsIFTVfP0WUsphpREq88VqSL
 qy27ZKK+hfw9f+cc9yjKF9BPrKcnRM9H24piv29QHER+wQ7mXmzjqkNMWQpCSxUXJ40ZwJwaLVl
 YD1GcjyHWXM/nmL+UhmAb3PiN7LJbpt8Yv+axMdGDQ19+KR9Arxe0ElrTN1TFaH71rC8cC0fy7r
 NEKmoRmdACXYDJ7pkGhbUxdQz9tvBPE2SxSqoojV//J0uvapYb5RWReWr2LCn1lV56vp0ljOZPv
 Di6TqtH6rjqdyZDQEcH1cgBWiIXceA==
X-Proofpoint-ORIG-GUID: XuAHXMLLp2ATSv8CImM8lPt7CqiaUJpW
X-Proofpoint-GUID: XuAHXMLLp2ATSv8CImM8lPt7CqiaUJpW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040096
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

On lemans chipset, edp reference clock is being voted by ufs mem phy
(ufs_mem_phy: phy@1d87000). But after commit 77d2fa54a945
("scsi: ufs: qcom : Refactor phy_power_on/off calls") edp reference
clock is getting turned off, leading to below phy poweron failure on
lemans edp phy.

[   19.830220] phy phy-aec2a00.phy.10: phy poweron failed --> -110
[   19.842112] mdss_0_disp_cc_mdss_dptx0_link_clk status stuck at 'off'
[   19.842131] WARNING: CPU: 2 PID: 371 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x174/0x18c
[   19.984356] Hardware name: Qualcomm QCS9100 Ride (DT)
[   19.989548] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   19.996697] pc : clk_branch_toggle+0x174/0x18c
[   20.001267] lr : clk_branch_toggle+0x174/0x18c
[   20.005833] sp : ffff8000863ebbc0
[   20.009251] x29: ffff8000863ebbd0 x28: 0000000000000000 x27: 0000000000000000
[   20.016579] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000001
[   20.023915] x23: ffff0000c53de980 x22: 0000000000000001 x21: ffffb4b57fd8d710
[   20.031245] x20: ffffb4b5bb238b88 x19: 0000000000000000 x18: ffffffffffff7198
[   20.038584] x17: 0000000000000014 x16: ffffb4b5bb1e2330 x15: 0000000000000048
[   20.045926] x14: 0000000000000000 x13: ffffb4b5bd386a48 x12: 0000000000000dfb
[   20.053263] x11: 00000000000004a9 x10: ffffb4b5bd3e5a20 x9 : ffffb4b5bd386a48
[   20.060600] x8 : 00000000ffffefff x7 : ffffb4b5bd3dea48 x6 : 00000000000004a9
[   20.067934] x5 : ffff000eb7d38408 x4 : 40000000fffff4a9 x3 : ffff4b58fb2b7000
[   20.075269] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000ec4fc3480
[   20.082601] Call trace:
[   20.085127]  clk_branch_toggle+0x174/0x18c (P)
[   20.089705]  clk_branch2_enable+0x1c/0x28
[   20.093829]  clk_core_enable+0x6c/0xac
[   20.097687]  clk_enable+0x2c/0x4c
[   20.101104]  clk_bulk_enable+0x4c/0xd8
[   20.104964]  msm_dp_ctrl_enable_mainlink_clocks+0x184/0x24c [msm]
[   20.111294]  msm_dp_ctrl_on_link+0xb0/0x400 [msm]
[   20.116178]  msm_dp_display_process_hpd_high+0x110/0x190 [msm]
[   20.122209]  msm_dp_hpd_plug_handle.isra.0+0xac/0x1c4 [msm]
[   20.127983]  hpd_event_thread+0x320/0x5cc [msm]
[   20.132680]  kthread+0x12c/0x204
[   20.136011]  ret_from_fork+0x10/0x20
[   20.139699] ---[ end trace 0000000000000000 ]---
[   20.144489] Failed to enable clk 'ctrl_link': -16
[   20.149340] [drm:msm_dp_ctrl_enable_mainlink_clocks [msm]] *ERROR* Unable to start link clocks. ret=-16

This series adds support for voting the clock from lemans edp phy driver.

---
This series is dependent on below series:
https://lore.kernel.org/all/20251030-phy-qcom-edp-add-missing-refclk-v5-0-fce8c76f855a@linaro.org/

Change in v3:
- Rebase to latest linux-next and latest version 5 of dependency.
- Squash both DT binding patches together. [Dmitry, Rob]
- Add dt-binding change in sorted order. [Dmitry]
- Update commit message of bindings patch to give more detail of the problem. [Bjorn]
- Update commit message of devicetree patch and add Fixes tag. [Dmitry]
- Link to v1: https://lore.kernel.org/all/20251013104806.6599-1-quic_riteshk@quicinc.com/

Change in v2:
- Rebase on top of dependent series. [Krzysztof]
- Remove duplicate patches and make changes limited to lemans.
- Link to v1: https://lore.kernel.org/all/20251009071127.26026-1-quic_riteshk@quicinc.com/

---
Ritesh Kumar (3):
  dt-bindings: phy: qcom-edp: Add missing clock for sa8775p
  dt-bindings: display/msm: qcom,sa8775p-mdss: update edp phy example
  arm64: dts: qcom: lemans: Add edp reference clock for edp phy

 .../bindings/display/msm/qcom,sa8775p-mdss.yaml      |  6 ++++--
 .../devicetree/bindings/phy/qcom,edp-phy.yaml        |  1 +
 arch/arm64/boot/dts/qcom/lemans.dtsi                 | 12 ++++++++----
 3 files changed, 13 insertions(+), 6 deletions(-)

-- 
2.17.1

