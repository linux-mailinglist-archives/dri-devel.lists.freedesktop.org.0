Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3006ADB63
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 11:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167DC10E3C6;
	Tue,  7 Mar 2023 10:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EA810E3C6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 10:07:25 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so6831522wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 02:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678183643;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a99hADv24Oq3ePO/xWvEGujHuLCx8t+cyBnnFpp72io=;
 b=YSCUIcYocqMFAD+dkwuethgWjxG3R4uzFSWinK5RLr140QsCU9/Oe0rM5ZuaIhjjlZ
 vLkeaHOAcmuKVZ4jiUMD6z4xU/D3k31VgNAqaDG+ftVlNyRfytFVYE88oMwdz55UYkBc
 dPHaWmbI2+Hci/kGAvHYh+JEYcRcAsKBFMw9R3Q6xBp344epu5ycicCpYVNC11FzxRkg
 p+jb84OS2IF1+c1CY4XRBPNlCfoRoKIRoG9g2Km1pCYxgJDzkCVrjTIY1tKh404zn5mH
 mK7095HXFummUmioTMTIU0ZAMdx8D10VtV94aJ4rOQ1hih7MrXGvayUUYd6vLKQXjpgV
 mqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678183643;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a99hADv24Oq3ePO/xWvEGujHuLCx8t+cyBnnFpp72io=;
 b=K/L3uZoKdP2WZu4sXxuseYwH2eU4/LkSmre4pX5SqMk7GLbRDw9K0PltOtkTCgHkvZ
 6BSlDutDcHUOawuQNepg2bdWBD6vX8C2pCjiUpEFTwFqXhabZNyYqthj/a1TZUEIg3Iw
 7oWUzwlRL5AJNIKb0rFv9nm/zVTMkyWlBJcLGiqPlOvrn96l4MUqWqRC2XY1FJqb6Aa5
 0GWOspTKJINnUiHjzHGDqxdbaASPLwkblpFYStFU2mcej0TxOl3mXeEstBjy8MnsbD5S
 VPdXIzA/F0Ez8MfiRGH4vt1PpXjctnIGMye6MgIS5UbeZqp+verOPT3ep20AYRtjd/wR
 z+Rg==
X-Gm-Message-State: AO0yUKUW+IiegTOj9QkKFzTwpi3CkQR9WROV0IMPVw7dm/zGN2Vg60Q1
 RCwC2+5UX86p/kv379ZTWK30ng==
X-Google-Smtp-Source: AK7set9LisboRMIbelSbZwB9/xid+f7oLBqZmrU5e7MBZwglzYbYVjzgLLCrOA+yg2thby9TmUO7ZQ==
X-Received: by 2002:a05:600c:4448:b0:3dc:18de:b20d with SMTP id
 v8-20020a05600c444800b003dc18deb20dmr12895539wmn.33.1678183643561; 
 Tue, 07 Mar 2023 02:07:23 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.googlemail.com with ESMTPSA id
 i16-20020a05600c355000b003dc4480df80sm18026288wmq.34.2023.03.07.02.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 02:07:23 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 11:07:14 +0100
Subject: [PATCH v4] dt-bindings: display: mediatek: clean unnecessary item
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230306-ccorr-binding-fix-v4-0-117daea88efb@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@gmail.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2628; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=G42YvKxkrZJb/teIAV/+HSCiQBvvc6k4e2mWKdkwM3Y=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBwzaI++vi8o18d0x4WW7CSZlcGaJz7zBjybAHxbD
 0V0R9veJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAcM2gAKCRArRkmdfjHUReLqD/
 4pmKEEHsKgsyphpRf2jTAS+qD61DtVytoGOcCZ4giSLMXJY928D5l57zSrlei1a8RnOoIlg1DGp5r4
 iPALGAhEz2FBWrvEb83xeukIb+2xHJiYXEmrNjh92YYVp4RuvlMBecTQHkElypf9zdRIOaerymRzgA
 98zV6VxYjO3A5Gqxm/G8YQVSvCFHBtWktRpco3h505EFQ40A6UilfZ14lqK+GhmZj07ueoaU8Mmo8D
 vn0yK59187hXXJqO2RdZ2P7zUtuJlq1we1SxMueoI+7EAOoQneokgl3UtJ722DUsYXpKzkcDeB5/lb
 /d6i1Cud3Xm2+RrpV2lKkbD3Yn8y/ycGJ5cOQGHFoApUCFhaxBiuOcfSscyoWvx+o8MN+9sCndHWin
 IqS5fZjGZ8Fez0VV4HicvFI/IXwsieGUAnV+LEJ06FVHTjN005Y8sDnbqqJlYCZcPa2VKv7ijuWaCy
 CzXs2P0a5mG0AOvR0mVFvn4DkW27zkRa6B0lcbe/rOPF0ELOTwHKyhUVWeqftAcmubptyOn+LJGxGh
 qNLzvBb3pZoNxVNp/K4Izf97hQ4+VFHgrOnyojV9D70keC/+sIdcXuB+u4XYEgBz9PQTx01SjvA8ny
 aAYYnop6rMjZIaoqrfxd2Zo2YfFPwqQAOrP3T7kJxtnPJloGNVPirysHrzHQ==
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
Cc: Alexandre Mergnat <amergnat@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The item which have the mediatek,mt8192-disp-ccorr as const compatible
already exist above. Merge all compatibles which have the same fallback
under the same item.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Fix MTK color correction binding

The fallback compatible has been duplicated in the 137272ef1b0f commit.

To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
Changes in v4:
- Reword commit title and message.
- Link to v3: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v3-0-7877613a35cb@baylibre.com

Changes in v3:
- Re-order compatible.
- Link to v2: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v2-0-4822939a837d@baylibre.com

Changes in v2:
- Fix commit title.
- Link to v1: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v1-0-177d81d60c69@baylibre.com
---
 .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml         | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index b04820c95b22..bda86e6857f5 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -27,13 +27,10 @@ properties:
           - const: mediatek,mt8192-disp-ccorr
       - items:
           - enum:
+              - mediatek,mt8186-disp-ccorr
               - mediatek,mt8188-disp-ccorr
               - mediatek,mt8195-disp-ccorr
           - const: mediatek,mt8192-disp-ccorr
-      - items:
-          - enum:
-              - mediatek,mt8186-disp-ccorr
-          - const: mediatek,mt8192-disp-ccorr
 
   reg:
     maxItems: 1

---
base-commit: add072536971d7ce891fde3cdbf68c55e7cfa95a
change-id: 20230306-ccorr-binding-fix-718c6d725088

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>
