Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 722D235C1AD
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 11:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1016E3EE;
	Mon, 12 Apr 2021 09:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507576E083
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 09:39:37 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 g66-20020a1c39450000b0290125d187ba22so5988077wma.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 02:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hIB5ovbW1Quy+W36SGjHdu93f090uQNPnQqmgWziz2Y=;
 b=zm2xIpJUxLvzkqUTEm7Kux2j4hsc7UsSYGnXv7d2oBzNu+GMnYnhf1z5//irUI3AjJ
 MMLBh7mFElwdI+UCUkVSCWe+ZwhCqRnhDoZkVeFLOe355xwrscIYoZtDX4Xv50XAFVWn
 8iWda9Y3ht52ceGi9cqPxCKnmugHB8RTh33+v5pFyiKNADnH3k3O/OB+pfkERYORBZuK
 5zu79RUvFTSKTwZ8+6pOdcgn60pGG74Sxq7MtkWFRG3jNyYPenQXIubqmXPT8uWucvE/
 e6Hz/7o9CqCd9w/EZJMVrGxOkoXvFolAws6QSI2o0FhzpIXWaw32OXrQLmJEX0PuVY7a
 RX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hIB5ovbW1Quy+W36SGjHdu93f090uQNPnQqmgWziz2Y=;
 b=YWHEQrGSbYoZHOp9MDQmUbMl+g5QP2aIYTt478tpSFLKYWAoTne8pikHOzUQ+j88PX
 rqS/CI18IJZ8Bf6bq9Hcx+IfyDvXhnb3/09LZ6C0XqlfUqEy+JduRFLyqyeON8sXyq7S
 0fGLxpaQEYmXrHYiWi5JwnQQQYB+4XFt6eZR41sU67M5ojTUZKaOz8hG4kqD0pQHj66M
 cehPrmgcwY48THZAB9KwUHu8cxEOC6ThhnjHKU5jd0Zv/UzPthrD4yUvm6A6MOKPEoMT
 6ge0iMYiMcu9J49lpoGbT9lKgDKzqrRxX0AH/uwN7K6Ahep3TfVLoNLg9FyBK46dn+0q
 uO0A==
X-Gm-Message-State: AOAM533VAyDawGoahmU4c1QsH/WoDwUjPPkDTU2TFMaRHsJar88k5U/7
 OS+nI/dWWSk+6h//bV//N+crMw==
X-Google-Smtp-Source: ABdhPJwxIfToJ6h311EOoJdSj7K3pZVeoBB4kmyIbIG0GYyMak+pMG/9kiLac5dW9hAThNV4EkUzdQ==
X-Received: by 2002:a05:600c:2945:: with SMTP id
 n5mr24322799wmd.7.1618220375929; 
 Mon, 12 Apr 2021 02:39:35 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:4c21:b00e:ff79:bf20])
 by smtp.gmail.com with ESMTPSA id
 r22sm14405902wmh.11.2021.04.12.02.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 02:39:35 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org
Subject: [PATCH v2 2/5] dt-bindings: mediatek: add mt8167 to hdmi,
 hdmi-ddc and cec bindings
Date: Mon, 12 Apr 2021 11:39:25 +0200
Message-Id: <20210412093928.3321194-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412093928.3321194-1-narmstrong@baylibre.com>
References: <20210412093928.3321194-1-narmstrong@baylibre.com>
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
index 408e7dfce409..23e21656ca55 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt7623-hdmi
+      - mediatek,mt8167-hdmi
       - mediatek,mt8173-hdmi
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
index c15b3470d652..9d7148b1a7c3 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt7623-hdmi
+      - mediatek,mt8167-hdmi
       - mediatek,mt8173-hdmi
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
index 9c125d7c8934..01ab0e8e02bc 100644
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
