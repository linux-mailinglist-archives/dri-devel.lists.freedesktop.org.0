Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D13E894411A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 04:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8E110E879;
	Thu,  1 Aug 2024 02:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="5E1YKnPy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78AE10E876
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 02:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1722479184;
 bh=89fKMA77G8ZMlK1UoBHBthXO24qwokaCENfTUaZojDg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=5E1YKnPyd91FZWGkWqtI63/mZdcm6PsSFrCmqeZg+o4TlnGwiShTdPbiodALCY37R
 WQDSz/+Ci20lGFBbw+FGH8dj/OjSzIeu9gPXqdk0vpMSNXNjsn46P++IIeau3WHSfL
 0udzua9HLsXCnc/g2OWM4Lftu8gjJ+94OYFBt0oefdWBeAUJaLXvmEtY+fP0eNntTp
 4KWmJ5Ao3ISYXmibVS/YfR21motk8VtlRWA3exrID4/zR5UhTqz84y7UshMGqLHbRM
 rhjwD3oXGJs1S0JSvcD9zZe0BF7Axi42gaQ48M+Aq1lhior3bZIe485Ae/k89EJOSi
 sXI/bM4/SNFmA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 558483782207;
 Thu,  1 Aug 2024 02:26:24 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 01 Aug 2024 05:25:53 +0300
Subject: [PATCH v2 2/3] drm/rockchip: Explicitly include bits header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240801-b4-rk3588-bridge-upstream-v2-2-9fa657a4e15b@collabora.com>
References: <20240801-b4-rk3588-bridge-upstream-v2-0-9fa657a4e15b@collabora.com>
In-Reply-To: <20240801-b4-rk3588-bridge-upstream-v2-0-9fa657a4e15b@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>
X-Mailer: b4 0.14.1
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

Driver makes use of the BIT() macro, but relies on the bits header being
implicitly included.

Explicitly pull the header in to avoid potential build failures in some
configurations.

While at it, reorder include directives alphabetically.

Fixes: 8c8546546f25 ("drm/rockchip: move output interface related definition to rockchip_drm_drv.h")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
index bbb9e0bf6804..8d566fcd80a2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
@@ -12,9 +12,10 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_gem.h>
 
+#include <linux/bits.h>
+#include <linux/component.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
-#include <linux/component.h>
 
 #define ROCKCHIP_MAX_FB_BUFFER	3
 #define ROCKCHIP_MAX_CONNECTOR	2

-- 
2.45.2

