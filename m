Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 276FE654DA8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 09:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0FE10E5F8;
	Fri, 23 Dec 2022 08:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C499B10E094
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 13:24:42 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 q17-20020a17090aa01100b002194cba32e9so2252975pjp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 05:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jMBazgguIgQnT/Mfr+HQSy2WLX0y7isn8sMtEFf85Wg=;
 b=kNRsGjC3Wqkdn/++8P5gRTcdeSLguv5CIeAe43Uy8U3rmvbWCU8Dy9Zr7e0J2htilo
 Do8IGB9B9IEENSbVKZTj01xL1Rb22uR5Icx6Nc1wCQUBxSrhi5TAnfNrIC1sSvT3khfR
 7805PWzRGJ0b+BC5v3ndPamSfs5qeDdzJqWMdIq+nbD5Y3Q2QxnutoMHH2wucS7FfazU
 O+fhyYOA2JfHM2FJ8X6XbfrBbRMfoPz5S2PmI7TcUvv1XyeoINgTGKG9WeENnsUMrHl6
 Y5e8ataafW4+s503Y0rF0tlGzKFRNO3unMsjreoosE6YMnujBJQUES8MdY4otP8gj6C7
 ngtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jMBazgguIgQnT/Mfr+HQSy2WLX0y7isn8sMtEFf85Wg=;
 b=oQ5432wdhNjNDiHwUPj7Hp1FMWzcjaXXqe6gWdOOh44AavPPbkVhfvL18GRT2u0KlD
 H3Ae+q9vYGi0jn5kf3xg7Ez8UhqR/0y+TaKbGCv6IaBXQ/IyDy7xQWD9GFgeqyPqG16w
 sVmCoV5YNOaLwxDpsRHBfTJKUSqoFyhw3dGQ+YEFbttGAf5W8Q+hZCBMrOTq7wO8nM2W
 rsRsHONE+mNcyAAPkjbWKoJ8a25niyNipyNkGGPeBNwulWVygK5O7iIRKt0FcalUYq7D
 loS5N5gIV9Hw7rfWGn6yU1dvkUcUFbBtYYMPXGf8Wzff20QszBLm5ShHT14T6iOvEUYo
 REtA==
X-Gm-Message-State: AFqh2ko7JpuwLif9bVARfU6SeRXJpa8/cWBHDSLngJ7b6XhBsbXGJ0mf
 CZJUqKLev1tXicjV3XDzWQg=
X-Google-Smtp-Source: AMrXdXviajQgLWtVSDrAHnBTla7bczbaZZ5qjxiASUZtTmQMFu22hW8pKwM96yZVp4ijtFVoisaZ4Q==
X-Received: by 2002:a17:902:e382:b0:189:db2b:93ad with SMTP id
 g2-20020a170902e38200b00189db2b93admr1768225ple.2.1671629082341; 
 Wed, 21 Dec 2022 05:24:42 -0800 (PST)
Received: from localhost.localdomain ([117.189.239.185])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a17090311c300b0018099c9618esm11462479plh.231.2022.12.21.05.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:24:41 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [RESEND] dt-bindings: leds: backlight: Add Kinetic KTZ8866 backlight
Date: Wed, 21 Dec 2022 21:24:28 +0800
Message-Id: <20221221132428.702-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.38.2
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
Cc: devicetree@vger.kernel.org, Jianhua Lu <lujianhua000@gmail.com>,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Kinetic KTZ8866 backlight binding documentation.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
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

