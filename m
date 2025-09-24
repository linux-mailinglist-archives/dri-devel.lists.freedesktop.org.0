Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6701B991FD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 11:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC5A10E6CD;
	Wed, 24 Sep 2025 09:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AsoYN5EK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB3210E6CD
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 09:28:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 84E7A43DDE;
 Wed, 24 Sep 2025 09:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4C9C4AF11;
 Wed, 24 Sep 2025 09:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758706101;
 bh=aucfxwIehpz3q4PmJQg0bLLpC3j4Jr0IJwNGf6IB8sA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AsoYN5EKLNNjjqGHGVI0LET75KTXf7vK2x4ZiDwghs/Q0TvRPaqNOcFzYfdz4JGnq
 eFKQhJuem8zDXU+gffIIS2Y3FcQPNxvOfGp/1r5uvIuZqr6rC9H/PpNSFqhUg8sJJZ
 +i4F5SNaf8xbXcetzipLAUXOqvOe6P2/UlM3AigK6ZfD0T2cXWjbaM/7Emw9ViNejd
 ZVqrtVhQhhTTNojrsPfjxuX7e6OBLjRzRiayWiqsOIYtC+UOFiVfZArVa1vIezxsRv
 UgUTLg06CDWKbH5cShaq9MINsrzdkLQlGv7k8M+LYk3t+PcTH3EPyNcxY1qmkYSFc+
 NqIqE/BnBSskg==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1v1LnL-000000006pA-1m2t;
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
Subject: [PATCH 2/4] drm/imx/ldb: drop unused module alias
Date: Wed, 24 Sep 2025 11:26:41 +0200
Message-ID: <20250924092643.26113-3-johan@kernel.org>
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
platform module alias incorrectly added by commit bc627387a951
("imx-drm: imx-ldb: Add MODULE_ALIAS()").

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index 6be7a57ad03d..626d410d9150 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -644,4 +644,3 @@ module_platform_driver(imx_ldb_driver);
 MODULE_DESCRIPTION("i.MX LVDS driver");
 MODULE_AUTHOR("Sascha Hauer, Pengutronix");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:" DRIVER_NAME);
-- 
2.49.1

