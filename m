Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAD36BFC51
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 20:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF3310E48E;
	Sat, 18 Mar 2023 19:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F7D10E496
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 19:08:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbui-0001np-IO; Sat, 18 Mar 2023 20:08:24 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbub-0054DX-Ne; Sat, 18 Mar 2023 20:08:17 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdbub-005wYj-21; Sat, 18 Mar 2023 20:08:17 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Rahul T R <r-ravikumar@ti.com>, Jayshri Pawar <jpawar@cadence.com>,
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Minghao Chi <chi.minghao@zte.com.cn>, Sandor Yu <Sandor.yu@nxp.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, kernel test robot <lkp@intel.com>,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/19] drm/bridge: Convert to platform remove callback
 returning void
Date: Sat, 18 Mar 2023 20:07:45 +0100
Message-Id: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3785;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=DqYUAVAFaVaiAzmRdffw6BcfwnTjT5FLY5f/XPwegGI=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhhQx7q8LdK5fE7SPfMf29LOVvpJon/5Sjyl/1dhuNlTcf
 OqZmLuzk9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJyLziYNiQclhySgpLwxdu
 fx3p4zUOAXEFh/8bHedwnFA+VaidP2/B5Jtqak+r06QWK6y86sVSMmHWwRy1D58uXd/2KnaVOtf
 UsLAqmcNc5UH/nM2eaQmq754v7BvsFMHedMRJ6GwR7zSWwDlvHNUM5eoMlgkavolyMN03a7NtRs
 ZBuU0PdaRiu425b/3g5Jc1y1eQm5J9bebL7CLRuOcWvL99rt5V+GMX8cY/rnx6NSvD4hTF4mqGg
 7G7ZC6vu/t9Z2PeLIu8ZOUtJ9niH4bN4nObYvlk9zrpxctZ5Rrs1Z9lP5GSdG+eyBOevcmO/21A
 gO8q3va7W1L3bpjnpLyq4Fz7v29KajarX50wOvS1XVsTAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

this series adapts the platform drivers below drivers/gpu/drm/bridge to use the
.remove_new() callback. Compared to the traditional .remove() callback
.remove_new() returns no value. This is a good thing because the driver core
doesn't (and cannot) cope for errors during remove. The only effect of a
non-zero return value in .remove() is that the driver core emits a warning. The
device is removed anyhow and an early return from .remove() usually yields a
resource leak.

By changing the remove callback to return void driver authors cannot
reasonably assume any more that there is some kind of cleanup later.

The first patch simplifies the cdns-mhdp8546 driver to return zero in its
remove callback unconditionally and thenn all drivers are trivially converted
using coccinelle.

Only patch #3 depends on patch #1, the other are pairwise independant and can
be applied individually.

Best regards
Uwe

Uwe Kleine-König (19):
  drm/bridge: cdns-mhdp8546: Improve error reporting in remove callback
  drm/bridge: cdns-dsi: Convert to platform remove callback returning
    void
  drm/bridge: cdns-mhdp8546: Convert to platform remove callback
    returning void
  drm/bridge: display-connector: Convert to platform remove callback
    returning void
  drm/bridge: fsl-ldb: Convert to platform remove callback returning
    void
  drm/bridge: imx8qm-ldb: Convert to platform remove callback returning
    void
  drm/bridge: imx8qxp-ldb: Convert to platform remove callback returning
    void
  drm/bridge: imx8qxp-pixel-combiner: Convert to platform remove
    callback returning void
  drm/bridge: imx8qxp-pixel-link: Convert to platform remove callback
    returning void
  drm/bridge: imx8qxp-pxl2dpi: Convert to platform remove callback
    returning void
  drm/bridge: lvds-codec: Convert to platform remove callback returning
    void
  drm/bridge: nwl-dsi: Convert to platform remove callback returning
    void
  drm/bridge: simple-bridg: Convert to platform remove callback
    returning void
  drm/bridge: dw-hdmi-ahb-audio: Convert to platform remove callback
    returning void
  drm/bridge: dw-hdmi-cec: Convert to platform remove callback returning
    void
  drm/bridge: dw-hdmi-gp-audio: Convert to platform remove callback
    returning void
  drm/bridge: dw-hdmi-i2s-audio: Convert to platform remove callback
    returning void
  drm/bridge: thc63lvd1024: Convert to platform remove callback
    returning void
  drm/bridge: ti-tfp410: Convert to platform remove callback returning
    void

 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    |  6 ++---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 22 +++++++++----------
 drivers/gpu/drm/bridge/display-connector.c    |  6 ++---
 drivers/gpu/drm/bridge/fsl-ldb.c              |  6 ++---
 drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c   |  6 ++---
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c  |  6 ++---
 .../drm/bridge/imx/imx8qxp-pixel-combiner.c   |  6 ++---
 .../gpu/drm/bridge/imx/imx8qxp-pixel-link.c   |  6 ++---
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c  |  6 ++---
 drivers/gpu/drm/bridge/lvds-codec.c           |  6 ++---
 drivers/gpu/drm/bridge/nwl-dsi.c              |  5 ++---
 drivers/gpu/drm/bridge/simple-bridge.c        |  6 ++---
 .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   |  6 ++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c |  6 ++---
 .../drm/bridge/synopsys/dw-hdmi-gp-audio.c    |  6 ++---
 .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   |  6 ++---
 drivers/gpu/drm/bridge/thc63lvd1024.c         |  6 ++---
 drivers/gpu/drm/bridge/ti-tfp410.c            |  6 ++---
 18 files changed, 44 insertions(+), 79 deletions(-)


base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.2

