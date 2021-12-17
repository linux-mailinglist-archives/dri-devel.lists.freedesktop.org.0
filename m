Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6C4478CCA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 14:51:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFEC610EE9B;
	Fri, 17 Dec 2021 13:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5EE11232C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 13:51:30 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id EB1345C018C;
 Fri, 17 Dec 2021 08:51:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 17 Dec 2021 08:51:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=PKzc2Vxci6FO1
 OEIAWNnzaJB8YhU7B9s1fu0Qqa+tFU=; b=Z6c6gMX7KO+q8KVwJDME5bgi6qax0
 PoGDKFBc6AGYFIpEX5SSlWRSJZD/rLqYp80WPvMF6tlIUM62OmaOMBRSha8j1KoO
 1IkNyicBcmoxZRoOz2rvMiU7tLQ1Pt18CSj2CPaGhiK7v8LEYZfAvdIR+6K2+cxx
 +5CTr3WLnvo/DX4/rGsZau54KtZSkqEEPVTnsTJjBKxX4XSgZH65mcaoYW6eZLJx
 9/nlRrCsYolvRCm2y1Nl8NvMmDitU+E2D6cUBPj9G5oWVLhDEigQkr5fvI3F+uI0
 yCvqpi4Po5zePKbGDlHmjl9AVmC8SDsTJSG7L7du737cNRuEPIdmb7WAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=PKzc2Vxci6FO1OEIAWNnzaJB8YhU7B9s1fu0Qqa+tFU=; b=VyBxtgR5
 4iXaYmqzqQlzO5S1O/NvbCwoF3yUh3DjL5gl1TaUEdKd9X06zCmck8OUxG/h54tG
 yA5ctPhydy5lA9XhooWOfNHmweybv72MTsAMf037QN4QTDF0jyAPbplst6fHrH+W
 3z8W5id01T6qER/+v9qkIJ9026UxXYROim6wH7Z2MKdvszXv3he4KhueNBPrzETj
 G/qCGX0jNHiKEFYMyuroK5I9DjEtmdyORBsNU5E3Ve9e0dOMWwsvIneNlMjAg5Rm
 la9MZXlGYqisuqz6VUJVjLNfqAVUDWvqHOQiSGL62wfVZ3uf2dgn3qd0yeyV/EYS
 P6go8YVLnanbXA==
X-ME-Sender: <xms:4ZW8Yasr1uOyTxpXhT-90DPbQvqFEstJauLwW-BV97tIESmANXlZSw>
 <xme:4ZW8YfdVBkGhe5UJU8iQwEz7oehExWeqRBfdiXotMzUoFEH2A3HsGZhZ7jvGpX3pu
 dokcn9fWfYJLlRLc5w>
X-ME-Received: <xmr:4ZW8YVzcAsrbOt1LOkKj1DesSv4q4i_PR1URKB4d-GaEh9Pe5g15vc6CG7jMulKT8UJzuNcnIrwBdazudWePl3WSIu-RGk6Aty0zh8Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrleeigdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:4ZW8YVPn5cZTCEt7kkoNDtmj_zI8bqECb0mqUIbwydVekQnxJYvhSw>
 <xmx:4ZW8Ya_Uf7T2G_DtzlvwMfMEbPglMANGf_xuk3S4jOAMktz3xw8JIg>
 <xmx:4ZW8YdVkvQc5aPtFmyQnZlhtutcpY5aL0_AE0LfXAquh4Mt2eOWO4w>
 <xmx:4ZW8YeST0eEigeHa8DqX3_ZVkdS9szoGojuM_9y29LmCpDKDC3R0Ig>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Dec 2021 08:51:28 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [PATCH v6 3/7] dt-bindings: display: sun4i: Add LVDS link companion
 property
Date: Fri, 17 Dec 2021 14:51:15 +0100
Message-Id: <20211217135119.316781-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217135119.316781-1-maxime@cerno.tech>
References: <20211217135119.316781-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Allwinner SoCs with two TCONs and LVDS output can use both to drive an
LVDS dual-link. Add a new property to express that link between these two
TCONs.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../bindings/display/allwinner,sun4i-a10-tcon.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 3a7d5d731712..42dcb8a86433 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -113,6 +113,12 @@ properties:
           - const: edp
           - const: lvds
 
+  link-companion:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: >
+      Phandle to the other TCON in the system used to drive a dual-link LVDS
+      output. This property shall be set in both TCON instances.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.33.1

