Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8963D18F59
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 13:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43EEE10E4C1;
	Tue, 13 Jan 2026 12:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=grimler.se header.i=@grimler.se header.b="lFGPpoL5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com
 [91.218.175.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA7210E4BF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 12:55:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
 t=1768308601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dn8TkGnFX648Df0G4MRNqXtbtucg/2Mdh004DLq7F5A=;
 b=lFGPpoL5RH56iNDF0944tz84HBfsj7AecmBciHPe4lHyeNPt1fPN9GB6enWYs4DmxfjKqE
 LY42pQEar5Fua79NAYgGUh/TVdjuMi5jgGD3HVPNSWS3kMWT2j8yjDNJ4iw5+Md+L5pI8u
 NmrQzDe0lpGtqMB7cvia14ZPoUvcUtU=
From: Henrik Grimler <henrik@grimler.se>
Date: Tue, 13 Jan 2026 13:49:29 +0100
Subject: [PATCH v4 1/3] drm/bridge: sii9234: fix some typos in comments and
 messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-exynos4-sii9234-driver-v4-1-6e8c0ac14f84@grimler.se>
References: <20260113-exynos4-sii9234-driver-v4-0-6e8c0ac14f84@grimler.se>
In-Reply-To: <20260113-exynos4-sii9234-driver-v4-0-6e8c0ac14f84@grimler.se>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2382; i=henrik@grimler.se;
 h=from:subject:message-id; bh=/PifViMuWvo7zfvjCOh/M1snfV5AQVf1KCAH+/d0SlY=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBpZj9quqwxtYky6Pb2N1L+xfnn+4F1GGht+DnEp
 Y+cDCs1Q5mJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCaWY/agAKCRCwB25JC3Fh
 a9D4CAC8Aha7YF6GuWMJFjL1se6o5RvLnLwnKEkp89MYLRUuI21shrdwTEgg2vkyUH+Shh5W2C8
 U7G8chGQCmfYJ7oIT+tT1NqtxriC+ERUvDuETdD9+du787/8cqNz2RGN1pOdsF1EPdOdkPJk6v+
 dRt7lKwizgKhnEfswYQ+hWDNb9Ct1u2Fq9Ds7aZZVa6QKRirxQ64MorcTc+xaRbi2mvkan5Aznf
 T4X90vUiOzftpaZ3a4siIPsBbkBaNR5Gce3WWabANtRrJ8O1mJ8gy7XyI/UBJ8Gcrsl0iJXHwMs
 FYsUZxXJhg22Tj2NKJlw+e/qGA5gbJq9jqQLAAbWu1rJsT7b
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
v4: no changes
v3: collect tags
v2: no changes
---
 drivers/gpu/drm/bridge/sii9234.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index bb1bed03eb5b..930117bbba87 100644
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
2.52.0

