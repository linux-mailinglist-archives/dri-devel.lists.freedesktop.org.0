Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E03025B597F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 13:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FA710E3A8;
	Mon, 12 Sep 2022 11:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6315A10E3A8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 11:42:57 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id y8so5378173edc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 04:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=xPvGqglYOx45OBflVbFBgWBPdZSiJcARnAd1O+41cto=;
 b=QrviGm+mrbpFRiOMYT/RDlQjvzC3zE5EeummcCnA2hBN7hCa0UDmUyRqZJNNz3+Ass
 GVNNJ91dRRbnves+vslhLpelBJOVgZJL0rkzdHV6BjnXWi0lD5kb/baz+7xd4vggYRFU
 KrTHVlLhcAExQLxeqFl3sZBl2g1a3UoWJYi82snkulksa3jGKJ91+pCgDxx2cnoU+T6M
 kl8sbPD4kNspsf+Q0FZc6pqU+rdM08BcxpzlkYlTShmPcZyN4BmMLARj9mWYELBwJBZt
 wZEMYh7zLV72msekaBMdWL+u/7P8T9CGzQ2+807R7TkYPfbC/WQ3I5AXg9dxi6NMqI4q
 kJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xPvGqglYOx45OBflVbFBgWBPdZSiJcARnAd1O+41cto=;
 b=eP+9uW8eyUPVgd0pMMJRo4v484XJrYm7i6q7g30ikni7hJTI8PEbo5QyogmziZ9Sbr
 LEDer1He3A4PLSdPUgrYhEPeSg09LXGPlxiUe3jrtal9qsoboikTiJg/gqjNJtQKp9NO
 lUrJbsVsJXzBmnSf/E3AbGm6YxZJaAzq7UofC/RgohUP3xtphtrCQNpjXbJJPtZb99cX
 zxHYT/aJy5vmpSlb5iWmzYutUMIlHfD+cCkqrP4jU8tba70+9g1CNiid84CqJP86VGff
 FAcG9ljDV2mrrnPYGnI+SRTQfwOEj68DSr6ybDR2DyPdOF4xMFL+dwaxN9riamYoBmJ2
 NbeA==
X-Gm-Message-State: ACgBeo0bh/ytmpHxC8F8k9L6DENhYgR9FFvul7mC5LhL/jspUxou2hWA
 L4jaCTC/wPF6aZOHwaRPT+P/xQ==
X-Google-Smtp-Source: AA6agR5UC+z4uKt322fOtxbjy3v7Qsg8mOhUyH2jrR3hVvgOLxMKyOPAdH5tGHy+4F+vsHXSD9pEqw==
X-Received: by 2002:a05:6402:5002:b0:444:26fd:d341 with SMTP id
 p2-20020a056402500200b0044426fdd341mr22190908eda.351.1662982975861; 
 Mon, 12 Sep 2022 04:42:55 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 9-20020a170906310900b00779cde476e4sm4314368ejx.62.2022.09.12.04.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 04:42:53 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dianders@chromium.org, lkundrak@v3.sk, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, tzimmermann@suse.de,
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v1 1/2] Revert "dt-bindings: Add byteswap order to chrontel
 ch7033"
Date: Mon, 12 Sep 2022 13:38:57 +0200
Message-Id: <20220912113856.817188-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912113856.817188-1-robert.foss@linaro.org>
References: <20220912113856.817188-1-robert.foss@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As reported by Laurent in response to this commit[1], this functionality should
not be implemented using the devicetree, because of this let's revert this series
for now.

This reverts commit a4be71430c76eca43679e8485085c230afa84460.

[1] https://lore.kernel.org/all/20220902153906.31000-2-macroalpha82@gmail.com/

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 .../bindings/display/bridge/chrontel,ch7033.yaml    | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
index 984b90893583..bb6289c7d375 100644
--- a/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
@@ -14,19 +14,6 @@ properties:
   compatible:
     const: chrontel,ch7033
 
-  chrontel,byteswap:
-    $ref: /schemas/types.yaml#/definitions/uint8
-    enum:
-      - 0  # BYTE_SWAP_RGB
-      - 1  # BYTE_SWAP_RBG
-      - 2  # BYTE_SWAP_GRB
-      - 3  # BYTE_SWAP_GBR
-      - 4  # BYTE_SWAP_BRG
-      - 5  # BYTE_SWAP_BGR
-    description: |
-      Set the byteswap value of the bridge. This is optional and if not
-      set value of BYTE_SWAP_BGR is used.
-
   reg:
     maxItems: 1
     description: I2C address of the device
-- 
2.34.1

