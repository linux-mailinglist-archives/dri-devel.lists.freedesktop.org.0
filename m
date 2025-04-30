Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F050AA455C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 10:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BF410E709;
	Wed, 30 Apr 2025 08:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="COros5YQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E46410E702
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 08:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=pNMjVj1AMrxiwOwN96Y/v4xLwkJzF6aKGVkZSCFmS3Y=; b=COros5YQ0h0Nqkdj3H0dWIQCaT
 UKGjVtS4QLGfI9Txixt8NL1mpY+Fmz6+nEBtOcw12gCyxy4MYL5QlQTNu9KQljIbCycuBM+rVblea
 SEWpmPAkYh5/5A1DykD+HVRXGHnDlbg/oE0Duib6P/Rlroc+5esRHYVDNsnNQEFDqcyovQiFQFH2y
 W7MKKEvRz0yyU6cIqcUj28M7zyvDNa92542db16ESeja77hZmf0bGFmjEmwYrlFQcuKimfIagCnrD
 ybzGy1QurI8pOqtniVIZvj6g35mKHlC5k5VX0ywkzSQWEphdiO/PjbhZZF9y70CH2juABaz7/5n1K
 2CQvOOEw==;
Received: from i53875ba4.versanet.de ([83.135.91.164]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uA2oW-00032E-BN; Wed, 30 Apr 2025 10:29:08 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quentin.schulz@cherry.de,
 heiko@sntech.de, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH 1/2] dt-bindings: display: ltk050h3146w: add port property
Date: Wed, 30 Apr 2025 10:28:49 +0200
Message-ID: <20250430082850.244199-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250430082850.244199-1-heiko@sntech.de>
References: <20250430082850.244199-1-heiko@sntech.de>
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

The panel can be connected to via graph nodes, so allow the port property.

This fixes dtc checker warnings like:
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: panel@0 (leadtek,ltk050h3148w): 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
    from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk050h3146w.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: /edp@fdec0000: failed to match any schema with compatible: ['rockchip,rk3588-edp']

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504300218.VDqQqGTT-lkp@intel.com/
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 .../devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml
index e2a2dd4ef5fa..5fcea62fd58f 100644
--- a/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml
+++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml
@@ -23,6 +23,7 @@ properties:
     maxItems: 1
 
   backlight: true
+  port: true
   reset-gpios: true
   iovcc-supply:
     description: regulator that supplies the iovcc voltage
-- 
2.47.2

