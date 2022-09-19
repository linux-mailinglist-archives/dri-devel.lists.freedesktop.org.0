Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D12E55BD2E7
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 19:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D87910E081;
	Mon, 19 Sep 2022 17:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F9310E07A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 17:00:21 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id w28so124205edi.7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 10:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date;
 bh=2Meo31PuvkGIwIM5AdXoX0Hd0Yqmep6vNoeB5sp1WIo=;
 b=h4xvs+f5cmaWKYK71+hYnOmPVkiLtaB2mRla9tuoCEJPd+4ppfNzN0FBFiwIs70U65
 tbJ9aJA3dpNgt1Ckv+Bx6Hc8Syb3OFhB4z+FJI0fxOKxNgoDOjZd8j6Uskwq0OWUm816
 O7xPp4SJYuri2o1ZZKVZOB4LzhA9nFL2qpDxRJhsPPzW8j/vsldo+OZmErddviwJRjTi
 p4lfIW565oRIN/c+Vrhth50HEka7xMLu+MKAjKA+FPbmPD21phAwhccqtGiVTtSD60Zd
 EGLplHMN2dasKn0QgJPqQZBi+CeACR4L5U4Dlj9odh9YO7SKHNRH5sQETerhK+QEqrcG
 P3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=2Meo31PuvkGIwIM5AdXoX0Hd0Yqmep6vNoeB5sp1WIo=;
 b=o5apPN79YMBdnkdSkD8Sh05YnoJlGKCNAcz91pxR0Jf5MC1o6h6Qy3ith/EsmvJspH
 YJ7kDZQL7TDzsmNHlccexMHIwZoRll3vw2D4pSmQGEAHgIMe7OqsuqCJ6FkPkFQZ5kPZ
 8Np9Gydd3UVAe1xjxk/arOV5EnihNmqSe3GklZwjJgEB3eQFsvSVT69/WQTey2DPgNa6
 YvYpSHeUjcSO0NnW0UjGkcHkQbrHysWJCf+spaNXeMtDAPAamXEx6JPXm39mBBmlZFAJ
 97Y9V4q6UQwQePBYjyf/jHSEU6AgC3imJckM3hLuuy82lZjAu9D/VSjZA6e2P9vMbdbV
 iz6A==
X-Gm-Message-State: ACrzQf3NnICtkUfUrhMELqT8uVIn+VvD82XwVfpG9yUxNS872Y8dj8JK
 cOutQ4Px27+WoYJ7Ozxtw6wfGQ==
X-Google-Smtp-Source: AMsMyM4nXsx/EGy8bNgRHqGUolsSurVZgmUHv5N2kQ+oMKWiHF7U6zG3vs9wXOsAsDPUMkE0zR3f8A==
X-Received: by 2002:a05:6402:847:b0:453:943b:bf4 with SMTP id
 b7-20020a056402084700b00453943b0bf4mr11555407edz.301.1663606819619; 
 Mon, 19 Sep 2022 10:00:19 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6340:f287:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.10.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:00:19 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 19 Sep 2022 18:56:13 +0200
Subject: [PATCH v1 15/17] dt-bindings: display: mediatek: dpi: Add compatible
 for MediaTek MT8195
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-15-4844816c9808@baylibre.com>
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

Add dt-binding documentation of dpi for MediaTek MT8195 SoC.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 5bb23e97cf33..2c7ecef54986 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -24,6 +24,7 @@ properties:
       - mediatek,mt8183-dpi
       - mediatek,mt8186-dpi
       - mediatek,mt8192-dpi
+      - mediatek,mt8195-dpi
       - mediatek,mt8195-dp-intf
 
   reg:

-- 
b4 0.10.0-dev
