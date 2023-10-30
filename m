Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 650747DB51D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 09:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5E810E23D;
	Mon, 30 Oct 2023 08:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EACD10E23D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 08:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rx5RuXDzbafTtPE1V85jLlQ8QR49T9ze/opO/yr6tFY=; b=bp1IeNl0+AGB86x2DnyQ24qMbq
 G/GfDAV9EOkH01X2aiDrjUAbWnL7etlMg05eUqkrT5CQPNJm8bucXRqiVvhdl4IQYhpJXh0de5zLE
 eJDAE1IY/SkaS1dNw8zWAetsYenmBQ+kKmyFNzBa3WrZwiUIR9d7/1qmABmYJ0LsVKcog9PmURnNg
 1bmMHy+joitYH8WV8CV8QEq+IJtiMPvi6T3mXR6lEZkiWdXn6MCnNGDCEhWNkuew0vhgin+Rrt+8y
 qM6NWfMCJxU4tWn+ukPcB1HDHjgSltD20o67GuQ4gYf5Swromdf04U+XkBiEbsuMpG/5JFh1QwNW+
 8zsV/e5g==;
Received: from 229.48.60.213.dynamic.reverse-mundo-r.com ([213.60.48.229]
 helo=vega..) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qxNeB-00Ep4m-R0; Mon, 30 Oct 2023 09:29:19 +0100
From: Iago Toral Quiroga <itoral@igalia.com>
To: Maira Canal <mcanal@igalia.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] dt-bindings: gpu: v3d: Add BCM2712's compatible
Date: Mon, 30 Oct 2023 09:28:57 +0100
Message-Id: <20231030082858.30321-4-itoral@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231030082858.30321-1-itoral@igalia.com>
References: <20231030082858.30321-1-itoral@igalia.com>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 Melissa Wen <mwen@igalia.com>, Rob Herring <robh+dt@kernel.org>,
 Iago Toral Quiroga <itoral@igalia.com>, Stefan Wahren <wahrenst@gmx.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

BCM2712, Raspberry Pi 5's SoC, contains a V3D core. So add its specific
compatible to the bindings.

v2: new, requested by Stefan Wahren.

Signed-off-by: Iago Toral Quiroga <itoral@igalia.com>
---
 Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
index dae55b8a267b..dc078ceeca9a 100644
--- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
+++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - brcm,2711-v3d
+      - brcm,2712-v3d
       - brcm,7268-v3d
       - brcm,7278-v3d
 
-- 
2.39.2

