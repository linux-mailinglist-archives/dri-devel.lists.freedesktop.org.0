Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA3FAFF36A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 23:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F56110E07C;
	Wed,  9 Jul 2025 21:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Wed, 09 Jul 2025 21:01:10 UTC
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3C48810E07C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 21:01:09 +0000 (UTC)
X-CSE-ConnectionGUID: SEHcO6xPRZWzKFG0VDFzGQ==
X-CSE-MsgGUID: LGq+HqAxS1qpbo7yb7rcbA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 10 Jul 2025 05:56:08 +0900
Received: from lenovo-p330.. (unknown [132.158.152.96])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4BCA64095590;
 Thu, 10 Jul 2025 05:56:04 +0900 (JST)
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, Hugo Villeneuve <hugo@hugovil.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 0/2] Remove hard coded values for MIPI-DSI
Date: Wed,  9 Jul 2025 16:55:30 -0400
Message-ID: <20250709205532.747596-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.49.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the initial drivers were submitted, some of the timing was hard coded and
did not allow for any MIPI-DSI panel to be attached.

This series assumes the follow patches have been applied.
Both patches exist in drm-misc-next.

5ce16c169a4c ("drm: renesas: rz-du: Add atomic_pre_enable")
6f392f371650 ("drm: renesas: rz-du: Implement MIPI DSI host transfers")



Chris Brandt (2):
  clk: renesas: rzg2l: Remove DSI clock rate restrictions
  drm: renesas: rz-du: Set DSI divider based on target MIPI device

 drivers/clk/renesas/rzg2l-cpg.c               | 113 ++++++++++++++++--
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    |  17 +++
 include/linux/clk/renesas.h                   |   4 +
 3 files changed, 124 insertions(+), 10 deletions(-)

--
2.49.0

