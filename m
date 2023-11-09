Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1126E7E6475
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 08:39:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3EF10E1C5;
	Thu,  9 Nov 2023 07:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805D310E1C8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 07:38:46 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 954A716F9;
 Thu,  9 Nov 2023 08:38:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1699515503;
 bh=ADSCf/9TIbVJ44AQQj3UfUMyJW9l+hCXhR2JJRI/apQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=tO1y8Hgu+dyzO0pbinNg/Jk7Uj7+U/jI8pf+9GoCTU2LcQsd6R1rGS9wk+oAofMxf
 Qqnf0JjyXhSrazYwCdY/1W7bC/UtnA7rp5PQR+GYUv+C3F8JgzxviI7V7ibfKlQ7lF
 +eWqHJOLl/b6U3h/o3ltf7/fqbhVxKG2ol7RaZ6Y=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 09 Nov 2023 09:37:56 +0200
Subject: [PATCH v2 03/11] drm/tidss: Drop useless variable init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-tidss-probe-v2-3-ac91b5ea35c0@ideasonboard.com>
References: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
In-Reply-To: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=ADSCf/9TIbVJ44AQQj3UfUMyJW9l+hCXhR2JJRI/apQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlTIx+iCOBgA7JX7ZXqNP8KfAUvhOyV2T+GXVa3
 HZFYkogZKuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUyMfgAKCRD6PaqMvJYe
 9aWDD/4vUmxETtGkP4RQBQVk+uVqsAIvqnNIP4L5Royrq09Im4G6XywVcoDKU6tD4cUGkTIIvxA
 IgHw8S5K6L3Dd5VVEx7TDxi8UABWFCNyO7P6PDdGFWBo7UotCPQ4v/DvYOtA21Hvz8F2fy7z+Nr
 //mNQHLLt7MqrRgxwJGWuqHqjcpNFW3aQUkt8bViQFGrDeaga/nqx8VrJKOGVmKGq5bxoOn7GQW
 k+mQ39XaleSByZK//7hDdnQG6qirWHFAGOGZSS7ihw4J4FFy3xTUvE5SXKcdMPIqr3zPWo3o4sW
 IikqGQE7HPtVM8lHNcMNpn8NuhxIidg+BaGOi6b86pPvoq6sEiQoFvL0EXzngsr3kcFNzecxq9m
 RZhj1Uh2RKBgb0kKekUHOIQNl1X2XIOpblFQleo+IeZDZBVPXw3jQQHuCl5RKvbrUjY37UxNjdp
 ldTp2B52ITTcZcFolpa2+hUWP46cD4agoIKVUMh6UXQ5DqsujDBOL71mu2eIQcyMB/dJbYX4+2O
 OPrVjqxEPzzTEYMSfVtlR75ioTIKcv17sRMXfJuvQvw1RxM6nm4vK30cKEpsc2DFQTigw9RkMKH
 RjLxwkToQL5U1V1TsRpXnILN3srdKlC2cM6DPY+Z+EOKPFrd1pmkoFIPYbli4N2fPfN2oN1WbJD
 pi+iLY6qUoq00uw==
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Francesco Dolcini <francesco@dolcini.it>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No need to initialize the ret to 0 in dispc_softreset().

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 9d9dee7abaef..ad7999434299 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -2705,7 +2705,7 @@ static void dispc_init_errata(struct dispc_device *dispc)
 static void dispc_softreset(struct dispc_device *dispc)
 {
 	u32 val;
-	int ret = 0;
+	int ret;
 
 	/* Soft reset */
 	REG_FLD_MOD(dispc, DSS_SYSCONFIG, 1, 1, 1);

-- 
2.34.1

