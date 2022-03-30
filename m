Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8DA4EC90D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 18:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B11B10E4B9;
	Wed, 30 Mar 2022 16:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A5A10E3EC;
 Wed, 30 Mar 2022 16:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648656202; x=1680192202;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=a5vYtPQQN52jG3RKmFp6BjZbLeVvmnj0PyCiaeGjnLQ=;
 b=A4/gRRpQaUtdOcvS9nTM9ClwpT7mm9UQB3go9PQOd8FNP3PoUZOiliR4
 2NmsZ/S19Ok0YLPY3P28xg9n70lgxG04x2w1I5RuTekS7SLRKRUAHEz36
 Zj82wrxTETy1oP4tgyQejdN4XoenGZ50GEQzDeclmeqSudeQj2NhT23WN s=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 30 Mar 2022 09:03:21 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 09:03:20 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 30 Mar 2022 09:03:19 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 30 Mar 2022 09:03:13 -0700
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v6 0/8] Add support for the eDP panel over aux_bus
Date: Wed, 30 Mar 2022 21:32:51 +0530
Message-ID: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
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
 airlied@linux.ie, quic_abhinavk@quicinc.com, swboyd@chromium.org,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, quic_aravindh@quicinc.com,
 quic_khsieh@quicinc.com, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds support for generic eDP panel over aux_bus.

These changes are dependent on the following series in order:
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=620127&state=*
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=616587&state=*
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=613654&state=*


Sankeerth Billakanti (8):
  drm/msm/dp: Add eDP support via aux_bus
  drm/msm/dp: wait for hpd high before aux transaction
  drm/msm/dp: Support only IRQ_HPD and REPLUG interrupts for eDP
  drm/msm/dp: avoid handling masked interrupts
  drm/msm/dp: prevent multiple votes for dp resources
  drm/msm/dp: remove unnecessary delay during boot
  drm/msm/dp: Support edp/dp without hpd
  drm/msm/dp: Handle eDP mode_valid differently from dp

 drivers/gpu/drm/msm/dp/dp_aux.c     | 13 ++++-
 drivers/gpu/drm/msm/dp/dp_aux.h     |  3 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c | 35 ++++++++++---
 drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c | 99 ++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_drm.c     | 10 ++--
 drivers/gpu/drm/msm/dp/dp_parser.c  | 21 +-------
 drivers/gpu/drm/msm/dp/dp_parser.h  |  1 +
 8 files changed, 143 insertions(+), 40 deletions(-)

-- 
2.7.4

