Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2035B900171
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 13:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A2010EBCB;
	Fri,  7 Jun 2024 11:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="iTU70gkU";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="PHk5lWRb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wfout8-smtp.messagingengine.com
 (wfout8-smtp.messagingengine.com [64.147.123.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7ABF10EBCB
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 11:03:05 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfout.west.internal (Postfix) with ESMTP id 18E4C1C000FB;
 Fri,  7 Jun 2024 07:03:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 07 Jun 2024 07:03:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm1; t=1717758183; x=
 1717844583; bh=BY+zIofCaC7v+wzShc4ej3nFK7NEM7edW7mapbborSE=; b=i
 TU70gkUBAEwV7XrnWynxYLFHP1By9zArbN7L8Gi3/xQPQr7zrEBzi6swIb4LnNJ3
 ASJAxrDnkvclQpfHgGM1gTTaL0IT5rgTRPQ6CFvEx6JsTR+C1ebDbnwOPxKwhQgU
 TgdswKlpSN34X8tw0GVmQFz1uIJOiKF7yVNBPqY1hgpCeuWQa12n3c7gnuS4KzNC
 r0+gble3x5ksF66LqayWoldRMouTeUv5XEbYDBH4/3UdD/8gWgT0mWyQXZg4ya89
 Lt35kvYldGXmawYx+HegJ8T+AEzE3uwEs4+L/bUqBUrR/Ph3UgBEfALshYflX9A6
 zkIjD+sy/wsq8DthBuPLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1717758183; x=
 1717844583; bh=BY+zIofCaC7v+wzShc4ej3nFK7NEM7edW7mapbborSE=; b=P
 Hk5lWRboc1/g7fhar4Fm+Hfty7k8rZIvQuuGod/NBeIqktc+pj0iWnXLLta+9FDL
 TKjZNeX5808KuJmIDt9nTiOatCH6lvRpGERmrSB8BSkyaUOlSB/ruZNTad7/d09p
 3H6Fqd3t4EkF7h83bkEYLnkYUHiRa+DxHvfqfvLoVxsdtwFCwPQalZB6UuGdenvy
 twjM4OR0J2ASzr4xmWhnQ6I5np3DMxBr20DOR12eQb/Rv+kguAUM+4O8B1ITEojT
 o/GkxSYbOv9BdHctwn+YVxXCxjQyPHCnBWcqPX167DrSgO7Omz/KpCnxlo12VqML
 WwOU36YE4qtdn4/9ppeoQ==
X-ME-Sender: <xms:5-hiZjSkA5A0UKlIE0-DlHkM47LuFMt0dtnq0hW9Z7dv7rjXj-lLBA>
 <xme:5-hiZky--VZDe5GP2sWY7YBZZhFBRxB1UD9IjaW4F_njHY69Q8yUMpS5mkY9GqXPD
 0HLH9oRVqG3GyKoDA>
X-ME-Received: <xmr:5-hiZo2mvrY9SKfWXhC7CECV-ABpsagxqWjn2uSHFLMS5dsBswSH1HElEjbrVxH34z6-7PddlVWp9PWOfh5DRnm5f68UdBpqG8Iirtw3G9ocXEv6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedtuddgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
 ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
 htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
 ieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:5-hiZjAEry3Xgh2J1mfgCSpJd3c57-ZJLLHlxZwvRbitOQUuRjBvow>
 <xmx:5-hiZsisy2mHnB0DgMPIq706yqmGoInMgKZqkZ6kw97yezlZ6cDljg>
 <xmx:5-hiZnrdOkIMJzsjtvcAcOCGChFtkCqMI9hCGuyosLGwp87ZfEmjuQ>
 <xmx:5-hiZnh6IYF7Of3jjw3ZkIVN1sEB8tFTmIHF1UeRzEVv2UDLUStl1w>
 <xmx:5-hiZnTownI17TI3QOjtk13k9QjONq67a6fhQhnJ_C-Qrn-2nGNjBQb4>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Jun 2024 07:02:57 -0400 (EDT)
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
Subject: [PATCH RFC 1/8] dt-bindings: bus: allwinner: add H616 DE33 bindings
Date: Fri,  7 Jun 2024 22:59:57 +1200
Message-ID: <20240607110227.49848-2-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240607110227.49848-1-ryan@testtoast.com>
References: <20240607110227.49848-1-ryan@testtoast.com>
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
 .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml        | 1 +
 .../devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml  | 1 +
 .../bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml         | 1 +
 3 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index 9845a187bdf65..65f4522e79879 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -25,6 +25,7 @@ properties:
       - const: allwinner,sun50i-a64-de2
       - items:
           - const: allwinner,sun50i-h6-de3
+          - const: allwinner,sun50i-h616-de33
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

