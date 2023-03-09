Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB336B1F4C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 10:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7204910E7B3;
	Thu,  9 Mar 2023 09:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8887110E7B3
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 09:06:11 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id l25so1128444wrb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 01:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678352770;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DWLXsrQU8r8iBGzoibkZ5OVm/pVG4g0LW7vlYuupzQ0=;
 b=c9DY57l6BH328f1T/IuGy3UGlMX08fdyv0xGGK71ceYc8K6OxMVs5U7DH6Ds/NteNr
 HLJt9zi9wkF+pZk9PY6jZB846V1M997sQ2np8mNY1siIPAIubeIKXImVEqZWq3yx2Jdz
 39U8oyTxDnBv6ZhHzgjpoIRHWlrXF0uV1TzTmuOR1gOsf2ib5T56EcRv6P24KrIqOy77
 XnImIlM+NT0QPv9dWHDT3XmNt8OhptXL20KveMaomIM8oBoR9LJjRggljwjSdfVJRg5t
 L4ZUGpofa5Gn444pQgTEmLW2bwoOJqStNUYHbW5DSPcqZ0mVZ0X61r3gvNxIDikUcLtI
 vEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678352770;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DWLXsrQU8r8iBGzoibkZ5OVm/pVG4g0LW7vlYuupzQ0=;
 b=kWQiz/oRq/5lAjr0X5lUaCqcYa9DP3Secm05mpUXWa2y2DJHdVsez1bMbPzT2U7wwr
 dH70r0jcX6BorHVrz73x+O51bE1pBnwx/umHRU35m+jNPGMBdgF5ErvHqc8i/h5Our7p
 7GeJhifhu/7xJDzdVQ/i4JRUDPpIULVBYM9UdUFOygJ2qTWCGuad1lXK2elT4A/5PKRQ
 zzNOg7XqdKUETNNml5y91Xby3Ki0koJmy5LJ1Pl+jX9L0GYR3eXNS2tpdlCdu2zscojL
 EOY8XjT5g/tDe6mKd2CDcBjyxjL4+oqsrscnwY7oP35Agtt2YXzCwGPlwo/+vynTMlrB
 BLaw==
X-Gm-Message-State: AO0yUKWg0mY26ZOkp51pUUOBhAx7yDB/vSXaDhdvK1YMH0KMhtlh0DC4
 nnz8zObdFmhwrEcsOdOeDmjwPg==
X-Google-Smtp-Source: AK7set/xWcQ3e6C8V9K1no/lYj82bJP03UJ98Zjsnfj7tf47EfzLA58Hl0ucNV55U1teahWwBS6hEA==
X-Received: by 2002:a5d:6148:0:b0:2c5:5335:73f3 with SMTP id
 y8-20020a5d6148000000b002c5533573f3mr18826708wrt.34.1678352769884; 
 Thu, 09 Mar 2023 01:06:09 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 g11-20020a05600c310b00b003eb68bb61c8sm2073243wmo.3.2023.03.09.01.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 01:06:09 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 10:06:02 +0100
Subject: [PATCH v5] dt-bindings: display: mediatek: clean unnecessary item
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230306-ccorr-binding-fix-v5-0-6c56aaecc3b1@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2889; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=ane73DE2EH6XTssrtokRfjsFxb/F2uv7GT+5uVVvMaA=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCaGACge7X0KLwuoqnZ4fw3r3jhLJMOt67yG9WGat
 LuOxaJuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAmhgAAKCRArRkmdfjHURVd7EA
 Czp7QiKLjtd5p68htZwWE4nDjor7AOsvtp3IS4KjRWv/VRtZrXJsy+RgqgCKe5cf0sGQSlHXgZvm2A
 Xg9ZwbC4WqVxgaDSQi8Ghgzcjg/nba7zSYTdMH6aChuWSUkPqDm/9MRkoNs+doS7ZAs7kwR6M+l9dz
 wnJsH686DmFkjzIRXxVbpTFSqlt0lCj4jzoO2WAsnz7CTslFXqLqSzmFtHaOLps1D5dWTdPHH/rcHZ
 UaNzDgSg7p3mKBJ8VJoMxLT9/FUDvursRQJ8Zox+wFSq8CL6ueKnsqjT18/SK7tyvLNIZ7zRngd0n9
 JMovt8IlYUhN2zmrAkXKH6skGQcKbteBFsKgUssRv7zflF+Hvonghl40mY7mbOs20b2g+ujmwQAOXB
 oYU7ybbe2IJewTR1XEXaEgHmABOyXh5ohHOMypvBe7jh3ZMsl5xacZe0MbZSsrTq+TTfi5Usv41Axa
 MKIfhfXUS6SChFwYNp+jTWY5rCwYFalQaLdh/0FOA3QT1VASQnEYV13WK+3qbF7wBo3bMtGzmSuh9x
 HJqU8GPrnfzkOXDaA2shnlVpNTfgOnbbVYqgc+dmExtZZkM/tWyUJx4IZU81fQ61BpuSyY/nAwsEor
 ap7GzUHFvcovcqTA1vSeUrkn46guO3pjI25vYVNDF27Nm7EsCZVflwUxcqBA==
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
Cc: devicetree@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The item which have the mediatek,mt8192-disp-ccorr as const compatible
already exist above. Merge all compatibles which have the same fallback
under the same item.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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
Changes in v5:
- Add trailers.
- Link to v4: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v4-0-117daea88efb@baylibre.com

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
