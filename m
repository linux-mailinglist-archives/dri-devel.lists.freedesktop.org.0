Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0554FB8EB0A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 03:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6634210E32B;
	Mon, 22 Sep 2025 01:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="uLDs2Pfe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 512 seconds by postgrey-1.36 at gabe;
 Mon, 22 Sep 2025 01:29:56 UTC
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6493E10E32B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 01:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1758504587;
 bh=DH0kcIANYQpdYrJ+4fLx1mc6EkyYA+V45+fX1eNLgyY=;
 h=From:To:Subject:Date:Message-Id;
 b=uLDs2PfeXQOPGdHKdLMFmFYPiZXW5dZry50hWoiJRzDzQsaI6wQw4cJz7O5tvKB/o
 Qufg0mHXvcuYl5ckEyFBnGUCxvfrOof7cPNMnSrN6ExFpHQnGDkkyyMqyc4MuiEq+r
 MTjnIuaD8rj2Had1bKusm5kQbjlJrpQfd/OVZUC8=
X-QQ-mid: zesmtpgz1t1758504056ta726d038
X-QQ-Originating-IP: qyExqdy1sQveIoLYmvNkfjq5s0h65cszYNtSFJabta4=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 22 Sep 2025 09:20:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17474071139763469020
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/7] dt-bindings: phy: rockchip: rk3399-typec-phy: Support
 mode-switch
Date: Mon, 22 Sep 2025 09:20:34 +0800
Message-Id: <20250922012039.323-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250922012039.323-1-kernel@airkyi.com>
References: <20250922012039.323-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MbSuBwOrED9vS5kU34aThaP6f5OSt0QKVRWZ8ZjrkxPpeLfZ6vONwT/C
 gR6d0ncjERPE7nLelSerch+gYmE3798i3Sn/l4MuzbZTscbVVcJcx+4b/LbEA8MQUFqTwDJ
 4nvoPfHp3Vq6PGxIWjDqKYGC7Fxdd3JcThSqAWPoslFvCeMDDVj0Kvv0i2C/XDeHA+ElG07
 NpF2NVBXBUKHP1zR6ioodeSA8XjV8l4eobM9vlTjd+d/wxu3MKj/i5xu/PzvbbL7qI8xG3F
 SwXQVFiDv6tX75xAEOBrgwfuMvw9MM1B89XdNGqO8ksk97gsiYhhWmXHgfNXGBi+eK0uGSK
 xu83yaUV8d3z0gSvVMZgxMt1/OhXiN0YPaMu442dYlP36eGCpjC/BJ4OhKc4tayE3mSoVKv
 ZRJShrY3m34LUzBBQGvE2Zy4IkXYXbG2rYnmgVpgWFXYyCPx85DeO0n17rIjUR9tmHXzABG
 y8TaaTEVmHYqTaOK6a87suGiTOTtojNqG63NQhX55JjdRR+7AuaycMyD+1QyG88alVCsHdH
 jmT266xOV8vkE5rAUsRVuSl3uksGl3aWF/QD9Wndy9cZlKLTjQjJiWED2extK0+GWEk4Sy1
 +3rg8166WKTUFJ8WZXmYt1LXA7G3HcV4x4b+dSXeloSErmVQBlfYcwSxcY25t/mjv9PpXuK
 AbT8LiXczRO+zf5GhrrA3pXzl99b9mGiu6hcpaJu02bpxtGUdgiKa4BROB1XV1N5CtUFFhX
 nIBbkliSLkpLwLUNCoWyKqb6kicO1C54kylD8ZvxvXJRsdH03mDIDd9SEmoyLG9g7FdpUX9
 YT8jlegMyTnKc5BMkom9Uv9RAwhtW2foStVQmmTEYKqDSdEX99nZJvFvaPwJ6c1O9tk4g1A
 TyKPWZDttfyNcRK2ZEMB0iEwThKWCdEoWGtfHOakt597xZcK0qkI1Mp+oXqA+qqtMRwD/CQ
 APvTO9mfJNep/1ECwOt65xe0A6tHtACPQYMGgRn3vo/whnHTtV71fm/6nj5xT3rR9xpiaqv
 sXRMxSiQ==
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
2.49.0

