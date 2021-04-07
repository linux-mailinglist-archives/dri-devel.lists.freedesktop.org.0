Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D01356661
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 10:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329D4898FD;
	Wed,  7 Apr 2021 08:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80CB898FD
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 08:21:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B46E0613E9;
 Wed,  7 Apr 2021 08:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617783662;
 bh=0AGwy6Tl68VsWBu68wDgwZ5CzpVE/d5ORNGmhEDws2g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WKuVO9wh5JlK3fEanSkKl9+DRqJv/o7YL8kRRt+Tg84Tsa51MfDp1r/ViTQY9MQXJ
 /JdJ1o2+EGgIaJJPDblasGpT4Kv9scKk+/1iU5a2mKMmJ63aDQIgTKcckwYVP3qIwm
 9Y70muyNlMCoWxBpG6UyGuJJgiEpYfKq7cqpL76tNBUJRqdcKjYfK1+3JNs399a6wL
 QhFUpYIWkBJZzV2lQSigCPcZJAt1DnGIsczqQolFzV8W5oyBWF1Hg5LJwIEGMQDpFr
 Q8ZzAPbTKLyPAMKCdoC3y8qNrgrukITdvYLuF0U7JQwfokNw5o9jsTksWqrHE1wvqD
 0eG0z3HmrqyFA==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1lU3Qq-005i2N-H5; Wed, 07 Apr 2021 10:21:00 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v2 08/19] dt-bindings: iommu: mediatek: update mediatek,
 iommu.yaml references
Date: Wed,  7 Apr 2021 10:20:47 +0200
Message-Id: <8776972e59432915779acc5bd62d515e5532b612.1617783062.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617783062.git.mchehab+huawei@kernel.org>
References: <cover.1617783062.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Will Deacon <will@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rick Chang <rick.chang@mediatek.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Bin Liu <bin.liu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Houlong Wei <houlong.wei@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changeset bca28426805d ("dt-bindings: iommu: mediatek: Convert IOMMU to DT schema")
renamed: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
to: Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml.

Update the cross-references accordingly.

Fixes: bca28426805d ("dt-bindings: iommu: mediatek: Convert IOMMU to DT schema")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,disp.txt      | 2 +-
 .../devicetree/bindings/media/mediatek-jpeg-decoder.txt         | 2 +-
 .../devicetree/bindings/media/mediatek-jpeg-encoder.txt         | 2 +-
 Documentation/devicetree/bindings/media/mediatek-mdp.txt        | 2 +-
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index 93b160df3eec..fbb59c9ddda6 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -64,7 +64,7 @@ Required properties (DMA function blocks):
 - larb: Should contain a phandle pointing to the local arbiter device as defined
   in Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
 - iommus: Should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
   for details.
 
 Optional properties (RDMA function blocks):
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
index cf60c5acc0e4..39c1028b2dfb 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
@@ -19,7 +19,7 @@ Required properties:
   Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
   for details.
 - iommus: should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
   for details.
 
 Example:
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
index acfb50375b8a..5e53c6ab52d0 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
@@ -17,7 +17,7 @@ Required properties:
   Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
   for details.
 - iommus: should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
   for details.
 
 Example:
diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp.txt b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
index f4798d04e925..caa24943da33 100644
--- a/Documentation/devicetree/bindings/media/mediatek-mdp.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
@@ -25,7 +25,7 @@ Required properties (DMA function blocks, child node):
         "mediatek,mt8173-mdp-wdma"
         "mediatek,mt8173-mdp-wrot"
 - iommus: should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
   for details.
 - mediatek,larb: must contain the local arbiters in the current Socs, see
   Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index 8217424fd4bd..a83ebc1a1c7f 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -18,7 +18,7 @@ Required properties:
   "univpll_d2", "clk_cci400_sel", "vdec_sel", "vdecpll", "vencpll",
   "venc_lt_sel", "vdec_bus_clk_src".
 - iommus : should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
   for details.
 One of the two following nodes:
 - mediatek,vpu : the node of the video processor unit, if using VPU.
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
