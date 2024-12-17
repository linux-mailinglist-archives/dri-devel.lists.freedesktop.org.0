Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BE19F42D9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 06:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663A910E851;
	Tue, 17 Dec 2024 05:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YerdW6zR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1394710E851
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 05:32:33 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C1071045;
 Tue, 17 Dec 2024 06:31:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1734413515;
 bh=7hzw0SzmxWLVIEQik4mqnwQiiO+6a15pjXhcBTuLaI8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=YerdW6zRTwsPW1OpzRxk3XwhvYFdB1JAxvFmfNC/jVzZezoR+7tVhsPKhPPyyQMfk
 OPmH2m6KxfTRPKSWwjGtTarPu7iOfFSe5jHD/W1hKWTUw1XLhewbRmV7T02G+eG0SH
 BXSs+3vNBpCOcNTh+D1PV5fTUCGULaI8KlZYZivE=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 17 Dec 2024 07:31:39 +0200
Subject: [PATCH v5 5/7] dt-bindings: display: bridge: renesas,dsi-csi2-tx:
 Add r8a779h0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-rcar-gh-dsi-v5-5-e77421093c05@ideasonboard.com>
References: <20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com>
In-Reply-To: <20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnYQzksDlo9EgclgP9WNJkKGxCrBJaEbI6GANCK
 g6nE/O2vsiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ2EM5AAKCRD6PaqMvJYe
 9fUmEACb+qW4GYNJBdtbvyfcxPXOKcaUxh9pDlowd8vEl0+1JvG7nFDEwGMiaaHhLn+saQ/Lvam
 lLy2AkouSTsJ7MU1p+1ryE/Stizea+9613jVQc7IeVH30s/dEhQuZPLFjIpu4J9hq4uMvZJTOK2
 xqjdwphXqHf2HcdJqvsKOsO8EEeTq+rA2+oDWdQDgDAk7c7lnNzZ2efjQUuUkJgAQ6EaLP7aO75
 wCcq6BlV0zUiVDUN9vOKJcVA+YCuRbe1MQaK2jbKsOLpYHoNSyVRqUYLL2x8bx5WD8ufI96Gwrr
 7qAGcHxD7TQ4LTvVp35ETC6Dly7wFvGS3Q9dNGD8W83Ww9XKgy0NsOuor/eQdo5GYtmzRI3SNxk
 H0VeQ/GGWyETNrGy3VhB4rn7Q9MHNCKMANZGDG8aH4oFw4mmivJC5KwxVySjAaW7HCaqTTVYX4D
 /0RCLBNK0azrBJHvi3mzrO00/TUGSuYCodipu4kiZ3BGzGfwRjE8mNRJH6FD73+i+0VSmYYQddR
 +j9wjByix7y64ZG/JDhu+PmYqC8xPxV6XjhyICTTdyA2IW/Ukvfpn2RjStQQySCCzCHPx5ClLoE
 Nudws37QFWxpiWw1L6N40tOuqjSOLClaqwDX9BZTwl78KPDGgCDxuf28gAh7mYzEQOjtnHMGqoj
 N7motJequEnU/jw==
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

