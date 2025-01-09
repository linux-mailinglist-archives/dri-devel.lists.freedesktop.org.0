Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F301A0737F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 11:39:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985B610ED55;
	Thu,  9 Jan 2025 10:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fbj+WkOo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811E610ED57
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 10:39:01 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-436a39e4891so5713185e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 02:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736419080; x=1737023880;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fy/DbTIkkOlFt9RUb5dJSds3N2C+4xTIp3gr3Wl8Gls=;
 b=fbj+WkOo/NnlnehUVs693mJzhjoC9WJ0TKd6klI2D1CiZMMTZiSMYaaVefaKmhyV4v
 ywSehP4JnUYd8gjMnO8/5LTZArYYkpJzWw8Z5s1KeRn7J2Q2VhiCOuTxzQvNFFMBxRh6
 tzL7xvm5meaXZ17afVW9pn03WgmQFLZYQVB7Vmdv8bbfwbAoSCWEFJo9TQzh2U7J971T
 m3GX5fN5AwfFgyYT82kPPU96Y1ZHGq0Ft85Ubnvryv0e6sf/hqwjreFx6NOIs2QHm0NQ
 eBLCk6WG9/r6mn04zgsGGvSiL1F2R0Gz/OQGWNziri5cfhBLPVC0dmYswsI4o9cOpMhK
 +Dtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736419080; x=1737023880;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fy/DbTIkkOlFt9RUb5dJSds3N2C+4xTIp3gr3Wl8Gls=;
 b=nxXacaXdAWK3tteu0TWCsZJBfkNfDHA6fbs/FCr2yEskJcpzQ8ZVnVWwHZngRHQvxj
 cxzrTiTIJi0p+uQX4lAqiYT1ewdxXx2YNDSmOZkEfzoKcMKsl9qlDBd3K0NHA/Sp9Zi6
 FpDilkuVC8AcqV7ON69gXCwPUE6UHIzt7AmP/WRYfY7Cp3UJySo+k7K9j/jK4QoHqHXy
 a90JU+rwww0OnmZZEuTOWPZIdWu9YzjIcgj3lnDGQ3HRMuUSjjsMSgDD0L73gllBxgvZ
 K6Q/tkw33tOzQNjkzMRVvhxaebj4wiZH3DedhHYBGr+MOWfYvxGIhKOLojGTA0D/BOtr
 0Leg==
X-Gm-Message-State: AOJu0Yy1fCDKF9KhOWMclcQ0bfzkvoRbn4/iX+ru7NqBAq1jDlhclz5g
 mKQJhx93QBRnpH8dxEfQtkEXYwhGan69DRetxoloe+PFGcPPOLoItwujp9lidVg=
X-Gm-Gg: ASbGnctBQVEtFx/jzikxJSHjVQjVpa19EdLRkkieqR1cN5zfMybwELUhl7ITig9jO2S
 W0OOtacz7zq63T42I1CUdGhtx7hBeTXyRz+U6FdFKxY3Zk4HFd4owje4oejBx+KAhvYw66AFgyf
 uxQiDsuSakTlS9mw+aNuVwLUUdtzi7IKy2kqNARsJ5p91wOsgeLqw3ft0TZiLrS5s3UlDMh8VT9
 xRWitJq26zW4sguEuOB1jdhpFcliWYvrdJYdrhR2QxEw9460MsRjkHfOZA=
X-Google-Smtp-Source: AGHT+IFqrF9VBaIGIQv342u8nnxcL3grxMu66H5YdF4aKnHXSKZ8sqOEG/h96wNqmjPS/6bRF8WYeA==
X-Received: by 2002:a05:600c:a44:b0:434:a852:ba6d with SMTP id
 5b1f17b1804b1-436e2692d98mr53720915e9.9.1736419080138; 
 Thu, 09 Jan 2025 02:38:00 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-436e9dc8826sm16428195e9.11.2025.01.09.02.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 02:37:59 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Jan 2025 11:37:55 +0100
Subject: [PATCH v6 2/6] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v6-2-c6af4f34f4d8@baylibre.com>
References: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
In-Reply-To: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnf6cDwdONFcg4NoVECip2enCTYPobmCH1FlW7pj0f
 vkaE7iSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ3+nAwAKCRArRkmdfjHURSPtD/
 4w4jm96OBg+7I4Hu11Al/9Y0xh9+Oh3kbilSLdnrom4hY3QZ4s7zBD3cCsVUNkid0FLAfkhsMpd4eD
 phj+a50KyeJxdLZ2W9mahlJrExdjQhYo1QuiMNzOwvUhb0setLby8V6aFbs6qcjiHddZZh19gF2OL5
 IJwG0L1WBP48ANNIByya4m067yxpJr+JmuDQbkRVFtWB9oXwzfAkL62i2nYaiyA6tWQNL/q12MGydn
 cNcFzOWckYcGQWzG6MAM1XFekhLlrawheg/eYFMYrHD+gFX9cCU35y0+Go2MnFzYW4y7llOcVjwBOP
 vlLLQFuys/YltGsZ+2K/Mw2hrUO9PFHdQWGvnRfIslGH6jIFVcH1nJ+/FhHrpC6mAc9b/VlTjxjMTF
 5zx0MZ8x4SKVvYp5YpnmmAaryXjax2HWnGX355TxNOb8JQLf0Su+Cb0ZbckN3+9FpOqwmTg2Ga0PbU
 k6uL0C7UZCbj9okzz1bFSMvAlWXvoQn0EicsTdbmucSljHbw4R7nCGRr+h4d/fYL1dkMpVvR5+3F7T
 GaTnq5/w5LziPJ+FE1wRHcGfYi9iTS/vNVfuFKgGNRpBKJBJFnsyNSU1bGpzHXmktkJbLimW1NpxEY
 pxQvTazZz+jDn8BL55TiOGLwoUJr8eBRA2Ioyd7Z2ctupdak/5s9qnWE66lg==
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

