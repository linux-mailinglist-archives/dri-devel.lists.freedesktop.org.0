Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0E2439277
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 11:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A2889CDB;
	Mon, 25 Oct 2021 09:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BB289CDB
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 09:35:03 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 v1-20020a17090a088100b001a21156830bso4447455pjc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 02:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pL2wYs0FKur1p37EfD6cIh4PXL/x/Qnvjj6a9pn8Rhw=;
 b=GZTlyD5SFsCx5JmILsskLqqU39Sr2F/Kyho2MyNKkmwpM/JLYu/j4HpmWzmG+s5gNO
 v9/u1XlodTjLEcFPSZLK/SsPsY4t6orDOelk0Pq5N9PAc2KVxIIzqKU0I2VVSm16yK+C
 qypcQrNZKhmM1YHgSIZD0wY/wWCjTDtWQK0sjIGtjRkVoyVPofX+i0g2MWe4OaMJoUzi
 jtLHVdRfV1eXNj3AiE3SVWF8m7iwaO2tlp1haXEz8w6gOjqUQMITOSY0/MkQovY2DWyz
 Q0ixEzTj3kc2LglqZ9rKAuGRxjD56NKY4SbgnhHQsbudfAqRIMpxa0dK10RSyHt8ChCu
 3uYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pL2wYs0FKur1p37EfD6cIh4PXL/x/Qnvjj6a9pn8Rhw=;
 b=yRybGT6X5qXcuGwkmepRi9F8Gb5Pd9Tn+78Eie8nOQUi3J5z5m6WYkZQ39c8EEte1d
 N7fjDtIMhiN6Tdn92YTppEI5lJaHRcvGsGhQ1tTm5L8j8HHPKfyHGcMBIJ3IsG9O/vQp
 0ey/IZE+aV0MshIstlSrxZOVgE/yi65hxDxz/ATK62tIzrtbT1lQxZb8FIvJctyUmj73
 tTfaLZhkvsPDmsYi9Kvrm89F0HmVvpukNLKfSu7RQTCJNICIR2DRtMFASTWYxKkD8U6m
 Q5MZmhE9FzU2GR2eTQqM3rbXVGGQGOA23CS/l/aiA90dm8XVpBWvLvQRqH/G8LqzLgK2
 Hx+g==
X-Gm-Message-State: AOAM532pipoTI2B2f+wdg1d7OyRUlE9o5nhsDGd3IUoGdRDAByLZ8Swe
 1sz+yE3upRmYZJaI3VgXM50=
X-Google-Smtp-Source: ABdhPJxf1o32siCRI1IYyrqxQHuurps25UZou4vNu9Y9eBfLGQ2ZCOLTxn1cH5dKBeRH91Zxd0Sm4w==
X-Received: by 2002:a17:902:d4d0:b0:140:1bd6:a84f with SMTP id
 o16-20020a170902d4d000b001401bd6a84fmr15477792plg.20.1635154503358; 
 Mon, 25 Oct 2021 02:35:03 -0700 (PDT)
Received: from nj08008nbu.spreadtrum.com
 ([240e:47a:878:6a2:e0f0:8dca:6977:afd5])
 by smtp.gmail.com with ESMTPSA id c9sm15446100pgq.58.2021.10.25.02.34.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Oct 2021 02:35:02 -0700 (PDT)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com, pony1.wu@gmail.com
Cc: orsonzhai@gmail.com, zhang.lyra@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v7 1/6] dt-bindings: display: add Unisoc's drm master bindings
Date: Mon, 25 Oct 2021 17:34:13 +0800
Message-Id: <20211025093418.20545-2-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20211025093418.20545-1-kevin3.tang@gmail.com>
References: <20211025093418.20545-1-kevin3.tang@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin.tang@unisoc.com>

The Unisoc DRM master device is a virtual device needed to list all
DPU devices or other display interface nodes that comprise the
graphics subsystem

Unisoc's display pipeline have several components as below
description, multi display controllers and corresponding physical
interfaces.
For different display scenarios, dpu0 and dpu1 maybe binding to
different encoder.

E.g:
  dpu0 and dpu1 both binding to DSI for dual mipi-dsi display;
  dpu0 binding to DSI for primary display, and dpu1 binding to DP for
  external display;

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

