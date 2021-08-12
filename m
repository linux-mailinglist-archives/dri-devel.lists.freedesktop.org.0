Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 534B53E9B85
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 02:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8EE26E202;
	Thu, 12 Aug 2021 00:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 364 seconds by postgrey-1.36 at gabe;
 Thu, 12 Aug 2021 00:14:54 UTC
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9106E202;
 Thu, 12 Aug 2021 00:14:54 +0000 (UTC)
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 11 Aug 2021 17:08:49 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 11 Aug 2021 17:08:46 -0700
X-QCInternal: smtphost
Received: from sbillaka-linux.qualcomm.com ([10.204.66.13])
 by ironmsg01-blr.qualcomm.com with ESMTP; 12 Aug 2021 05:38:20 +0530
Received: by sbillaka-linux.qualcomm.com (Postfix, from userid 2305739)
 id D1693220EC; Thu, 12 Aug 2021 05:38:18 +0530 (IST)
From: Sankeerth Billakanti <sbillaka@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Sankeerth Billakanti <sbillaka@codeaurora.org>, robdclark@gmail.com,
 seanpaul@chromium.org, swboyd@chromium.org, kalyan_t@codeaurora.org,
 abhinavk@codeaurora.org, dianders@chromium.org, khsieh@codeaurora.org,
 mkrishn@codeaurora.org
Subject: [PATCH v1 0/2] Add support for eDP on SC7280
Date: Thu, 12 Aug 2021 05:38:00 +0530
Message-Id: <1628726882-27841-1-git-send-email-sbillaka@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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
additional features such as backlight control, PSR etc. which will be
enabled in subsequent patch series.

	This is based on Bjorn's changes in the below mentioned series
to support both eDP and DP programming through the same driver:
v1 of https://patchwork.freedesktop.org/series/92860/
v1 of https://patchwork.freedesktop.org/series/92992/

Summary of changes:
Add support for eDP on SC7280 platform.
Add the new compatible string to documentation.


Sankeerth Billakanti (2):
  drm/msm/dp: Add support for SC7280 eDP
  dt-bindings: Add SC7280 compatible string

 .../bindings/display/msm/dp-controller.yaml        |  3 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  4 +--
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 19 +++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.c                | 32 ++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_parser.c                 | 31 +++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_parser.h                 |  5 ++++
 6 files changed, 90 insertions(+), 4 deletions(-)

-- 
The Qualcomm Innovatin Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

