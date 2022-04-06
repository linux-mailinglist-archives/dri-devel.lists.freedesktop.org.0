Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1184E4F5813
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 10:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B7A10F02A;
	Wed,  6 Apr 2022 08:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B4110E32E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 08:47:46 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AB9C21A1755;
 Wed,  6 Apr 2022 10:40:10 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 60A761A1746;
 Wed,  6 Apr 2022 10:40:10 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id
 425D7183ACDE; Wed,  6 Apr 2022 16:40:08 +0800 (+08)
From: Sandor.yu@nxp.com
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com
Subject: [PATCH v1 0/5] DRM: Bridge: DW_HDMI: Add new features and bug fix
Date: Wed,  6 Apr 2022 16:48:32 +0800
Message-Id: <cover.1649230434.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: Sandor.yu@nxp.com, shengjiu.wang@nxp.com, amuel@sholland.org,
 cai.huoqing@linux.dev, maxime@cerno.tech, hverkuil-cisco@xs4all.nl
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sandor Yu <Sandor.yu@nxp.com>

It is new features and bug fix patch set for DW_HDMI DRM bridge driver
that has verified by NXP iMX865.
Three new feature added:
1. Add GP Audio interface for DW_HDMI.
2. Add CEC PM functions to restore CEC status when device suspend/resume
3. New API for reset PHY Gen1.
Two bugs fixed:
1. Enable overflow workaround for v2.13a.
2. Clear GPC_Auto bit for 24bit bpp to pass CTS.

Sandor Yu (5):
  drm: bridge: dw_hdmi: cec: Add cec suspend/resume function
  drm: bridge: dw_hdmi: enable overflow workaround for v2.13a
  drm: bridge: dw_hdmi: Enable GCP only for Deep Color
  drm: bridge: dw_hdmi: add reset function for PHY GEN1
  drm: bridge: dw_hdmi: Audio: Add General Parallel Audio (GPA) driver

 drivers/gpu/drm/bridge/synopsys/Kconfig       |  11 +
 drivers/gpu/drm/bridge/synopsys/Makefile      |   1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c |  35 +++
 .../drm/bridge/synopsys/dw-hdmi-gp-audio.c    | 199 ++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 157 +++++++++++++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h     |  13 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c        |   2 +-
 include/drm/bridge/dw_hdmi.h                  |   9 +-
 8 files changed, 416 insertions(+), 11 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c

-- 
2.25.1

