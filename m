Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC9D7D39B6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 16:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A45710E1F7;
	Mon, 23 Oct 2023 14:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909B810E1F5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 14:40:33 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-778940531dbso209174785a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072032; x=1698676832;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SkwhU2F4TXr5U8/eIVmqKK74gpv3rz72+n1Z9i4NLQY=;
 b=0ERc/06XfctFCpPVxP7jV844bIBlAANJp/aUpQS1mE1awbz3B1Wd3qHiGnTPjXbtZP
 s9IUeROhVlVgKc5RDcvVr5xu1qP5ayd1hAqawMQC70xlsyJXikCgFcQITAn6p+/T9AS+
 gtwDEhFwFFZuHW+Mw+doYLOxwluFOb5DMRLvhs2qj4M71h63HThYrGzdA8w1Xmt2Oe3H
 vmVVxRQpjeUm3jPyM0uXzWmccp+2ds+Nihhqe30cq/xN6Dv/w+Iq9103Xs+7mcHZrya7
 ZPzWmaZcRcnrfI4X3vUknRDsAlL4QeSdXXrQpw/evVGML5tKFVDru/qmxEOOwzvabaHx
 W70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698072032; x=1698676832;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SkwhU2F4TXr5U8/eIVmqKK74gpv3rz72+n1Z9i4NLQY=;
 b=jc/fK0s+C8qu2wcUm8+p9oFGcjVO48yLgMXtFHZpZxtquz5MrF9cNnbFp/OZ1rH8nC
 2aKjEXhv4+VEICzgiBtj1/wrugrr/2mUQ6UNDROW/Yw7C6AeWhdzzLS4tNoyQMH4WW8E
 WpbHzej9p2yQYloE2eW1HqzPq6fsl0Da5HWM+lkiPEU5BBjvPu5yeREFBJoSozxVmqlC
 n/YrVmfhMmDdNT+5oAtM1KF+618HZa0nhnuhWqQhdRhbl1oS84Kq/xEUgVwfRwmkI4m5
 jCsLfodBL+d9NzLOYpYc8PNGAdG1LLDuB6obIDXJ08zYM6ORjJ76wQJ6mRhBfkHVKulI
 00uA==
X-Gm-Message-State: AOJu0YwN63CA1VNk3anOgSYFtRSEHcnN5tvCPMWgf/pgdUb7uhoiFkf+
 kVID96ENfYPTnpa4sv6jTM9TDw==
X-Google-Smtp-Source: AGHT+IFoXaN6pVThre1z/S0bbgU8FS54cZC6t6c+5RXc70MLFec5xoE9QM4x8jGHB1G542vMIjK6xQ==
X-Received: by 2002:a05:620a:1a09:b0:777:74dd:621d with SMTP id
 bk9-20020a05620a1a0900b0077774dd621dmr9306621qkb.15.1698072032470; 
 Mon, 23 Oct 2023 07:40:32 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 07:40:32 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Oct 2023 16:40:04 +0200
Subject: [PATCH 04/18] dt-bindings: display: mediatek: dither: add binding
 for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-4-5c860ed5c33b@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=938; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=tYxquOkpHCbnFi05aHcxCGsRKb8h7qDvHcF/fXuV370=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXOkwi2U4WCrequXuzYCvok2QkmF3+0zqAfxGGm
 J896eL6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzgAKCRArRkmdfjHURViaD/
 oCnO3B16x6z8742sQoq3Qz35HJC9XGKiHeYoOY2xIdc2g7wjcBOLaA02OVr7AbLQPFMJ4zskMA4uaz
 IjSpJd6ha3Gdh4fql86jC1THgW8paGXUOfdna0fEdRXWf/TpfPschReTyn1q6a1YHdByWrYAXbyhkV
 JOOZp7q5szn7Cr+4KUdiAUsdynt83BQMUiWxOf0fwa4+vO/EVy9Ufs9m6xtufJJFGgoEH+UjxHzyrf
 58I40s5RZyWwQo7GAu3VWsqrcMUF/txYb5il27M5gdXSfPH6HbTubmMMBNXMAhm4i9TC172GOCUsXX
 XqCMkDF9xwCbjqPQJgdRR+4Ld+2PpWrTjNEEhf3YGGMV1i2kVJWY4Rk4j5EaNJ3nZvhFng8fnpzwZh
 YcU9lkXwpHD3nfO/9Ll7J7tvDexb3pD5v+M3EsS4ViFAmKogqOXS5Ev99oBj6D5lbzcgB/wryuRK6q
 XGoVJ75TlSy6Yg3XFIMggMWra+1FonABuOdIZx1Zm89vE5/w/MIJ3h4pYuQUSJ6KXdTc7V+nCgGo6N
 BSGnJVYub2dD0vJxKOSqnG2fESwz2kTkO9lcuCYpmW3LkfpxIdfwU0TxKYAmRtGuwsJ6deFOp0NsCM
 SujXn5rcipp1UgI6zjCqhbxOV3FyFENNZ6M3tN9RKHtk0ZN9xiIRoicfSzOA==
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
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Display Dither for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 1588b3f7cec7..6fceb1f95d2a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -30,6 +30,7 @@ properties:
               - mediatek,mt8188-disp-dither
               - mediatek,mt8192-disp-dither
               - mediatek,mt8195-disp-dither
+              - mediatek,mt8365-disp-dither
           - const: mediatek,mt8183-disp-dither
 
   reg:

-- 
2.25.1

