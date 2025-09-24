Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A1BB99209
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 11:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86FD10E6CC;
	Wed, 24 Sep 2025 09:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TMpUya35";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F1C10E6CB
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 09:28:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DF7F144B14;
 Wed, 24 Sep 2025 09:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90A8C2BCB8;
 Wed, 24 Sep 2025 09:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758706101;
 bh=LjEZsu/eRN6Oc2WFJua8KrGaq3Ac5hB3lBQxT0YFGr0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TMpUya35NhDTWF7mbMjNWQQqW3N0pzPrB2gSmhinHpi2ocrNXnjX2f3YaYFqsoiXc
 ahF2Wlvp0am8TI70w7hDTsPuECDiwVvXjhn+Fa12NApwVuoJqoyrcFcU6h33MrwKSy
 WWt3ysvpl8vqxz9wXSao37d2q/nxsCs7Aj3tBId2jm+FYpGL1/r9ywgnxp2Ld4la/a
 9bPZd8GxiWDzKvPraMKPgSLkwrM9MVSKC+Nl5D23lXwUbVE8/eqzczPqgpVIrq2StP
 dgq8/S0WFmzQkWiVRPiheQNKCac6OgNEQFaSHXJOPKEroMK0rGgrjtFFLQiN7TCIcD
 x4SNSNFCkd52Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1v1LnL-000000006pE-2Qg0;
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
Subject: [PATCH 4/4] drm/imx/parallel-display: drop unused module alias
Date: Wed, 24 Sep 2025 11:26:43 +0200
Message-ID: <20250924092643.26113-5-johan@kernel.org>
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
platform module alias incorrectly added by commit b2da05ff4797
("imx-drm: parallel-display: Add MODULE_ALIAS()")

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 6d8325c76697..f2f36f425664 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -286,4 +286,3 @@ module_platform_driver(imx_pd_driver);
 MODULE_DESCRIPTION("i.MX parallel display driver");
 MODULE_AUTHOR("Sascha Hauer, Pengutronix");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:imx-parallel-display");
-- 
2.49.1

