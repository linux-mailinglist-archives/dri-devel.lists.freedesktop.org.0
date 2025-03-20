Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6050A6A1C6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 09:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873EE10E5A7;
	Thu, 20 Mar 2025 08:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XGFI52a9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88BB10E5A8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 08:49:16 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso2961405e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 01:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742460555; x=1743065355;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YJV9USVZmsP9ZdAAuuoldoMM46JkHDHsnIzVnX7GtUI=;
 b=XGFI52a9c3S7dEHazeZOQtzczFy+P3Nn/fpwTj5W7R30dnK6o6fsEbvzD1RONcQoGj
 tKkeQ2us79rSxO+qL/xrgB/DIHhF3aqXhRx2920jypiuh0YQN4JGW69XpQhPjhVKLa7Z
 MDE4JmDN2gmrVUz3ivWpS1j5SvLctP141TY+NmkrCK4a0mBz14BGmQTWM42knA6wgeu/
 O16uyZVvoopTf2c8QEUywQBwaR3IhdDgWYryxhYRMT4mhnWrd077cZsrXmVNwgfYbFr+
 uiaVxNEFTBiUEcULke2OuOcp1IC5+xY6cug7i7g7p1LNb2zTULiHEWKJJ2WBuCgodraF
 fCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742460555; x=1743065355;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YJV9USVZmsP9ZdAAuuoldoMM46JkHDHsnIzVnX7GtUI=;
 b=XcTXmFT9rUvGCJgVbiC99CC9CKzr7fMcJnE1l2NDcpNnD5Xx2lkfeHseoUxkfuwK+S
 y0/uynhcTkVFYddqWBuuBfNszLQGplA+nAyw49y0gos05XsQqI772zabX0vtR7JjdE8D
 gu+aOxA0ZymFwWLJen2u9pg+01gngUPWQMiMadMsE0nZXJiHuETRbt2RWN62Sj2cQ2bk
 YDrclh6zK9xoXviw6dE0IqBLmu6BLvd8l4mNA8fNmIEdWAVlkI8BO54BOkRzUggfzKmN
 HAmWbdvd6HkdaNTcaBQzsmVZZLO/ZJXP1zqpy/q7MO/ht67KeVGkhknylQgGcYxjVcup
 WFmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiNqgWqVP/hQP9+nA+5uuBmfn7ut4WzJI+WvFuQUXlUz8PPPHbtHbxxtjrK8iELXqRDwVke2YtGjs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1g+ijq2Zz2qtNL6mSSKoBKQvczKEKq7vGMNiJsnesCN6HVUIA
 tLU5NKzYMeqbaNj0JKdY5XjPvdS74Nm7Kshj9glv5zlwuto1lcFULycuy2LvjHQ=
X-Gm-Gg: ASbGnctn9P+kYaTgnLtC59BcoipAbEMxSOqyzMJsvvecX/Gys2Qg7EM+l8FwvBjNIEe
 cT1Uv5sI/F22OlS9oyLfAH4Rux+OI6dXDGcSOLRsMszo796eiQvdPNhyrQZ5euSxF/3nn6zZNFt
 tOJFOwEp8QHwoR6fDP9b8i/AbMvdSw/xwDXCe14Avf3utNwVHFornknaxQtDSNFavTzDubexvCT
 Eb8+rLwxI87Odey2cM05c/z12Ka1z6ttd7qKdCt198q1IZ8b4tKry6nx76Zd30YLZlVhAH45NdG
 EDzvZNkva5N2vIPlCMqt7G0fn2K0Z7OYkPvsou+mDsFqVdcbnnmWQxY02iY=
X-Google-Smtp-Source: AGHT+IGvyzObe3HUgUPIOkcUmHLI+6xANcIGJKxeOg9jouXNulvNZlxlIH6nFdT6PpdEkn3OcgskSQ==
X-Received: by 2002:a05:600c:138d:b0:43b:4829:8067 with SMTP id
 5b1f17b1804b1-43d4ac2b356mr13977715e9.6.1742460555324; 
 Thu, 20 Mar 2025 01:49:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:c11c:487d:c821:54a0])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43d43fdac9dsm41381655e9.30.2025.03.20.01.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 01:49:14 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 20 Mar 2025 09:48:46 +0100
Subject: [PATCH v8 2/3] drm/panel: startek-kd070fhfid015: add another init step
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v8-2-c2dd7b0fb2bd@baylibre.com>
References: <20231023-display-support-v8-0-c2dd7b0fb2bd@baylibre.com>
In-Reply-To: <20231023-display-support-v8-0-c2dd7b0fb2bd@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2311; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=gHl0LdUTqSzXFqfH/bwqt0Qp3EzE+6UWudOR8k0D9wo=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn29aHBpzXiGFeZYZjQ2WV79w2etmusdRumeCDA2/j
 En4xIveJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ9vWhwAKCRArRkmdfjHURUS3D/
 9vN0KMVYZZKmprhPA5LN7rawwuTGP/uyEhk9jFV0/j6JL6U4PVd0nArK1OQLjxBSyc8nUS1QhpHFhL
 GNVR07l6xuu0efimjhIgzKpfapyc0xJDcsSLokHgtrFYnnFsxhYNegLt2qFhQnAzfhs6CkD8JQRe7j
 K5ZiuZbQaE9rSuPU9dMg9/Nc9+eO8HpPVfckzLWretHlNh7yz42U0FAUp9KvfnDilzIcxzydGuuNzy
 Jd/N0DstuCiy80SPtbL4cE8FVcQZpZe5jPrx+mMVIUtyaVPTkJwyP++ureQvWDzAQ334cDPfrwy2Ei
 Oeh0VnncqzOktXqxToMmHFzuFwKfoDr0/6LV+dlVtsI2RP/3/bW67t8xKV0I6eMGMGESBck72W9vwD
 ca1+TzhnFFesumJlEkaj/XnlS6mvr4PPLAaqauBwaKTiAXgZT/btqNWTVJBx+sYj3/dyd+1Sy0NtJ2
 lpmstf0PEKIOMLotSfh7vkJ/+71UqXjgjVbmV6k0f1lgMLHIpGEEqNz/Us0zURzuYQEVwsj6cFRsyw
 W6Lz1Pgec4nQ9wjY5aeCuLQPAkLl9D87UWlEs4SeCgePB7fs9v/PogO0y5kTxHItyjqRqV2XGGIAxe
 Lu9b+dTaPTCrjNEDXVF5nGl/HyIMiJ8yrA1aWPFooOUtSOMg18/vt4NOuirQ==
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

Currently, the panel set power, set gpio and enable the display link
in stk_panel_prepare, pointed by drm_panel_funcs.prepare, called by
panel_bridge_atomic_pre_enable, pointed by
drm_bridge_funcs.atomic_pre_enable. According to the drm_bridge.h,
atomic_pre_enable must not enable the display link

Since the DSI driver is properly inited by the DRM, the panel try to
communicate with the panel before DSI is powered on.

To solve that, use stk_panel_enable to enable the display link because
it's called after the mtk_dsi_bridge_atomic_pre_enable which is power
on the DSI.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../gpu/drm/panel/panel-startek-kd070fhfid015.c    | 25 +++++++++++++---------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
index c0c95355b7435..bc3c4038bf4f5 100644
--- a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
+++ b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
@@ -135,19 +135,9 @@ static int stk_panel_prepare(struct drm_panel *panel)
 	gpiod_set_value(stk->enable_gpio, 1);
 	mdelay(20);
 	gpiod_set_value(stk->reset_gpio, 1);
-	mdelay(10);
-	ret = stk_panel_init(stk);
-	if (ret < 0)
-		goto poweroff;
-
-	ret = stk_panel_on(stk);
-	if (ret < 0)
-		goto poweroff;
 
 	return 0;
 
-poweroff:
-	regulator_disable(stk->supplies[POWER].consumer);
 iovccoff:
 	regulator_disable(stk->supplies[IOVCC].consumer);
 	gpiod_set_value(stk->reset_gpio, 0);
@@ -156,6 +146,20 @@ static int stk_panel_prepare(struct drm_panel *panel)
 	return ret;
 }
 
+static int stk_panel_enable(struct drm_panel *panel)
+{
+	struct stk_panel *stk = to_stk_panel(panel);
+	int ret;
+
+	ret = stk_panel_init(stk);
+	if (ret < 0)
+		return ret;
+
+	ret = stk_panel_on(stk);
+
+	return ret;
+}
+
 static const struct drm_display_mode default_mode = {
 		.clock = 163204,
 		.hdisplay = 1200,
@@ -239,6 +243,7 @@ drm_panel_create_dsi_backlight(struct mipi_dsi_device *dsi)
 }
 
 static const struct drm_panel_funcs stk_panel_funcs = {
+	.enable = stk_panel_enable,
 	.unprepare = stk_panel_unprepare,
 	.prepare = stk_panel_prepare,
 	.get_modes = stk_panel_get_modes,

-- 
2.25.1

