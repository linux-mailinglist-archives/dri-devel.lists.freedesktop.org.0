Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 047643FD658
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 11:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFE56E0DF;
	Wed,  1 Sep 2021 09:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76A96E0E1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 09:19:21 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 24641580B22;
 Wed,  1 Sep 2021 05:19:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 01 Sep 2021 05:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=We/hRhEiWEOUh
 X2G7H8++UqKKLq0/p9eIkqpBGPzUcc=; b=NtN2ljQNGFdUzElqhyCWZkRCupNZL
 FvsEaTc1RrjRTOwqDtMR0Qqnihj9u5mzgW2OBoT6YUtjiyIkbF1Mrbyoy783CIE0
 DFjcPzGRPrc9ZLA1q+HbhNL+I6Mbb+6nk4s9YnnD77Tgl5GjFduZ7GN8DhPun5EL
 WYXY6Fi5i0PnwsWCjW5BBduQYqVVJmYdKMnA9ChRMMLrpVesJhhdKV/uTnlxY2EG
 /c3enRVFt3C1IZD++EB5aMMWfdcmIqHH9rgPRkpn0lgCXAZGZA1yvGhS/CJ9Ofi8
 dwvkH697vRL48seQcZR6IlFWITTEZ4KlWGjOxvy5yxCk/YKApDg3tW6YQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=We/hRhEiWEOUhX2G7H8++UqKKLq0/p9eIkqpBGPzUcc=; b=ZqcTYtXG
 BJBzkU4GxKqqDeYX3KRkO2O7nMup7p0fyf1DUBXoxkPG4aB60/Xm972+3GH3nMLy
 i2TA3YFZL2tuwAJskX6v0mBzJUKLtud6wZhatpmEi6A2OTUyFtNgls44Cp3fnI96
 ruE4VI7rVoZiFSehQ6feR2xf9Q5im/c3ejmI7hMBD5uEljsRmohnId0NHPR3q6zP
 O4jnt0LadpgfBqbdUAjGwB9vu7+d6n4WSBvoyQX7n36wRmLUmfK7afJngqsFjNdM
 ul37An0wuv3rl3ZUDFH4HGCRBVxKpqP9d8KBnpqRGf+dbN8dPIoL4Z4wneRQ0PoR
 HIDb0QOIDpmbEw==
X-ME-Sender: <xms:mUUvYRCESonRMe7PcO-76QAXTWqywewUICGSQfdrKYRRvLyR4839Ow>
 <xme:mUUvYfi2Fk7Jd2b4ud9fUVq_F7uqOWmEwtKxTZ-VYDyGkHjvgTA4SMCbMezAAep1x
 7h1X2F_ANSoeK-_zZo>
X-ME-Received: <xmr:mUUvYckPD1z5MRI-NNA8ICcD_IEH4kT5W29Nb6i01dSq0z0bUAh5ymHJqsRCzcnvOoUpdEEtQECzOUOl_w38u-Sw6tgTeorNKain>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mUUvYby6x9qZZWh_rl1JfwkphQ2HYQdVEFwsbcDQAu8Mp6ZJRIHWPg>
 <xmx:mUUvYWQuYwIyHMurUZe-0ETNiO_fBjCym1_Qjx46mVSjfd0qIz-vUw>
 <xmx:mUUvYeY0_xwXbPKQCqyvDC4-NUCcXd45Wj0hLX54UvPUOdA1JFKgow>
 <xmx:mUUvYbIhQndYh8q4VzkIXfuTGV6sPaZopViKDtKcNcI3elxNIR1Tgg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 05:19:20 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 13/52] dt-bindings: display: aa104xd12: Remove unused
 vcc-supply
Date: Wed,  1 Sep 2021 11:18:13 +0200
Message-Id: <20210901091852.479202-14-maxime@cerno.tech>
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

The Mitsubishi AA140XD12 Device Tree Binding was requiring a vcc-supply
property. However, neither the existing device trees using that binding,
nor the driver were actually using that property which is also redundant
with power-supply. Let's just drop it.

Cc: dri-devel@lists.freedesktop.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../bindings/display/panel/mitsubishi,aa104xd12.yaml         | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
index b5e7ee230fa6..b595edd58bbb 100644
--- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
+++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
@@ -19,9 +19,6 @@ properties:
       - const: mitsubishi,aa104xd12
       - {} # panel-lvds, but not listed here to avoid false select
 
-  vcc-supply:
-    description: Reference to the regulator powering the panel VCC pins.
-
   data-mapping:
     const: jeida-24
 
@@ -38,14 +35,12 @@ additionalProperties: false
 
 required:
   - compatible
-  - vcc-supply
 
 examples:
   - |+
 
     panel {
       compatible = "mitsubishi,aa104xd12", "panel-lvds";
-      vcc-supply = <&vcc_3v3>;
 
       width-mm = <210>;
       height-mm = <158>;
-- 
2.31.1

