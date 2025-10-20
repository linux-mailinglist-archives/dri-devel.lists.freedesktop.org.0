Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E606EBEFE9F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 10:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C86410E316;
	Mon, 20 Oct 2025 08:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="k9it5ZHm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326E610E313
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 08:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
 bh=supjnpNMV7Z5sSchIbn6T4QPTuHy+8pmLkLub0pKm28=; b=k9it5ZHmjQwVid1an6ahRrTmbB
 tXvMQ06DehkUHQfFj+NpQ8prsIUcj1UdWUBkn4iMq3dvox0qyBVuVCpkMruHeKJrPqqM4nLg6tcxe
 MAexHvCXbT2VZFtq12VlLW4uqaldMiGuIr1/ugPSaimeco4aHh3YE40jXO3PQGwvOG+q9uJccVHFx
 +F46v+YbnD0GqhRMKhLel95ohkc8Ml/AXhTyUSUtsIbPoSmjwrnCImWFbq5hNhA1dGj72dEb/zXnO
 1HsMPiZVsGwcMP+NXQp1TSY3T41RDm60gydq7deZmJNRtQQajw+4D+hjJDEInq0kor4QMm4heKFEo
 toaWAhKA==;
Received: from [141.76.253.240] (helo=phil.eduroam.local)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vAlCy-00078O-30; Mon, 20 Oct 2025 10:25:36 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quentin.schulz@cherry.de, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, cn.liweihao@gmail.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 1/9] dt-bindings: display: rockchip: dw-hdmi: Add compatible
 for RK3368 HDMI
Date: Mon, 20 Oct 2025 10:25:00 +0200
Message-ID: <20251020082508.3636511-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251020082508.3636511-1-heiko@sntech.de>
References: <20251020082508.3636511-1-heiko@sntech.de>
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Define a new compatible for RK3368 HDMI.

The RK3368 HDMI also uses a PHY internal in the controller, so works
similar to other controllers, with the exception that the RK3368
only has one VOP, so there is no source selection needed.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 .../devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
index 9d096856a79a..29716764413a 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
@@ -23,6 +23,7 @@ properties:
       - rockchip,rk3228-dw-hdmi
       - rockchip,rk3288-dw-hdmi
       - rockchip,rk3328-dw-hdmi
+      - rockchip,rk3368-dw-hdmi
       - rockchip,rk3399-dw-hdmi
       - rockchip,rk3568-dw-hdmi
 
-- 
2.47.2

