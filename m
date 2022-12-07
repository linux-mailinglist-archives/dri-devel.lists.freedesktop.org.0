Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9AD645D5F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 16:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B3210E3C7;
	Wed,  7 Dec 2022 15:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C5789CFA
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 15:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670426048; x=1701962048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=USL4Z3za5AJaPENgC/irQE3V5/hTe59XsEqePd3fa1o=;
 b=OHxA+fF0v/Q9yvkb0b2t3kfXDD7QHKsqYiDN7bdi7oDdu2KcP0ZRakD6
 9K6eZCPugZ6lX3nKqUCgCPXRFnl/CWzu37HRA2jPCOF7Z7e60VkcIApRw
 0CQvbbhYDxxF87ISB+v3cK10dY/3rtopWxS29peCvO/MgDAr/pLJ160wi
 8IN0xP45YSyQlwz7QOowpqjOh91DTOsV3BG3ZkGOWSsSXv1gkhwE1QRVF
 a2Cal8XI+NhxU9kVP3wycfjSddWLX/Yz/lk3JaIsIr6Vj9RxREa1wrCeQ
 A3XX7s2uI/J6l7vfQfSnxRyESgTydXf0TjHSsjDsXjwdrq2oSeakwDAWf w==;
X-IronPort-AV: E=Sophos;i="5.96,225,1665439200"; d="scan'208";a="27816231"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 07 Dec 2022 16:14:05 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 07 Dec 2022 16:14:05 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 07 Dec 2022 16:14:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670426045; x=1701962045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=USL4Z3za5AJaPENgC/irQE3V5/hTe59XsEqePd3fa1o=;
 b=F4UgNbmU8TXZ8lBbRf8sYz3gzKuIta1QxiU74QjH+/lL4BhMcCa4O14C
 84c8CkzIAqxN0u7twrJA2eClQfjNnHto7kv6gbUr+P9ZPxFCIAvb1jNQh
 OZalQwgqwToUB30bzdpJ0cxYGIcxzRPm700SZooCsGXtMifkl48fEirv8
 zbnq4A9djWWYiHZ4sk4OeRHpmfPnMd1ZNAC1dkZrKxQ6Tbhpk4eST14Ei
 U3fen+vq9fJmG0M6mmWy860SlYP7+6ArRiPChrlNDTA6+LRCa77hMDhox
 b2AuV+UCDI7uPOZD9aB+Kp1gEFZpAB5arAeGLIrF0OtYwCC1JbMHcDLAF g==;
X-IronPort-AV: E=Sophos;i="5.96,225,1665439200"; d="scan'208";a="27816230"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 07 Dec 2022 16:14:05 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 1A18B280072;
 Wed,  7 Dec 2022 16:14:05 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/2] dt-bindings: lcdif: Add optional power-domain
Date: Wed,  7 Dec 2022 16:14:00 +0100
Message-Id: <20221207151400.1572582-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207151400.1572582-1-alexander.stein@ew.tq-group.com>
References: <20221207151400.1572582-1-alexander.stein@ew.tq-group.com>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i.MX8MP requires a power-domain for this peripheral to use. Add it as
an optional property.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 793e8eccf8b8b..9d9fb5ad587c2 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -52,6 +52,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description: The LCDIF output port
-- 
2.34.1

