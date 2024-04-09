Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A205B89E0FE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 19:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FCAE112E37;
	Tue,  9 Apr 2024 17:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F552112E37
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 17:03:11 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ruEsE-0003vU-EZ; Tue, 09 Apr 2024 19:03:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ruEsC-00BKy7-Eu; Tue, 09 Apr 2024 19:03:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1ruEsC-00H4tQ-19;
 Tue, 09 Apr 2024 19:03:04 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 0/4] gpu: Convert to platform remove callback returning void
Date: Tue,  9 Apr 2024 19:02:47 +0200
Message-ID: <cover.1712681770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1255;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=SInnTnTlpk4lC0a1OFt5dfcAXu152vN+6fS/Qz+hcZ0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmFXS3eAV7HI2w8HMoMiE4vmmyNOiQhnxVpMoga
 STlONQCJeyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZhV0twAKCRCPgPtYfRL+
 Tm+HB/92rq+dGfXMi0jrB/Ig/F+qBugwFODSuTOyjy9rrlH4AbZ4W23SnRx9za6p66ippE8ctgz
 9TSLyCzQFTSC1kUwwpfXiF//p46buUY7wyYNB+1r9bavrmtsfuUkxRiJBk3P/tFZ28590ooBHUf
 3yanYVUV6taxIgLBgoTtP0VPRWVc7pF/NM9ROjGokRfxYButJMxp2QFvxylGFwzU5kZnrKx2+z7
 85Gu6iiva8+Vvl9PYX0+fizhotAEJuzFoGSIVDJcXGWiZLs34HriSVUiRa5zOOwEIS9Ipfm6RJO
 0fV6zSjsXrEXUIyQ4e3uTNm5H9eGFEBBhs3DLnhZuy8EwSdC
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
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

Hello,

with some patches sent earlier[1], this series converts all platform
drivers below drivers/gpu to not use struct platform_device::remove()
any more.

See commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for an extended explanation and the eventual goal.

All conversations are trivial, because the driver's .remove() callbacks
returned zero unconditionally.

There are no interdependencies between these patches. This is merge
window material.

Best regards
Uwe

Uwe Kleine-König (4):
  drm/imagination: Convert to platform remove callback returning void
  drm/mediatek: Convert to platform remove callback returning void
  gpu: host1x: Convert to platform remove callback returning void
  gpu: ipu-v3: Convert to platform remove callback returning void

 drivers/gpu/drm/imagination/pvr_drv.c  | 7 ++-----
 drivers/gpu/drm/mediatek/mtk_padding.c | 5 ++---
 drivers/gpu/host1x/dev.c               | 6 ++----
 drivers/gpu/ipu-v3/ipu-common.c        | 6 ++----
 drivers/gpu/ipu-v3/ipu-pre.c           | 5 ++---
 drivers/gpu/ipu-v3/ipu-prg.c           | 6 ++----
 6 files changed, 12 insertions(+), 23 deletions(-)

base-commit: a053fd3ca5d1b927a8655f239c84b0d790218fda
-- 
2.43.0

