Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F741E59D6
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAD56E4AB;
	Thu, 28 May 2020 07:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2876E33A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:49:33 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id D3E3D582005;
 Wed, 27 May 2020 11:49:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:49:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=2I5zMakGdefyc
 AHM9J30Y7T2xEqngHoH53dlRgc3XbQ=; b=GDPfI1e5KUvbj23n5X227mloVFY/3
 t4ZnnUqAy/V3vYC+s/+6lMhmuG6BtTkgtEbtVzCK94xHj2Q4HA8PR2ZpDuq56By3
 DxgK6hq6FzzbDnvoNjb4XRc5cufhUaM+mYmQ2bBT1FiFV7zIgfKSk3S8q1WcfZGa
 /GjPj0dKNEsd1PXwsfFGN30JySBg37GWLtTjEMlJwyaOnXSm44KQKaVkXVSjdKk1
 mYQCIh0Qza9H5KMKa4z7Lb/1N6lX94AWMlOG9mR+Xh81E7Xu2uxQlqZHeWUFHLjz
 A7Zw9upBF1pbzNOxoXQALpubQutmyZnP2fb5UBvRNgTfhutbsA8XRlN7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=2I5zMakGdefycAHM9J30Y7T2xEqngHoH53dlRgc3XbQ=; b=smWN56+f
 1pwLp2iGMWQSidpEwae8QUOnqW840OQijmct90Dz6zXB6VOYcQmO9RjZfXY/rJSa
 l/Ei/x2nOpNOwmEVtD0n3drmA0ayxudShPW9ezpeP+Uhdm4qPe1U/Ri0p5ygMGLz
 fKkOgxQn+peJ3Xy6PVAB/hdJ3lFPuObAWwb9pFPzQwKITqgzB0eQrZaniug2ryk8
 2CnqmlBdCdcXRqlcYfP62H+qgaVBkw13tlkHnNnBQQ/ETBGkHWDQW6lgb7kT10im
 KmmPdnkGp9HRgD8gbUGNsiEETxL5w5pSc8Um3e8daSFqAJbcLxkJEo6NHHeeYdYC
 g/h/65WiMaQrNw==
X-ME-Sender: <xms:DIzOXnXWO_lISxlUCitH0rnMi4dKb6xYO7PsRyUpc23fbq_uej2VXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdejne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DIzOXvmJ-VLAYX7qZ8v_tQ4_-ZFCAXRL07JbpEF6cARKfTiu9UKe-Q>
 <xmx:DIzOXjbNIZ1MgebVYfsSEM9A8JT1D2v51Vpk3OC615B3pUrb3zZLkA>
 <xmx:DIzOXiVQbowtYBPCONx9JBbLeqp_fX-AKEne-jAcExujoqViiPQBOg>
 <xmx:DIzOXijEe9LvUU_f5KZSujyNyDIGd8kLTiMlvpBXyrygEKgS4FDRQQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 78ABA3280060;
 Wed, 27 May 2020 11:49:32 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 010/105] dt-bindings: display: vc4: Document BCM2711 VC5
Date: Wed, 27 May 2020 17:47:40 +0200
Message-Id: <c92be0086d086cd763160bec08c81dd8b8fd32e6.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BCM2711 comes with a new VideoCore. Add a compatible for it.

Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
index 0dcf0c397375..49a5e041aa49 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
@@ -17,6 +17,7 @@ description: >
 properties:
   compatible:
     enum:
+      - brcm,bcm2711-vc5
       - brcm,bcm2835-vc4
       - brcm,cygnus-vc4
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
