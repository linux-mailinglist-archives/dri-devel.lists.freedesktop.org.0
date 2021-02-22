Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A787321893
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 14:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319066E513;
	Mon, 22 Feb 2021 13:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590CE6E513
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 13:28:33 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id t25so10221768pga.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 05:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jsm3+HZOmxhPoZR+ypYQW7uBv7hcvxeE5PgZ0juQepE=;
 b=EIrwdlXKGB50caoH7J0gDxitI3FEATlg6kTrQnV0GiQDrJN5Dx/nyT1w6S9wSaR6wa
 tuyfjnxfUsojW6LeMA2zgsDUQ3R/t4ToVeMnRhd8XHMGZzkfYp0AZfwVoZg/3gg8slJE
 oZpPneAW+x+81/ce488k3/1Xt9+GBnxXW6BOYcJiqaMXYACO9Rt4qSRbyse51OI3kDGQ
 0U31AkF158ZMn9ei0TrNMKsihXsC8KzU9yksRy/c1ksvAngSBMUWQnms/aEMDIGNn6FW
 O3zNZPKsYg7Ow58k8roZL9H7S+UNTBBQ+kkLOrrY/bzaT/LMGGShup7aMJr4+aKfMBBx
 p6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jsm3+HZOmxhPoZR+ypYQW7uBv7hcvxeE5PgZ0juQepE=;
 b=CS7XoBEUfDvXsolaSfdIEI9TMICw9bvBZSelvyQxK7dOWQh1/pnI9RefvbwGuGEFbX
 xp8nN0sJ2FCVDr4j9rQzZM+9PF1Kz1shvtH17z6aHJLxWrF8JtKCT7xmxNebRaJJQ9Q3
 R2nwx7rkBBhuWIXzWRP38Y4kdXCSJ4Gq+Kocmrlb+Y22l/0OUsOb3WsSCrm+a8npvr3S
 iz4RxKV1HmwWQyBpScWBLIEXQlJ/l5dSoO6yLqh4MJnHhEqL//3dYL761OotxG5Poi/F
 dnffcNgWRGGQfe7+gzZ0Y2ue06p48Ug2DnlXO+uMNuJft4vwTyp8qG71XqdOgDWmfJjK
 o4SA==
X-Gm-Message-State: AOAM533GGJV5YVUBxFhD5odELHPbVVHYdvH+8WR6mY8GMNaZH9/zC2GB
 JeRLD9MAgImdY7vDIV9SRaQ=
X-Google-Smtp-Source: ABdhPJyhDWSknydPlsa8Dzca37VBQag3krIIEmpumaCA/rNYfjJK+zqMP3jScWrBK2fRy5oi4B0VlQ==
X-Received: by 2002:a62:e10c:0:b029:1ed:b772:5981 with SMTP id
 q12-20020a62e10c0000b02901edb7725981mr2565370pfh.80.1614000513019; 
 Mon, 22 Feb 2021 05:28:33 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id 141sm19585334pfa.65.2021.02.22.05.28.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Feb 2021 05:28:32 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH v4 1/6] dt-bindings: display: add Unisoc's drm master bindings
Date: Mon, 22 Feb 2021 21:28:17 +0800
Message-Id: <20210222132822.7830-2-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210222132822.7830-1-kevin3.tang@gmail.com>
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
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
Cc: orsonzhai@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 zhang.lyra@gmail.com
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/sprd/sprd,display-subsystem.yaml  | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
new file mode 100644
index 000000000..3d107e943
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
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
