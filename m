Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB27A7DC8C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 13:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA8F10E439;
	Mon,  7 Apr 2025 11:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fSaVA+p8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F01A10E40C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 09:53:48 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-22403cbb47fso41977305ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 02:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744019628; x=1744624428; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dg9lEoL65QzJMd1p9NbRIABfnXtPImWz2QQY6zZN36Q=;
 b=fSaVA+p8/9YJjt8qPbZ1rjsKEHcM4tVcDKE3U0MrkKfVdECzo4zGK1xrXDP3iaKLDh
 ezAsHHckDUhsqY5hW2tWjxv7s8BpC0kvys1W5S9JJacMsN8UUKfhZOg+iMOvvwir4vo2
 3Z0PZpVgprEEwGM5kok1T2qQNwtoyDLkDgOfUzTN91prHXr5qdyd9tt4ouUZtksI6JJ3
 Ihd3u06Fid9ImKcld3LsHJqerLNh38qqNIfxxsNlI85ESGWjBiThp3NvBjFCM3mF/nzX
 62QPuNX/XJQ9RP3oVj8KuUVV8EBvneUBnw8JG1ZKWQ9c1vF8AuhTbR5zZjFFvmISAyZn
 R8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744019628; x=1744624428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dg9lEoL65QzJMd1p9NbRIABfnXtPImWz2QQY6zZN36Q=;
 b=Yof7YAV9+6P60Fu5GJvDmG91BQCXZvrasqFUk/hhIMUiN4eXqWPCtBFZW6YtYl6flg
 f6eWO4JUWB27Pyu1M0zo6mualMGMOiiNdqEejPkwbv9Brx/vbAunGviDU7tfyHQ81RTk
 SffIDh6M/qTvxLYXDoXBOwS33qAWB39znaFoMx20M2o6nSIH2nh3KF6qS6KL4KmiGp8Z
 MPcjezGu7mF/cHe2I4BUttxy0OFSVNqPgU1IZhwdmrbQj+OpqDbc9OfGzJnlz+WRl1Kb
 uzXQeKeilDD2b+yqj539loLXRJlg8bnrmWoiRzZr0TLcFrjRmhbZqSEQmVknPzTOyAhm
 Ym4w==
X-Gm-Message-State: AOJu0Yz2YuBYxIrlUCgvxi2mFaYu3FVIrqAbSiuyfwwAOQilAPd0mGDp
 9VhL7351z42kyNsK35gNCk0f46HC/WXHa+QTe3qWYlRRGJcv7jU0
X-Gm-Gg: ASbGncuugqEShweyLhWTxK6vkP+uv/Lce6AvREkgsa8uK52T7ckRxWUkGdmUTqy47Ls
 GpQJcmzTAjnaCTFqpPuPmD9AYU0okUr85YHdig5x7/mOfttNc6Zw8yNDRU9Mnps3/0EHMPUd0TX
 phUaYeb6+gxCU13Atoz5KqOPTqs9EcsDu8f/g3GocGqkj7BSPe7PqGl5kBUQ/eSKqpn3ZKyp7Hk
 FaNQ388IbffnjnUiDN7+UBCgjl0BoC3S0vNSLSH0khafO5bPjkFPYsNwaJDiX/LQubmzm8+X5iH
 6k1w0JGV1nHWfGu7qY4Vmj6DDUgxTUcY11+Kiwqr3Xa+jm3/sX3TwQ==
X-Google-Smtp-Source: AGHT+IGqfDuPIWeY7/3IZ1+COET6x2KSkLggAv3zoC6YR9cO2KRSMw8l5ILuBVRm8a0vYSnxe49kKQ==
X-Received: by 2002:a17:903:3bc6:b0:220:d79f:60f1 with SMTP id
 d9443c01a7336-22a8a8ced77mr154326345ad.42.1744019627964; 
 Mon, 07 Apr 2025 02:53:47 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-229785bfddfsm77213805ad.66.2025.04.07.02.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 02:53:47 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 1/4] dt-bindings: backlight: kinetic,
 ktz8866: add ktz8866 slave compatible
Date: Mon,  7 Apr 2025 17:51:16 +0800
Message-ID: <20250407095119.588920-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407095119.588920-1-mitltlatltl@gmail.com>
References: <20250407095119.588920-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 07 Apr 2025 11:40:40 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kinetic ktz8866, found in many android devices, nowadays, some oem use
dual ktz8866 to support a larger panel and  higher brightness, add the
binding for slave case.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../leds/backlight/kinetic,ktz8866.yaml       | 29 +++++++++++++++----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
index c914e1276..825a6fbf1 100644
--- a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
@@ -19,7 +19,9 @@ allOf:
 
 properties:
   compatible:
-    const: kinetic,ktz8866
+    enum:
+      - kinetic,ktz8866
+      - kinetic,ktz8866-slave
 
   reg:
     maxItems: 1
@@ -58,9 +60,16 @@ properties:
 required:
   - compatible
   - reg
-  - vddpos-supply
-  - vddneg-supply
-  - enable-gpios
+
+if:
+  properties:
+    compatible:
+      const: kinetic,ktz8866
+then:
+  required:
+    - vddpos-supply
+    - vddneg-supply
+    - enable-gpios
 
 unevaluatedProperties: false
 
@@ -68,7 +77,7 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
 
-    i2c {
+    i2c0 {
         #address-cells = <1>;
         #size-cells = <0>;
 
@@ -84,3 +93,13 @@ examples:
             kinetic,enable-lcd-bias;
         };
     };
+
+    i2c1 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        backlight@11 {
+            compatible = "kinetic,ktz8866-slave";
+            reg = <0x11>;
+        };
+    };
-- 
2.49.0

