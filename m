Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CA82C9941
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77426E4AF;
	Tue,  1 Dec 2020 08:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAFD6E4E8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 14:28:44 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id l11so6582047plt.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 06:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RMH70OZbYbfu4mqCg7tDH7/JmyKUq6CymvLW5yP/MDA=;
 b=l7prswL4S7CkRqcvc/1+W+Kx4kED2f9IeS1534ZKvGnq7944txC/XUHcKH+B7FWhqh
 h2tpJIsgRX83c4xgEGLP209fo+MUeJ2V+iB517xyXGKNfB/IwymV5hVYIMWwSHQaMluZ
 Qu+HDc2oNroEncGk2oyjZ0xEK4dVvvILl8XKmXuCfRrpPHe1tdLkz61fxzzwo1gyjgHD
 ltbvPZ6MMwro7wQorOurRud4N56AG5TfwARMrQF9XEn1qWisTdC/Di9DUh5Q/nbuTrL/
 f8DLW/LM0Wvi2CdjABE13ZjjIc/J5W3f/027+QDQqllOaYmbHffM2PCrOjPiYUu22Lti
 10Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RMH70OZbYbfu4mqCg7tDH7/JmyKUq6CymvLW5yP/MDA=;
 b=j/FyXc4SZQzochv102Nd8gz33AzqfkbgQnWaxN03jE6xvNRhkA/W5QiWSJ75Qku5RT
 mCriCD9gCIVsvW4KSK5gC3dd0EVs+CRdzui2OfBhkE8c4TkZ6ciY517MAxoyv1td42ge
 O14SZWTR+42jFpKX+zCCguLlTlnl9fy614tBQCF/GZJWDMNE4JMFVrRH4+M4DVy8EMZu
 yqizs2yFV4x4vOk1pmRk0MAnCpVUf483Pg6l6VSUcqQqUWiW5rcv15f2KpjAii1a9Jrh
 AXRBcIRXJEJG+xretrnPn4suy/LXrrZUAXXupsan/9W/di1m3DynIY2gs93xKA1bZtCD
 9h6Q==
X-Gm-Message-State: AOAM531EVktBaHQMsP1kyzCwWil+bclmZulR7nl2wzmvJt5Q3UszbxCb
 w8+y+qbLfF4pkmCgIkaZcIE=
X-Google-Smtp-Source: ABdhPJwMRVGCkfmLoCENoxc2z9C1+NXLjoe2j2hWYrA46gYsYk38Oev3yliJaxfzLfYehzsW57wjxg==
X-Received: by 2002:a17:902:c401:b029:da:6fa4:d208 with SMTP id
 k1-20020a170902c401b02900da6fa4d208mr7690313plk.33.1606746523934; 
 Mon, 30 Nov 2020 06:28:43 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id 17sm15580479pfh.173.2020.11.30.06.28.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 06:28:43 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH 1/6] dt-bindings: display: add Unisoc's drm master bindings
Date: Mon, 30 Nov 2020 22:28:28 +0800
Message-Id: <1606746513-30909-2-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606746513-30909-1-git-send-email-kevin3.tang@gmail.com>
References: <1606746513-30909-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Tue, 01 Dec 2020 08:23:37 +0000
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
