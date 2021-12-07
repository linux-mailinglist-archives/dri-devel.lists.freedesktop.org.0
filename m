Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D5446BD9E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 15:28:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8773873D91;
	Tue,  7 Dec 2021 14:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C10F7AAA2
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 14:28:01 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id gt5so10439583pjb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 06:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pL2wYs0FKur1p37EfD6cIh4PXL/x/Qnvjj6a9pn8Rhw=;
 b=iZDooPSKeREMbzGTK/rOP1qCgLIZKq7z06Exaz92jBr7pZl+JvFBkHJeoRtXi8WGUx
 CsjQJoW0SEOAFeWANpVyoS3LT7AmcnpxQ9NRy9uPdFe5+P0h9p4ED83bPlZKFoYM2woX
 zzGiG25mIbVi2VahkormwstYkV4+tlChpJ6EYWe2f5A0MKjxSfApxF59aqkRAQp9hUk1
 jNJ0QkBM3+SXJRVIuo8/vWXMkgxlOtB4oXIp/vzracb+9spBKsyAr0JmxQ+qTP/CN7wA
 9rt62kFB9ZmVM3ejWOaPQb02IlL/rDvx06oBJfXAjQmY6TXEXMgSizkkciWNKOu8J9b4
 uyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pL2wYs0FKur1p37EfD6cIh4PXL/x/Qnvjj6a9pn8Rhw=;
 b=JvaPKsrJDz/WlZ73xIbbVC5MRkmCJ/yDKT8JLhSavxJfO42Jc8ayOK+C2JxZUDSYY4
 lekhmrZR0rPvoTxUZ9sKfKrnrEluW/POoRDfHPUbFU7lrgXtBrfaevSsBrwkFW8rl8d4
 LO9/XugwYGBIxCfFVLvYfVo8DTDTX3CWSZ1VmwrrMUhPGdQ0/+yIaOZT03CrrTtyHYjq
 M/0KixGQCQwZIaM1yabfxtvS9pD/m1bqLztUBOE/UpYiauKCgido6mYo303YynJUbpKd
 qqdJIvHiSWwYJznGjbP80HKRRFcyHba8NxVLLpAt7VNiV5zw/DZyzm+RsZJ1ZtRQ4F2q
 wlBQ==
X-Gm-Message-State: AOAM531B/toogmIvu4Oh4NL5/XWAnTj1oSpinmKXjzWRjSMSmxB35YYo
 GSgBfQP+iW9wkaXcNSLoXoQ=
X-Google-Smtp-Source: ABdhPJyVWfE+K4gDkiW5QVaQ3qH9qWM5GM3hElbRdqUEFc7Fnrg7eug0KzwjfW5EJdz90y6s0EtTGw==
X-Received: by 2002:a17:902:bd02:b0:142:728b:e475 with SMTP id
 p2-20020a170902bd0200b00142728be475mr40096049pls.15.1638887280974; 
 Tue, 07 Dec 2021 06:28:00 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([103.6.5.6])
 by smtp.gmail.com with ESMTPSA id d20sm16373247pfl.88.2021.12.07.06.27.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Dec 2021 06:28:00 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com, pony1.wu@gmail.com
Subject: [PATCH v8 1/6] dt-bindings: display: add Unisoc's drm master bindings
Date: Tue,  7 Dec 2021 22:27:12 +0800
Message-Id: <20211207142717.30296-2-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20211207142717.30296-1-kevin3.tang@gmail.com>
References: <20211207142717.30296-1-kevin3.tang@gmail.com>
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
Cc: orsonzhai@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 zhang.lyra@gmail.com
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

