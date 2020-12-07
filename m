Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B0F2D2615
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C386E9C5;
	Tue,  8 Dec 2020 08:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91136E85F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 14:50:38 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id i3so6619892pfd.6
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 06:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vrrEiyyZ4w15dxdldM0El36dYiAlZNUkE/azvm2gXww=;
 b=AY16VVGgkE9e7fMqvn+JJTlDm04VVbqbxGWOtyPG1a8qgcBmeTOWCAgxUcFLt1dxOo
 jeE5hbDZB6S+oKldBajg3LFQP/frVZDveH1rOzq7+kSfuFi1/E5mrwiqsjOIuzua7DdO
 Q1erIYF7qJfg+x1730gvs2DHqr911Z74cJXxQsTqXxytdCT0HpuQwOFTpE2/rF4+pgim
 ShsyJ1cRBIAU88WBSQIo3qYUcu5bpYNRVOx63MCyVxHTEHQ+v+8hd7i/8DMwSUmgIhXn
 f7r8nzTYCd6f7LrdoiF2qiGfqz5dtnYis/ewlo2gk7HjV6nUKZ9MlDtniKdWrGH6hGvX
 sUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vrrEiyyZ4w15dxdldM0El36dYiAlZNUkE/azvm2gXww=;
 b=lus9qCybfJuhsqtmRC70Ydwdzw61YpK1kUtV692KtggTWMZsEhpCDFehMmIcMhN/ET
 KKTEE4cF5bwo+fxCgT8osTAUtlSV7svJun78w2hSbqH40MnkCKRmNgNB+ncmSer2xEOn
 VSemAPRLw4T9L/dtfCC4hNA8x4J8hnIw/ThdhjIHbdDN9gjMXlsiOZk38KFkfD0Ivyin
 47ILGkLoi87pnfsn7xnwIQIW35vEf1g6yzqMeq2Ymq05rvejhJ1QwF2gQo33YPPBHKka
 R1GYeFDiyMsqobXLhC8anA7cvNnK1Zxg3iLNF1g1oW+Lp9rDJDsyKdDTlzYXurRE5r48
 JJSg==
X-Gm-Message-State: AOAM5337embIm+MwLRSXOBg9UOyQFKwSFJb/F+yCGIOtTnfV0HeN6hzz
 KSFgH6xynx85usHvcne5h8GxMDE6/6oJxA==
X-Google-Smtp-Source: ABdhPJzqTGwAZtfbeQlp10zIoKme4tqqT1RSN9sFTLNtmDvRWBpwawh+ZzCn2fgffRuTGWqhUq9uGw==
X-Received: by 2002:a63:f708:: with SMTP id x8mr13092525pgh.369.1607352638443; 
 Mon, 07 Dec 2020 06:50:38 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id u25sm10360249pgl.68.2020.12.07.06.50.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Dec 2020 06:50:37 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH v1 1/6] dt-bindings: display: add Unisoc's drm master bindings
Date: Mon,  7 Dec 2020 22:50:21 +0800
Message-Id: <1607352626-26088-2-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607352626-26088-1-git-send-email-kevin3.tang@gmail.com>
References: <1607352626-26088-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: orsonzhai@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 zhang.lyra@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin.tang@unisoc.com>

The Unisoc DRM master device is a virtual device needed to list all
DPU devices or other display interface nodes that comprise the
graphics subsystem

Unisoc's display pipeline have several components as below
description, multi display controllers and corresponding physical interfaces.
For different display scenarios, dpu0 and dpu1 maybe binding to
different encoder.

E.g:
  dpu0 and dpu1 both binding to DSI for dual mipi-dsi display;
  dpu0 binding to DSI for primary display, and dpu1 binding to DP for external display;

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 .../display/sprd/sprd,display-subsystem.yaml       | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
new file mode 100644
index 0000000..3d107e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sprd/sprd,display-subsystem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc DRM master device
+
+maintainers:
+  - Kevin Tang <kevin.tang@unisoc.com>
+
+description: |
+  The Unisoc DRM master device is a virtual device needed to list all
+  DPU devices or other display interface nodes that comprise the
+  graphics subsystem.
+
+  Unisoc's display pipeline have several components as below description,
+  multi display controllers and corresponding physical interfaces.
+  For different display scenarios, dpu0 and dpu1 maybe binding to different
+  encoder.
+
+  E.g:
+  dpu0 and dpu1 both binding to DSI for dual mipi-dsi display;
+  dpu0 binding to DSI for primary display, and dpu1 binding to DP for external display;
+
+          +-----------------------------------------+
+          |                                         |
+          |                            +---------+  |
+  +----+  |   +----+    +---------+    |DPHY/CPHY|  |   +------+
+  |    +----->+dpu0+--->+MIPI|DSI +--->+Combo    +----->+Panel0|
+  |AXI |  |   +----+    +---------+    +---------+  |   +------+
+  |    |  |                  ^                      |
+  |    |  |                  |                      |
+  |    |  |      +-----------+                      |
+  |    |  |      |                                  |
+  |APB |  |   +--+-+    +-----------+    +---+      |   +------+
+  |    +----->+dpu1+--->+DisplayPort+--->+PHY+--------->+Panel1|
+  |    |  |   +----+    +-----------+    +---+      |   +------+
+  +----+  |                                         |
+          +-----------------------------------------+
+
+properties:
+  compatible:
+    const: sprd,display-subsystem
+
+  ports:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Should contain a list of phandles pointing to display interface port
+      of DPU devices.
+
+required:
+  - compatible
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    display-subsystem {
+        compatible = "sprd,display-subsystem";
+        ports = <&dpu_out>;
+    };
+
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
