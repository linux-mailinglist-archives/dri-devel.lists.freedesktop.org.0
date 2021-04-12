Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E8C35C1AF
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 11:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288586E41A;
	Mon, 12 Apr 2021 09:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A8E6E424
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 09:39:41 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id f12so12231404wro.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 02:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=emj6t0YnQ8kfODwk6pGcM/emMJNNvWG7eis4Ne6JndY=;
 b=Jpnjn9rXPzkPxXX9WoOJFeWyeK+Ple7SplSjETf1bgkKa00qCyCMZZHr89iasN12TP
 oxxcivC+ycem/57+p8Se9OmpW61Ci+2Lwf4CVHcNFuzmyMoJkQq3ZH4ovghZTO8pLOMq
 MUhnxCtrb85Fxyx4KOXAy1kmoALlk4B4/RN4i2PnbcW/j0xKu1fRmHvKYLT+RffbQoxc
 sdckkuOeCDhdDf/cMJRNDRqq93W1zI+VrTKEglTuYDA2TVQXBuil6HRCOuEsEsg798Np
 9IxE5NDgPI4riPu9xNC9v07n/ayBwsSg/UVLpmw72zWalk75Q8xqPjbjqbRrnD0En2ig
 dxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=emj6t0YnQ8kfODwk6pGcM/emMJNNvWG7eis4Ne6JndY=;
 b=UvkXceijeCp2gSL1J4SNS3XjrYQneVHqXtKWR22RnhfnpjkvHdt6RdA4Qjgu/EgwVa
 nIJ84CY3WNwNBSUs4S7WdV9w3FTAdbbpy1NEiLNAcoAqx9/TBj90nKyGJSCOBtp1k9SB
 Ow9W7HR/acrn/c+oabc1rSzKmk1Frx8F6gfK0FYMLTyyS/JmQI2bjELU4Dbq1V1Ov8wu
 NlaSGwmyJ2DXeDILmpGdunxw95zElPSIcT22BBiRa8QvGPlSU7djyAuBsczTe96yfTOA
 rxrfxQus0Bat6QGFuSTmciGCjs6C4EOJs79FJM1MdCfevOL0EpfdN81gAdbp9qxE2Mpe
 tlcw==
X-Gm-Message-State: AOAM533+2K6ijfwkfp95AA9GZ0lOuACXqP+FG6LdWkJLiVP0jZYcxSzb
 8kDkWZ1FPRqYb5nxy/9R7Q61Ng==
X-Google-Smtp-Source: ABdhPJxSRfTPtAOzbr7EGyj16vGGsghASbI4b9GyWVvNHffdVr713D7XedbHjc9AgjB8nY3Mw1qMtA==
X-Received: by 2002:adf:e8c4:: with SMTP id k4mr6745211wrn.262.1618220379586; 
 Mon, 12 Apr 2021 02:39:39 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:4c21:b00e:ff79:bf20])
 by smtp.gmail.com with ESMTPSA id
 r22sm14405902wmh.11.2021.04.12.02.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 02:39:39 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com
Subject: [PATCH v2 5/5] gpu/drm: mediatek: hdmi: add MT8167 configuration
Date: Mon, 12 Apr 2021 11:39:28 +0200
Message-Id: <20210412093928.3321194-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412093928.3321194-1-narmstrong@baylibre.com>
References: <20210412093928.3321194-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MT8167 SoC have a hard limit on the maximal supported HDMI TMDS clock,
and is not validated and supported for HDMI modes out of HDMI CEA modes,
so add a configuration entry linked to the MT8167 compatible.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index bc50d97f2553..c1651a83700d 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1787,10 +1787,18 @@ static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
 	.tz_disabled = true,
 };
 
+static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8167 = {
+	.max_mode_clock = 148500,
+	.cea_modes_only = true,
+};
+
 static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-hdmi",
 	  .data = &mtk_hdmi_conf_mt2701,
 	},
+	{ .compatible = "mediatek,mt8167-hdmi",
+	  .data = &mtk_hdmi_conf_mt8167,
+	},
 	{ .compatible = "mediatek,mt8173-hdmi",
 	},
 	{}
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
