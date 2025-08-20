Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F7BB2DEED
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545AF10E752;
	Wed, 20 Aug 2025 14:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KeenNfJ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BCF10E752
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 14:17:50 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-afdf4bb0e5cso11574266b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 07:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755699469; x=1756304269; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DH177aI32fcw+0fi3Kr7cEylMFjtb1+kKdAUsXxCdWo=;
 b=KeenNfJ+JNk6oXUVo24d1eiVkXsD4o/HOdzzJWym2JCr/fdNTpcUmXv4HnexViBAaJ
 LQtRwTX+DabXf7N9r7u7xBj0E+uePYMZ1tBT9wRZHZiDT/kjQwjX8DzewoUP2YAmDuSK
 G6AJw/dP5l4ul1cslwYE+sChwSMedWTlNwf//WPhJQnwJ7IuTlxHZMKIcIfhdh4QazcD
 xHRPZRQbhopoImOEwxNpxec1YEHcFkvHcRGgLeN421F31WoE+974I9bThN+eoIvZqYwK
 04BwMu6nkbPidv6zRsLhq6Nt1ESo7555dY/Y0aWb5rutGM6Qa5m2d1AIftkqfjtybJIg
 rKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755699469; x=1756304269;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DH177aI32fcw+0fi3Kr7cEylMFjtb1+kKdAUsXxCdWo=;
 b=k4e0YYNfL2Nz7kK7Pgm+uJ6WD1K7ILwWurwwwYkZ9crdOjUtrevSz0SlUThS3YUoxU
 rSJFuQrDufTWPNVOVDXnFflvI+ZKO+ilZ007bZYUGm2E6r61b6rRIEQytQuQ2fPyP/Sj
 mnfnivK3xmlYQ0ulqgkn1ldvfKV5QHIN+FKfXh/NfJktxtPuV3206zP2LXeNfauveNI/
 pObhBGx7IK33oEQ/g3TG10FcYecc0aR8czgcqter1xz3xn4PxOoRQ9YWz6U+63sEBYMx
 gLd7uZgJiSPwVEH8aAiy3TOProRbMy03C2o8zLIeAtTr23Gfs7kdLSr8TcrmGU1e9Pw0
 Gh4A==
X-Gm-Message-State: AOJu0YzZkyHsr4+DbcATtQ6f8di0lXWyHxaibQ4IkuL8VOrECZnhlmaa
 Dx9J2dXcSBz/6XShptcByjH7nj2mdCw0zA2/Vgp1M6ldJjPMSa/fNaftZNdmqybtlBA=
X-Gm-Gg: ASbGnctn/T5cj9ynn2My9K1zXgiBXU8MLJ2TsovKGcV74I5e74tAu2Pg2mLLfxrjZbR
 WzZut8h2he98QXydgsv3iDJCq+u19fx2fFd0ulk/JmT12Yb2jQK4m2FyWGFjRT32SMy6MPzCCKc
 UtudKtmv09kL4PwgJrJHjFWrTEvim9BKZAqUMAHeuK6cUWep3h6JLaMQoyJxPw5lni432MPp+tO
 A632frOhwSLfprbibeYn39eNo96t6DX/oyL/ipVa8OjXMvSdh2EOoMU+YrIg3Ynl7+brRK7LZwE
 BKRcKJw+D2sot88GYG5XRfjJFvyx2f5PqkZ1lqfK8hpWhuTMP4jDrVQ8RAQf8V6/gdqJR5CyOqU
 d+9a6ETVaSSkrelY1LHiQvKNp9H016iTwczZq1gU=
X-Google-Smtp-Source: AGHT+IE1NDxPIblZHLyHWsai/l+RkUVe1BeuAZ+Wx+dsahTLJmxSzRi7+QTtrjLlctknkk8S6nYJVA==
X-Received: by 2002:a17:907:3dac:b0:af9:a9ea:f42f with SMTP id
 a640c23a62f3a-afdf020be3bmr125823966b.9.1755699468735; 
 Wed, 20 Aug 2025 07:17:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded4796f3sm186541066b.61.2025.08.20.07.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 07:17:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 20 Aug 2025 16:17:36 +0200
Subject: [PATCH v2 1/3] dt-bindings: display: ingenic,jz4780-hdmi: Add
 missing clock-names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-dt-bindings-display-v2-1-91e2ccba3d4e@linaro.org>
References: <20250820-dt-bindings-display-v2-0-91e2ccba3d4e@linaro.org>
In-Reply-To: <20250820-dt-bindings-display-v2-0-91e2ccba3d4e@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "H. Nikolaus Schaller" <hns@goldelico.com>, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=999;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Pxy1ceX/K708ATMRkgiCl/qGBMScopnigW8cLcERjdY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopdkGYy7rVicbfewwuVfkX00qnzDh4itZ/TN8Z
 KwT51inn6+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKXZBgAKCRDBN2bmhouD
 14mYD/9h0PiQE9dy5vwP7vBJ76dItA2byuWw27+5o/ZLt40o5X+7eBO/du6Z1luxBiHrjoaJJ6S
 7mJN66kdDvO8897oK9TTcu3tnulzNRtpPDWhgxc7Z5Tzh5Gmx6GejO4Kp8aZ5ytT6WXfliE0+UU
 CgRDbNXfZQT/zIfB6J6mOUN1RYjKa2OflnN+xrE3eTjZW2leo0IOKYKQRhLJ8OnXbIaoWY6q6Iu
 tUk0woil75PeoPrWdZSUHViAmDvB8BNDpo6ay7k/Ek3AqTerB/Y9hXiDjGACQMt8YhzCXKbWPyf
 GR9V53exquBI5VWe06gYpDvK8iPPUcuBzyxykT9iKC5h1ycyfD1AsZccdu8Mpe9J6sSG6fd/uSW
 +XoKrVNJynBpfz6eSvjzyW0zaMZlcYrUYc/b8WHOetPwkwxR62UHlf5gVVwzY8rQYm+I59tXkYZ
 ExzC6ZIo/BCMfd/tCel3Vpnj9zG/Uou/x7kOJVcQ2yxWHwwF/ZCufw4+bfF7WDwF9eSETLHwDtu
 Bz+aSxFJ9CXpRQE+NK1yzUsKZ/HemJ8xcjrT2HmXT5thnOxp1aVBHaXEHLsmdnBq8OapPAm5VF+
 bvyxXAJaOMyqKHirUtqCjvtneBDKwVP2elp9F2Ste5sVY3UewOrHlc1ygbZNOPcwtmfMma2KKsM
 PQjztLAysb275rw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

The binding references synopsys,dw-hdmi.yaml schema which defines both
'clocks' and 'clock-names' with variable length, therefore we need here
also same constraint for 'clock-names' as for 'clocks'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
index 0b27df429bdce0b7e080ab291ee0c4c6b51f8e1f..84df3cf239d5bedf8a5806bb48507fea207c7167 100644
--- a/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
@@ -26,6 +26,9 @@ properties:
   clocks:
     maxItems: 2
 
+  clock-names:
+    maxItems: 2
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 

-- 
2.48.1

