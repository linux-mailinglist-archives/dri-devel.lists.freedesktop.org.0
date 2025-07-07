Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644DFAFB8F9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 18:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C8410E32E;
	Mon,  7 Jul 2025 16:49:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="j1FbE116";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B529210E4E4
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 16:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
 bh=v4TLQmAGOcWD0y8Mnt5eC5Fpk/ELMiMig19bQQmdhOg=; b=j1FbE116GrdVoQK9ijrfRr8Hhx
 TKwzoBePZ7MsI/oHcKP5Cogld+t1KdRxusbn1hDlul5ZDEqw1WXz/dKOWKFwMq6fuGmURKHIYpwI6
 +k/xPiFDjgAE/5cedxZbeskedf3TXPbmX2GVW5nlLekqnESEMRxzQ1IXjXNCeZp6r3pXHZtw8NhAD
 kGrmjsG2uq9QxSjTCW+FSDeGYGqoya5bEPu7yCHelco4DfzNz3hpn/TC9QIOUNbr9lvrOzqWXZfT7
 wsRHwLxwbF/127nqi0xlgGT07+j2Jp5cAKlX5SDXdk9iZ9LMZUKqrGxAaZkUraoCJwKddFVrxBd7i
 sRSAtywA==;
Received: from i53875bf5.versanet.de ([83.135.91.245]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uYp1u-0004yl-N8; Mon, 07 Jul 2025 18:49:22 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, andy.yan@rock-chips.com, andyshrk@163.com,
 nicolas.frattaroli@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 08/13] dt-bindings: display: rockchip: Add rk3576 to RK3588 DW
 DSI2 controller schema
Date: Mon,  7 Jul 2025 18:49:01 +0200
Message-ID: <20250707164906.1445288-9-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250707164906.1445288-1-heiko@sntech.de>
References: <20250707164906.1445288-1-heiko@sntech.de>
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

The rk3576 controller is based on the same newer Synopsis IP as the one
found in the rk3588.

Its external setting bits in the GRF are different though, so it needs
its own distinct compatible.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml
index 53384e47b507..75cd1c13fa52 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - rockchip,rk3576-mipi-dsi2
       - rockchip,rk3588-mipi-dsi2
 
   reg:
-- 
2.47.2

