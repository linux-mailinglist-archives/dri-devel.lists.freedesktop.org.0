Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF09B167BC6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB106F417;
	Fri, 21 Feb 2020 11:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA66A6EEB2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 07:49:06 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id 4so759402pfz.9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 23:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=InvFUNRiPxXOxYMHgJ0FZcGWdDLWenQO6uankp4X5co=;
 b=cH/zAuRygLTMG5vrXLh0wRpvYslN0/4eyqLnEeEXbOuFqjKLYJZ4wXZDafrsK1t2nD
 NJPOaztBE/WnSneu7MnJ/S+IOwRQyQQr8k4Ysq/Fe445TcDqi8e4KnNr61GGsd3Lmaeo
 tD4eRVCtWw8s5Pwg4fJWwjXl2ERLdyccnuofZ7HliCVa73JDx1Se5x16ep5dxSj2g/AG
 xKdwewHFN4V61X4jt/SiKOpjN7xyDxk6tMK9LJO31uwxfiR4ufK3S45/prJwzfdlMY8l
 qdJWX8NRes7TGzzfZtTDFHAm6C5kTlrVofd9xCXLx+wlOXQK20RRzEkyBKSPixaFxxuH
 FDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=InvFUNRiPxXOxYMHgJ0FZcGWdDLWenQO6uankp4X5co=;
 b=ldJM759UZirfiqk90BVw788dTWI7vPxdCJ0vfmTKpxGmT090pEKFXvHvtkHeUrpQye
 /fBa7ENamFZ5PWzzPrYI1EsvsrKu+UPr62IptL1LZIYXva6mnT03MKj71tppHTX7bKN3
 Hm4gmBtGFVRCWMhhYFCJfd8IsoNpkgjqW5HEQMKGeVWcFunRRs9e6oyTWM64EzsS0bLu
 kZ65Fhd6f21p3AbI9naLrP7nTn277ufxH/ryVcZ6l1OYgXQmpoa38c7aAAoUcsHjpDXO
 Up59UwakuIV3KtbaU00+tJMSTakJ6pA0fxUnH7kZgP7Iaw6OL8vkwsk5feDT7nydhvVv
 QMkA==
X-Gm-Message-State: APjAAAWhiMw0m9vYdFvNeWZIpIlFoZrWt+Tl2LBNGAjWfRmyyFFzf7k2
 12TzpIP4859S03DG+k3D5Sg=
X-Google-Smtp-Source: APXvYqzrktlCrULOant8+rekVokatvRDsgDVLBnEil8PQxbkujjyDkYWFqsKwTCWKS7ERFp5nwkHUQ==
X-Received: by 2002:a63:42c2:: with SMTP id
 p185mr39122753pga.268.1582271346641; 
 Thu, 20 Feb 2020 23:49:06 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id d1sm1444653pgj.79.2020.02.20.23.49.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 20 Feb 2020 23:49:06 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v3 1/6] dt-bindings: display: add Unisoc's drm master
 bindings
Date: Fri, 21 Feb 2020 15:48:51 +0800
Message-Id: <1582271336-3708-2-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582271336-3708-1-git-send-email-kevin3.tang@gmail.com>
References: <1582271336-3708-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:23 +0000
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
 .../devicetree/bindings/display/sprd/drm.yaml      | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/drm.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/drm.yaml b/Documentation/devicetree/bindings/display/sprd/drm.yaml
new file mode 100644
index 0000000..1614ca6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/drm.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sprd/drm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc DRM master device
+
+maintainers:
+  - David Airlie <airlied@linux.ie>
+  - Daniel Vetter <daniel@ffwll.ch>
+  - Rob Herring <robh+dt@kernel.org>
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
\ No newline at end of file
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
