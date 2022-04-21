Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0D950A2AB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 16:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6CB10E340;
	Thu, 21 Apr 2022 14:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8D010E0CD;
 Thu, 21 Apr 2022 14:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650551829; x=1682087829;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=WFh7Wm+P6X2H9xVoBlQ5+7lPSHIuLlddRo3MV4Fb2fI=;
 b=A3h/SnXFEeHDmoiPAALayZYt3yjmgT36Pr4D/jIOqAS9rOC5UyQDRQDB
 vvZ6wrOvNeQ3cUCUqLwDotgDiijPrhoWRys9Sy3EV29KXkIFo/RErsn+a
 wiv9uwBc68T6Dt/PcT2Gv2lMzOzoalolSR5eTqJ/Je9z8ZTCdivaiSS7q Y=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 21 Apr 2022 07:37:08 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 07:37:07 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 21 Apr 2022 07:37:07 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 21 Apr 2022 07:37:01 -0700
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v8 0/4] Add support for the eDP panel over aux_bus
Date: Thu, 21 Apr 2022 20:06:47 +0530
Message-ID: <1650551811-24319-1-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
 airlied@linux.ie, quic_abhinavk@quicinc.com, steev@kali.org,
 swboyd@chromium.org, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, quic_khsieh@quicinc.com, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds support for generic eDP panel over aux_bus.

These changes are dependent on the following patches:
https://patchwork.kernel.org/project/linux-arm-msm/patch/20220211224006.1797846-5-dmitry.baryshkov@linaro.org/
https://patchwork.kernel.org/project/linux-arm-msm/patch/20220211224006.1797846-6-dmitry.baryshkov@linaro.org/

Sankeerth Billakanti (4):
  drm/msm/dp: Add eDP support via aux_bus
  drm/msm/dp: Support only IRQ_HPD and REPLUG interrupts for eDP
  drm/msm/dp: wait for hpd high before aux transaction
  drm/msm/dp: Support the eDP modes given by panel

 drivers/gpu/drm/msm/dp/dp_aux.c     |  21 +++++++-
 drivers/gpu/drm/msm/dp/dp_aux.h     |   3 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c |  31 ++++++++---
 drivers/gpu/drm/msm/dp/dp_catalog.h |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c | 101 +++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_display.h |   1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  21 ++++++--
 drivers/gpu/drm/msm/dp/dp_parser.c  |  23 +-------
 drivers/gpu/drm/msm/dp/dp_parser.h  |  13 ++++-
 9 files changed, 175 insertions(+), 40 deletions(-)

-- 
2.7.4

