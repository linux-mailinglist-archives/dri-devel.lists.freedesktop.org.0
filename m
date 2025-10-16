Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80375BE22D7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 10:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7DD10E2E5;
	Thu, 16 Oct 2025 08:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="IXvHAR7f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0EC10E2E5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 08:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=RS
 vYSPh8ZvpCq9Tn8rRo74pwoQsk+cPXDxtofOd/xlQ=; b=IXvHAR7fi2TAsfLHVn
 2fLAddoDQPJpeHz+Hc0NSWLC+xBmv3zguiE5uAvUltBapI4Q7QDPwqAvtxclmPkb
 HySd+GNCk9SREAlplFQSf1P2d3GRAx/h2mwx0FMk4yAhZlqMIDPv4A3aCVKxsnZo
 zaVlOiK6ME/Ndg+TjBzMX2h+Y=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wC3f_8Ur_BoSVKcAg--.8978S2; 
 Thu, 16 Oct 2025 16:38:48 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: mripard@kernel.org, neil.armstrong@linaro.org, andrzej.hajda@intel.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
 knaerzche@gmail.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v8 0/2] Convert inno hdmi to drm bridge
Date: Thu, 16 Oct 2025 16:38:30 +0800
Message-ID: <20251016083843.76675-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wC3f_8Ur_BoSVKcAg--.8978S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF4fZw1rGr4xKr48KrWDCFg_yoW8uF4kpa
 yjyrW5GF47uF1jgFs2kF1fAr1Syan8Jw4S9ryxX34SvFW29F15Aws29F4Yqr9rZr47CFsF
 yrn7Ja47KFy7ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jv_M3UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEg7oXmjwqwOGzAAAsQ
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

From: Andy Yan <andy.yan@rock-chips.com>


Convert it to drm bridge driver, it will be convenient for us to
migrate the connector part to the display driver later.

Patches that have already been merged in drm-misc-next are dropped.


Changes in v8:
- Rebase on latest drm-misc-next tag: drm-misc-fixes-2025-10-09
- Link to v7: https://lore.kernel.org/linux-rockchip/20250903110825.776807-1-andyshrk@163.com/

Changes in v7:
- Rebase on latest drm-misc-next
- Link to v6: https://lore.kernel.org/linux-rockchip/20250717081344.1355613-1-andyshrk@163.com/

Changes in v6:
- Rebase on latest drm-misc-next
- Link to V5: https://lore.kernel.org/linux-rockchip/20250512124615.2848731-1-andyshrk@163.com/

Changes in v5:
- Split cleanup code to seperate patch
- Switch to devm_drm_bridge_alloc() API
- Link to V4: https://lore.kernel.org/linux-rockchip/20250422070455.432666-1-andyshrk@163.com/

Changes in v4:
- Do not store colorimetry within inno_hdmi struct
- Link to V3: https://lore.kernel.org/linux-rockchip/20250402123150.238234-1-andyshrk@163.com/

Changes in v3:
- First included in v3
- Link to V2: https://lore.kernel.org/dri-devel/20250325132944.171111-1-andyshrk@163.com/

Andy Yan (2):
  drm/rockchip: inno-hdmi: Convert to drm bridge
  MAINTAINERS: Add entry for Innosilicon hdmi bridge library

 MAINTAINERS                                   |   8 +
 drivers/gpu/drm/bridge/Kconfig                |   7 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 .../inno_hdmi.c => bridge/inno-hdmi.c}        | 501 +++++-------------
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 drivers/gpu/drm/rockchip/Makefile             |   2 +-
 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c | 189 +++++++
 include/drm/bridge/inno_hdmi.h                |  33 ++
 8 files changed, 375 insertions(+), 367 deletions(-)
 rename drivers/gpu/drm/{rockchip/inno_hdmi.c => bridge/inno-hdmi.c} (69%)
 create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
 create mode 100644 include/drm/bridge/inno_hdmi.h

-- 
2.43.0

base-commit: 21f0c9e6d2835608c3b46ab47d84e341fc7749fc
branch: rk3036_hdmi_bridge_v8

