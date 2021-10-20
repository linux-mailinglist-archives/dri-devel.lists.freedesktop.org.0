Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB420435BA6
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A476EB90;
	Thu, 21 Oct 2021 07:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 363 seconds by postgrey-1.36 at gabe;
 Wed, 20 Oct 2021 12:20:43 UTC
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68D16E284;
 Wed, 20 Oct 2021 12:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1634732444; x=1666268444;
 h=from:to:cc:subject:date:message-id;
 bh=xee9a9OQlfjI1byPU2DSnr6ScUFGZ5MBgkmQyIdABuM=;
 b=CFLY6O3DnCmZiRojV7gYDr7ZdAq+4pwoy+jVeLuds/rD3637oF5rx9dv
 UmKWBpU7EJAWu/ch2YB77BYE7zqGpDpTnvVcVw5khxwz/a/JENlNhUtWV
 6yr+UaT4tLl47Ck5oL4fzopJrv8mECQoEm6kmWaj8lSyzjNv4NLMxQYH2 M=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 20 Oct 2021 05:14:39 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 20 Oct 2021 05:14:38 -0700
X-QCInternal: smtphost
Received: from sbillaka-linux.qualcomm.com ([10.204.66.13])
 by ironmsg01-blr.qualcomm.com with ESMTP; 20 Oct 2021 17:44:21 +0530
Received: by sbillaka-linux.qualcomm.com (Postfix, from userid 2305739)
 id 6D8B520E28; Wed, 20 Oct 2021 17:44:20 +0530 (IST)
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>, robdclark@gmail.com,
 seanpaul@chromium.org, swboyd@chromium.org, kalyan_t@codeaurora.org,
 abhinavk@codeaurora.org, dianders@chromium.org, khsieh@codeaurora.org,
 mkrishn@codeaurora.org, sbillaka@codeaurora.org
Subject: [PATCH v2 0/2] Add support for eDP on SC7280
Date: Wed, 20 Oct 2021 17:44:09 +0530
Message-Id: <1634732051-31282-1-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Thu, 21 Oct 2021 07:25:31 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series will add eDP controller support for Qualcomm SC7280
platform. These patches are baseline changes with which we can enable
eDP display on sc7280. The sc7280 eDP controller can also support
additional features such as which will be enabled in subsequent patch series.

	This is based on Bjorn's changes in the below mentioned series
to support both eDP and DP programming through the same driver:
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=564841

Summary of changes:

Changes in V2:
- Remove gpio programming from DP driver
- Implemented code review comments

Changes in V1:
- Add support for eDP on SC7280 platform.
- Add the new compatible string to documentation.

Sankeerth Billakanti (2):
  drm/msm/dp: Add support for SC7280 eDP
  dt-bindings: Add SC7280 compatible string

 .../bindings/display/msm/dp-controller.yaml          |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       |  4 ++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c                     | 20 ++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_display.c                  | 10 +++++++++-
 4 files changed, 30 insertions(+), 5 deletions(-)

-- 
The Qualcomm Innovatin Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

