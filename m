Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0649B32F4A
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 13:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E9910E210;
	Sun, 24 Aug 2025 11:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=grimler.se header.i=@grimler.se header.b="a5DnYZL6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com
 [91.218.175.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E3010E210
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 11:17:38 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
 t=1756034255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3aK39K6kznEgVQk3rj38IpsyJh21pnGECoEjeWkg6Cs=;
 b=a5DnYZL6PeRnOA0UtnTHAZHMQGwrtbXEQ1KsWH7L1gsdGpnLA4L8u63F/SOnCVu6enHvj4
 VGXdYA4aLLdfAHlCuQGbtZQXuQzJryhhwBOrmpiMNTVaKSYR37a8pfFlYMvNsHEdCXh04W
 gZ3nRL5PS0WMXFCnbnD+r5tZ0oIJqgQ=
From: Henrik Grimler <henrik@grimler.se>
Date: Sun, 24 Aug 2025 13:16:54 +0200
Subject: [PATCH v3 1/3] drm/bridge: sii9234: fix some typos in comments and
 messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250824-exynos4-sii9234-driver-v3-1-80849e716a37@grimler.se>
References: <20250824-exynos4-sii9234-driver-v3-0-80849e716a37@grimler.se>
In-Reply-To: <20250824-exynos4-sii9234-driver-v3-0-80849e716a37@grimler.se>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org, 
 linux-kernel@vger.kernel.org, Henrik Grimler <henrik@grimler.se>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2422; i=henrik@grimler.se;
 h=from:subject:message-id; bh=tF1XdNPzABc4GXXTUniUTBAc53Z0OMRaK2671uJFP44=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBoqvS7ZCLaLjj4NfoYTX2lHUV+kE+xhb6YeNCQb
 VHbS6J8IEKJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCaKr0uwAKCRCwB25JC3Fh
 a5F6B/9R1XlFsu5BkbBgjE7QCcJpWKMlTv3PJBu78ynkTLtQVgqfsQK2V+w+Lk1AnvKO/H2NcKy
 kEFtaAuFT2R3dZpEc4YUsD4rxJ/4NnkzHUSyA6swvCN1WT8UVPh41NvrOsT5HVTa6dNhf1gjQe2
 xFG1G5F6T6BTM5AoHCgJqcNFeKyEOUetHyjH0bYnJgeT4IfysPWzebonqMSWpkSmCe4uWE6bQxz
 Wa5sEdp4Ml7QauCklcrz1rD4xTdLkATvKHO0UndaqNttEQf/lLZyMos51y9cL+K4+3HM7Z+8JJk
 iVSMuqXsD7k57rXJ5us6Zdmh+T4YiG4r5fPHSybagPuI3Msc
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT
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

Fix spelling and formatting so that the code is easier to follow, and
so that it is more searchable.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
v3: collect tags
v2: no changes
---
 drivers/gpu/drm/bridge/sii9234.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index bb1bed03eb5b7ae67f752c0d593dc54131e9e370..930117bbba87285e62107389606897740516eb0a 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -339,7 +339,7 @@ static int sii9234_cbus_reset(struct sii9234 *ctx)
 	return sii9234_clear_error(ctx);
 }
 
-/* Require to chek mhl imformation of samsung in cbus_init_register */
+/* Require to check mhl information of samsung in cbus_init_register */
 static int sii9234_cbus_init(struct sii9234 *ctx)
 {
 	cbus_writeb(ctx, 0x07, 0xF2);
@@ -614,7 +614,7 @@ static void sii9234_cable_out(struct sii9234 *ctx)
 
 	disable_irq(to_i2c_client(ctx->dev)->irq);
 	tpi_writeb(ctx, TPI_DPD_REG, 0);
-	/* Turn on&off hpd festure for only QCT HDMI */
+	/* Turn on&off hpd feature for only QCT HDMI */
 	sii9234_hw_off(ctx);
 
 	ctx->state = ST_OFF;
@@ -708,7 +708,7 @@ static enum sii9234_state sii9234_rsen_change(struct sii9234 *ctx)
 {
 	int value;
 
-	/* Work_around code to handle wrong interrupt */
+	/* Workaround code to handle wrong interrupt */
 	if (ctx->state != ST_RGND_1K) {
 		dev_err(ctx->dev, "RSEN_HIGH without RGND_1K\n");
 		return ST_FAILURE;
@@ -723,9 +723,9 @@ static enum sii9234_state sii9234_rsen_change(struct sii9234 *ctx)
 	}
 	dev_dbg(ctx->dev, "RSEN lost\n");
 	/*
-	 * Once RSEN loss is confirmed,we need to check
-	 * based on cable status and chip power status,whether
-	 * it is SINK Loss(HDMI cable not connected, TV Off)
+	 * Once RSEN loss is confirmed, we need to check
+	 * based on cable status and chip power status, whether
+	 * it is SINK Loss (HDMI cable not connected, TV Off)
 	 * or MHL cable disconnection
 	 * TODO: Define the below mhl_disconnection()
 	 */
@@ -820,7 +820,7 @@ static int sii9234_init_resources(struct sii9234 *ctx,
 	int ret;
 
 	if (!ctx->dev->of_node) {
-		dev_err(ctx->dev, "not DT device\n");
+		dev_err(ctx->dev, "no DT device\n");
 		return -ENODEV;
 	}
 

-- 
2.50.1

