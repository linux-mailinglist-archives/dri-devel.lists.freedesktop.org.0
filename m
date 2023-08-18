Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE0278134D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 21:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97FDB10E0EA;
	Fri, 18 Aug 2023 19:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 346D510E0EA
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 19:18:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.01,184,1684767600"; d="scan'208";a="173298245"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 19 Aug 2023 04:18:23 +0900
Received: from localhost.localdomain (unknown [10.226.93.81])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8A69F409B888;
 Sat, 19 Aug 2023 04:18:19 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 0/2] Match data improvements for it66121 driver
Date: Fri, 18 Aug 2023 20:18:15 +0100
Message-Id: <20230818191817.340360-1-biju.das.jz@bp.renesas.com>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series aims to add match data improvements for it66121 driver.

v2->v3:
 * Removed fixes tag from patch#1 as nothing broken.
 * Added Rb tag from Andy.
v1->v2:
 * Split the patch into two.
 * patch#1 extend match support for OF tables compared to legacy ID
   lookup and fixes tag.
 * patch#2 simplifies the probe() by using i2c_get_match_data. 
 * Dropped sentence for dropping local variable as it is integral part of
   the patch.

Biju Das (2):
  drm: bridge: it66121: Extend match support for OF tables
  drm: bridge: it66121: Simplify probe()

 drivers/gpu/drm/bridge/ite-it66121.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

-- 
2.25.1

