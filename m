Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF5AB07EDD
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 22:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D21C10E657;
	Wed, 16 Jul 2025 20:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 329 seconds by postgrey-1.36 at gabe;
 Wed, 16 Jul 2025 07:14:07 UTC
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941F410E67B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 07:14:07 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DB39F2001E1;
 Wed, 16 Jul 2025 09:08:36 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9D5C9200B37;
 Wed, 16 Jul 2025 09:08:36 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com
 (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E71561800079;
 Wed, 16 Jul 2025 15:08:33 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Subject: [PATCH 0/3] Add support for Waveshare DSI2DPI unit
Date: Wed, 16 Jul 2025 16:08:28 +0900
Message-Id: <20250716-waveshare-v1-0-81cb03fb25a3@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOxPd2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc0NT3fLEstTijMSiVN2UxBRL49RES0sLgzQloPqCotS0zAqwWdGxtbU
 Aq7B8l1sAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752649713; l=854;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=OdjFV4Da49UyANDx5Zs6+ny76E7tQ6udO5ABaWWRO1c=;
 b=dFmTX6CnIiz0H4eUaP42VVOKSrAUs4SnC2eUjskbX6n4/VzZbowRDx2cRRF8thT9VCRS3Bs1Y
 lpyt2+uIa4QAcWt2Bo3Uv6kp4ErEz6+B14xgSFvjBF1ISGUf8RevTe/
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Wed, 16 Jul 2025 20:26:43 +0000
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

