Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC57650DF22
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 13:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA15710E4EB;
	Mon, 25 Apr 2022 11:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13E510E4EB;
 Mon, 25 Apr 2022 11:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650887092; x=1682423092;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=2v5pcIcc7ZbQcIJ3HV4B8vMrv3Kkrvvxf+oOjkNr99w=;
 b=OMlZ9gJaPll1gaY/+zbLXM3sG6iijeEzorU9R9UaYZrDMZ0roqgQaDtE
 R5oxfv8/1Tbo1P1AWP0a1zoGpHDjGQutei1NFeqhJa3XrpnTm3yfCp7G0
 +NRtKnprLjn9FjvnYBefZnpJUJh2hMnjo395RMkFVSjc5q1hflT3f5FR2 g=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 25 Apr 2022 04:44:51 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 04:44:50 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 25 Apr 2022 04:44:50 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 25 Apr 2022 04:44:43 -0700
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v10 0/4] Add support for the eDP panel over aux_bus
Date: Mon, 25 Apr 2022 17:14:28 +0530
Message-ID: <1650887072-16652-1-git-send-email-quic_sbillaka@quicinc.com>
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
 drivers/gpu/drm/msm/dp/dp_catalog.c |  29 +++++++---
 drivers/gpu/drm/msm/dp/dp_catalog.h |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c | 104 +++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_display.h |   1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  21 ++++++--
 drivers/gpu/drm/msm/dp/dp_parser.c  |  23 +-------
 drivers/gpu/drm/msm/dp/dp_parser.h  |  14 ++++-
 9 files changed, 177 insertions(+), 40 deletions(-)

-- 
2.7.4

