Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ED66B26B6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:23:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E711910E817;
	Thu,  9 Mar 2023 14:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0982510E818
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:22:59 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so1358324wmq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 06:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371778;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4HGXP3dztTrnQjlCCkBVLINYyzIjFA5vv4MQlPWgtfA=;
 b=034QB5Y0+lS6JX3VHLfCbMLKOw3Puj5QP3kkG18+a5j6LclHoFYu2AHV73XtlQ+cCL
 c7XuzGEgBa+5eZQeEexsCKVioxq9q+GLiLVasXwe/8wQzOQeIh2VEeWunv4wsEOfBz9I
 o0Q3fnV7MxT/wF2oN5Ve2OWgX0WnQQAvYpZlNp5sU2v5quTXjiU4F6r4MPg/BGueIEZX
 nB9NaCsfiPvXH6kYatW4bzYYo4JnIsu6uHIm7d+HFB3Utms0AdnCKZjUSGr9/OR++vNE
 3AZG6Z/fbPokdTAhRQ31wXQteokZZ3SWIGAWGMacyKjk9dwla5dYpfMu6xPBzDKY3zO3
 VSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678371778;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4HGXP3dztTrnQjlCCkBVLINYyzIjFA5vv4MQlPWgtfA=;
 b=O6hEOQNpqg0RSX/Ho74wAM2V2Oo+HdFa5PzkYX75mJXjHedvZEl3hUhlOGw6hNi9uo
 nM+0FnCotJqZmx7EVFSXzAkkCtZ7X0Z2F0zwTCTtQJ5J9jyFSQXejUto++iuB5YF7orx
 BtCPzJZvvB5NYKOuf3aQr+1/EUy1chWe8Go+pfPRP1ol/U922DJHpsXNkjBY3usM/Yc7
 FZs5o7Egonow4+1isJ1fZoxaCkiDxRGSJNoDQPNg/UubsvZEHfZrLFnh5+ZmVPV0s/zN
 D1tylroiw/YCWqRM7jSf5l/illGrM5hMfEJj0PS0MjI0phHX1jQ3rPgZQdeAoIDb86il
 PrCw==
X-Gm-Message-State: AO0yUKUkm5agG0sz/RdqJsnNbjM8JR/k/suQ80PgXNi6Z1FqERD6o2tI
 FNnryTtWjhyLbte8TybmqnxDgw==
X-Google-Smtp-Source: AK7set8LBA7kJVWdMBXxuiElbjEob4ABHNs0P+w6UX/yyJGPqOclYqM6FVkDJEJjKe4T4cCEx6FFYA==
X-Received: by 2002:a05:600c:444c:b0:3eb:39e2:915b with SMTP id
 v12-20020a05600c444c00b003eb39e2915bmr19673513wmn.31.1678371778461; 
 Thu, 09 Mar 2023 06:22:58 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:22:58 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:22:51 +0100
Subject: [PATCH 02/21] dt-bindings: display: mediatek: ccorr: add binding for
 MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-2-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=888; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=C7jd7hPJyNNK65umqiaqv8dPlJYkmQJemWR+tpy2or0=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+0ew6YaHQB5gxrKawL2Go78SiMBY25/zTN4Z2
 MRX1zaSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURTHeD/
 0ZAamMi7T+h2vz6GHOVNWgosBIBUISGisRUy+7NzqleA2E6NBx5WeM7D27F1qOLovxDYPlTo4MPfqD
 KpDgQTVD6HUqmO6GbVpUYpOxLUCRIJ4R2I3LzqJeopB2Q644bdO6i59E5JxsBLYqx+BHEKbusVVbqW
 6VIvz9g1Jh7/oHqCuCxH/wM7Jl1cDjLB4e7xxH+ikBLfP7/4Ut4d9krtxEZthCLCyW5nBeIoCApaak
 ixzLu6XsWhGP6Ochs++nUaJ1+H+8JiS0bygnM4F/JyVQo/NY/Xx1SwNrt8UPBoDzMEOeqGkH2VtPg7
 JQtWf0HqXftZbe2FCLvTfPVsn6hwJTXvJZuKIymeMu6eSDiq/hd2v3HbcTzLlZ7k+10ejDi/2fD2my
 OytIuUhmihdhn7FXT+OFr4ZLE7TgeVXJBwqrALhdDqm3Qo5keCG5juCY4xOIYeJ8flcRRYngzqVLJl
 CFVkOAQCJeAuZ1XG2/LuZv/sGWCCDdEiA7jf+1Uo2rJE86KgTkgAK5Qi0MwdXY2KiwFmk8SQXZapgh
 HIUej/Ux3FH2LrmRsqWWzp6TULX/lR8raDTk/nHbLQgr476hOBDzn63rVuvVXBicZSdy31VRO2SdSE
 2vR/2pqUG1VVmOizx3ImOzJI/esDslVyHIyYLiYZB0cpztNZQd7jmdh2l6Lw==
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

Display Color Correction for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 63fb02014a56..fc999e614718 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -32,6 +32,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-ccorr
+              - mediatek,mt8365-disp-ccorr
           - const: mediatek,mt8183-disp-ccorr
 
   reg:

-- 
b4 0.10.1
