Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C28F86397E7
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 20:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F318010E170;
	Sat, 26 Nov 2022 19:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8E810E786
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 18:02:32 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id n20so12020146ejh.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 10:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:to:content-language:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K6RjLtrdo+ScGm7pjZK3Sr+Fc1zKiBe9mhxGw4UGkKk=;
 b=n+IYRZPLWxB7TLgHjJB945226UUM747+G75kptxXbOlV4wq9bEgqApLefT4+EtvqYD
 3MkmP7gED/9MiD5GTB++vQwhDUd1howa8sCJqtwJBKHyoOYNh+rhkLdqg5EQdTA6YgF1
 TbXmUR9oJSh4bOdcLv9EcCIk8OCErnEwY8VBlPKrBsBV3oLrX2nHxdbDuR7JaLLPQFKj
 /J8HRh+NBXyuBjqLb3Agj5hWQ8jYRPaE/3UiCQUzVF+gLng6ktdeWKVZs1z9eh8EeHNq
 276aemFu3yeHmOdlwlXYuPqEKu1Oz6Bn4CPlLxt03FJLdCfiFGz38qpn53Vui+AjYMo7
 Xptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:content-language:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=K6RjLtrdo+ScGm7pjZK3Sr+Fc1zKiBe9mhxGw4UGkKk=;
 b=uT00MM/3FHOJAtdKvlke+7mgwYR5AFZvyJqoUG7bGDwRN3ulEvO8lNyEhxid50p4i3
 cCeHnQmMEHi4R5N+99oh6IYGJLhAtF3Lz93awugR9Ynz4RlcHZhOo7yMhxw4Pspawpep
 7Fu8UEmfm9UWPDH2AMIT5PK/3+B8Iw1Vd3vWGo+Wji5jvbAfScGhXQ7pqL13Zw/bVAtA
 lPEn2pcvY4R7EA2kvh6lcRTi9S0ZzcwBBrAwgZHSB8+KpmZpxjQZYH9JmsSyD5rCKTu9
 RU8JHewWylVHtGAXgt90OI5vt9axj9ewzqX4lUzXZLIxmnV5FZMBYyWlS0Bnt9FuT3wB
 nsHw==
X-Gm-Message-State: ANoB5pmtUdpOTI7OrHUvJn4u0PYhYV5TiwIMX5ikAJzABABJqiXlWkDR
 aAECzDRfMZtqszVTzg62fWQ=
X-Google-Smtp-Source: AA0mqf6u6ILP2rzOMm++8C87RFVzocSs3tw5fx8sFGo0Gq4MOLdpgPT/cqB4RuijdbGWbj2Wec1tjg==
X-Received: by 2002:a17:907:9841:b0:7ae:c9d4:7073 with SMTP id
 jj1-20020a170907984100b007aec9d47073mr32793669ejc.711.1669399350879; 
 Fri, 25 Nov 2022 10:02:30 -0800 (PST)
Received: from [192.168.178.2]
 (dslb-092-072-004-196.092.072.pools.vodafone-ip.de. [92.72.4.196])
 by smtp.gmail.com with ESMTPSA id
 eg23-20020a056402289700b004623028c594sm2039196edb.49.2022.11.25.10.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 10:02:30 -0800 (PST)
Message-ID: <d8b00afb-8c60-fe9d-dad3-280a0e0254ef@gmail.com>
Date: Fri, 25 Nov 2022 19:02:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
From: =?UTF-8?Q?Otto_Pfl=c3=bcger?= <affenull2345@gmail.com>
Subject: [PATCH 4/4] dt-bindings: display: panel: mipi-dbi-spi: Add io-supply
Content-Language: en-US
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 26 Nov 2022 19:00:23 +0000
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

Add the new io-supply property, which specifies the regulator for
the I/O voltage supply on platforms where the panel panel power and
I/O supplies are separate.

Signed-off-by: Otto Pflüger <affenull2345@gmail.com>
---
  .../bindings/display/panel/panel-mipi-dbi-spi.yaml        | 8 +++++++-
  1 file changed, 7 insertions(+), 1 deletion(-)

diff --git 
a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml 
b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
index d55bf12ecead..68cbdfab5438 100644
--- 
a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
+++ 
b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
@@ -22,8 +22,9 @@ description: |
    The standard defines the following interface signals for type C:
    - Power:
      - Vdd: Power supply for display module
+      Called power-supply in this binding.
      - Vddi: Logic level supply for interface signals
-    Combined into one in this binding called: power-supply
+      Called io-supply in this binding.
    - Interface:
      - CSx: Chip select
      - SCL: Serial clock
@@ -80,6 +81,11 @@ properties:
        Controller data/command selection (D/CX) in 4-line SPI mode.
        If not set, the controller is in 3-line SPI mode.

+  io-supply:
+    description: |
+      Logic level supply for interface signals (Vddi).
+      No need to set if this is the same as power-supply.
+
    power-supply:
      description: Power supply for the display module (Vdd).

-- 
2.30.2
