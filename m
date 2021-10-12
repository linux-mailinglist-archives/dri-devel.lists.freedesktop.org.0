Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BEB429E30
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 08:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855FB6E5A4;
	Tue, 12 Oct 2021 06:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB69989F49
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 06:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634021345; x=1665557345;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OexUDrCO45DT7y8Xa3ppCIZxrceYdrcYeP4z6z7CHck=;
 b=i+TSyePC+y2c3l7nyTGM72mNdCKwkcP7vYEGYmF1hV91b6lSUQf2BQXg
 6gz9dK6pT+4eIIFt3C2cN3M1SdtNkE22HhhzBqPdYOub8fo++r72l7eDA
 tipugfyYT5X+TFB1d4ZdmOih470IXK2poGxOHoYHaNmNiaTrR8XVU79vv
 wpnQxl6n0aQ3vKRxkazjF788cZiGyzCPOH3Bh5c5L/WH1KNYuwqPOYKAc
 G0j9fucV+MLZ9FRF3EIOwqJGuI8dkdDYLiUO6/mqa0suyLGlV4CFEUniL
 VCTcq2Ovff3WmyUx5tMotJJ8RNF1eWGYQLyRJaXqv+n8sN5KEeAd9rLEp g==;
X-IronPort-AV: E=Sophos;i="5.85,366,1624312800"; d="scan'208";a="19985094"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 12 Oct 2021 08:49:01 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 12 Oct 2021 08:49:02 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 12 Oct 2021 08:49:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634021341; x=1665557341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OexUDrCO45DT7y8Xa3ppCIZxrceYdrcYeP4z6z7CHck=;
 b=M7aAq7a5Tda+vba+hvUILc33Luj3ItHwGyn3qmts0nBBmfpo6NcKKuFr
 Bxy2Ze3Gn1XBMk7MU3LMsGq7TuFoGxC4lM1Ws7Zlkb0hQ9kFkAytf1t4p
 umAzeaTrin9PpkktrB/caVPyGHi9q4tzQEKfSIoZe5pvH3yst8pBdAXZy
 IElSmJkzuIYH5TRkpFlgw85ua+fcckKXxq13+rnknGK2zdQK0BImeNt9i
 QZqxtOdQl2ruYzawCctiHQ4+Xx2HpO423yAlrkgXy4Hrf/69vq4hHyT3k
 kcVdeC9Ot7oHsLFNxZ/nT0R6eqDuh0lfTMGlgYoDh8GlrJfQvfu3npBJu g==;
X-IronPort-AV: E=Sophos;i="5.85,366,1624312800"; d="scan'208";a="19985093"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 12 Oct 2021 08:49:01 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id ACDBF280065;
 Tue, 12 Oct 2021 08:49:01 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 2/4] drm/bridge: ti-sn65dsi83: Make enable GPIO optional
Date: Tue, 12 Oct 2021 08:48:41 +0200
Message-Id: <20211012064843.298104-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012064843.298104-1-alexander.stein@ew.tq-group.com>
References: <20211012064843.298104-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 12 Oct 2021 06:54:21 +0000
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

The enable signal may not be controllable by the kernel. Make it
optional.
This is a similar to commit bbda1704fc15 ("drm/bridge: ti-sn65dsi86: Make
enable GPIO optional")

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index a32f70bc68ea..9072342566f3 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -671,7 +671,8 @@ static int sn65dsi83_probe(struct i2c_client *client,
 		model = id->driver_data;
 	}
 
-	ctx->enable_gpio = devm_gpiod_get(ctx->dev, "enable", GPIOD_OUT_LOW);
+	ctx->enable_gpio = devm_gpiod_get_optional(ctx->dev, "enable",
+						   GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->enable_gpio))
 		return PTR_ERR(ctx->enable_gpio);
 
-- 
2.25.1

