Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5E478E797
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 10:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A25A10E590;
	Thu, 31 Aug 2023 08:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5D27810E590
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 08:09:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.02,216,1688396400"; d="scan'208";a="178287296"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 31 Aug 2023 17:09:46 +0900
Received: from localhost.localdomain (unknown [10.226.92.179])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id D6E124010DFE;
 Thu, 31 Aug 2023 17:09:40 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v6 0/4] Drop ID table and conditionals around of_node pointers
Date: Thu, 31 Aug 2023 09:09:34 +0100
Message-Id: <20230831080938.47454-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Zhu Wang <wangzhu9@huawei.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series aims to drop ID table and conditionals around of_node
pointers for anx78xx driver.

While at it, drop CONFIG_OF conditionals around of_node pointers from
drm_bridge.h and all the drm/bridge drivers.

v5->v6:
 * Dropped CONFIG_OF conditionals from all bridge drivers.
 * Added Rb tag from Douglas Anderson and for patch#2 and #3.
 * Added Rb tag from Laurent for patch#2.
 * Dropped unnecessary CONFIG_OF conditional around 
   devm_drm_of_get_bridge() and drmm_of_get_bridge().
v4->v5:
 * Added Rb tag from Andy and Helen for patch#1.
 * Split patch#2 into two
 * Added struct device_node forward declaration for patch#2.
 * Updated commit description for patch#2
v3->v4:
 * Created patch#2 for dropping conditionals around of_node pointers.
 * Added Rb tag from Laurent and Douglas Anderson for patch#1.
v2->v3:
 * Updated commit header.
v1->v2:
 * Dropped ID table support.

Biju Das (4):
  drm/bridge/analogix/anx78xx: Drop ID table
  drm/bridge: Drop conditionals around of_node pointers
  drm/bridge: Drop CONFIG_OF conditionals around of_node pointers
  drm/bridge: panel: Drop CONFIG_OF conditional around 
    *_of_get_bridge()

 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 9 ---------
 drivers/gpu/drm/bridge/panel.c                     | 5 -----
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          | 2 --
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      | 2 --
 include/drm/drm_bridge.h                           | 4 ++--
 5 files changed, 2 insertions(+), 20 deletions(-)

-- 
2.25.1

