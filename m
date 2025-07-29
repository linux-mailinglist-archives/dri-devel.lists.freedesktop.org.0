Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B83B14AB3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 11:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4447D10E5F9;
	Tue, 29 Jul 2025 09:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="FPz8e6D4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.64.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A508210E5F9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 09:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1753779823;
 bh=q6Q48lBZu83JxJ63QhH8HxOwFpopi36sswkLOu+jOhU=;
 h=From:To:Subject:Date:Message-Id;
 b=FPz8e6D4iQmgvt9mxFhW6ccb4ZD/Sk4kT5sJx8BVyS4DRauaSIPJuRW1LhOEI0HhV
 DXIpt2bgHX+lNrJNLMtub9oma/lyRayYwSw4IjfbE+9h5whqv0CSMsjyLZC6YVgsX0
 9NTl+C6RWCCNrZ6yQuChvqeQ+a9nDLlWCKMbArhM=
X-QQ-mid: zesmtpgz1t1753779643t83ca4cf2
X-QQ-Originating-IP: GNy0TVRpqK5gjjPPYnOaHZTZmyoTUAn1duABOXp26z8=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 29 Jul 2025 17:00:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17940541300271697831
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/5] dt-bindings: phy: rockchip: rk3399-typec-phy: Support
 mode-switch
Date: Tue, 29 Jul 2025 17:00:28 +0800
Message-Id: <20250729090032.97-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250729090032.97-1-kernel@airkyi.com>
References: <20250729090032.97-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: ManQ4wbVU87YOEVyTMraeS8PnmTdOWnPQ1cWFhmIslSgp8cZA1jGf4CK
 C2vorzfua/2Ab3J6TDkkwuQ+ooTmP838VK1VfcjllEtvYkFYX3gLu5E8Q9wzROXwf94Dxw6
 3YHmw6pW22hVSdv0ZDfhNfVy+rklUK5KtAAyP9+dflMUBZ+RskWVSfz5ZJn1LTlUeDksAVr
 q1yUPl29a5+MNd0/dUM/nAkRMdik1jh9caQMG6ihcOGn+kkklcgqE1N/3ikcCSzv6Zdix+/
 Gwl7RrCNaVHeF9MbpT+HbpbG1d2Fj9zKZhaL+kG/b3jjtOnBruS4TIT5nzN0+danbZ+OpKh
 jhwt6gBhRFyldTXMnI5HwLtC438PmGVeUswii5UeNI/VtF0q/4uikdl6hgZ4ItEERNXw55T
 5E9QP/GO5nCn4HbOD9HLfXMzdEfqBbzwgPM4HypFhqR0QizTUW31X2vowCXHwAgd1ZaG+B8
 AWX2nARm9a48BjlIoXddQLhW07S5UFmdPJfOwK1ce49pGz7qJk8m0diVjX241C4Z8a0u+Sh
 Ne33/24ZrQAqFBZProvgkliff3JcBAlAKnvoWdJ5Ul4cnMWPUO9UK6RbgXQuqRLUJ1ZbgSv
 HpVZsOZBLW7nn/pym7mMxmp8RdKaIvn83xo/4g1FPHgdhDg59T8424Myg92WPHwj0mh4B5b
 1lGi3rYY7yJxt/j8PO2VcuCgpJz52vqXoQsZxwu4/u6+uZlL3zKgzDcfMWlYKBAk6gJUwVP
 zfDEGUgjiZ7O9P8g1VZ9Sb9azy4kaicSoHwI+uGgjMy1byIId6JNPKrzOoyNVHzgVAlDZUk
 t/L7EIX9t85kXmjOAY6jpcGlnRvOez+Vt7RJFcx2ynJmMKK+FAx1sUP4CmNzgKrbuFlKDCC
 XeQnAeCLELXkXGChLt3YgT0Jo4yU6olw8HlVT0MWF+hnD5V8Jz6FEw9hO+6r/VV10wl/Ri3
 YRH3qlzKwUnXQ73c2ZZf8hFDt7F2UMi3B2lk=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
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
---

Changes in v3:
- Add more descriptions to clarify the role of the PHY in switching.

Changes in v2:
- Reuse dp-port/usb3-port in rk3399-typec-phy binding.

 .../devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
index 91c011f68cd0..ccbe1c9cb0bf 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
@@ -51,6 +51,12 @@ properties:
       '#phy-cells':
         const: 0
 
+      mode-switch:
+        description: |
+          Indicates the PHY can handle altmode switching. In this case,
+          requires an external USB Type-C controller to report USB PD message.
+        type: boolean
+
       port:
         $ref: /schemas/graph.yaml#/properties/port
         description: Connection to USB Type-C connector
-- 
2.49.0

