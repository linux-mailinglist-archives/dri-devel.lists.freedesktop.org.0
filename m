Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BADB73EB709
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 16:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12FF6E83D;
	Fri, 13 Aug 2021 14:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C8B6E83D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 14:53:13 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id k2so12252304plk.13
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 07:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pL2wYs0FKur1p37EfD6cIh4PXL/x/Qnvjj6a9pn8Rhw=;
 b=h7cENKxZEnoofdhZJ03Qq8eNuRX0S3Me4Jps+pVeFVBcQ0XPvsOwdv6flA1v7aPDrA
 dSfY1AiCUCphwPswRuc2n8le3NNp/7hKWFbqo/FNvBNP3thY8Fx8YLw9ECfT37gWgiuk
 1vr3Yr6BsbZvn6n2ICtC80pgtRvERmcWDKB/xkQy4W0IkHBhvmV279oBu2N4VNaV62ip
 cHCSGNGTCBTK4XivsEyNUkq8np5NcN5MizbsjCfwyojaaGRWkNlhMOoKm6yuwwe6dmWE
 CYAovDMOBj0YdtTOtfO5tKHW1qdsxHwgXlIhqa03dV5fwx2QV1j3uo7XfNGD0EVm7SNB
 +48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pL2wYs0FKur1p37EfD6cIh4PXL/x/Qnvjj6a9pn8Rhw=;
 b=dd+BkEtR7KnmGoEih5Ehfntj2AEPCb+Lf74XBzgViRcaQQ7Z3DhRkoy582MbcXh9A0
 5Qe2jZWCgDKRWGfzGngiCWWgVGkX+ILOsJVFsvo2+oVDnudRmpy5SIyPtJL3DGUA28Z0
 cHZ227lh5HYdWl1D/uMgN7X7DMTrgOj4uwYGpwHU4SyE3YWojPLdfcqM9J43Ar+buvQI
 us/1v6E7Rp0L30Nv3wjPddy8luxtyjdotDTiDM2olsLeE5G7krfc7mqQYyOSEKyd0GCf
 lARI6EdNvA2UyV7Kyf2p3VKM5mTtD1DYjzfhQY6cgs40N/OAYyl0IvSi9vj184QVmoUi
 7Qdw==
X-Gm-Message-State: AOAM530c2qVMeaAlTRSP8sZzNrI6jtDwt28xMnYaYOEDG6ze28cC7lWL
 dJqU48rmJqzwzkXidkozmBE=
X-Google-Smtp-Source: ABdhPJxaLK8LOm5wpEdxBUPzSmm8Vj9ZBJ+E8vXwPUTThKILurLluyq8CTdziFAJ2+iQv8rlPiwuKg==
X-Received: by 2002:a17:902:bd47:b029:12b:fbb7:1f9d with SMTP id
 b7-20020a170902bd47b029012bfbb71f9dmr2422488plx.22.1628866392911; 
 Fri, 13 Aug 2021 07:53:12 -0700 (PDT)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.102])
 by smtp.gmail.com with ESMTPSA id e12sm2524787pfc.214.2021.08.13.07.53.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Aug 2021 07:53:12 -0700 (PDT)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com, pony1.wu@gmail.com
Cc: orsonzhai@gmail.com, zhang.lyra@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v6 1/6] dt-bindings: display: add Unisoc's drm master bindings
Date: Fri, 13 Aug 2021 22:52:57 +0800
Message-Id: <20210813145302.3933-2-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210813145302.3933-1-kevin3.tang@gmail.com>
References: <20210813145302.3933-1-kevin3.tang@gmail.com>
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

