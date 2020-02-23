Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBB0169780
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2020 13:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6C26E178;
	Sun, 23 Feb 2020 12:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B326E178
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 12:18:54 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id x14so6910056ljd.13
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 04:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BXKksNkbkU6OrFeniHxIoTPEPDtrdEfi9fYOE86NNJw=;
 b=emNMLzoWBw1eL3Wr7KPh3+nmoIjK8h0PmEzCWejMB70d8JO+9Xx/SdqCGJ5vb3IMdu
 mLhp9cxMjOmmEuJqD6s+h1Ef3D7KqmY5rwgJ8a0NQZb0H2HQl8VzGCcKc2To0fnitxHf
 irnLaPZXlWA1vHntpz/cq2EagYVszc3Hqy6u7Gq2c3LAn8n4nwM6wqHLAqQsJCWtOJMg
 4F0NppoVR8kJo5M6ekudUuE5JTouhst4uoJ1sYZRQZdRO/uyxBK8v/7+YfO2wcwBZhdr
 vYz8rCLXi9LtRghhWKFsd/gF4m5ASFHGaZ0YGys4rshVTt75TTyvvcBNiNjq7jHu3O7R
 ZnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BXKksNkbkU6OrFeniHxIoTPEPDtrdEfi9fYOE86NNJw=;
 b=U6QoFpKI7o/nxwUy+wPHYlvUx3za1aSnrScFLncvDqym2BWqrr11IDrzE5Ba4nIyAw
 izY7W90Oz3LJE+403Xy4hZk1AKmuRdt6JVMYhxj9172TK6bco6UvYUUB/ZPn6/uuJ225
 FqHZERQK7x6Kh3F1emlHGTUwdktxwc2bcPLVh9TFal+8aaPMUV5iuVk19HekRLmdTAsQ
 oEvz8QesPRKod/eudehzpEWprPQ7zKtLYVvotajlH4RDdifMK8zCjhl2qNWoKywxKs/M
 ndZ0DciP0BF3009EqnwwTZAlBe6WO+kWFtYo+oq+DmOv0O15nwyQ6a7WNVrlWpkskUj+
 srgQ==
X-Gm-Message-State: APjAAAUbMdeosB19LYx9MELJfwnKEOIq+UC/6Akun/e5evPrhp6jhnV/
 pLjuNwB5Yjx7vUi/RJhOHJ9J4A==
X-Google-Smtp-Source: APXvYqzazielqJ7POJpbkvLpUVC0yKxgxrXXqnsw9lP01N6dySQphWiTLsH9BQYsuVkQGt+gWHrJNQ==
X-Received: by 2002:a2e:b5b4:: with SMTP id f20mr28395925ljn.112.1582460332906; 
 Sun, 23 Feb 2020 04:18:52 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-5ac9225c.014-348-6c756e10.bbcust.telenor.se. [92.34.201.90])
 by smtp.gmail.com with ESMTPSA id r10sm5458553ljk.9.2020.02.23.04.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2020 04:18:51 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Subject: [PATCH 1/3 v2] dt-bindings: Add vendor prefix for Hydis technologies
Date: Sun, 23 Feb 2020 13:18:39 +0100
Message-Id: <20200223121841.26836-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This vendor has produced a number of display panels,
including HVA40WV1.

Cc: devicetree@vger.kernel.org
Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- New patch adding this vendor.
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9e67944bec9c..95ef233dbb52 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -421,6 +421,8 @@ patternProperties:
     description: Shenzhen Hugsun Technology Co. Ltd.
   "^hwacom,.*":
     description: HwaCom Systems Inc.
+  "^hydis,.*":
+    description: Hydis Technologies
   "^hyundai,.*":
     description: Hyundai Technology
   "^i2se,.*":
-- 
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
