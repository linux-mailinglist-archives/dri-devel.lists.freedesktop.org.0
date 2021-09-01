Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 406083FD659
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 11:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C446E12E;
	Wed,  1 Sep 2021 09:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A716E12E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 09:19:23 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id B5821580B23;
 Wed,  1 Sep 2021 05:19:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 01 Sep 2021 05:19:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=ArwuXM+lY27J0
 j0rnI1pDgdB4B4dw5W8gpmWatsnPLE=; b=d8HevsYW8uzjEVXCYf0Y4iU3i1Q1L
 X8KmpThFcR1cumtxkSrj8d/DbOR6AxAxRp1l0P1lzvUT7GrcSL6wo0jY5ilJSEQZ
 P2QQICBjzxHZxCSw0HjtBSoLC7VMd7kcBBHIXX9X4FUU6A4bmv2xTnePkRQzcPUW
 CUkS5Z0kDmgyN2PSfJTx3JtKN48Ikr2yzte7lJT6x1EAO97uR7/rkQL1BPD2BMR+
 QOksEoBhUncYdUMrw+qVobCpwyChwcWWEtdYENTgM3ieQKEQ/AR0VyE9YyOaOAFP
 RKauwQHE1KoJyvOTTc3FrhcEYQCzS5guyRClHdwCumHOSPUEHDEsyQ5Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=ArwuXM+lY27J0j0rnI1pDgdB4B4dw5W8gpmWatsnPLE=; b=U4rSLHa9
 ZXth2YMgs/Y1y0w7og1MVlvqZG/Ow/J4GaRTRRP+OBpfVjwWqolQ3fnUu4JKElVh
 cKmmhzEEew6B8J/En38kDsYIr14PxTCfDM1+h2w3GXroh60w1rCinUU1xwON/KeL
 Dn7wrYmrzHHU7moQ2PZL23HLDGtc9AJNxBQ0pfJm/s5kGX3wOQF5yZKASqZtSpIk
 97/P55OZU0g7OuzWWy13rYB3U9SJAdkr3OevCsXGMLg3dKTuuvQhh/8GjNXjjiz0
 tu3D4nC2hNgfpnMV7LYElSAEpbiXBDvepSbukqdQuSuz9EKfKUkVnML69Zs93Vf4
 2XCPfIgO2/hGTg==
X-ME-Sender: <xms:mkUvYaQ5IrNP5dwqx-JyrvpOl09bS5pfsyteEBlUASQbBpAPa6E11A>
 <xme:mkUvYfz-gajSUrn8zXrcFfemgw1FktrRC-v_eO7eP9StvQ9SbHfAgTdanFbJiSY9G
 e3BL0UEhTQFmbSnpg4>
X-ME-Received: <xmr:mkUvYX1RIBrziBB7k97rNUI0X8E37S-AOguYfxkxed_Odvwq0qnU3g5jlCki6isK7TsLaS9uK3vhRfahGCD8X1LYWlqPz9gb9E5H>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mkUvYWBsGPNa-iiWeJGgZfOztmotQOmNL7lJFFNV1v9wqaHthg-Q0Q>
 <xmx:mkUvYTgpiNdBwMLt52voBOpDw4SDJqwojqUpYtAsPYNBErzJIxGLEQ>
 <xmx:mkUvYSp5iCoEWGvySmNe92qLwgsUSFm8YuHmnLFz72F8DtQWIg-fuw>
 <xmx:mkUvYYZ5qwdRv670DLdMdg9TEsMJiVK9SDTw72iV-9InQ9rn2ZDAiQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 05:19:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 14/52] dt-bindings: display: aa104xd12: Fix data-mapping
Date: Wed,  1 Sep 2021 11:18:14 +0200
Message-Id: <20210901091852.479202-15-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901091852.479202-1-maxime@cerno.tech>
References: <20210901091852.479202-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The Mitsubishi AA140XD12 Device Tree Binding was requiring a
data-mapping property value which was set to another value in the
existing Device Trees. Fix this.

Cc: dri-devel@lists.freedesktop.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../bindings/display/panel/mitsubishi,aa104xd12.yaml          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
index b595edd58bbb..2d1c85e377cd 100644
--- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
+++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
@@ -20,7 +20,7 @@ properties:
       - {} # panel-lvds, but not listed here to avoid false select
 
   data-mapping:
-    const: jeida-24
+    const: jeida-18
 
   width-mm:
     const: 210
@@ -45,7 +45,7 @@ examples:
       width-mm = <210>;
       height-mm = <158>;
 
-      data-mapping = "jeida-24";
+      data-mapping = "jeida-18";
 
       panel-timing {
         /* 1024x768 @65Hz */
-- 
2.31.1

