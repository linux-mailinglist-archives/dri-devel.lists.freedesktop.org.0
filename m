Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7D5149FA3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 09:16:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943A66EA33;
	Mon, 27 Jan 2020 08:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA986E2A8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 02:20:35 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 485YPY3pw9z1qqlB;
 Mon, 27 Jan 2020 03:20:33 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 485YPY3N6Lz1qwXd;
 Mon, 27 Jan 2020 03:20:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id PW3gTicwPtcf; Mon, 27 Jan 2020 03:20:32 +0100 (CET)
X-Auth-Info: xzYvJNuWmKe4Het0iJHLWjiEDyhDjKIpikfMwvn4dEw=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 27 Jan 2020 03:20:32 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] dt-bindings: it6251: add bindings for IT6251 LVDS-to-eDP
 bridge
Date: Mon, 27 Jan 2020 03:20:22 +0100
Message-Id: <20200127022023.379080-2-marex@denx.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200127022023.379080-1-marex@denx.de>
References: <20200127022023.379080-1-marex@denx.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 Jan 2020 08:15:48 +0000
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Sean Cross <xobs@kosagi.com>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DT bindings for ITE IT6251 LVDS-to-eDP bridge.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sean Cross <xobs@kosagi.com>
Cc: devicetree@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
 .../bindings/display/bridge/ite,it6251.txt    | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6251.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6251.txt b/Documentation/devicetree/bindings/display/bridge/ite,it6251.txt
new file mode 100644
index 000000000000..c5db82cfe8ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6251.txt
@@ -0,0 +1,35 @@
+ITE IT6251 LVDS-to-eDP bridge bindings
+
+Required properties:
+- compatible:		Should be "ite,it6251"
+- reg:			i2c address of the bridge, i2c address of the LVDS part
+- reg-names:		Should be "bridge", "lvds"
+- power-supply:		Regulator to provide the supply voltage
+- video interfaces:	Device node can contain video interface port nodes
+			for panel according to [1].
+
+[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+	it6251@5c {
+		compatible = "ite,it6251";
+		reg = <0x5c>, <0x5e>;
+		reg-names = "bridge", "lvds";
+		power-supply = <&reg_display>;
+
+		ports {
+			port@0 {
+				bridge_out_edp0: endpoint {
+					remote-endpoint = <&panel_in_edp0>;
+				};
+			};
+
+			port@1 {
+				bridge_in_lvds0: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+		};
+	};
+
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
