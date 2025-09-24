Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F03B99204
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 11:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8F810E6D0;
	Wed, 24 Sep 2025 09:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AR9/Vmic";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8AC10E6CF
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 09:28:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DABAE4444B;
 Wed, 24 Sep 2025 09:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9067C2BCB5;
 Wed, 24 Sep 2025 09:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758706101;
 bh=M/22n/6VII/Xvb7W0QVWWWhFM7cAUQ/uL17SmklK980=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AR9/Vmicgn8Avcc/XvVw2pvj+J8QkwvFPBqcC+Le3e64dx5bcmKSwOwteglA+Alhl
 LEdRD+/u/7VfwlqHTuJxLSs8hLm8f9RWm/Td+K5dPdK0ECFcI9okQTJ/sgINL+ONRy
 JAFeuHxgcmcEWh93cMS0T3wRm4MGzZatRh3Ve0UZCwEZ6lJCHgQHeX4qpnxg4DuU0l
 jKT4DmChWUSREksPJL/nJQbYRPGj80VU3BdAKpJhGrTzyeBmLP65K0yHkmUhntKGeE
 WVZZHboRSr62mUhK3gnm+SyDkt5C8R3t+9P0m2TEgkGbElop6I+05nq+KwzIHmFy5K
 u59afh1IZhurQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1v1LnL-000000006pC-26OE;
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
Subject: [PATCH 3/4] drm/imx/tve: drop unused module alias
Date: Wed, 24 Sep 2025 11:26:42 +0200
Message-ID: <20250924092643.26113-4-johan@kernel.org>
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

The driver has never supported anything but OF probe so drop the
unused platform module alias incorrectly added by commit 52db752c3de5
("imx-drm: imx-tve: Add MODULE_ALIAS()").

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/imx/ipuv3/imx-tve.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index 895413d26113..31d93f59abe0 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -686,4 +686,3 @@ module_platform_driver(imx_tve_driver);
 MODULE_DESCRIPTION("i.MX Television Encoder driver");
 MODULE_AUTHOR("Philipp Zabel, Pengutronix");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:imx-tve");
-- 
2.49.1

