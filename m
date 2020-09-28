Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC60C27A817
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529586E12E;
	Mon, 28 Sep 2020 07:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359BE6E0EA
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 06:27:53 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id bw23so31088pjb.2
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Sep 2020 23:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=A/YkV3j0PuCHVneaFRnKH2O393BGuMCEHqD/8icBnHI=;
 b=rIqM/cdqvFK+rTkrDnGH2WrIpOQvCJYGGixvTcmKGGVgyo4H37+i/0ymPvcQOXVTBb
 HuG/FLQaDWsdycSZIzqkEJnyYSk0lUiCbF3vSwsRw7Ed2A4buODNNLjWIAPxFXX5UQ8z
 lLhsW2E1IvQovjYEeCa6+Xu9L7QDX8erTCr8GyG1t61ExUaBmez+Zc2M+xePDlOnA3un
 l4ykqTEl4bxfatStFwHqeGOwNZnw4ETec9e8Rp2Dlch5RycRmxNd/2fkyzHjmHXgw3lg
 3vUl9j2tgkgEyfRCn5J1B7zVpymf0/fO3Huv06HhfBwPgXfPWWcTuAdnjHShN3ha9i3V
 uhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=A/YkV3j0PuCHVneaFRnKH2O393BGuMCEHqD/8icBnHI=;
 b=O6BF9rHUJN7yBqJNc9FZ2TaH+a3SVg97ZU8mF1KIUI59fVz3AjkrtUQyKTNMBRvYC5
 jkUBikxywrjr82kALfR3/orOGwEipPqdDXQlZICBXQ55GsuqVLPdYctpafIObgjYpIHe
 4CXyse7Chv0AyUmOGKZIvpQ+/5SfGonEv3Iwc50az0Y9e5Zu5KMGQWpO0AhCdNeOihev
 4uvNo7x7N/1encbURMZw+CbiKnXm0im3R++pRd1fo+MiIq9EOBchIb/J6ZaD+Lzk3hAX
 52LN1OKDpRBOT+QVAgWve2TKfWjsB5YsutYdPg/MYtXntmGV4dYogF+HmsR39Rd5/fWj
 ns4g==
X-Gm-Message-State: AOAM530cKSStAMFC4Be+MWvm+nOX4EoBGQ6jaQ3IoV6RFc/xc5yrGW9b
 1ui/Fanuy8H/xYx4aSbj4LA=
X-Google-Smtp-Source: ABdhPJytxijcMC4nE98KRt5IyGUyzvM9wk1tlgWsulk2qtN81SLZBDlTRXb0lDeKi3rAtGvlO3iiJg==
X-Received: by 2002:a17:90b:4b8b:: with SMTP id
 lr11mr8585pjb.218.1601274472897; 
 Sun, 27 Sep 2020 23:27:52 -0700 (PDT)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id il14sm5712509pjb.54.2020.09.27.23.27.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 27 Sep 2020 23:27:52 -0700 (PDT)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v7 1/6] dt-bindings: display: add Unisoc's drm master
 bindings
Date: Mon, 28 Sep 2020 14:27:35 +0800
Message-Id: <1601274460-7866-2-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601274460-7866-1-git-send-email-kevin3.tang@gmail.com>
References: <1601274460-7866-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Cc: orsonzhai@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhang.lyra@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin.tang@unisoc.com>

The Unisoc DRM master device is a virtual device needed to list all
DPU devices or other display interface nodes that comprise the
graphics subsystem

RFC v7:
  - Fix DTC unit name warnings
  - Fix the problem of maintainers

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 .../display/sprd/sprd,display-subsystem.yaml       | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
new file mode 100644
index 0000000..9487a39
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
@@ -0,0 +1,39 @@
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
