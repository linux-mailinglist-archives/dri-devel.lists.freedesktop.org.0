Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD7ACA2867
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 07:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2CB10E857;
	Thu,  4 Dec 2025 06:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="kRpgUhhN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C4310E85A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 06:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1764829903;
 bh=26BNys9MtzTfRweLMQzeXqwDzhVXLyZIh9kJ9w6YpoA=;
 h=From:To:Subject:Date:Message-Id;
 b=kRpgUhhNfYRaZx76DsJIRb1mmAzUV1NkacCSW0mab+vovGTToU+BdDWRnANi2FbaC
 6oT9ZvwvuIV9PK3dhl/e7FXxj2bfq8iBqqcn7pWnYZyTVUzdtNQIZQlhfYJPedTbDF
 qmcsbXiJK6CWE/WdasX7UGAYOX+5UXtXZZSj8wZ8=
X-QQ-mid: esmtpsz21t1764829901t850da7da
X-QQ-Originating-IP: wgvjrv/PRLD41HmZk2wez7kJyb7vhhQ1dL/YivSoVYc=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 04 Dec 2025 14:31:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4498374680737007808
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
Subject: [RESEND PATCH v11 05/11] dt-bindings: phy: rockchip:
 rk3399-typec-phy: Support mode-switch
Date: Thu,  4 Dec 2025 14:31:03 +0800
Message-Id: <20251204063109.104-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251204063109.104-1-kernel@airkyi.com>
References: <20251204063109.104-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OAowhIcaKHQtd6oVjnadb7YVmufdYoLBT/Wp62DQ6NveB2hMCubXS72/
 GWhhVMJnPV3eKOXm71403zTDlQG7Wf4sSPaUgsZkLenDPrELy/tJhDJZPWRSyXJDuHRkFIj
 w78S9rQlf4pldZDmrtxhdayzNblLj6TVIYvZuIP2p75Y4GNgZASTRkMki/pw9kyQkb3l76p
 ypBuRBt7D580ou3NqWiBPXuSz/+HJ/H18xw5BaIIrHJxTlgBcN6fSaCTFXc6Re/XSjEfvFW
 f6Ca1BOvY7HnJx5Qty00iShx6D3yosc+MSiXm82C9S2vvmI41X3xSOTMX+Q+l7VugvBFh9T
 Vnxd6cRso0bJIWZTs2Ec86a6ZrKdeJHjM50VehRbI2M+DNKLx10ttqvq9yXzkaFPPSZ6ikX
 9MrKGkhSj6NDWdmt1UYd7HPylSzOQnT5DH53ueyrKbeoacgMvcR86UlNCcYpSKhcIhL8VrE
 2xVj3hleGvayOA2sgy/lhbdeQjEkjarcnvb0/2EY0+rWm6SUCFkudlt9rgWq7QfJGJ/OKh+
 zh93EbnSJQAeyVq9BFX8gsCahNs9SgWqRfvR65aQLOfCdTPVDs0VNsnsAr0VxkdbxBa7LzM
 hcrGqIbVUgCR3MBNR/KEJ4E3GuqWTFzVMSyMQzE73wPul7CGyMMYOTj+3y27CCcp8YbXdV/
 lf5lwCWPloqZIfN736f8O/CWE5krt9+Q6rVz+jYlK/mi6n4JW8svclPeUxrY31OQq6t0Z7W
 LKDqVdb/jGqpD9qAN7hoY9KyJJMDwoT1NwENDPxZbg7yickBxUltxDBZBryNcdoPj2VYn0I
 GeIPYXbVF5x42JZLkHugJYzvIAPSPQ59Cb9yt+i3KR6Tq9jSon4Pk6YX1xjqVKJzX9mk14o
 k9FM2RufWsforlYV0rdpz9LeepVjcy+MxMzUsClLcdCsAN7/C9MF/VqBVOSuZFSN1qfy6WG
 LjM+Mh3kEOu0E8X4O+gEnNjRBbTgBxU0j59PE+ZAS1hJZOIAzZvWsWui5z2XBVm1LF5PG7t
 hFvasZkvo058WoYfszDraavYoT6gN04R+ilxNYoA==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
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

