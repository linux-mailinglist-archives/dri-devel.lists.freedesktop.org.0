Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D197E83CC7F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 20:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C8510F162;
	Thu, 25 Jan 2024 19:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E36E10ECBB;
 Thu, 25 Jan 2024 19:38:58 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40PJOIMh001884; Thu, 25 Jan 2024 19:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=qcppdkim1; bh=58wOxlJ
 bp3Kn/3g9GzCq33PP7tx3KaUvybCYMFQi0ws=; b=MY2Fm2C/tJJfQaK8fmeByrz
 1O/cjzjjXWgzLBJLqOrHiOXXGtu03NcxvC8z8lcOsnvMYocYjOVwXiwyUc5zGX5h
 FlL/GjiO45HbM6qhD0KiL2JerbLNxHW/OC0EAR114qt1A9Kfj8lViYX5UFqRm3P9
 N46IHpnR6BreGAxsFSbz9SS5PXHSSC+L87+b0pHTL2qyqV6QKgs7Ax2k+7xqKnVU
 5CbUqnEF+IOBKhLCr7GXyZZmb5h+KRQY4XGrhUM3GfWED5hZjAZKlh5tFt/AUn0v
 Tz+baBns+u88sUADt+o6AvZNQrH+gi+8U8i+BkqeAPvLQWSXK15U/OxosOrGUxA=
 =
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vuqra12ga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jan 2024 19:38:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40PJcqsg023478
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jan 2024 19:38:52 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 25 Jan 2024 11:38:52 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH 00/17] Add support for CDM over DP
Date: Thu, 25 Jan 2024 11:38:09 -0800
Message-ID: <20240125193834.7065-1-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: djni7z6NjcZS465uKvDhKEp6yYCF5pJK
X-Proofpoint-ORIG-GUID: djni7z6NjcZS465uKvDhKEp6yYCF5pJK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_12,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxlogscore=836 phishscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 malwarescore=0 mlxscore=0 impostorscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401250142
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
Cc: neil.armstrong@linaro.org, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, dmitry.baryshkov@linaro.org,
 Paloma Arellano <quic_parellan@quicinc.com>, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Chroma Down Sampling (CDM) block is a hardware component in the DPU
pipeline that includes a CSC block capable of converting RGB input from
the DPU to YUV data.

This block can be used with either HDMI, DP, or writeback interfaces.
This series adds support for the CDM block to be used with DP in
YUV420 mode format.

This series allows selection of the YUV420 format for monitors which support
certain resolutions only in YUV420 thus unblocking the validation of many
other resolutions which were previously filtered out if the connector did
not support YUV420.

This was validated using a DP connected monitor requiring the use of
YUV420 format.

This series currently works as-is. But it was also validated to function on
top of in the case of future integration:

https://patchwork.freedesktop.org/series/118831/

Kuogee Hsieh (1):
  drm/msm/dpu: add support of new peripheral flush mechanism

Paloma Arellano (16):
  drm/msm/dpu: allow dpu_encoder_helper_phys_setup_cdm to work for DP
  drm/msm/dpu: move dpu_encoder_helper_phys_setup_cdm to dpu_encoder
  drm/msm/dp: rename wide_bus_en to wide_bus_supported
  drm/msm/dp: store mode YUV420 information to be used by rest of DP
  drm/msm/dp: add an API to indicate if sink supports VSC SDP
  drm/msm/dpu: move widebus logic to its own API
  drm/msm/dpu: disallow widebus en in INTF_CONFIG2 when DP is YUV420
  drm/msm/dp: change YUV420 related programming for DP
  drm/msm/dp: move parity calculation to dp_catalog
  drm/msm/dp: modify dp_catalog_hw_revision to show major and minor val
  drm/msm/dp: add VSC SDP support for YUV420 over DP
  drm/msm/dp: enable SDP and SDE periph flush update
  drm/msm/dpu: modify encoder programming for CDM over DP
  drm/msm/dpu: allow certain formats for CDM for DP
  drm/msm/dpu: reserve CDM blocks for DP if mode is YUV420
  drm/msm/dp: allow YUV420 mode for DP connector when VSC SDP supported

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 143 ++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  12 ++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  13 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  36 +++-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 101 +---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  17 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |  10 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |   4 +-
 drivers/gpu/drm/msm/dp/dp_audio.c             | 100 ++--------
 drivers/gpu/drm/msm/dp/dp_catalog.c           | 182 +++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h           |  81 +++++++-
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |  17 +-
 drivers/gpu/drm/msm/dp/dp_display.c           |  79 +++++---
 drivers/gpu/drm/msm/dp/dp_panel.c             |  82 +++++++-
 drivers/gpu/drm/msm/dp/dp_panel.h             |   2 +
 drivers/gpu/drm/msm/dp/dp_reg.h               |   5 +
 drivers/gpu/drm/msm/msm_drv.h                 |   9 +-
 drivers/gpu/drm/msm/msm_kms.h                 |   3 +
 19 files changed, 655 insertions(+), 243 deletions(-)

-- 
2.39.2

