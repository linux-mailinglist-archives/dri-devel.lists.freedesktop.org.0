Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2BF6B26C3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6749C10E823;
	Thu,  9 Mar 2023 14:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A187810E817
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:23:02 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id j3so1270285wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 06:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371781;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=r5tFAYryPkgwX1r7/qPOO99uZEKbGLFSC5Llqip43Ss=;
 b=xZRhsWgnHZETMZ+7hMlLILnjcF5D1pWv9VWo1MiheTHaxEOGXQClDa5lVA2PrIl+SK
 pA0DaVcgXXFtZixVwbV6JSEhgDLG+j9XJggKbCyuExzvkp3G9U7H55cU18ZVKvEWGY9A
 ZFrKljmbuGiGxAa8nCltIeCdO/4YvCwDYcd9uS01cKMuW5SJrrWa1+ezopl/TtrY1Za/
 GSGszlpxFMTel1nFRPuW/42AVU4GkLqKfeWP+NPQuPDVF+AGPugR3h6OKsdK2r+kbXEs
 49HbAkdCx8O/1kc5/o0eW/6Zc8NRO38gfIuXbQ+Uf6iqBjL35ugX0w/xAHE6ben9KgHC
 v8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678371781;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r5tFAYryPkgwX1r7/qPOO99uZEKbGLFSC5Llqip43Ss=;
 b=I+mh79r/mU6TyaSa7hd+roTYPODJ78XzTSGXUBLIrsqn0SdedlwOrMUvqUSjH4Xwrk
 Lk3j59TEkgSCL6scA7tScE1083tlkda/B/HYStf8irJ7ZPDx5NdbKGkhGniZrq2GrqHZ
 1K5BhLW1PYba1rsjGcpKJzec9rjuJxgDq+rKIBLGm41m6eNKC8KQHOOVYhnMnwbipb/W
 JFnWMLDutC8Om8/7OflPy9pzueuteoC21yEknHBsgK5nwFbFnjM0zTIrOs3ReaDRkeGO
 J+xDbrh90Fk8GKW3FEKKz85CVb+S8OguyAmxFq+rhqz6LbFTEWoqpnvxCuqlan61ip4v
 g+Dw==
X-Gm-Message-State: AO0yUKVrykFpwvg4/MwmEBE8/AVZvWSSySSQiaU0ME8W00yx0ZNlCat7
 ZWLR+MqxCfRr4l3u38Z7AupupQ==
X-Google-Smtp-Source: AK7set/9aDqDnERz+HDQ19uwAGDde4zAOHPr/7EAcg/27Xne8kcfT7S+MbZ6P7q2aic45APWmADp3Q==
X-Received: by 2002:a05:600c:3c89:b0:3eb:38e6:f659 with SMTP id
 bg9-20020a05600c3c8900b003eb38e6f659mr19551678wmb.15.1678371781168; 
 Thu, 09 Mar 2023 06:23:01 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:23:00 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:22:53 +0100
Subject: [PATCH 04/21] dt-bindings: display: mediatek: dither: add binding for
 MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-4-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=941; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=p9WnbjzFY0umwLZFv0SgtilScjmilWuJtI0Fz5hWU+4=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+eRNBAwvwm908UaJder4B/sytamsEVnOqizHk
 xhBbxq6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURYJFEA
 DE19EKGUky9naHlydmvw+XzI7X1WyVlGGorfLqUc3pVinntzlz+XfphHhqWgS1/507xbZ+QmHAwoxi
 FmfoUcAfYPlONd/O5tqb4kb2iqbsmyb26kINAUcZynHLObEcWEpTNJCTaBDK4b3o0BDkcsiWs+JOji
 uZV0IXQ/ac1pDnS4+bhIpvHFvcaMsjLGQqAu5PRZUvHE+JR7bCAaV8C3VFb1VanL8tvkXBLNteNK3D
 abp2LStp4gVUi/3hYsd0ZrHGS0J7Gb/eUb9vuYbu8nH/JVdHgRTdn6QXsMYlIa+IU/gBSKetyevjrF
 Zbm/4tOqva28VQ8eltnzj8Y2A4jEk26viKQ07hgQtwL/UWqX5jatmZKkB8c8UcG+vQotNuxObJoFVq
 i6e0ciblMdhn7lJGu2maX2gCzGbSbTXiFhLqjln6YFk0kI3mrqp3VdukR9elQVPpr8dOGE7voPs+Dp
 q17eTddsAV744xShy6+dfYbbmyJFf8hFKZeoozFTu8wHiJJTfyHbpzFGMs9YCv9EH3Jq6cVrUaop7Z
 jx/SyJ9ZyQNL/04hvHOHs6pdCc9rWKCIEyjD6TQpaTYbI5FkWS65jMkKh4euvKcFq9hs4cHahOq4gc
 6A0hzj67tC1VBr11pymGNPIrp90wXmZhIMzYtg+X4hmB5cXs/YtcS3SveOIw==
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

Display Dither for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 8ad8187c02d1..a7706cd65675 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -29,6 +29,7 @@ properties:
               - mediatek,mt8186-disp-dither
               - mediatek,mt8192-disp-dither
               - mediatek,mt8195-disp-dither
+              - mediatek,mt8365-disp-dither
           - const: mediatek,mt8183-disp-dither
 
   reg:

-- 
b4 0.10.1
