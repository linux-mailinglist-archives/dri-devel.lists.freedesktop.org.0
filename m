Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F02D9823CA7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 08:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE1B10E3B9;
	Thu,  4 Jan 2024 07:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD33710E3B9
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 07:24:21 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-55569b59f81so242148a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jan 2024 23:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704353060; x=1704957860;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WW0o6HHPG/mM4iGv+v8jU++HNDacNhnTQtmfUNegT7U=;
 b=eZsaPvkR/xdD7bzbCUiZX2vIDplDo2WVq5k4Q15QNX6IaUn22Qvy++aMQ0zSewnM7A
 NLm2klN5aIo6l7L8m70Dg3npD/oSP0PJXT1himHY8ZiKBj4ytozEfHm+buYl6GWVCV0Q
 zbiOdx758hj3zbWPXj1pahKapHFmETBSt3Trw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704353060; x=1704957860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WW0o6HHPG/mM4iGv+v8jU++HNDacNhnTQtmfUNegT7U=;
 b=xNmV3CPZeGAaTkgaM5RQalYryAV8O7NtSilBlA5c07F5FxXS1X8nItSLKOpNK6k8ik
 rO93RwEQEss51vUWlixVjbpcbCMNJz9UZ62Ox6bssqAjmKGxumugjtV5OGcK28iqj6ih
 40PFXKyTNT7erRrg0tFjCBmN+P3LJ5IgEPjCqyJi9lRwKjv+4Wxm3v+jywifdqzn/ycI
 awCTxVIq5voAOWVB6/HaH5XtfZhhK9EBBQYouhq8Ug68nZ6ugnbEyqtGg8eDFOURfH+N
 6sz40/jedsuBfvc4Bcm16/By/lyRxDGKJx4cCmv3qKxbiDCxUhMK4w+gCgqlOZUelO/b
 yqtQ==
X-Gm-Message-State: AOJu0Yxen7lcm4sVuicgszQt1hnqRoo0JDzLdypdTQfp0KYnexYTG2dF
 MwRLm7KJJxcRdRAy6Dy/AKsGM0awUMpBcg==
X-Google-Smtp-Source: AGHT+IHvPIuIgJDDjbDtuf22xYU9uk+ojoUO5bL5pNWzXog8ZZJcQKnDJWkQWIRkgRGZKp+vHmjunA==
X-Received: by 2002:a50:c082:0:b0:557:eb1:bb3c with SMTP id
 k2-20020a50c082000000b005570eb1bb3cmr3997edf.53.1704353060246; 
 Wed, 03 Jan 2024 23:24:20 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i..
 (net-93-150-255-34.cust.vodafonedsl.it. [93.150.255.34])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a056402000300b00553772c2968sm18530735edu.82.2024.01.03.23.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 23:24:19 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/8] dt-bindings: nt35510: add compatible for FRIDA
 FRD400B25025-A-CTK
Date: Thu,  4 Jan 2024 08:23:41 +0100
Message-ID: <20240104072407.41290-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240104072407.41290-1-dario.binacchi@amarulasolutions.com>
References: <20240104072407.41290-1-dario.binacchi@amarulasolutions.com>
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
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch adds the FRIDA FRD400B25025-A-CTK panel, which belongs to the
Novatek NT35510-based panel family.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Use "enum" to have less code changed

Changes in v2:
- Add a dash in front of each "items:"

 .../devicetree/bindings/display/panel/novatek,nt35510.yaml    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
index bc92928c805b..43afb316e0e9 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
@@ -15,7 +15,9 @@ allOf:
 properties:
   compatible:
     items:
-      - const: hydis,hva40wv1
+      - enum:
+          - hydis,hva40wv1
+          - frida,frd400b25025
       - const: novatek,nt35510
     description: This indicates the panel manufacturer of the panel
       that is in turn using the NT35510 panel driver. The compatible
-- 
2.43.0

