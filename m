Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB6A6B26CE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F70A10E82E;
	Thu,  9 Mar 2023 14:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F07610E816
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:23:14 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id az36so1275034wmb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 06:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371794;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LEWU70w2MhwOSDCiluJ5jAZTA7oYz0fVwDWXSQuba3I=;
 b=Uy9GmSnzmwC8W2IQth4jvzJVz4DF8aIBvb1NDx8cQp1Ve2zLzT8bOKFqLx+YxOjXt1
 cQFx5XrS7WwY8coUggeH8EGv8ydWk88riWIo4r3Gze1NjYXUQhX2jl4Ux5DeEpUZzVph
 +C6VLB+DAcYcxpcJeGEfZcan3vTUk3jw8yUNWr6fhCLz+rGkyOT3f5ecdKbDXbtZT9Gn
 80qpXiLU+aGPdAPwXU8f7VBku4H1EisWk9tJN3ssm1m7VfxpKIpAbZGjOMOX9uWiRtCf
 K3wijJSfKx/SKddo5lieR4EJ+RpsnvVOklyUp3pDR/NS3maet6wEjXWrv4Y1w0zJ+4lz
 c6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678371794;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LEWU70w2MhwOSDCiluJ5jAZTA7oYz0fVwDWXSQuba3I=;
 b=DHidOUdjHAKLelpC/sBzAIE+qb11yYUDa0NKFtG1afBPZglg8NJfyBTFwKNyZB4aot
 YmO2vIQvVPGnhGJ9/3AKtm28h5Agf1Iz2jgEIAU3bJukcdt0tQPXkKdeHNptEPl0Htvt
 FCrrQpk3W2P3NZt+b6VgRa1Y4SF8dfyy6c6hl2bpCbMORiFrTBgH0W5x04alARZrYkpa
 sGg3qdNVWXMgBtBGlZCecgnZoiHfeUsT01x1K8rk6awmHNHX6wCNcu4R3UeximKaKF0H
 gZFLOWskS63AJaLKdTnmMbmSWO3uDKPVE6GMdanV+CFZMmbslFO0MosVzLhILNtC0Q04
 RZeg==
X-Gm-Message-State: AO0yUKUdo1p2cJZAMRf4Zu+ge4l6RjKZGBUH5vbACtgTiV3M7mWoeOu3
 r6khb/3qHMPsy/BhgODj/tYy4A==
X-Google-Smtp-Source: AK7set8PuvmkXWL+wpIKlle+LrJGYew2mgPn5qNgfXuV9WIQ5mVxYy9ir/mXx1rwJ2BDwYo88r9NxQ==
X-Received: by 2002:a05:600c:4e92:b0:3e2:5c3:bcfc with SMTP id
 f18-20020a05600c4e9200b003e205c3bcfcmr20314611wmq.18.1678371794145; 
 Thu, 09 Mar 2023 06:23:14 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:23:13 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:23:04 +0100
Subject: [PATCH 15/21] dt-bindings: soc: mediatek: add display mutex for
 MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-15-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=777; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=u3hjgpLNyq3fO/ZOqA0QoZtYSn63eOyCvnFXS09oJ2o=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+IgHy0ePxrcf/vmepoKgZe4MirijpQmR5gftR
 LJkifzKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURZW8D/
 4sDyGRtvesianVRgQMTi2XL9jhn8BlDK0xSC5oALNwkWT/4J0u0odLvyrWRWjdPnQTkAAaYi3NiEuw
 Iz6JvqNM3uisoI++joMSoeB3Ul834EbIRaQnHdUX/pzl8IHQaQHZYPmMKQwBGlge3cVI9Kbdw1ulHL
 PDW8JHzkAZo6D5vbki5sMTe14J+m1by+SQcPAc+Er0xkZZIN53bI7/bOSqJf9fzVfOxWTx+CsZLUgo
 zFgSLg7XBf64OSETjMBXvB7QIvWSU8UveRGIvHzbCFxDr1/Ps7WbrPfvClqmIxOgymXaFnhKN1Vinw
 GHOQgWF+IFIL6Ns4RCq7D7nEnRT0Ed829LLoEg19BPVe6fe8Km+cr16QerYBlWAxBgN2nuazTy2+Ig
 E88HbSybqrfiEvOnUtMaTOqofvDZ1JHudxw+MYdgHmiNiRn1Z3P+Iwnr7IrEmoz153kJdJfmmiWMDE
 00fXsXX+cXZ4VXXbTKYdxaNGfSrw/hAH8Ln1iRo3rk6KqYiQwYAXZWysb+1idgQ13oUvWIEfWfDEt+
 35j6SYoPDMR/PEtKR7zokgwtc1GGNY7j+rDv/I5ZFplyHpnaaxEiYOnlIyVxBzIEE4933UTefedLAa
 DpOu5gQX726EX6wBi+MllBBCeg7wiN8gj6weycq9ujj994l6p41Gl9Psbnkw==
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible for the MT8365 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
index ca0ca549257d..931d66893dff 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
@@ -34,6 +34,7 @@ properties:
       - mediatek,mt8186-mdp3-mutex
       - mediatek,mt8192-disp-mutex
       - mediatek,mt8195-disp-mutex
+      - mediatek,mt8365-disp-mutex
 
   reg:
     maxItems: 1

-- 
b4 0.10.1
