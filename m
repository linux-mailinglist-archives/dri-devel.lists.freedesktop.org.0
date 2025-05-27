Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DEBAC50BF
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 16:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCFD10E2B9;
	Tue, 27 May 2025 14:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BDB10E2AB
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 14:22:15 +0000 (UTC)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1uJvBo-00048s-US; Tue, 27 May 2025 16:22:00 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 0/2] drm/bridge: samsung-dsim: Small cleanups
Date: Tue, 27 May 2025 16:21:46 +0200
Message-Id: <20250527-samsung-dsim-v1-0-5be520d84fbb@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHrKNWgC/x3MQQqAIBBA0avIrBPMEqGrRAvN0WaRhUMRSHdPW
 r7F/xUYCyHDJCoUvInpyA19J2DdXE4oKTSDVtooo61kt/OVkwxMu9Te4eBHE6310JKzYKTn383
 L+35gJF9MXgAAAA==
X-Change-ID: 20250527-samsung-dsim-2bae3b45f77b
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Replace an open-coded goto-again construct with a while loop and a
custom MHZ macro with the common HZ_PER_MHZ.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Philipp Zabel (2):
      drm/bridge: samsung-dsim: use while loop in samsung_dsim_transfer_start
      drm/bridge: samsung-dsim: Use HZ_PER_MHZ macro from units.h

 drivers/gpu/drm/bridge/samsung-dsim.c | 77 +++++++++++++++--------------------
 1 file changed, 33 insertions(+), 44 deletions(-)
---
base-commit: 99764593528f9e0ee9509f9e4a4eb21db99d0681
change-id: 20250527-samsung-dsim-2bae3b45f77b

Best regards,
-- 
Philipp Zabel <p.zabel@pengutronix.de>

