Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC35BBDC8DA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 06:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0F610E6E5;
	Wed, 15 Oct 2025 04:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R2y03nZu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84AB10E6D3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 04:58:52 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sFX5014793;
 Wed, 15 Oct 2025 04:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=9ZFV6zX3a5bHywMmRRXxhsw53TWtavhXVr6
 Y6Pp4f3s=; b=R2y03nZudK+ZHdic+0T/ELK688aKqWyjA4FBnxx33vc5Pz4Nndl
 Hllx21TBZj5u+E9Se38SjoNUFtd0nqkbC0vqWFWEglZCFvd6x26tApHjEfVzuJKx
 C+BF4LLXfMTPf+fmnQYsE7NpnFXM3eAH00lnZzq0PkXEam4crNczlIXG3C2SAP5q
 WNUoPo9skxdHUFSULwDwSoANMeFO4Xnt+GsqnXQaeXaivTOscfHg9qW3PwZKTOUr
 2Ms092FzBvaYz2yPOtSKYI1qowU8+61nSOCeloMa4xfzAbl944dUBAsHPOCKFj0q
 Rjlh4J5/3bP0yNygIe0bruEwKMcC/fXmAcA==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbj34e8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Oct 2025 04:58:47 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59F4wir2021449; 
 Wed, 15 Oct 2025 04:58:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 49qgambmac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Oct 2025 04:58:44 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59F4win5021431;
 Wed, 15 Oct 2025 04:58:44 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kpallavi-hyd.qualcomm.com
 [10.147.243.7])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 59F4whnK021430
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Oct 2025 04:58:44 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4720299)
 id 9A34A53B; Wed, 15 Oct 2025 10:28:42 +0530 (+0530)
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
To: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org
Cc: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>, quic_bkumar@quicinc.com, 
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: [PATCH v2 0/3] Add ADSP and CDSP support on Kaanapali SoC
Date: Wed, 15 Oct 2025 10:26:59 +0530
Message-Id: <20251015045702.3022060-1-kumari.pallavi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX3rYY+myNs7su
 h7sAwbbZ7KKLiqnUEy3yN/8+aaXTcENMV3npH2tWq5gp1/RoEXI7LL2ttJQbThGMw4hw6GXTFrY
 qo5LwqL8GjaVTEd4oCpdotk7uY2ICjXSFAQQ6V17jydVaNnjcilL6av3JkFHDw2uL/IH4are6x0
 9Ap/hVHakzbmGrLZ9ZrluhohNWGhWY2cwD3T+LtUCQQ2Kyys0n4QKl5jIzVe7KYsTRXInF/XRB4
 WBdmm1atzeNVNyLV/n7U6z6TTcngBE+fyx//+xMa/MDjsEPtvcHzqJWWhbhgbEOFSv8ELYNnK+Y
 dNF85eSVNzfIeSumTrQWiCHrQTchcg/qyrj+W8+fgoSVPguTQLrFj5gPNmWieAzx3Cd1jDNttIA
 ieII0uSi/ab6P7lTgcnGOQbCcfvfOQ==
X-Proofpoint-ORIG-GUID: gAnSCchHTj6MuwsUkrwKp4qJCaef97ot
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ef2a08 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KXkd8hKGogo_UzYOO18A:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: gAnSCchHTj6MuwsUkrwKp4qJCaef97ot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
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

Introduces support for new DSP IOVA formatting and hardware-specific
configuration required to enable ADSP and CDSP functionality on the
Kaanapali SoC.

Add support for a new IOVA formatting scheme by adding a sid_pos to the DSP
driver. Sid_pos standardizes the placement of the stream ID (SID) within the
physical address, which is required for DSPs to operate correctly on
Kaanapali. DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
both Q6 and user DMA (uDMA) access.
This is being upgraded to 34-bit PA + 4-bit SID due to a hardware revision
in CDSP for Kaanapali SoC, which expands the DMA addressable range.
To support CDSP operation, this series updates the DMA mask configuration
to reflect the expanded DMA addressable range.

Patch [v1]: https://lore.kernel.org/all/20250924-knp-fastrpc-v1-0-4b40f8bfce1d@oss.qualcomm.com/

Changes in v2:
  - Rename phys to dma_addr for clarity
  - Remove iova_format, add soc_data with sid_pos in channel ctx
  - Remove sid_pos and pa_bits from the session ctx

Kumari Pallavi (3):
  misc: fastrpc: Rename phys to dma_addr for clarity
  misc: fastrpc: Add support for new DSP IOVA formatting
  misc: fastrpc: Update dma_mask for CDSP support on Kaanapali SoC

 drivers/misc/fastrpc.c | 126 ++++++++++++++++++++++++++++-------------
 1 file changed, 88 insertions(+), 38 deletions(-)

-- 
2.34.1

