Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5037D39AA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 16:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C03A10E1ED;
	Mon, 23 Oct 2023 14:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0358710E1F7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 14:40:37 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-7788f727dd7so208566885a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072036; x=1698676836;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JHlKinnyvGcWLyX/UpwiSi0uqGe6vbSuDhHVYP6fxiQ=;
 b=NnSWHMXlixs15zX0RiF0W7JVptASq1yqp+y+lKb8lh0K2hvrypm8nc3bYJlteH/ryd
 EboZOWMzf68QJY0S/colxdqYh9D9mA3UuzhvoqiHxZcSDB1d18AJA4W+PWkwIMdIXG2Z
 MJ5Ssu5jIsfJZ4N4200zhdCu0LtZUy/kk3F3qFUw+iEmpk4v7TZXDvFAEkOKHlDcuYZS
 ajvR5gARe3WRizu7uqR+D2t/0oMbZB8lVviem0j1vH4kex/fZHMHRmCFm+I5M08Z7sPQ
 k6ogyFRSQFRfI16omH/HIqpgR+wqFJHrd28lCWGRKZzTizESPtnOomtMEU/rnN8DGBMs
 0MeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698072036; x=1698676836;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JHlKinnyvGcWLyX/UpwiSi0uqGe6vbSuDhHVYP6fxiQ=;
 b=aE/J6hj1eD+OgPDE/Bo8FPnxjvr8RvrNEo/gOiLtDp/1IN1dTrBXKlcYSDl5bG2LQw
 a50UBLvZo5liM4VfIBDjs4fe7mX+YOHq3b5jHOtRIL9wZ4RtkzTgo49wXHgf8IWGkNGA
 pcUwUMPjfNDIclCOB/Iy8J/NL4rRjgrtrTmxYkCVYC+RIimptnM+cv+RiGqHOUT5Y5Cn
 Oc1W0lNKj5uasMzxROxFVlcco/addPS/JT6kAEfalVCQ3NTSpXDWtmHRZ9M/BecitbB8
 RaONKJSKeMgrsl6nCHp2OKYfhiCsr+H5bpq7XZ7y/XZvM1XPmxbhmFBKCch/IHDQgFU5
 MU+w==
X-Gm-Message-State: AOJu0Yx/rltimZZh7DxtXfRWZCsAKM4mCIAxxecBYGMAamZ0waHOi4or
 G+ys9BP/k6cliVOexpQ5WGy7aA==
X-Google-Smtp-Source: AGHT+IEiBk1UARjKqcmuU2E5mciS/+khU+Ezo/QX4nadgM/Ncz49UAdPF0+0FFE8lX/iNwYnZl5nXQ==
X-Received: by 2002:ae9:e912:0:b0:774:3235:4e6d with SMTP id
 x18-20020ae9e912000000b0077432354e6dmr8721774qkf.21.1698072035914; 
 Mon, 23 Oct 2023 07:40:35 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 07:40:35 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Oct 2023 16:40:05 +0200
Subject: [PATCH 05/18] dt-bindings: display: mediatek: dsi: add binding for
 MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-5-5c860ed5c33b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=898; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=+OlEWEvMUxFbKjJVjIiLf0e0kaqCLKK8Af5H5ievjhM=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXPZJ/cY4ERZiiSBfVRRGRyTqsN8HRcTtNer+op
 /GLORxmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzwAKCRArRkmdfjHURV0oD/
 0VXz2ryPfkA3GQgZfBGaQjZnLlqT71UDJqxrP4rzcrY58feUXLCqvam9ncDhmdgUSBM+aphUEBydzM
 WJH8b2LKpzmJaj5S8Wqz5jyP/D0snP4yShSpzIKA0W84vr969DljY9A0mz82JprPusmwLUWBpr873x
 iUD+sj9hNpR9mIu1BN+rAFj3se1zGrhWPAk+djg4GQC9Tlg3UAUwS87Qk3jA2xTlaeCRgv18Jngq0S
 ar9r0GTuD5IwHO4szV96F6eF77D6EWrNEcTHm6jbcdSEfQP2ecIjNOuTt85fAwTjhXqzXIby6ng1U1
 wdeBarMnV+qZIaOTiwl/3E3/+LnkQ2zZR1t1mJ6EyaQtWiyETT5bkYubyh5XsUAO1069iV+6uA3M8q
 ucsPRUSAqTSZ2fKX0yK/gwnSj432MKNFNMBnL4hPOGQcznyrlQpqZadpPUqvk6pCpGNDcvILphvWQ0
 AKifv6jwJLQfWb3FTbAtPoa9uRffmwzNlaub6T8EwrebyoGUFyIj4769lqi4XlYSHr2rk9hYlyQBYo
 vAxhRBm3jOkj8U2LWqL3zaFMr+epUIWc5htDqbxnXwi3apKidDY68sPFZ98mk5xBmITeY+ueR/Rry5
 n4zO4J4zgWT5Ss7YzL7jjwLr3MVXV8PDgniVA2BSyJ9UDXJM/TiRtPE3v0DQ==
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

Display Serial Interface for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index 12441b937684..2479b9e4abd2 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -34,6 +34,8 @@ properties:
           - enum:
               - mediatek,mt6795-dsi
           - const: mediatek,mt8173-dsi
+              - mediatek,mt8365-dsi
+          - const: mediatek,mt8183-dsi
 
   reg:
     maxItems: 1

-- 
2.25.1

