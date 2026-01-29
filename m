Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAXMOcUge2lPBgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:56:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E77AADD63
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:56:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46FF610E828;
	Thu, 29 Jan 2026 08:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cIOplOCj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02A410E7B6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 04:05:41 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-81f4e136481so259307b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 20:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769659541; x=1770264341; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E68djXKo/Qb6+8kiZNd4FljhUOa17e5P51Qp4W2uY20=;
 b=cIOplOCj8zOwQ+J1l6X6j9IKj8Rfl0JGgHF67txMcN0SIeKT6pXtMN1HWBTxf6Pc++
 WiwL6FhdpDshkHURO4IVC3oOcpXR5rhjBbTRRF1kDqEado5E7Q5OFOCR7DEHnPe/X3gf
 OIyTN0TJ3PvEc9UfwyJUK+dThD0t2XqmB/Soml7xiOEfJRRBgtvKrmXgKyGqhtshYJ/R
 nwqF16tAdW1X6W0swYekT2hG+72rXI2NUoMRll9I2K7ljEb22z0oh4b+Il6yI4xKsktl
 z27N32fnindzRPh86RMrHwOzI93Pi+MAchFSTPwpQijlobJtZ4nuDi2mLeXY5MJaHrhH
 Xw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769659541; x=1770264341;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=E68djXKo/Qb6+8kiZNd4FljhUOa17e5P51Qp4W2uY20=;
 b=ZNIoGzsckt1XGLr8xbbOn8ir4O88xmVEy+KguF8c0ci1oncPg6UpQyuW037TQdYXgF
 fGuN0DQ0rjSh2etcHxU0j7uxRAegFJsKb1B/yncXSp3DqSiJGI1is6jB7hlkZ4v8055L
 a9F/Z+ORyIMzz1pK8ymbQHC9tjgZXndus6Oz+iLkj90jH/56whp3l4DkdTEgEwBTqRZl
 j0JOC0lnA8UZrmLLwCgn9yGGX2CIBJGK2QP3+IBO0OzR2o4PvJJ6/hEiuze2F4k2g3Cv
 t3S7nXMRZrYYXQ4YrRWk4a5STX9+7UlWe7BE7qi8+m4umpwh8YcFUX2XxRJX3HyZLCse
 boBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQfrCpQYXzKWkJlbSObPly/vJSgxeXmQCSTEr7NCzPTAtsXKfQNAQMmmUR9uBmJsx+w8spt/pKiYE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQm0rfpAe5TvywUvX+BKh0MN04wKhiJfuQE07N8iz/uc+J7hU4
 qGcRKvlK1Tt8wwqVg/YYNavfTsBrRvxKyBSePsR8xkjzsMgOhO1Nl8vS
X-Gm-Gg: AZuq6aIZP/VW+9lWML3EXiVhyUjYe0+/z6ku9Cf2r/5X6iriC9EXsXCBiiJL6vX+6Qk
 uBDzPYe+e0v0CNFvADudOX5qUgklDnLKfxY+ZwJOAW2B49XCSGi3w/Fp1RsbqV/BaMMmm5GE6ll
 Vm60FDjA8PMTq5faOvcGlhIfVQHPIG7mXy9ojkPl6RTQpKRYGa3jVviXBDLmtGOX0FUi/KMt/ur
 0GB/Ch+Mda5JU3CR8zo6FX1FTg8GwjFBMg8xDQA8k4sgqMlN3HTAIxFZv9F4MJGNTVclmv545yq
 Z47+Qx0tx+egYsXGy4Uw7q5GKNjWkqcgBNd8e7wDeZCW93avcdguDj+df7ntTjbuVBrsTaZp980
 Yud4K5axxOqGyxyZXzyqVLn1MgB37SCRAPm2g591WhK7ti6EVwHppm+T1QeNiVIdbDURBjzaj3A
 9b/z7/Jmkymbfkm5QCkpOzDVegRG67i4y6DXm8ajIN0En0Io4leXKrmbwZ1g3X4m3p8riR0Pqf
X-Received: by 2002:a05:6a00:94f5:b0:81f:3bcb:af2a with SMTP id
 d2e1a72fcca58-8236917be3fmr6772085b3a.26.1769659541008; 
 Wed, 28 Jan 2026 20:05:41 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82379c22672sm3857721b3a.51.2026.01.28.20.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 20:05:40 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 a0987203069@gmail.com, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: display: nuvoton: add MA35D1 DCU binding
Date: Thu, 29 Jan 2026 12:05:30 +0800
Message-ID: <20260129040532.382693-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129040532.382693-1-a0987203069@gmail.com>
References: <20260129040532.382693-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Jan 2026 08:56:34 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:a0987203069@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nuvoton.com,gmail.com,lists.infradead.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[2.102.81.160:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 7E77AADD63
X-Rspamd-Action: no action

Add Device Tree binding documentation for the Display Control
Unit (DCU) found in Nuvoton MA35D1 SoCs.

The DCU is a DPI-based display controller supporting RGB output
with optional external bridges or panels.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/display/nuvoton,ma35d1-dcu.yaml  | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml

diff --git a/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml b/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
new file mode 100644
index 000000000000..adfc20117eb7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/nuvoton,ma35d1-dcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Display Controller Unit (DCU)
+
+maintainers:
+  - Joey Lu <a0987203069@gmail.com>
+
+description:
+  The Nuvoton MA35D1 Display Controller Unit (DCU) supports multiple
+  layers of composition, blending, and output to parallel RGB (DPI)
+  interfaces.
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-dcu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: DCU Gate clock for register access
+      - description: DCU Pixel clock for display timing
+
+  clock-names:
+    items:
+      - const: dcu_gate
+      - const: dcup_div
+
+  resets:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Video output port
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    display@40260000 {
+        compatible = "nuvoton,ma35d1-dcu";
+        reg = <0x40260000 0x2000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk DCU_GATE>, <&clk DCUP_DIV>;
+        clock-names = "dcu_gate", "dcup_div";
+        resets = <&sys MA35D1_RESET_DISP>;
+
+        port {
+            dpi_out: endpoint {
+                remote-endpoint = <&panel_in>;
+            };
+        };
+    };
-- 
2.43.0

