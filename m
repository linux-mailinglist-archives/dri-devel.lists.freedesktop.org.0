Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C09B2948C2
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 09:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F676F46F;
	Wed, 21 Oct 2020 07:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614EA6ED90
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 17:43:00 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z22so1626939wmi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 10:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WPldaAln0wKV7enamBXwVRl5MAfLsITQC/GnZaAj1po=;
 b=wdF9uoO+Ykbhxvbj/BpimI1WuFHEdYHMfvhomEaYkckQkI4DtzI3Dr/dLEZjcQeH61
 TRk+GZZuWg4DrKcU9BlaJP59g048zt5611B7itGSWHXYrjTwCTfLXo9cWlKuekgY5nqD
 F/Y9Srju0qajoPep+dnWtRxj+TIIc/6v7TTjeHY/qCzDyfC0wXVB24XYjeDA9guBd2T2
 NoFzhVNKNZ8Cr1sBnaulV99aq8LB6POuSCaCZQPmoKyRyDzowb6anbSOS3ac6FCrS5gz
 tj42kqp7bAFF+RTciFBlHkcSGW3kblhffsApqgY4Udc4K5gJ3Y8YgApx54/WsQYGhUZ1
 4SOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WPldaAln0wKV7enamBXwVRl5MAfLsITQC/GnZaAj1po=;
 b=q61AZwrjPWlW65qqH0PTPOMn8IRAjcE2i7fADlCWL3vIgEnN6xxLCnoedsoCpgRbBJ
 K2UnRkD6MPBPkwBm4m6nfwv+9jgFAbH3fm/GLTG1qJvDgSHBUz+eFGwOvGjccSkROP0y
 L4pGAVex5IpT8UILhrocZt3t/Cm2vXx9Rj/MZGAXcw7fJiCk02AQqYXELpdkzJURKz5z
 ZFZKu9cdiUp3bjVM9T2MeES6QwHTUqtoKyoMlZv/zdDP3twY9kUXuIndkfJFSu9+2XNq
 yQSTJC1WG0VctcGhaY/CaGaeMlxAHteHn820PBQeyqluLg8z4oQwVh8hfSswpQdvLt2Z
 qy9g==
X-Gm-Message-State: AOAM530Us+V/drjdkrvuaZGWiC9WqYlJK4P0C2xaBevXYTUkHKqO6KTD
 W12ApBs3GPwTVoAxb9XDNIdn7A==
X-Google-Smtp-Source: ABdhPJzc5f87ZwIDIbbgCVZgs9r3XrFUb0sfEhjseIGs62RR8xgLtEjhevlVDme05La0zhRYaSYRAA==
X-Received: by 2002:a1c:4c03:: with SMTP id z3mr3983936wmf.24.1603215779042;
 Tue, 20 Oct 2020 10:42:59 -0700 (PDT)
Received: from localhost.localdomain (199.170.185.81.rev.sfr.net.
 [81.185.170.199])
 by smtp.gmail.com with ESMTPSA id v123sm3297756wme.7.2020.10.20.10.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 10:42:58 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/8] dt-bindings: display: mediatek: disp: add documentation
 for MT8167 SoC
Date: Tue, 20 Oct 2020 19:42:46 +0200
Message-Id: <20201020174253.3757771-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020174253.3757771-1-fparent@baylibre.com>
References: <20201020174253.3757771-1-fparent@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 21 Oct 2020 07:16:42 +0000
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie,
 Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add binding documentation for the MT8167 SoC

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,disp.txt    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index 121220745d46..33977e15bebd 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -43,7 +43,7 @@ Required properties (all function blocks):
 	"mediatek,<chip>-dpi"        		- DPI controller, see mediatek,dpi.txt
 	"mediatek,<chip>-disp-mutex" 		- display mutex
 	"mediatek,<chip>-disp-od"    		- overdrive
-  the supported chips are mt2701, mt7623, mt2712 and mt8173.
+  the supported chips are mt2701, mt7623, mt2712, mt8167 and mt8173.
 - reg: Physical base address and length of the function block register space
 - interrupts: The interrupt signal from the function block (required, except for
   merge and split function blocks).
@@ -59,7 +59,7 @@ Required properties (DMA function blocks):
 	"mediatek,<chip>-disp-ovl"
 	"mediatek,<chip>-disp-rdma"
 	"mediatek,<chip>-disp-wdma"
-  the supported chips are mt2701 and mt8173.
+  the supported chips are mt2701, mt8167 and mt8173.
 - larb: Should contain a phandle pointing to the local arbiter device as defined
   in Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
 - iommus: Should point to the respective IOMMU block with master port as
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
