Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9255BD2DD
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 19:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5263F10E071;
	Mon, 19 Sep 2022 17:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE7610E071
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 16:59:49 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id m3so80469eda.12
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 09:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date;
 bh=7xDk5BrXibXgfT99ckwNvMekh76xOPeNv/4FsaCfh58=;
 b=CEZJ9TEVferg0ulxXwdUEbWib2zYhw9Tir5LaamEXUe9UQabtpHUZ7t39RbS4S85HC
 x9PFzpX7wALrVEGjd5qyae6tIH2bK+BZxA3AsOGG5SLe8GtLeXrWR5PdxeYfhkGL8zz6
 4aQbHNr7a6hYGMtek5NqaK1fsiK/TphfUjeSfIXBdpM51CKKKEWyLmeQpmyv0FJfOOKB
 18XYmYWBK0IEwGn7H7CTG9n/4b/wl9y9Ex4FAUHaHxrhTxfMVImS7y1QRGtXw5/va7SX
 FYVEq7OHlcwL2JOG2/A0K17XMaMH2dmNtlQw3PM5ptekzTUaKbzqovvSlmYzThYg57/r
 AsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=7xDk5BrXibXgfT99ckwNvMekh76xOPeNv/4FsaCfh58=;
 b=teSudyMV2Kbq5/ktNuU24EJM+hYEMZ15r+AnNxUUKGr71jvSXJaTEXQcQBWIQROChh
 arXQhXAPPWxMxVzF5bTMpBwcB+uAwYgCWzNGkUpO8hGU5MfSrdq10t0PVFNLeLch+zcJ
 6Eia4iAhxqPcryRLTbYk+X9N9y+/QWIT3+5HpUP6XTntKQ7I3/z+7162gQIKwFoIYwqE
 s8Dfqypam8wowbhV6Nk6Kb7TeCgrkxLeuoL4PDOh4RVkgc25Sy+4sMzRD0M4XVJx7Xc4
 x6jG8z1DHAIX8Ggm2YzQgL8bJNPOmPh/M6FcKzORazje/Or1er3hAvCtenaXKv/mG+Pg
 xW5Q==
X-Gm-Message-State: ACrzQf1g1V4+F5Rph/WMrPkS2KkU0j+M1hnC5CQH7hQLq9WhPy1ynoIr
 +p+kcMbUCQBetaM4XJTlbsX04Q==
X-Google-Smtp-Source: AMsMyM5gxGj7vc60+sBilG3OlczkPRO2uGjBc+la49BQKMmf9aIyceQBVlL/fz7uc0yOaSZjotbdPQ==
X-Received: by 2002:a05:6402:493:b0:445:b5f0:7a0f with SMTP id
 k19-20020a056402049300b00445b5f07a0fmr16348159edv.120.1663606789339; 
 Mon, 19 Sep 2022 09:59:49 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6340:f287:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.09.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 09:59:49 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 19 Sep 2022 18:56:01 +0200
Subject: [PATCH v1 03/17] dt-bindings: phy: mediatek: hdmi-phy: Add mt8195
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-3-4844816c9808@baylibre.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
In-Reply-To: <20220919-v1-0-4844816c9808@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, 
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.10.0-dev
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
Cc: devicetree@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 Pablo Sun <pablo.sun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a compatible for the HDMI PHY on MT8195

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
index 0d94950b84ca..71c75a11e189 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
@@ -28,6 +28,7 @@ properties:
           - const: mediatek,mt2701-hdmi-phy
       - const: mediatek,mt2701-hdmi-phy
       - const: mediatek,mt8173-hdmi-phy
+      - const: mediatek,mt8195-hdmi-phy
 
   reg:
     maxItems: 1

-- 
b4 0.10.0-dev
