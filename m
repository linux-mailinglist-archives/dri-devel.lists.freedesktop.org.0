Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C366ACED1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 21:04:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640A210E455;
	Mon,  6 Mar 2023 20:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9989110E29C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 16:20:53 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id j11so21420046edq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Mar 2023 08:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678119652;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eoT4nVEHPLKYoD5WLwLRDEbDFsrUlZVmGeWjEVeiTO8=;
 b=hzaQi41EnB8iABJhplSxLHLE4++NFbzDr/VciMZtMLgj4V9v5rJv60byErPcqO3CHA
 AHdDgnfs2Tt1F7NP2DRvbFBinSBdCDE84+bOfFCd8vdI0RWZ6iuwmXfnHK58hQWRZlAT
 ZHXH+TG9yOaVfcy3n7hSuXNNO4yFvz3xc2WdzV7HjICEvn5H1FSo6jB7t7D3HTdLjnBP
 MZ9KgxfeUJW/r/NByt57ijJ0HtndMv4upH32ZzSzmKP0LxXMO+BJB1gwR41h41HQTvvj
 Jqif1z+XaBFuw30n5Dh7r6C8ZP9blX1BkA/NQJXOZU/mW/Uq+l9F1VkWZQHU03GaABRw
 ygsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678119652;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eoT4nVEHPLKYoD5WLwLRDEbDFsrUlZVmGeWjEVeiTO8=;
 b=tkX9H8yAPMXkqNDBapFHJcNHQUev/Z1IBg8diqjnQhNKq+28iBZ82RsLuF2IMCFqZa
 tj/GPQTY3kdMBFPWNP0Z8WkRpUdBbf3CLEdnyISqfeqOpCmX0YLDjaj4hGiaeNl0Bqif
 wJI1q4c1g6se/6kD7/hNB62nAAk/vkOvZVHQdecY0zQwLFwkD/RdGqM3/gJhZD1D5KOk
 +P4DBYgPPGT9nxoAmHZ+Ac4v5rW3ZZ0A3EcRZ2+BO9hHvNc8MCAIpFdGn0mV9ea19ZQw
 n++7cSN8bQgz7Op8jFrixhHPLkpaF8+qAw83XNIcvfPLttClWvPc2ARXnyEHQYUf9KI9
 B3Kg==
X-Gm-Message-State: AO0yUKWgWzXMLJbx273logTihMcdAn+uzzVU34q4P811uvCVaY1xBrkv
 bkj3wF1cHNOQdzeQu/at2XwNJg==
X-Google-Smtp-Source: AK7set8fuuLFOKxeQmjjgaTKE54Up+U1LGn/33b2wjrGTQyYcWBdlhu7QcX/T1JDWTzBC9tsOQFJ6A==
X-Received: by 2002:a17:907:98d2:b0:8af:54d0:181d with SMTP id
 kd18-20020a17090798d200b008af54d0181dmr9691625ejc.35.1678119651865; 
 Mon, 06 Mar 2023 08:20:51 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 e22-20020a170906081600b008d1693c212csm4722340ejd.8.2023.03.06.08.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 08:20:51 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 06 Mar 2023 17:20:45 +0100
Subject: [PATCH v3] dt-bindings: display: mediatek: Fix the duplicated fallback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230306-ccorr-binding-fix-v3-0-7877613a35cb@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2468; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=23T/1fFc4VnkKyoBRTW6JwY1WrACxyhmLzCmzLaQ6ZE=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBhLiP81CAammTNgGV2PesxvLj3jcDfR/OozCuUj8
 nfi703eJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAYS4gAKCRArRkmdfjHURX2hEA
 CkW6J8DMjJc7a8ghMZ9f7DqlbjoFNsCh/PWv61+0EE0dw3V6Z07qe374M2dlsBJRvwdr/qWrktmwGx
 /ByZVgYUjAhDrRHYse5JVGh5hKhUWx3HHywgo/fuWjrFxRdsak+7Zsm3JJ121m6DXUurQ3mA7FlKez
 S6IImcHWq9A56o8ZCyahNR0mR0TaqNbLiTnyBVmWpfZCkTl31Vu3Xj43hUUJeck4z0+wQfEcVR01b3
 O/2OV/zTCnBIDq+7xmEl4BG/JrYf7REEINpAztmeP6FV2OYMmRO3XEPZJSWNpnf8Ruu0SgZJ/5ChOk
 9Sp5ITaqUe1sBPVffaJe8VKXzH+A/IRMWfluznGgxHiirKm8SAesgNrmEQw86kye6yA2+GgwafxGyn
 nrRR5tFCZ8t4DaEiwSctd/jKi03teV+siW5YjIxrPO8P3/UpXkziM67kxpn8dxGNuMSj5KROduuqcj
 lCVgZOXPYRMcxA/Ulwq1aZmz0d3xN95k5//2LRRX4I4kWIi7BAr8eOCZQ6Fsk8WBVaSBGd090gmgV+
 pZYfE1h+iSREvn7+8BNGGtrhKKvyDS45bBV/5S26YScGxFA+Ki5j2WIQGslDHMdif3WixWLtlI0i9X
 AGby2/S/Z3KbE/rBRhj+pbMdINRMv0J/yEionIt5zHRUzdQFBnyfXOgpTjow==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-Mailman-Approved-At: Mon, 06 Mar 2023 20:03:52 +0000
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
Cc: devicetree@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The item which have the mediatek,mt8192-disp-ccorr const compatible already
exist above. Remove duplicated fallback.

Fixes: 137272ef1b0f ("dt-bindings: display: mediatek: Fix the fallback for mediatek,mt8186-disp-ccorr")
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
