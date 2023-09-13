Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CCD79E0C6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 09:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CEB10E472;
	Wed, 13 Sep 2023 07:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1618 seconds by postgrey-1.36 at gabe;
 Wed, 13 Sep 2023 07:26:24 UTC
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a02:c205:3004:2154::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49A110E472
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 07:26:24 +0000 (UTC)
Received: from p200300ccff163a001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff16:3a00:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <andreas@kemnade.info>)
 id 1qgJqH-003fzu-6Q; Wed, 13 Sep 2023 08:59:17 +0200
Received: from andi by aktux with local (Exim 4.96)
 (envelope-from <andreas@kemnade.info>) id 1qgJqG-006VX4-2U;
 Wed, 13 Sep 2023 08:59:16 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: tomi.valkeinen@ideasonboard.com, airlied@gmail.com, daniel@ffwll.ch,
 u.kleine-koenig@pengutronix.de, andreas@kemnade.info, arnd@arndb.de,
 laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 linux-omap@vger.kernel.org
Subject: [RFC PATCH] drm: omapdrm: dsi: add refsel also for omap4
Date: Wed, 13 Sep 2023 08:59:11 +0200
Message-Id: <20230913065911.1551166-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
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

Some 3.0 source has it set behind a if (omap4).
Maybe it is helpful maybe not, at least in the omap4460
trm these bits are marked as reserved.
But maybe some dsi video mode panel starts magically working.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 60189a23506a1..e2f576cd9f63c 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4505,7 +4505,7 @@ static const struct dss_pll_hw dss_omap4_dsi_pll_hw = {
 	.has_stopmode = true,
 	.has_freqsel = false,
 	.has_selfreqdco = false,
-	.has_refsel = false,
+	.has_refsel = true,
 };
 
 static const struct dss_pll_hw dss_omap5_dsi_pll_hw = {
-- 
2.39.2

