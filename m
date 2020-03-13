Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2C418607E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191646E2C7;
	Sun, 15 Mar 2020 23:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2BD6E466
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 13:22:59 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id u12so4984724pgb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 06:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LtPS2nzq1tAOLqZda6KKJ8wN5FQTazZ++gCBndbcBJ0=;
 b=RNUHFVq7y2hg5vSljN8W7njUcYz6k4E624aImJVZAUupkuT2RbT00+OQpZfFy3dSzf
 kO6ATA88Fw/K53bJ5G90V9xqrqKgHyCf2KPMgcAy8n09oVoAckbTqjJrcIzlWlFdBt/H
 GO19OeiKlnSRDdSrQh5fWH4Qstyav+netGMUvro/uaqB4/Ur6Ky1FTqjApntoKiwR+gd
 JsBT16bHF2XKbQ7W9V57UYLjVQT+pvmM6xJprZchUlIol4qxiODNoiemmzTA3YTAtmHv
 DuUqeVxfqmaOw+hjiGIJe7tdHX7u24oYdpiZKPd2OR+FlmgK83dkpc5sQhmDdHJZHDE4
 oFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LtPS2nzq1tAOLqZda6KKJ8wN5FQTazZ++gCBndbcBJ0=;
 b=DzXbvnnhY+HQxPMyRa5JhYLwCC1RH+5WclMuHFnaMhV+hEsAAkDExzQixHyDaeHdyK
 fPuN6ybWqjZNeL/ST7noXn6uOHTFT4dCZ/E9LurbsGGpGxZsahzoBjm3obeTM83JB2mp
 yAqu04fjGPbylcoIa6ffBkTjGuc2ibdgfCVW+FWf2SqM4aZrcQ1lKtYiTlwYUdiPDFeE
 ZVjD8mu1hy35kUTMn4Kv7qY7/CLNsPUdn8QPhHwrHYN4NuxmDUj7yveKZguC0xgGaW+A
 eRBCpjOZDPZlBJpn0yqlIbWNiWcNmAbOjDiMaCEaKCEcjOMdxdRWWvxwj/baOQheHUap
 yk7A==
X-Gm-Message-State: ANhLgQ0ColuwF/rbh2ErMbzOo4QVdU/+iMDeTuCUKjR/noyLK8nkBkA3
 ElMoazGAiOxKTo395uE6NAs=
X-Google-Smtp-Source: ADFU+vspPjZ/gf1dZ/to1aekTTqBguSpk0OaFntppmsOUyXABeCazfg11vF2tTrFU2TmHkd8wje05A==
X-Received: by 2002:aa7:85d3:: with SMTP id z19mr13452629pfn.13.1584105779035; 
 Fri, 13 Mar 2020 06:22:59 -0700 (PDT)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id y9sm21490296pgo.80.2020.03.13.06.22.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 13 Mar 2020 06:22:58 -0700 (PDT)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v5 1/6] dt-bindings: display: add Unisoc's drm master
 bindings
Date: Fri, 13 Mar 2020 21:22:42 +0800
Message-Id: <1584105767-11963-2-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584105767-11963-1-git-send-email-kevin3.tang@gmail.com>
References: <1584105767-11963-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Sun, 15 Mar 2020 23:19:05 +0000
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
Cc: orsonzhai@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, zhang.lyra@gmail.com, baolin.wang@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin.tang@unisoc.com>

The Unisoc DRM master device is a virtual device needed to list all
DPU devices or other display interface nodes that comprise the
graphics subsystem

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 .../devicetree/bindings/display/sprd/drm.yaml      | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/drm.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/drm.yaml b/Documentation/devicetree/bindings/display/sprd/drm.yaml
new file mode 100644
index 0000000..b5792c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/drm.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sprd/drm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc DRM master device
+
+maintainers:
+  - Mark Rutland <mark.rutland@arm.com>
+
+description: |
+  The Unisoc DRM master device is a virtual device needed to list all
+  DPU devices or other display interface nodes that comprise the
+  graphics subsystem.
+
+properties:
+  compatible:
+    const: sprd,display-subsystem
+
+  ports:
+    description:
+      Should contain a list of phandles pointing to display interface port
+      of DPU devices.
+
+required:
+  - compatible
+  - ports
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
