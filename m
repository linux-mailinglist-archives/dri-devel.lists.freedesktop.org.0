Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF968A9C7C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B5B113CD5;
	Thu, 18 Apr 2024 14:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Kr0y7HC4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AAF113CD6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 14:17:22 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-418ee2fcd6dso3681435e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 07:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449841; x=1714054641;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=A95n4qk+OzmeppmcDHJlgcxg2vp1t9jUT+VVZ3XCGv8=;
 b=Kr0y7HC4f06+b9iKdjvVABovoxXdtBhMGeof1ijNT+TqW9V2areF6LnjhLYvI3Jjof
 LVVuUIs8ls+YIr6z5KPVRYTrpo2N7sljxBQZ3i+LVaw0vzx5GOOu0uYNwRgtK8JwymJC
 BuOvMRecvJY8z0JwtCUupumsnjcppwPDPckaeugN5n5USnisGyverDjhZM/3+2d/7qs6
 iO/+pqDSZ9dRLxDuRPmUaxs5nhVy61Fn1vF1wIXh1C7/Y30eJGOAuHdaM6qgBUj76nbh
 1m6v4SV6N9toL/z9H73xS+oPrkOUfkyM14e+XwKwtrU2fCl6X2eIS1IimZ5Vt6AiyEB+
 YT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713449841; x=1714054641;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A95n4qk+OzmeppmcDHJlgcxg2vp1t9jUT+VVZ3XCGv8=;
 b=qdfbQpLZMjkZ5UBed0X5H7GKmMv7U+UL5GAz2aMbHIzPW+vh4ci0eqC5hUV85XI28w
 bslYXhWgoQD6GDt9gEiVpe8BpywI2WVE7U2FqOeG4fFC5NSl9GD1lLsrWfPvwW4A43r0
 xW38wnkGpaiQQnsfiyBjddcRwRv9kSVEcK5LnAeNimU+1UnwMmKwBbBmemKJmCdtNDDx
 mFaz8TORQiN1XHyze+7zFlSJ7oQG5CD3wd457ByDVUuSsB88jGrdpo4G3vg6UldPd7Zk
 TGu6Xhlt12fhS9s7KV7OgzX9yL08C3RhtAfHI6fffLrf+5nDkH2Op7NkuDfySNk13SAj
 NxPQ==
X-Gm-Message-State: AOJu0YxWqEFUTTXSGkUqER1L5mNAUd8RNYP0ARc9a7V01l5QA+b1aOeD
 koADNeh81qrr/FdDLUbrmrq4hdkpXVjCyb6idyaZBi/BMCLE/ZjYrJ2c5oGhnzg=
X-Google-Smtp-Source: AGHT+IF4YULCsvWkwwwfg53QmQuiwnTv5bGuVI1fQmXCyyYK/3/4b6rzPvnr3zpMfDOh+P6uhyoMDA==
X-Received: by 2002:a05:600c:1d01:b0:418:f991:70f3 with SMTP id
 l1-20020a05600c1d0100b00418f99170f3mr368992wms.8.1713449841187; 
 Thu, 18 Apr 2024 07:17:21 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 07:17:20 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:16:55 +0200
Subject: [PATCH v3 07/17] dt-bindings: display: mediatek: dpi: add
 compatible for MT8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-7-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=882; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=RqJmpnpajyvLw+L+E8GifAX8vmrSQx9ohtd5V3Opzk8=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStiiccS2/CHLvgvZSrpjPICthqNkoAqRcoDoW6S
 2gSyudmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYgAKCRArRkmdfjHURdNjD/
 9SlFNusJrPYkweUcHXLeozsIQWKFiZuo/9SIS9nySjCqGVF4stQP8TvKOQV2Hr556zdgKw52kw3ujV
 aa6XgY5nxnsuWanKvXkY6T1niKytAaHsN/rK/vt98+AumfpMLwc7pIhQ5XrwglNUx7PqMDK0UYx/ND
 BlFmdZcgbaXm6HY7SqZ1d/oidoqhDa4Wr+d+fLwiUJPC5qJ9rWkBAVJ5FuXD0rGVBbu9m+M7JG0+uw
 4b1c6n/GyfiDCOLCg6+aTgkVbzsjNxCVihXU9YI6B7QwHBfbYQECzhzopCcsRuwJckIR677Hpenj18
 7LbZwmbNBREmKXmfMCuB7AJIgaDK8eQp9sw28TxKUQwuyfGCRcGqYREcImDOGW0FmxdLD4b9Ot81eN
 /g8hlHrHs3nBgUBIIGcswvCj9oDqnkiF8Dvp2GU0Vkzn11iduL4bvivgYs0qIH8b2Z9vvK9s2BKdAm
 KiPQsS3+kUDnWgi4Mz7blpAttddVstOVX/DLRLJlsh8p+wuSxPQr0l0WvwervVe4+2ZGDbSAOE+aRP
 mkgoC1/LfOKKXNsGyHRoBguRRlX1+eRDO7PbNVWkxIGLESQOgKXpfkXpiX8VDlRQ2aTuEENrXN+ISu
 mUjkNdi1VEJcnQRE3vs3PzRbDQi7gBh3Vjaj2Kmwy9AfCJ5QYl98CcN6XBfQ==
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

Add dt-binding documentation of dpi for MediaTek MT8365 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index e126486e8eac..75d0caa4ccdc 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -31,6 +31,10 @@ properties:
           - enum:
               - mediatek,mt6795-dpi
           - const: mediatek,mt8183-dpi
+      - items:
+          - enum:
+              - mediatek,mt8365-dpi
+          - const: mediatek,mt8192-dpi
 
   reg:
     maxItems: 1

-- 
2.25.1

