Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 074A174FC96
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 03:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6993210E472;
	Wed, 12 Jul 2023 01:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B40810E472;
 Wed, 12 Jul 2023 01:20:22 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36C1AH9P011032; Wed, 12 Jul 2023 01:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=6eDpvhzzll7f7bumZRQm0WNRYOKbjNYFAHbQgCbxV+w=;
 b=SDP3JiwUjCB1TmiVKwWv2JS1QyKCnopp1eAMKdwC/xiz2otXheNpvD3o5h4JWchS72GA
 9Xvl4Hakeb8W0+dRUzEhktYBCw+p+eqFNicu2ZujtWSuLC3887znYvqsAs+lkbroYZ2v
 rP3fweU5JMuy5nah2eonv0OQmb+mdVOpRxFNVjdudJAWNCRrmjtExrrco5vrvQOHs6ut
 iirhkz12CaTFEEBDa/gkdD8YzXIc35qdXlTvpkWSceFMc4jBbWAg4w0nzXdf+i7GjyH5
 opaWkzekONGxMup72BG6pzM9Y06XkSJmY51g4Vy4ANrAKycuyBpPnosJaPlX4nqn0vJy qA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rseqprb1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 01:20:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36C1KDka003015
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 01:20:13 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 11 Jul 2023 18:20:13 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v5 0/5] drm/msm/dpu: Re-introduce dpu core revision
Date: Tue, 11 Jul 2023 18:19:58 -0700
Message-ID: <20230712012003.2212-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: NQ8HYPEOdsf96BlhAYr7vMmRSo-XkYsi
X-Proofpoint-ORIG-GUID: NQ8HYPEOdsf96BlhAYr7vMmRSo-XkYsi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_14,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307120008
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
Cc: quic_jesszhan@quicinc.com, andersson@kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With commit dac76a0144d31 ("fetch DPU configuration from match data"),
dpu core revision was dropped in favor of using the compatible string
from the device tree to select the dpu catalog being used in the device.

This approach works well however also necessitates adding catalog
entries for small register level details as dpu capabilities and/or
features bloating the catalog unnecessarily. Examples include but
are not limited to data_compress, interrupt register set, widebus etc.

Introduce the dpu core revision back as an entry to the catalog so that
we can just use dpu revision checks for setting register bits based
on the dpu's core revision rather than catalog feature bits.

changes in v5:
        - rename the structs in dpu_hw_intf to have the dpu_hw prefix
        - remove a couple of comments

Abhinav Kumar (5):
  drm/msm/dpu: re-introduce dpu core revision to the catalog
  drm/msm/dpu: use dpu core's major version to enable data compress
  drm/msm/dpu: rename all hw_intf structs to have dpu_hw prefix
  drm/msm/dpu: rename enable_compression() to program_intf_cmd_cfg()
  drm/msm/dpu: drop DPU_INTF_DATA_COMPRESS from dpu catalog

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  6 +++++
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  6 +++++
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  6 +++++
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  6 +++++
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |  6 +++++
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  6 +++++
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  6 +++++
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  6 +++++
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  6 +++++
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  6 +++++
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  6 +++++
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  6 +++++
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  6 +++++
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  6 +++++
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  6 +++++
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  6 +++++
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  8 +++++--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 18 +++++++-------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 19 +++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 22 +++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   | 24 ++++++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  2 +-
 23 files changed, 155 insertions(+), 36 deletions(-)

-- 
2.40.1

