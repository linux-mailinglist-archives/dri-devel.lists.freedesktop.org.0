Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A564F9A0334
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 09:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0276C10E6B0;
	Wed, 16 Oct 2024 07:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fivgGyuZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39AA010E6A9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 07:54:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 17BEFA42730;
 Wed, 16 Oct 2024 07:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A533DC4CED3;
 Wed, 16 Oct 2024 07:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729065252;
 bh=eNQDCFdkqiiyXv5hOp43aJIAbtM5c7kbCWij3kA8BiY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=fivgGyuZcm74gREXYcqgKPFcKt2V1bUMzsmtcXvWJobJFum/GfDifOrFLj78h3m7U
 BtHLkwXV27iyzE5lwJkCmBCz0GBCCXjwW84ZGmPWAtOjhoDxnSffn5syxBCErr5Ypu
 cKnn2UCmC7KPV55Pv9Yvffa2jYWAkz5DLLFzcGdWggFV32GqW6BnunqNNgaEVHhmNm
 e3LHi+kY0PQ0GVVZCczHgAlcfrqSRlM0Dj2d+EIoPPpXd3nc/3Gnbw5LPJtIiw89t0
 pmkdQ1VIg6UVF3ncZ2wCAGgV4j6t6UwuxXL7S/TcuixO4pD4O6wkDd4g6qy7f5OXm0
 2F40OciyycacQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 98BDBD206B1;
 Wed, 16 Oct 2024 07:54:12 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 16 Oct 2024 15:54:16 +0800
Subject: [PATCH v6 04/10] drm/bridge: it6505: Change definition
 MAX_HDCP_DOWN_STREAM_COUNT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-upstream-v6-v6-4-4d93a0c46de1@ite.com.tw>
References: <20241016-upstream-v6-v6-0-4d93a0c46de1@ite.com.tw>
In-Reply-To: <20241016-upstream-v6-v6-0-4d93a0c46de1@ite.com.tw>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Pin-yen Lin <treapking@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kenneth Hung <Kenneth.hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729065263; l=933;
 i=Hermes.wu@ite.com.tw; s=20241016; h=from:subject:message-id;
 bh=3ddSzRZW1dYqw+zVd/zP+vvAOPYLASxqzo1lBP2m1T8=;
 b=5+v3Tps6Ngx9FCOsycV1P077I4wPNRbn7LG5ac5D0CZPa1acwEYmmGhoudhocSfSXhw2HfMyr
 CGpjWfDuD26Dmz9Rk9lGsqUgC0O7ylNw0lRJ2akJEzBqkvZp+lQvT7X
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=kV18uQEXox+1WccdQceCbMlJKN+BBNUk3N8VsoULcQ0=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241016 with
 auth_id=250
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
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
Reply-To: Hermes.wu@ite.com.tw
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hermes Wu <Hermes.wu@ite.com.tw>

A HDCP source device shall support max downstream to 127 devices.
Change definition MAX_HDCP_DOWN_STREAM_COUNT to 127

KSVs shall save for DRM blocked devices check.
This results in struct it6505 growth by ~0.5 KiB.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 4e6ec1695ae45111d06026d7548d108fac9e5219..1159725f6871e5912aa6c2660823bee67115143e 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -297,7 +297,7 @@
 #define MAX_LANE_COUNT 4
 #define MAX_LINK_RATE HBR
 #define AUTO_TRAIN_RETRY 3
-#define MAX_HDCP_DOWN_STREAM_COUNT 10
+#define MAX_HDCP_DOWN_STREAM_COUNT 127
 #define MAX_CR_LEVEL 0x03
 #define MAX_EQ_LEVEL 0x03
 #define AUX_WAIT_TIMEOUT_MS 15

-- 
2.34.1


