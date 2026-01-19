Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C104FD39FF9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 08:34:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC2010E378;
	Mon, 19 Jan 2026 07:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="e2gkdehO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-usa2.onexmail.com (smtp-usa2.onexmail.com [35.173.142.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8469B10E378
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 07:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1768808048;
 bh=Js8LohQ5FKnKhCP/1X+pjHvtWvmL3//jFEdtasdSj/c=;
 h=From:To:Subject:Date:Message-Id;
 b=e2gkdehOZDPviFFMiIl/LdzzIXNcCd9oY1KGqVS+YciNc70CV6Vpxu2otLqVau5wl
 TvLx4q709lQXAB1IlZVODZUE+XL3IsZ7ui2EwKDRN1GtmaYqs9u/WPQfGuVqEy91QS
 IPBYcLSJOqU5tp4DqlYUBeyryFE48R9PWi0qpl2I=
X-QQ-mid: esmtpsz17t1768807894t2b9d6dd4
X-QQ-Originating-IP: AqKRKbAHcm84t5Ai8LOV/Z1hHzoNbpXZnvn4/yP/VCg=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 19 Jan 2026 15:31:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14299818678048633841
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Amit Sunil Dhamne <amitsd@google.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v14 3/9] dt-bindings: phy: rockchip: rk3399-typec-phy: Support
 mode-switch
Date: Mon, 19 Jan 2026 15:30:54 +0800
Message-Id: <20260119073100.143-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260119073100.143-1-kernel@airkyi.com>
References: <20260119073100.143-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M3vv73qU6a4uywa5T2AnRL5ua28QdsyTAp/HnpZ3aJrp5pQPnFuiPrum
 HhVpjyBxa5aXyqXijrxUSQPNFt34s15IVtwbGU/TX5kQgrvQ1nHGbSHw4epTpV2QcgSWXN3
 w4hZIqUugsVptkx+zPA+7zrbj5GbKl6FWcUxe6ZxfGkCdEQw7mdnzsE3beMGdI/6RMA95T3
 zxnv6ySY+KJgdBf6oQJiotu6slPY3gJjkvM9JxgaANu721LcoGOAiGTAAMDbD1RRKcX8Us6
 XEmdPUWCCif5NgOQzEvjSfnOeundTqjp5i9Wqa2bZDeE4ZNIdK3tFzFuIR2Sa+49rdOn5BX
 Zy/NcSJj1+R/+LKlix3ltQR7biB3QaGxgMvQT/4p+lqodvEOKzPESNNDu8xmX62slWaY7vL
 9NkL6qffQqtGvS+f0uKq53PizW/IXm9CIW5B48YbFJln18JroBNJJ3t3L/KQ3Nv2fwJevpW
 QxIeYUIQTV/PRyiSHFA+/dYpWst5qvBfEgi19hDZe4hgg5MroUyoBxCdz3bmhPKVMnSiR4Z
 G9QGkiGB+yUSVPJcs7jhdWJNOGkmZvrseR9hL0RyB5EOmXBTh47b7PnqV6RyKfVVadP2T42
 ai8ofwHoT+F/pIzPUYv6vJhMCLCHqFWiu/l36aDbehlqWLUYSVEfC22TlywDoL+HpvrS/he
 BVpPCG1awndiic7s89pf8c/X0F8ky9FQm0zQRMrCvC8K0C3BNQLmGHCRe8/Q1YkNEZeX4Rd
 Nw4AZYnyJV3vAhSJf6R/Mlchrhnsvasi4IkeeFSnnYt6nGfZ24snoilDDgdzdwMOrvgOHWb
 Z26LDO5J3fmLBqueGUWsXuoSAxPpCTI/Jv46TdrlevQaEt6u8P5E4haeVHWjWsO1I3FDkcA
 2uFVCYt2KCl5UEZpOXi9czNts5BYvfREiJHsYlT1xymJxLuqDzIPlukZdCHG3rAVFFJ6I35
 VRwv6SQu4iSOjnaX0ueSrjRlVmkk/5dYSU3to+wa6dm2f9pXzOVvEwgXo6uz0EqzXinDrK1
 3djqbj3g8vc9rtLjQLQtf8l943l+2AITj5hdBQEA==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The RK3399 SoC integrates two USB/DP combo PHYs, each of which
supports software-configurable pin mapping and DisplayPort lane
assignment. These capabilities enable the PHY itself to handle both
mode switching and orientation switching, based on the Type-C plug
orientation and USB PD negotiation results.

While an external Type-C controller is still required to detect cable
attachment and report USB PD events, the actual mode and orientation
switching is performed internally by the PHY through software
configuration. This allows the PHY to act as a Type-C multiplexer for
both data role and DP altmode configuration.

To reflect this hardware design, this patch introduces a new
"mode-switch" property for the dp-port node in the device tree bindings.
This property indicates that the connected PHY is capable of handling
Type-C mode switching itself.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

(no changes since v5)

Changes in v4:
- Remove "|" in description.

Changes in v3:
- Add more descriptions to clarify the role of the PHY in switching.

Changes in v2:
- Reuse dp-port/usb3-port in rk3399-typec-phy binding.
---

 .../devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
index 91c011f68cd0..83ebcde096ea 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
@@ -51,6 +51,12 @@ properties:
       '#phy-cells':
         const: 0
 
+      mode-switch:
+        description:
+          Indicates the PHY can handle altmode switching. In this case,
+          requires an external USB Type-C controller to report USB PD message.
+        type: boolean
+
       port:
         $ref: /schemas/graph.yaml#/properties/port
         description: Connection to USB Type-C connector
-- 
2.51.1

