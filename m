Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE29A07381
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 11:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A1410ED57;
	Thu,  9 Jan 2025 10:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lRIlbcmL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6BD10ED56
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 10:39:03 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so8047845e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 02:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736419082; x=1737023882;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DCXEkdQUkL2wd08/hMtAK7d558exhzf0emr4McwTqMY=;
 b=lRIlbcmLWiwrpSsKwiq3QgM4iGLopAICoZRLCR+2rNRRQ+m/oiNxqth4AfCnc1y6il
 wFz8bWeUAw+cd5H0gR79/r6awAipJ2OLg7YVZzpHlWujAr09R88wNJ7umXLZHy5tc0Xs
 tv1gt8TE88q3Jn0Dg+rjTnZdoZW56t8ekd1/I3xXMlvOkbqEV20p8QPEmysT2TJNZfHO
 5lhbLwFeLyAJyeoRKE/f/3ILa8XzSW6pbOtAD+Kl8zITLEs/OcjyFBnBFI8BTrWUvpgz
 hb9KF5KfC7c2ZQSxRAaKTKVHppMd8HoFFeOEBp76GFOi8Dfa3UtdTU7vVDXLi62N5xES
 IZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736419082; x=1737023882;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DCXEkdQUkL2wd08/hMtAK7d558exhzf0emr4McwTqMY=;
 b=ecGX38LKhRUYIb8ZilHjzkLd9QlxKeCprWrI0p6uDrGfDtwAqegPvy1w4iw+6qPcJ5
 LtUT1d6XHlYGo3lrtMafQxb5Ey/gBngz7hu0fsgim0/1vlHtf8ORoyHkO8zbA7pLqE/b
 O2r7DFSYuOkl3yOKCg8nvue9ygJRwZwpAm5DSWmcjAjlPuVGx1acr6svoVnrUg0zsEiX
 zB5gKKem4WuZoMTaIDmCtbfD2a4i5vEepRpf7i73cCijkn30yazKl3t4HwnvglmTk3ON
 nGbZT51RMHXwFDhwyes5Xhbj0rpbgVQd4LAyn0EqFsAVWlLUFjGZ2RuMlreun+h2fVxH
 JnJQ==
X-Gm-Message-State: AOJu0Yxpj7DC0CQAnxs/FzYvROyIi3zXW4kNzxdWV+fQ93ncchGOiNpZ
 FaFK3QnOR9fOFAdvTTrIWgibzSnnF1uE5zBmyTEZasYcRlkif7SIOlncnCYoGRA=
X-Gm-Gg: ASbGncuSoZS2aoBflnAvRpM/pD4a/5oPBdnbFvIzMLwAQtVSKjLy1QPFOYB4QKGmHcc
 sxK5tGQVG+M/5ErWl9av7rWIv9gGwyMEBHcVKoXuFXR22zbeVCfFphuS4EebFlvAFNMMFglGoog
 OumJm9thPihq3o3POerPR5Tpl/V35NdKgjcQTqEt6BRAEczZu1ZPeFE9C4i/6W5A1TvywHn0/WS
 NELbtkZuANo4K+9WnKqSqGS2re10jOD2tGACg5FwNpWYmHDY0VXXM4eAcA=
X-Google-Smtp-Source: AGHT+IHDqk9Dn/QqIZHU6jgykmIRsxf9NASNh5jt9YjZTPMmzwA2ZvT2ZXMyssDp6F9Dcqpt/13q0Q==
X-Received: by 2002:a05:600c:1c8b:b0:434:a852:ba77 with SMTP id
 5b1f17b1804b1-436e26a7e1emr61442675e9.15.1736419082410; 
 Thu, 09 Jan 2025 02:38:02 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-436e9dc8826sm16428195e9.11.2025.01.09.02.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 02:38:01 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Jan 2025 11:37:57 +0100
Subject: [PATCH v6 4/6] arm64: defconfig: enable display support for mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v6-4-c6af4f34f4d8@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=884; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=5LcQ4cCyrjtrBHi+BM+fpfBFczkCA62rUsdMrSt+Gvg=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnf6cDT94L4X0YgQPmvNBZWcAPwVjpeyziQ4f7xGFx
 12bbNdCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ3+nAwAKCRArRkmdfjHURfIID/
 46lLcLh3k8s/bf1kjHlDFKxQYXHfHNEk+fM0kc/FCBgx/BsY3Pqwg5Xxop+5OsozYOirZeb6Pue8XR
 MYFlq2xGGOhzoi6L6cv9U4D0aTPkyRAyotixoFwXz/vff51ZwS7HJbjE6lyv5LVw9Om+EDHfpv/Ri5
 fcvo32f8ArHOWrw248Sq83AdKC6Rb/4oEf9NyEjCNhScCnoniayIQhsEvX2AnlGWRsk5SCFH/R3YAl
 qH2wsE4mXIR2n11/R2OSbSVJPRQrJW4r5zP6thvZyO0tlHD6c4wQIB+f8xkqEMI7rpTMIvIxyzZwcC
 /+K24WvmfO/rVeKeAEI/ZXh0kwYFmR5RlWlCBJEzah3Y7/HmnFGmHdZnGtU13PGuubeU1yKXBQeRoo
 kb4auVvR8xbDwifrB5Rd3Rcdu45OercclIlfXA3SFsPqmR5VsW2Osvlhj+Bx1J5HLvHv5c5gu1q7Rc
 UBw5z5jYRnBN9jLagFonr+sdNAabpWx03urz9/Dn6OHhxjwG2Gyi4opLY8Wj++uhF3vXa8pX0EGUpo
 PrbUw7qmwh2ozUnc6YqBNjkGy/uMpHjS9XLUKh9HowiZyWvve+3pPsvCh48F1joL0yS3VPIk+jvWU6
 e/eT7KD81nVSxjVNX6sTAW6Wo7/o4ICmWbBJ4BvUfK9LkwjnkH5G4YnoPJfw==
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

Enable the DRM HDMI connector support.
Enable the MIPI-DSI display Startek KD070FHFID015 panel.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e61586..1e2963a13500 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -897,9 +897,11 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
+CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_FSL_LDB=m
+CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m

-- 
2.25.1

