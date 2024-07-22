Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB4B938928
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 08:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFFA10E387;
	Mon, 22 Jul 2024 06:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wNn+7cbO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADEF10E37E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 06:53:43 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5a3458bf7cfso2736364a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2024 23:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721631222; x=1722236022;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=u+3ze/IP2QrseHnlo80eunkZiTdbCzauDagUJ/lYngU=;
 b=wNn+7cbOI1Ffd1ASWgEEBLMhrt+8Un0b8CksJunAvhq4S9pSaD5K3NmCuxFAHwp64E
 u5sx9dix6JCF3PA7Lqaq1FLCoTV++zkH9bEr8Uh9BJUrkYaeQPCcC8GhSczHWSnGybBF
 Dfc/EfFC5ugu/zlgqKFh1p0vzfq/warlY5qdVxp9cs5fcBenVqErDDZIL6iRKv7vgkhB
 CCiI+ckZiJ+tzTLMOHuj9lefDLuMUwDaBBadgXpmsU7Mu30Gu/jUZE2shMg+bvcvdTAJ
 pVdUkkw6wGmwO+XdpFYxqwe+N4eqmwNHq2qnL0R30ptJuQzn/8gb494IXoC74MKcuCLI
 8Vlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721631222; x=1722236022;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u+3ze/IP2QrseHnlo80eunkZiTdbCzauDagUJ/lYngU=;
 b=UoXcBD5TipYJm+DCo0QBClzkxiDZJuxLkalPZQ2NHp+XB8jYO8QNRa8sNmHB830UcZ
 PsO2cuxQ3/3XwbyH2zHvOGeJNyPfJ32/luAOVEh3sBCk2e3NtO5uFqmcE/gUsPN1T9IO
 trgxzUxg9mJu9Daour4pbv+NdnlBaGPX+2CEDyPY0phMfcvaReRrGgN8xq9qq6R3d0P3
 TXUu88WUw+85oM+raTEdFqMIpGxgDvwi7IXhD1ChASRzfFQo2LoaNyrdPhxrqO0o2l7R
 vsM+C0wcBDcEBHliGuTk2n7tjs11vGo3Wh7sGAlkaNChOlxAftwziHlFn6j0HrpIfPIg
 vYNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF6W3dCf1ynKag/7Il2cVwKBuDaeNv/m1rM5XKMLK0xXsa3wj77QsW7xudQw8RSeSU12V2WHhfp3FUKLPgJ7qEAJeH+IBRAqkMDwlGkRmu
X-Gm-Message-State: AOJu0Yx+2NAtYxzX+DBE4WI5Jc6je2/3GUH6qvkbh1rZyCXJckLA7VRS
 DdfjZwPtDcJRGcjNf5HmZgQlf/a97R171JIEqUJoUF/pji8xhS08FMTCnbOIs5U=
X-Google-Smtp-Source: AGHT+IFJymhhbtomjKgP2gDQkxgVKRlXBgHheppPAvjAkJL2snZBn5zWFyPNQaFdccjRosPDO5Nvtw==
X-Received: by 2002:a50:d699:0:b0:5a2:80f:f7c9 with SMTP id
 4fb4d7f45d1cf-5a479970367mr3223477a12.2.1721631221950; 
 Sun, 21 Jul 2024 23:53:41 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5a69c1f56a0sm1982126a12.64.2024.07.21.23.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 23:53:41 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 22 Jul 2024 08:53:32 +0200
Subject: [PATCH v7 03/16] dt-bindings: mfd: mediatek: Add codec property
 for MT6357 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v7-3-6518d953a141@baylibre.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
In-Reply-To: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
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
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1920; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=UIlaXrHC3JXqJmHxOl8jKxQMiudwmYCtEVWajCQIFbA=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmngHwcvHRLjV9AcqoRaSL0Yq3rkWT8qbII8GiPHlR
 zhVMDb+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZp4B8AAKCRArRkmdfjHURZeBD/
 926K6vv60HlYRpqFEOI8Rwz/HhG/pQHXFSsTFR1tDqg19ttpvN7X4FeGuXGeLO3Mc4JFp0Ahn4vEsW
 1eL5yXsXgmfrvhpMzj8qts68wnEwk2CW+P8Bm8iW/OKVySOc5hirQmJW+ffaKrdOp8pyP4ZsBrpyho
 qAl9LhWp6stCrQcX2lY8GfgZ3yqsvV66Brh2ifPjGaC4m++c2Dh5gSe+Vx6Ki072ABSePEitfqdFrs
 oeS6PMqXv9C/swOSKY+5qaBD45/zThXsyOnBvpOUC8AEr4NWwr2UETodSaHSOuzHMfSsH8jOZlmmz7
 bA9hpJcXSttRsYL3v4F9D91lfa4xHKqkNS3Hs1mWZbS7Q5OGAPn+DstZvGjYOPHr6B09+SJXLE7Qoc
 2870Tqjt1bdFTjz/l4nMMeET3IXvzwGLI5/1fBlmWFql2AYwZnKhsUNexYhGPq5iax4We1cxnCjJNC
 7woyOHGJFTwHsiZZ2wFr+9draTok5hflT2TeOUKW74HBQwUz8Pf6n7LgsVNW3KZcQ7256dFL6b5BUZ
 F/1B11dezdLMqSVo3WmFOGQXx4tEG4lh/AXO60JCXrz7p4d4DfC6rY2LBzEhvVi4dTlHoskzwRHmDr
 mR/+dFiQa9OLoCvr12SnKK3MARcMhluKNqIm0yiZOuDAauFDTNrCDVf9mDJA==
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

Add the audio codec sub-device. This sub-device is used to set the
optional voltage values according to the hardware.
The properties are:
  - Setup of microphone bias voltage.
  - Setup of the speaker pin pull-down.

Also, add the audio power supply property which is dedicated for
the audio codec sub-device.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6357.yaml    | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
index 37423c2e0fdf..b67fbe0e7a63 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -37,6 +37,24 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  mediatek,hp-pull-down:
+    description:
+      Earphone driver positive output stage short to
+      the audio reference ground.
+    type: boolean
+
+  mediatek,micbias0-microvolt:
+    description: Selects MIC Bias 0 output voltage.
+    enum: [1700000, 1800000, 1900000, 2000000,
+           2100000, 2500000, 2600000, 2700000]
+    default: 1700000
+
+  mediatek,micbias1-microvolt:
+    description: Selects MIC Bias 1 output voltage.
+    enum: [1700000, 1800000, 1900000, 2000000,
+           2100000, 2500000, 2600000, 2700000]
+    default: 1700000
+
   regulators:
     type: object
     $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml
@@ -83,6 +101,9 @@ examples:
             interrupt-controller;
             #interrupt-cells = <2>;
 
+            mediatek,micbias0-microvolt = <1700000>;
+            mediatek,micbias1-microvolt = <1700000>;
+
             regulators {
                 mt6357_vproc_reg: buck-vproc {
                     regulator-name = "vproc";

-- 
2.25.1

