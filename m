Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51353941271
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 14:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C4C10E51C;
	Tue, 30 Jul 2024 12:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gUs9Q2vF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B34710E51B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 12:50:43 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-428119da952so25961965e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 05:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722343841; x=1722948641;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3moEF5UgUPlJrvGfGCZqAdn43td07ni9TXGHevs5IwU=;
 b=gUs9Q2vFjqZbjx2vDSRZcy8Was9Sc1mJ+XMWk2PIfgIkwiPJCvnNcDXsjduK0b4h5M
 hRfns1T7vArINWpbog+QZEq3t6xPRnHyEsePxZnfXwBsEfSz6RyHDSBD7YboU5JlxgLy
 v2zNtkS1W12WK+FETgkxtSCg3mU3WD6vVzdDzG/8IGKh4NmAyBDtT2nXP6oWsTRSXzyC
 9/wu2LEAnGMbAK2DdTPR0x2wlWPKtT20zhGg8TGuxRmxD1CkfDDHQcULittpvzbCWuxL
 LcnV/sP6i8qsDsW26Lyl5z7iu46BluhNYn9DkEoHpYUDdvJDIAXhD3oLeb8TMRhEd/i/
 8QJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722343841; x=1722948641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3moEF5UgUPlJrvGfGCZqAdn43td07ni9TXGHevs5IwU=;
 b=DSiXEQrqZ8dm6JCROp/D+weMIkGOYjKkT+w847kPIvTr0mf41enJdUh64y2qbLdcej
 7JNxlGE+0hIGQn8P/DFxrlmocQra2tAGAazdF2ERoRHgwgprCeVaJRiids0vNpeZ6+oz
 Ft2Ezm/TtROks2ZA2VfkV1v/NkZ/Ayxd+ajqhS3FuSr2pMB1NyhpsKm/jUtP+cPqxg8T
 G5LeN7n/LgcPNDhcZqp8aAr6NazhaBntKmK4Q+dfGIei/XreLScxS4+STPUz8YUn1ucy
 sAb31j5sAWqDA8ZTwVOjKJ/PlmdqzQs/ELCn2jpRO/Tg5RBNW6mJ4+L0X0Ie5Ib6VdC2
 bHkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9PhJbfQnaCDfCzCjEBVGZvFWWS/XqGwpcZnGGidm6LzeB9ShPm9afCLdgPF4qNwxC0ztf3vQx/sWyACH5vU0s2Ti6R0HRwj3rHHDBIMyr
X-Gm-Message-State: AOJu0Yxqyb7DKWTjqJ6qGiIDvbpVUu1dUBabMxBPjF4W861EbTmHJZ34
 ZtUr0Bq/DMxzUqVb+UoGMM0Q0AkxtDyBw73T1bP/bFPAWTYP9gBsKmy/LRtQc6k=
X-Google-Smtp-Source: AGHT+IE4w+wikVhp2vCBwTP2wSRMRyso4c+p6a52Ji4CPU43wbv4hy3g2InI/NLX3kHSQY2Kj2YIpA==
X-Received: by 2002:a05:600c:4ec6:b0:428:1eff:78ec with SMTP id
 5b1f17b1804b1-4281eff7a44mr41585485e9.18.1722343841397; 
 Tue, 30 Jul 2024 05:50:41 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:291e:4a48:358e:6f49])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42805730e68sm216521405e9.9.2024.07.30.05.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 05:50:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH LATER 8/9] drm/meson: dw-hdmi: don't write power controller
 registers
Date: Tue, 30 Jul 2024 14:50:18 +0200
Message-ID: <20240730125023.710237-9-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730125023.710237-1-jbrunet@baylibre.com>
References: <20240730125023.710237-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
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

The HDMI phy has a power domain properly set in DT.

Writing the power controller register directly from the hdmi driver is
incorrect. The power domain framework should be used for that.

HHI is a collection of Amlogic devices, such as clocks, reset,
power domains and phys.

This is another step to get rid of HHI access in Amlogic display drivers
and possibly stop using the component API.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 This change depends on:
 * f1ab099d6591 ("arm64: dts: amlogic: add power domain to hdmitx")

Time is needed for these changes to sink in u-boot and distros,
making this change safe to apply.

 drivers/gpu/drm/meson/meson_dw_hdmi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index ef059c5ef520..6c18d97b8b16 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -111,7 +111,6 @@
 #define HDMITX_TOP_G12A_OFFSET	0x8000
 
 /* HHI Registers */
-#define HHI_MEM_PD_REG0		0x100 /* 0x40 */
 #define HHI_HDMI_CLK_CNTL	0x1cc /* 0x73 */
 #define HHI_HDMI_PHY_CNTL0	0x3a0 /* 0xe8 */
 #define HHI_HDMI_PHY_CNTL1	0x3a4 /* 0xe9 */
@@ -423,9 +422,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 	/* Enable clocks */
 	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
 
-	/* Bring HDMITX MEM output of power down */
-	regmap_update_bits(priv->hhi, HHI_MEM_PD_REG0, 0xff << 8, 0);
-
 	/* Bring out of reset */
 	regmap_write(meson_dw_hdmi->top, HDMITX_TOP_SW_RESET, 0);
 	msleep(20);
-- 
2.43.0

