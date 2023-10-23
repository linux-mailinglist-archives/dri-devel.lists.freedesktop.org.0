Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B367D39BD
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 16:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69E610E1F0;
	Mon, 23 Oct 2023 14:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F1010E1F7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 14:40:51 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id
 a1e0cc1a2514c-7b6043d0bbeso861077241.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072050; x=1698676850;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=btxrc1J+7nlpNBhaaQIbXhy+BRoKrBh7Tei2ReYceTw=;
 b=x0r89RTWA0SZNDQ1qk2LynZVIk/ZnknhWzVZtED93i/AdqpWA1wnYTotigih13Ri04
 YcJSbfDhICoRTLbzmZvBqmBcAXnQIY2dGvVlNeQb2JYdxX7MU2ferJ0LxNFaVZwpR0yl
 lOUmEBm7TzL0P4Yoc4CDo5XHZGXT68LGH82zkrNdo7ShfWMJygepm58dBPapVk3NVfzF
 m/wfU6Trru76qIqYg2UVgM8tReDNZL9TvWjY2UyIJbvL0WmFyVqIXty88GvL+8nSLBTX
 ZWmGkQP1dorEeuXGLNeDVglSKznRQgwW+QjjaUfPE31quqs6LzVYGzqgSpSO8cSu1jQO
 5dHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698072050; x=1698676850;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=btxrc1J+7nlpNBhaaQIbXhy+BRoKrBh7Tei2ReYceTw=;
 b=UF5N4luYTr+pKCz7Ss0CQaIr+NXvPc/Lk92MdXVYmJkqob4w7ToGh6T/viBdw6OCXj
 NqxIu8j33tLI1NjHzrH+IMIzV5rsgCidWpj793/opV6JSA5Pq5kvZn2bE9zIn611dwU6
 61bJ/cHjCcDgwwY6o/9zw1z7IYmgSAok8xISzJB8DSM0661xzqt2u5sBwMmgZpEl6fSz
 O1xmxavCIh2yk/lxf2FSOCXvSMhd/LZbGeQoEqSE+BKUywbRAA7XjZbzKAStRHbdc2GX
 9YB5YMboM7Spmu+LWytiLPWNNncOteumCoUgSl/LgvzFk+pHTtmF/8l3l87zdY2u8Rkf
 3Y1g==
X-Gm-Message-State: AOJu0Yxwj887m7HI2K5JWyQKWi9gYyHfEgMILpJADcJ182pel4jr7gAc
 dsYGIsDxorgOAeoUay07I9SJNIvJQ4bkZf4iZd53Ig==
X-Google-Smtp-Source: AGHT+IEHtN0BO7u7QDArNCPWdW4jkZH4U2Tgzur52L0BG1r41rfx44EWTcGQl9iPYctJnK5hBurJEQ==
X-Received: by 2002:a05:6102:4741:b0:457:c025:4c7b with SMTP id
 ej1-20020a056102474100b00457c0254c7bmr5878640vsb.19.1698072050079; 
 Mon, 23 Oct 2023 07:40:50 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 07:40:49 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Oct 2023 16:40:09 +0200
Subject: [PATCH 09/18] dt-bindings: display: mediatek: ovl: add binding for
 MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-9-5c860ed5c33b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=860; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=M4WYL+KrM0LAMGbIVVc2NhXvV7PADZ7FKnKax4OIhj4=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXP+76mL8HcY0aJG5HTEVTd79bVZFTl7La+u6T2
 JtLgOyaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzwAKCRArRkmdfjHURW52EA
 CWVgb591a/Qg88wnSQZ4uFhh17HaC4VEqoWqnc5n29xLfeW4uwo4iuJ1oVMC+IgR5Sa4OZv57VWYUz
 1jpU9G55weccJHI8BBTZEpR52MScVpl88+GfNRQhBDdRXI2GiN1yBFQlSJM9b0L8s4xlrZKDvDX4Z7
 gP5EZEa20WZkJN/ZIwRqeU6NaN50M0VhcX/skUqfrivEaeM7hkBhqBD/O9Vs/0Iw6+VolwYEFlr1wy
 Khn/iFY3FUx5JS5iMwAlV0CDUo9gDfbFhVV31rxhCRnK4KbTSnl9Dz+kEoJD0dUfIjNGJHxGm6Cn4U
 0bz6kYLJId4zAYyUeKK8PoJTCEeV7kgjI27B9yxPGCzK6KITdroOYCTMt6QP9DqY7KMexqo6SAyR6B
 knw3j9zrIxxYNWVptIoES4cPRcD5nYKrwvJ8DcCRx9TOKqpXnzkWifEGFWAQqnOGNTKk2o+MurGpkk
 KXaBkkZXiMWmHPYO9GpgdrI2M7VZwq/IQVIKc7aEe8pZjpPX868/ZSdgszL1nRULbhHUrzJaLLKMsS
 WNe7bfxjPFr+NqgEf0vr8ZypN2tC1fqKSXgB4MWxMb0n6Uwy2+Tx/6bfn9UwPfbwLkfoaUOlULrghE
 wJoHb2K2NMlrEE8w5A0+VvaMQcUD64/D5uzOy3Z5Ilnx4VcaTFuadcOxuUjw==
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

Display Overlay for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8192 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 3e1069b00b56..2873bbdf3979 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -43,6 +43,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-ovl
+              - mediatek,mt8365-disp-ovl
           - const: mediatek,mt8192-disp-ovl
 
   reg:

-- 
2.25.1

