Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIwuIu90eGnEpwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:18:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE4090FF8
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28E810E4D7;
	Tue, 27 Jan 2026 08:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EI/Y7pG8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030D210E3EA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 08:59:18 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-c636487ccaeso870704a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 00:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769417958; x=1770022758; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xhETkR8BTNErY7rf9frMZHrNNt0dwrD/s7H9/3Vpz5E=;
 b=EI/Y7pG8w/pRXW7s2p5AKlhXeI1Aw0a/OLgEXHm4ltUHhQQfnxu/WCl8yuBvWMFHZo
 ukr9lD0O1r8KDAmWbAYuyUhLkAFjCBVv7En4YN1jXGPPgBfNypiY7EPuZJyVvCEacghL
 3dnW2AfAlVwraF+IZz6KXYYNeyJwzkfzzIgLgDKB0XTxiE4ObzADeAtcjfZJgsZPus/n
 /SVC3FiODt/nAfUAGeA4rxeBmCGIqopCFkPNSK1yQCm5g/ANxFziGeGq4pg/WSfqvvgg
 YmHbIsUkhE/ht1tLjopktuesQ8hngDbjtpYZFDwln1IBss1pcB3ZoBNgpts2u5xUo64w
 E2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769417958; x=1770022758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xhETkR8BTNErY7rf9frMZHrNNt0dwrD/s7H9/3Vpz5E=;
 b=lDGOo0erRYAOmg7ah9R+LS9gaBPfisP+hzMZdrk4ol4K3wNW/Vf7teNKroMtPimKhA
 ElRJBXNYw4InneOhAcoCMM0gE7HNaMLr1H5CU0assYf8dGRnKaYxIoC4554t7O8Q3QZQ
 BXa0OV6d2RxKEiTOxXEbpaCQsxtQ6Du0bUOtnbG12ykXTL34oumt4uclXtzXM8VtNay2
 m+JdOS5KhPojO1fUwC2yLqCONEEQzcJQOq/7P1OnT6NZAWgI0H/tFkImxc2+CpPdACuv
 3A1/HR1DyCpN95I46Oy+LmDpzlNWD4/SHbVkVhcdjPEDapV7CKDnamHUrGlNwH6Dz6OG
 edgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCuyOjyxURnPnvMVChtrynFSwMz2qLr0IFGDjKadTr13ahtSwa61Cc/gA8kgtvjBUFIZJKroTvyv8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymsOjYlVyLW3Km/qTneYL76tUfRWSxTR9FdXJKomBLXAwwW3Ji
 PeE2bEX5URkktYgQuD+Zt0hBP16J51OQm6H05hEcMpB9tMAsFg28IZfM
X-Gm-Gg: AZuq6aKfmMDooOupzhVXoLXYNPm3XuFQ9uHkQB22kOpHwg8uCL7iUPs1Ulxt5DUl+tM
 v9No3zyqtB2sCjmtLl/jgFP/VIGXlz1OI3knjIAGbnzCZ4pS/tbZ4GhwZbul5BlsTKqTrcsBjU6
 OtIXk5kQHhT9cize3kf1k+ZOVLrpSHr4eFROjxuBXhJUMuFNvh86sojEABpYV4geyfQA8u1Q6qZ
 W/UHCD4+0fi3B/r3ZyzVT3VOxDK2ipCWi0nkTLkEvsVV3uwPZp6zKxwnEXALfMKui/o1nN+kjPC
 VMU53OftadciISbnp+03F3KZPaBVk46h/4g81DO4SABnn8nwlqYnsJ4rSQSPXcXjZkNS9qkVcXv
 4DjbHRSim/MJyBIXDiAVyNpd8QiKhnzZclXgBD/To8L9D1aZveZNO6Ia959/zGQIoOiV3Qt46n3
 BOVqB/6BlDnG+ZWaI9OqhnlBbvg02B/sFke+xNV+SzjUGrHNQTd6dVsYZ6NwrF3Uz2CE8V6TaX
X-Received: by 2002:a17:90b:2cc6:b0:352:e3d1:8d69 with SMTP id
 98e67ed59e1d1-353c40b9e8bmr2572049a91.1.1769417958446; 
 Mon, 26 Jan 2026 00:59:18 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3536dc3e0ecsm8251798a91.10.2026.01.26.00.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 00:59:18 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 a0987203069@gmail.com, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: display: nuvoton: add MA35D1 DCU binding
Date: Mon, 26 Jan 2026 16:57:25 +0800
Message-ID: <20260126085727.2568958-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126085727.2568958-1-a0987203069@gmail.com>
References: <20260126085727.2568958-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 27 Jan 2026 08:18:47 +0000
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
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:a0987203069@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[nuvoton.com,gmail.com,lists.infradead.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,2.102.81.160:email]
X-Rspamd-Queue-Id: EFE4090FF8
X-Rspamd-Action: no action

Add Device Tree binding documentation for the Display Control
Unit (DCU) found in Nuvoton MA35D1 SoCs.

The DCU is a DPI-based display controller supporting RGB output
with optional external bridges or panels.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/display/nuvoton,ma35d1-dcu.yaml  | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml

diff --git a/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml b/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
new file mode 100644
index 000000000000..e3b79b5b7dbd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
@@ -0,0 +1,74 @@
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
+  - port
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
+        compatible = "nuvoton,ma35d1-drm";
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

