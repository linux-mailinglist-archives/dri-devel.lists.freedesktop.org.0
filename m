Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9117745EB1C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 11:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A656EACD;
	Fri, 26 Nov 2021 10:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAE76EACD
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 10:15:23 +0000 (UTC)
Received: from Monstersaurus.local
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A372340;
 Fri, 26 Nov 2021 11:15:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1637921722;
 bh=l9nerkEGB+XEJioBDr9MP8o5G22dGl+ylIENzT7Nr14=;
 h=From:To:Cc:Subject:Date:From;
 b=MZydxZiw7pyCH7LTkgGhhjEJ6v5n1I0cTEnIh/GwtvQTno/fpM3tz/hT9NYejRCHt
 pxgkHeETSSeJpDvkAx0lm+G/vwR4XNqIe+oj1lHXAMCFDhdrVUZwivQngZGvVbYwYZ
 NeS+l3+HKcGvxRpsOA9wI6e0LVUZLKZ1D+yLLF3Q=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/4] drm: rcar-du: mipi-dsi: Cleanup and Fixes
Date: Fri, 26 Nov 2021 10:15:14 +0000
Message-Id: <20211126101518.938783-1-kieran.bingham+renesas@ideasonboard.com>
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
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These patches are against the as-yet-unmerged posting from Laurent of
"drm: rcar-du: Add R-Car DSI driver" from [0]

[0] https://lore.kernel.org/all/20210623135639.17125-1-laurent.pinchart+renesas@ideasonboard.com/

Notably, the comments blocking the integration of the series on the
handling of bridge probe ordering have hopefully been solved by 4/4
here. This has been validated and is working on the Falcon-V3U with an
SN65DSI86 on a merge of the latest drm/drm-next and
drm-misc/drm-misc-next.

Other updates to the SN65DSI86 were also used to support the bridge
connecting to non-eDP, and have previously been posted by Laurent [1].
I've made no specific changes to those, so I'll refrain from reposting
them.

[1] https://lore.kernel.org/all/20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com/

Kieran Bingham (4):
  drm: rcar-du: Fix Makefile indentation for DSI
  drm: rcar-du: Select DRM_MIPI_DSI with DRM_RCAR_MIPI_DSI
  drm: rcar-du: mipi-dsi: Ensure correct fout is reported
  drm: rcar-du: mipi-dsi: Support bridge probe ordering

 drivers/gpu/drm/rcar-du/Kconfig         |  1 +
 drivers/gpu/drm/rcar-du/Makefile        |  2 +-
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 52 ++++++++++++++-----------
 3 files changed, 31 insertions(+), 24 deletions(-)

-- 
2.30.2

