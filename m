Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 245B736486D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 18:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8024D6E40C;
	Mon, 19 Apr 2021 16:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CF16E1F3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 08:56:05 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8EDDD58108C;
 Mon, 19 Apr 2021 04:48:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 19 Apr 2021 04:48:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=cAEoK8AnB/XynqHMwPNrkyMBCv
 xGzvJfapPb7iiGB6o=; b=Nr5QiOlXYtVmZLLbxKM/+ZeQfSwN4Isc8ubF1Rg0vH
 HG0f6refNBdd9PyNVy89v2h1ON4oeLoiV97H34Y4s/xfihObMipddCgIkLEt8G1w
 t/qbDu0YikQR5yoZmprrvy/XCLCFk8oUUEar9Fm2XGwBEHtvZUvWXLVobq14dKfW
 zkr2sY94qfO/bhR+275Ce+SIh/982UuFvK/NgWcVNDhAjpxzAKw+GyTcUEVm4ZZ1
 47e8WuAEIZbTH9JV3XqbQgfiD7kx8tVIrqa/wzkSAZDN3u44qXSFvGARZvWoFrW2
 6BWBR0ZAsBujVBOKEFfeCqyrFXk2SDVE0xCy2YXsX2og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=cAEoK8AnB/XynqHMw
 PNrkyMBCvxGzvJfapPb7iiGB6o=; b=ZmQKL3ofgKkRDsWo7yUyoO8r08oVWqhPc
 iOnaXk2gEJWcshrncEOp5qX7vL6FSjF9KI20dAzvTU/2IPS/5hSGVFOM/oFexDkD
 BDjlWS2G8dyeqKJ4lRi+fdRTmOAGCY2i+zg1eGO82dxw9xmyX1sxJ4JcsksJb8Fn
 sVan9ACdNTGVI3cLaC6vTBhoRgsEBSYesESS/NxbiSuudBBx1lm5Hvlmu3jqUDwZ
 AJJ+N1OFO1bGL91ewWvITu4kVDXGWT/Z3nmTz77L/QTMOR6RCwZyQ0UGydr1vV5y
 iMP8ymeWeHMenhTYRoa+T6rEmWnfGEgmbH7Us6F3oNDpi6CU9uVgA==
X-ME-Sender: <xms:y0N9YLXxVlSetvWfRTcAmE22nHTn78yLD-pnRY_DLnsLGdJkN949tQ>
 <xme:y0N9YDgJfzfdMj1C6JRBYwSyO7zHi5Q69tzTEVIV-80JOXnTWWMOlzx2637XuYJjO
 1eQK88Z4vZ4AyctHQY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhr
 segrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeejleeihfdvtefgtd
 ethfdtgefftdeiffefjeeiffefveeuleejheejvefhffeukeenucfkphepkeelrdeggedr
 uddtrdduvdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:y0N9YEQyJHRwI3ppk65tNhCmv7cLRaUgGRrHo5-iCFrZbao-6sNszQ>
 <xmx:y0N9YOFr7QjAum9Z41clhk8bFdWXMTHU6vjCh95L5EbMXtvm0q2pCw>
 <xmx:y0N9YEkebryn0c0npJv5nNYvoJETk4WK2LBJf9UJc-9N6queZ0wSrA>
 <xmx:zUN9YLQ0g-1Uy1hhCDewPt9UnpQjOw7-E-S6VVX_xG6fh9buYXelWQ>
Received: from ThinkpadX1Yoga3.localdomain (unknown [89.44.10.123])
 by mail.messagingengine.com (Postfix) with ESMTPA id 57A57240057;
 Mon, 19 Apr 2021 04:48:06 -0400 (EDT)
From: Alistair Francis <alistair@alistair23.me>
To: robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 krzk@kernel.org, shawnguo@kernel.org, daniel@0x0f.com,
 linux@rempel-privat.de, kuninori.morimoto.gx@renesas.com,
 Max.Merchel@tq-group.com, geert+renesas@glider.be, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH 1/2] dt-bindings: Add E Ink to vendor bindings
Date: Mon, 19 Apr 2021 07:09:55 +1000
Message-Id: <20210418210956.3024-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 19 Apr 2021 16:41:45 +0000
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the E Ink Corporation to the vendor bindings.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 996f4de2fff5..6c9323dc9b78 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -329,6 +329,8 @@ patternProperties:
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
