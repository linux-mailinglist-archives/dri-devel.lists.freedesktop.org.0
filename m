Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 944763436F9
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 04:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA00B892DC;
	Mon, 22 Mar 2021 03:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A28989FA5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 03:02:19 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6F1BAD6;
 Mon, 22 Mar 2021 04:02:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616382137;
 bh=oe1/Wdj5FWpelYYwipukb7KrPvZJeboz8t2tMJQq0V8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JeMvkBuUlkSYTdqIf575bAVcxz7npokYKm6lC8guDCrnkovUfqwxfIcvMuaFhbpP2
 kHV9nNxRL99mKvu5Y1tYC+8JwGcqt0J1Jihf3rbRcO6CNAWRHoyhVT7/gyMDvIvKNu
 VmIH8Ik9xepVKKjh5YFQQDJASjgxK9LNOXwFg1ts=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 01/11] dt-bindings: drm/bridge: ti-sn65dsi8: Make enable
 GPIO optional
Date: Mon, 22 Mar 2021 05:01:18 +0200
Message-Id: <20210322030128.2283-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SN65DSI86 EN pin can be hardwired to a high level, or connected to a
global reset signal, not controllable by the kernel. Make it optional in
those cases.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml         | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
index 26932d2e86ab..2506765cb338 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
@@ -150,7 +150,6 @@ properties:
 required:
   - compatible
   - reg
-  - enable-gpios
   - vccio-supply
   - vpll-supply
   - vcca-supply
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
