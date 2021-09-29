Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C651441C0DB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 10:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9663E6EA06;
	Wed, 29 Sep 2021 08:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDCC6EA06
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 08:42:52 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 22C963201805;
 Wed, 29 Sep 2021 04:42:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 29 Sep 2021 04:42:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=2XBfNZb0gFnrN
 QzASAZlAbRsEd3HfA8Fg9893QKOwPk=; b=iKfsDCLkoq8w/vsJH5hoeudXWh7GD
 su5/W9udJ7IgIfskIApTs+8H3eKieIrz9FPnnqkTHeQ1wLeaFRYW/o2A32SqRbJM
 bAILpS2cre1TqDc2IIHY2Z3TP9N5hb7NiAnZdGUZd7jix0CWygYuWXIgq9wDORs2
 AsFWPGxqxHTN2/ENU/pT6/pSNXB/C/8f7dJUUVyKokhy55Fec31kdkGq0KEmKoED
 XoIqaqPkYIt5qoaUjs6vDmvJyJWMRreP6AZCcY2l0HP5+FbsksmUexmTuKfEaFM6
 zEQIdCWivJV9rk/9KZDD9QbO/uGKBvrRqjN6Jhwen22ptvXy15QqCC3mA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=2XBfNZb0gFnrNQzASAZlAbRsEd3HfA8Fg9893QKOwPk=; b=BjGZ6CKZ
 KLLP3t+EM13GdAAWJOzBkGRJA1Zs6DqIzjl94GZtuLiwvBt1j330kCbcgu95Yyjw
 DvmvppQQrixIBxwUuKnAFezeVB+WIFDYjlum8YDfyVD5r6F2reDTtTWQkSFeikqj
 HC4e6e6usoOhGYf/KL0IyhtBTkXq/wsxpRIJzfu7d9ZEwNX4dJOfcUHdXElmxjn3
 CGkiKLHtF7m4+9pyfLlwyVFSUk0DCuwieiiAMugGCl0ZxQ+NlAMxd4DsUVf/40WP
 LPzfJ4vURcJe0/4z87dFyj0fDKx9lLi5UXD1T7AKxxyExQKBggQdMrIPqGVZoGEk
 I7e1aw5u5BrgCQ==
X-ME-Sender: <xms:CidUYbv0Jcx0mMvVRQwQJll5XJeb8cnRRBwu26PWBEahLeWETkbf3A>
 <xme:CidUYcdRYxT-4kKsuYZE4sT0BQL4QXBQ_CVv1bWSVjffQedvXXHaa6ONO6sDDMjKD
 tObEevuVJcbLNCGNZE>
X-ME-Received: <xmr:CidUYezzltZkm56pvS9jPPW3Qwia_YuiP0dT5oTd3W0I4w40M8VlPfQ0oV0YoO6HZgHK_Pj90I6NxlxLRB3HX3lQcDJGBCN-qXC5qffS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekvddgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:CidUYaNP38eO9QqQxyww4s_GBB3F_NByaD2PgBzXrFQERHytOMXmGg>
 <xmx:CidUYb8eKbyIJ5wtokEcTBpUqxoj9C1EOQIrjsZRRVrlEvrCoyZqtg>
 <xmx:CidUYaVNHIr_vircnAEmwfF7JTCn00RMrGnMhZycxAai10-Q28XK0Q>
 <xmx:CidUYXSv2uh_O_W9yreYrhv02Ej3YdbI4vW0R_h1kmN36xGMwEnkBg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Sep 2021 04:42:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 3/7] dt-bindings: display: sun4i: Add LVDS Dual-Link
 property
Date: Wed, 29 Sep 2021 10:42:30 +0200
Message-Id: <20210929084234.1271915-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929084234.1271915-1-maxime@cerno.tech>
References: <20210929084234.1271915-1-maxime@cerno.tech>
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

The Allwinner SoCs with two TCONs and LVDS output can use both to drive an
LVDS dual-link. Add a new property to express that link between these two
TCONs.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../bindings/display/allwinner,sun4i-a10-tcon.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 3a7d5d731712..d01b0689785c 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -113,6 +113,12 @@ properties:
           - const: edp
           - const: lvds
 
+  link-companion:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: >
+      Phandle to the other TCON in the system used to drive a dual-link LVDS
+      output.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.31.1

