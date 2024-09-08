Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7160970816
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 16:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFC510E280;
	Sun,  8 Sep 2024 14:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SxbV/3/p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF2E10E280
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 14:21:48 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-374c6ed1af6so83353f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Sep 2024 07:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725805307; x=1726410107; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tqwhJtSpVBRE2P+yWS/8hgOJL8h+VSv3t9HsbyQZCr0=;
 b=SxbV/3/pFfA9+DPPAtiX9S0F5RyeNa/kKvaC6UNt4WrbFJeO6PKNFY7QdH7i90sKNB
 iFTFZMuuXmTAb7sbua1qD10Ns2JX+lb5kUn8dBzNCEM0yZgiEkam43D0GqNRI13r7/UW
 j9wRPI0g/V/wkZPJRvjKbPa5EfqIP48raz3iC+CHuHEU6/hPqLL3uA4rU2EJlqaN7+UM
 tMytONJX4KK2BW692sbhGtbKrwWBkoaPOo5EuvjhuruOwdKqcDIYXf6u+4AshezdW5B5
 aT/upEIR4RCGHCqA90+wQQx0SAOihPStxkzu8s1+5S3RPQ7TVFD+YZtljQMRGCekBvSs
 7rUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725805307; x=1726410107;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tqwhJtSpVBRE2P+yWS/8hgOJL8h+VSv3t9HsbyQZCr0=;
 b=KctoXlHdwhplpxrg6CDKice59T6kClt4NFtstYL0X+GTQ4Md1ebXW0X05RU4T5ZGIg
 063DSZl8yNYovFoateHVtq/gwzbhVUp8TNiNnYfQFPy7WyCU/ZX4Mf9IBvNnqZtfWArq
 jbVHashF3mfoP1DBFCxK/C8fi7xX9MTakCU/RrEKpLXlcIQZwfnwO+2rovim/KVT71ht
 HwNb6FbYFpvv90fs03X2Yuh8ELcxw3yYag+mUUcu22Tg/GUVdY0C491+kk4TUAQt4lGB
 aw6qJfunpV3MVviBIzzDfCQEcrgOYULF6c+f29X4SiAanLy4lu89FXwo4Z74CkNrOckO
 ofew==
X-Gm-Message-State: AOJu0Yz7xYmCGuIpzp7YDtqgbxUH/2OB9KYHnx6wFGApwK0Xv1DFX68r
 5wRS5fsbHxS8TmwGMMMIj7CW7IRw0SYk3+ajfCp96rCLW2ySPVDH3Od8cNFEONU=
X-Google-Smtp-Source: AGHT+IG9ZRq/DMRhNGgXiF+TDH9JtKI9MBZDNIgFAd+SfH8Xnqjsitbh2pFtDM7PPUl5w/VKJP4Lag==
X-Received: by 2002:a5d:64e5:0:b0:374:cef0:fd46 with SMTP id
 ffacd0b85a97d-3788964fa72mr2863505f8f.5.1725805305990; 
 Sun, 08 Sep 2024 07:21:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675bc9sm3465092f8f.56.2024.09.08.07.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2024 07:21:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/5] drm: misc: few simple cleanups
Date: Sun, 08 Sep 2024 16:21:30 +0200
Message-Id: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOqy3WYC/x2MQQqAIBAAvxJ7TlCJsL4SHdRW20MqGhFIf886D
 XOYqVAwExaYuwoZLyoUQxPRd2B3HTwy2pqD5HLgE1csoz90YjYGR/5DOZk0Iwo5OjTKQCtTRkf
 3f13W53kBHBWAnmUAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=839;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=cTToaTVq2mBf2Fn9C8i98ir1v99mJbXz1+GQpR3uiOI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3bLvNFcaXf8SGW37AV8bPzrMpFogzThXLLuQG
 l+3znii392JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt2y7wAKCRDBN2bmhouD
 12t0D/oCKBiGiFWPFsnvZbBBzS6lfNLS6Y9kmHg76mabyuHNJMF0vh1D359N4I6rnoOl0eLvI5O
 zzML2lKr9W9iodldL+NGvVQky/fuNnciPMFuiVmyiSUprJ8GbdpaFqoqZurKI18YJm7utqyRo5y
 oVfj2W2DxvKnL0fKgIHnpNTlvHunHINm0Q+5tJtb4WGdi5ccjJm7NP1lOwtbkyrRYZpVM1g5d2R
 ZYKKNey8wi0sWZMr0eI1XRsstmm5oBFK5V1kA2ShdX9B8IRePN/vxpkRZynbDx80HJpnYRCdfMX
 TS/gKTYUxj9xnpdTiaGx2K9pE9eRVVrv8FWBRYnq+PfxRtyK/b4/++or0Ib3763JRCQUTI6KMyG
 +Y9HYhCTjKq0dH72Ur2Id8SWOjrbyCTGAZqdLoQ1rZStOx3KxQE4qjKmIXaqnzwLP4vdy0UYTuC
 Y3TKFIhmMkAasktectjZjE6zcYluKkyyYghp3hKRIbYwuPOgKEjzDXH75nUHHyKLgnjxVIEPbNu
 X8LRB+WxdcYJJ7aLwXvbeTz2zvnEgFIudoJPQA+grpjUsPnWelYqnK6WeJsKKP9RAl7uqi6Cr7O
 jfzM1A05b9FHTIW+dNNbkZOafygeEjHY8eQ0tGoMb9RAA6SywaWmJHtNuRPSpGTZdy3R2VW1/OD
 g1bC0WL8WXxTFKw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

No dependencies, trivial patches.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      drm/meson: drop unused staitc dw_hdmi_dwc_write_bits
      drm/meson: constify regmap_config
      drm/fsl-dcu: constify regmap_config
      drm/mediatek: dp: constify regmap_config
      drm/bridge: ti-dlpc3433: constify regmap_config

 drivers/gpu/drm/bridge/ti-dlpc3433.c  |  2 +-
 drivers/gpu/drm/fsl-dcu/fsl_tcon.c    |  2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c     |  2 +-
 drivers/gpu/drm/meson/meson_drv.c     |  2 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 14 --------------
 5 files changed, 4 insertions(+), 18 deletions(-)
---
base-commit: ad40aff1edffeccc412cde93894196dca7bc739e
change-id: 20240908-regmap-config-const-2b6e126feb8b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

