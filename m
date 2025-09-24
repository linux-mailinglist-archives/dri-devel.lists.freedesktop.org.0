Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8893BB991FA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 11:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E97F10E6CB;
	Wed, 24 Sep 2025 09:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NZCIgqoL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFABA10E6CB
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 09:28:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 84EB044A7D;
 Wed, 24 Sep 2025 09:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B625C2BCB3;
 Wed, 24 Sep 2025 09:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758706101;
 bh=JeezoGPCvEL1Rw85QMPh7l/F/95kWKSx8wcoS1htAp0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NZCIgqoLG1XHzeMxN/G3cqWiZYOdv2EGfdQf2DmDdvBcpt2s+EXpWnG+Q2a6V0SM4
 PyzfhC/LrR7DQemCzDd3qD/l5IGFu9eIpiqYj9H1bJsJlu7h1QDjfxTFf3D5CBuUEy
 Qbx7/kHyiVFKpBi+m21BaCfpAbDrTLsto0Y0yUrrh0jcC55cUImiQuwKeOlzvpGbU+
 cA+//VtNY0fZys9gaG8SzAwyjtuowFy+fqM+2cw6xgjJMEczQZSEn7XcEkcJNHzUI4
 +rtOgPjC8bGPMVYNIJsKEB3tuBJN5oTkL8pLIQX4SAD1TTEhycOdD9V69azevVcK9u
 vOb1a1TmgfTqg==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1v1LnL-000000006p8-1OmT;
 Wed, 24 Sep 2025 11:28:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/4] drm/imx/dw-hdmi: drop unused module alias
Date: Wed, 24 Sep 2025 11:26:40 +0200
Message-ID: <20250924092643.26113-2-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250924092643.26113-1-johan@kernel.org>
References: <20250924092643.26113-1-johan@kernel.org>
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

The driver has never supported anything but OF probe so drop the unused
platform module alias which was incorrectly added by commit 3d1b35a3d9f3
("drm: imx: imx-hdmi: convert imx-hdmi to drm_bridge mode").

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c b/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
index 8333c4bf7369..07e5f96202d4 100644
--- a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
+++ b/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
@@ -278,4 +278,3 @@ MODULE_AUTHOR("Andy Yan <andy.yan@rock-chips.com>");
 MODULE_AUTHOR("Yakir Yang <ykk@rock-chips.com>");
 MODULE_DESCRIPTION("IMX6 Specific DW-HDMI Driver Extension");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:dwhdmi-imx");
-- 
2.49.1

