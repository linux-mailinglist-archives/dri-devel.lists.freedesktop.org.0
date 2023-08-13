Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FC277AA71
	for <lists+dri-devel@lfdr.de>; Sun, 13 Aug 2023 20:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23E710E0E3;
	Sun, 13 Aug 2023 18:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3215010E0E3
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Aug 2023 18:05:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.01,170,1684767600"; d="scan'208";a="172836546"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 14 Aug 2023 03:05:20 +0900
Received: from localhost.localdomain (unknown [10.226.92.13])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0F564405D103;
 Mon, 14 Aug 2023 03:05:14 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/7] ADV7511 driver enhancements
Date: Sun, 13 Aug 2023 19:05:05 +0100
Message-Id: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
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
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-renesas-soc@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Biju Das <biju.das.jz@bp.renesas.com>, Adam Ford <aford173@gmail.com>,
 Bogdan Togorean <bogdan.togorean@analog.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series aims to improve ADV7511 driver by adding
feature bits and data instead of comparing enum adv7511_type for
various hardware differences between ADV7511, ADV7533 and ADV7535.

This patch series tested with[1] on RZ/G2L SMARC EVK which embeds
ADV7535.

[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=762260

Biju Das (7):
  drm: adv7511: Add struct adv7511_chip_info and use
    i2c_get_match_data()
  drm: adv7511: Add max_mode_clock variable to struct adv7511_chip_info
  drm: adv7511: Add max_lane_freq variable to struct adv7511_chip_info
  drm: adv7511: Add supply_names and num_supplies variables to struct
    adv7511_chip_info
  drm: adv7511: Add has_dsi feature bit to struct adv7511_chip_info
  drm: adv7511: Add link_config feature bit to struct adv7511_chip_info
  drm: adv7511: Add hpd_override_enable feature bit to struct
    adv7511_chip_info

 drivers/gpu/drm/bridge/adv7511/adv7511.h     | 19 ++--
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 98 +++++++++++---------
 drivers/gpu/drm/bridge/adv7511/adv7533.c     |  7 +-
 3 files changed, 69 insertions(+), 55 deletions(-)

-- 
2.25.1

