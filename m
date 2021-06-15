Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D313A7C35
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 12:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DECE89FEA;
	Tue, 15 Jun 2021 10:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8AC89FF7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 10:41:08 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1BF6D58088F;
 Tue, 15 Jun 2021 06:33:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 15 Jun 2021 06:33:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=dsIU2A4IG63n01qLudL7p2K0zB
 sqcfkyQtEn9S3VJ2s=; b=nESK69ujFmOGBR7vmxhVNPthe+3ZJYdH5WhBzH6/BU
 Kp0K96yG8XxHvhdwVym5JK9tOet0ZLTRgZw9cCXZUYubbF72SS/RF1pxgSoJ38Ai
 +m+xeG3DzCzbpAXZqWcP8KzG4i0u4B4M2hq4RqvgmBsMXB6QyRCdZT9nU62EeA1l
 oDLhu6/Mbc3Ow56m1pwui68ZRwYwLjPHozPlojCD7gTPg1hPh80gtrC78wydCYfN
 2+wu1KTx2Iwg0qIhl+x4vawR8aKwrmC+cYtJAIyEso6R/XlxgicVE+ZjLVvqTf/E
 0QaM9wMVIR39oeBgIf09MIEwPIsPEMaNZJuQX9bYHIOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=dsIU2A4IG63n01qLu
 dL7p2K0zBsqcfkyQtEn9S3VJ2s=; b=nZrFMQp61fRCkIprl8WYqhwUqztX9/khN
 KsLFgEzKq0cRJa2IYvBjzXD2ffMnEmVTxDUhrTRxjC7giPgtXoDDPhJcFL/aRuxC
 CNkFNkhVxAuAMVKRt9cKWN9y/s8Is2bcsiP7ng/yqqwkPeCWhyHijzmddmtlbbd6
 TBSeuIgActtF5Tze0CTP3g18fhjcxLv1beEstL0rSdO5s6AlkmTiu6cC8yd2koNp
 84/U47Lk0cUiQ+XMwHKYq69pRSuZeeAzYp2dp9qK4kxCRE++rBD9FrELzIjVYesE
 NOSScvVMNC+MN6tWTBlR6dLjNp80M4hss7mOJP3MeLrnqr9TjVoKg==
X-ME-Sender: <xms:_4HIYNxir4nk4qt6wISbnBfLdmrqSTnEnaP5IlBLHAvmvfhgsD3mgg>
 <xme:_4HIYNTbRGWs9Mn3H49lxHpF60kRq6RNVUxhtqhQJvJZgAGGTJU7ZNrEBqCjPzM45
 i6SpbyAFSiIxDuoRCk>
X-ME-Received: <xmr:_4HIYHVponIDukwXwjVgVGhqvPCyT9_PD8Vja9h_IjIGjv9DRBVnr1TJ83tSGUM6g4DDO2Jn7BZDfpoY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvjedgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetlhhishhtrghi
 rhcuhfhrrghntghishcuoegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgeqne
 cuggftrfgrthhtvghrnhepjeeliefhvdetgfdttefhtdegffdtiefffeejiefffeevueel
 jeehjeevhfffueeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:_4HIYPhwpax-LBZkhL_lfv-zO-SF4UtVusRBozExoQG8NxkcmLAt4w>
 <xmx:_4HIYPCt05bEndfHF8WRdRS9_0WtzxFj-qAYwdQAuCfMW2SDuf2gUw>
 <xmx:_4HIYIJLjWCaH4SlZinnAYl8qT8taS6hxgHSduoYMBWOrdE2BRP0Ig>
 <xmx:AoLIYBRhYgIzpbGyA23j6VtCnEu5A6oNsJpN70Dr0xQfpz9ApDYspA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Jun 2021 06:33:29 -0400 (EDT)
From: Alistair Francis <alistair@alistair23.me>
To: robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 krzk@kernel.org, shawnguo@kernel.org, daniel@0x0f.com,
 linux@rempel-privat.de, kuninori.morimoto.gx@renesas.com,
 max.Merchel@tq-group.com, geert+renesas@glider.be, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH v2 1/2] dt-bindings: Add E Ink to vendor bindings
Date: Tue, 15 Jun 2021 20:33:11 +1000
Message-Id: <20210615103312.872-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
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
Cc: devicetree@vger.kernel.org, Alistair Francis <alistair@alistair23.me>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alistair23@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the E Ink Corporation to the vendor bindings.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index abd878ff23d5..a35cec512530 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -335,6 +335,8 @@ patternProperties:
     description: eGalax_eMPIA Technology Inc
   "^einfochips,.*":
     description: Einfochips
+  "^eink,.*":
+    description: E Ink Corporation
   "^elan,.*":
     description: Elan Microelectronic Corp.
   "^element14,.*":
-- 
2.31.1

