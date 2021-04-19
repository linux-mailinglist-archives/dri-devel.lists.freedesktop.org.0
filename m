Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F41BD363C90
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 09:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBAF6E1E0;
	Mon, 19 Apr 2021 07:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DE46E1ED
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 07:33:02 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id u20so13032428wmj.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 00:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h2PEGOMW+3gpulsJ3q1pOUjCBVZvJJtGNOmv6/kS2ZM=;
 b=yZHvSB3fef3HnnFjWGamiYb5ZJjeXp8+WDU0fFLeest0MXpgvf7sM6naMALr2nV3r0
 OaVPutnaC6Y7Ddmmw0/Ke6QAWh2+uBV+Fwb5WDwwTFBRdN/jTEoeIPOvXzfhd2ftDYLG
 p4QCyFiYCMyseJOfmQdvccFpiNSxKQdqpwI0ryCF+PrFFYv0fbR2Oesb9EqmMjDgir5g
 hlpRH0/NPN0gqyreH5u1gXnl+PC9/j2r5bSL7m4IUvDaG9yFQMCmo6910OYdz4qChSDf
 mRdH/h9Oq7HVAmSWeE+JCikmPx2UFoRPQpHwOK/uJfC9sWTpZGtLLaqIuDh1XzIznzT/
 9LSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h2PEGOMW+3gpulsJ3q1pOUjCBVZvJJtGNOmv6/kS2ZM=;
 b=QztJtz3YusFrE5WxQNcjfy3zxOsv5yT+TR+M0ixIiZj6ShU5fuiThDEqcz1jIQi1tj
 i5ckOMZmgeQ7J80gRtAQaASJK3Qo4mtPsaPmbm5Vg6gzUms9SkN7ILFr11rurDctGFCe
 s6Oa3iLJJ8Bx7OFdTlYLhmE28HSiFofQSVIM8W1ce+Weq9NqEUnAxL+97VJ23SiTO8Ls
 zxUd+TNWT+gn2l8MexQsiZVHGg4xcMa57XTJL2lqXxFihvR9Inzr2wqKCBMhAtqTgfxL
 d6bnlq1GB6sB71L6r1X1G+Cd23GS82vJ2BSPI/26saaQrowdGsZYyijahEi8wzP9oe90
 9uhA==
X-Gm-Message-State: AOAM533cfKEsoE5BGTGq+qfP2KsPiQcZIyIT5iyDBT6WgKwclw5+RSQb
 7RUslnOVjNl3BenMmX/B7v2/zg==
X-Google-Smtp-Source: ABdhPJwWOVRcnouCxuWBQ/lQ5ASbbEd+ynjH8QI7wycxaKzH87nIRpFgnrsrwB6ZhQ7D/YYr/9AhDQ==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr19913634wmc.90.1618817581576; 
 Mon, 19 Apr 2021 00:33:01 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:2e82:31e6:67f1:4f33])
 by smtp.gmail.com with ESMTPSA id
 y125sm5492311wmy.34.2021.04.19.00.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 00:33:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org
Subject: [PATCH v3 2/5] dt-bindings: mediatek: add mt8167 to hdmi,
 hdmi-ddc and cec bindings
Date: Mon, 19 Apr 2021 09:32:41 +0200
Message-Id: <20210419073244.2678688-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419073244.2678688-1-narmstrong@baylibre.com>
References: <20210419073244.2678688-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=weRuGrIrSCS/7E0z7zGXTfkieqKmo2b9b3zEqPhglEk=;
 m=4OhWpDRl3EWsKo2xAbHezHdcGoUrsEeovaOubbEbqC4=;
 p=zKmvMzMsvi/UJaeb54phx7cTaLZasyaFc1SoAWluN64=;
 g=bc9c5611c788292574b503426cd53c1df4c9afa2
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmB9MgwACgkQd9zb2sjISdHkERAAk+N
 +2dE9zUrVcQjhb8YopX7VKUMGbIIP9PuZo9jpMxJOiARMjBObXYlVFKIabe6tjTwGJOmdd7UJRCRN
 Q5arXTAze7ZBggM4NU9T5iGkUf8q1PCfsfKWVKwpRLAe517LqsBICviVOlivfrokYS2wrD4y6YvBJ
 fuisd9b7iwfSrPSr0bUkxCdrMoOwasYUrsLDygxYcQeE7++YZnBjVfdiiP0G05ktzUdbxruMOOSN1
 Ox3hrMIKqujAGnSaqSi5TXssVrSUMU9R1qb9nZ/M6SEEBoQ8+HNRQDAM2NfDGqy0cNoCVUzvJ/Yt1
 r6D3xKSWFpzqKXkQTR8tdpTy4wXeeLJdKdZnlNXbpyNCdTAGKZS/kAbul8/TMKRdWwBr0hUYZlz4I
 nq3NdEkJOq5by7N2JZk2dzXUmxcmvzg7SADvoQRBhi4TgVTo4Z92XMDaX3dcjErqWARwGw7mUhSMZ
 yuaVibaskfGYgBQbKhMdft/+JMW/HA5SB9DHhDKZLsyIa9emSThNz94R95xeJ+xeIEcQFWrwBvDS2
 gRMT+iay39T04/VYfwkq0RJxD+9Bwz4XqWH6awDvAlprJmQRPwGnUkh+3cQUjEIMTTSfU8uDPbECl
 03oxBby4nmvDVtxMFk5jb/vDz+b12P3pYj9ZBYgM+IrTEETFaVALYE0F2LmFyDaQ=
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add mt8167 SoC compatible to Mediatek hdmi, hdmi-ddc and cec schema bindings.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,cec.yaml       | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml  | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,hdmi.yaml      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
index b38d8732d7e0..66288b9f0aa6 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt7623-cec
+      - mediatek,mt8167-cec
       - mediatek,mt8173-cec
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
index c8ba94d6908b..b6fcdfb99ab2 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt7623-hdmi-ddc
+      - mediatek,mt8167-hdmi-ddc
       - mediatek,mt8173-hdmi-ddc
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
index 6a144faed682..111967efa999 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - mediatek,mt2701-hdmi
       - mediatek,mt7623-hdmi
+      - mediatek,mt8167-hdmi
       - mediatek,mt8173-hdmi
 
   reg:
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
