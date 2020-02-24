Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D8A16A2C6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED326E37F;
	Mon, 24 Feb 2020 09:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187E76E1D6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:10:16 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id EB85063D;
 Mon, 24 Feb 2020 04:10:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:10:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=/HqohafekctYs
 ueNYIyWADwS7ESNsNdoU7kv2sDLpQo=; b=pvpq2n60UGf4X+eFGCIt/2VXcc/in
 uQzJPBTxVii1lVzHbVsyvpuP2t1h2UZYIb+MXv7dfNN8XNfstibVzypy7bj2Be0K
 0L1nbW88TdBUw2GFRqYCPozPAEVlbugMdvTDXIvshn2hEn4PR2owUgNhKyIiGN5r
 JGb3eNedCN/PdV1rfV4CS5o8lDEX6cdZOA38dGyepuX4pLCJcEMs/xX4kmauKYRN
 RvMaYSD7zbR4+mBH6ab9MCUhhyJy1j7iaMyBB/KhAxtfwoH55AX5ZUJUvQR+7b94
 bgO8m0YAVHsTS/U3tK+0tnVi+I+t5/RoQ2/xgpVUMX4k4CXQlptFtrAVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=/HqohafekctYsueNYIyWADwS7ESNsNdoU7kv2sDLpQo=; b=yZxC22rL
 EMci14Nm05ggtARzA9rU83oKRSc5Zl585o7m2dZAYZhyO3RfGAtxdt4zxoojni8w
 l1b7ZwqRRDXxqHAriHm6bfodBA9nuAEeV0aBZT8VWOa8Ip6yM1Hs4h0T164MUfWp
 d540vpSEzfWJlaqHYY7VWwvBB6L0agUQ7J7c7T2B/1zUz34s2nUGLkm7p/Kbz+Gl
 65OsW9zXQ4ajLoOWAiXFW4JH68/Jq1ZF6D31wZhIfXMGmcwVreSkHrbBVVKnZ2/s
 HPeNsFYZjSZGsGbIm9BPtdswJnNGubQcaibw3d0juswOQK8YEjYPzo6c5veWblTg
 3AApcviCxLp7og==
X-ME-Sender: <xms:9pJTXrwGr7g2eqIARQfwcccnahb1kZVaEcvlUna49LLAaMaHXpHQwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgephedvnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9pJTXmXHV1BOGwG5xrVVMWCVEoE42m_R-0N_5Q58ZKUGu0lcyzf-2w>
 <xmx:9pJTXv97vtXsaMU5pITI1ZTwpds3buEu_VQq0qth5b3iljbkry4Jsg>
 <xmx:9pJTXhtdmG-omkQfWmHZ_fnkgZ227PIky5DzV_SV4zfZwNFOyPHPBw>
 <xmx:9pJTXqggLtWmhBICgx3_WOosJU5CevJe16gHtMqf2DnOatNsjVirN2GSqys>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 34CF83060BD1;
 Mon, 24 Feb 2020 04:10:14 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 59/89] dt-bindings: display: vc4: pv: Add BCM2711 pixel valves
Date: Mon, 24 Feb 2020 10:07:01 +0100
Message-Id: <4a3c6e3cad10eeff93fafbc512c35b0c69dd1c68.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:39:03 +0000
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

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
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
