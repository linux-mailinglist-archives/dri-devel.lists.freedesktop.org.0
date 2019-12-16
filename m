Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 909E21228CE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4B06E979;
	Tue, 17 Dec 2019 10:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D746E4D0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 11:41:04 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id k3so3537302pgc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 03:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=InvFUNRiPxXOxYMHgJ0FZcGWdDLWenQO6uankp4X5co=;
 b=nADux0vgGYhjTFCUKXHhIWUyVNZN7zUWF+jzINL9cAlftMEI7yvP3uAhnf0qC5aqs9
 ZAC50zT4UcWrldyVj1tYig3kl4eBmyesPlq0/0emalFkMOEWGBxOGllFTnbHqL8a4sGZ
 VuaprGjVGzFE/A9973VW3r3MckU7sDNAUUlYUKQbrPZQA9pr7s5OZgWdz2rwMB+3bCrS
 Q4wop3/z6bfDNabuFmjdajkkZrQUfOfPbHf+h/P1JwyVnK1C8C0cokhWUoZG6SjaQFIL
 SxE5+9Ov/CHFb1E4kHykmD+MMl95f7Rxkue9x4IT+TYBCSjMV2d0LWGgEME3dCZfFA6w
 GfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=InvFUNRiPxXOxYMHgJ0FZcGWdDLWenQO6uankp4X5co=;
 b=kEfJyqXMx7M292JkwmATqHWTgzxtZ29CWWiVX2NOyLKWGPk5a7MTshyf9qzdbqqEWg
 OuYzCbmLN2W9njGjwCtZTmnVeWAm172kxis22E+pWWbDa7t5iW4c0dU8tqEH1mmzhaZl
 hDPmnCD29gFmMviK3HqTafCMhzMhpE18blQm3gpRGWSUvl72bcafT+8kUHczWS6PzJeN
 l/feekMA28h/Esocd30qhxICPjJKbyAmWA/sgH3fnmaGds7j1L3WdsUSKaLSRRK762Yp
 HzzLsUOcaRvDyjsjRIUYdpqXqVs0jjQaWz9yyIBVMckSptBxpMkeA8CoWAps9SDTVZYr
 yDaA==
X-Gm-Message-State: APjAAAUp/uHF7qLEkvns+Eqw2MO+GuRduGbyAeO0vGtpLLeR3gfBclyW
 wF9mTV12WQNFcZgPxA5IZ9U=
X-Google-Smtp-Source: APXvYqzoCwWyOB7xgr9PWVX+nFjSqj0UEyCoBMAPL5V0qPlpHL1r/1iaM4C//Z29d+DrxlA1BYDugw==
X-Received: by 2002:a62:e215:: with SMTP id a21mr15100265pfi.208.1576496464398; 
 Mon, 16 Dec 2019 03:41:04 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id p124sm22432269pfb.52.2019.12.16.03.41.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 16 Dec 2019 03:41:03 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v1 1/6] dt-bindings: display: add Unisoc's drm master
 bindings
Date: Mon, 16 Dec 2019 19:40:14 +0800
Message-Id: <1576496419-12409-2-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576496419-12409-1-git-send-email-kevin3.tang@gmail.com>
References: <1576496419-12409-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
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
