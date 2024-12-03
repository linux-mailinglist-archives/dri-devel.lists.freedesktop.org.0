Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FB29E14EE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 09:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A4510E937;
	Tue,  3 Dec 2024 08:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vR7XK6yP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8A910E92D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 08:02:46 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85D03D49;
 Tue,  3 Dec 2024 09:02:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733212938;
 bh=w8HKVjZehvUbPU5HddVJpFqDx9BrkGtDnv6ZTLZw4KA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=vR7XK6yPe4XQKpue+g2B2WV1SvZaC41na97ek/DyXb/7iFPwXa6Ljfvh6BTot2NXg
 Km/aPzNJc7krhQum8aTbKwONheEXayXoTjr55SEacQ2mLeb82V87rsLxHsjntmizP3
 H8YvdSjAg0zzcm13M66biyh81LkwdCmqot8rc5Kk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Dec 2024 10:01:36 +0200
Subject: [PATCH 2/9] dt-bindings: display: renesas,du: Add r8a779h0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-rcar-gh-dsi-v1-2-738ae1a95d2a@ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
In-Reply-To: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=868;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=mmvnBmfnZpcyFaoVtTr/3fiY6NmCQCljN1ySkTzp71s=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnTrscAMUY0bAcmXrldnAhWXO/DSeOjQxdNvo+m
 4nZCj5Qj6yJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ067HAAKCRD6PaqMvJYe
 9dJ9EACdrb9AceYgubLmjYIho0wOtTFn5GyyEChx3dcjsBMLKusvUVPycUIBevKSpmtPoID1eYa
 QqusDTCt/yE+cDy2ZGtZHuqOmMm4vBgiyxDx2X2Lu9iJJvBFCEApsDRuiD63EhQMXgk30Hzurm+
 5m7ZMMoiVO8+kOfl3/w0DJ4Q14u3rL6rvMotCo9GFrVRY8MtrSFV/UdxFh51Q8q1uKyhzJ6K+H9
 kqD7Jz8shdo1AKkXga1iy1sOQyhF5752CVNQNA15fY44sByQ2zWMVO+ri65vYwn4NyyEQDrYkx8
 QIjWRPGq3djxmsBj9a8GgkKvuO2fAoJs6osTSIpIjdMazmQkc+M0LPaUn12XUtCF+SOQapMXq3G
 cUIKOrk/RTdp3hYmG01UAk9G0U6wpJ19urJ/02/p72Ok02LHn/BQ5+8+Q3oosg8UQ9Pl7ETy6VA
 8xE7ga6kRw6nE7iYs/KflNTwFN2Zdd6lkOFYa8cuCfhZa+SNapFKVCeiSm+LhGjpU7aN9zhmH34
 1TFfwXQPUdJ4yzVRYbM76QNci3PmPrR8VwRcupJ6xDrISV49+RCUW0k1uactL+8fk8geKL7fnLb
 wgxASkD1GUd0Z5+3NOdAXu37QEv1u7DoU0SlObzEmEA24P12U1AaZ3q8vTOyWDNW6VWPXyjum/+
 sUrcAvzjjOazkkg==
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

Extend the Renesas DU display bindings to support the r8a779h0 V4M.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 Documentation/devicetree/bindings/display/renesas,du.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index c5b9e6812bce..d369953f16f7 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -41,6 +41,7 @@ properties:
       - renesas,du-r8a77995 # for R-Car D3 compatible DU
       - renesas,du-r8a779a0 # for R-Car V3U compatible DU
       - renesas,du-r8a779g0 # for R-Car V4H compatible DU
+      - renesas,du-r8a779h0 # for R-Car V4M compatible DU
 
   reg:
     maxItems: 1

-- 
2.43.0

