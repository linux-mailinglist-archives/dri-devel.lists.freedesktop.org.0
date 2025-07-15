Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6965B058B4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 13:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443DC10E224;
	Tue, 15 Jul 2025 11:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="YuIUcMBu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.74.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D89110E224
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 11:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1752578714;
 bh=PdxuukrMJyMvzJ16KhGFmRwb53DnIsrK3r7HucbSbmc=;
 h=From:To:Subject:Date:Message-Id;
 b=YuIUcMBux9vcBm31tT4VniU5BFwp5Ncdb+ntuBiE3Upec8MzRfeu+YykP8ThbULz+
 VjO4Ial6lHC+GNUzvOpxkXq+26Kz7L3amcPQ6icZ0OK0B7fvmR8mX9g6orUSJXfUP6
 vLPZcCLIDb2rcCMCBoMl7RXIGIGxxoYhuOIOV4io=
X-QQ-mid: zesmtpsz3t1752578712tf0188769
X-QQ-Originating-IP: XVdB7d8ltncWpCfKxfEuv57ere8QMwHyZ9NM2AK9eVk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 15 Jul 2025 19:25:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11091658648405409275
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
 Diederik de Haas <didi.debian@cknow.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] dt-bindings: phy: rockchip: rk3399-typec-phy: Support
 mode/orientation switch
Date: Tue, 15 Jul 2025 19:24:53 +0800
Message-Id: <20250715112456.101-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250715112456.101-1-kernel@airkyi.com>
References: <20250715112456.101-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: OKKHiI6c9SH36/h/9qneLh9I5MxAB90IO8g4kzM0Wgvv6GpZEEm4QTxW
 n7YdQKFjCn9IcqtrY+28B01QzRRH4tbGXtRIPiNO947eusZ0xYiSzxW8xg4dl15MKAyumJW
 4ZzY8CH7keStm3tMSod/FryURZPpBmNv4SJ2jbiGVtNiSTcudvW1aKAV1p/BIq1VFPcf4dA
 jUQb2MeoZgL+090l9q7OhlGwxPaHTTwBJps5mqnyEdetSxq/MWsgnuSKnYDosuyQtwX2NWc
 Oh8YGdAwMJNZqJswbrISqjk3+wy2IZc39VrPWkdsFuMJ//Nj92Me6N6oaaTy9CHhZl2BtDR
 MiE/7RSamUNxMole/gTiLa+kdEMT4sF0PbmnlA/ec8BaNK082uTAQuDY5hrac3r3JAN+GGg
 4zUCepmVRLnRM55M/uM08QtLUbuXcg3Rsj1Y8zpQFuDMfC2ccFFbd9//PJUHW3HliLLN0Rs
 C0bmVzPZh3GhEMZb+0OcVEMlRteHSlr2MK41gcVRExF1vujgk3eWphlx3ax0p1tpQUH/djQ
 o4E0/RrHE30cVikKO5Gd334FcxcYQ94hFar7qbiWl8bkH+VmpfSVUpC+shPx9VnyTQa5BQu
 kPFAk6Vp5kkOgU1d82HsiaMxixaD22WSmokDMRvMFLwOanwVyYKZrK8elKIPuP7DZsuY+xp
 GKYvVTEH2uz4XHIvhY9aQqHPcusQfPU4VTFrLSQgnQ/8opbaQvdo+0KCpiJnpBTI+sicbTD
 4Nj7zTQXOR3zsxbqOq4z1qZ1wUc8iAEeDGxbi3bN+M/w9j/q7ZpbTDPe4EDzn+ALTGsVD+Y
 IeLoHjKDax0X4z8OXKLhzHDMw047y1Ocb4Z5xZa3r6/gi3+fYWqcbywucRDZjnntdRBMtgU
 Gnw/YqvwC9INC/LuApRHEQMKolN1XS0hl4tFrljJyWjpSclorEJc7esqHPlJmI+FZ+y33oo
 MXxECCUc0KlTLhYNDsfpb881VWGAD7H5LFr/q+O7LBx3A6oDGztibL0VFAlq1Jyq+5kFRdn
 kyBVoFSg==
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

Add support for Type-C orientation and altmode switch.
The Type-C controller can be specified to handling switching.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 .../bindings/phy/rockchip,rk3399-typec-phy.yaml    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
index 91c011f68cd0..a885c6893a90 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
@@ -43,6 +43,20 @@ properties:
     description:
       Phandle to the syscon managing the "general register files" (GRF).
 
+  orientation-switch:
+    description: Flag the port as possible handler of orientation switching
+    type: boolean
+
+  mode-switch:
+    description: Flag the port as possible handler of altmode switching
+    type: boolean
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node to link the PHY to a TypeC controller for the purpose of
+      handling orientation switching.
+
   dp-port:
     type: object
     additionalProperties: false
-- 
2.49.0


