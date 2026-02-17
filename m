Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHRqFFQelGk1AAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 08:52:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD8A1495C3
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 08:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01F210E454;
	Tue, 17 Feb 2026 07:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGCRCNGk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBEF10E452;
 Tue, 17 Feb 2026 07:14:49 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61H3RlxS2178782; Tue, 17 Feb 2026 07:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=68dSNlIqSuNSwsdT3P/zsSiAKuuLihUwYct
 ME7b8hno=; b=EGCRCNGk4kMvU715/FN7pPcw2v5MWessjAXgKiz8SJWGnYXzOxm
 db6Eftdfm7r4myPp568ACQfgZTBnB3lbCTP+X9Ms5SSE4v9eSc/RZkdkWZQkokmD
 /XDjwxFtZz6di4Nv1jHz22JZDQYTUvUZoo8ofX3Hg22iNAgGKZ10nz31GGV6csea
 vFGKfO/oq0fw9BblRDTgVZ2L9YlK80QQ3ylvBtxSOxrKHYpZMBh+YdhISdrieqxV
 zBZugSk3MtLxPh1CuVY4Yn7rpXDtezjCKZS402soOw2eJWwTdcYPN7C/xvSjdPHe
 QYaF1PWyQTmp4XlifQ4tVXB3VvfgVnjs9FA==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbnv9kkrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Feb 2026 07:14:32 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61H7ETlh005748; 
 Tue, 17 Feb 2026 07:14:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4caj4m5s77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Feb 2026 07:14:29 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61H7ES1a005740;
 Tue, 17 Feb 2026 07:14:28 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mkuntuma-hyd.qualcomm.com
 [10.213.97.145])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 61H7ESbA005738
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Feb 2026 07:14:28 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4582077)
 id 965795D5; Tue, 17 Feb 2026 12:44:27 +0530 (+0530)
From: Mani Chandana Ballary Kuntumalla <mkuntuma@qti.qualcomm.com>
To: dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
 swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
 sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
 alex.vinarskis@gmail.com
Cc: Mani Chandana Ballary Kuntumalla <mkuntuma@qti.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_riteshk@quicinc.com
Subject: [PATCH v3 0/2] Enable mdss1 Display Port for Qualcomm lemans-ride
 platform
Date: Tue, 17 Feb 2026 12:44:18 +0530
Message-Id: <20260217071420.2240380-1-mkuntuma@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: LY6NhJ9EQlMByd5kbJln890jx30DJgsb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA1OCBTYWx0ZWRfX9XjIwUxzhzK/
 Aw4uXGa0g5U6hfh88p9167ZYphZBzZow4dOSrT+S/wFkYKhIM2saV9Njlha043+62nlqS8TU+rn
 3xWtV4gTL9VtTxuMnRvJ/g4+h929ukn1ZRvJ9kyOg06G3OWFhE/C5DywZmBQ+a2GmodAR426LbR
 GBjD7k8p8mmDrtKU/3QRgin/5Zbi5m3ie5Ed/t0uv0IAIHThvxV31UKta7qWbFdwjKxk6izBh0A
 y0OB27Fa1E89chJMbhcx2JxX+XDgkPMJCprFs3ImpBmMmgmfgW5GxAXgSa9dquCdiLvzzVNF0Gd
 QrMWuw40/GYR1Lz9B5+QYqHraPJjLQ+0B4zpOrEfDJTAYuxfPOMG1jU3X23krsboCX5p0yL1mHF
 ffqtw4cQVn3BxeQBxbF6TVO0DdOgHZ2hBAuOSBSYJVv+IfYON1eTWtN4PS0GpoiapJbxZiCrLXe
 HOUDnrKi1AYDQjVYgAg==
X-Authority-Analysis: v=2.4 cv=b7K/I9Gx c=1 sm=1 tr=0 ts=69941558 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=0IT7fpZdUoEMrN4OoH4A:9 a=TjNXssC_j7lpFel5tvFf:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: LY6NhJ9EQlMByd5kbJln890jx30DJgsb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170058
X-Mailman-Approved-At: Tue, 17 Feb 2026 07:52:42 +0000
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
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,somainline.org,chromium.org,kernel.org,linaro.org,linux.dev,poorly.run,gmail.com,ffwll.ch];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkuntuma@qti.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: BAD8A1495C3
X-Rspamd-Action: no action

This series adds the DPTX0 and DPTX1 nodes, as a part of mdss1
on Qualcomm lemans SoC. It also enables Display Port on Qualcomm
lemans-ride platform.

---
This series is dependent on below series:
https://lore.kernel.org/all/20260128114853.2543416-1-quic_riteshk@quicinc.com/

Change in v3:
- Patchset v2 [1/3] got merged
  https://gitlab.freedesktop.org/lumag/msm/-/commit/1338e8ae4084
- Rebased on top of linux-next and picked the latest patch from the dependent series.
- Removed additional instance of opp table [Dmitry]
- Link to v2: https://lore.kernel.org/all/20251125105622.1755651-1-quic_mkuntuma@quicinc.com/

Change in v2:
- Added fixes tag for the DP driver patch [Dmitry]
- Included below patch in this series after addressing comments [Dmitry and Konrad]
  https://lore.kernel.org/all/20250925-lemans_dual-v1-1-9c371803198d@oss.qualcomm.com/
	- Removed the misleading comment: "same path used twice" [Konrad]
	- Removed unused label in 'display-controller' [Dmitry]
- Removed extra zeroes in dispcc1 node [Konrad]
- Enbaled dispcc1 by default in main dtsi file [Dmitry]
- Added EDP ref clock and updated dependency series.
- Link to v1: https://lore.kernel.org/all/20250926085956.2346179-1-quic_mkuntuma@quicinc.com/

---
Mani Chandana Ballary Kuntumalla (2):
  arm64: dts: qcom: lemans: add mdss1 display device nodes
  arm64: dts: qcom: lemans-ride: Enable mdss1 display Port

 .../boot/dts/qcom/lemans-ride-common.dtsi     |  80 +++++
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 315 +++++++++++++++++-
 2 files changed, 393 insertions(+), 2 deletions(-)

-- 
2.34.1

