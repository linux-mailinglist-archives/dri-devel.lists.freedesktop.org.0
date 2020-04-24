Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 620631B7FCF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84FAC6EB12;
	Fri, 24 Apr 2020 20:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E4C896C4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:36:46 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 61F48334;
 Fri, 24 Apr 2020 11:36:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:36:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=mIo2yTnIciTwR
 AfqGqPRdeUMoEIyJ/WFBxN68ut8oG8=; b=XAY7KFmQ9PTHYwXMyTnUapTYKD24g
 Mn8jD2A7zM2FUgstdDbWgxTUbdsc0MaTfjLL28skUbmn+ghoY9CUmOCfqIdgQOMZ
 cWcuu7sdV16n6KAK3qEP2dsnkV/3La8xkZiUS4kkqXAB9joVKqtv+siHkCJrOIDe
 e2USEfaz0X0x/OYcNdI3PFhO60umohg4/nIRvQytUdoB2svwIXx1YwCe2YAPSwg7
 MbVoWIWpWC8RsjFafN9sHKp/Kjads4lImncWQ/tOehrQiQmrU09QMlRYSwl5TLAD
 rIr8IusTRtEg/ppTulPcHDVCtD2jf1SqMDWHTImU7/5FtExW+xat4NDLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=mIo2yTnIciTwRAfqGqPRdeUMoEIyJ/WFBxN68ut8oG8=; b=ZVsO7R0B
 BZvoD2w8F8WMZ1HSehOtOrclHujG/eMySrgwFi75FD/rrRE0+DVvt3nPGa/gzyST
 ZciLYHA3TuTaKOHirgTL4GDuVa/Ljt//zPqv0uQl4UripPfTm3b1LJAaX81PV8No
 1EVD+UmkYXIugR48wNuwmBwQp268S2ETvuboamscQZrVbip10DIXe0aBk5ito7w/
 i7in/zrC/FZsRg9gOJTBDtcsjR42ut2ew6NdIcoYYhnrC5LWrrxthDgLVVDHOPj/
 uzQDeESNeVl76yAfKoNecbhciQz5uDODLalYS6nDF1LMzUpVSEOsDaYG70y5yBkq
 PW+yE+63KXrOOw==
X-ME-Sender: <xms:jAejXrPXjRki40XukrQGpqYkBxwCbfRMZWtOdTF6OGEOwB7nsL21wA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeehudenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:jAejXqOeWAWXjKtcJ2WkYnNupPOLAY4qkuHbAlb0fetjOhhsWlp7Tg>
 <xmx:jAejXlTqMD-dvnKAFtjv5Bs3fT9Zp85QfufkPxe4y3sRVM38Hueq1w>
 <xmx:jAejXkBHysai9lOmJH8G_LW-AhHhH2rsA93tJMrkDLMjiP-1jYnduA>
 <xmx:jQejXoIDgJUvT34hWhwsWHKmIEK8IAAn4vmTCVAQd5Lor41MGUpKJtOFYHo>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8AADE3065CDA;
 Fri, 24 Apr 2020 11:36:44 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 59/91] dt-bindings: display: vc4: pv: Add BCM2711 pixel
 valves
Date: Fri, 24 Apr 2020 17:34:40 +0200
Message-Id: <d32c991fa0441b631ca5de8a39107a0db5e13880.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BCM2711 comes with other pixelvalves that have different requirements
and capabilities. Let's document their compatible.

Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml
index e60791db1fa1..4e1ba03f6477 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml
@@ -15,6 +15,11 @@ properties:
       - brcm,bcm2835-pixelvalve0
       - brcm,bcm2835-pixelvalve1
       - brcm,bcm2835-pixelvalve2
+      - brcm,bcm2711-pixelvalve0
+      - brcm,bcm2711-pixelvalve1
+      - brcm,bcm2711-pixelvalve2
+      - brcm,bcm2711-pixelvalve3
+      - brcm,bcm2711-pixelvalve4
 
   reg:
     maxItems: 1
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
