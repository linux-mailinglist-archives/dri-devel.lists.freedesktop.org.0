Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9633C4DB73B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 18:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CA210E8E3;
	Wed, 16 Mar 2022 17:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04FA10E8E2;
 Wed, 16 Mar 2022 17:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647452185; x=1678988185;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=6OkD05aTFFl6nKh8qWXKe8mQvXhUbnZbplyfxqxmbEs=;
 b=kNzHYgFTax5c4jcFt3q6OdASfvXlFjj7ZoX385RFGj+roMk13q/uoz3+
 MXjgX8XCoRcUU/YawYHp3R1A6Sz5COupuc9cBk0069FGMeBq9cLjmhXl8
 OZPtvrQGKRxYP9i7a/vvpG2gnm8B896+KWXQoFC6yP2uVG63FPgjvXS3R E=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Mar 2022 10:36:24 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 10:36:23 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 16 Mar 2022 10:36:23 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 16 Mar 2022 10:36:16 -0700
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v5 0/9] Add support for the eDP panel on sc7280 CRD
Date: Wed, 16 Mar 2022 23:05:45 +0530
Message-ID: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dianders@chromium.org, bjorn.andersson@linaro.org, quic_vproddut@quicinc.com,
 airlied@linux.ie, sam@ravnborg.org, quic_abhinavk@quicinc.com,
 robh+dt@kernel.org, swboyd@chromium.org, agross@kernel.org,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, thierry.reding@gmail.com,
 krzk+dt@kernel.org, quic_khsieh@quicinc.com, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds support for eDP on sc7280 CRD platform.

These changes are dependent on the following series in order:
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=620127&state=*
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=616587&state=*
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=613654&state=*

Sankeerth Billakanti (9):
  arm64: dts: qcom: sc7280: rename edp_out label to mdss_edp_out
  arm64: dts: qcom: sc7280: Add support for eDP panel on CRD
  arm64: dts: qcom: sc7280: Enable backlight for eDP panel
  drm/panel-edp: add LQ140M1JW46 edp panel entry
  drm/msm/dp: Add eDP support via aux_bus
  drm/msm/dp: wait for hpd high before any sink interaction
  drm/msm/dp: Support only IRQ_HPD and REPLUG interrupts for eDP
  drm/msm/dp: Handle eDP mode_valid case
  drm/msm/dp: Support edp/dp without hpd

 arch/arm64/boot/dts/qcom/sc7280-crd.dts | 111 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi    |   2 +-
 drivers/gpu/drm/msm/dp/dp_aux.c         |   6 ++
 drivers/gpu/drm/msm/dp/dp_catalog.c     |  38 ++++++++---
 drivers/gpu/drm/msm/dp/dp_catalog.h     |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c     |  95 +++++++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_drm.c         |  10 +--
 drivers/gpu/drm/msm/dp/dp_parser.c      |  21 +-----
 drivers/gpu/drm/msm/dp/dp_parser.h      |   1 +
 drivers/gpu/drm/msm/dp/dp_reg.h         |   7 +-
 drivers/gpu/drm/panel/panel-edp.c       |   1 +
 11 files changed, 254 insertions(+), 39 deletions(-)

-- 
2.7.4

