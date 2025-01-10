Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FB3A091FD
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 14:31:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580D710E505;
	Fri, 10 Jan 2025 13:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SxXElUdz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282EE10F0CC
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 13:31:25 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-436637e8c8dso22242925e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 05:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736515884; x=1737120684;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fy/DbTIkkOlFt9RUb5dJSds3N2C+4xTIp3gr3Wl8Gls=;
 b=SxXElUdzQiz76l4Ru0mgwz/WxaeaoknugqI3vVFH1YNvTuwWI4rsiX2TkT3hpQhI58
 GObNi4ZpdOhbux2K0jWENjol/SUHMarcHa5c7Z40lzm8yNt53pd3LKBzvfXrp7xCKFzR
 Zb4No6+e/+4gpL+toMizLfPaAVHaLdeGV0/8AVuS+loLUBR2CzpI0bwtnL3nmkwAHhUG
 1WhI03pgE9Pn03xRQk/IbGkRvc1pHVR5sw6n0SvYaiEjj8kmXyQMnSVcCG4BNAp1ap0l
 0YekRZSs02dcNTYUmbzyG2hBDQ97UTsxLlQR8zt1rrZYDZb04C6WHtyzGBg2s5G/lYIB
 S81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736515884; x=1737120684;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fy/DbTIkkOlFt9RUb5dJSds3N2C+4xTIp3gr3Wl8Gls=;
 b=FLRI86SpC5hjl2B9Ke9Tgp/Y/B1BTBDWdZKNi5QHwSmHfXlGFowrs2ISaXSQj+XrIb
 t4TLDn+xApfTJlDw+5TYdlDaJAzUH87YzlYm03me4isuaDKd5klA3mDeLcP8Y7t9iGOW
 wvUengLhRWBfUUNqwKCQMwuEQb0hwzsZ/M6fE16Gmw6TbE4uJ1u3Z0Vcea7tYmD6NDH9
 6xeBYv6eJqTokMDntip4Jb1vTZRoplmxSBuOybFIBdFZKvb8rVz65TcJ1uubW3vbAAPA
 tSWyak+oNcHlReqNYsHL/3T4vMPpmXSHvSlUaxd5njUCm1o+4VI7GGzsMyGKG1DDFrEf
 IPMQ==
X-Gm-Message-State: AOJu0YyB34dUSySrB987AIqY7p9kN2FisOTyu6FTpM2BLGPa3jqq3meu
 T5u34qHntYnXCti42rFnierrLCgYPr7eEXjJhafvObijm6Got1WgHGkkySTkpRI=
X-Gm-Gg: ASbGncvC1ZVmm9ubgtIDz710j+yj/7S5ZASZgJIXX6t9tCXkQttyqXuBkkwIAzT98JG
 iVrxOwG9iKjAoH+cv5oKpkrjf2vyRvS7drKxB2JnyaWNTNV9ejNHarmsMPfhuJ1icuP8XmCUIFd
 DZrsd93tlgL7AmRkKK4DNKL5tVi9XqCHImZLHE5r2YSXrTmrTO8g+JuSGurj8QHjbAWwQyKTjJk
 Iqc2zgwF1TEWuM2KRnMGiqafaGD0VfMFxH2N1asu1VOKlTf/hKlVRETQE9D
X-Google-Smtp-Source: AGHT+IHKxpgNUmOUdkrc6PQxJw1G0Fu/KYCSSNNFr/GjW9WVuFsnr7/fR3quCBLX5bmiMLZjyBIZ4Q==
X-Received: by 2002:a5d:6c6e:0:b0:388:c61d:43e0 with SMTP id
 ffacd0b85a97d-38a8733b9e8mr10763857f8f.48.1736515883672; 
 Fri, 10 Jan 2025 05:31:23 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:2555:edac:4d05:947d])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38c990sm4598193f8f.56.2025.01.10.05.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 05:31:23 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 10 Jan 2025 14:31:12 +0100
Subject: [PATCH v7 2/6] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v7-2-6703f3e26831@baylibre.com>
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
In-Reply-To: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBngSEn2Qf8+H9Mmsv7OXpjVxiPUD7Yjb1fkvT0Ur9q
 aV5CbwSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ4EhJwAKCRArRkmdfjHURTGKD/
 9Ty+ydloEEvoD/Kmij1B/CcQVBe6jSd5+V7KY6pP8cX3F8EGZ5DuX1JRDTw7n6qr0v8t5hMj3vnD4y
 3kcOdro29k0f3zDbIKnPaldi4Xooy7mth7N+AIF1rG5vrhs5ZwSXy274aJnNwjbi7F79VQtY/ED8BK
 JMCyF9De60OQ05V2aA48pVLy+YKkoTMB1fGsR6iAmSINWJN1X92qBuivVZpp0sWhjFdllJnA8EGdOB
 zeRPjNyx0Jn5zrNjYnHseUpuZ8JbV9nWc1zccvD4gVGxDasxqANpeJ6v7srfMCEwDX2lMGQNFqD+V0
 ZVV5PnpcIMWPEmo8Fck7WktUnlvHLppVhOl9ZRJ7J5kRzjvt2n/EvBzUojg2t79aKfTJYm5GDHc9lY
 dWUW6TSq8QSfjkim0hcDojluxIR6FFUsBBYOzXqvptNZr4r6+P2ebaPBNEZBW3T59Z7+AezTXsmLl2
 e3HorWswN5WkZpMRCxFb9n2o9eYtwQs5vTRsS/8hVwnwSpM6d19kGVflYfRjoD9dsS3mhncHZzuDXm
 aSQEe+FxnEU0BZDAdK9ISk1MmLJHWsiJt6V9Ugiv0vEh54yST3DsiO+1pgpS4KQ+yI92tRmf929/4y
 8Ylibc+sqUSryOVik5cnV84QM5Y3QZ9+THVZUDG1vFs6e5bdZDV80jGHCO8Q==
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

