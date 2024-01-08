Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72955826B3A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 10:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F7110E1EA;
	Mon,  8 Jan 2024 09:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E98E10E1C9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 09:59:48 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4086N2Fn026671; Mon, 8 Jan 2024 09:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id; s=qcppdkim1; bh=4AG70ZZD8AAH
 D2Fs+zR905tqXlX/qaQrZbUl1GaL3Zk=; b=hUTZFRtAPMxAYdiuhvI1JH4vz3Lq
 pHQ07bQqItg11TtDaCqfbprCGOZ94jS4IdqlYpQ2vaZldThWRIc4UDvC2qZFySl3
 dgzHhW166tZoiYTlgWW9sTISAzeCn6EIp1HUSdZpcY2rVkW3HyMK37gVjSPJ87wG
 jzIS9TpCi9zzMOlBq3wO/T5BcFvLAfSW+FhVkGrXFOTJ7ZTPwodcKdgci375FN4R
 +GgKakvF5fqPA1bk156a3/EvcGGbHv2vhYEOXL11uYbPOK8/Y5pNNYA+odTvssOl
 KTUrXYeheiAbP94sFmbAIMqO3OB+EAyn2afXlAT82iDLRKV2Kd9TQEAD1A==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vg8mw8qmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jan 2024 09:59:16 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 4089xDUu022553; 
 Mon, 8 Jan 2024 09:59:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3veyxkkdk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 08 Jan 2024 09:59:13 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4089xCXc022537;
 Mon, 8 Jan 2024 09:59:12 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-riteshk-hyd.qualcomm.com
 [10.147.241.247])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 4089xCSt022533;
 Mon, 08 Jan 2024 09:59:12 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2314801)
 id 37F2B5001CB; Mon,  8 Jan 2024 15:29:11 +0530 (+0530)
From: Ritesh Kumar <quic_riteshk@quicinc.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [v2 0/2] Add support for Novatek NT36672E LCD DSI panel
Date: Mon,  8 Jan 2024 15:29:00 +0530
Message-Id: <20240108095902.22725-1-quic_riteshk@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: EPA-baj-yxhNRL88lHf2TJV5ZpI0aEeD
X-Proofpoint-ORIG-GUID: EPA-baj-yxhNRL88lHf2TJV5ZpI0aEeD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=661 priorityscore=1501 malwarescore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401080084
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, quic_vproddut@quicinc.com,
 quic_abhinavk@quicinc.com, mripard@kernel.org,
 Ritesh Kumar <quic_riteshk@quicinc.com>, robh+dt@kernel.org,
 tzimmermann@suse.de, quic_rajeevny@quicinc.com, quic_jesszhan@quicinc.com,
 sam@ravnborg.org, sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the 1080x2408 Novatek NT36672E LCD DSI mode panel
found on the Qualcomm QCM6490 MTP board.

The driver will come with the uncompressed video mode support.

---
v2: Fixed review comments from Krzysztof
      - renamed to novatek,nt36672e, since the driver is for the IC and
        not the panel. Adjusted internal function names to reflect the same.
      - updated dt-bindings.
---

Ritesh Kumar (2):
  dt-bindings: display: panel: Add Novatek NT36672E LCD DSI
  drm/panel: Add support for Novatek NT36672E panel driver

 .../display/panel/novatek,nt36672e.yaml       |  66 ++
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-novatek-nt36672e.c    | 643 ++++++++++++++++++
 4 files changed, 720 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36672e.c

-- 
2.17.1

