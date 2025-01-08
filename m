Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A80AA0622F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 17:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E7810EC0E;
	Wed,  8 Jan 2025 16:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XUDAzhO2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917E410EC12
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 16:40:30 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53e3778bffdso18571272e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 08:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736354369; x=1736959169;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fy/DbTIkkOlFt9RUb5dJSds3N2C+4xTIp3gr3Wl8Gls=;
 b=XUDAzhO29ZiEMHk8k4gs6qIv0U+4IP2iuHvlayV4aA9L0YSEXbM5q58nZu7NiZWve5
 RrCoDBV6B6KFit4BHQLEHqxBRZQhd58s/W/n8NMq7VFKlm84RLObtGHShpXeWPWFjlhQ
 AEcpn1qbswQr1HaDyXoyNtJQbKenmqpym9tQpfMo9tA6ouE/e5JuH2QVr9r/VGAfcgKY
 NMf5ups8M/EtBxASnZmuzzQPubIkNw1MjUAqtmZ5scZ4oP30dqx5Y/3ILUuf0gxPW2ou
 923xbSlA8M9jTMIK5nCjJubSihJ1gSz3zYuGc14OQ2jySx2wi92jyRnEMp4LCMujHGsr
 x6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736354369; x=1736959169;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fy/DbTIkkOlFt9RUb5dJSds3N2C+4xTIp3gr3Wl8Gls=;
 b=Z/XPDYNgLVCGPaHpc2lQKazgh1XB5UTHUvkRsftZpYJ7n6PDWDNkYP0Fm8XbeJ2cS8
 3pjGOEgBr++HF7Ow/dehBSNkXYx2WzeZVpgPG0JdGz4BdiVK/rt6fh0QZfWioHpNKlTl
 u+y8F00GuDoVcFlR7jl+zljvFs0Zc6ndGn1aF8V2P74zlFBX8DrMrOn9T8WHaWdX/WzV
 uaQKWJNHc+7gqSUS+bNTmIDdE+WDXBs95wOYGCb0XaDFeOsbhDMnKHPOnF3LwdhDLxVx
 RQ8JmSL07uSSYfjzjeJE12uYRZPHDQ6edFRvJvDkcowlEO7OIA4G17EA0VWfDdamS2ZJ
 50ww==
X-Gm-Message-State: AOJu0YwDI2y0Dk2FxuylzTEWcV+hiv0LFhUN+S3gVrvGCJKjQjFmD3L5
 gf+hvOi2/6eMISvJMM684vlMKs+4pbCc+t8PN1QNJTh5QOfAeKPoY7SBxyMw0hxxp9PN3FfAPED
 qi5s=
X-Gm-Gg: ASbGncsPv4qaVoDlusipV6CrRSGpnqE1Vj1SoEsH5o0/DC4Vx3duAykeqS2y7jB7+gS
 b9JZ98SFAZlZBtzTZQ+nU2DYNAl/bdmKkqOMbwm35lv33Lqm6/8oJXV/IJbmt4pizrmYU7p3637
 ++AyYC3IUi2PuYSS9Z+XIqEBP8OonzGh0yYeFFGYIHRDfxvs5+gUMeQXPmXLIF6S54fQfnk8x01
 fDWDrES/dPBSR8RRZYf5Au8FA1KuKReMfklISQBYOFU09Tco5ZFKNnAlW7T
X-Google-Smtp-Source: AGHT+IErwM3j92JVYdrvJX3rbay8OfkvXx94igFMozvvvB4mQLpq0RzpMVuPEGWSZVlYGy9bvneCfQ==
X-Received: by 2002:a05:600c:1d9c:b0:436:1af4:5e07 with SMTP id
 5b1f17b1804b1-436e2696d35mr27681225e9.1.1736352949654; 
 Wed, 08 Jan 2025 08:15:49 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:a6ac:e6d2:88e3:8ea1])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-436dd14dfcasm44378105e9.1.2025.01.08.08.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 08:15:49 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 08 Jan 2025 17:15:44 +0100
Subject: [PATCH v5 2/7] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v5-2-3905f1e4b835@baylibre.com>
References: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
In-Reply-To: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=Yn0yDiaGCUYQbX+kBDNWi7Wqy2+4x3TU5RubErw6Doo=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnfqSx5htXrZ1ekJrvaqOwSRFlMwld/dEfa0QLcinc
 YbzjdD6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ36ksQAKCRArRkmdfjHURXnkD/
 4+h/AOARecYGq4oShtmb2NW0jX93mfDG2xklUJT2F6zBdbeNzF6+Hf9vpfH4IpJ8qCOhzaDAiccTsL
 n/F91FRgA3NhV9vLIweMBfpouNgCAJqDxu2pVQ8JyFArTbNkI6MaA6tXhjHbSFdkiZkH8YSC72VtwM
 bodY/gV06hSkUUimxNUXCx4v1YuSI8QENLLVyMHqubbw2PAm0ROJpZKngxxzQF9Rq9bqENCWWiJNRY
 Ytvo7Bx4FGwzHo57pskqyQ1mAmfje/TeJfv7GuFhUpZ61PaoWaCK0/2ewIrMg9c62/X2ZOR3VY1ci/
 /+m09ncl6oqERlR2m9zs7k7q9b9jHAEVeeKaCcHuSjYP9kRyfI9jygs7XOJCnpMlcLDLNDRra8gR5X
 FvhyaNTLwPHtRkcueY6llSeCx569I6CL3vY6Kctoc76+wJN/ZYGXnIRbu977CDV4r/PvTP9njiTJ84
 ADMCGK3XcaIRppY8TNSWvsCyP0JBEQSt8lWNXtGem2TkJJePfcXNdp8Dca76q9L7/t6XheWKjOl/CT
 eO3iTUH5b0ZhjfF7Vbbq8kHA7F82w79IHNou2cAvQaKO3Yx6ExoIWkcvl76WWSaY+eikcL3TgEVN2J
 keKvH3T/7q8YjxVodQBfIsjyfX9ikYrJJ/UquoQr3Hl0ZXEosxA3at8BhiRA==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, mtk_dsi_lane_ready (which setup the DSI lane) is triggered
before mtk_dsi_poweron. lanes_ready flag toggle to true during
mtk_dsi_lane_ready function, and the DSI module is set up during
mtk_dsi_poweron.

Later, during panel driver init, mtk_dsi_lane_ready is triggered but does
nothing because lanes are considered ready. Unfortunately, when the panel
driver try to communicate, the DSI returns a timeout.

The solution found here is to put lanes_ready flag to false after the DSI
module setup into mtk_dsi_poweron to init the DSI lanes after the power /
setup of the DSI module.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index e61b9bc68e9a..dcf0d93881b5 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -724,6 +724,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	mtk_dsi_config_vdo_timing(dsi);
 	mtk_dsi_set_interrupt_enable(dsi);
 
+	dsi->lanes_ready = false;
+
 	return 0;
 err_disable_engine_clk:
 	clk_disable_unprepare(dsi->engine_clk);

-- 
2.25.1

