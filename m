Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A575BD2FF
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 19:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651A910E0C4;
	Mon, 19 Sep 2022 17:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FEA10E07A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 17:00:25 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id z97so115583ede.8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 10:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date;
 bh=w6fAZjUSUbrTkGOCw5LFlmC1xlGoTF8FJL/IRWB3F4k=;
 b=VyeY5nKyZ2Xt/Foj79ukjzeYW4F8E4loVlhOJLflWXPXa38+TG6kPPbnPJK5N6wYlp
 l00cwyDPfxCvQZiSOSkA5M2GaDMATf8caLakqM7xgzSCpDc/np8/N3mN6C5k/Z5eGs5M
 wbmqXtAovwQK910RwxBV10RsnW/DTczpNc0tkVi+KPEn5b9+M4uh8g7fSddQOAMawP2K
 4Zb4cHnVWy5+eeIIKaTBXD8QEb6y5h5w+Yw4DlEj8JOI8cWnh+fcrvbfZKYqQXVXfpjW
 s9yJLZzVW357YxZ6NIUfkLNAeku8MQ/rpeEFJ3Nz/EOZYEe8b0ZB5EvQcow/777qr4B0
 ubnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=w6fAZjUSUbrTkGOCw5LFlmC1xlGoTF8FJL/IRWB3F4k=;
 b=zWXEt8QEacrapiWszliUx48PkhGC+4xQpFYMa1UkV2ZGg31IQTUmGpzLzetdGGw0Md
 2Nyji9P9lDcb37Tp9J1VyV3HHyx0B/7qtVaaa0QI0UEOapF32AS5Q2gLJWsFxREZJsGJ
 GDQMRR7r5IKEwWYFqqZR8QIOT1umKFy4uFxlojyXaJS/K3lwOFpqioMzm67NSMM947cE
 gmjo6ORl0o6WP+3i0h7/T09pxOgXuR2B5Hqzi53gKEJvQilDwhgYDWJVPkbHoQerKist
 37lD2Y9D6PlzHmhn00EkQnqv6m51GFrSmBMDoIHWg1Ai+VQvASgW3J3xDEP5nXl96Lfg
 tnUw==
X-Gm-Message-State: ACrzQf076R0uLG45/C9khbi4UP+EJQj8sxsjTFtHMNKVUxYGWc/aW5BH
 fl0N0CtEXBY+Px27hYQoxLOIGQ==
X-Google-Smtp-Source: AMsMyM59bK7bV3ogR0Vq/U6qyHBj+7WUNCJVJ7yTHkO06E3cAutw018u4siyFRxzjVJRBcxdwPWWvA==
X-Received: by 2002:aa7:ca56:0:b0:453:ceea:99d4 with SMTP id
 j22-20020aa7ca56000000b00453ceea99d4mr7672718edt.54.1663606823801; 
 Mon, 19 Sep 2022 10:00:23 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6340:f287:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.10.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:00:23 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 19 Sep 2022 18:56:15 +0200
Subject: [PATCH v1 17/17] drm/mediatek: Add mt8195-dpi support to drm_drv
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-17-4844816c9808@baylibre.com>
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

Add dpi support to enable the HDMI path.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 72049a530ae1..27f029ca760b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -820,6 +820,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8192-dpi",
 	  .data = (void *)MTK_DPI },
+	{ .compatible = "mediatek,mt8195-dpi",
+	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8195-dp-intf",
 	  .data = (void *)MTK_DP_INTF },
 	{ .compatible = "mediatek,mt2701-dsi",

-- 
b4 0.10.0-dev
