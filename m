Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BEF81CD99
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CECA10E824;
	Fri, 22 Dec 2023 17:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3922810E77E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 11:07:45 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BM6Rkjn000823; Fri, 22 Dec 2023 11:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id; s=qcppdkim1; bh=ejON4iISCSAb
 znAe21xsdUh3J2erjwuSH/A9ZBIeRyo=; b=UcE3rBKY44pEGRkZIh4A0z9rD7Gy
 jBWJlu4A1BF4b7+w+//+ujzv0+J2F/Dvo9ZqmSl/RMywzqqsWlc4wtJwANjOAykb
 9z4D4QBfH/inLXJemwL4KcLSXrHbxD32wwNbYHNYswGxjFU8iSgEZIdpL+MWMS/Z
 kVBflNprVEtTmtVZ9fEwYi6mh++SyqWpvrxQCFxbEKJgQJJMTB9VopT4uGDygetY
 dN3MaYecsSc9cCKLtG9Dt4I0PtpWlfZnJxiuCyPZ95/n0r9GHbdgpoUVDkQIfoXs
 krja8c5QKp5EmL7GYhjM7l23SKb2Bz1JhFGAgFn8NM1MKTtJRktFtUkSRg==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v4tuea2me-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Dec 2023 11:07:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3BMB7G4w019207; 
 Fri, 22 Dec 2023 11:07:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3v14ymvpv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 22 Dec 2023 11:07:16 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BMB7F66019200;
 Fri, 22 Dec 2023 11:07:15 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-riteshk-hyd.qualcomm.com
 [10.147.241.247])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3BMB7FDP019184;
 Fri, 22 Dec 2023 11:07:15 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2314801)
 id 0F4305299C9; Fri, 22 Dec 2023 16:37:14 +0530 (+0530)
From: Ritesh Kumar <quic_riteshk@quicinc.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [v1 0/2] Add support for Truly NT36672E LCD DSI panel
Date: Fri, 22 Dec 2023 16:37:08 +0530
Message-Id: <20231222110710.19397-1-quic_riteshk@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: BpfwZ02QDYKgugkHxRud_um63yPyUbVU
X-Proofpoint-ORIG-GUID: BpfwZ02QDYKgugkHxRud_um63yPyUbVU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 impostorscore=0
 phishscore=0 mlxlogscore=614 priorityscore=1501 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312220079
X-Mailman-Approved-At: Fri, 22 Dec 2023 17:32:28 +0000
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
 airlied@gmail.com, quic_abhinavk@quicinc.com, mripard@kernel.org,
 Ritesh Kumar <quic_riteshk@quicinc.com>, robh+dt@kernel.org,
 tzimmermann@suse.de, quic_rajeevny@quicinc.com, quic_jesszhan@quicinc.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the 1080x2408 Truly NT36672E LCD DSI mode panel
found on the Qualcomm QCM6490 MTP board.

The driver will come with the uncompressed video mode support.

Ritesh Kumar (2):
  dt-bindings: display: panel: Add Truly NT36672E LCD DSI panel
  drm/panel: Add support for Truly NT36672E panel driver

 .../display/panel/truly,nt36672e.yaml         |  66 ++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-truly-nt36672e.c  | 644 ++++++++++++++++++
 4 files changed, 720 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/truly,nt36672e.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-truly-nt36672e.c

-- 
2.17.1

