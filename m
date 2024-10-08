Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E19995238
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 16:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE38E10E55F;
	Tue,  8 Oct 2024 14:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA5610E55F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 14:46:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6E062BFB47; Tue,  8 Oct 2024 16:38:40 +0200 (CEST)
From: Frieder Schrempf <frieder@fris.de>
To: Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Conor Dooley <conor.dooley@microchip.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: [PATCH v3 2/4] dt-bindings: display: panel-lvds: Add compatible for
 Jenson BL-JT60050-01A
Date: Tue,  8 Oct 2024 16:37:44 +0200
Message-ID: <20241008143804.126795-3-frieder@fris.de>
In-Reply-To: <20241008143804.126795-1-frieder@fris.de>
References: <20241008143804.126795-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The Jenson BL-JT60050-01A is a 7" 1024x600 LVDS display.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes for v3:
* none

Changes for v2:
* Add tag from Conor (thanks!)
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 155d8ffa8f6ef..5af2d69300751 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -50,6 +50,8 @@ properties:
           - hannstar,hsd101pww2
           # Hydis Technologies 7" WXGA (800x1280) TFT LCD LVDS panel
           - hydis,hv070wx2-1e0
+          # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TFT LCD LVDS panel
+          - jenson,bl-jt60050-01a
           - tbs,a711-panel
 
       - const: panel-lvds
-- 
2.46.0

