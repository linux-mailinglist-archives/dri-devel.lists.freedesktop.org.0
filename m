Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7338A9C85
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1CE113CDA;
	Thu, 18 Apr 2024 14:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="skyIq09C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322B2113CDD
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 14:17:33 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-418c979ddd2so6562245e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 07:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449851; x=1714054651;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hFmw2QUwgoo6nZ5hxL4W4XLY0gvCpX+AxZ6V2ssaQtQ=;
 b=skyIq09CvAHRnaPkmLR9CtFAcvKiuXQos/reC5aI9ekkmNXR2pi1fYuG7RfEuE35y1
 Jns8mfCMJIr9ufYw0nYFxxbrZ8Vrk9ZY/qrmAkBJVxB0Mpr+7wol+QBxquztSzZVQddg
 hFUlZ6xLpRQX/LYXIYfd+cp6dUadS+M7eH+hLdf+edObr7dqAuaGee08mOe1l2f9MUsf
 R6XmShC5QYr1XtbpgWKiS1MgoAFhZSpc9INFdpNb46lvrk4faLznqhX6mCivHeOFv8yB
 LfVMZ6V7jXJNDjKsrbUYLgbB33uKJuGtvnyGW6heUf7YRXGP8Lr4wVY9ZNazpE2Lzvcf
 OK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713449851; x=1714054651;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hFmw2QUwgoo6nZ5hxL4W4XLY0gvCpX+AxZ6V2ssaQtQ=;
 b=NfsP1qYMZ4qM4mXv0TmqkZ+ytE9WaqfIoEP/cZYtY58vbXmVkCr3yHpW8DzaygnxDB
 YvJ/U2OdiggLEgy8eNaSj33zz1dNddsJ3HuTmzDLXpICSim0mla7lByw9JzgjtXXRPhO
 hs5NVV3b5d9DIfLaoju3lxc1B3nBIy0XTm6pfhpaPnMdiG7xy39ZJZ90Y0010LLWmzAa
 ttccz9Bc/wUICNQUaBuaWMoiTSIcd0zj3GqjGMMC12ot9gSJN5E8Ghl3zobYtOFOw0fT
 xncIjClKXIs5VIb/S5f07UTOoIljRl9NdGn/aYnhxt6cjlK2PIKHevObT0YN395AYqne
 G9Qw==
X-Gm-Message-State: AOJu0YyuFKuwo/zGDxrOcJ3nuShhOgkX/yA3dAPziceRG6cvVEfVu/wl
 Yq+kRAvzS+keiDTdjALuXJ/SZA24FtMWP6e/Sr3e10vFnh0NipGpOFHkOdMjDkU=
X-Google-Smtp-Source: AGHT+IHtNCO0sT/PuF83nF5pCjl0HM21KlAZ3i4WM1ZCheFdqhUBy0/ydJhAL6oh54QPdztAbJgG4Q==
X-Received: by 2002:a05:600c:45d0:b0:416:902e:51ac with SMTP id
 s16-20020a05600c45d000b00416902e51acmr2889189wmo.39.1713449851402; 
 Thu, 18 Apr 2024 07:17:31 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 07:17:30 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:17:01 +0200
Subject: [PATCH v3 13/17] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-13-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=2MnuLxaHZbaJPVARTKFt1rzwpEZuIuXZwcM1ZfvOkrE=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStjyt1Phgb317q5nDWLxlAExPeDpj0mMTjN61F/
 BDu61hiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYwAKCRArRkmdfjHURaLPEA
 DD28UlYK6wanAEBb+/8HdIb9cDlvSkVu3mDiWADx1o/swuPpU9jbjySikAfXKlWCxzTgzT6lutDaj4
 vIwXpt9XbpZrbPOG+Tget6ptvQdD56G/OEcCbmm1YcvFVbkzXPdJ3vVQFPqVXskpbigxF5lnTntCAa
 FJQBnbFS30JMcTpBUpIq4SqW3JtxAioMKYcOfbpuv0JJjDgMImsgZ2NqsTPUUgXkgHU9pqUicDNziB
 tACcMWlHs8PPuZS6x2RqA7e0/EfBHs34gTsyTqkpHBRT73N831a+A5oE9kND+dcMxjwlmefeXMOww6
 4gQ1U2T7DSkeS9yTVYR8AsbEM2cBnbhFXUw2c8v3kCwjdrNxllliUSuR1dZnhNMUbd3rmtslBJPuIn
 PEUcsmJemYKuYCBtvx1P/a46vhGIOLSpJnjVsfnpC7jR7i/JQnirmYHsrdfDs2mG/tXihgWSq+4pMq
 7dyFGV0egvh21DBo2c4YFPzgoOhrGzEqsqStXbC4VLcRpewhHVww3ZPEqrx+WEby4Cyxl/W/VCSRnU
 rYMfrRhVr8zR2tUwjXad+n2EMdD7qeI/xHaJHhfjOEkhi2VDhj0pA9qUpXhWYd4XxabIlQYtF0gP2+
 44HrHaDC6UD1n4NL298nlac7LHpz0tj5kGjXtmURjGBcutBuiak9qpaBctZw==
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

