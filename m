Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D85C189D2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 08:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D150F10E701;
	Wed, 29 Oct 2025 07:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="ZP0potWU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.74.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D041910E701
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 07:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1761722105;
 bh=YHT4Mxhe+zSodIVHd2qzlGnysBWHBxMufel41tGudBs=;
 h=From:To:Subject:Date:Message-Id;
 b=ZP0potWUGEJJnJlGR0dpTvyFnp+9HW5m8eBLSzghIm1BMioCwhr99HXC/coVmaCMa
 HtxkBOqqvDRRNkXj5VRArWuZhbBD+Jo1Ueb0oNmyEFWCq952svOf6Aj4RSiDA+p4up
 R3Lk3O7boUzjw4hYgDYBWUnWT7qvtPl0A06J1Adg=
X-QQ-mid: zesmtpsz6t1761722103tee7fa66f
X-QQ-Originating-IP: Ik7AVVI+4BnZaf1rl0zVbH4aG4jaNbSh2N+2iERqELk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 29 Oct 2025 15:15:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6689497526499472264
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: [PATCH v8 04/10] dt-bindings: phy: rockchip: rk3399-typec-phy:
 Support mode-switch
Date: Wed, 29 Oct 2025 15:14:29 +0800
Message-Id: <20251029071435.88-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251029071435.88-1-kernel@airkyi.com>
References: <20251029071435.88-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NNgTDNpHPdfoSadMONWltYKZnnLo9D5gXeruG5XLO8PXo4YdZ3JDGtAE
 2N9VIyPNwwHpVdBAJI2cqrO5UHF+TtEZKj95bVVA8lvWkiI+FCUogw4wtzhlbKu/rtcm2rD
 P+IDwVvQH1haTBPusFg0Yh1Wb0x/zuq+uUT+xKS3bzzjZ19Dxn9MIdfAGw0KHb+3NDJTeLE
 kAhfhVCaRp6Ffu9NChKK6nKWB2tPgG/HuO/aCcwMQiYtWl/0LOSpZcdTX/knzMAH1lVyXuh
 fO5T+2tgCji/7cMjaPQwKsc6ICgf96396B5YCJmEp7ox2eskYZ7ccqYqB1WKQ9cPcOeXpTa
 oRArcN8mIZc3mvPepo1KHJ/N3kJhZqe5HJLI6w78LJor6B83Mnjw14Yu6IiGUVpO//3bU3s
 DIg/zkPCz5SzFSIGFm+5OTAMyDIWUryvcJ/7sxLDVpOEEN/Mf0Fk4h4o7+3mJ7vW0pkSQFa
 vwLnIAlgOs1H9TY64pv8bLFdD0bZgwtnlnsFaNfjPp+RxBXT3kGB2JBqOSE89CWpQpgEJzj
 kz7yaVr65mQ6bySG6qDGF1mf+ffYGUne5zZq08Jki5PLpyWCOMPf+sH6uisY0XLfULhZpYt
 O0MfvDKBh/FjeOrc4SANyS28m0+sVyTmZCzkI8uoZlOQ3iqaHxfAlpPH65XkZYfeF+7wy62
 0sNWEgRGWG436TyAoaCoajme//38vIG4zjJ1vu4o9RPxMdD/hC07anjw+8Vbb7dklVyR3dO
 4aO6W5k4S1bkWZZFfU1/JkxzIEjtUrDcZxhsdf7Ce0VDZsjnXGN1fYC4jYHbrLgfU5cbVUH
 ODbGGCh3Hl91WoFd4j6f50AfhKLKt7A6OXn2p5RYsDC5Fz+k5hr/KBAqb2u/YY43GsGJ4v7
 Q+wwjNhR/xc/YQPUf/IT47d6DhROonJLs8Gdvpkli0CGsxUX4JmmBj+VlfWofu6wBBgaRX7
 8VjUzMvdvKpRjN97+CzlL704WOXcGSJjjEecs61XN68YxdoDQzEF4N52wYOnHY55+OZGM0Z
 5OSEbw4A==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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
2.49.0

