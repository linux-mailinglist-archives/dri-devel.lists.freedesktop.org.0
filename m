Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E66658CFD1
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 23:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA08F2B797;
	Mon,  8 Aug 2022 21:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24858F059
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 21:37:28 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id bz13so7505718qtb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Aug 2022 14:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:sender:from:to:cc;
 bh=lkehkT3MiXzbK7OlrNh0fnuUz1FZoh3RVLHxkOdzZDc=;
 b=igXjAZHhXjbCiAKmX5I0P7mxTmLC1wBQ7rN0UHFcnaYsnUEt+3U0r4RY4ZQ6lm01iN
 b6DSMytpTpzV2x7dbI+vCwIKq8Lmy/exTEAPoO/lNkIL5k8oPiAZWiylal4mTl4WYgst
 Le9YMokZElf6oGSktUDoaaDSxo+17HnSGBrN6LX9/KYsNzyTXRk33Jm15RVv2ur330+V
 gYbNfFE3GySBt7J7VVX3HYr6RpNoJoW24Y1kX+M3yMXWRxhHCofy3PPojdkNRGTGHoC3
 9RlxIDMnqH7zHRIouE0CnXF82N/EBeC1bbo/BQKPMg4vuiMlILDAQfEdMcT+3ezmu8Iw
 bYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:sender:x-gm-message-state:from:to:cc;
 bh=lkehkT3MiXzbK7OlrNh0fnuUz1FZoh3RVLHxkOdzZDc=;
 b=ilcL0pKFD6bMLdNTldQaLZJbjE/OmsRzbp/8KRR6BcE8yt9YJ6JZeNfbfZ8YqWwy2s
 7M0i1B5cftSvRp/qXBNgMoaEqRo98izpFQ2O1DYnHT7OjXa91jN1S+2swNBwNVKXXJCV
 JLwcyPag4px+X1oUkC/9c87kJNKCjmMLrk5CXMdaKdXjobGOVNoaOmHF6jK4/r2wHHnK
 xsnPj6tCxDbILz8f+5ciA/TYi4p/Uhh11P1kmBrxJJ0Oa/rvIQYQApLeewxLI+cJ+EQu
 pazuJr9KTGN86tBJaVj4p5vj0gSJ+25g3chhd/WDdlgLb8WcSekVaYddqnzz8V6ZwCJ/
 /wjg==
X-Gm-Message-State: ACgBeo1tZzb7ZJZZSkMaWeduzt8JdzJDYKB6heuY8TxieERdZiOq9mm6
 DDfwEYt/odTQug4J6FlgctE=
X-Google-Smtp-Source: AA6agR7uWwIjiVLbkCd3o6NMBDR1IVfv7azaRn1+C6M8oKq/QCIHcGTBEY2KCtJUwm83Cn8Hu9lLuw==
X-Received: by 2002:ac8:5c05:0:b0:341:769a:808 with SMTP id
 i5-20020ac85c05000000b00341769a0808mr18380854qti.237.1659994647694; 
 Mon, 08 Aug 2022 14:37:27 -0700 (PDT)
Received: from kubuntu-desktop..
 (108-215-65-189.lightspeed.dybhfl.sbcglobal.net. [108.215.65.189])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a05622a110d00b00339163a06fcsm9146656qty.6.2022.08.08.14.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 14:37:27 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
 thierry.reding@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/2] dt-bindings: panel-simple-dsi: add Tianma TL057FVXP01
Date: Mon,  8 Aug 2022 17:37:25 -0400
Message-Id: <20220808213726.883003-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.34.1
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
v3:
Fixed kconfig dependencies.

v2:
Fixed accidental whitespace deletion.
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 2c00813f5d20..1b3d5e5acefd 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -57,6 +57,8 @@ properties:
       - samsung,sofef00
         # Shangai Top Display Optoelectronics 7" TL070WSH30 1024x600 TFT LCD panel
       - tdo,tl070wsh30
+        # Tianma Micro-electronics TL057FVXP01 5.7" 2160x1080 LCD panel
+      - tianma,tl057fvxp01

   reg:
     maxItems: 1
--
2.34.1
