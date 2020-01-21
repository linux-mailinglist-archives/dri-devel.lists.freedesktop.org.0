Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7471144D2C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:21:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6AA89CB8;
	Wed, 22 Jan 2020 08:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC136EBF6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 08:51:23 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id g6so1050919plt.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 00:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=InvFUNRiPxXOxYMHgJ0FZcGWdDLWenQO6uankp4X5co=;
 b=a3MBTdJXqtlvKHgxE6X+zPUuhYOUm3tjJwTE9L1wRtHyaPUXEXJgq/kVXrMuwVMDpM
 PC4LVhSch3A+rJczDpBoVLWb/QDkC6OLDKN2xnGoluGRdFhLLMNO2axXI5pj+h/Qwz1N
 NHxAYQOhIAIcvqRh5ZWn3VjWwzzkcKlE+N+ed91b6dGb8RawqJBTY8kE4s/TCZfioOYO
 N0UEU6J55yPCv7+ch78JUbMeD4uT7rxE4uqJEaVmZRTT9duKk+wtamtfqorun9OCwdCF
 pAG2C5yQvc6lmKfLn4/Uth0y6nmWFP+Swkk7V6N14pg8ieBlLaIi7piZX3qIPl7iw74u
 uq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=InvFUNRiPxXOxYMHgJ0FZcGWdDLWenQO6uankp4X5co=;
 b=tgU4HLIT3qPMnGyIJsIZBYqODGnRmVpj1GK1wNCMm5ZF0AdTpp4kAhhr7+QiCWnc+o
 mbUH/1xE7QbmaVpRgNLK7PqJi0OudoJ2e5bkHDmVoMv4IW1xFZv3JU5iWUuNo3px96dp
 qLq3tskWPiagMZrg19ME1ipzCSu/byhA7B4L2Qd5AtOeXTsGk7zbDpJyS0epzFjLdZEC
 OSFeNOr1seF9VNLcjZhgg85xCieAp4pgsegIximauW7JxTMnr7M06sc5ZK9+LFHzekvV
 i+QtE61sBxo+XIWUS5bJzEGPs62UMTMpyvTETUHQgVWAEC+kGz1We5RvvVV++UpVHxdb
 OqgQ==
X-Gm-Message-State: APjAAAUAnNwcqMMDLRN/VLKLWft6O618zAdqBqUGNvn63dA6IX1/b6qp
 LGYWZfa/itJuWChHA9jD4No=
X-Google-Smtp-Source: APXvYqwhsFdEe7Z6zpory3TxabU0PWCwAHasLLUAeGZhpZXoqCLwoXU7a5khdBNRts36cDnpZL0Z9A==
X-Received: by 2002:a17:902:d705:: with SMTP id
 w5mr4439295ply.68.1579596682873; 
 Tue, 21 Jan 2020 00:51:22 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id 80sm42820957pfw.123.2020.01.21.00.51.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 21 Jan 2020 00:51:22 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v2 1/6] dt-bindings: display: add Unisoc's drm master
 bindings
Date: Tue, 21 Jan 2020 16:50:57 +0800
Message-Id: <1579596662-15466-2-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579596662-15466-1-git-send-email-kevin3.tang@gmail.com>
References: <1579596662-15466-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:09 +0000
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
