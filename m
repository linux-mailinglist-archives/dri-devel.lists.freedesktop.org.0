Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A682A87E98
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 13:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B43A10E57A;
	Mon, 14 Apr 2025 11:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ErkGSDpc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C0510E56E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 11:12:12 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0A111648;
 Mon, 14 Apr 2025 13:10:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1744629010;
 bh=UkXw5jrtx4cXq2fBCmUZ7O32tBWjC1bfsn24JsFx6zI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ErkGSDpcsKUeTKMVIa2OJ1RhpmIh0brnMOr2wbWfcKpEJaC5dMfGrAHUldwZVv98w
 QEHzQre26nWTlXq/yY11ma6ggeB4BZwWqAU9e0aL5VQs4ufaZS8ipPFPvt+djNfo9v
 MMPAP1hq8lJEPnl+Eea6JCOj6AQZQr51k+62x4Iw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 14 Apr 2025 14:11:15 +0300
Subject: [PATCH v3 06/17] drm/bridge: cdns-dsi: Remove extra line at the
 end of the file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-cdns-dsi-impro-v3-6-4e52551d4f07@ideasonboard.com>
References: <20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ideasonboard.com>
In-Reply-To: <20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=674;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=UkXw5jrtx4cXq2fBCmUZ7O32tBWjC1bfsn24JsFx6zI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn/O1+GHkd1JMbn6AHORSHHCtFItB9o8t/nB4qA
 fPdIhCBpyyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ/ztfgAKCRD6PaqMvJYe
 9TlND/925JQuITXscOZzU8SElgbI8MjB2tOzYOTHH0K50Due7e1jiwFBIteDez4syiWygB5yS9x
 zP5bKx8tDU0pVe8sDYrDyO5za9dzSAA4BeoLwfX05QcMAs/Ret2JaNN4U3W8kICzcWlHbAwXdaH
 4tXeZ2fOiPfjxqojlArHcDy+J0hvLkt5U5bELrF2kfotafyRGfUNd4IEZwy+jVTm7dYkR0SXbEE
 KwQUzoH4VfH/cLDbEL8PqKUf2B9XeOGH12mqQVEM/EW+7uZjxsNIJwOM6wcfUBbVqR5C3Aaomw5
 cZ8iOhmxBlrwDWBuM60cxcAPAx/mJACQRUM+AM9dVPM/f26+LmQ9etW//sIiKZRQoSQuTGwldrG
 qngbJv7dhpW3qvc6AZnVRrQBZGsMyTaU08eUZPQ+yg6l/bFZvcafQQtgzLyiuM0UFWQYds0/phZ
 iQCRVoBT07yD/PUuOOpLccOvZnB9MeH788GtHoHimCNeZXlq/Ppa3s2+xx6tdAbavNFPkmYrsCu
 0OAOYWzxIw9fpSPB1cW6g0WZGdFPl4l8aFVqE1H81UmslZ5MZJG35+39uOSlM8nynniic1TVRv7
 pa3K5hDpHp7YoWQSrqL7gnBYvEFys7Wd/NVT+dduoGoUI/AAwOu4XKXV6M+FDTnPhEZZCzFMRTx
 i2HwJrUdMK7zXeg==
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

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 1d300f0da2f5..5315d572f7ab 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -1435,4 +1435,3 @@ MODULE_AUTHOR("Boris Brezillon <boris.brezillon@bootlin.com>");
 MODULE_DESCRIPTION("Cadence DSI driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:cdns-dsi");
-

-- 
2.43.0

