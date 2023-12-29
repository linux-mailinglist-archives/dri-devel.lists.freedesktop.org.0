Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6064581FFCC
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 14:52:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A09C10E09E;
	Fri, 29 Dec 2023 13:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B331610E09E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 13:52:26 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-55590da560dso1499446a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 05:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703857945; x=1704462745;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5FZShzhdUUXvOv6YwhzCq6E+ow3Z9zOiz8SIKSQQ5aQ=;
 b=rfy/g22UtIPSiAjwtLudg6+xWNzLuxjJp2hT7GL1S1J1m8e0I1hUl78dJlZm401UdR
 uJ0UESEUBiRtj1BzWbccafsaJSTx/sp02qX1G8LJe4ctTeWPvMPinlQgcOca7TPzkne3
 QkNVLK+SjmPdt+eLa6hhSIX4tP+zKnXXYfAKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703857945; x=1704462745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5FZShzhdUUXvOv6YwhzCq6E+ow3Z9zOiz8SIKSQQ5aQ=;
 b=IJuhj6kupmZliHDATExIlQDVl2o2lDiE4r2NrPWxytHN57XUER82xKtZ4NxzHBKYa9
 txJ87gnm5lhfiaS1EeRq8fvXo6bX210l2Be9Xiz9I2Yss+Hkr9cx2pPYMu3GyCAivLZe
 sVKBtWndH77Yqlvpo+qX/5gDIcbIOWM1T+UD8F1F2Xh4Wp21Bg0zVT4jToA7eljyX1GC
 GNhIXjRkqaiHdq2/e2m7Y2doFwWNV5kr7XfHJ8iPcvuRmNUAi0wvks3GdQHynNHLZR/H
 QS1I3JZxTj2orpFcHIh+r9OexQYksRzGYjM5l64+tkb3xW1+GH07xen+5whuivNDu2Y4
 o1CQ==
X-Gm-Message-State: AOJu0YyzvcTjdLZQSwFXZVVD0Vh+tHiNz6Kg68lRxfF+MrzTKx6E9zF0
 AWIOzMiLapQYHtJ0m9FdxZipBB5jbr7NMg==
X-Google-Smtp-Source: AGHT+IHZSk38r2bBvbe6blWI8vopM/JiejTHBmAEvO7rQpG1RlucRoCTiKPornXbD+3/E88gSjrPHA==
X-Received: by 2002:a05:6402:1616:b0:554:e4f8:9818 with SMTP id
 f22-20020a056402161600b00554e4f89818mr4348054edv.50.1703857945188; 
 Fri, 29 Dec 2023 05:52:25 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-49-57-70.retail.telecomitalia.it. [79.49.57.70])
 by smtp.gmail.com with ESMTPSA id
 i16-20020aa7c710000000b00553b243b1a8sm11019160edq.92.2023.12.29.05.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 05:52:24 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] dt-bindings: nt35510: add compatible for FRIDA
 FRD400B25025-A-CTK
Date: Fri, 29 Dec 2023 14:51:20 +0100
Message-ID: <20231229135154.675946-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231229135154.675946-1-dario.binacchi@amarulasolutions.com>
References: <20231229135154.675946-1-dario.binacchi@amarulasolutions.com>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 linux-amarula@amarulasolutions.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch adds the FRIDA FRD400B25025-A-CTK panel, which belongs to the
Novatek NT35510-based panel family.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../display/panel/novatek,nt35510.yaml        | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
index bc92928c805b..511b93a376b7 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
@@ -14,14 +14,18 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - const: hydis,hva40wv1
-      - const: novatek,nt35510
-    description: This indicates the panel manufacturer of the panel
-      that is in turn using the NT35510 panel driver. The compatible
-      string determines how the NT35510 panel driver shall be configured
-      to work with the indicated panel. The novatek,nt35510 compatible shall
-      always be provided as a fallback.
+    oneOf:
+      items:
+        - const: hydis,hva40wv1
+        - const: novatek,nt35510
+      items:
+        - const: frida,frd400b25025
+        - const: novatek,nt35510
+      description: This indicates the panel manufacturer of the panel
+        that is in turn using the NT35510 panel driver. The compatible
+        string determines how the NT35510 panel driver shall be configured
+        to work with the indicated panel. The novatek,nt35510 compatible shall
+        always be provided as a fallback.
   reg: true
   reset-gpios: true
   vdd-supply:
-- 
2.43.0

