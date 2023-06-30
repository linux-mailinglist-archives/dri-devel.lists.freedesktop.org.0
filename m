Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 060D8743FCF
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 18:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C9310E4C1;
	Fri, 30 Jun 2023 16:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B6210E4BA
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 16:29:30 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3141140f51bso2429952f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 09:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688142568; x=1690734568;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DzGw3mnXKJmEBxB/ZGH2LxB1IwHqbuKVGACW14o5hFY=;
 b=uH9tw5y+VJ0y+4kgZdqchDXhttOF1TOMBKbn5v348YsV9NtptKzIei9IjxJhTPVWp7
 cEXGg2GjrsoTMRiRq6Ls0JtuNRL++8L9Y1Fus7NWO/K8fVXW1o9f7YatyZhrxAwIou86
 MomcuZeGCm8p1q4GXhaEFecrlib7/gBk4R/mSAQKWrdqCfg3k9O5+Kq88P6lw/ykLeXH
 xBqjX0RgvVwDIs+YMogRHDiFoHulwscWox08w2rE8tA0ZjLQNVnC4Apk+ZIu4waa2ZN/
 ZZAyERVfqe8PdKAjqnulxKhcaxdZeOMT5tk9+Op86IQxS326Djvpj93x8xqyv1hhBvV2
 iGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688142568; x=1690734568;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DzGw3mnXKJmEBxB/ZGH2LxB1IwHqbuKVGACW14o5hFY=;
 b=UdsnFbHIjFa3VK9QQo24fnw5+jkpBp+WMrSQubb2ySvZdesT+eMgFgnUkeLvBvceUb
 9CcIEIbqhaIBEku8+weZdbdyrGVLTRLpe5CCWhbOTqdFeDkS9pioajODEMVplBEY8MdR
 gHuBifVt+MFveP65kz9LM17uAW/VZGwS2l4c/AGqL5Otbi0li4cWDPDLaW9aV7vq8cNN
 AWiYefBjPw2Pbb5SFB5Vv7usgHnf0EQtgN2SO0XTfst4rGqWq8a4x65Nd/uhDBBSfXCd
 Lh5w7ATgmr+oRqsKIwR8c8yqDhX+4WX3FX5Krc9Sz9+sSEfrbV9Z9CrKJHncKkqtX3lK
 YiXQ==
X-Gm-Message-State: ABy/qLbX20K9ptFew+SQcHkqaqz9YVSpIxyNFfqPjZ3Qqm2LF6nZJiFy
 x9mP/2G5uBKAS3AKIYJbZlKLJg==
X-Google-Smtp-Source: APBJJlHOw0fHEM8OxVmEe2OQCY4Q0OvnByA6qIxCaA9DEaSsG1TfMf8YEAfqqIa2lQOZIxuTXmGPIg==
X-Received: by 2002:a5d:4e84:0:b0:313:e2c4:7bd1 with SMTP id
 e4-20020a5d4e84000000b00313e2c47bd1mr2558602wru.42.1688142568645; 
 Fri, 30 Jun 2023 09:29:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 cx16-20020a056000093000b00301a351a8d6sm18835836wrb.84.2023.06.30.09.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 09:29:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:29:15 +0200
Subject: [PATCH v6 8/9] dt-bindings: arm: amlogic: Document the MNT Reform
 2 CM4 adapter with a BPI-CM4 Module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-8-fd2ac9845472@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=833;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=fIWufPqpiAaBMP19Qwx5MHQ5YAp+jh4vCf4MBkZNrjM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwLdpv72EK7bfEvAqIU+IC8nzuU1qCNC/cegjEsU
 zALrbveJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8C3QAKCRB33NvayMhJ0fMrD/
 0TG+O3dy9ys2nlKYIHma1c7yIUAyJQPUGwWlrn5+pEWfoy2pUdZ1o7+vBnXqIZtpF4W8HtuIC9rjQp
 p/0QTVKCOD9uF+QWNe0bGB2vbkOa+kWyPcXsTbnPWDZElztpWriVQ+vUuWhG3sWh5FSCjmVXhwmPCJ
 IPuJX38jaWtRDDiwnq6ABoSLtJ+ivowRg0JrUnSefAMbtH8A5LlwViQAQYwlBhw27zIpgR7fa90kpa
 35IOR5uwkQMDV8renPkAfL17Bz9J+OmM6/BlQ5il3He0Rem6bAYPvEygh1P21nh6w59uwJ7kZqhNSK
 cw/TJi61tc8rL49oozt1cg+mhHOKyrSGsFWKdcgkEpH5VzO5/21rCLDKDFf0Yrh5gMiTlNCuIZp4+4
 64JGt29RIa9C1Px6T6p5LyusoXAcy91n3mTU7n1+ohTPlsyCpDcxEOvQs2zpWVPXbUR8eimau+ApeJ
 DfNMNgu8XNzX5laR/Y4SaIHJLOcJz32T0N2ZagKa5kw1iXVb1BVRmCV+z9fcN78I2WM5U/l8mB1/99
 CKA3Ud6t5ONotbCGtfQip2Gf0nwZziNIO3NPltqk5Y0bMPShc8IdKma9Ote09gMEtKbtTq2zUbmZ+Q
 g12ZIdslv7ox1JHa+zyjNJ0KPExWhftTHGd5ti9DQanOe9sStcj7p+yPRm9A==
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
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MNT Reform 2 CM4 adapter can be populated with any Raspberry Pi CM4
compatible module such as a BPI-CM4 Module, document that.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 08d59842655c..c237afef5093 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -163,6 +163,7 @@ properties:
         items:
           - enum:
               - bananapi,bpi-cm4io
+              - mntre,reform2-cm4
           - const: bananapi,bpi-cm4
           - const: amlogic,a311d
           - const: amlogic,g12b

-- 
2.34.1

