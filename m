Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05577528022
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 10:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BCC112414;
	Mon, 16 May 2022 08:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4F410E25A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 08:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OLouEXO12B6v0omEv8NGlDts4nVs6vMaNq71BYtUazU=; b=kMann90BeDSTS9SfNr1rXbknyf
 FqpWgKJByWlWif2Ah2dDqx7GMKeGOGIJbklcqJprLRpHhgnGTtnJs42ne1VYfOvWYq1wHHoe9joJI
 rIDuXqWURpli5psT2+tLZtUUpQ85LFyUlgzMjN9fm3nkTalSU9yE/KLB9h6jxH9QluNQ0gaPmWcbK
 ufLDAFTxF39ukvYiHzcAoNtaRHGIJi9RCNTWbd0z5v5GDpJnU2NUGW3l8QqKr5RDAu1lQHEcCJFwq
 zqRKPrPcKHGiF0JVID8suPWdImpfWJ9HCbnYABoXwzHejSnzPmgz0FwW+pSNERqBERlrEBRfby0iM
 FGkAXGRQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <cyndis@kapsi.fi>)
 id 1nqWTe-0005fd-H9; Mon, 16 May 2022 11:53:18 +0300
From: cyndis@kapsi.fi
To: thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, robh+dt@kernel.org,
 krzysztof.kozlowski@canonical.com
Subject: [PATCH v5 1/9] dt-bindings: host1x: Add iommu-map property
Date: Mon, 16 May 2022 11:52:50 +0300
Message-Id: <20220516085258.1227691-2-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516085258.1227691-1-cyndis@kapsi.fi>
References: <20220516085258.1227691-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Add schema information for specifying context stream IDs. This uses
the standard iommu-map property.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
v3:
* New patch
v4:
* Remove memory-contexts subnode.
---
 .../bindings/display/tegra/nvidia,tegra20-host1x.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
index 4fd513efb0f7..0adeb03b9e3a 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
@@ -144,6 +144,11 @@ allOf:
         reset-names:
           maxItems: 1
 
+        iommu-map:
+          description: Specification of stream IDs available for memory context device
+            use. Should be a mapping of IDs 0..n to IOMMU entries corresponding to
+            usable stream IDs.
+
       required:
         - reg-names
 
-- 
2.36.1

