Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CB18A7050
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 17:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA736112671;
	Tue, 16 Apr 2024 15:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="m4IxYYo3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1C310F19D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 15:53:41 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a450bedffdfso583334466b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 08:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282819; x=1713887619;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hFmw2QUwgoo6nZ5hxL4W4XLY0gvCpX+AxZ6V2ssaQtQ=;
 b=m4IxYYo3I822+Zes3N+e9nfC+i/Tu6Gks9HoXxH08HPj3LM8xWSMJVKPb2CKnagr54
 TtyZ4uoZGQyQw+QB3ii/6sm46DmzbX9I72oNXMc4I7Qw1MdVJX/CCmK7dHJsTRt4uOrE
 U+Y11+Ee69zFIlB9WAjStMRLPFbUlvfsdpiWUYsGeErP5Rz1fNWFg32ASIQWl6X7o7tT
 pv/gthzvE7EcZVB0Dxwj0BCT8hKWloFLZSzTH6NOQOi2WASHPkrLlZdD4d0V/DRfI7IE
 pF0ZH6nSceBOc53jQahb2/HJNPs4kuoA20894UU7NJpsbrY9i15+xHpiw1MXEn0MFaLf
 /XWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713282819; x=1713887619;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hFmw2QUwgoo6nZ5hxL4W4XLY0gvCpX+AxZ6V2ssaQtQ=;
 b=opwtK1/AWJB+AT2tp72YTuhcFlmYaMh1XnNpn7QNyrqnwJt0dXBZ8zzNo75SRFC4Br
 ac6s3Rx4Lyz+ZgB261xrAxk+Ojjujqmf1u8ae19JCoQ4flX/+fULdaXjPP9MfHln9tDY
 rWLQFyoKhjS/TQ7BXE3EJLJ823yzgDW5pfSDY85urY75mAQJvlPczWXgTdKqF/Pj9Hao
 FwXGg44SbvsaJ34T8t7nYTGMXw+0BnDkaWV8crCrjAsoRM5dX4Rud26/+zsebMGzuiY+
 9tnFdpCX2h2VefxrL3pt275HzVwtiB5X2c/5BvcD4EaEMvx5H66AA6s6cRh4GmTblidD
 JBlg==
X-Gm-Message-State: AOJu0Yy7S7EQnOeteXAR+fArSEzeeAJTDBUD75mu2Ft/HAqF00VitU4O
 aOuV6u4MGXPdH/yCBlNsNZCnSs5fKBR87AEqI4GsY3Zusp//ub0xLVQLXIKUrfc=
X-Google-Smtp-Source: AGHT+IFLuDathaTJ/JKT8tzf/JfCbHfCCiKvf02dGKCca6MyDMPKZyO9ZLGIiBsYtjUEtqmWCS3Ycg==
X-Received: by 2002:a17:906:d10a:b0:a52:71bf:2c4c with SMTP id
 b10-20020a170906d10a00b00a5271bf2c4cmr3533190ejz.0.1713282819612; 
 Tue, 16 Apr 2024 08:53:39 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 08:53:39 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:14 +0200
Subject: [PATCH v2 13/18] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-13-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=2MnuLxaHZbaJPVARTKFt1rzwpEZuIuXZwcM1ZfvOkrE=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qd8Sx/coFLTSFkDfsduMzD+AJNcJ4tDhOCv0h
 3ncqyFaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURdFBEA
 CJgnEAdPK62hUZxj5SmThZ5GkBCuZIyk3P52tbmYtB+jyZS+Tm9SamHgXoImaoOJxr2c/eLN6dvvPN
 RXqbf2LoKutEccLUvet1qjcG1VQ3Y97HO+Af0mpbAIXcckeiQWZEQAuASMUTjEOpyc8WYeFadNOFWY
 xpVRY+nVMyYX5MTFxrqlCzSgB0RGJYQnily350VHOpioNsNSS+M4n23mW4liEOaXow+a08pqBx4hC1
 ARNjftB0eGqrwymHP//U+jEA8HFu7aOnmkeqpQf1wv16F4hsqhDAQNxlaAe87s1p1fuk2E3MzMShm3
 h5C/GK45SLykya4NZfpzz8sFaln1av/ogexAQ3L64zlC8WrZapNXaf3rbnt5wH41KWvP9jCZGKJ/Eq
 liW/EqvlQGqHX+OWDejwMbtuxVdsPwBpQ9pVZiyzEjlpLz/aXtSl5NxFI0Tew83KmZbSIwrECeoqyU
 snhRMJNiEcf1Qx8EWqsQzdpYLd10GadAI6SF8toslrmcGUnlGAnV25AmCD/a48L6hKuAYcw/bO6jaF
 DfhzlGkbVb1mxLE07cd5xEqQqLpQljHkx4YqwGO5ZhFc/K3ECQ7xPQeeGlB1Z9hz21ZldwS1U/3tr1
 sHz2UEwm99UXyQnV+OmKp0j0n4LYTdJazChU72qVtzvtZca+boZXyAULWhyw==
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
index 9501f4019199..b3f33d4d3d5c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -642,6 +642,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	mtk_dsi_config_vdo_timing(dsi);
 	mtk_dsi_set_interrupt_enable(dsi);
 
+	dsi->lanes_ready = false;
+
 	return 0;
 err_disable_engine_clk:
 	clk_disable_unprepare(dsi->engine_clk);

-- 
2.25.1

