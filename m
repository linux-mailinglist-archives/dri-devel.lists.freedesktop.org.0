Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1F14329CD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 00:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055AF6EA49;
	Mon, 18 Oct 2021 22:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36156EA49
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 22:32:05 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id n2so3323841qta.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 15:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B+THCBm+Bptn3AcrYHmUbk69xNON+7lXvmVZMVyCP8o=;
 b=qtDqlY1x9BHB63nIqbapHVBGHLAjMRgBvzThTZG8wtldzjEWVUFvplZhen7xrELRfY
 mf57YDR7vtU0guUcF27Nl6v0jSOW/Xlzp5RFCzh9zbrGw09etc+4yTpT06wnrQpm8U5f
 KjeMTIUqyvblv/FnQh/gxZwSk87StgGlnsRfUyBUiVZeM5YUt/FxYNeoPXidJZjPVhOK
 MGFoNYcIqgv/Joiy7ltOXXKIy2AbRXLvkpyOFNHD+bWHid+0iZGWDjqAtt9n55cunjRB
 noZ0RO0p6AL57Eld5Jkj2vObC9Xc/yvgdGMEoxSlfj0sgUd/Vzhg51XoktAMimJHkNK0
 n8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=B+THCBm+Bptn3AcrYHmUbk69xNON+7lXvmVZMVyCP8o=;
 b=AfCxPaq4EINjaMEjIWmoJAX8IgYvX+REGSNsmKRQ7ycqfZVDi9XrxiuUtNsNU5I73i
 nfI39eCm6cXVU/zfweGwZUmXQFoJDTWN1z0Ona9BMyfWpTIw7a/Z23QjBkyJIz3QSJa1
 mXpKgzrF1SrgKE4mOtqZu1fIV5SUiCcbb5PSxUndBqA4WoKYgw0COe1/qVWZ8HfKhrEo
 tPV/mJR072NI1aesL8yLu3hw/LxgcGaLJqDedrfeFvcWKs6ElIKIxipIVnMz4/fIY9iP
 xFTBUM6rcUQZ5lZwmOy8AI+S+1WZcIMBb7BuTacIYH1ItVJTdR5EqUd+MnwPwqT44z3i
 Lnag==
X-Gm-Message-State: AOAM530Q66DNzuQz1mxKLaNlre+aAFSfrRBNRcN9xRibbF4SThIqF9LA
 VsDFhj07azqaznfblKNSc8E=
X-Google-Smtp-Source: ABdhPJxJq+3CBhP7qsX6w7M8ztSNq5vLo64yqArtuFqWeASC27vVuJPkHApqYzJR7Up9TzXZ3oKc3w==
X-Received: by 2002:a05:622a:1486:: with SMTP id
 t6mr33500927qtx.319.1634596324923; 
 Mon, 18 Oct 2021 15:32:04 -0700 (PDT)
Received: from localhost.localdomain ([67.8.38.84])
 by smtp.gmail.com with ESMTPSA id g1sm6986585qkd.89.2021.10.18.15.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 15:32:04 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: sam@ravnborg.org, thierry.reding@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: panel-simple-dsi: add Tianma TL057FVXP01
Date: Mon, 18 Oct 2021 18:31:49 -0400
Message-Id: <20211018223149.23591-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.30.2
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

Adds the bindings for the Tianma TL057FVXP01 DSI panel,
found on the Motorola Moto G6.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index fbd71669248f..ed674b57a304 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -55,7 +55,8 @@ properties:
       - samsung,sofef00
         # Shangai Top Display Optoelectronics 7" TL070WSH30 1024x600 TFT LCD panel
       - tdo,tl070wsh30
-
+        # Tianma Micro-electronics TL057FVXP01 5.7" 2160x1080 LCD panel
+      - tianma,tl057fvxp01
   reg:
     maxItems: 1
     description: DSI virtual channel
-- 
2.30.2

