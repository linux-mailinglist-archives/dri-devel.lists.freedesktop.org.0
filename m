Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C02676E7C1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 14:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B1210E602;
	Thu,  3 Aug 2023 12:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C7F10E5FD
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 12:04:16 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fbc59de0e2so8643805e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 05:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691064255; x=1691669055;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pzxyWkiN1A69x0DIwd458bfxdRtDYOqwDKDZ4Z/ZEik=;
 b=v16lEH/jrSpOks7R1vH12BlvA51meCVBbQ6yubayT4UdQZKd5qJThGLx+Dtj1b/g7k
 CRPnNn/ttasF3lRd1ubsbk7fh/E8Wt1MuBzBq2Le1gtOORpki7VvHbvP8eU3BN63oK5h
 z4oSHkKGZo/4Rn8S8Ghz/qEtWpcdhWT4A8ubOtzvLK8lHFFQv2oUYY4wwQ5I11r1rqVC
 YDAiT6gGie0eXJlNh4oXk1sL+xgCxgF23ZKM+yLOzC7mj5bYLb9QmUqPyyGCQHlAko6E
 CxNfn+Cghj2t0lHA98lV57BE5ArS+4mLD6nJj/2gRzPvB6rtADYNrOJZLWcXjoCx7ZuF
 6Lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691064255; x=1691669055;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pzxyWkiN1A69x0DIwd458bfxdRtDYOqwDKDZ4Z/ZEik=;
 b=FVvrqy9Da9huQzaaWVZ+l2YZ4nN8QffU3mZi7akNcnKleBQne6VyDubmjYoYlxZieJ
 5wTkRDmoBDKmdXm1pPFrKrny21HD6+fBLJoNGFwNLfJ6p5ZX+vzCtDygBZ+a9AxwVYlR
 btYTp5RKcsSPAGsOkI5lOdziQNhwECO/JWjbtAlwrloO2oQS2a8G8fv3v36dXoQaPbM/
 gfXCEySkjzRwrPLCUzEcUWa346UpCyq64ripiftjqD2kgBVrVnRAC08Bf0eR/7yNACWn
 OjUrart7sPR2PkVS2w7hrranrJju2CStNKywoiAQZyvWHRwIesivm3qK17c5Y1O50BcK
 0t1Q==
X-Gm-Message-State: ABy/qLYo3xhfEJK44hMmk8eiuHMuvSujiptMwhTC1Hl08d9lZ4EIgbj4
 h66joi9gXUV97WPoKQFHZpBNiQ==
X-Google-Smtp-Source: APBJJlEeHVbwq4BgHjFhfmZLB/eOSONBSfWKyIIiRns+KyAHIAATyaJhS3mYa8VwHigQDtBgCpFUNg==
X-Received: by 2002:a05:600c:215:b0:3fe:25b3:951d with SMTP id
 21-20020a05600c021500b003fe25b3951dmr6981946wmi.5.1691064254853; 
 Thu, 03 Aug 2023 05:04:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a056000114a00b00317046f21f9sm21487465wrx.114.2023.08.03.05.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 05:04:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 03 Aug 2023 14:04:02 +0200
Subject: [PATCH v7 8/9] dt-bindings: arm: amlogic: Document the MNT Reform
 2 CM4 adapter with a BPI-CM4 Module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-8-762219fc5b28@linaro.org>
References: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
In-Reply-To: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
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
 bh=YvY9e2v6HU2ew76GiDtsEE6jJoqLheVM9jPCKZACTKA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBky5eyAEtKjhQQaThvEQUtQybzgmuUa8kSA9QIhAf/
 0jQNBASJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZMuXsgAKCRB33NvayMhJ0VXpD/
 kBE1z7wxuGCqFxbECgLt8gaolDh8tIO3VpAvvqGF0MM+dsFXnnBhM3VKCKWaj3bezqN9juoXGRE50c
 XHRkosI3uH6geWA79diuFuGjacrXswIDFyscAD80f+gFQkrrKakBCwXMC0FbEX38UPMYd15AZ6vaqo
 atKyND7i+CLsBlzGT2Cf1ttbW1h2j3wxyTSUGQC2ZdMaKFtFjcrd/NgiySODOqRHY/OUjIW7egPQFG
 SDdaBodZgwkRAZOb6lTbk5jzJI6/1XPG2DSw2Mzo0Hq2GghtR6INmBQrYHerzyYDikcMs9cXdlwpOP
 4u/S1gonB3ilX7EpMz7Tb3f0qa5uAac2NVxLqQ672xq4DymdbWXhsbgk24j2fh1/SgbV6fPLYSzLe/
 c3fxU0CzUlRWfGdvFidtoSEvKa32QMi79RIostOvMt6ea620cRsS3dyWpSf+GlpdSE1HSjl2rI5mqG
 x24JKPJZxwOZllHodsZ1/nGoDOkmAG3kzw/sgwSsbAbzP9wq+dMhAOcWJQsMvkaGuv0iNdlYaJG3gs
 E4JEg8AO9HyFmP7d6wZOALQ9m1tqw/s2lln8nWZX5rcu8blTa2AqsjHs6B1V8hW75rW+f1cXJKs0vV
 YarFxYup5en+aYayRFHx7FO4tmjmnPK1rywsvEx6lfPD/zcG4+7KEP+zEL4w==
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

