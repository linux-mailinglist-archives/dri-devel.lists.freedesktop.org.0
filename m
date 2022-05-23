Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4275B530E6E
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 12:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED8A10EEEE;
	Mon, 23 May 2022 10:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83AEA10EEEE
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 10:51:44 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id z17so1627251wmf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 03:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L59GiR9dWwoU3bIhqqTo2XYxtqfhGwikIlZ2jdUecpc=;
 b=2GpBC1024UFGepfN4EeJgCuO1UN/4rP8fzM4ZTL1Oy3Eb3PQ2YbsieGfwd/wr19Az/
 vWLap0skRbcSkUKW+aQZeMenpJ688qxeEMD6FtIdTctSUfNDjNU3ehuSa8LsbZCQyUSK
 Zy+t65L6dGDUIql6D2yeRE+ALRoFTHsQeKMF2wqO2ShIe7QcffeUStrl7exDqGkmebos
 xLpftSD8FbLe/y/SJYDwky1vcICDBek0D4TMe/W6PIp1v0fzs2QFFKULXHPK5y2KoT2H
 8pWePMqWJBCozqwdHN94XLhrb7SeHk7Zo861HG5+ZCYdcczXlH57WTcJRxLCU2WW9NiG
 XpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L59GiR9dWwoU3bIhqqTo2XYxtqfhGwikIlZ2jdUecpc=;
 b=0iGQOquK7n4M7UjNJC84EI8W0VVwLMrCGx94JgTqLpwrKWJX2g536ebW4pSU0pW4pi
 IkZ9cSbDpEd9Df9/dkbNN4zxGtXvYbDxf+6X9OF+7zvGmGtZTWfjXrcbNPLTK351ODC4
 lYouXlCAwsVz51yT3btUVwzh+tt56LY45lRBLAchCDXp37mA9puGJ8A1uafpxk9nCx2I
 h5xF8nKuA6L6k68eeKLyi33rvQ3dl3zWEMKoLhBPNZ7KLUUZAj89D/B/lHddAKdXZyA3
 m8kTvDLt505EOwpEnT05YgABs9orG0srYZFe66RdkYqXoY9ZPTTnqpDta+plj0SITqhZ
 XpVQ==
X-Gm-Message-State: AOAM531b2FGsTQkHXYAWZL5u2QfU7AFtIO09V8zTgrEoVTd7DHsW98cC
 Whsh+0xA/A4yc8d/AlAapqU36g==
X-Google-Smtp-Source: ABdhPJwNegNr44So8xq4D2p9JaCnMXp0VvpDOo2fky113Q7b9TeovIyeLXQjxBiFJh/CiujqFzERLQ==
X-Received: by 2002:a05:600c:3048:b0:394:436b:76b6 with SMTP id
 n8-20020a05600c304800b00394436b76b6mr19844563wmh.63.1653303103041; 
 Mon, 23 May 2022 03:51:43 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6141-9d1b-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6141:9d1b:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a7bc5cb000000b003942a244f38sm8453607wmk.17.2022.05.23.03.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 03:51:42 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Helge Deller <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Subject: [PATCH v10 15/21] drm/mediatek: dpi: Only enable dpi after the bridge
 is enabled
Date: Mon, 23 May 2022 12:47:48 +0200
Message-Id: <20220523104758.29531-16-granquet@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220523104758.29531-1-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enabling the dpi too early causes glitches on screen.

Move the call to mtk_dpi_enable() at the end of the bridge_enable
callback to ensure everything is setup properly before enabling dpi.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 763bfb700135..a6b6d62a17e7 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -478,7 +478,6 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 	if (dpi->pinctrl && dpi->pins_dpi)
 		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
 
-	mtk_dpi_enable(dpi);
 	return 0;
 
 err_pixel:
@@ -711,6 +710,7 @@ static void mtk_dpi_bridge_enable(struct drm_bridge *bridge)
 
 	mtk_dpi_power_on(dpi);
 	mtk_dpi_set_display_mode(dpi, &dpi->mode);
+	mtk_dpi_enable(dpi);
 }
 
 static enum drm_mode_status
-- 
2.35.1

