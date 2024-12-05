Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4199E5785
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 14:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A7610EE78;
	Thu,  5 Dec 2024 13:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sf114J7i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3143610EE78
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 13:45:33 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01F5AD01;
 Thu,  5 Dec 2024 14:45:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733406303;
 bh=7hzw0SzmxWLVIEQik4mqnwQiiO+6a15pjXhcBTuLaI8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=sf114J7inwr/qgMflsHlg/9+4hUFvQQ3uBKlMjcAbX1rU5hR4tQshZ3rHST234mbt
 jo0XKD4lLuPay4odo4UQx5aEFAFEXVkAS0LS4hAyLM2TCrq34pOsu1Ol7EhqlV7Tci
 fSSOH/fHSH+Log862lEMdidF4BQqt9g93KbXdn1Q=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 05 Dec 2024 15:44:58 +0200
Subject: [PATCH v2 03/10] dt-bindings: display: bridge:
 renesas,dsi-csi2-tx: Add r8a779h0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-rcar-gh-dsi-v2-3-42471851df86@ideasonboard.com>
References: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
In-Reply-To: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=dTprj9jjuLmoedubnDT5F4e9cHFBPmdT8w1PeMV2wF8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUa5yWRMiq+qr708cmz/km+OvSL/hXvfR2V7VK
 NEToNpajXmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1GucgAKCRD6PaqMvJYe
 9XbTD/9d8IWcl8EmJHjHJbJ7lo9Mdk4BRIcv1MpyOJrxiVpeZQtw5mLGyHSLIeUXAV52Ap+t7Y3
 cyJHf7W9q+5uw86hqU+yxRQF7SWRbbWlmxKIXdYjfks7onk92AH9bNqkdYdd3V1a5LoMPci4fQz
 BXVwbU2URPvytR07pZOoQlinjpe8rIgYCF8+9FHruzJfXmZST/EkQcPg9MeQnri3D4xrV2lgapi
 Swcpy6adhrsm7ZzqnaOr6CD2zFRWyKPSCeZVFat2nb/e2qpnzAc0rLJXMTgcJ0PZbFYPjVNiEqS
 RPAJ/EkdjsGOm370IQ8yapavj6PbfQcTK8TZQZT7qXT2gCgLhBL4Sj/cHwc6qnIygXByySltFwe
 bPzZ/8CZYn0/i3RsYmbDqy96o+Helio4eoUfB+w0InKjMZffNjORgs+hiwN2QnuZ43k+8Utf/CH
 Md+rBGdTtIx7mEjE8xT2+Jls5tUiDsFxUzjcGIe8bgYFjH08NsZ65OdZzKN95+epYdDGs0kZmNu
 TcYSGxpN82FzU7R8qIwWX5H1DmWa8pT1cen2/IWDQwE7uAF/b8TljujwrZdba9CJXYICKKvxWKL
 53JPzO8UXC5uCcWn8sP6VyMYb3qQgwLtGO7lY2zZLElTR7ti9NgnwnyCar6UgYExpAanPzIk2WP
 GD3wbMTWpjDsoyA==
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

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Extend the Renesas DSI display bindings to support the r8a779h0 V4M.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
index d33026f85e19..c167795c63f6 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - renesas,r8a779a0-dsi-csi2-tx    # for V3U
       - renesas,r8a779g0-dsi-csi2-tx    # for V4H
+      - renesas,r8a779h0-dsi-csi2-tx    # for V4M
 
   reg:
     maxItems: 1

-- 
2.43.0

