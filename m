Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4915835C96
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 09:30:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2A610EB2D;
	Mon, 22 Jan 2024 08:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0914110EB2D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 08:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1705912202; x=1737448202;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A6Z1p3lKL8ECmJxJR7QxwWwSIZ/W6jb5X4+kBV5gOKU=;
 b=PhTT4BPogOBWIorC4kLKe7X+kbWOLa4xSZo7jBvR8t8+WnmvIklxzN56
 bV82uPqLIR2B8OdOX0A+SMqOt+oH5fH01QxoZln3UDVbNijbP2i/blGP5
 92bbOx5WOtnNzgctVN/IAoMSkHMLPBRg/goKFhO8GK3X2onNu5eMok0Ie
 RhHrdhlhs7EuAX4MkdPRsqQLMkNNRzL+PUaAnOBwC6ZL9cm8cbwMjiLn/
 JXBbA+XB0OzGw/ii8fdXZxID6HZrtKbAk4AyacVND6qC8OqSFFrz2ANL3
 KYxW5tKWEXnRt/HdVw4P1xKxN58ymOwcfWNwvjbCjF1F8dLqGKREnrUkI Q==;
X-CSE-ConnectionGUID: IjoLBs+VScKotNOuD0Q1rQ==
X-CSE-MsgGUID: H3WbuieAQiSXKUEYhVfTTQ==
X-IronPort-AV: E=Sophos;i="6.05,211,1701154800"; d="scan'208";a="245805640"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jan 2024 01:30:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 01:29:57 -0700
Received: from che-lt-i70843lx.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 01:29:50 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
To: <manikandan.m@microchip.com>, <dharma.b@microchip.com>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] LVDS Controller Support for SAM9X7 SoC
Date: Mon, 22 Jan 2024 13:59:44 +0530
Message-ID: <20240122082947.21645-1-dharma.b@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: linux4microchip@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series introduces LVDS controller support for the SAM9X7 SoC. The
LVDS controller is designed to work with Microchip's sam9x7 series
System-on-Chip (SoC) devices, providing Low Voltage Differential Signaling
capabilities.

Dharma Balasubiramani (3):
  dt-bindings: display: bridge: add sam9x7-lvds compatible
  drm/bridge: add lvds controller support for sam9x7
  MAINTAINERS: add SAM9X7 SoC's LVDS controller

 .../display/bridge/microchip,sam9x7-lvds.yaml |  59 +++++
 MAINTAINERS                                   |   8 +
 drivers/gpu/drm/bridge/Kconfig                |   7 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/microchip-lvds.c       | 250 ++++++++++++++++++
 5 files changed, 325 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/microchip,sam9x7-lvds.yaml
 create mode 100644 drivers/gpu/drm/bridge/microchip-lvds.c

-- 
2.25.1

