Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE76367196A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 11:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF40810E711;
	Wed, 18 Jan 2023 10:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D4010E53C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 13:48:02 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 q23-20020a17090a065700b002290913a521so14935604pje.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 05:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nsZvgpdsbOSZhJAZ1QAJPedjqfxUnjeKrZqaXm358r0=;
 b=Y0aqBtoOHjCVqYsvR98g7ZosHRR3wcidEggRSlAS73WqTuKhr0y1bCfXnTshMho+4c
 u4yJoh3kRcHoOAQlItFDcr9kQ733A4bCElXX9l7MPOo60dl5ZZknfZ/7ZFL+stS8Mb4y
 ZUxh3exectYTZre84JGIPrgKieU8WCd2AWzz9izq40ACJzf9KTs9cFdRt1E4obi8V2ib
 7o1HhrqhYneJyNYoZy0ynyoAz20U/NHHqhzrYlcwWIc1dkS7eMQQKqYuD+EEUUz2a7wg
 ZMPATcxthLmkKPQHTPsCYeCZCAjv0ZeqzgswFWF5eSPP4IV1jQvEOFv6amj5Aj2AXWhO
 6Obg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nsZvgpdsbOSZhJAZ1QAJPedjqfxUnjeKrZqaXm358r0=;
 b=bQQVAjzSw3VvvAFC+coLLO+6+sYfgwlhe8AxfZ4q2irmMg1T40UGeF1XlSubMFIBDM
 3ESo4gdLKWRtZugWiZFt7SVPAGa37Tq8D+lWDwUHZiE6LQeCn0Nmrci7eLNgadxkFkBF
 nlkjG9p9gt0N8YWbmMdwjnh8aCRMzmzhYeDyBnlBYgHS3KcZicxcXtBA/W1jnmm0PrQr
 VP6HyvtxszXV6F4k+dHwv1qedXFkyObuLCklmdKNw1b59euIZP1Z9fNEC0vbUHtR8GA5
 Jwj2OfIXTi1DHMpZK6wVAjF5pQTP/w1g6YrH/RqSZAMQ44joUakqxM/V/WXgaQZ+A6lx
 Mzmw==
X-Gm-Message-State: AFqh2kp3fCMStCRWqcYKhtrBDsVjxm5wFGz37aeud1b2d5QCxcK91TqP
 Q4s/jkk98STTqEvRk/0BRniq2+6lzyArhw==
X-Google-Smtp-Source: AMrXdXu/zWBQUKC6ZNgX4gXkB2pdzeuGV+K0owx8758eOjlAQC+ZwRI1EVhNsBftFCuNwmBqxEowSA==
X-Received: by 2002:a17:902:c10d:b0:191:3aad:cf33 with SMTP id
 13-20020a170902c10d00b001913aadcf33mr4164697pli.55.1673963281835; 
 Tue, 17 Jan 2023 05:48:01 -0800 (PST)
Received: from localhost.localdomain (n220246252084.netvigator.com.
 [220.246.252.84]) by smtp.gmail.com with ESMTPSA id
 a3-20020a170902900300b00189393ab02csm3747958plp.99.2023.01.17.05.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 05:48:01 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH v4 2/2] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
Date: Tue, 17 Jan 2023 21:47:42 +0800
Message-Id: <20230117134742.23238-2-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230117134742.23238-1-lujianhua000@gmail.com>
References: <20230117134742.23238-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 18 Jan 2023 10:42:12 +0000
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

Changes in v3:
  - Add Krzysztof's R-b

Changes in v4:
  - Drop Krzysztof's R-b
  - Add some new properties

 .../leds/backlight/kinetic,ktz8866.yaml       | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
new file mode 100644
index 000000000000..18571d69accb
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
@@ -0,0 +1,54 @@
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
+  current-num-sinks:
+    description: Number of LED current sinks.
+
+  current-ramping-time:
+    description: LED current ramping time.
+
+  led-ramping-time:
+    description: LED on/off ramping time.
+
+  enable-lcd-bias:
+    description: Set if we want to output bias power supply for LCD.
+    type: boolean
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
+
+        current-num-sinks = <5>;
+        current-ramping-time = <128>;
+        led-ramping-time = <1>;
+        enable-lcd-bias;
+    };
-- 
2.38.2

