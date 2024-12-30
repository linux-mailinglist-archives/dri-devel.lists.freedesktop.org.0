Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB969FE56F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 11:51:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A67910E498;
	Mon, 30 Dec 2024 10:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oABRBj2+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6872610E134
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 10:51:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6AE535C595D;
 Mon, 30 Dec 2024 10:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B9EAC4CEE1;
 Mon, 30 Dec 2024 10:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735555861;
 bh=V5YudWXnJ7rHUTU5EwXOV89odpcktqY9hIsiJyNOono=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=oABRBj2+mlPqceb6n/6JHYfEV25T0Cd9VmNcrxmca8pg+s1eCV+IGSjuS0HgD6pcb
 mcqgnCmoVP7V1WySCffyFSwjRwYweGHJDt6fUNEUxV3q9YILeicifGyj25OECaB74n
 /tSMal0AUi1Maic3ZlzipUeTwOrmxsnctghIZg9C514oPudzKR5vmzLZR6Usx+auNH
 pBvITxK+UDUHYK3GqOAGveiqr7swfytUQYmGODAvXLgpQ9DIlmJfOSoEtPiGQIK3o4
 RiGbgTe8MD9sSZrpGm4765j5UDr+I+1xqBikhX2XdUyNAKPwpPrmn10vcm5J2zgrJC
 YXBpHU7MfVktA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD67E77194;
 Mon, 30 Dec 2024 10:51:01 +0000 (UTC)
From: Hermes Wu via B4 Relay
 <devnull+Hermes.wu.ite.corp-partner.google.com@kernel.org>
Date: Mon, 30 Dec 2024 18:51:22 +0800
Subject: [PATCH RESEND v7 04/10] drm/bridge: it6505: Change definition
 MAX_HDCP_DOWN_STREAM_COUNT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-v7-upstream-v7-4-e0fdd4844703@ite.corp-partner.google.com>
References: <20241230-v7-upstream-v7-0-e0fdd4844703@ite.corp-partner.google.com>
In-Reply-To: <20241230-v7-upstream-v7-0-e0fdd4844703@ite.corp-partner.google.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hermes Wu <hermes.wu@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Pin-yen Lin <treapking@chromium.org>, 
 Kenneth Hung <Kenneth.Hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>, 
 Hermes Wu <Hermes.wu@ite.com.tw>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735555881; l=994;
 i=Hermes.wu@ite.corp-partner.google.com; s=20241230;
 h=from:subject:message-id;
 bh=LXCX7YKUcq6qewqH/z3sJdCcnXEOYr4Q2Lg8igxzYE4=;
 b=iu9tF4s9GdTvlscvV0wpNicV9Lc5XLzKy1ve+EznaQkAAqjkVGE2UIzvwZstAYmylPkaGyKR8
 KOS1PcHuttaC7JPpTsTXaWVM3aYq5TzBocEWvfQ5HgK4as/1ltin4BK
X-Developer-Key: i=Hermes.wu@ite.corp-partner.google.com; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for
 Hermes.wu@ite.corp-partner.google.com/20241230 with auth_id=307
X-Original-From: Hermes Wu <Hermes.wu@ite.corp-partner.google.com>
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
Reply-To: Hermes.wu@ite.corp-partner.google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hermes Wu <Hermes.wu@ite.com.tw>

A HDCP source device shall support max downstream to 127 devices.
Change definition MAX_HDCP_DOWN_STREAM_COUNT to 127

KSVs shall save for DRM blocked devices check.
This results in struct it6505 growth by ~0.5 KiB.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Hermes Wu <hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index ba37974967767a17b7025595f6864f057174efb9..9a90a36d0421422038b04ad00b2cb2e326a9cab4 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -298,7 +298,7 @@
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


