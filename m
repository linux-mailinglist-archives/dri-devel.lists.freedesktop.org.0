Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3DF3B04EE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 14:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444E16E4D7;
	Tue, 22 Jun 2021 12:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A696E4D7;
 Tue, 22 Jun 2021 12:43:09 +0000 (UTC)
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 22 Jun 2021 05:43:09 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 22 Jun 2021 05:43:07 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg01-blr.qualcomm.com with ESMTP; 22 Jun 2021 18:12:35 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id 5AD7F20FA1; Tue, 22 Jun 2021 18:12:34 +0530 (IST)
From: Rajeev Nandan <rajeevny@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v2 0/3] drm/msm/dsi: Add display DSI support for SC7280 target
Date: Tue, 22 Jun 2021 18:12:25 +0530
Message-Id: <1624365748-24224-1-git-send-email-rajeevny@codeaurora.org>
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
Cc: jonathan@marek.ca, Rajeev Nandan <rajeevny@codeaurora.org>,
 mkrishn@codeaurora.org, linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 robdclark@gmail.com, robh+dt@kernel.org, kalyan_t@codeaurora.org,
 dmitry.baryshkov@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in this series add support for MSM display DSI CTRL & PHY drivers
for the SC7280 SoC, which has DSI controller v2.5.0 and DSI PHY v4.1.

Changes in v2:
- Dropped patch #1 (dt-bindings: msm/dsi: Add yaml schema for 7nm DSI PHY) and
  reused Jonathan's patch [1] (dt-bindings: msm: dsi: add missing 7nm bindings)
- Added new patch (dt-bindings: msm/dsi: Add sc7280 7nm dsi phy)
  Now using <vendor>,<soc>-<block> format for "compatible" property (Rob)
- Fixed clang warning for max_pll_rate as per [2] (Dmitry Baryshkov)
- Fixed num_dsi_phy and io_start (Dmitry Baryshkov)

[1] https://lore.kernel.org/linux-arm-msm/20210617144349.28448-2-jonathan@marek.ca/
[2] https://lore.kernel.org/linux-arm-msm/20210514213032.575161-1-arnd@kernel.org/

Rajeev Nandan (3):
  dt-bindings: msm/dsi: Add sc7280 7nm dsi phy
  drm/msm/dsi: Add PHY configuration for SC7280
  drm/msm/dsi: Add DSI support for SC7280

 .../bindings/display/msm/dsi-phy-7nm.yaml          |  1 +
 drivers/gpu/drm/msm/Kconfig                        |  6 ++---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  | 20 +++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 26 ++++++++++++++++++++++
 7 files changed, 54 insertions(+), 3 deletions(-)

-- 
2.7.4

