Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFCC48E137
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 00:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F36210E811;
	Thu, 13 Jan 2022 23:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8B110E80D;
 Thu, 13 Jan 2022 23:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642118029; x=1673654029;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=cLZfx71HsIHMJqhxNxw2OQZF1FgZr0sHYUmOJh/12/Q=;
 b=hpv5mvNdVaMOnZNhxPu1C97NN1mxpKBtEItPRZQ5KrNnamDtVbcuVaJx
 VEyWmpUvQu0YLGmS0JfR+UqjGzlFBI5A4oi9VFteqWdO8wRsDYIjsS6Rn
 9h1j7eCasoL4zwoXHT7w2Mk6N/nlfZLXRatoLSqWsoqefosC7jJM0+bJG E=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 13 Jan 2022 15:53:49 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 15:53:48 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 13 Jan 2022 15:53:48 -0800
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 13 Jan 2022 15:53:47 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <vkoul@kernel.org>,
 <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <bjorn.andersson@linaro.org>
Subject: [PATCH v13 0/4] group dp driver related patches into one series
Date: Thu, 13 Jan 2022 15:53:35 -0800
Message-ID: <1642118019-18673-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
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
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Group below 4 dp driver related patches into one series.

Kuogee Hsieh (4):
  drm/msm/dp: do not initialize phy until plugin interrupt received
  drm/msm/dp:  populate connector of struct  dp_panel
  drm/msm/dp: add support of tps4 (training pattern 4) for HBR3
  drm/msm/dp: stop link training after link training 2 failed

 drivers/gpu/drm/msm/dp/dp_catalog.c |  12 ++---
 drivers/gpu/drm/msm/dp/dp_catalog.h |   2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 100 ++++++++++++++++--------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   8 +--
 drivers/gpu/drm/msm/dp/dp_display.c |  90 +++++++++++++++++++++-----------
 5 files changed, 116 insertions(+), 96 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

