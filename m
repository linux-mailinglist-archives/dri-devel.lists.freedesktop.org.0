Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2980E7E660B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 10:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F56210E1F0;
	Thu,  9 Nov 2023 09:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5616510E1EC
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 09:00:21 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-507adc3381cso754434e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 01:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699520419; x=1700125219; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=szbyE8B5HmerWTS9QCGM8GNA9TtBAZ10zn0t2kxJOBs=;
 b=FFlEmHsYk5GQ/XwnrCpWzu6fqvuJOJ1loW1P9haq87vxrSpZIXUD2KNoqdwEQnX7n/
 z19RrItUstTbhpOmSEuDOUrH15ANARoUZz5e0Ox294A+m2W9kGHdQqqdQo0UcBfyUqO0
 8c2dnYybvL53N77kXBK90JFDvylWlgHIyFPQZgYSsn4Oi7GY/TcWAropjOvMqNqCB8Dk
 uQh+bVV8TH/JJMMf6q2F+0dSlhr2mN/9Nq8JokBNljTZ/+dxUwXGvLzUJcS3wBCku0FI
 QCk7CrZqAm3eomJiuKIlr1OrryHKTAE9pcW12M9Qz7wNAPbUmS+Mr1UChJEvFy2tZqjn
 CB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699520419; x=1700125219;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=szbyE8B5HmerWTS9QCGM8GNA9TtBAZ10zn0t2kxJOBs=;
 b=W/RTQlXXhwsSORTwpFzzOjzKWXiQ050mjoBc588ivjMIbAqh5/AdNBjIsXS57qD5Su
 aPjwCHinFqIPythR7hWYgAuRksVwpvSa59nvZoaLwx9FCSoDZ7eXCrrXBcfy54w/J13j
 11NTm1sgqDQWolyBOz9Ch2qxw02JpavfYmoC5/zaEkk36g77myWdTktN2kAvSgSe4Vg+
 V4aF/YwVp6CQQqwVB2s2xa+ho2fsjeBcVJMhLXZblxpvgoUBQNWp8EM9pXoe7dh7Kv1n
 mIqz4zsdvaiv7u+vHzCTEXtAINl2OsAPctxdLBbJJ2yiQRr7IERslIJG8XnvsNCZVPBK
 3AzQ==
X-Gm-Message-State: AOJu0YxmnimsP6qdlR9kRERMcF3m0lZxzfCw2Eyr55dN+EszlpPr4HM7
 dNvnNCvj3nLww39d8NV3zCxD1g==
X-Google-Smtp-Source: AGHT+IHS6tUZm8jOoxmt7gLhfCx4bKpuATMzr2y/aX20jzVc0HP5QxgoQ9hMcisEW+40E1hCOQ92oA==
X-Received: by 2002:ac2:46e9:0:b0:503:3890:ca3a with SMTP id
 q9-20020ac246e9000000b005033890ca3amr700600lfo.66.1699520419352; 
 Thu, 09 Nov 2023 01:00:19 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 01:00:18 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:06 +0100
Subject: [PATCH v8 05/12] dt-bindings: arm: amlogic: Document the MNT
 Reform 2 CM4 adapter with a BPI-CM4 Module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-5-81e4aeeda193@linaro.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=886;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=dsHeljQP++qeke1zASpQ3YPnuH6eGTAu4r6z8mvmrbM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+XRZWlbUe5Rri8/LQk6vQMDR/N4E1+/QArPJOQ
 hDPKMSqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyflwAKCRB33NvayMhJ0fZ6EA
 DKGXANe+GiL0Hty6vwML+EcHg/3t3bvOMWaCVnFG9FBVAF5J/3hzgAZUrtexB3iTxBxv1Wi/MMuZCd
 D0EIB7HroUpPGzid5eOt7jARPicDb6OkZO1vTf54GNfi4tzMGkGWWX9Nox2SzRokE+qZ6JQfcjcw3n
 xPIZMCZaczLGIhSpD0J4IDfGJ2B7txsxkeomBs26wTTz1NLegZ2YuDmQ4Zds9gF+5Ar7nhPEcGZqbI
 Ouub7B4/p/D3K5HYHXPNCFhFLddpfXPAqXp9NW6nzeDBBa6nJSqv7i/CJ4s2FqP85+jTcOnzmDWb4L
 X/A+WhvP8g9+SwI358niGHButCjVqyipLvgPR+2hYipGZIcIeNWivGBu3GgeX5moi/X6ISMsq+h0yk
 QJD2QkrquMFAEGWvdfKK3kcR/ifPtXpes1OPYSEv7I2catEfNaTS89Xnlz65mLGSOdkQm7kHDZqS5D
 Q0tYEdEUeYJNcfe7XfKMhSErO0ChRdkDiRWpDIxuIabO/o4ogXHF/ltLdpvJurBs0LvcMSr5cwwKk+
 Pz8nffeKLBAW+eq0HOmCYE2o8B0kYQDiSZvOQRHAE1nyEiOXVTvS0OxF1i0EVs4x0PcZMAxmN/yva8
 ny3mxnhepxPQesscosm346kOJPir48KLdIfA1jU8pEb2Tk+xgcoVaAXBT0Tw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MNT Reform 2 CM4 adapter can be populated with any Raspberry Pi CM4
compatible module such as a BPI-CM4 Module, document that.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index caab7ceeda45..2154a4614fda 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -164,6 +164,7 @@ properties:
         items:
           - enum:
               - bananapi,bpi-cm4io
+              - mntre,reform2-cm4
           - const: bananapi,bpi-cm4
           - const: amlogic,a311d
           - const: amlogic,g12b

-- 
2.34.1

