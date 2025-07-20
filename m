Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C523B0B467
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 11:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE62C10E1A5;
	Sun, 20 Jul 2025 09:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="DKcVtLZw";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="LaQxgFrn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b8-smtp.messagingengine.com
 (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26D810E18B
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 09:01:09 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id BC6497A0155;
 Sun, 20 Jul 2025 04:51:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Sun, 20 Jul 2025 04:51:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1753001496; x=
 1753087896; bh=/Vp7asQjGLFN1k77Eje991mjyh5OgOzy06SwurP1djg=; b=D
 KcVtLZw4a/C0BIep7/Q7rEpuyU50ajrLgBha9kXXpq8wR3teFWx1cQVrPTSxVlfp
 MnjN+d3Is9FB5gSKTePj6tm/5GDW3p5NkP3VlA+YLWd6VZkWQs6BTkemrGJr0ujL
 6BMYJc/YKNu9m18s8kudRSWud2kOBGFCDJdG+R3kApjJP/5GQXH6UkXmleAV3BBQ
 xKOqWGzDX0ycHlqIC4hRW0z5pAsqygWGh97Fwclsguqw69F4Lgw9S+aB7jf2FgyR
 wmjeqKlg4fyF9J8rCWLJytzm2wp9w8Qm02zfdezfik1PBb4Jz++4ajf5ZZXTalp7
 dhfGqRZM836j0920McvMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; t=1753001496; x=1753087896; bh=/
 Vp7asQjGLFN1k77Eje991mjyh5OgOzy06SwurP1djg=; b=LaQxgFrnYiQ7dQjRR
 7Ho+UNwvGnxmTvKw9mgK8vxGvjuOXyga6mv3RlgPQYtrb6BEVsM/HEkhzBTwd2LE
 HTGEOUa4mKOF90TAHdnM3y6dXMLNke5tfGqxLVM0OLpvyarrbWQdb9qj3YeEgJer
 ZxfQeqglEvOZpJYtkk8ttUp/w8C7nr1PZqH1jUJLsre74ck9KDngAIv0o6YtAgum
 9Y+mrnhg2YIYwh4Ct+1fw1fk8MeSKwNekDi9iHECmcWdlirDHS+6h93+i7PSi2wP
 Domm0DwTGcZtjJ9BWOQTPnRMM3plBFlt0nizIwl4N8cyL21hDbN3yIKsl6QK+8VV
 nB48g==
X-ME-Sender: <xms:GK58aKEdkC6nSL3iGUcbRiTFWNLf-a_6Uf_3CzffXrQVLCCEPrtCgg>
 <xme:GK58aGNfY7L2LW54c6e1MP_Gts8I51qXN7L8_xJJkCCZnJxTcg-qLtlD2j32f3CrM
 XyONoiYCNHQcQSo1A>
X-ME-Received: <xmr:GK58aOXarNae_2vqAlwftj_qbUqkEOTyZ82AStouWCBzRLzE5Z-uRKzi4sDZgk0v3bmJ41MzQhWBd8FBbCJueAUD_S-EGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeikeejjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggr
 lhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvg
 hrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieeiheet
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrg
 hnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphhtthhopeduiedpmhhouggvpehs
 mhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtth
 hopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgu
 theskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprh
 gtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphht
 thhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheprghnughrvg
 drphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghpthhtohepmhgrtghrohgrlhhphhgr
 kedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhikhhutghhrghnleeksehgmhgrih
 hlrdgtohhm
X-ME-Proxy: <xmx:GK58aFwvXuVMcwSPHa1Z5Bc1xOjHqN-5qaAi069UecFv3QkqV1qmDQ>
 <xmx:GK58aGNQr_RsdJPIPCfN4b7On3t2EShOS6iXKI5SHJsVxM0bixp5gw>
 <xmx:GK58aPoxz4Sfd55o_JRYI6X3mNtErZq5tHI8ag8uolw5EaiTBY2rvg>
 <xmx:GK58aF-tGD9yJNuEhOtkfOe3j5qDbXTXdVnxdUZXC_Xb15xp9M-1eg>
 <xmx:GK58aCijy7T_0B_WFvKSzb1_0Cn62m6Nw167Ek6TEKWUCsaU8Yp_itZ9>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Jul 2025 04:51:32 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Ryan Walklin <ryan@testtoast.com>,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v2 05/12] dt-bindings: display: sun4i: add allwinner R40 and
 H616 tcon compatible strings
Date: Sun, 20 Jul 2025 20:48:43 +1200
Message-ID: <20250720085047.5340-6-ryan@testtoast.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250720085047.5340-1-ryan@testtoast.com>
References: <20250720085047.5340-1-ryan@testtoast.com>
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

Add compatible strings for the Allwinner R40 and H616 LCD timing
controller. The H616 LCD timing controller is compatible with the R40's,
so is added with a fallback to the R40.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v1..v2:
- Add additional H616 strings
---
 .../bindings/display/allwinner,sun4i-a10-tcon.yaml     | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 724d93b9193b..f9fc0d87ce0d 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -29,6 +29,7 @@ properties:
       - const: allwinner,sun8i-a33-tcon
       - const: allwinner,sun8i-a83t-tcon-lcd
       - const: allwinner,sun8i-a83t-tcon-tv
+      - const: allwinner,sun8i-r40-tcon-lcd
       - const: allwinner,sun8i-r40-tcon-tv
       - const: allwinner,sun8i-v3s-tcon
       - const: allwinner,sun9i-a80-tcon-lcd
@@ -47,6 +48,11 @@ properties:
               - allwinner,sun50i-a64-tcon-lcd
           - const: allwinner,sun8i-a83t-tcon-lcd
 
+      - items:
+          - enum:
+              - allwinner,sun50i-h616-tcon-lcd
+          - const: allwinner,sun8i-r40-tcon-lcd
+
       - items:
           - enum:
               - allwinner,sun8i-h3-tcon-tv
@@ -56,6 +62,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun50i-h6-tcon-tv
+              - allwinner,sun50i-h616-tcon-tv
           - const: allwinner,sun8i-r40-tcon-tv
 
   reg:
@@ -231,6 +238,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun8i-r40-tcon-lcd
               - allwinner,sun8i-v3s-tcon
               - allwinner,sun9i-a80-tcon-lcd
               - allwinner,sun20i-d1-tcon-lcd
@@ -280,6 +288,7 @@ allOf:
               - allwinner,sun9i-a80-tcon-lcd
               - allwinner,sun4i-a10-tcon
               - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun8i-r40-tcon-lcd
               - allwinner,sun20i-d1-tcon-lcd
 
     then:
@@ -297,6 +306,7 @@ allOf:
               - allwinner,sun8i-a23-tcon
               - allwinner,sun8i-a33-tcon
               - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun8i-r40-tcon-lcd
               - allwinner,sun20i-d1-tcon-lcd
 
     then:
-- 
2.50.1

