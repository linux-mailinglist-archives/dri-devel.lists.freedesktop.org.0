Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFBB454B09
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 17:32:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBC36E872;
	Wed, 17 Nov 2021 16:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76436E870
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 16:32:45 +0000 (UTC)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78BC6E7;
 Wed, 17 Nov 2021 17:32:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1637166763;
 bh=MD1fVoPuDcvM3q0RBHroMxwiN1Vyl8xroqKjJv+0Pvc=;
 h=From:To:Cc:Subject:Date:From;
 b=c5KB0FrCZyMWVjs4PJXB+A+rLPnAwAUpPwgwPUAf+9Hrigo1gAVuZ0eRMMVFlvKjv
 v1pP91PsC8Z3hZsBf6+4B4TgaUmRbD4VnO9Q/jQiv2mkTFixHvj5u8QGuYhnENd9+/
 8lVR2Yh6onza3cuvuKHLxw3zID90fiJAE26EgTlo=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] gpu: drm: panel-edp: Fix edp_panel_entry documentation
Date: Wed, 17 Nov 2021 16:32:39 +0000
Message-Id: <20211117163239.529781-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
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
Cc: David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The edp_panel_entry members 'delay' and 'name' are documented, but
without the correct syntax for kernel doc.

This generates the following warnings:

drivers/gpu/drm/panel/panel-edp.c:204: warning: Function parameter or member 'delay' not described in 'edp_panel_entry'
drivers/gpu/drm/panel/panel-edp.c:204: warning: Function parameter or member 'name' not described in 'edp_panel_entry'

Fix them accordingly.

Fixes: 5540cf8f3e8d ("drm/panel-edp: Implement generic "edp-panel"s probed by EDID")
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index fc03046de134..176ef0c3cc1d 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -196,10 +196,10 @@ struct edp_panel_entry {
 	/** @panel_id: 32-bit ID for panel, encoded with drm_edid_encode_panel_id(). */
 	u32 panel_id;
 
-	/* @delay: The power sequencing delays needed for this panel. */
+	/** @delay: The power sequencing delays needed for this panel. */
 	const struct panel_delay *delay;
 
-	/* @name: Name of this panel (for printing to logs). */
+	/** @name: Name of this panel (for printing to logs). */
 	const char *name;
 };
 
-- 
2.30.2

