Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACA6ADE79C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 11:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B25510E7E8;
	Wed, 18 Jun 2025 09:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gCeF45A0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F342D10E7DB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 09:59:40 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0814A17D1;
 Wed, 18 Jun 2025 11:59:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1750240767;
 bh=CyQv33b09RvHl4nOFdkuxj7qIGokAYoC0TXSVeU5XvY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=gCeF45A0fmquNkacgBzrQ36gp1Qkx6DoBIX1zUHyJes/13JDf73ffOvaJ0U1AhMfW
 dlqVGnBC7TBOn3JTsB5VIa5JXURL144ihVYKDgB0sxLVef1BAyXpl7JdrRgtKygNIL
 OiZzSU/FDWVWH95x4JhlPSnFPWegBnRkVyKfQ6+I=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 18 Jun 2025 12:59:09 +0300
Subject: [PATCH v4 06/17] drm/bridge: cdns-dsi: Remove extra line at the
 end of the file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-cdns-dsi-impro-v4-6-862c841dbe02@ideasonboard.com>
References: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
In-Reply-To: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Parth Pancholi <parth.pancholi@toradex.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=786;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=CyQv33b09RvHl4nOFdkuxj7qIGokAYoC0TXSVeU5XvY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoUo3+zRxirnMuQfMTECONQzyd7qv1sEh8AoZoK
 6sbY60qyROJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaFKN/gAKCRD6PaqMvJYe
 9UDzD/97Dz2GUH4Uu5er5xQvbd22dCoUAd/QUJlR3L10ujrOs/4quGGZNkmXEiVvBk3msxFMYz1
 9GQhv03i87x+Q3hl/pivdm2VycLD0xW4qJelAoLLTFzLGZQY1OdD/pL9jvIXgRrBplOopb07yZ9
 SJ3QeibiZnrljMAJ91ldn2yG6RKwHB9NDVV5crw1Mg9kYsqgGwJbZRqSVpdB31kAzq5Zx/oYNNU
 7mIKMC528MwOQScUxAOA0uWCYstwKYx43HAg0P0nI3kqQrgrWsUKfGtfBSjhgch/UO0r9mxuxee
 Mxv0NpIrhfTKSuQ9kBZxHQ22korkLPO444Gnei9puRzeT/cv291MRw8OQPfqziAJLBctiV/bM8Y
 jqgKRCs+m/wCETZ0K2wAk6i4UvWRh5nJm6Sk91l9Pv85vOK3rmPXD5keFZm9SuMYqIVX3DIJj/J
 naMY2cfEmRAU0a7Ei0eVsxbzw3pkYkz8I7sSJDaM0dzIzR2uZtL0fJ7/rZ5ZbpunZMtMf49D/16
 6WACrRxwhJqttSoj6AxzKqzWtJRwJF9WRhRD+aDX7nKxRkt2+FI79xUhTGWFzi4nG15Myq/fPDA
 uyLhpizWIzXEnDUYnfrAqM8sTuh6+p4/TvlEVaYc2dAhSB7BgYCoZAaznc7vVo0h8GutpNsFZGb
 G1t7g7hgtOtW3tA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

Remove extra line at the end of the file.

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Tested-by: Parth Pancholi <parth.pancholi@toradex.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 695b6246b280..0c7ad05b6e53 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -1442,4 +1442,3 @@ MODULE_AUTHOR("Boris Brezillon <boris.brezillon@bootlin.com>");
 MODULE_DESCRIPTION("Cadence DSI driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:cdns-dsi");
-

-- 
2.43.0

