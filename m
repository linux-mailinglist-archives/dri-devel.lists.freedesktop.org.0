Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D7A25D206
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C116EB03;
	Fri,  4 Sep 2020 07:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44D26E57E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:03:45 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 83CD0C29;
 Thu,  3 Sep 2020 04:03:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=+3b/zq/nS3RmW
 eMoQfDhOObDiP0bYzhAeWlwMkvfu4Q=; b=RmogQZqCV+jBIpU9QM+sD8s78ZPJj
 JD4CUEx7IhnVFPX9or0Fjq9GS/Y86o/8JTkXfPBJ4AKEsFyH2p7C6nrkBtF6e2SH
 AoBFKQH4PFdTyjJpIoSKQf7BIC2JUWHf4KerShXDFQQoZEFw498GzUn1rYXxS/Zt
 0LVNNOb6YvSveIJs6ktexzcBW0IOT0TzaQWeMuW1x4SQ7bRAvsSUyYqFrD4pF3+k
 jikgyuDg3V0yr7RxJc9rXdj3/so98CB2MleEEmfP4X72D6y8/Fo5RKPT93Ob/Cer
 RkJeAcHzdxlpxECne8yc7D94lFW3YWQeXMzawO2FeZafOL/GmMlHSTxTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=+3b/zq/nS3RmWeMoQfDhOObDiP0bYzhAeWlwMkvfu4Q=; b=Kg4HJyMz
 jkSLY4M9XB6twxzgsFwVSx1foRKcxzwXvmxboaPbF/7gn7wOIgmQ/Df6B0lM4NDI
 uGwYjglUohDAksAMxc1E1De/2AefwIeLHnB13fIZtMKAJIsJWgXdo2WeaYrcH2w9
 sEmnB+PbZHsjnyeq0kPu2FOQli5ykqBmFa+x8NWRudyYaMa2HoNT6kfESU8EgD5T
 w7xYfr7TQ2vysbwTzmBLU+G+Q5jrAZNEpIDOzhWQtKgei4qwNgfDO2MKGEfsthZn
 xO71/k+7M0swYyES4SdP2950K3VXgrCjYO3zgLyJqBqBiUZKJW99rWOWSXvCSlRB
 Zp5is37L8kOyKw==
X-ME-Sender: <xms:YKNQX4oZ6QQcFNyH6NaytuUCt35M5vHKNgquev4OwAQk_YQsyEvmiw>
 <xme:YKNQX-r3XwOpJ9F2yv7FNgEcxrKkq0zQYzaiYRXhbhKRRnMGQxQVDQ_qpXlK85kBN
 DPFli-llyN42_Xk9bc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeejtd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YKNQX9MisRfjvofGxU1wqE6_E8rSQu14hniM4RNAhH2Zi3g5oV05Lg>
 <xmx:YKNQX_7RHJVKZ9qpnPuXRIawwKwwnszI_bFWiVk0N0t-H1lbxphKhQ>
 <xmx:YKNQX35hW3jc4RmZmtJ5BsgIocZ1uCSJs4nEVGG9I3LbboPbcOpIVA>
 <xmx:YKNQX_w4fWfd64vEqsgGvJJyL3Q-n6TOE6GoK06ksZCu1Z9gYWkh7Xt96dI>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C3F22328005A;
 Thu,  3 Sep 2020 04:03:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 78/80] dt-bindings: display: vc4: Document BCM2711 VC5
Date: Thu,  3 Sep 2020 10:01:50 +0200
Message-Id: <1075091c50b378505a9a89f760af11f0e1e26e5b.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BCM2711 comes with a new VideoCore. Add a compatible for it.

Reviewed-by: Rob Herring <robh+dt@kernel.org>
Reviewed-by: Eric Anholt <eric@anholt.net>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
index 0dcf0c397375..49a5e041aa49 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
@@ -17,6 +17,7 @@ description: >
 properties:
   compatible:
     enum:
+      - brcm,bcm2711-vc5
       - brcm,bcm2835-vc4
       - brcm,cygnus-vc4
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
