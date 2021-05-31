Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BC9395CAC
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 15:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830C26E4DE;
	Mon, 31 May 2021 13:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9146E4D4;
 Mon, 31 May 2021 13:34:41 +0000 (UTC)
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 31 May 2021 06:34:41 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 31 May 2021 06:34:40 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg01-blr.qualcomm.com with ESMTP; 31 May 2021 19:04:06 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id EAB3321485; Mon, 31 May 2021 19:04:04 +0530 (IST)
From: Rajeev Nandan <rajeevny@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v1 0/3] drm/msm/dsi: Add display DSI support for SC7280 target
Date: Mon, 31 May 2021 19:03:52 +0530
Message-Id: <1622468035-8453-1-git-send-email-rajeevny@codeaurora.org>
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
Cc: mkrishn@codeaurora.org, jonathan@marek.ca,
 Rajeev Nandan <rajeevny@codeaurora.org>, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, robh+dt@kernel.org, kalyan_t@codeaurora.org,
 sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in this series add support for MSM display DSI CTRL & PHY drivers
for the SC7280 SoC, which has DSI controller v2.5.0 and DSI PHY v4.1.

This series also updates the missing bindings (yaml) for the 7nm DSI PHY
driver on "msm-next" branch.

Rajeev Nandan (3):
  dt-bindings: msm/dsi: Add yaml schema for 7nm DSI PHY
  drm/msm/dsi: Add PHY configuration for SC7280
  drm/msm/dsi: Add DSI support for SC7280

 .../bindings/display/msm/dsi-phy-7nm.yaml          | 68 ++++++++++++++++++++++
 drivers/gpu/drm/msm/Kconfig                        |  6 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  | 20 +++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 22 +++++++
 7 files changed, 117 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml

-- 
2.7.4

