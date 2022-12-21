Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DE8654DAF
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 09:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC8C10E618;
	Fri, 23 Dec 2022 08:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE4E10E45C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 15:32:17 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id p4so1189413pjk.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 07:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dX5Ufydbl+p2sHxSvGtWPn7nIriGhnFrTMO/deTHyGc=;
 b=iiWcSXNheQcb430tsQZJphtJrB+Ja/HWXMfg3h7fPve0YOLZfED3bTDNHtGmGlvP9x
 N/pP/6ztIdMvRdO6X826MByELkp0Jas+8v6Jt52Y6qhDg0e8kh9zKpEcXqio+p1Vd+/X
 2yrtWvoxOV19rBVa0IiL0XyzBN01Kf86VA49yynFC9xVGS0fDBAzjXJrk8aeFlFd7cFD
 q/ndB6hwC3p3fYURXJtwIToBuZFA9dTLJHZxPw545c4V2zeTOKY4pAUupe1zcC6Y2mm7
 FfQEF73g3gENaScT5fXfRxMD4v8rGKDTyDAp8p03HiNl3nsiF1cgy225Hnq85cAOXgnG
 KM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dX5Ufydbl+p2sHxSvGtWPn7nIriGhnFrTMO/deTHyGc=;
 b=kFWgMJxeOXsPIHpNaGjU2h/A8pgmKYkSa3jFYuFkjX1jflZhpAE6FlKdjwTna/E06V
 aB/nLwp6KCqwyXY0OmWEPQkE59N8aobJ3un5DT338x1c97IEE5cFS4PeEwuKoZCwu3eY
 d9fY6GLhIJeFKX6wACKS7uQ4UntRAyw6g45v3YK7USRzhFS0wd8OsmDnvEpoEeQEgo0w
 CfzCj6kHCqUiCbv2MT85Q0rvy0yMMu1xmOOeFHbyjCu+vEBDt96sbtG+29ehxcbFf4QH
 WaeBFsi+37SxpPYy0FXZHAptdldAx2qAfQmfa/pbGDDGtlLtaiMjtmBbF6HsSG+MQ3PJ
 1GXA==
X-Gm-Message-State: AFqh2koh4e3TvcIEaH7pLtvl1A1q+PSymE1tZavmzdsQ0X05A4jZ2aMm
 HjcEI7O6H1zEdAb9ZO17Aj5gWjfiR+M18401
X-Google-Smtp-Source: AMrXdXv3PJXfMd9ydRhNUnF86mNqHkZssnnnst4tlLt8CwvNSmBzGTR5Nw9Y5XwRR01EpbYoAIJ+ag==
X-Received: by 2002:a17:902:db85:b0:189:9fb2:2558 with SMTP id
 m5-20020a170902db8500b001899fb22558mr2574891pld.1.1671636736830; 
 Wed, 21 Dec 2022 07:32:16 -0800 (PST)
Received: from localhost.localdomain ([45.62.172.3])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a170902e54300b00186ff402508sm11633409plf.281.2022.12.21.07.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 07:32:16 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH v2 2/2] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
Date: Wed, 21 Dec 2022 23:31:54 +0800
Message-Id: <20221221153154.25411-2-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20221221153154.25411-1-lujianhua000@gmail.com>
References: <20221221153154.25411-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 23 Dec 2022 08:44:25 +0000
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jianhua Lu <lujianhua000@gmail.com>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Kinetic KTZ8866 backlight binding documentation.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
Changes in v2:
  - Remove "items" between "compatible" and "const: kinetic,ktz8866"
  - Change "additionalProperties" to "unevaluatedProperties"

 .../leds/backlight/kinetic,ktz8866.yaml       | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
new file mode 100644
index 000000000000..c63c21bf69d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/kinetic,ktz8866.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kinetic Technologies KTZ8866 backlight
+
+maintainers:
+  - Jianhua Lu <lujianhua000@gmail.com>
+
+description: |
+  The Kinetic Technologies KTZ8866 is a high efficiency 6-sinks led backlight
+  with dual lcd bias power.
+  https://www.kinet-ic.com/ktz8866/
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    const: kinetic,ktz8866
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    backlight {
+        compatible = "kinetic,ktz8866";
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&bl_en_default>;
+    };
-- 
2.38.2

