Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5EB171215
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A929D6EC0C;
	Thu, 27 Feb 2020 08:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D781D6E409
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 09:46:31 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id j7so1088848plt.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 01:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LtPS2nzq1tAOLqZda6KKJ8wN5FQTazZ++gCBndbcBJ0=;
 b=KeKjXayP8+wjxcJF5q9JgwImADDMC9QYCMDkDGJ8ZiTKeG2OBzb+LE5BI//zi51/6G
 Inb9mLRsu1AUztEVuiNRP6ML/S49gyZePcXDaobwIDQE61CkYV1Wj06O90UpHVxCRXGq
 hipb/3naFhgjba/1WlA5+tKZZ7Gr7b/+yz31X963XSIzeB6Ja7JhUdn9ZheP6mmvFP9m
 4bc7pZyQaResx1mStDdADtT+rriypyUResnpCFhITd3811BQjI6XVjD1o8kQH/u3K0FN
 /ZX2ph0FaeqmCXaq1KD6DnU/QiHCfW2x73OWVl2yCRi5Ff/NK5lKA3uUtp4lBZr9ec9+
 olqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LtPS2nzq1tAOLqZda6KKJ8wN5FQTazZ++gCBndbcBJ0=;
 b=mAg5QJNu7WbYwGwoPILUtrYvtI97QZq10hucg/SiSahNU1MnXkEeEmFDn5qiG+iQkF
 yBk5AU5/GhUyRBriSCpLMgVNsiOzLTyRWg+y0lG8OJ5sCZyb3kCqT0zY1t/H3mfp6cPd
 U3L2jQLn9wYmPeuEqF6m50W8EA5XcriDCHA2PtE0ITOaqy3S9IQ96HUeZg12u4hNlLcs
 u7NK0a6F+WQE6TVC5ZbwdGlbWdy90W32u9jueEf8BIxFEDXcwaLqLi05o+7GCSJWStLv
 p8ZqYgOPzMFJbxJwhjVKdtBFkxt3xznlDoD9Vmpmt6lynSXWNfwGuPEJckDAW6E1BLk+
 ukmA==
X-Gm-Message-State: APjAAAXv06VXfKtFXM58v/8lWUimYKwKQgQZD8A09Vpfcvz14hwDa6kj
 8HYyP1z6CUo7UHfcrduwcPE=
X-Google-Smtp-Source: APXvYqwpR/0PX/4hNZ6fE6I0l9u/8V2rSMFV5ao/qEk8R4A4Ryw2HUEuZKtrOzpksvDU/KvG084X0w==
X-Received: by 2002:a17:902:b090:: with SMTP id
 p16mr3098690plr.337.1582710391529; 
 Wed, 26 Feb 2020 01:46:31 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id h185sm2276518pfg.135.2020.02.26.01.46.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 26 Feb 2020 01:46:31 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v4 1/6] dt-bindings: display: add Unisoc's drm master
 bindings
Date: Wed, 26 Feb 2020 17:46:12 +0800
Message-Id: <1582710377-15489-2-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582710377-15489-1-git-send-email-kevin3.tang@gmail.com>
References: <1582710377-15489-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Thu, 27 Feb 2020 08:13:09 +0000
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
