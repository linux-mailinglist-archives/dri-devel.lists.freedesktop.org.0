Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE668494BE3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 11:40:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4527810E45C;
	Thu, 20 Jan 2022 10:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845D810E479
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 10:40:49 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BE21340028
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 10:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1642675246;
 bh=CIaWdycdf6EnsUbHUYnMZAiCInJx2eq/X/xjpakBzuQ=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=ktYpBh4Y5os9s/2KcJDsOW7A3oa7fHd61E6P/iQRojOTxe1yrVPa0lEkgVa0Qhqyr
 b/SneIx7zOlmdAOboW9a74dxgwNoWr8tv86o08aniaadmG9xK/N+wYd6qUro0vYZlr
 1jFFqEM0zYR+r9FMJ1U9oxloGq4njNcwrgF9jXKtPzazIUyFRrcJNXknRMMsKS/RTe
 K4Nem1MPF2dt8zUOxbErbO4MZKzm9STfX+whrk3E460SWjzpTO5r9gLjKAnRWlPY0v
 v4SMJBQJeWqWDq7X8ZDegseuKJ2jtJOvHXVTh30SIm6YMvJznghRs6XOCUnlVwp1H5
 67yHX6tPHmeAw==
Received: by mail-ed1-f70.google.com with SMTP id
 l14-20020aa7cace000000b003f7f8e1cbbdso5482089edt.20
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 02:40:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CIaWdycdf6EnsUbHUYnMZAiCInJx2eq/X/xjpakBzuQ=;
 b=aincJdjO+IIurD98GLvbDR3B0rN3LPoSUP7FV6yJT9InN0dM3DRqCWKR5hEVYhGIF6
 3SeeS8jWGfMk4tXCQzHV0sBB1n4T13Fj3lDvxevWH1rHonZRY7wMXAtIOdOW1z/341Rb
 oUTpuD5aXKyZqSZi6jGfro4FqJcjpDBCNeo17nsgDmIMqN97wD3lCQi3IuFir32oFjdE
 MnHyzqhZzF0P8Td5COcO3T64AEqG7E2fAZ5DnZ60BVk7LOs4QRznluhF7k9WJX5mQnze
 fEfBq6xDRS9/eExaotZgHE2C8bgJmz+jWVWnHD4gslAn7PL1SJozJhGiw/lcVf86gkZU
 HQnw==
X-Gm-Message-State: AOAM533fE4V4tFU0kOvV0vHRwIyTn2VzrmCK3etWikMT9WMndfBt/uKw
 fA9baNiMBj17oOfqveFEoyz16Ko0wNumxtdHup9HHEx7oQgFsWgCA0S2pZdzu+3fKPpTj8sXJwL
 WzZ76vZSXAbEFwoBB1oWTwD7sSCF7tMhvQQWF5SY1UzegbQ==
X-Received: by 2002:aa7:cada:: with SMTP id l26mr36252487edt.376.1642675246173; 
 Thu, 20 Jan 2022 02:40:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOVdHelYM1YUGXc2eLxbDQYo3SvaFYtGr9v9V5EvnkcgU+gHMzyQwtlgK6qkEsaiz8QyjvsQ==
X-Received: by 2002:aa7:cada:: with SMTP id l26mr36252465edt.376.1642675245973; 
 Thu, 20 Jan 2022 02:40:45 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id z8sm836027ejc.151.2022.01.20.02.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 02:40:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Simon Glass <sjg@chromium.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: bridge: drop Enric Balletbo i Serra
 from maintainers
Date: Thu, 20 Jan 2022 11:40:08 +0100
Message-Id: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enric Balletbo i Serra emails bounce:

  <enric.balletbo@collabora.com>: Recipient address rejected: User unknown in  local recipient table

so drop him from the maintainers, similarly to commit 3119c28634dd
("MAINTAINERS: Chrome: Drop Enric Balletbo i Serra").  Add generic DRM
bridge maintainers to Analogix ANX7814.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/display/bridge/analogix,anx7814.yaml  | 4 +++-
 .../bindings/display/bridge/google,cros-ec-anx7688.yaml       | 1 -
 Documentation/devicetree/bindings/display/bridge/ps8640.yaml  | 1 -
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
index 8e13f27b28ed..bce96b5b0db0 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Analogix ANX7814 SlimPort (Full-HD Transmitter)
 
 maintainers:
-  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
+  - Andrzej Hajda <andrzej.hajda@intel.com>
+  - Neil Armstrong <narmstrong@baylibre.com>
+  - Robert Foss <robert.foss@linaro.org>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
index 9f7cc6b757cb..a88a5d8c7ba5 100644
--- a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
@@ -8,7 +8,6 @@ title: ChromeOS EC ANX7688 HDMI to DP Converter through Type-C Port
 
 maintainers:
   - Nicolas Boichat <drinkcat@chromium.org>
-  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
 
 description: |
   ChromeOS EC ANX7688 is a display bridge that converts HDMI 2.0 to
diff --git a/Documentation/devicetree/bindings/display/bridge/ps8640.yaml b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
index cdaf7a7a8f88..186e17be51fb 100644
--- a/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
@@ -8,7 +8,6 @@ title: MIPI DSI to eDP Video Format Converter Device Tree Bindings
 
 maintainers:
   - Nicolas Boichat <drinkcat@chromium.org>
-  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
 
 description: |
   The PS8640 is a low power MIPI-to-eDP video format converter supporting
-- 
2.32.0

