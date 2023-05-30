Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A88D27156FE
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 09:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A678C10E358;
	Tue, 30 May 2023 07:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A3310E358
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 07:38:22 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f6094cb2ebso27658595e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 00:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685432301; x=1688024301;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=L8Wj+HDjZSnhs7OQTpUP21VKK/kmLLc0wW1eKOrWb7M=;
 b=suZawle7XyCtmTwc9koewCMnKkWPXacwHsZLDFLFYQc3h8tUK/ExADY4dPmZuPA2hP
 /2Otqa3QJVnMcWdz/ZIrVBE1/wHd1C0FynszMshKwVb1eP9jz9/Xb3PFlTps1pz6OegW
 bWZiQVQtr4ErEeffk3KKdTOHQ7e+94+iSX2WzbaDAfQ5VVBgJDbfVmTLapSwfYTppFhv
 oAfHRp68hwGYopDlGIkVcrZtNJJ+XlO/U1dRpOms/isnM0jfs0bVrwFRA7RfGWK6FxXb
 452cNwWfHaqWUuoApq2gUPLFUKPJgmmbeOUh8DKRQn+XyYPKAY4xT/Lpw+Q2vBggAQj7
 KfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685432301; x=1688024301;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L8Wj+HDjZSnhs7OQTpUP21VKK/kmLLc0wW1eKOrWb7M=;
 b=XN3mWyt+muLIRkeKGcn8fujsvC8oKyiDkzHW+uwUA1NHsc1gSoKoltk66w9C6YZp4Y
 MlZjnztxYEphhzOqTtuAIoA+GSDMrFbxa6N7Ldu3cfWX3zg1I7zjxT35C1JpZN8UEtH0
 nU92NEzrwmJ4SHtDJq391nlYRvvwRYaEuz3FeSdVkhu4iz85I49wzII2HiietBjSPoSp
 oVBrXU6yp1R3aYJxgZTllTo6bzs+79AqsDCUwMYpX7G+hDNZwl0Us5vCIm7VH0fdX3LE
 v4JzJbPfmSyu7x/oGIh8dosyggdPGHIV6pQYzZzDVAbnsbH9MI/A+IXo4vyCNQER3fSW
 tidQ==
X-Gm-Message-State: AC+VfDwJB9obQNIrBxh4nw3qfrPJLLpSdSDopjEeNTPNBeWM/3EJW0Br
 QUj6GT8Z5ZVqm68p3ObtlKjjiw==
X-Google-Smtp-Source: ACHHUZ4MbWC2LdJcXlvseLKtinFpCmjk45kQkUC4gyJQ6tXM3sCovJx5aDRdYpZlfNDPK2Ol6Xs8Wg==
X-Received: by 2002:a5d:4003:0:b0:30a:f02a:b84d with SMTP id
 n3-20020a5d4003000000b0030af02ab84dmr898742wrp.13.1685432301659; 
 Tue, 30 May 2023 00:38:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a5d4a04000000b003079c402762sm2312013wrq.19.2023.05.30.00.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 00:38:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 30 May 2023 09:38:08 +0200
Subject: [PATCH v5 07/17] dt-bindings: display: meson-vpu: add third DPI
 output port
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-7-56eb7a4d5b8e@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ngaRaj/ff6scDRZWhYNPrhhh/3jRLEZndlPLfgP8m5M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkdafgrQ+d6kVlnqgthYceWHgXDRj4X3G8yCwWhqxC
 zPMd+56JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHWn4AAKCRB33NvayMhJ0eT3EA
 CaIP+cIiapaagNPLfNF2mzXan492id42Vf+UOmKe5aW23Bk7xsIVga2C3eORTyR87dGU0msoFj0M0o
 PspPAeNAg7DXsMG3N0tpN3pQU9joVnYJobwujt7fMlBo9h2LqkjTlvD1BrWSnOtkn92Amoj9lROpbd
 296eS7FzQBOybBtYOICBCbI5Me8Epuh84+WZy9pqHaj44YiDeH9U4UsdteRPYutqED/1oGKZ0z6Eet
 Y6VNtS14EwxYbcB/hIoF07ReQFwqaSkuJOZFVVCVmABEfKsP7Civ8Kr5jWI70sI6eq9Uqn+aOEqUDT
 z2nnSHtmrzR6pIp1cWb9YbDB6YXQ1HUTx/PyXxp+M4Lj9Gw3laPdn0qRQ785bQSUSqFZgTXge26B0q
 xZVu4MnknfHXLTdZ1v2tPtErmaTrvGa9G0vadKqvqHbD0oqrSGHIlsg6zkw3c0GC8lzaFKdO6ZQ68D
 fm3GGGGjDrUvhgOdaMo4clJxq0mhDdRadCdwdWAJm1KikDaVwKShkRU87r5uu/kXur/uyQD/B5JLtU
 JGE2aZD4cvNjIywneK6eobQpnxStvcZs6mI3WOUwjNtYFqXnNKefvE9oP4lxjqMak0Mux0gf8vXtRL
 xJgFplqz2XADbImv2izEtL/ZAHgG1BZhNGjXQCZT1aImRaz9rH3OUOnzwSrg==
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
 linux-amlogic@lists.infradead.org, "Lukas F. Hartmann" <lukas@mntre.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

