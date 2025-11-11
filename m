Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7446C4D2DE
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 11:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52CC10E550;
	Tue, 11 Nov 2025 10:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="d9zurzv/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955A410E54E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 10:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1762858274;
 bh=1fj6I5WadX9tXddUihY9i9o+TqzOQO5XPHyy3i2XmCM=;
 h=From:To:Subject:Date:Message-Id;
 b=d9zurzv/wVc6AoVpb4Bcj/GR31cxA31DTrsbb7cx5r8cJoliuoGkTzqBtJZQ1L9UR
 td9vXDguW7MU73i4+xnDyPXVyFH+ZYTqknZqA7yWCJI3qXqOPwlxs7HD66+nG2s3mp
 d6fOijMeZ+/n9JjtQfm+Ufydt6tFLtv4po6vdayU=
X-QQ-mid: zesmtpsz9t1762858265tfbae2009
X-QQ-Originating-IP: uJyi1b7YJXrK+cM8L16DabO0ulPWhVW0NrJkWY9juG0=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 11 Nov 2025 18:51:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13153881317845399117
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>, Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v9 04/10] dt-bindings: phy: rockchip: rk3399-typec-phy:
 Support mode-switch
Date: Tue, 11 Nov 2025 18:50:34 +0800
Message-Id: <20251111105040.94-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251111105040.94-1-kernel@airkyi.com>
References: <20251111105040.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MHu5q+4GrKKGE2ty0kH12zF2Cz22aIhrGN/T6WF+tocIB1jB0qIfSEpI
 Dzxbw1Wpbs3QsPRI+vf0U8mqWVPUFVMdOzfLEaBYRM/l/vTh6B+cJ7HKjmsJfONmqBT8671
 Xg6w4shF2MhaH4yuAnl96h0izdT2uzo/3WdZ+MniJCOSDwRQe1eqA3DFjIMthcPJQRSvLYv
 w2g2g44BYCVv+zkE8ko1LZCG/G2x8Y/eL116Q9Ny7gUj3syj06EPwCHT5cCetMkU+eIo5xs
 vJepPJ4xsoQy5xfjImpuJLjnYsGGbQiy8e/AmKt5UrTawWZPV9AehURuX03AAzGSuPHi5tV
 zOoazgra/ZVevmd8I3NAyH85n5EUARDmZVFuLCowaAhkxe3h9FAq6Y5F3uTKuV6n+QvL/wm
 MnS1TRhO2LA8nTebEDjCHZFCIECDRYQoJ6X5UBlgVB+0CmI6FmVcktxzOyALunUpIrQ4unt
 9BJxEfIccJylQzWJoj34hagqcgmOaIIvZjx+akLinzotBa2TWtvCLBUffeYfb83Ayd1dytd
 K8V7VVBY6YrTskTDHUHmFT3UCsw3dR8yknEvKXtsInMGNxWCdRBh/WJ9cVcgWrFjh9UHn+Z
 WhmQ8Unu2zRUtAqXU4Wd6WYZpZHT4jRUZ3ljePFDW/fNPTKwhiTP9+8qK67HAJVdcj7b/2S
 0jf68PVZVGTNCMkonXbcbXrFODH5hIhojTGBb5Jtzv7mfQK4AaYIsK2GA9KeYSS22OCH6ew
 aDlakIwsNfPK858GQcJe3V76857+KIsb44dDTmT25kndRnQIDDxx1zJL2x/qETd2BcPGRQA
 uBcEeK0deLZWZrfWx+nqH79VIiD1mN8Dpp4+66oDUwy2sAvkSe1OncxNq2TL0OHa5UD/ZOP
 uRznXVnRmm0gwpFBtNA3gn5EGxuhbk/+8If7Jo01feax/SWw1z3pMniHNoisBHLF+pbCJUf
 e8L0+7E9+YANQ/BD0XOeOXKbqlbjlQLrVoImCV1UUCYF4aPKqvv10/BsNDI5T3ZY0g+ulXJ
 R8fpG18BcpvLVHFe3MdJkEaREMuOJgDGXPeDPA0Q==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
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

