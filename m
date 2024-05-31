Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B8A8D6AF2
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 22:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4885010E491;
	Fri, 31 May 2024 20:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="DTGp6yVB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1ED10E491
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 20:41:55 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 600E4885FE;
 Fri, 31 May 2024 22:41:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717188113;
 bh=W0Vk0hPMwOfXp99Kdm4cJaYsHLcUnjk5AgCJWYm6XOI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DTGp6yVB5WxmQ1uTqnb5+JeRx6xEEHNh6+LcpejIti/9bwoWBED5ECBJW82ZvFbT4
 y86H6UBVX4FhPRIpdI4tCNie5dpVXN9UWB1W0LHKUhCT3kOEVAFxkzUNGrK8SflXT7
 pVAfSY8Z5ApK/5dXGpgM14eyKy5e3OKd/J1Et9SP2oJKxTMr45cw36UR63n1ly4N85
 mqJN6VxbxH/hcIToXMzcewc+s1G4tnqBzZ+fEea5ujQ0SS7M+F+R1drYBu1eW29ROh
 iYx6oDi303upqhWpAvhuRvTClqKhNeiLCpdeK7FsMrdrSOOZUr9AdCv74eThz4cXkm
 hN6T3uiFNG3oA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
Subject: [PATCH 6/6] Revert "drm/bridge: tc358767: Set default CLRSIPO count"
Date: Fri, 31 May 2024 22:39:52 +0200
Message-ID: <20240531204130.277800-6-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240531204130.277800-1-marex@denx.de>
References: <20240531204130.277800-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 01338bb82fed40a6a234c2b36a92367c8671adf0.

With clock improvements in place, this seems to be no longer
necessary. Set the CLRSIPO to default setting recommended by
manufacturer.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: kernel@dh-electronics.com
---
 drivers/gpu/drm/bridge/tc358767.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 156297131a6cc..1243918320a7d 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1356,10 +1356,10 @@ static int tc_dsi_rx_enable(struct tc_data *tc)
 	u32 value;
 	int ret;
 
-	regmap_write(tc->regmap, PPI_D0S_CLRSIPOCOUNT, 25);
-	regmap_write(tc->regmap, PPI_D1S_CLRSIPOCOUNT, 25);
-	regmap_write(tc->regmap, PPI_D2S_CLRSIPOCOUNT, 25);
-	regmap_write(tc->regmap, PPI_D3S_CLRSIPOCOUNT, 25);
+	regmap_write(tc->regmap, PPI_D0S_CLRSIPOCOUNT, 5);
+	regmap_write(tc->regmap, PPI_D1S_CLRSIPOCOUNT, 5);
+	regmap_write(tc->regmap, PPI_D2S_CLRSIPOCOUNT, 5);
+	regmap_write(tc->regmap, PPI_D3S_CLRSIPOCOUNT, 5);
 	regmap_write(tc->regmap, PPI_D0S_ATMR, 0);
 	regmap_write(tc->regmap, PPI_D1S_ATMR, 0);
 	regmap_write(tc->regmap, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
-- 
2.43.0

