Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4AC4BABCB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 22:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6042910E82C;
	Thu, 17 Feb 2022 21:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A85710E827;
 Thu, 17 Feb 2022 21:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645133799; x=1676669799;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yB4+2qoMQ9jzb08mZ+ScfZ64ApyU5Uo5M7VdvfRZWlY=;
 b=uGWiobsUg3cHxpWAG3FWFKrTSegiCIw6S4cCAwQ4dZCHQkV1POSBkVwz
 UYEuw4dIyfM9eP6LDtDPbhMTca348uIGWUDmNnGBPQfwe/07418u7KIOr
 9rC94g49N1L49TUI3ydYOIR9C0fQclnZNQgLO0YSR69feE/ypkdHaGCjw g=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 17 Feb 2022 13:36:38 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 13:36:38 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 17 Feb 2022 13:36:37 -0800
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 17 Feb 2022 13:36:37 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <vkoul@kernel.org>,
 <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <bjorn.andersson@linaro.org>
Subject: [PATCH v8 0/2] drm/msm/dpu: enable widebus feature base on chip
 hardware revision
Date: Thu, 17 Feb 2022 13:36:24 -0800
Message-ID: <1645133788-5057-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

revise widebus timing engine programming and enable widebus feature base on chip

Kuogee Hsieh (4):
  drm/msm/dpu: adjust display_v_end for eDP and DP
  drm/msm/dpu: replace BIT(x) with correspond marco define string
  drm/msm/dpu:  revise timing engine programming to support widebus
    feature
  drm/msm/dp: enable widebus feature for display port

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 14 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  2 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 14 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 63 ++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  2 +
 drivers/gpu/drm/msm/dp/dp_catalog.c                | 34 +++++++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h                |  3 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 13 +++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c                | 30 +++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h                |  2 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  4 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |  2 +-
 drivers/gpu/drm/msm/msm_drv.h                      |  6 +++
 14 files changed, 164 insertions(+), 26 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

