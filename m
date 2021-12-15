Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 096CC475530
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 10:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53B310E2F9;
	Wed, 15 Dec 2021 09:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFF010E2F9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 09:27:54 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by albert.telenet-ops.be with bizsmtp
 id WZTq2600g4C55Sk06ZTqzF; Wed, 15 Dec 2021 10:27:52 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxQZh-0056TG-OJ; Wed, 15 Dec 2021 10:27:49 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxQZh-009ahm-9c; Wed, 15 Dec 2021 10:27:49 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/3] drm: rcar-du: Add missing dependencies
Date: Wed, 15 Dec 2021 10:27:44 +0100
Message-Id: <cover.1639559338.git.geert+renesas@glider.be>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
 LUU HOAI <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

	Hi Laurent, Kieran, et al,

This patch series adds missing dependencies to Kconfig symbols related
to the R-Car Display Unit.  These dependencies prevent asking the user
about R-Car display drivers when configuring a kernel without Renesas
SoC support, or when the answer wouldn't have any impact on the kernel
build.

Thanks for your comments!

Geert Uytterhoeven (3):
  drm: rcar-du: DRM_RCAR_DW_HDMI should depend on ARCH_RENESAS
  drm: rcar-du: DRM_RCAR_USE_LVDS should depend on DRM_RCAR_DU
  drm: rcar-du: DRM_RCAR_MIPI_DSI should depend on ARCH_RENESAS

 drivers/gpu/drm/rcar-du/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
