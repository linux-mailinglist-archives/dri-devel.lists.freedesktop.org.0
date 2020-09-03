Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A061725D1FE
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6EC6EAC5;
	Fri,  4 Sep 2020 07:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4691B6E581
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:46 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 12BDECA6;
 Thu,  3 Sep 2020 04:02:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=aBB5SQ24pyqVM
 W/fyj8ngOXqAKkOS41AE2GxM0LTpXw=; b=BZ06Qo+MMIB1pOXwh1RZCprG/LQ6Q
 MPXOVRPemMsfXqUyoEYGNQ/lh56MnAbFkmaLA3EfMsvLBC6SwFXoEfqfBRDOhxnu
 T4+ZimwNWnAnmCkHS/MS+PD1h1nk26j22w50p5Ytwu36OruGiMrtz3N5qMCpAQD8
 JT+6kThNqO2nNDqYZ9OvPwQcVXBAPezYOq4VzkuA+SolKNZ8OQ4rQsrAu+tEcPOa
 DqnXVzwPByY7um/3HPW8iq5nzFYBDZsS4x2CNx5lr5wTtKhJrkZKzQcBBLT04lTt
 BPaJVZdzq1gUSiU7D0nLnnBhRhtrD4pZ7UYrNg3D4okeMw4XGSFWglJUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=aBB5SQ24pyqVMW/fyj8ngOXqAKkOS41AE2GxM0LTpXw=; b=SAlrKZWn
 xgLGQCS8BHm2r3LDY6Kr24xEXw51A/1hUNbnd2L4z+Sbcc+id502RZf2KOHvIZpm
 UuTRZAHDAtgCj9XXFZdsmlzC4sYkIP1rHCTOPgjGnI5uQVtGk9Bw3wyIBbEyuBui
 6lUl2PUy13w3Re3Yd6vLCI7L25ffB+UBljQJRJHid78IfW1G5HjFVc/6Vyb+LwO7
 ZTQCXzXzAJd/Qx2MdTHtv/u5fpm4U5WR2JrGGusO6+PS5x8IaTjp2DCdbWAXrGHU
 FkBMH2yjRJuH1b28h3m8fwMxBaatqRA8n4HpaRQd87UCnrf5qjido6b3ObzUijKi
 j1BCrevFncebtg==
X-ME-Sender: <xms:JKNQX-6mZ1vJvCZCrvrlzU7USpMJPQ9Q2iohgAcdB8K0Ly0_Yu0w5Q>
 <xme:JKNQX34DepqkTmLtz2JblZK-sNqXqE_HM8Pd_DEJhnK2tgLRS9k-OzBDYTSA4GafT
 TvTr8oI4j4AwpGQ42o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeefvd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:JKNQX9cIn9hthLsOJqhjOlMDV1mOsJGcuRISkt6Y4F2mvBH1hZCFRg>
 <xmx:JKNQX7JZv_ogNx8sSLnJdg6RQeoBDCCcIWxs3Cx39-IX5hhyyOf29w>
 <xmx:JKNQXyLhavY6smsuiYmVnfuZf-6p5MR4glvqO0Af3PzQIDnV9B_Fuw>
 <xmx:JKNQX0AUmlClnAazqGVHE1q4QkoCP7wHncFAFV3XzY_6ZqNOMmPfKXRR00Y>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D785F3280060;
 Thu,  3 Sep 2020 04:02:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 36/80] dt-bindings: display: vc4: pv: Add BCM2711 pixel
 valves
Date: Thu,  3 Sep 2020 10:01:08 +0200
Message-Id: <3a21824460d96245984d730e446863a4853f2ae5.1599120059.git-series.maxime@cerno.tech>
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

The BCM2711 comes with other pixelvalves that have different requirements
and capabilities. Let's document their compatible.

Reviewed-by: Rob Herring <robh+dt@kernel.org>
Reviewed-by: Eric Anholt <eric@anholt.net>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
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
