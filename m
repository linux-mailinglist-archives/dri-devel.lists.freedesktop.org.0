Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65605B16073
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 14:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03A010E6A4;
	Wed, 30 Jul 2025 12:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="f+FP2hJT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78A010E206;
 Wed, 30 Jul 2025 12:39:50 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbNYl028544;
 Wed, 30 Jul 2025 12:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Mawt0rfG/fwH1rT+/g0bcR/fK0FuOvLtmL8
 qqUivDBg=; b=f+FP2hJTCF2K/xKahqG23qMqaFL/wSu8RJ1KHM0TOsrbnMtL1R8
 Dk9aEH75NTjaPoDGFRByfaTDfZnltp7tf8ZT7C7IVPyb2hDKHfn2f8voKhCafkGT
 IgCjWynGlqudl+g+fWRhXesyNb23nwWNtU495xAvPz7cg19rrYLaalH/V4zrHvRk
 KLTAZEGHVUt9YjPDtKDG61MDZNhlRKQpbu/WV/1lPncm/Oi3QbN8jrLk0M7S2Zl2
 fWzgnIE5rqlGD/mbBQpabTAd8pydFJDCywYQuu2Pt/P/bzLW75BR/rZdOo/IK9ak
 87fBeU2yAT3jnr95yu7kc423/MFhvYie9LQ==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyu430f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jul 2025 12:39:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCdf5R004622; 
 Wed, 30 Jul 2025 12:39:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 48591e85a9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jul 2025 12:39:41 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56UCdfN9004614;
 Wed, 30 Jul 2025 12:39:41 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 56UCdfbj004612
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jul 2025 12:39:41 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id B8BBF58F; Wed, 30 Jul 2025 18:09:40 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
 lumag@kernel.org, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: [PATCH] drm/msm: update the high bitfield of certain DSI registers
Date: Wed, 30 Jul 2025 18:09:38 +0530
Message-Id: <20250730123938.1038640-1-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: lNgcXMyzuGU6ao3aCspHGZrkVxRAAquK
X-Proofpoint-ORIG-GUID: lNgcXMyzuGU6ao3aCspHGZrkVxRAAquK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA4OSBTYWx0ZWRfX+1NgfSanKRs1
 8txiFQVrNZmc09V8A8LqbLc3JMrOZelqtWt/w9+0/11HMl9ApJ+y+puSsFqpLgQ3FkVeVs52LRI
 INbM/wd4O5wFrtzzevSYE1INlf2doNYuk9G1M/VsEz6pFyk2kt8qEV6hnLdIhk/Q40c+gIQGPAQ
 njvoQ51lwim55bVHfv3+H7MMLfYlPacCYSeOYqd0l2QbPeBOGe1OeW1QF16QaYI1XebOw7ms0Ic
 S6GHMUU4ttkGv5L+sIFPYn+yAFLVazoiica29fyhbKGaY8WG0vHSe3EtnXRyfni7DjYSfHXzHfe
 Ktj022tC62UIhTGNhBxywmzgeSHyhd2DWdw7bSRg5P3HrPB9w00K3ufJCNe/Cr45mvFgf2QCJb/
 vAjyjTE9LGD6kOI7LtnYM3CZwMoVqHgNfl3j1mW4e7X13Z8TLfOSMFkUV3HmjGHx9zz5uopX
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=688a1292 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8 a=Kq9bw2mKO37xPRn0vu4A:9
 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=895 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1011 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300089
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

Currently, the high bitfield of certain DSI registers
do not align with the configuration of the SWI registers
description. This can lead to wrong programming these DSI
registers, for example for 4k resloution where H_TOTAL is
taking 13 bits but software is programming only 12 bits
because of the incorrect bitmask for H_TOTAL bitfeild,
this is causing DSI FIFO errors. To resolve this issue,
increase the high bitfield of the DSI registers from 12 bits
to 16 bits in dsi.xml to match the SWI register configuration.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 drivers/gpu/drm/msm/registers/display/dsi.xml | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/display/dsi.xml b/drivers/gpu/drm/msm/registers/display/dsi.xml
index 501ffc585a9f..c7a7b633d747 100644
--- a/drivers/gpu/drm/msm/registers/display/dsi.xml
+++ b/drivers/gpu/drm/msm/registers/display/dsi.xml
@@ -159,28 +159,28 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<bitfield name="RGB_SWAP" low="12" high="14" type="dsi_rgb_swap"/>
 	</reg32>
 	<reg32 offset="0x00020" name="ACTIVE_H">
-		<bitfield name="START" low="0" high="11" type="uint"/>
-		<bitfield name="END" low="16" high="27" type="uint"/>
+		<bitfield name="START" low="0" high="15" type="uint"/>
+		<bitfield name="END" low="16" high="31" type="uint"/>
 	</reg32>
 	<reg32 offset="0x00024" name="ACTIVE_V">
-		<bitfield name="START" low="0" high="11" type="uint"/>
-		<bitfield name="END" low="16" high="27" type="uint"/>
+		<bitfield name="START" low="0" high="15" type="uint"/>
+		<bitfield name="END" low="16" high="31" type="uint"/>
 	</reg32>
 	<reg32 offset="0x00028" name="TOTAL">
-		<bitfield name="H_TOTAL" low="0" high="11" type="uint"/>
-		<bitfield name="V_TOTAL" low="16" high="27" type="uint"/>
+		<bitfield name="H_TOTAL" low="0" high="15" type="uint"/>
+		<bitfield name="V_TOTAL" low="16" high="31" type="uint"/>
 	</reg32>
 	<reg32 offset="0x0002c" name="ACTIVE_HSYNC">
-		<bitfield name="START" low="0" high="11" type="uint"/>
-		<bitfield name="END" low="16" high="27" type="uint"/>
+		<bitfield name="START" low="0" high="15" type="uint"/>
+		<bitfield name="END" low="16" high="31" type="uint"/>
 	</reg32>
 	<reg32 offset="0x00030" name="ACTIVE_VSYNC_HPOS">
-		<bitfield name="START" low="0" high="11" type="uint"/>
-		<bitfield name="END" low="16" high="27" type="uint"/>
+		<bitfield name="START" low="0" high="15" type="uint"/>
+		<bitfield name="END" low="16" high="31" type="uint"/>
 	</reg32>
 	<reg32 offset="0x00034" name="ACTIVE_VSYNC_VPOS">
-		<bitfield name="START" low="0" high="11" type="uint"/>
-		<bitfield name="END" low="16" high="27" type="uint"/>
+		<bitfield name="START" low="0" high="15" type="uint"/>
+		<bitfield name="END" low="16" high="31" type="uint"/>
 	</reg32>
 
 	<reg32 offset="0x00038" name="CMD_DMA_CTRL">
@@ -209,8 +209,8 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<bitfield name="WORD_COUNT" low="16" high="31" type="uint"/>
 	</reg32>
 	<reg32 offset="0x00058" name="CMD_MDP_STREAM0_TOTAL">
-		<bitfield name="H_TOTAL" low="0" high="11" type="uint"/>
-		<bitfield name="V_TOTAL" low="16" high="27" type="uint"/>
+		<bitfield name="H_TOTAL" low="0" high="15" type="uint"/>
+		<bitfield name="V_TOTAL" low="16" high="31" type="uint"/>
 	</reg32>
 	<reg32 offset="0x0005c" name="CMD_MDP_STREAM1_CTRL">
 		<bitfield name="DATA_TYPE" low="0" high="5" type="uint"/>
-- 
2.34.1

