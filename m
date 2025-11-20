Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FE7C71D12
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 03:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AD810E106;
	Thu, 20 Nov 2025 02:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="mzLDUlMH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B2B10E106
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 02:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1763605455;
 bh=26BNys9MtzTfRweLMQzeXqwDzhVXLyZIh9kJ9w6YpoA=;
 h=From:To:Subject:Date:Message-Id;
 b=mzLDUlMHkH2XQbNViN5w9YUFUehKIex60zmI+ubNGAViFScnQU66WCaHL1GqWdeN8
 Cczfx4GwwVHPg7GMQBx3ZijP3vinqzneAh0+dqrKuJQHv5ZTpwhBF3UBaBK2VXBXGc
 y2DzIW4JlMglqObexfbysUlvZ5CzSrVaS8Yq7h5Q=
X-QQ-mid: zesmtpsz5t1763605453t2f8b4143
X-QQ-Originating-IP: gN54Olypo3pIwlMUyr2ea9GcV0PMJO+w5anSEboDf2s=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 20 Nov 2025 10:24:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15843998276639765348
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
Subject: [PATCH v10 05/11] dt-bindings: phy: rockchip: rk3399-typec-phy:
 Support mode-switch
Date: Thu, 20 Nov 2025 10:23:37 +0800
Message-Id: <20251120022343.250-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251120022343.250-1-kernel@airkyi.com>
References: <20251120022343.250-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OFkferYIfOPlFTYK3u5HpVUH9SRtgtqj+OzBuN0x+pXvcondDWbNsHgJ
 1BUefbCNYNlgtVM9hsFPZ7KvLghFCyBt7MJoVSgJSEcE7JPq5rYi7Cy4eeYf9fqIqTrBjdy
 nk1jpoCzdkUYBX9+GVFnQKsV7yRJOqFVZXT40er//o3rLDlbxdx8tAOMtS6AY8TNxFZZqIU
 1sadI2jbCPnB6OM/cgr+Sq/QTdwxcCnbA1M6ufMWcA46KC2A1eW3J1k6kJd/Azg7zCXHmyt
 1vHFugBin6qbHzOkkiE5adf5eb6rh6yKNRc05GkntcXpmUPrcAzubhoFLGXRA7yPCjBbekS
 UvHJ6vugzOyMP9Zffhdroib6wsNL+A4SzYU9I+xrhGKTDjnmIOMqOiQUehfDIkzDUsEl87a
 lPp5oJ7KuyYV53AS3BepsLWpdJCgANRHWA91i4KiUaHC+dr3N3j/Mu60V3epyFyEenXAmYO
 Qp1Od5+uRBJOqo2Mct927wITM9jGa0HU+FjqFQhOA7XHuI+/Me2mPrkO5+/2cfJdNJqicOm
 jXXoJC2Z9oZHkArhkftWU3U7eE8t7Qm/Hp6uoT90a9/q/P/yi2zBxm474BgoBgpIH8m1Wdp
 AzByp1jIEZhgQ2wONsO2aaz2MPSbu/mIvgw4YRPgRrC2pO3pp+OGPWh7g6wQwefbY72YtNC
 6eUA8DwOrMm2TjX5quxSivqxDPtsV5Rw1lwYyCzDbLod/OkA3HFCvIuXLfq4b+lfocIZcT8
 UxNT9z7JcfCjAfENnwwXLkh9nAWNznu+pas2eZSZ432C9ed9WGfCAp6pIpe3StdK6+D/byA
 WFNrZYYrAxRWnGVjbU9btp3X6oR8PLgQYKRqSVMJRovlmQjS3vKNUDEcdLjFzf1UuVQXN/1
 YbBsSoNlFiM745mP1L35e2wA6BqCgJ1C1kxMAjTwS8x2Q9oRUJOcBEYCWmlPhMFj0HdkbI7
 1tzEkbYYjAvhhIH/o0gztjxSRVRyxttr24WH+iVAEhM5tNmJcigPugoKNH5FPWzLg/tbf3Y
 Mhq8FR4up7e2newkuHRpM/aJLXKrC2exRw/mMtGw==
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
2.51.1

