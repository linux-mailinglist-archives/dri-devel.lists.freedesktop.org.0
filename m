Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E1A547A52
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jun 2022 15:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C37E10E371;
	Sun, 12 Jun 2022 13:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0117010E36C
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 13:22:14 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 18BDB8441D;
 Sun, 12 Jun 2022 15:22:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1655040133;
 bh=XGli3u2d7ZpdAcHpT03JTCw0BnJmNRM/hdnwYzPrjLw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LBfIa+Qgsc2zUGrgfFTBH45Th3cHtDrF2ZAKT2mbhbG4QEfw9PNi22R23GhSmkOaB
 76nnqxWnwqDnkW+RiJp6V+BG4qXdaYKzgK+5yihyVQY6WpR9ZUuDMv7cBdW6C9QBt4
 f3wSToCAebR2J83LotlytbWjf3cypMeSQ7KMF2UquRnXnbHOFaC8iqI90lsxkBNLW/
 maZF7v51bOLTRxGKFFsPIDJqd4rh97CUdJe8c07212AcRhCIKadZCgl8tdsQphCCIN
 bOUZYp5NN2A0kMGdIJdwL5A8lZnRF5u7K4DmSyapbMat1Fe9v+qaOKtDT924EIbpiR
 ldw39TMnuEcvw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/bridge: rcar: Drop unused variables due to
 drm_of_get_data_lanes_count_ep
Date: Sun, 12 Jun 2022 15:21:52 +0200
Message-Id: <20220612132152.91052-3-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220612132152.91052-1-marex@denx.de>
References: <20220612132152.91052-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, kernel test robot <lkp@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, robert.foss@linaro.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The rcar_mipi_dsi_parse_dt() now contains two uninitialized variables
due to conversion to common drm_of_get_data_lanes_count_ep() helper.
Drop them.

Fixes: d643daaf1694 ("drm/bridge: rcar: Convert to drm_of_get_data_lanes_count_ep")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 67dce337098a5..31ed285073e0f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -679,8 +679,6 @@ static const struct mipi_dsi_host_ops rcar_mipi_dsi_host_ops = {
 
 static int rcar_mipi_dsi_parse_dt(struct rcar_mipi_dsi *dsi)
 {
-	struct device_node *ep;
-	u32 data_lanes[4];
 	int ret;
 
 	ret = drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0, 1, 4);
-- 
2.35.1

