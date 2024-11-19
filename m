Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941179D2EBD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 20:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F9710E36C;
	Tue, 19 Nov 2024 19:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id AF95D10E36C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 19:21:00 +0000 (UTC)
X-CSE-ConnectionGUID: 39AOOys6SbSVqfz3XjmslQ==
X-CSE-MsgGUID: BKUOczUtRT2/MDX0/Krgbw==
X-IronPort-AV: E=Sophos;i="6.12,166,1728918000"; d="scan'208";a="225336219"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 20 Nov 2024 04:20:59 +0900
Received: from localhost.localdomain (unknown [10.226.92.216])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 66DCF40503A1;
 Wed, 20 Nov 2024 04:20:53 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org,
 stable@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v7 2/3] dt-bindings: display: adi,
 adv7533: Drop single lane support
Date: Tue, 19 Nov 2024 19:20:30 +0000
Message-ID: <20241119192040.152657-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119192040.152657-1-biju.das.jz@bp.renesas.com>
References: <20241119192040.152657-1-biju.das.jz@bp.renesas.com>
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

As per [1] and [2], ADV7535/7533 supports only 2-, 3-, or 4-lane. Drop
unsupported 1-lane from bindings.

[1] https://www.analog.com/media/en/technical-documentation/data-sheets/ADV7535.pdf
[2] https://www.analog.com/media/en/technical-documentation/data-sheets/ADV7533.pdf

Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
Cc: stable@vger.kernel.org
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * No change.
v5->v6:
 * No change.
v4->v5:
 * No change.
v3->v4:
 * Added link to ADV7533 data sheet.
 * Collected tags.
v3:
 * New patch.
---
 .../devicetree/bindings/display/bridge/adi,adv7533.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
index df20a3c9c744..ec89115c74e4 100644
--- a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
@@ -90,7 +90,7 @@ properties:
   adi,dsi-lanes:
     description: Number of DSI data lanes connected to the DSI host.
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [ 1, 2, 3, 4 ]
+    enum: [ 2, 3, 4 ]
 
   "#sound-dai-cells":
     const: 0
-- 
2.43.0

