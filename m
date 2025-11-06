Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBECC38CA7
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 03:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760E310E058;
	Thu,  6 Nov 2025 02:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="Jz/mSUG8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B7810E058
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 02:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1762394802;
 bh=VVl1Qjus8u0aUj8+6Bj8jBGW/g0TFXzsB/9E8b+TxZM=;
 h=From:To:Subject:Date:Message-Id;
 b=Jz/mSUG81JzjgYqtmrsoGxedEs9qCq/TV7Sc5FRXH49aYam1s9LeQZBgIZnnOflhh
 qPseJK8+qg1raZmWNV14RTkp5WXetzfinEneBxA7fTGOmK/nbrehIaVYAcDeSaWF5p
 PibFmGR/Ox+jwiA71qcpDSQ6Gjemx2ntXzwcJ+Eo=
X-QQ-mid: esmtpgz15t1762394799t86ae74a2
X-QQ-Originating-IP: yhNbobLVwNbY5V1jr9iOK5ifgRi7NiwMV1ECYKdCN10=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 06 Nov 2025 10:06:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10766765311845532809
From: Chaoyi Chen <kernel@airkyi.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH 0/9] drm/rockchip: Introduce Rockchip RK3506 VOP
Date: Thu,  6 Nov 2025 10:06:23 +0800
Message-Id: <20251106020632.92-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MaVe9I53f0M32r5fsRWj//W6nWaUspkMSaTtRW4c2N6Mdvr0+1ipAgD5
 JUlOS2AFXv2TT5iyKkQofrVkr4B6nVpxXL6F80oenAcFfNT6ZYS9VfFPbTdzHbAPbxlLTFr
 u3pn3DnIXAQoG4ecnn0xqL8Eh6kEScNs48pmFXkPacrGEJDKHpi+yv6oU/F8yyzEEWzdHNy
 rUySAbLVGX2lD3J0qtmrKEVQOUKGgisz6cKeY0iB1erxFWa4hODg3J337bFzjADIJX6RiqL
 IkssFhteJj/+JSxld1aapay3kY40f47vb0fRxFpqi3pYxrtg0wVEodRlDsNihgCmcYJKvDA
 IiYCt1v6RpYoQOUB5q9j/A7Xkn+LrNzQQ1KcflGdcH1xIXZ8bAdkxXuJFR90SAGUGvcNBAD
 2nbQf6qZtfHKSbEzEaj4wCg0QlTTm42p5wBkyjgYS6LMolsYav3Q6MYQ8LE/co0LVlFAuL4
 nMVz4KyQwBPKb+dyswWvp/GHlbdYXKo/lwMUvMmjEYbppktIBc6r3UDUW2qh87xsRWzvVmZ
 yrc0RIuEl6MP3dW9bjbSqcRrE4h/u/rOZRFDHEVxAWA2xioLfemSHgun52czZWwv+uKnFzx
 r41bHUFf7TXnn9HsZqNd7C+9n8wtZNa90DhWZpYUOYwCt9L9KTlzg5nzHFxf48tI0oHn3S6
 1K3P0HnVJeCZbZU2aAkEO6GNqUNjXIfvZ2bbkbpvC4qY773Ev1nh680PRo6ktxJ7sZ9s+w7
 Dak34WJKt3Pa7zrKnNozVPoF8dqH7TqtgopT7Y8/mKkd3w9n3uTcDl587GR1yorc1+KF1p5
 cVwFulLw8bk3SRXT2UktX9IVEeM6WLnWx9pAeS1Y1h0h+KDMaEpHiSQ1MspzojlC80Rkhxe
 MAnG3q57lQjueLxu/ciFBE7zyVkCiM6Cu1pY2NoKvPtQnkUhuMW8VdzmsDi6bfB+7Trm0h9
 R1rNpsQQ7Z51SMEVk8NCXUlrnT2Ylt9ZA5lQCCflYxPW4mg==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The VOP on rk3506:
- Support 2 lane MIPI DSI interface, 1.5Gbps/lane.
- Support RGB interface.
- Max output resolution is 1280x1280@60fps.
- WIN1 layer support RGB888/ARGB8888/RGB565.
- Support Gamma LUT.

This series adds basic support for rk3506 VOP. And tested on the
rk3506g-evb1-v10 board with a Wanchanglong W552946AAA DSI panel.

Chaoyi Chen (9):
  dt-bindings: ili9881c: Add compatible string for Wanchanglong
    w552946aaa
  dt-bindings: phy: rockchip-inno-dsidphy: Add compatible for rk3506
  dt-bindings: display: rockchip,dw-mipi-dsi: Add compatible for rk3506
  dt-bindings: display: rockchip,vop: Add compatible for rk3506
  drm/panel: ilitek-ili9881d: Add support for Wanchanglong W552946AAA
    panel
  phy: rockchip: inno-dsidphy: Add support for rk3506
  drm/rockchip: dsi: Add support for rk3506
  drm/rockchip: Drop ROCKCHIP_IOMMU depend for DRM_ROCKCHIP
  drm/rockchip: vop: Add support for rk3506

 .../display/panel/ilitek,ili9881c.yaml        |   1 +
 .../rockchip/rockchip,dw-mipi-dsi.yaml        |   1 +
 .../display/rockchip/rockchip-vop.yaml        |   1 +
 .../bindings/phy/rockchip,px30-dsi-dphy.yaml  |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 225 ++++++++++++++++++
 drivers/gpu/drm/rockchip/Kconfig              |   3 +-
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |  20 ++
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c   |  57 +++++
 drivers/gpu/drm/rockchip/rockchip_vop_reg.h   |  14 ++
 .../phy/rockchip/phy-rockchip-inno-dsidphy.c  |  91 ++++++-
 10 files changed, 410 insertions(+), 4 deletions(-)

-- 
2.51.1

