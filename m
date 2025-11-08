Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB13C4236E
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 02:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C9710E182;
	Sat,  8 Nov 2025 01:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="qZXk8S6h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EA910E182
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 01:10:37 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20251108010455euoutp02b3ad76a4dc00463b81a9c4a02d5c628a~14oY0Iyr91808118081euoutp02S;
 Sat,  8 Nov 2025 01:04:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20251108010455euoutp02b3ad76a4dc00463b81a9c4a02d5c628a~14oY0Iyr91808118081euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1762563895;
 bh=EZpgDuIWQDe3piA1lflo9cUpL7SQdX3ks9uifRxSrkU=;
 h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
 b=qZXk8S6hBPrs2lVMoD49eKaLLxd45mFG9fmOvAFaYicCHiG/CjLxe9p11lL8n8g4T
 6bVuT2Ogpsot3QoPAnFXkbiueITHfH+lNUywcem9WLjqegqqhIGyYajb4Oy5tmUYGt
 yv7sT1HFCyEC6nCvyQA14wV3xw7GfwppSCWBUwSQ=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20251108010454eucas1p103697b195125d853bd9f4d40662b681e~14oYeOVC50742807428eucas1p1b;
 Sat,  8 Nov 2025 01:04:54 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20251108010453eusmtip2f17ee4f4ef809e0111d98d420ce81c1d~14oXEeKei0912409124eusmtip2R;
 Sat,  8 Nov 2025 01:04:53 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sat, 08 Nov 2025 02:04:36 +0100
Subject: [PATCH RFC 02/13] dt-bindings: clock: jh7110: Make power-domain
 optional
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-jh7110-clean-send-v1-2-06bf43bb76b1@samsung.com>
In-Reply-To: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,  Conor Dooley
 <conor@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
 <hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Xingyu
 Wu <xingyu.wu@starfivetech.com>, Vinod Koul <vkoul@kernel.org>,  Kishon
 Vijay Abraham I <kishon@kernel.org>,  Andrzej Hajda
 <andrzej.hajda@intel.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,  David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Marek Szyprowski
 <m.szyprowski@samsung.com>, Icenowy Zheng <uwu@icenowy.me>,  Maud Spierings
 <maudspierings@gocontroll.com>, Andy Yan <andyshrk@163.com>,  Heiko Stuebner
 <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20251108010454eucas1p103697b195125d853bd9f4d40662b681e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251108010454eucas1p103697b195125d853bd9f4d40662b681e
X-EPHeader: CA
X-CMS-RootMailID: 20251108010454eucas1p103697b195125d853bd9f4d40662b681e
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
 <CGME20251108010454eucas1p103697b195125d853bd9f4d40662b681e@eucas1p1.samsung.com>
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

The voutcrg (Video Output Clock Generator) hardware resides within
the PD_VOUT power domain. In the new display subsystem model,
this power domain is managed by the top-level 'vout-subsystem'
parent driver.

Because the parent driver now handles power management, the voutcrg
node in the device tree no longer needs a 'power-domains' property.
This patch updates the voutcrg binding to reflect this by removing
'power-domains' from the list of required properties.

This fixes a dtbs_check warning that would be triggered by the
updated device tree.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
index af77bd8c86b12e667b79ffbaeae5f8a82e6d3f37..deff69037e5072002e06aa5a899f4488b7264f47 100644
--- a/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
+++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
@@ -61,7 +61,6 @@ required:
   - resets
   - '#clock-cells'
   - '#reset-cells'
-  - power-domains
 
 additionalProperties: false
 

-- 
2.34.1

