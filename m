Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6B03FD65C
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 11:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB566E131;
	Wed,  1 Sep 2021 09:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88AC36E131
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 09:19:28 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 038155802FE;
 Wed,  1 Sep 2021 05:19:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 01 Sep 2021 05:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=/mZqeo1OAYVDb
 y6IXiP6Z8jcxr9m3S9Kr1qd96nizKs=; b=jouZP6BNh/I6BRdRCOja/18cGcFFE
 sbJozV/CkLkghhzI0c/bhVWpXCLCK2CpjVEQ/cPrvpMN3RGfDTCWQHBVWECctrCM
 9wGz+emPPkQ1/J9sbKjkiUor1RKK3S3xMx43aIoutkOIHuoAHV1H8Yeqr+MudDfU
 H4d8oj9N0AVwxbBt5BH3I2cRsivLC1BupyvdelmZDCZm1v2B7Cz4wQlG3ccTN9s6
 NKYep3rYGlRLsx3bJNbhW9OLjLaMvBNDKXLsR9q5rLPlnpREchwA4H7GpWhCgj9u
 7CGS8fUetnfAmXOLypzulfw5oYNwXMnyt809U1Ov4KMIxD4yHbiE5JGUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=/mZqeo1OAYVDby6IXiP6Z8jcxr9m3S9Kr1qd96nizKs=; b=a3KseyHB
 1rIdJjYCJHvalWcJcm2TJ8mlgOALHUQcVCzt8MgJaJcq7fTgaD4yaDkp8pLDRtB6
 DZnRZc1B2uQyG+SkVeCpl4Mh1WV68CkwEH7BBHXCFiDrt0U7tGSeHRPsBkzsdmvQ
 jN+MGUYzpqsA+R6sR9SggnEpG3MxWtljTHwzffksMeVmJAtDwB2sU4d+UUCUQILj
 BGdvKNPg5ohZYBAsDqMmDsRfz70okzHNvhNBlY+yT8gFDeHkHntoZknLFb4mRnOs
 9Jom7/PEQR0OWnuQwUss4/dE0JjDZbuPOMvCbHxJ4P/M3fDzv69OO7DlL9WjbPRY
 UOYdmLTwLXJ3lA==
X-ME-Sender: <xms:n0UvYX-MTSmtJ7E4Z_al_IKlZh269Pe7U2i-NwVqg7cPhvIiTE6-Hg>
 <xme:n0UvYTsISTHuSvk_OJipaogYuZz4UTKUiDNcgrmSJOnF1Pa9Ek0G82QtM5Rg6Jr-j
 0UtMTa0HG5hLCYG6Rs>
X-ME-Received: <xmr:n0UvYVDbQVERIHkDrcyuU1urEmmti2DtX_lEaoxLPD63jLFPHl4S0X3MJZd9vZdx1mv9l9tfpYAkY7xB699Mn0mLcHfjj_gmJE9S>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:n0UvYTett5YoOAVCZyENRHGyQqFomY0VJ02xuSogxfoayxPpPgegng>
 <xmx:n0UvYcPuy84Fy9XFRMkT2T1VxT2PlTlqoSEYIFO2HTu2aJhdFbxIRg>
 <xmx:n0UvYVl3AvwNMQuhih66FPNvXbrZ8_QZn-PEzfCO7qnca-t8EDrRXg>
 <xmx:n0UvYdG3Z_rBY48gKxKxtP7vvkrvUD9VQuPJEKfw8FWUCDlQ5cq5Ng>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 05:19:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 17/52] dt-bindings: display: aa121td01: Fix data-mapping
Date: Wed,  1 Sep 2021 11:18:17 +0200
Message-Id: <20210901091852.479202-18-maxime@cerno.tech>
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

The Mitsubishi AA121TD01 Device Tree Binding was requiring a
data-mapping property value which was set to another value in the
existing Device Trees. Fix this.

Cc: dri-devel@lists.freedesktop.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../bindings/display/panel/mitsubishi,aa121td01.yaml          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
index b0f1d4eff12d..467a0ed4d444 100644
--- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
@@ -20,7 +20,7 @@ properties:
       - {} # panel-lvds, but not listed here to avoid false select
 
   data-mapping:
-    const: jeida-24
+    const: jeida-18
 
   width-mm:
     const: 261
@@ -44,7 +44,7 @@ examples:
       width-mm = <261>;
       height-mm = <163>;
 
-      data-mapping = "jeida-24";
+      data-mapping = "jeida-18";
 
       panel-timing {
         /* 1280x800 @60Hz */
-- 
2.31.1

