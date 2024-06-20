Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B66359102C9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 13:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E514810E93D;
	Thu, 20 Jun 2024 11:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="UnrcPFVg";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="okryVCWi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh3-smtp.messagingengine.com
 (fhigh3-smtp.messagingengine.com [103.168.172.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8115710E93D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 11:33:51 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id E52561140278;
 Thu, 20 Jun 2024 07:33:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 20 Jun 2024 07:33:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1718883230; x=
 1718969630; bh=byay3bVkSZOMxJBz7Y+qMr/UmWtrasWaZ64IM6CEfjg=; b=U
 nrcPFVgGVs+kL228acUu92m50/98x8iK9cWa+fBOPHKyYWjmCgbTxHFIBLMAwWzW
 fegMR0ip4bGfZsWB2UH1lYpdGzu0ZQt6JzFnZruLkUNvIA2Mbimlc5qbCA8gHf7I
 L0FareFLD1nqAFo4iY0D24VpMaQ0LhyEVxZQMAN8kzDMItFq1gxlCbUHkN3pTFTr
 KzNW5kN9zsbxJfR9b1F/uaDFAsgC/74rrot6NwBqaeiE6n8rHqEbNFBjU6XEBp74
 4/b4O/j3KUv55fybarKMnF0YO+y0oBfxX3Gt2Nu8B+TYkkvNbpRlY9TfCGNj1S/u
 mUJv9nHdbyDYyFyzHv7SA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718883230; x=
 1718969630; bh=byay3bVkSZOMxJBz7Y+qMr/UmWtrasWaZ64IM6CEfjg=; b=o
 kryVCWi1cjsO+v6TSp4zaJWZEZazdXfeOSYM/1+0d0SRI3rGGeK1iIB5f37dNt49
 iBPwqG0t25VMb8f8mmyjAyy2Uq+zQ0gf1+pZwiZHG+mjGVTVJxg/CCaoOVoAArIi
 7F8A6PwiV8pl2TopscWdcpfJvVcl48ewThWBQJrbQgVLTuBHEiPwx62MfbG21MdG
 B6Y25slXloIVa3vqumy3evOYsSMcry7cvmYBR4Q8wwQwvFLfOIvgsIsm2xRWyIbi
 F24Hz5j6BHPEIleWvym8q56SHLim69G12b0iOKC/fpy53kzuYss4fxTXb3qZRP/Z
 53eNrJOjZqd8F3ZQ7EEgA==
X-ME-Sender: <xms:nhN0ZsN9Tnp9lNMdM3NJjtD3bY4uJ_ZVsbMCRpdbRVGZpPj2YipX5g>
 <xme:nhN0Zi_aIuo9iOOIJfDvSw9qMd2RoTGLuQGUAaAfPqu-HwrphnHlYyF7M3NC-k3uY
 LAs9_ER9cY7BnCaAA>
X-ME-Received: <xmr:nhN0ZjR4kd2uTBx1EwoUZ7cpcmY4QaWMlkKhxrcnh4o0AO8uFUABP63uDLa2W4rhf78OacpMSfrx1pLmhAGesdE9r8rf9pEJ1HjldkONY-YPgGqv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
 ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
 htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
 ieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:nhN0ZktSwjWhC4JclTK9n3thLDlXxFWB_h6sYmecxg-TR05-aM7qtA>
 <xmx:nhN0ZkcwFJ2F2s8UkOYg8fOOUaMF4kEbazgijtd-MUfcm75DO_vvAQ>
 <xmx:nhN0Zo30UplbhdgMT3E8_EEVzUJo1Vc5XRspsb9aACJ1NZL8Z-iDRA>
 <xmx:nhN0Zo9fovqEhAdhAwQcyWTzN1qIOGxgHOOmRvSkPoh7htzfOYPmdQ>
 <xmx:nhN0ZoO13Jq0TmjvBpN-Wo8ysA-KDuHSl9KYqb3EjDoAs1_RFss3LSdb>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jun 2024 07:33:45 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>, John Watts <contact@jookia.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 18/23] dt-bindings: allwinner: add H616 DE33 bus,
 clock and display bindings
Date: Thu, 20 Jun 2024 23:29:56 +1200
Message-ID: <20240620113150.83466-19-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620113150.83466-1-ryan@testtoast.com>
References: <20240620113150.83466-1-ryan@testtoast.com>
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

The Allwinner H616 and variants have a new display engine revision
(DE33).

Add display engine bus, clock and mixer bindings for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml  | 7 ++++---
 .../bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml       | 1 +
 .../bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml   | 1 +
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index 9845a187bdf65..631027375e33b 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -23,9 +23,10 @@ properties:
   compatible:
     oneOf:
       - const: allwinner,sun50i-a64-de2
-      - items:
-          - const: allwinner,sun50i-h6-de3
-          - const: allwinner,sun50i-a64-de2
+      - enum:
+        - allwinner,sun50i-h6-de3
+        - allwinner,sun50i-h616-de33
+      - const: allwinner,sun50i-a64-de2
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
index 70369bd633e40..7fcd55d468d49 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
@@ -25,6 +25,7 @@ properties:
       - const: allwinner,sun50i-a64-de2-clk
       - const: allwinner,sun50i-h5-de2-clk
       - const: allwinner,sun50i-h6-de3-clk
+      - const: allwinner,sun50i-h616-de33-clk
       - items:
           - const: allwinner,sun8i-r40-de2-clk
           - const: allwinner,sun8i-h3-de2-clk
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index b75c1ec686ad2..c37eb8ae1b8ee 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -24,6 +24,7 @@ properties:
       - allwinner,sun50i-a64-de2-mixer-0
       - allwinner,sun50i-a64-de2-mixer-1
       - allwinner,sun50i-h6-de3-mixer-0
+      - allwinner,sun50i-h616-de33-mixer-0
 
   reg:
     maxItems: 1
-- 
2.45.2

