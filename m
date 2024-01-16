Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F017B82EFD9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 14:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D8B10E498;
	Tue, 16 Jan 2024 13:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0451910E5A0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 13:42:03 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40GDfkFN027729;
 Tue, 16 Jan 2024 07:41:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1705412506;
 bh=WCMncCjEepMlq1gpfShPVfJNFIGS/foDr0vBL+xIwmk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=yFf62Bq6sAkzE99MAreaLVa3Qr+DvoixEYqFkgzXvB1zFYUXrLnO7GODXjtddaaQ+
 DlTdDpjBN+y11Qx3vXDjX/Pi0ydPfYm4qws8Y2Cz5KOe4cKxjApX1dvSl6Uqi7Wh25
 82n7IXpsrn6FqzixTXLK1l+0T1fhwLjCnfCxDygY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40GDfke9011388
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Jan 2024 07:41:46 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jan 2024 07:41:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jan 2024 07:41:46 -0600
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40GDfjx4093381;
 Tue, 16 Jan 2024 07:41:45 -0600
From: Devarsh Thakkar <devarsht@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
Subject: [RFC PATCH 1/3] dt-bindings: display: ti,
 am65x-dss: Add support for display sharing mode
Date: Tue, 16 Jan 2024 19:11:40 +0530
Message-ID: <20240116134142.2092483-2-devarsht@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240116134142.2092483-1-devarsht@ti.com>
References: <20240116134142.2092483-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: praneeth@ti.com, j-luthra@ti.com, devarsht@ti.com, a-bhatia1@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for using TI Keystone DSS hardware present in display
sharing mode.

TI Keystone DSS hardware supports partitioning of resources between
multiple hosts as it provides separate register space and unique
interrupt line to each host.

The DSS hardware can be used in shared mode in such a way that one or
more of video planes can be owned by Linux wherease other planes can be
owned by remote cores.

One or more of the video ports can be dedicated exclusively to a
processing core, wherease some of the video ports can be shared between
two hosts too with only one of them having write access.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
 .../bindings/display/ti/ti,am65x-dss.yaml     | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 55e3e490d0e6..d9bc69fbf1fb 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -112,6 +112,86 @@ properties:
       Input memory (from main memory to dispc) bandwidth limit in
       bytes per second
 
+  ti,dss-shared-mode:
+    type: boolean
+    description:
+      TI DSS7 supports sharing of display between multiple hosts
+      as it provides separate register space for display configuration and
+      unique interrupt line to each host.
+      One of the host is provided access to the global display
+      configuration labelled as "common" region of DSS allows that host
+      exclusive access to global registers of DSS while other host can
+      configure the display for it's usage using a separate register
+      space labelled as "common1".
+      The DSS resources can be partitioned in such a way that one or more
+      of the video planes are owned by Linux whereas other video planes
+      can be owned by a remote core.
+      The video port controlling these planes acts as a shared video port
+      and it can be configured with write access either by Linux or the
+      remote core in which case Linux only has read-only access to that
+      video port.
+
+  ti,dss-shared-mode-planes:
+    description:
+      The video layer that is owned by processing core running Linux.
+      The display driver running from Linux has exclusive write access to
+      this video layer.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [vidl, vid]
+
+  ti,dss-shared-mode-vp:
+    description:
+      The video port that is being used in context of processing core
+      running Linux with display susbsytem being used in shared mode.
+      This can be owned either by the processing core running Linux in
+      which case Linux has the write access and the responsibility to
+      configure this video port and the associated overlay manager or
+      it can be shared between core running Linux and a remote core
+      with remote core provided with write access to this video port and
+      associated overlay managers and remote core configures and drives
+      this video port also feeding data from one or more of the
+      video planes owned by Linux, with Linux only having read-only access
+      to this video port and associated overlay managers.
+
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [vp1, vp2]
+
+  ti,dss-shared-mode-common:
+    description:
+      The DSS register region owned by processing core running Linux.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [common, common1]
+
+  ti,dss-shared-mode-vp-owned:
+    description:
+      This tells whether processing core running Linux has write access to
+      the video ports enlisted in ti,dss-shared-mode-vps.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
+  ti,dss-shared-mode-plane-zorder:
+    description:
+      The zorder of the planes owned by Linux.
+      For the scenario where Linux is not having write access to associated
+      video port, this field is just for
+      informational purpose to enumerate the zorder configuration
+      being used by remote core.
+
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
+dependencies:
+  ti,dss-shared-mode: [ 'ti,dss-shared-mode-planes', 'ti,dss-shared-mode-vp',
+                        'ti,dss-shared-mode-plane-zorder', 'ti,dss-shared-mode-vp-owned']
+  ti,dss-shared-mode-vp: ['ti,dss-shared-mode', 'ti,dss-shared-mode-planes',
+                          'ti,dss-shared-mode-plane-zorder', 'ti,dss-shared-mode-vp-owned']
+  ti,dss-shared-mode-planes: ['ti,dss-shared-mode', 'ti,dss-shared-mode-vp',
+                              'ti,dss-shared-mode-plane-zorder', 'ti,dss-shared-mode-vp-owned']
+  ti,dss-shared-mode-plane-zorder: ['ti,dss-shared-mode-planes', 'ti,dss-shared-mode-vp',
+                                    'ti,dss-shared-mode', 'ti,dss-shared-mode-vp-owned']
+  ti,dss-shared-mode-vp-owned: ['ti,dss-shared-mode-planes', 'ti,dss-shared-mode-vp',
+                                'ti,dss-shared-mode', 'ti,dss-shared-mode-plane-zorder']
+
 allOf:
   - if:
       properties:
@@ -123,6 +203,8 @@ allOf:
         ports:
           properties:
             port@0: false
+            ti,dss-shared-mode-vp:
+            enum: [vp2]
 
 required:
   - compatible
-- 
2.34.1

