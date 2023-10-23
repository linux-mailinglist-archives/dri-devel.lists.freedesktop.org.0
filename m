Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A45407D39A5
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 16:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B82F10E1F4;
	Mon, 23 Oct 2023 14:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A75C10E090
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 14:40:23 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-778af1b5b1eso202292485a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072022; x=1698676822;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=k7PS6ahcPaPVgkaLyfG2/5fLxZhHFw2R9jMfOoRovw4=;
 b=ySbXQ0UJJCSZIcXlU/EnmAohQdmvOCPY36M4TndvkRP9fYSi9vRukZ++CsbzfVOPCs
 dKAHYuRagwckeyd4NIDzPlY/rooqetnVjX2aV24TMZGHF/SikY9KxqhZCRqkBoWS/BwD
 hyJz/9QrM/nddsJMNHkW919nnzcOaeZfG3Kp8pEr7G6nIlE+CXUTbD9J+6/5PzPK7BnF
 vVV8Duzc8rHWacWWehbeI1VkanaGG8IcwCPYK93MsUNz8vaSlrv7z2Svz3OMYhWyg1jm
 Z6GBFiFU6nDWCMJRyBZGHJHgzNyonAnGfE3i6ViiT3sUJ68fpVrEh3ptvVuNZzKwUIPi
 imOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698072022; x=1698676822;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k7PS6ahcPaPVgkaLyfG2/5fLxZhHFw2R9jMfOoRovw4=;
 b=fcTxSiSckwo05qxGOG0V984HqPMTtFyM9Lyc3OAOQ1gBcF1mwNWGa6gwY6vcI9EQyU
 iHh7WluxcVZmKjIGSCndxUKT8v/Rv53XwuIqxInU8Y6/e156x1XsrErAFqpnR3XQnQOe
 53tNDBca/nIAODy4Y/dZYF6e2Xgfdf/KmaWenbhAt5rx1pLwqMgsBxDOLQEuk/t3qUnt
 LVxVwum+hz/Vwhm5/Z5iFT96VljJMmxyJ0r0jKFwYekPF3HkVbh/45y5plJnvdLy8ZxL
 HJn467uyJl/qu24wsj/xjB/jHYnaqet8xLtnKAO2Jk5AaS5/doD+CAU6IuM11BhnfXgy
 iUgA==
X-Gm-Message-State: AOJu0Yxl1Cg+wenpFYXaYIz8rnDbkg77kwWUyTbzI56MKX7+eN77ztnN
 /Dq0xQJ0zqznaH7/mW63eu41sA==
X-Google-Smtp-Source: AGHT+IH0nODYbrvEMwbGxVa26dTGc2msGtTG34VMr3BZQ5GiO1cLSJzBEsMmNuRzIEAMQXxLVf8RPA==
X-Received: by 2002:a05:620a:2451:b0:779:d1a6:ee76 with SMTP id
 h17-20020a05620a245100b00779d1a6ee76mr5162073qkn.37.1698072022214; 
 Mon, 23 Oct 2023 07:40:22 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 07:40:21 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Oct 2023 16:40:01 +0200
Subject: [PATCH 01/18] dt-bindings: display: mediatek: aal: add binding for
 MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-1-5c860ed5c33b@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=924; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=Ui729mTu13aA0ns8kExm+eoWD4rbfjwSg3rfyfGgZBs=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXOcFzr25uHjdnQfeDxVFE5X5hyS8aufQwwKFCN
 G43v/POJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzgAKCRArRkmdfjHURa3LD/
 99DHn31961gfxqzckKqZvja192V6gfiNXzsC6hHBBZ8geTJi8IPYTSVbFQxhFdyZ+auYgAjFP5m2xq
 BemZnwKfzObqDIyzohgIPuAu9AlAR2rG1N+HlnAtyqdooBQfywPdJds3RDO1TcMU/8HQ67qtPTa3T5
 9vDOBdgqAb3x5IF5ZiWOd/a9M9V3UHmSIoTL4KQBea3kynTtsw7AE7yrjJpgqv/jBfAq5FhDh1B8pm
 vSv35urioNBPCXdjyegst5HBRzIVnUqhK7c5xwnLaZmsJVXlgWdfkLwQrV9KJS6y4nc8/gmqQLOQIc
 MJxYUXah3PdpvkNr+YfECux5xjQztcI3oHxmpqL6hG/PQmrA5xgK8d76w6fLbXy9T+3N3PjLU+6l/n
 dubODhA5S/1uBw15CbmV/WsA6UKYerpl5W5kkIgSWAgz2KFxcb4AnOBdfwXN1SAri5BMeSz3wGzL/W
 j5teR7NaRxFwczR+3MYebDqu+7sWbcxmAECe+JpDB9QyNhme2SgQ93rYOx3hyMrR97nVPOhDvGmMIh
 gxB8/5AXXSSeqR9YIuNZfCvNq9R3FLFNQ5rAt4WLIexZnWX+vUxROE0pqg6FbrswpRTzcpJYsYOPfO
 nh5gp7N0SCNp1bdgVDKrQHGD+5Dsm8j3ZoiQnMgoOhNBa1lxOGzoY36JBAPg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Display Adaptive Ambient Light for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 7fd42c8fdc32..840b48a878ca 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -35,6 +35,7 @@ properties:
               - mediatek,mt8188-disp-aal
               - mediatek,mt8192-disp-aal
               - mediatek,mt8195-disp-aal
+              - mediatek,mt8365-disp-aal
           - const: mediatek,mt8183-disp-aal
 
   reg:

-- 
2.25.1

