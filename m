Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D76E297D96
	for <lists+dri-devel@lfdr.de>; Sat, 24 Oct 2020 19:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648F96E8F2;
	Sat, 24 Oct 2020 17:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88046E0AA
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 13:31:37 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id i1so1871629wro.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 06:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZZZhZb2rEz5fHuVG55QJOamqxxRM5CUTX2itYU5vANI=;
 b=GS5fOfQIIw3GAMYSybwFZT5Uml1Gn5gqpzXW88Ram1s3RNRCBylCYem2I1Wg7k5rL0
 EXZ8Npi3dbjRFjfNP3pY5jMVq2AVTQMvmFmz4rQn0+cWxvIgA7HI62U+yAX19Gzoz1xi
 EVIvDLb0VwGihRMVDBYY2DvsDkFRbmi0oqqFNuHl83mxxz94pi6TOu82iJIKSJA+Nb8C
 16s7BFs1f/gOM3djshd+VuHkUmMe2vffHtBmY+e8+73QJ2tnVsDgvl/8LawF+g7nxiC+
 5PW872nYyg7HAzjeGNHgwzWZlaNaAmi8xWu46qcK3GB90sluZ5kwmfaJqEkgtdN2lzvO
 0Dbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZZZhZb2rEz5fHuVG55QJOamqxxRM5CUTX2itYU5vANI=;
 b=Gpg/1WJhSWSamQjZk0nqhGkpch3bkyxxCqzTUCwkMl0BBbWNXCH536/AQ2p0aaw857
 2Nc9lqN9xxAXUCIMzoBwaDnecLCvagp4ckQX6SqVrjF/2huxSJjPQFA3LcOZ9jrCgZ1s
 +Jwn1LKuqbodNSbD+0SCm8z8LCr81t9E2fqcqzS2K+YMhm9NjFitzHcwoQfz8FCtAIVs
 1RhrlN2Q3zSEMdCCwKTtCx0DdbYR6hn4R0j22xWKtKYcoMEf+DNjXKTq2XoLVX77hW1z
 vrXmAtfxOVwzL/WKz4FIEj1yfm4qt75As8T2NvLvv6DyIdLI14iuYX9t6tJIUpnT+3Nl
 7HPA==
X-Gm-Message-State: AOAM533qNzGC6PDMICXEsWD6CbPESYk92pOb2z4cwa/+T3S/qJq9aw35
 3Zj+yJuUSSoPVWwoJnIWKhGS6w==
X-Google-Smtp-Source: ABdhPJzqrOGaTf+kRDwUvFhLf41amL9nkhiLntJO+SJUCOhPk4RcEpRuGLBe5yMpJi6sbEOlMwjURA==
X-Received: by 2002:a5d:448b:: with SMTP id j11mr2574289wrq.129.1603459896327; 
 Fri, 23 Oct 2020 06:31:36 -0700 (PDT)
Received: from localhost.localdomain (211.160.185.81.rev.sfr.net.
 [81.185.160.211])
 by smtp.gmail.com with ESMTPSA id f6sm3146107wru.50.2020.10.23.06.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 06:31:35 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/5] dt-bindings: display: mediatek: disp: add
 documentation for MT8167 SoC
Date: Fri, 23 Oct 2020 15:31:26 +0200
Message-Id: <20201023133130.194140-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023133130.194140-1-fparent@baylibre.com>
References: <20201023133130.194140-1-fparent@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 24 Oct 2020 17:05:18 +0000
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
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---

Changelog:

V2: No change

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
