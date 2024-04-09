Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 626C989D664
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24213112C5E;
	Tue,  9 Apr 2024 10:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OFw1UXib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3B1112C5E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 10:13:46 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-343e70dd405so3469454f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 03:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657625; x=1713262425;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Y0Ft7gJMIMDuyFaMl73MCWCL0VnoY8SMUukXDjxNKP4=;
 b=OFw1UXibXSO8mPrZOVMebesWDaJXXxuA7Fempl8HpBGcGBp3EMpLxpiLfEWmES/aXL
 nxOo72xmdSfhRwA2Zf4wE333HEA9eDlkPPSj13b4uOx/wj/V0+YjX21hPqIjDWGuTwnS
 3rLUOnbf3fLfgti70HCnjcPMEfwJGL8qDEkqOo9zmbpJZKpg9N28uIkxJe9REM2Igzbz
 KdzkWYIRfO/SjdR6c0IpXMm9n8eF9O6ddvpcvPVcHTxDZHHDFY5fPloGNdWOEIBB8d85
 sesfQD1F58X3jqammbFuyYJNdx2yHPP6KaoKYGR9R1buJVp3buf8wD4U6clNYmYk6gmq
 OeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712657625; x=1713262425;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y0Ft7gJMIMDuyFaMl73MCWCL0VnoY8SMUukXDjxNKP4=;
 b=jhOQHC8VNqG6BxV0e5zsuvOUUnQfe/F4gdeYo+oCRt8UtOiHOKMi4WStTl2rl1BOlm
 fR6XXl+Kt4UO8DY86ia31+lNOZyDleOXR+rMno5c8Ku/kTC4IoUdtFnr6UL4PNgEMew9
 lALhK3CLyYNpPSEPZ+Me/nAsjnv3xQXN+ClgL1wZWq3SRaqWzJIkqrH1QgyhHPnh8UpO
 PY9xY/QlG0btm8kS7G9W26cJWJtaXujqT0aHHylwtOEus25Un5pdGtklS1412CP9TniN
 gcnkb2aiHM5w3D/LHNVGq3P/0IS8MPQNuwC4+XGbanswUSa9Ud95pRzNuLdiIMApu5l3
 1SVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUUu++xIW/llRRzRvB5rdcn6nelF/W8OO+uTK6xhsIZkZVeNrQCK1oq4c1pei3bj4Vd+4PgEEzQa5314uv1f5NUM5suvXRoYapIFPM/eXY
X-Gm-Message-State: AOJu0Yx0FcTYV13rFLjhgp7PWKrOTcn4J02JV07jx+tSQDj3yvFJMIEG
 x0//RGt8Z+AMkDiDJh66cogeMwk3BziPDNLidOPO8iqWJmh9k4hkn8yXP5hhyUw=
X-Google-Smtp-Source: AGHT+IGK4AiPdoPdK/Nj8GgRRQnhRywKu0i7mdq9xkLbTZkIIeBqZ5HZnSAGrmuyoOY8FKcwZklQHQ==
X-Received: by 2002:adf:f390:0:b0:343:5cca:f7c7 with SMTP id
 m16-20020adff390000000b003435ccaf7c7mr9025258wro.41.1712657625053; 
 Tue, 09 Apr 2024 03:13:45 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 03:13:44 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:24 +0200
Subject: [PATCH v2 03/18] dt-bindings: mfd: mediatek: Add codec property
 for MT6357 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v2-3-3043d483de0d@baylibre.com>
References: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
In-Reply-To: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=911; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=m2WMimLT+3s6slBofqVAvaqLkWzrgGp85vJbqpzM2J8=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTTqCdhPMIFZWlG+RUcAbHEDXlIAWarybBpGWPD
 AT/xwJeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURQ0FD/
 421AUS7r15gqz0cDoSJUWf/NwqPKzmknIY7/gc2AzW6uV9A8lGiL5egEUbMbau1KaWDGym8HEA9db7
 bt7tplgEVwqLq6K5RR/JF9K6zebQp0T15i8ijlHrf51CJS35ez4zXxUOr+PLROVdryvRQLvplLazH9
 q7L7vJVYUTpedo+SJR/hMzHe9KJUk4dvZQeVWKEfwyLX0RBdXBXoTV4EfPr+6/XUvKdgC01ksee6ji
 bPWeUyBm8uUbEOT2wL88gbnACMBIsw8tWU6SY1HcDQopSUJ2pHhavISuUd6Lc4zw6gAo/tapvBqCRz
 Yfqy6/i2AR1JTEcEH3SszNFHYUNr3ygXClDnMaUUk6amncjDV3vrHzYOnX93+niYjEIteSh3e5Ht/N
 SOk0kI+N7lj7gwOzVskKLRyUcLdZK7EN2KWfk5rxFDLzl+tX4Iea/7wtMwCw2F7RCOaDnXQtod/Vlr
 NymwDc0vagUQE4BuHF3eQMFr88QYoVkBre/JUc3T2taGZ0Tc7UHAWDJkYktyTSORMuluCCZjljK9o0
 ClLwJMrSiPYIqf8wzBU3uTNoPM8z4CaHZC5e2UDUjfdLkzw8pvxwFuj6I0yLU+CUtuBBvj06SNDt0Q
 h7H9SK62oWBZy/PWQdW5/h4z1d06KaN7RgGcNsKWBrqyFCUwYRTSPS7KJEDw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

Add the audio codec sub-device. This sub-device is used to set required
and optional voltage properties between the codec and the board.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
index 37423c2e0fdf..7c6a4a587b5f 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -37,6 +37,11 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  codec:
+    type: object
+    $ref: /schemas/sound/mt6357.yaml
+    unevaluatedProperties: false
+
   regulators:
     type: object
     $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml

-- 
2.25.1

