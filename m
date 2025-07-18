Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB96DB09B6F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 08:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D92610E8D3;
	Fri, 18 Jul 2025 06:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="erZHmQtp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16EB10E8CE
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 06:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1752820189;
 bh=SfD49mysx56ByrkZgSzhxvm/5yDPMJ1rme9Y1NDR4zs=;
 h=From:To:Subject:Date:Message-Id;
 b=erZHmQtplnoFYs/1j8wNtyHPvv9MGfK7XfwyjHjbCC6/ffd52vRU8uT0HEf6+E41k
 Wqp/cIoBVVPdFJWyQ8bWH9DF8077UOJ62jL+dDKnHdobJs11Pxc6M9xhprfvj7keXE
 Nn2VK4TJK2dOiQ8qD4G+k7PIuCJp8HScG8Aqw5n8=
X-QQ-mid: zesmtpgz7t1752819989t339e2657
X-QQ-Originating-IP: eoutYZ05PQmrVxRHP07fLErhbre+iSdNkklahpAft/g=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 18 Jul 2025 14:26:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5159759228802639268
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/5] dt-bindings: phy: rockchip: rk3399-typec-phy: Support
 mode-switch
Date: Fri, 18 Jul 2025 14:26:15 +0800
Message-Id: <20250718062619.99-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250718062619.99-1-kernel@airkyi.com>
References: <20250718062619.99-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: N3I7nP72NaLr/s4jwB3qOCcv/fd3UjgCoHDUU+yDl2FQT6mPWcfkyX4m
 mrec6HX86ebDonQ2rVtdncK8QLLK+BUsMfjM3OsPl36FBRONPQ2fGz9sChc6NX6weUlrEWu
 YTtlpCTGvWgNh/qxI1Sx1lZq/qZ/suCCIfzo1oBO0kBHMmOheXlmcR376M81rIyWExK8UhR
 0v3yIJcXr9IXBUqwKlblM5GUeMyzULBpRww7JQ0pn6Nzkt3EjwSGIY+hJHzUK7NqaN0ARUg
 X6U0ANgAZleLgvNPsdV7KHRy4D7hieromZCGucSfQ9KY1Ergk/kagcFRpGvQoC+rrDANrOn
 FoqH4K1kgi/s09YSwOg2OpSbUXI5gW3NRq2DqjqR39IUcp/+iGJrF8+Y8hOf7PxfjflaXtN
 cYJx786xcYShUhafnLPxnleHVfLHO+kLPVxuwNQbX9E6zlpEJuaDY3PhcVIK48qfqhitlwU
 vkI0TjaBWUckurLIUjor47PXMLTTp6XUY2RqcjES41sX9HhhDPi1kaPXizO9wD7QFOdOvrt
 aPYWSg5O+td6DxAUcdwkCLIZhivit7L1PDyIO50lh7zKyuJP9KuHMjps6vzyZB4v3lJ8+KQ
 P2UUDFczth12Ev9xKbgi/9Yr+PkppeYho3PGEsovNfdBTzle/QZ9ZNnbIGuWLXwyU6OE/ZW
 qvjyKqBt1Jf4pVEtFFT8SNT4HkZXav9ooWcQCTQWJCEBOXDcJCqxZeID+JYRo3QItxs/1TH
 fVRB7YbYPkfNifLv7gKUWJAhWhvdAwAfS8BcCd6WqNmtbnXHZ+RxrSmkIiXPUr5QKnmAzvC
 Li/k7p/zrqWcNM7HgE/bIHpTGgi5blVPvEYVaj/9ahfGTWpQw1K7DgEeSNKihRmexfhMsGU
 8SE3elIEjPgqbR1KyKBchIfe5t9etZjaK5EORqRM+e1PCUFIYRweiaUSLxbmWzZ9oa5m7GY
 cxHZ1fjNSkpjFHwsg/CsiXMc7vRTNpWXNd7snWhGwkd05ZQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
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

The RK3399 has two USB/DP combo PHY. With the help of external Type-C
controller, the PHY can switch altmode between USB and DP.

Their connection diagram is shown below:

external Type-C Chip0 ---> USB/DP PHY0 ---+
                                          | <----> CDN-DP controller
external Type-C Chip1 ---> USB/DP PHY1 ---+

This patch add new "mode-switch" property for dp-port to indicate
whether the PHY can handle altmode switching.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v2:
- Reuse dp-port/usb3-port in rk3399-typec-phy binding.

 .../devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
index 91c011f68cd0..d503de7c7569 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
@@ -51,6 +51,10 @@ properties:
       '#phy-cells':
         const: 0
 
+      mode-switch:
+        description: Flag the port as possible handler of altmode switching
+        type: boolean
+
       port:
         $ref: /schemas/graph.yaml#/properties/port
         description: Connection to USB Type-C connector
-- 
2.49.0


