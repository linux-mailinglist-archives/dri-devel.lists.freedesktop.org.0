Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A53C673BAE
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 15:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F3B10E952;
	Thu, 19 Jan 2023 14:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6030C10E952;
 Thu, 19 Jan 2023 14:26:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30JBG1wK004497; Thu, 19 Jan 2023 14:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=4Pn59qtyMyi+QgSrqA0HVtuffjJmhvxU2SjjmhNp3kc=;
 b=dAjbDX3qCdwpHcKJ1CNKtyz4wmt2LT8zumCXmE6bOaUslU2STLRN5Uy0INHo1t0jYhLC
 rmmKcb3r8dLbWpqLlK+r3TbXn7hBjk0PocRzjAIQOnZYmG8AXktBkYVJ9wdb12pM2PeP
 G+C/j6SpbhScOgEKudlgOsu/G3Luj7b9rzkstQATEtpk6r/Z3pLE2SEdyh4RtzThQSFA
 qNNiUR924q3bvBE0c78G6ooEF9jSyCLYlXVHvnSTNg0q6WVJXt+3xSp92DWAZ4Nu/REx
 3Ge0Rki4pEOS9Sj0oqrgtDDr09A8T+2BZYKn2goVAqvueZv6u2wqDxG+H4wV0veUcqzW Mw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n6vg01mb2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 14:26:49 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30JEQm5Z014784
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 14:26:48 GMT
Received: from vpolimer-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 19 Jan 2023 06:26:43 -0800
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: [PATCH Resend v11 00/15] Add PSR support for eDP 
Date: Thu, 19 Jan 2023 19:56:18 +0530
Message-ID: <1674138393-475-1-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: _CPPNIasIQOiGyU80UAeeyfysH110h2o
X-Proofpoint-GUID: _CPPNIasIQOiGyU80UAeeyfysH110h2o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_09,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190115
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
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org, swboyd@chromium.org,
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

Changes in v8:
  - Drop the enc spinlock as it won't serve any purpose in
protetcing conn state.(Dmitry/Doug)

Changes in v9:
  - Update commit message and fix alignment using spaces.(Marijn)
  - Misc changes.(Marijn)

Changes in v10:
  - Get crtc cached in dpu_enc during obj init.(Dmitry)

Changes in v11:
  - Remove crtc cached in dpu_enc during obj init.
  - Update dpu_enc crtc state on crtc enable/disable during self refresh.

Sankeerth Billakanti (1):
  drm/msm/dp: disable self_refresh_aware after entering psr

Vinod Polimera (14):
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
  drm/msm/disp/dpu: update dpu_enc crtc state on crtc enable/disable
    during self refresh

 drivers/gpu/drm/bridge/panel.c                     |  68 ++++++-
 drivers/gpu/drm/drm_atomic.c                       |  60 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  42 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  29 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  22 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                |  80 +++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h                |   4 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  80 +++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   3 +
 drivers/gpu/drm/msm/dp/dp_display.c                |  36 ++--
 drivers/gpu/drm/msm/dp/dp_display.h                |   2 +
 drivers/gpu/drm/msm/dp/dp_drm.c                    | 196 ++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |   9 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |  36 ++++
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  22 +++
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   6 +
 drivers/gpu/drm/msm/dp/dp_reg.h                    |  27 +++
 include/drm/drm_atomic.h                           |   7 +
 22 files changed, 710 insertions(+), 44 deletions(-)

-- 
2.7.4

