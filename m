Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6446B17435
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 17:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1EF810E7C9;
	Thu, 31 Jul 2025 15:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D31B10E7C5
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 15:52:58 +0000 (UTC)
Received: from srv01.abscue.de (localhost [127.0.0.1])
 by spamfilter.srv.local (Postfix) with ESMTP id 967D01C270F;
 Thu, 31 Jul 2025 17:52:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on abscue.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=4.0.1
Received: from fluffy-mammal.metal.fwg-cag.de (unknown
 [IPv6:2001:9e8:cdc9:0:1347:874c:9851:58c6])
 by srv01.abscue.de (Postfix) with ESMTPSA id AE9F51C270C;
 Thu, 31 Jul 2025 17:52:50 +0200 (CEST)
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Thu, 31 Jul 2025 17:51:14 +0200
Subject: [PATCH v3 01/16] dt-bindings: display: sprd: adapt for UMS9230 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250731-ums9230-drm-v3-1-06d4f57c4b08@abscue.de>
References: <20250731-ums9230-drm-v3-0-06d4f57c4b08@abscue.de>
In-Reply-To: <20250731-ums9230-drm-v3-0-06d4f57c4b08@abscue.de>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Kevin Tang <kevin.tang@unisoc.com>, 
 Liviu Dudau <Liviu.Dudau@arm.com>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, Eric Anholt <eric@anholt.net>, 
 Kevin Tang <kevin3.tang@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
X-Mailer: b4 0.14.2
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

Add new compatible strings for the DPU and DSI controller found in the
UMS9230 SoC.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 .../devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml         | 7 ++++++-
 .../devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml    | 4 +++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
index 8c52fa0ea5f8ee2149ebf1d4b0d5b052832e3d97..cfa162178fe11df149f2f8dcb03383dafc44868e 100644
--- a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
@@ -16,7 +16,12 @@ description: |
 
 properties:
   compatible:
-    const: sprd,sharkl3-dpu
+    oneOf:
+      - items:
+          - enum:
+              - sprd,ums9230-dpu
+          - const: sprd,sharkl3-dpu
+      - const: sprd,sharkl3-dpu
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
index 300bf2252c3e8e589dc74927520e24aa4a59f81b..9177ae6aa7a33f7f797b48cfe06cf8a5391b34a9 100644
--- a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
+++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: sprd,sharkl3-dsi-host
+    enum:
+      - sprd,sharkl3-dsi-host
+      - sprd,ums9230-dsi-host
 
   reg:
     maxItems: 1

-- 
2.50.0
