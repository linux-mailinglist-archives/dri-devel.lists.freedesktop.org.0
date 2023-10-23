Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8757D39C9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 16:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEE010E206;
	Mon, 23 Oct 2023 14:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB3910E1F0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 14:40:27 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-66d17fd450aso36981746d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072026; x=1698676826;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=f2d8tTfPryf4AKFcvtoM/0h2MGK4CVeevmA8lDq1t/g=;
 b=ppSsQmAE6FnwZZdQ2MmVirHEQzSJFRZW6YP1kanDAWX99JLQnRKKxJkkC+usXIiZC0
 Cu9nJUOtBP7Hy/aMXVAKA/0stTPRfLWfTUdtf4l9BbCFympCkax7+16PgGoELaT2MZmA
 JFtgMvnBgSBytI8si1HgB0xMPyZeIFMfPjP+XF3y7pflnjJWDJg8UQjD3gJZWy+pjCfA
 E9yY8MiSXzKb/GBVXJnPPdnes9qtZs9vYSviwCUwwRw6WaVp+wVJhOcAYQlI9FeQ1oNP
 zGK8x413spn747VZ4u3JfHDH6xzf5Kdso6MWrPY7oVUGcl+rs8b3bqrXo27wQ6rZ4f25
 idzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698072026; x=1698676826;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f2d8tTfPryf4AKFcvtoM/0h2MGK4CVeevmA8lDq1t/g=;
 b=mRHnqWnNs33fYjxCrJAy7X/bkIz+F+DajHJC1Jy/de8IW0m5Fe1AnmriLmVlnhaI+C
 9Tkid4QUFTIG3pAp8pComJmIXs/cBDTYVz2wwDuTKx2mmTGF4Aqqd3A+P+YOsvQHn5da
 gCyMJks0FMTQD47Eqprv73LM7sNI1jPPD2x36E3kSgB1tzmwkqH3NlSWKxBMXLsGUoWo
 HI2Q+4jNyL6VuGLJUUW8j5cMmc7oA7z9NgjQFHzChzm6eWSRJp57bdbaPjlU+VcLrCc/
 2iKW86Psubn17ay9Ww9IBT8/RtCaycEtVwrGzzx2xhmnxiPvG0AYlwxDZbVFkYqzzIBu
 hfdQ==
X-Gm-Message-State: AOJu0YzfOKLISniJgzK6tqesSUhV3lxILNDtnn7dLzqLccfHwloknLvf
 XqcRLzMOZWl3a9vHhinRgoldmw==
X-Google-Smtp-Source: AGHT+IHYknGzIGWpZ0MnxMFj1HRLj9OGQkiXiBAhAeZ95cF7ut0X8xJi+rv2oEbieuv/EeZZSuR9Bw==
X-Received: by 2002:ad4:4d43:0:b0:656:500e:7b64 with SMTP id
 m3-20020ad44d43000000b00656500e7b64mr16687358qvm.16.1698072025639; 
 Mon, 23 Oct 2023 07:40:25 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 07:40:25 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Oct 2023 16:40:02 +0200
Subject: [PATCH 02/18] dt-bindings: display: mediatek: ccorr: add binding
 for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-2-5c860ed5c33b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=994; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=JeNqW+WVxqqJtX+9p7tMLNbwoCk4n1DQyFj303zeDpE=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXOHe+hbAHJDiOZ+OVrpp+ogl+pb7Lr4y+qX804
 OlABC7GJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzgAKCRArRkmdfjHURc2gEA
 DFJ7bqOoha+846mBbXiyiSz8SjEv8vWq1uEyYeVmfWi3sxNfPvY88KKVK7KzsjG1iTOx2+0Kxn7leo
 DOIAZgnV2ZNoPSq6euB3iS86wajZsW+Vqe7IUem0PaHmzDl5JptkYOnFzuuIS0ABQ/ngG0ps1lkYtS
 Ku0Coa2KbBAmY6K2/XZ1O6P2AT3AqD5te9dsIbX1F0UJButVt/QxtIy4Iu8OelRfrJJbJUJkt6CJPB
 Xw0YSXE3JTv0zxGTiV+7gKGRSXBmCst2FmRFQnxUanUhBfB0ouROeDsJ+FAOENbfhfiRVn7Xfbfkc4
 HtR/EOX7cSm75MblTuT956tp2Kc6ikETj7dUmuQXOGCrg4NDtSMJZCTvZ29mCRjbtoZAZ4Te9H2m0t
 y7inJcqCfOcr2TO4IFx6TaEF/Ut5PZkYBuVspi005Cf8RyWovpNcA2LwTViTn14qQ09Z9X6MaRqbDc
 7MU5GLr/L+fTsk6gNYWEp027LKetYZpar7qX4imTJJD8a3DDGtW/5DMJN3W1DxzhBAOP/Yzi+kuv0P
 xd2f31lSLvE5rKq4BcX//75+rMyXe1AOrB1iA0StQrLWHNcao0QUVTtFeVzHAPUGBAMOrj/4bfaBCJ
 SPVxVC9f9mMG4h9P0XbJD5KniE3CaSL9W8jimZ23Xjz5kgf1ynbthPIpuZ+g==
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

Display Color Correction for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 8c2a737237f2..9f8366763831 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -24,6 +24,9 @@ properties:
       - enum:
           - mediatek,mt8183-disp-ccorr
           - mediatek,mt8192-disp-ccorr
+      - items:
+          - const: mediatek,mt8365-disp-ccorr
+          - const: mediatek,mt8183-disp-ccorr
       - items:
           - enum:
               - mediatek,mt8186-disp-ccorr

-- 
2.25.1

