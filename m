Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DABDBB058CF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 13:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D95210E37F;
	Tue, 15 Jul 2025 11:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="a6+e9Ch/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 300 seconds by postgrey-1.36 at gabe;
 Tue, 15 Jul 2025 11:30:44 UTC
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E3110E37F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 11:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1752579038;
 bh=6Q8tj7y2fVh1DqqXLpoIzvx75MH7E6vfXU9jWGAciCk=;
 h=From:To:Subject:Date:Message-Id;
 b=a6+e9Ch/9PbUeAv2VoDlGYt0B+BmFfnh1R7gnGTGqWnRdCIaxAlNt8t+AFIZt2cHo
 LUDzeudMXrZJ78dvoIRLiQDyjmi3BabCfmlg5MvwiD9PkaIcboqjV4wFZc5std5A+q
 wccWJtW34D0vYQuT5qbFv/IARq3CwAJ4jeAdrIOE=
X-QQ-mid: zesmtpsz3t1752578709t1424522d
X-QQ-Originating-IP: Y2jgY0DzpsnsowblI/Y8vYsFKW2TRFdQuFkynBZV9Zs=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 15 Jul 2025 19:25:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6650864007286814184
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
Subject: [PATCH 1/5] dt-bindings: connector: Add displayport connector for
 hotplug notify
Date: Tue, 15 Jul 2025 19:24:52 +0800
Message-Id: <20250715112456.101-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250715112456.101-1-kernel@airkyi.com>
References: <20250715112456.101-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: OW4JKxETGMY2/WNlNtPBdQP+QJTNc0SLe+TAzifsFeeiMbCPHsTkNiHM
 PvwiY9GmX1M5yHLCqSp1dBvr/hXbdaA8IqTq9DF7cfrIJ+Z4NsE0ZcncE7tzeY0XuFN8/As
 K6HQ7kduqtzP2T7U37L9HWwuuYW47hR0V9sW32TzFuRCYXmhsddccjdUKaS1WqVM0n5rWI+
 x6EsyoHE7eyN7hcBBeCa0jggiZzR9/1oKIS8B1DiKQg5zp2IvdUZQyOGAufQdqOuhT/WcUP
 4TO9FIx7nj1dXGz5ZizOoJxqNT3h0jrimcd6kYnqdKOyOun0UV60I576a20RgEHbxxj0wMZ
 AX18M954RFWzjH5gPWTkUzTCLbvRF9WKSOBxyWlGUgL9CP7TgJIdWtgCC7ikBaQ0J7qpIVm
 trQ6zmMEWuk2azhPwl+0W/UCuxfqhH1oCI369/5fFe48zshahXAgWrEdRaR6ItfrLMWd4FM
 KtyyZa2HJG7TQBBGTpftvPLSShAohUY5zMoBriRjXZU3pZcKoYfn5w5e2zBOXFRqAlhsyeu
 IU65nTUBQ5q5lfyFw6dLVFBzP59629LHj3JdqPy8MWX1zFvk5pwv+RuK0QzTZjxWmHPoDyL
 8H3PDRe84+wjlnQdBfHwXOxMvm2L/xNCmQzrpdSToVk62/BsftSm0rl3mTF02Tgnchto/Fk
 Ehfs2cDlXzLlZai3pqXBQfrbJElES+GG++4W6xXuhD38Qvwxh5PZSPw3IjaOxg1Q7wO029f
 nLkiQs++Blk3Hj1q0VeKAhQCVJEKunHLq1/sYaf98p6E9+NcvaI/xaFKe5T5Y4GRHwDhrJk
 5BsyAl4Q1tJkcVQ9CTeByW2cGwyMpCBpKHRmcJXFeftp9EeiPDk9WcRzVTBWGomiaJpP+E0
 OoQsk9gxr7fRZn+yjI9njqBiSxJsl3kQQZ9iU7mh82P3XpOWbja//0YfZ3OYPXJ4W6vF6X6
 PzOFAIP6dsCEQTsIV0uQWhxLzZJG1iYjULxYSJUaWrQJbRIvj8977nwLITD7f06VdykKpkd
 0JfOAPRQ==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
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

The USB Type-C DisplayPort alternate mode driver will find
"displayport" property for DRM hotplug event notify[0].

[0]: https://lore.kernel.org/all/20210817215201.795062-9-hdegoede@redhat.com/

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 .../devicetree/bindings/connector/usb-connector.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 11e40d225b9f..ccb258972cd6 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -300,6 +300,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     maxItems: 4
 
+  displayport:
+    description: A phandle to displayport connector for DRM hotplug event notify.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
 dependencies:
   sink-vdos-v1: [ sink-vdos ]
   sink-vdos: [ sink-vdos-v1 ]
-- 
2.49.0


