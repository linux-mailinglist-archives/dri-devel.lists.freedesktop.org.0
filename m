Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD73BCEF42
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 05:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC27310E2CE;
	Sat, 11 Oct 2025 03:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="PE/lkoYh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABD110E2CE
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 03:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1760153974;
 bh=YHT4Mxhe+zSodIVHd2qzlGnysBWHBxMufel41tGudBs=;
 h=From:To:Subject:Date:Message-Id;
 b=PE/lkoYhEklJyPKhG0+c5YEvVKRGtoyJT956sH78M6lVDE0qUZ/OzNNob0G4eRMln
 WacKU/EE1k/nVtvG445ai6MztzDvmaRiO0aXqW2Ix1+bbvUQz0fWOSjt4f6og/3lLS
 PQ8fK0QEXlwmUv8mFJG9wza7n2sjM/eIhFwkPvSY=
X-QQ-mid: zesmtpgz4t1760153570tb665ba7a
X-QQ-Originating-IP: N1HyOBHa563KXTPq0mhcMxR81EsdSSnrp/MTia0/DuE=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 11 Oct 2025 11:32:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4803160291737759115
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
Subject: [PATCH v5 2/8] dt-bindings: phy: rockchip: rk3399-typec-phy: Support
 mode-switch
Date: Sat, 11 Oct 2025 11:32:27 +0800
Message-Id: <20251011033233.97-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251011033233.97-1-kernel@airkyi.com>
References: <20251011033233.97-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MyOXKpIa1HFPL9ZndeMYdMk/40tGAnx22ksyBxKq1rhRiU/06hPrnwPV
 r7JxApv6GjPUesFh7cXEt2tIJvmGdDdMXiAeh+dk19Xr2EZBUwv+k6Ct3h24gVMlHmUqiA2
 QDo6JqBHKnOdQyQMgk6A1TIyjQuOt9yQCPd6tVOeIvhF0svB3uWA1oyHFbPvjWWVvT40byX
 xjVdEMz6gduajPSXM2IOXs/eGXmVlmf3zl89GpXySONaaRp8knEiSYz9GC0oouW4U0tRjOP
 X6LwscOo8tqcfcAd3TeQ4xOLFOeUxAlQG5qZNDDnyu8wgWbBPO0bGvAdt8ku5N04Gg2RmBT
 Y/wzM4j3N/kGm+G4LRH2+Y/JdnJKNYXs4XLEkwMGOSEUckTN+q/Du1EapUN/zhBRVjcGfwF
 ghBPTRnBYLkDbs6kTVTnqCdwx6P6SSSIjy7prKFzganQcxlhSUYu5wBkynKa+cl/1ppAHGt
 Wzu72e+ccA8Z7yDEajehL2/fudsVKx2rvWOI1HYuM7DrWgBeSQ8cpxZPvP1z+Zc2YG/ATf+
 FoOp8j+TnumowQ9OZii0XdPzWYLny8wsGbqoeEwj+Lw3et/zltMN2uxppIdbf8uIvnRtqm8
 g4P2D0sixN9MYJpYRdovEcwZCF4mmaloHRW8feVxzdcEOv5oleLFmhE8jlUx4iwjGssgLoj
 /hfAT3WPgCnmVEPP8Ljeq31YCMjgoY3iMlEkrQvVHcVxEM9eSi4/yZ0Uhm+f8BySdaZzDff
 pQoa5F/2jtAMW6rnS3Rb+IX+9UxhKN3sPuptFY63HFPLz1KOqcdiA791d9sHG2xdsoF14+S
 Jn3WzSzBanh5BZyJ+uiw02tZye710HP77qJdcczXt6JvQR8xwn4r0FAyGezxcpe2RbXF7cd
 3F/+cjsrt48I0Vjn6btBVUXzb0YzXWN+t35fFp9oLM6DulNTqfhngW6FrLdU/dpN9Zu6SO6
 GrIefH3ygmtZcpCEAQ8vas8Ppks3U1Pl+SS+J0ElEYW/+b0foxaN8J8+36PsIbMiOfc4=
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

