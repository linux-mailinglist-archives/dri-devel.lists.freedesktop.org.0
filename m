Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556E32CE9B2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:33:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFFFA6E152;
	Fri,  4 Dec 2020 08:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403266EB6D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 13:25:54 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id B16A858041A;
 Thu,  3 Dec 2020 08:25:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 03 Dec 2020 08:25:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=wz+kRxV/qCi2H
 jCkSSDid7iOo/GXO30WodgWhxmKGG8=; b=tEtPvmdP8Lxl8XqH5tNaI0ai3H0Wz
 44m5sWeHy8delsxaPXR28Z14ivLA3EQTRZhlm9/MAFVVTXYrArKLUERUrwLULLe/
 7HRUCNt26yfbg6HJ5fZvAt3oKF+rZbCKVo9e7S8DSevNGxRwBWSSqCBIaCzPnYdr
 KwfPu3muYMnuKu+XCs56kBjFyvBtgTdzeCF3fcP6UEYU1UaTtOXHhxyHFPmy8VG8
 Gla7mUkBEGqCxNCzFM2BfivJ5BYK/meBayHxii4LPdEOrXSHKwtJHRlcrCbPPk/w
 HBLHHvaHapWpmLvPS8NQPigq/UBE3HkhNhq0UDXZ+vDttGyqGooa8/QyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=wz+kRxV/qCi2HjCkSSDid7iOo/GXO30WodgWhxmKGG8=; b=oEi62ahR
 p1V+S4YeE18pVAaQ+7BUWW3rzGsJNJbdzVYdq5UxstLYdDbYcOF79mhxhaH2xxZM
 0klsCJMZGboysvfSwd2XJaP5KGMiaf+xqPsuk19hm4Jz73XXS0kz5D77NLxKMCRi
 ThPTNtpRx9iElIT03RCnTNX4Z8EnEuKCrkVe2jWJ/7DjwqveME1K93CRZ6guUv0y
 GE0pUbALVZT5cJvGSZfk9jrIlbupc0bKL/+k+1WYyBxvBBd9DIOeb6V5FRr/mhZF
 XXvk0Z3K9IJRB/EDThNE8cwv6MgYxO/hPDi6YE2dta05GAbrpMqqbvtuJPpJjkfp
 GUzZYajgPtsTCw==
X-ME-Sender: <xms:YefIX84Y1dL5HOYsXmdRItg8fettYBGYfrQRPzIPP8VEmjCmf6n_dw>
 <xme:YefIX7aG2jRlJKfJ0GiQaSGz8AVZ116m5vGar9lodNDMc6ePxF5PKSxrxF4FZoyVI
 UHJkL-T5v05KEHz7hg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeiiedghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YefIX-HSoHc7_tQ904GKd0HgEl5FWxD7F2msgyF4CESOgyfHLJL_Qg>
 <xmx:YefIX2k907l6aP9tkvszLTq7OW5mzaXmMP4o3FNAF0oKJMklEW3A3g>
 <xmx:YefIXzDDacOTHTIZykr_hQsXKZJO2hPD46lsN5oI2uNxxeyP9ziRvw>
 <xmx:YefIXzBPQ0bIS5CBEUBNcRN4qMFrdDB8QqVAgt6qYiaQY5XJ9VuAGQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7519524005D;
 Thu,  3 Dec 2020 08:25:53 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 6/8] dt-bindings: Add compatible for BCM2711 DSI1
Date: Thu,  3 Dec 2020 14:25:41 +0100
Message-Id: <20201203132543.861591-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201203132543.861591-1-maxime@cerno.tech>
References: <20201203132543.861591-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:34 +0000
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
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

DSI1 on BCM2711 doesn't require the DMA workaround that is used
on BCM2835/6/7, therefore it needs a new compatible string.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml
index eb44e072b6e5..55c60919991f 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml
@@ -18,6 +18,7 @@ properties:
 
   compatible:
     enum:
+      - brcm,bcm2711-dsi1
       - brcm,bcm2835-dsi0
       - brcm,bcm2835-dsi1
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
