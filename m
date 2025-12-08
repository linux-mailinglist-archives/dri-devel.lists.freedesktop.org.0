Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EA6CABC09
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 02:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9870C10E37D;
	Mon,  8 Dec 2025 01:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="m5OfjLA/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5A110E37D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 01:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1765158934;
 bh=26BNys9MtzTfRweLMQzeXqwDzhVXLyZIh9kJ9w6YpoA=;
 h=From:To:Subject:Date:Message-Id;
 b=m5OfjLA/w4B0AgiE+5kPJ+F7EcQ7/5Hpu3r+VrFtmG3K7mtbhNa5gIpKTxVU5H0km
 L3MQbu5j12ZvoveBAefKlffdyoDbJDRizA0yVk8MpVNKTjXs4uR+jHT9layYD3MIPL
 Pp/5f9psdNDlET0PXRC289Clh71rknZS/YSGfxX8=
X-QQ-mid: esmtpsz19t1765158932t5038dae8
X-QQ-Originating-IP: A0v0FaGYKIPVoze7Vm4qC1xZ0nc+XoFwr/1hG633FZU=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 08 Dec 2025 09:55:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5449390531767649988
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
Subject: [PATCH v13 05/11] dt-bindings: phy: rockchip: rk3399-typec-phy:
 Support mode-switch
Date: Mon,  8 Dec 2025 09:54:54 +0800
Message-Id: <20251208015500.94-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251208015500.94-1-kernel@airkyi.com>
References: <20251208015500.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N0NSl6AiU37htVjSHU4Mn06OMjO1EtB0Vpbb9vGsAr9bDPFns9ex1trj
 kW52m6WVbvC2h+PkhIrUn1FfFYmtTppTnFdjyr9Ohw0YYMeOPlDsInLKngHSqKohF3HmnUt
 tf0Ik9GvVX6dYno5sNBEGYAC9P+l580j4TTL89nRnvCkjJQrn/+go7wi6VScBNP/C1iWcsu
 aC/RVz1bIVyQCIXZLTUx58HRR+FPE20MCA9ylsTbz/zk6Q3pNKQs88Od8FAnr8BTWLZotuB
 XwlJisqmKI9j75ghswOXNhG76GGdZ4jYhHBPs58W4QRoVtky9/BVk8pfAY3NwRhvghkd6py
 0wpxpuTlAwtOR86UPhoClaFOw43AN4ftzw+QVricLYGENRsYuGEB8K0WQIMmqPwPJ5EW8c+
 nUAFKUwVZmPUkhYED4OvCaExotIoTHqzMIslksSmX5Z4jJLacpl+xcO5Jt+ny7SNnQzFIuG
 t6xEyfpUp4x/BERoqW95sVh9oStb8n9yg+TxiXTQtPv5UCW8cbL7kz11GNaVq2qRVCZiUt7
 b5khRikb4ak1C7vJ4N0fCFx4TTGnpoN9w/ih65GmESU+rIBJfb2ZElMtT/OtEFuuxQTWHFb
 NyLU6q1mS2tmc+Bx0Osq9oST7y1YGDyc6wooJIhl9XLj9GAwYtwgOa4EYz4IUuhNNcS3Az3
 Kk5mThKtKOtf40PmjCJGdNLCBxPhN5OEEwXokVE302Ld1jTyg36MtMYtWKNYpTwGkzgsJIj
 t8Lo/lQjf8XhBEnf4wzKoxpCr3QrxzdL+8UZo5zfdexHzfF8Wiy7tBUBvryQOLt0jbdpS3U
 L2cSz6+vXkLyX2fbOxQWnu8txarMDP4wPUnFEcMeIAg9PPykk9RfTXCIFO0WylaQtx0TZcb
 zJGJQICzJry8r3SYGtCSg+g/HZfUpV9IsJvR+tVk6Cqa7wW7ggdAkcbV7Mbprvigc5ycbpD
 dsgjWoDWIOll90qlARWl5XbLTjcJn3MLTzMABfIdsQwvP0twcIDYI1cNOUXZfhht9EEeLTA
 puhyjFFw==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
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

