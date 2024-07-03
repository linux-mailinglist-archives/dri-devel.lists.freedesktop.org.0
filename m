Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D39D8925A5B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 12:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B7C10E7B2;
	Wed,  3 Jul 2024 10:57:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="sEhxJ2oL";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="TQk7vDiO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh3-smtp.messagingengine.com
 (fhigh3-smtp.messagingengine.com [103.168.172.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3BD10E7B0
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 10:57:08 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 0918311402F8;
 Wed,  3 Jul 2024 06:57:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 03 Jul 2024 06:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1720004228; x=
 1720090628; bh=FC6k8jZWgipYDGfwnJiHUXPrnrp3OnQXw8qog8fusJE=; b=s
 EhxJ2oL8pBvXje7oFTRryTAd7NoZhSjKQEAswlUyJ865HuRmihFFXfN5HvZO02xD
 8ITzR7c+uiGPVvnugBzmUrU2ckbKmx0FuST6I8gIklmapCpBara6VAlfu580AGfD
 Fm+XUWG3AYVWOuFmez7ZSmWlQzEzEJXPFg9veNivHos0sMcXlfrqL26FHumEN9k+
 0D8GAJe1u75VKPf/7nOdEGQ8v7V59xtqLs9WzfTwJiOZ+jb6UZQJcyccbn3HK672
 CKLKTal93U7+JclREBcbEFkNSEnX+UTrwI1OZkeUbSAt2zPd1brn+/0SfC76Yf1c
 gnPhtpLNKfZTMP9+Iubfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720004228; x=
 1720090628; bh=FC6k8jZWgipYDGfwnJiHUXPrnrp3OnQXw8qog8fusJE=; b=T
 Qk7vDiO6qRqThCkcCdrNQ3j9br4EpoUtQcYXb1M4svKm27S28dye1vOp03IkSyiK
 sK6f2cLLr3BZAs0Uxc/sORhwUEZbEUgj0wIo4KwM3BDU4asQeSM4Z1RS62dF/NyI
 KbuFqmUToeBNVyLa1DEm9tWdq+/P2o2hNxH8xNcn6T9lVfSuw6FU/roufgOClK1n
 LSGaPCsPIr4Zg0P4gM1gZBOgGpdgihKZUddcVk1ZtDEVyxwFIc3BmRfIn8YQNQi6
 xZtwqBst/1QxYNRaeULEKxwpWM9AbikXyYB9bLgePQo2m9VJgob9C2LnS+fRzmc7
 zPchDiRqfj1xi6bVRYtUg==
X-ME-Sender: <xms:gy6FZjfPbCvFoPociNxjh8YSjhzuDHQJzGf9kgH6RXLAHqxO0X7nOA>
 <xme:gy6FZpPAKUCjWOI9fWyv3xX21Jgu7XhpcabgolX4niAsCvRZVKR_CFoJ9PpS89A35
 dGxybPs3OQ-uWdp8A>
X-ME-Received: <xmr:gy6FZshor801xaEPX0tf1vXhVFnmSSIjDsmRg9rYuYr9apKaikRD2h-w_0ufNTC9LBw5Zi4ByztVNu-8VuMNcoorb_eo3LY3Pwqt-xT8ni9qGXhZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcu
 hggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrth
 htvghrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieei
 heetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprh
 ihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:gy6FZk-5FnkalxxRblDAhMkb9fA_UHZkDbeUeFr9AY4HAkHj2sHJKA>
 <xmx:gy6FZvukQYzeL1mqg-dh-HY2hgNYdSw6FbGXFUvYLbay7aMK08FaAw>
 <xmx:gy6FZjFdd_QeQtp1b-egmt0IoEcRXIOe-LrVDD72qaLiujZ5fWtdLQ>
 <xmx:gy6FZmNFVi7RR5y0jF-I79ctT_K_OWPKegc0aGYuJyANW8huNEgjAQ>
 <xmx:hC6FZvfQ5Cmr8IxaYPSrp1IhvzNS82DhYQsJ55nJ_Q-VSr15Uy2kBq8g>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 06:57:02 -0400 (EDT)
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
Subject: [PATCH v2 18/23] dt-bindings: allwinner: add H616 DE33 bus,
 clock and display bindings
Date: Wed,  3 Jul 2024 22:51:08 +1200
Message-ID: <20240703105454.41254-19-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703105454.41254-1-ryan@testtoast.com>
References: <20240703105454.41254-1-ryan@testtoast.com>
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

The mixer configuration registers are significantly different to the DE3
and DE2 revisions, being split into separate top and display blocks,
therefore a fallback for the mixer compatible is not provided.

Add display engine bus, clock and mixer bindings for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v1..v2:
- Correct DE2 bus enum to reflect fallback devices accurately.
---
 .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml     | 4 +++-
 .../bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml          | 1 +
 .../bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml      | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index 9845a187bdf65..ea7ee89158c61 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -24,7 +24,9 @@ properties:
     oneOf:
       - const: allwinner,sun50i-a64-de2
       - items:
-          - const: allwinner,sun50i-h6-de3
+          - enum:
+              - allwinner,sun50i-h6-de3
+              - allwinner,sun50i-h616-de33
           - const: allwinner,sun50i-a64-de2
 
   reg:
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

