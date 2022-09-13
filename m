Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 053195B7285
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 16:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77A110E75E;
	Tue, 13 Sep 2022 14:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8298B10E738;
 Tue, 13 Sep 2022 14:56:34 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28DDvKGP028124;
 Tue, 13 Sep 2022 14:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc : subject : date : message-id; s=qcppdkim1;
 bh=IhQxSkNHd54avUK03Wzk0FsSOIPsdS0Ujr8xcCfN9L0=;
 b=VskLZ7ApVZj83GjOvWBSJYviiSow6lRCP/N45RhmRZIWP58fRBdC9JXvc4kmjBeofoVU
 2KHBZZUuqI6LdXhK3VY8NShxP4U2ZY1pqj6rc0Jt4gy9AWmbp9b7BlYNueK8gLkJsgWQ
 jQPd9hthYlWcF66msK2j22Yf3NZRP1dqjsxCKBQprdM6IcIc6mjtlt9hDSe/etNnoEy1
 1C6oscbaLodlmS7Tbo0wS4Ndwipq33tiefeIsl6QBA35v3wXj9cG3iFamzJjQ2JmVGPp
 VQ61mOP68/UL5kx1OQ+WzDUsvVkmGs2L6UoS5XTrq2RDsL+HFr86m8/2aMFysNQhHJxW KA== 
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jjhu3tf8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Sep 2022 14:56:28 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28DEpNQ8017819; 
 Tue, 13 Sep 2022 14:51:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3jh46m5dqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 13 Sep 2022 14:51:23 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28DEpMa4017814;
 Tue, 13 Sep 2022 14:51:22 GMT
Received: from vpolimer-linux.qualcomm.com (vpolimer-linux.qualcomm.com
 [10.204.67.235])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 28DEpM6Y017813;
 Tue, 13 Sep 2022 14:51:22 +0000
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id C1555401B; Tue, 13 Sep 2022 20:21:21 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v7 00/15] Add PSR support for eDP
Date: Tue, 13 Sep 2022 20:21:01 +0530
Message-Id: <1663080676-12936-1-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Y5avGkz-Ws6psTmM6eyhXdN_W-uGs5Qf
X-Proofpoint-GUID: Y5avGkz-Ws6psTmM6eyhXdN_W-uGs5Qf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_07,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1011
 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130068
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, quic_khsieh@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in v2:
  - Use dp bridge to set psr entry/exit instead of dpu_enocder.
  - Don't modify whitespaces.
  - Set self refresh aware from atomic_check.
  - Set self refresh aware only if psr is supported.
  - Provide a stub for msm_dp_display_set_psr.
  - Move dp functions to bridge code.

Changes in v3:
  - Change callback names to reflect atomic interfaces.
  - Move bridge callback change to separate patch as suggested by Dmitry.
  - Remove psr function declaration from msm_drv.h.
  - Set self_refresh_aware flag only if psr is supported.
  - Modify the variable names to simpler form.
  - Define bit fields for PSR settings.
  - Add comments explaining the steps to enter/exit psr.
  - Change DRM_INFO to drm_dbg_db. 

Changes in v4:
  - Move the get crtc functions to drm_atomic.
  - Add atomic functions for DP bridge too.
  - Add ternary operator to choose eDP or DP ops.
  - Return true/false instead of 1/0.
  - mode_valid missing in the eDP bridge ops.
  - Move the functions to get crtc into drm_atomic.c.
  - Fix compilation issues.
  - Remove dpu_assign_crtc and get crtc from drm_enc instead of dpu_enc.
  - Check for crtc state enable while reserving resources.

Changes in v5:
  - Move the mode_valid changes into a different patch.
  - Complete psr_op_comp only when isr is set.
  - Move the DP atomic callback changes to a different patch.
  - Get crtc from drm connector state crtc.
  - Move to separate patch for check for crtc state enable while
reserving resources.

Changes in v6:
  - Remove crtc from dpu_encoder_virt struct.
  - fix crtc check during vblank toggle crtc.
  - Misc changes. 

Changes in v7:
  - Add fix for underrun issue on kasan build.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Sankeerth Billakanti (1):
  drm/msm/dp: disable self_refresh_aware after entering psr

Vinod Polimera (14):
  drm/msm/disp/dpu: clear dpu_assign_crtc and get crtc from connector
    state instead of dpu_enc
  drm: add helper functions to retrieve old and new crtc
  drm/msm/dp: use atomic callbacks for DP bridge ops
  drm/msm/dp: Add basic PSR support for eDP
  drm/msm/dp: use the eDP bridge ops to validate eDP modes
  drm/bridge: use atomic enable/disable callbacks for panel bridge
  drm/bridge: add psr support for panel bridge callbacks
  drm/msm/disp/dpu: use atomic enable/disable callbacks for encoder
    functions
  drm/msm/disp/dpu: check for crtc enable rather than crtc active to
    release shared resources
  drm/msm/disp/dpu: add PSR support for eDP interface in dpu driver
  drm/msm/disp/dpu: get timing engine status from intf status register
  drm/msm/disp/dpu: wait for extra vsync till timing engine status is
    disabled
  drm/msm/disp/dpu: reset the datapath after timing engine disable
  drm/msm/disp/dpu: clear active interface in the datapath cleanup

 drivers/gpu/drm/bridge/panel.c                     |  68 ++++++-
 drivers/gpu/drm/drm_atomic.c                       |  60 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  64 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |   8 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  22 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                |  80 ++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h                |   4 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  80 ++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   3 +
 drivers/gpu/drm/msm/dp/dp_display.c                |  36 ++--
 drivers/gpu/drm/msm/dp/dp_display.h                |   2 +
 drivers/gpu/drm/msm/dp/dp_drm.c                    | 207 ++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |   9 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |  36 ++++
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  22 +++
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   6 +
 drivers/gpu/drm/msm/dp/dp_reg.h                    |  27 +++
 include/drm/drm_atomic.h                           |   7 +
 23 files changed, 706 insertions(+), 77 deletions(-)

-- 
2.7.4

