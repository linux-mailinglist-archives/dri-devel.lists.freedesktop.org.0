Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A229D12516B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 20:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4ED06E09A;
	Wed, 18 Dec 2019 19:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207D96E09A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 19:10:28 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id f20so1398189plj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 11:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EuBd5H0Egt+eDY+fK/iuV4fphB2qstxtMKk6PdK6o5A=;
 b=S86ZB6KZWjzBWNer4WPm2X1LwRziSTHVHOQAcHfs+JFNZIdFhkw7JLb807hllDCYEy
 Hu6MigRzR6kEQQW6ZcMElMamn2hUOuhvHGRSY3E3rVhsd/AdBI32u9lqJJRK1y71MuQp
 ncwlCQBEFnBNd45zE4nJPZMklK8i2yW5fNy4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EuBd5H0Egt+eDY+fK/iuV4fphB2qstxtMKk6PdK6o5A=;
 b=XfspX5VYQl2CTnqhxz/L5Pj7/haYsy/p/TUY5nzKHKgdj0yPCzm2NH3orZ7oKJ0raJ
 bFuDNCDrJagGkIBHNq4eP+bEqe0+5fF2+sTuhGRp21SykmLHW9811I0dAn8PPylm5Su3
 gCmN8rbcFmKFE3aNTH4Z7HW8tWMyLPmYWWkajLC/an+SEmdusArnT6dcOYTACR1Dw3Or
 NeXc6bFpwyQTHlqr+KDjVN24uQy8Qqg+5Pu33vAweZBQkwang0BrqnnbkVEbk1sCwZ9W
 0SShPlh8fJgjMLHNOw4fV231jtkqazQKvPitceFdNlk5l7vgUfLAte49wWUqM7pX5CvB
 dtFA==
X-Gm-Message-State: APjAAAXAHVLJhvCRbG6jA51/84Z66i8cgD8UjPsVeFygGGU+60oZDbvb
 f3LZ6eBEqvCjJOFrhQRdiOVsBg==
X-Google-Smtp-Source: APXvYqwU8uLra6sgkg2kZFnCJdBPd9PVO3B5cEcqJKnQ6ikq51O0B+PtJzugqG3VZX2O+nw+6dGAJQ==
X-Received: by 2002:a17:90a:e389:: with SMTP id b9mr4642793pjz.7.1576696227877; 
 Wed, 18 Dec 2019 11:10:27 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c809:c7d5:78ea:e014:edb4:e862])
 by smtp.gmail.com with ESMTPSA id q7sm3745855pjd.3.2019.12.18.11.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 11:10:27 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v13 0/7] drm/sun4i: Allwinner A64 MIPI-DSI support
Date: Thu, 19 Dec 2019 00:40:10 +0530
Message-Id: <20191218191017.2895-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is v13 version for Allwinner A64 MIPI-DSI support
and here is the previous version set[1]

Changes for v13:
- update dt-bindings for A64
- drop has_mod_clk variant
- use regmap bus clock properly
Changes for v12:
- use enum insted of oneOf+const
- handle bus clock using regmap attach clk
- tested on A64, A33 boards.
Changes for v11:
- fix dt-bindings for dphy
- fix dt-bindings for dsi controller
- add bus clock handling code
- tested on A64, A33 boards.
Changes for v10:
- updated dt-bindings as per .yaml format
- rebased on drm-misc/for-linux-next
Changes for v9:
- moved dsi fixes in separate series on top of A33
- rebase on linux-next
Changes for v8:
- rebased on drm-misc change along with linux-next
- reworked video start delay patch
- tested on 4 different dsi panels
- reworked commit messages
Changes for v7:
- moved vcc-dsi binding to required filed.
- drop quotes on fallback dphy bindings.
- drop min_rate clock pll-mipi patches.
- introduce dclk divider computation as like A64 BSP.
- add A64 DSI quark patches.
- fixed A64 DSI pipeline.
- add proper commit messages.
- collect Merlijn Wajer Tested-by credits.
Changes for v6:
- dropped unneeded changes, patches
- fixed all burst mode patches as per previous version comments
- rebase on master
- update proper commit message
- dropped unneeded comments
- order the patches that make review easy
Changes for v5:
- collect Rob, Acked-by
- droped "Fix VBP size calculation" patch
- updated vblk timing calculation.
- droped techstar, bananapi dsi panel drivers which may require
  bridge or other setup. it's under discussion.
Changes for v4:
- droppoed untested CCU_FEATURE_FIXED_POSTDIV check code in
  nkm min, max rate patches
- create two patches for "Add Allwinner A64 MIPI DSI support"
  one for has_mod_clk quirk and other one for A64 support
- use existing driver code construct for hblk computation
- dropped "Increase hfp packet overhead" patch [2], though BSP added
  this but we have no issues as of now.
  (no issues on panel side w/o this change)
- create separate function for vblk computation 
- enable vcc-dsi regulator in dsi_runtime_resume
- collect Rob, Acked-by
- update MAINTAINERS file for panel drivers
- cleanup commit messages
- fixed checkpatch warnings/errors

[1] https://patchwork.freedesktop.org/series/70361/

Any inputs?
Jagan.

Jagan Teki (7):
  dt-bindings: sun6i-dsi: Document A64 MIPI-DSI controller
  dt-bindings: sun6i-dsi: Add A64 DPHY compatible (w/ A31 fallback)
  drm/sun4i: dsi: Get the mod clock for A31
  drm/sun4i: dsi: Handle bus clock via regmap_mmio_attach_clk
  drm/sun4i: dsi: Add Allwinner A64 MIPI DSI support
  arm64: dts: allwinner: a64: Add MIPI DSI pipeline
  [DO NOT MERGE] arm64: dts: allwinner: bananapi-m64: Enable Bananapi S070WV20-CT16 DSI
    panel

 .../display/allwinner,sun6i-a31-mipi-dsi.yaml | 33 ++++++++++-
 .../phy/allwinner,sun6i-a31-mipi-dphy.yaml    |  6 +-
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts | 31 +++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 37 +++++++++++++
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c        | 55 +++++++++++++++----
 5 files changed, 148 insertions(+), 14 deletions(-)

-- 
2.18.0.321.gffc6fa0e3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
