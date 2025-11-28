Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BA9C908E3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 03:05:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B4C10E826;
	Fri, 28 Nov 2025 02:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="lgEAZWeX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EA210E826
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 02:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1764295481;
 bh=26BNys9MtzTfRweLMQzeXqwDzhVXLyZIh9kJ9w6YpoA=;
 h=From:To:Subject:Date:Message-Id;
 b=lgEAZWeXjxLY62c3ZXHCU4+rgiPPG1Huk/GPthCBMcI+8dXDwQcm/G9l237Adx5X5
 giJdgBS+M6DYFASZJ4s/3ogUmroYjfoQBKuoU/I/Iw3uQJBZTMvLaVDDa40nqc/IiP
 NayHLzhqfUtDCLztY87ydUTouhiHCuUP/FF2iuK0=
X-QQ-mid: esmtpsz21t1764295479tb524af5a
X-QQ-Originating-IP: oW3x0e+rLKqddHu0SO/doGFIJJO2dWUv1ai7nKLeCMM=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 28 Nov 2025 10:04:36 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5493829236187501795
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
Subject: [PATCH v11 05/11] dt-bindings: phy: rockchip: rk3399-typec-phy:
 Support mode-switch
Date: Fri, 28 Nov 2025 10:03:59 +0800
Message-Id: <20251128020405.90-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251128020405.90-1-kernel@airkyi.com>
References: <20251128020405.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NGbyafB8Lluu9jcwbxcdxRy4qRLqlDKdfHtmx1FfSmkyT5h78FxbpPv/
 6IkwGBqV4Q9UVFPUFBKbXxka6kMDKeouci1pNWZ6AK6p4LygtTa4YEgHwKMAtLGxlfKPLRP
 4pnaa0JxijAFJm0ApKQzHJR+pwUD/IWeKmW2SbJy7E5peRVqYTbOsP8mpYvq3MWOVGqPBOi
 67OnwW/zSKU1uL/M+nD+6Qz5Cn2Qqfew1lrd38h+Nf6DDo0bI8adZ4nDZHePsFgzoaB4wtW
 o3WWwiCcgdSoMtURPTkpYT/2EgSukTlmBjQK9kzJQhWLxofrfjdj0E5YQWCtByvVHUTryWx
 2pr/jdLCoigJ26JEAhUnkP0tDGLMJ4Cif3tsjEwwXZHTx+rr8G9s7EHJUQM3fgvU7itY3dZ
 FYC9kGULS5l5mDA9AgMZyrm6xEy1j4BjFFGhul8OFKin3NWWroXzPvgwst+39JYCh8Yg8jj
 RdiA37FAPY1JbjwGk4KfZkxjLpFoejBw0KycCpU8xeQ04aja1LE3xrKh7R7PYRgg+ukfTGs
 Z1SsmIO5XbCtzV/aX+A0K1PsGKalFxH3rXGu5CwBqAl48+xRnimdNPAEWMl7Fy9L+3qeRGq
 KRja8h/m0dyUrjSpbU6tXD8gYqOqTfNzRGrIOEjitsaBkuLLHE9Lo73clPVOZ58QhOnF0DU
 OJZzdDmfb4jcnlgipjrV/QnUrmHywMfUUJWOgKoKpPLyxqzd/r3FbfSYm88B9MNYqDNEVj0
 kME55kak70fB4O+dPKar59qrrFyBBemhcjuU6tDM3mDcMgzF5v0fSCdd36Z2CKuhXKnkp7Y
 f+cyMl9BtQ2u3mpjk4pXp705a0Q3I6fd/0tMavO8qqV8SNExUJ7x1oSJ70ALWKRTNMG32zI
 q2byO+SFwBDB7wKq859CV+wEOiYEbzATqtsnXBn+7D6WFlEhDg80RGhmkot+OguKto1PHyi
 qFhELjdRCRO+6G6Q+xP7QtTSqNcqShJVtASDl2pXlB/lirU+HXfqxbyHLwKFiUaqZcbr8uJ
 Upebxu2YS57EegmEMeQ/1CYvGJgALFlDb1vOelMA==
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

