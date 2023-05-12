Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A7A7008B7
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 15:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F9A10E6A1;
	Fri, 12 May 2023 13:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6E710E69D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 13:12:00 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f4ad71b00eso20897605e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 06:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683897118; x=1686489118;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=L8Wj+HDjZSnhs7OQTpUP21VKK/kmLLc0wW1eKOrWb7M=;
 b=UVCtYsypN67W5itTExzTednHd0K+yG+KL4EpyNFwnGdPdIvNUsOSxp7lcnYZG/7Ey2
 v7oMZugKSY4pohBQmPy4eDZ7SDAvHSx2mWzXWRUmNorKmZ2OP8sNYcorwTl5BguMnOVI
 eoaPpYswy51MjtCRPSBMbG4MnpDAjnJazw6cKKroZbMosEvudzDD1fg2VttBx1HCD0cX
 j3cVCxKuASiYy+9eusgcIJLNYMF0LOSWO7+WChTnItgB45fXDHuzXC+0uhtVL7kDEqEN
 IUQt4XV8EchJME2glik6NgOWTiVbazRCAvEf3FmaH+D0jyfN++T3/jMxa21GHVrJWxAo
 nHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683897118; x=1686489118;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L8Wj+HDjZSnhs7OQTpUP21VKK/kmLLc0wW1eKOrWb7M=;
 b=eh1YN+Fe2xXQnKyAYHWmOZXhp2zyv4PmnjI5b880GtJcOj9U3k+PIztULgnrXEZJmo
 4av53P+/LJbHdoh/y99hpMulG+bHNVQg70MhOO28uzLvCDrp4uJ63lcHmtYlrRQQ4Xpj
 yj6bDUvHQx1ug6hf2byHHXW+utk1DSOhjSq3dEl4t+KlehEXanv168RK6vJyaa3l544q
 403LJkeZzPH3V9lxXMp7YpyUDCgy9sEuE4Ow5qwAOvcqto4tKoravc/jtoyA9Zy2vCee
 8nXFjKbiNTyMDwPFU+alS6nOdnAEG9glTvrEFpPfmRzRPOl5+746gI4BN/jTAibuYIb3
 ySSA==
X-Gm-Message-State: AC+VfDyDj7odhyemBwzNoEXZ4UfRzdVkb5l1vbzPBCoJgckcntyMs0/h
 2Syh5MutsTVScZXAx/0+aXGdKRK3DbBOqCJeO+KEEg==
X-Google-Smtp-Source: ACHHUZ7IzdPm61Rr2uFsr715Ac526tlT5Hv0vb6s2t7X9303MA77SS0I44BQBpcPw2M5AeT9ip2IFw==
X-Received: by 2002:adf:e84e:0:b0:306:35fa:202b with SMTP id
 d14-20020adfe84e000000b0030635fa202bmr16023907wrn.6.1683897118717; 
 Fri, 12 May 2023 06:11:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a5d610a000000b0030647449730sm23461965wrt.74.2023.05.12.06.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 06:11:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 12 May 2023 15:11:36 +0200
Subject: [PATCH v4 05/13] dt-bindings: display: meson-vpu: add third DPI
 output port
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-5-2592c29ea263@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ngaRaj/ff6scDRZWhYNPrhhh/3jRLEZndlPLfgP8m5M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkXjsTubNQpwmz5c/oK2m/saPsEBPvZXH2UV0wcY7w
 qdfTDvqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZF47EwAKCRB33NvayMhJ0boiEA
 ChDW4mIkGle2SE4bBMV+Zdy6APbp4Iah8IZf//W3pW5aOoJ/7v0VbGd2wOH9OSw2WpezBbdZjXEDfU
 4J9ocYwS6ZG5EtfIZifV5aW9EbmwrUhs9Qep++6/B5NrJtj1YqTcP8ml+CiUSHNZWtEyxIm+ygAzDP
 MmIyVX0ZPeasfzNcQTaj7EFrY9VxytAtkj5p8MxP6jNWcc7XPz3iw3dU5aK4Ixlctrwl55QPG3B63m
 8gY0qnLyr3jpQSR5zPMKuZ/4hppbnl7RwAZrQyFKxnBulrR1Y0GmVFFHh1RxD84cWuZG/D6fq2ZIG8
 rOKj/wWjE/AGcKSEIZiuvww0d+Ndp1Z3rKiOZiaLTDpsncFqWbTuw4LBUpzZfv7KJCedXkYDI3/fwe
 qd9/8Dk6n+6Z+8/sfvHIgIECRqpAtsOAPVLe+vJa4Nq0cmjmBXAx1dJONcuBRFNB1l+8sNDS8A5BJy
 IMeYC9r7/DPdijCDEr0HposrbxEQdWK3+MqTkB+eXE5QNX8Y/xpGYFIzDY03ZrVPHm58y02VYj+4Lm
 AwduefS4VNvdEx2qsygT5jBVt4YCWJpIy2P9VpXd9z2KbU+45RFPLA0naqcsXZi3RxPEBJg6vQX6j8
 6jWpuSH0Ss9dqkCnXktP5QCzzrxwM3+LIE0L1rWMD+Mp0GtPXsAevIDtt5Kw==
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
 Nicolas Belin <nbelin@baylibre.com>, linux-phy@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add third port corresponding to the ENCL DPI encoder used to connect
to DSI or LVDS transceivers.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
index 0c72120acc4f..cb0a90f02321 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
@@ -96,6 +96,11 @@ properties:
     description:
       A port node pointing to the HDMI-TX port node.
 
+  port@2:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node pointing to the DPI port node (e.g. DSI or LVDS transceiver).
+
   "#address-cells":
     const: 1
 

-- 
2.34.1

