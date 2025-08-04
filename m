Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C80B19A0D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 04:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73EA10E210;
	Mon,  4 Aug 2025 02:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E350410E210
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 02:08:01 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 707AE2001E6;
 Mon,  4 Aug 2025 04:08:00 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 28448200352;
 Mon,  4 Aug 2025 04:08:00 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com
 (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 5C22818000AB;
 Mon,  4 Aug 2025 10:07:57 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Subject: [PATCH v2 0/3] Add support for Waveshare DSI2DPI unit
Date: Mon, 04 Aug 2025 11:07:39 +0900
Message-Id: <20250804-waveshare-v2-0-0a1b3ce92a95@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOsVkGgC/03MSw7CIBSF4a00dyyGR9DiyH2YDihchIHQgMGah
 r2LTUwc/icn3wYFc8ACl2GDjDWUkGIPfhjAeB3vSILtDZxySc9MkpeuWLzOSKy2SqBWaqQO+n/
 J6MK6W7eptw/lmfJ7pyv7rj/l9KdURigZmZmpcDOXWlzjuhxNesDUWvsAgow9yaAAAAA=
X-Change-ID: 20250715-waveshare-dad93ea9980f
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, victor.liu@nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754273277; l=1009;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=WZG/25/2PwRokdOdDSxWnIPRrCKihV0abcBOwtEpyLs=;
 b=euJjIK7soNMUx2lCG9yR+87sYQ9cweH6+IJQhd5b8aLCVZwhI9mf3yHB78YflsBtrowQ3ioRC
 96bhFj/M3DEDfzMVbgEizqhQ00dB/CD+2xmaClo5NbHilgxiDNhrkdA
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset add support for waveshare DSI2DPI unit.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
Changes in v2:
- /s/i2c0/i2c/ in patch 1
- Add Review tags
- Link to v1: https://lore.kernel.org/r/20250716-waveshare-v1-0-81cb03fb25a3@nxp.com

---
Joseph Guo (3):
      dt-bindings: display: bridge: Add waveshare DSI2DPI unit support
      dt-bindings: display: panel: Add waveshare DPI panel support
      drm: bridge: Add waveshare DSI2DPI unit driver

 .../bindings/display/bridge/waveshare,dsi2dpi.yaml | 103 ++++++++++
 .../bindings/display/panel/panel-simple.yaml       |   4 +
 drivers/gpu/drm/bridge/Kconfig                     |  11 ++
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/waveshare-dsi.c             | 210 +++++++++++++++++++++
 5 files changed, 329 insertions(+)
---
base-commit: 0952d89c3acf6590b89bcfb8505595d7c0e6f367
change-id: 20250715-waveshare-dad93ea9980f

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>

