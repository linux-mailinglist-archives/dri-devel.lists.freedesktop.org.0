Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CCC678493
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 19:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5073C10E529;
	Mon, 23 Jan 2023 18:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D07C10E529;
 Mon, 23 Jan 2023 18:24:51 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30NEtQpm005519; Mon, 23 Jan 2023 18:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=kSfNNiHT00vyAOram/Y4YENiP2iFE4XTnxa6Id7L2ic=;
 b=TLFFFCBeOQNW+5rXD3zA049uNuUIs0Iwm4I7XlzA1v6l/dbV5YO0yWOACNDQmR3jLH+5
 1aXvejDjmyMdFGYcobh9nI790nyHf1A1paLcZHmbdghGRllIZVrX8DpNlfmDJ07CV2CG
 AgLTMa9gYo9bhtKzEfFtoutDQMP5j1NUiAhZyYotBYu23gWreajRGtv/7HTwy5SRUbFM
 TyYSXxJwg6qdUsEFIjlC9+4ncobwc407YyHg1x5JHGslFbY/dAr4FMVkL3fUsz+EAVVF
 WRUYf9hr5oqxjQsgIjocj3VJGHil/JiueyUjeCxq2SZTVDX4HBc++jLSYGWIXcWeK3nF Ew== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89htuhk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 18:24:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30NIOi5L012268
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 18:24:44 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 23 Jan 2023 10:24:43 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v1 00/14] add display port DSC feature
Date: Mon, 23 Jan 2023 10:24:20 -0800
Message-ID: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Rz7CgAjxnVIXZyHbYXMsk0FD0W4nsuND
X-Proofpoint-GUID: Rz7CgAjxnVIXZyHbYXMsk0FD0W4nsuND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=946 suspectscore=0 clxscore=1011 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301230177
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch add DSC related supporting functions into to both dp controller and dpu enccoder

Kuogee Hsieh (14):
  drm/msm/dp: add dpcd read of both dsc and fec capability
  drm/msm/dp: add dsc factor into calculation of supported bpp
  drm/msm/dp: add configure mainlink_levels base on lane number
  drm/msm/dp: correct configure Colorimetry Indicator Field at MISC0
  drm/msm/dp: upgrade tu calculation base on newest algorithm
  drm/msm/dp: add display compression related struct
  drm/msm/dp: add dsc helper functions
  drm/msm/dp: add dsc supporting functions to DP controller
  drm/msm/dsi: export struct msm_compression_info to dpu encoder
  drm/msm/disp/dpu: add supports of DSC encoder v1.2 engine
  drm/msm/disp/dpu1: add supports of new flush mechanism
  drm/msm/disp/dpu1: revise timing engine programming to work for DSC
  drm/msm/disp/dpu1: add dsc supporting functions to dpu encoder
  drm/msm/disp/dpu1: add sc7280 dsc block and sub block

 drivers/gpu/drm/msm/Makefile                       |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c     | 537 +++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h     |  25 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 341 +++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   7 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  43 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  50 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  74 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  43 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  21 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  23 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |  23 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     | 371 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 132 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  10 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                | 176 ++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h                |  97 ++-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 839 ++++++++++++++-------
 drivers/gpu/drm/msm/dp/dp_display.c                |  61 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |  29 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  | 749 +++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |  67 +-
 drivers/gpu/drm/msm/dp/dp_reg.h                    |  40 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |   3 +-
 drivers/gpu/drm/msm/dsi/dsi.h                      |   3 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  14 +-
 drivers/gpu/drm/msm/msm_drv.h                      | 113 ++-
 32 files changed, 3429 insertions(+), 497 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

