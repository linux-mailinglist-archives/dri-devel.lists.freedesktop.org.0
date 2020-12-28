Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F512E35D2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Dec 2020 11:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B54589B00;
	Mon, 28 Dec 2020 10:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E463897EE
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 10:02:03 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id f14so5699424pju.4
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 02:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zHfnNx0J3r3BjI2ETPq9kmvQWmw+pKoPMGoXArL8lcQ=;
 b=uuIkDnzFiQ46bqkuMSED83M1+xu9rcfblRWN/z96s1e/E7c/fN9Rt7wjv0khxii1SS
 s+XwH1wYSCfxvHtR1BYKdqkFPTwVoe8b82qEhylYMw2LbRVnAZNYBotbDosOk12b7OXT
 mcoKIwGT1zxTHV76dBr2nuOU1hHbk92H8SKlOxzJ6ejKDC0IcBjw34iI323jL2HrcInN
 vnnGQ0h6Ur9TNi6S1x/v2pOfRJ9qqVq9/XS9/f+YAq3mLJAOwWJcdYvIwOqxRprA7FbS
 FNDp1eNIoNu3+OSWZucW8ZFl+rsr54MSfyEjcvUdqgrmgUZbn+oKHEruRqcF8Nzh+1uZ
 bobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zHfnNx0J3r3BjI2ETPq9kmvQWmw+pKoPMGoXArL8lcQ=;
 b=e8TWsQFEpQYTtUfRjC7+01cFZ94op27Y25Li6K6W6oSqc7yxxVJgxOdsGKGA04unWU
 JXqeYnre8B7lbHrYZTLaHrWyW4w7bs00RAukAW684QegExF+SZ9N39ANlrVji3n0sxbQ
 1BSnA+cfDIP5dsQpR0JfFSrZ404tCUhGDBDfYbpXhCyMX5lxLsMUkQClS7QsUd3vP/dS
 BVa6JsfaWvzUba8Z+vwsNSD86Gkz4mwUbzpl/yZBLh8vf4DjWydWy7T9LgKd6n9V2iNd
 8Ginopzi0DWyB5FaDELEPKlYbmPAYVSBqmTZ1HTkPMQ7qzMkqlqeO/+Du+iFqU8kJQtg
 4R6A==
X-Gm-Message-State: AOAM532Y/TaZoo8rpk8qQKoNGJ2H/Ee6T8zAhprzIb7MLTiyozlGCA/l
 ZUOTk/ai4l3R48QKbqb3Ae8=
X-Google-Smtp-Source: ABdhPJw6MrtK9ABsb5+uxGCF/YNyyzyA3Wig1l4YTaVHxAp42e3RStEpPvNWMaEvOQq9OA/5WtxX2g==
X-Received: by 2002:a17:90a:3cc6:: with SMTP id
 k6mr20231275pjd.204.1609149722779; 
 Mon, 28 Dec 2020 02:02:02 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id s1sm33775240pjk.1.2020.12.28.02.01.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Dec 2020 02:02:02 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH v2 1/6] dt-bindings: display: add Unisoc's drm master bindings
Date: Mon, 28 Dec 2020 18:01:42 +0800
Message-Id: <1609149707-21411-2-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609149707-21411-1-git-send-email-kevin3.tang@gmail.com>
References: <1609149707-21411-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Mon, 28 Dec 2020 10:19:13 +0000
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
Reviewed-by: Rob Herring <robh@kernel.org>
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
