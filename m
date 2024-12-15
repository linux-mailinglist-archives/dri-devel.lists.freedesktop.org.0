Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 144D19F26C6
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 23:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E5F10E4F6;
	Sun, 15 Dec 2024 22:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NCTYJE9F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB73F10E4F9
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 22:44:53 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-300392cc4caso43254951fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 14:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734302692; x=1734907492; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iNw+k0WbwbQcgHfYTyztqfbVpymGzpkhO633UufubVY=;
 b=NCTYJE9FVOY4dbVpzCRI9ux05xvbbJ7/Mi5Xl1BjGbc3x0vpgg1WKkdz1Mk4xIsufg
 xeh4VBSI8/sltD15r2CeNgrpJmWbwCAX8FgR1kmmMsu1s1coi9G9f7oAbK7ZOYMZ/4rt
 nsLbCym9tjbYDsJcHk1DCVqb9oLgpK8X/yIG9z6FNjcob0my2FoT8GumvCXrydofUjAM
 YaUrO1HCJLpJORZOyFQiLq8zBd+dbwI9woROFDPfH7xkR2iteNrOKWdGOO0k+ur9eXr4
 nJ2eYl7mLQSYSs1ApdzzWMpuy3DQKnlZIwdfEqj3TuwIo80nsrKq/IrAo1QgDVxxH3J0
 /ePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734302692; x=1734907492;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iNw+k0WbwbQcgHfYTyztqfbVpymGzpkhO633UufubVY=;
 b=M9giQQz7QVQewSSN+zz8J2Cg5vABsaN9SEoB3eO20W4/8I6356nRV3Ws3PL/Rrp2S/
 ysrpydXEoGMajZ4Jt998sBHQzV6LOzL3RSBSwyf36XTTlmiIOSiF/FWZaVb/JDuP1lfc
 LePKKflyLZrEJu7zkEMOC59qN5Eokil13QGDnaNt8XWFxaHwoozrPUcJdAZJ8OM3sM3t
 aEONgJNkJp5cQAuIlmDcubSQHSYkFlqN7zdGzmqHrsCGYTD5JqC6fi3xrlzVyiwgAVX8
 f+QXnSuCiUQ6cfahhFzQJUhAYYCnnuBUdUfR5GuGxWgINLh4zp8HePqjAl8sFYx7iaxo
 QYzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqzkn5YLGleGqTrsTwjGRrje6j+FG82deFR7Mcfs6aMkgB8TNfINgY9tG/tkKnz2upT3g+gUgTHPM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoTmDzvDVkoZp2O65WMHQkxxw7nx2A7tsvgZO52D87NJXrQ8it
 cNUQvWT9TiXoNg3yAWQw8UIA0XF5eHr+WdaNBZSflDKm4VfwiDuNgpRv0UO5jec=
X-Gm-Gg: ASbGncsZol4Ib3qvzSSBpZaMz/6r4dsqIeLPNyIBDWwoasksMrrMQcFEviIxrQ4AP5N
 NltE1q09Zn0cCbwy7l8KExqwSJuMitK54iWIIUrwVUblsXOsywfb3I8T22jZehvdQOJ+EPy/CF6
 6qCq91lCSQxOR2PxZlYBKcIImJeXFTyD3fivvp2gFf3KcTyqFUtEHIk7rf43mw4mxCXyPNCvwdc
 53TmYx43mhP3DlFjEpRdG7QuUWaGvow803l0e3Tg4QYKnPak2jF5NWtyYMp7QEA
X-Google-Smtp-Source: AGHT+IH3iukclk2E5qKWSLBLAKuZR5nQlqT+2E4N41OhxkRdYmkx8KPxxn6dAxVfm67oFOMUBIxQ3g==
X-Received: by 2002:a05:651c:1a0b:b0:302:1e65:f2ab with SMTP id
 38308e7fff4ca-302544ca738mr30014911fa.20.1734302691918; 
 Sun, 15 Dec 2024 14:44:51 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441a41d1sm7201701fa.100.2024.12.15.14.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 14:44:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 00:44:21 +0200
Subject: [PATCH v4 16/16] drm/msm/dp: drop the msm_dp_catalog module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fd-dp-audio-fixup-v4-16-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=78660;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6AHThHx9TXLQNOWVSuPP7vg9ykCLd/MI5mMFervofMg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX1u7ijywGEPoH8eiRYb/Cj/AufHjnuRfGK11B
 psiiBA9EjeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ19buwAKCRCLPIo+Aiko
 1Y8NCACxX9PSO70+8GmnMbGZRNZGVLg1Lljz0EYjjeArKC0TrsSsr+/dfaTTiN4bYZ1Eyb/xrtO
 GXxjOMhLL2ZPw2+TbGw7pGhDhk6qVzu9pMLeY9m3i4hXVErZJKrCA6/BVefTNhquDemh2XBIBOU
 GaMhI+d9sZQ0OithVJ4AQCQp6GYt0GowfOe+hznLOwj0UdMRsAGeTMZ9RMiYTDpi3QCuD+lOKnF
 Fa2QeQtbwOMg2/2znIXE2n9Qmc+wtoFXDEDR7EDSi+T7rw6/YNec4oV/EP1KC4KaB2vi+nfJclN
 Q4Emt4XVkqw+ywXJdrKK44ensLqmkzXIlG64cKgt+MDGhi+A
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Now as the msm_dp_catalog module became nearly empty, drop it, accessing
registers directly from the corresponding submodules.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile        |   1 -
 drivers/gpu/drm/msm/dp/dp_audio.c   |  70 ++++++-----
 drivers/gpu/drm/msm/dp/dp_audio.h   |   5 +-
 drivers/gpu/drm/msm/dp/dp_aux.c     | 113 +++++++++---------
 drivers/gpu/drm/msm/dp/dp_aux.h     |   6 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c | 126 --------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h | 100 ----------------
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 231 +++++++++++++++++++-----------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  12 +-
 drivers/gpu/drm/msm/dp/dp_debug.c   |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 123 +++++++++++++++----
 drivers/gpu/drm/msm/dp/dp_link.c    |   1 +
 drivers/gpu/drm/msm/dp/dp_panel.c   | 157 ++++++++++++++----------
 drivers/gpu/drm/msm/dp/dp_panel.h   |   7 +-
 drivers/gpu/drm/msm/dp/dp_reg.h     |   2 +
 15 files changed, 433 insertions(+), 522 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index f274d9430cc311405f890074c1466ffe2ec45ac9..fc983ec7b3940aeb641075b54d75f6df820bd991 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -135,7 +135,6 @@ msm-display-$(CONFIG_DEBUG_FS) += \
 	dp/dp_debug.o
 
 msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
-	dp/dp_catalog.o \
 	dp/dp_ctrl.o \
 	dp/dp_display.o \
 	dp/dp_drm.o \
diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 6a6b4032548cf3298e7fa75795401ec0925d48d4..e32c5fbae3b18ed4309d74bd7bd073ca1173567e 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -11,7 +11,6 @@
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_edid.h>
 
-#include "dp_catalog.h"
 #include "dp_audio.h"
 #include "dp_panel.h"
 #include "dp_reg.h"
@@ -22,16 +21,30 @@ struct msm_dp_audio_private {
 	struct platform_device *audio_pdev;
 	struct platform_device *pdev;
 	struct drm_device *drm_dev;
-	struct msm_dp_catalog *catalog;
+	void __iomem *link_base;
 
 	u32 channels;
 
 	struct msm_dp_audio msm_dp_audio;
 };
 
+static inline u32 msm_dp_read_link(struct msm_dp_audio_private *audio, u32 offset)
+{
+	return readl_relaxed(audio->link_base + offset);
+}
+
+static inline void msm_dp_write_link(struct msm_dp_audio_private *audio,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure link reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, audio->link_base + offset);
+}
+
 static void msm_dp_audio_stream_sdp(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x02,
@@ -42,13 +55,12 @@ static void msm_dp_audio_stream_sdp(struct msm_dp_audio_private *audio)
 
 	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
 
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_0, header[0]);
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_1, header[1]);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_STREAM_0, header[0]);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_STREAM_1, header[1]);
 }
 
 static void msm_dp_audio_timestamp_sdp(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x01,
@@ -59,13 +71,12 @@ static void msm_dp_audio_timestamp_sdp(struct msm_dp_audio_private *audio)
 
 	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
 
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_0, header[0]);
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_1, header[1]);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_TIMESTAMP_0, header[0]);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_TIMESTAMP_1, header[1]);
 }
 
 static void msm_dp_audio_infoframe_sdp(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x84,
@@ -76,13 +87,12 @@ static void msm_dp_audio_infoframe_sdp(struct msm_dp_audio_private *audio)
 
 	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
 
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_0, header[0]);
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_1, header[1]);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_INFOFRAME_0, header[0]);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_INFOFRAME_1, header[1]);
 }
 
 static void msm_dp_audio_copy_management_sdp(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x05,
@@ -93,13 +103,12 @@ static void msm_dp_audio_copy_management_sdp(struct msm_dp_audio_private *audio)
 
 	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
 
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_0, header[0]);
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_1, header[1]);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_COPYMANAGEMENT_0, header[0]);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_COPYMANAGEMENT_1, header[1]);
 }
 
 static void msm_dp_audio_isrc_sdp(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x06,
@@ -110,21 +119,20 @@ static void msm_dp_audio_isrc_sdp(struct msm_dp_audio_private *audio)
 	u32 reg;
 
 	/* XXX: is it necessary to preserve this field? */
-	reg = msm_dp_read_link(catalog, MMSS_DP_AUDIO_ISRC_1);
+	reg = msm_dp_read_link(audio, MMSS_DP_AUDIO_ISRC_1);
 	sdp_hdr.HB3 = FIELD_GET(HEADER_3_MASK, reg);
 
 	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
 
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_0, header[0]);
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_1, header[1]);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_ISRC_0, header[0]);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_ISRC_1, header[1]);
 }
 
 static void msm_dp_audio_config_sdp(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *msm_dp_catalog = audio->catalog;
 	u32 sdp_cfg, sdp_cfg2;
 
-	sdp_cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
+	sdp_cfg = msm_dp_read_link(audio, MMSS_DP_SDP_CFG);
 	/* AUDIO_TIMESTAMP_SDP_EN */
 	sdp_cfg |= BIT(1);
 	/* AUDIO_STREAM_SDP_EN */
@@ -138,9 +146,9 @@ static void msm_dp_audio_config_sdp(struct msm_dp_audio_private *audio)
 
 	drm_dbg_dp(audio->drm_dev, "sdp_cfg = 0x%x\n", sdp_cfg);
 
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, sdp_cfg);
+	msm_dp_write_link(audio, MMSS_DP_SDP_CFG, sdp_cfg);
 
-	sdp_cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
+	sdp_cfg2 = msm_dp_read_link(audio, MMSS_DP_SDP_CFG2);
 	/* IFRM_REGSRC -> Do not use reg values */
 	sdp_cfg2 &= ~BIT(0);
 	/* AUDIO_STREAM_HB3_REGSRC-> Do not use reg values */
@@ -148,7 +156,7 @@ static void msm_dp_audio_config_sdp(struct msm_dp_audio_private *audio)
 
 	drm_dbg_dp(audio->drm_dev, "sdp_cfg2 = 0x%x\n", sdp_cfg2);
 
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, sdp_cfg2);
+	msm_dp_write_link(audio, MMSS_DP_SDP_CFG2, sdp_cfg2);
 }
 
 static void msm_dp_audio_setup_sdp(struct msm_dp_audio_private *audio)
@@ -190,7 +198,7 @@ static void msm_dp_audio_setup_acr(struct msm_dp_audio_private *audio)
 	drm_dbg_dp(audio->drm_dev, "select: %#x, acr_ctrl: %#x\n",
 		   select, acr_ctrl);
 
-	msm_dp_write_link(audio->catalog, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
 }
 
 static void msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
@@ -215,7 +223,7 @@ static void msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
 		break;
 	}
 
-	mainlink_levels = msm_dp_read_link(audio->catalog, REG_DP_MAINLINK_LEVELS);
+	mainlink_levels = msm_dp_read_link(audio, REG_DP_MAINLINK_LEVELS);
 	mainlink_levels &= 0xFE0;
 	mainlink_levels |= safe_to_exit_level;
 
@@ -223,14 +231,14 @@ static void msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
 		   "mainlink_level = 0x%x, safe_to_exit_level = 0x%x\n",
 		   mainlink_levels, safe_to_exit_level);
 
-	msm_dp_write_link(audio->catalog, REG_DP_MAINLINK_LEVELS, mainlink_levels);
+	msm_dp_write_link(audio, REG_DP_MAINLINK_LEVELS, mainlink_levels);
 }
 
 static void msm_dp_audio_enable(struct msm_dp_audio_private *audio, bool enable)
 {
 	u32 audio_ctrl;
 
-	audio_ctrl = msm_dp_read_link(audio->catalog, MMSS_DP_AUDIO_CFG);
+	audio_ctrl = msm_dp_read_link(audio, MMSS_DP_AUDIO_CFG);
 
 	if (enable)
 		audio_ctrl |= BIT(0);
@@ -239,7 +247,7 @@ static void msm_dp_audio_enable(struct msm_dp_audio_private *audio, bool enable)
 
 	drm_dbg_dp(audio->drm_dev, "dp_audio_cfg = 0x%x\n", audio_ctrl);
 
-	msm_dp_write_link(audio->catalog, MMSS_DP_AUDIO_CFG, audio_ctrl);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_CFG, audio_ctrl);
 	/* make sure audio engine is disabled */
 	wmb();
 }
@@ -435,13 +443,13 @@ int msm_dp_register_audio_driver(struct device *dev,
 }
 
 struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
-			struct msm_dp_catalog *catalog)
+			      void __iomem *link_base)
 {
 	int rc = 0;
 	struct msm_dp_audio_private *audio;
 	struct msm_dp_audio *msm_dp_audio;
 
-	if (!pdev || !catalog) {
+	if (!pdev) {
 		DRM_ERROR("invalid input\n");
 		rc = -EINVAL;
 		goto error;
@@ -454,7 +462,7 @@ struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
 	}
 
 	audio->pdev = pdev;
-	audio->catalog = catalog;
+	audio->link_base = link_base;
 
 	msm_dp_audio = &audio->msm_dp_audio;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_audio.h b/drivers/gpu/drm/msm/dp/dp_audio.h
index beea34cbab77f31b33873297dc454a9cee446240..980fba5b04720ebf6d5a66d64863b4168eb52fd9 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.h
+++ b/drivers/gpu/drm/msm/dp/dp_audio.h
@@ -8,7 +8,6 @@
 
 #include <linux/platform_device.h>
 
-#include "dp_catalog.h"
 #include <sound/hdmi-codec.h>
 
 /**
@@ -27,13 +26,13 @@ struct msm_dp_audio {
  * Creates and instance of dp audio.
  *
  * @pdev: caller's platform device instance.
- * @catalog: an instance of msm_dp_catalog module.
+ * @link_base: pointer to the msm_dp_link resource.
  *
  * Returns the error code in case of failure, otherwize
  * an instance of newly created msm_dp_module.
  */
 struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
-			struct msm_dp_catalog *catalog);
+			      void __iomem *link_base);
 
 /**
  * msm_dp_register_audio_driver()
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index d7a38fa5d64d618af463416edf13bef79d6b53ba..3825a2fb48e213862f5755a8e53269e09053dc29 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -23,7 +23,7 @@ enum msm_dp_aux_err {
 
 struct msm_dp_aux_private {
 	struct device *dev;
-	struct msm_dp_catalog *catalog;
+	void __iomem *aux_base;
 
 	struct phy *phy;
 
@@ -46,14 +46,27 @@ struct msm_dp_aux_private {
 	struct drm_dp_aux msm_dp_aux;
 };
 
-static void msm_dp_aux_clear_hw_interrupts(struct msm_dp_aux_private *aux)
+static inline u32 msm_dp_read_aux(struct msm_dp_aux_private *aux, u32 offset)
+{
+	return readl_relaxed(aux->aux_base + offset);
+}
+
+static inline void msm_dp_write_aux(struct msm_dp_aux_private *aux,
+				u32 offset, u32 data)
 {
-	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	/*
+	 * To make sure aux reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, aux->aux_base + offset);
+}
 
-	msm_dp_read_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_STATUS);
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x1f);
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x9f);
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0);
+static void msm_dp_aux_clear_hw_interrupts(struct msm_dp_aux_private *aux)
+{
+	msm_dp_read_aux(aux, REG_DP_PHY_AUX_INTERRUPT_STATUS);
+	msm_dp_write_aux(aux, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x1f);
+	msm_dp_write_aux(aux, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x9f);
+	msm_dp_write_aux(aux, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0);
 }
 
 /*
@@ -61,51 +74,47 @@ static void msm_dp_aux_clear_hw_interrupts(struct msm_dp_aux_private *aux)
  */
 static void msm_dp_aux_reset(struct msm_dp_aux_private *aux)
 {
-	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
 	u32 aux_ctrl;
 
-	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
+	aux_ctrl = msm_dp_read_aux(aux, REG_DP_AUX_CTRL);
 
 	aux_ctrl |= DP_AUX_CTRL_RESET;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
+	msm_dp_write_aux(aux, REG_DP_AUX_CTRL, aux_ctrl);
 	usleep_range(1000, 1100); /* h/w recommended delay */
 
 	aux_ctrl &= ~DP_AUX_CTRL_RESET;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
+	msm_dp_write_aux(aux, REG_DP_AUX_CTRL, aux_ctrl);
 }
 
 static void msm_dp_aux_enable(struct msm_dp_aux_private *aux)
 {
-	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
 	u32 aux_ctrl;
 
-	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
+	aux_ctrl = msm_dp_read_aux(aux, REG_DP_AUX_CTRL);
 
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_TIMEOUT_COUNT, 0xffff);
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_LIMITS, 0xffff);
+	msm_dp_write_aux(aux, REG_DP_TIMEOUT_COUNT, 0xffff);
+	msm_dp_write_aux(aux, REG_DP_AUX_LIMITS, 0xffff);
 
 	aux_ctrl |= DP_AUX_CTRL_ENABLE;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
+	msm_dp_write_aux(aux, REG_DP_AUX_CTRL, aux_ctrl);
 }
 
 static void msm_dp_aux_disable(struct msm_dp_aux_private *aux)
 {
-	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
 	u32 aux_ctrl;
 
-	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
+	aux_ctrl = msm_dp_read_aux(aux, REG_DP_AUX_CTRL);
 	aux_ctrl &= ~DP_AUX_CTRL_ENABLE;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
+	msm_dp_write_aux(aux, REG_DP_AUX_CTRL, aux_ctrl);
 }
 
 static int msm_dp_aux_wait_for_hpd_connect_state(struct msm_dp_aux_private *aux,
 					     unsigned long wait_us)
 {
-	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
 	u32 state;
 
 	/* poll for hpd connected status every 2ms and timeout after wait_us */
-	return readl_poll_timeout(msm_dp_catalog->aux_base +
+	return readl_poll_timeout(aux->aux_base +
 				  REG_DP_DP_HPD_INT_STATUS,
 				  state, state & DP_DP_HPD_STATE_STATUS_CONNECTED,
 				  min(wait_us, 2000), wait_us);
@@ -154,10 +163,10 @@ static ssize_t msm_dp_aux_write(struct msm_dp_aux_private *aux,
 		/* index = 0, write */
 		if (i == 0)
 			reg |= DP_AUX_DATA_INDEX_WRITE;
-		msm_dp_write_aux(aux->catalog, REG_DP_AUX_DATA, reg);
+		msm_dp_write_aux(aux, REG_DP_AUX_DATA, reg);
 	}
 
-	msm_dp_write_aux(aux->catalog, REG_DP_AUX_TRANS_CTRL, 0);
+	msm_dp_write_aux(aux, REG_DP_AUX_TRANS_CTRL, 0);
 	msm_dp_aux_clear_hw_interrupts(aux);
 
 	reg = 0; /* Transaction number == 1 */
@@ -172,7 +181,7 @@ static ssize_t msm_dp_aux_write(struct msm_dp_aux_private *aux,
 	}
 
 	reg |= DP_AUX_TRANS_CTRL_GO;
-	msm_dp_write_aux(aux->catalog, REG_DP_AUX_TRANS_CTRL, reg);
+	msm_dp_write_aux(aux, REG_DP_AUX_TRANS_CTRL, reg);
 
 	return len;
 }
@@ -205,22 +214,22 @@ static ssize_t msm_dp_aux_cmd_fifo_rx(struct msm_dp_aux_private *aux,
 	u32 i, actual_i;
 	u32 len = msg->size;
 
-	data = msm_dp_read_aux(aux->catalog, REG_DP_AUX_TRANS_CTRL);
+	data = msm_dp_read_aux(aux, REG_DP_AUX_TRANS_CTRL);
 	data &= ~DP_AUX_TRANS_CTRL_GO;
-	msm_dp_write_aux(aux->catalog, REG_DP_AUX_TRANS_CTRL, data);
+	msm_dp_write_aux(aux, REG_DP_AUX_TRANS_CTRL, data);
 
 	data = DP_AUX_DATA_INDEX_WRITE; /* INDEX_WRITE */
 	data |= DP_AUX_DATA_READ;  /* read */
 
-	msm_dp_write_aux(aux->catalog, REG_DP_AUX_DATA, data);
+	msm_dp_write_aux(aux, REG_DP_AUX_DATA, data);
 
 	dp = msg->buffer;
 
 	/* discard first byte */
-	data = msm_dp_read_aux(aux->catalog, REG_DP_AUX_DATA);
+	data = msm_dp_read_aux(aux, REG_DP_AUX_DATA);
 
 	for (i = 0; i < len; i++) {
-		data = msm_dp_read_aux(aux->catalog, REG_DP_AUX_DATA);
+		data = msm_dp_read_aux(aux, REG_DP_AUX_DATA);
 		*dp++ = (u8)((data >> DP_AUX_DATA_OFFSET) & 0xff);
 
 		actual_i = (data >> DP_AUX_DATA_INDEX_OFFSET) & 0xFF;
@@ -588,42 +597,39 @@ void msm_dp_aux_hpd_enable(struct drm_dp_aux *msm_dp_aux)
 {
 	struct msm_dp_aux_private *aux =
 		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
-	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
 	u32 reg;
 
 	/* Configure REFTIMER and enable it */
-	reg = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER);
+	reg = msm_dp_read_aux(aux, REG_DP_DP_HPD_REFTIMER);
 	reg |= DP_DP_HPD_REFTIMER_ENABLE;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER, reg);
+	msm_dp_write_aux(aux, REG_DP_DP_HPD_REFTIMER, reg);
 
 	/* Enable HPD */
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
+	msm_dp_write_aux(aux, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
 }
 
 void msm_dp_aux_hpd_disable(struct drm_dp_aux *msm_dp_aux)
 {
 	struct msm_dp_aux_private *aux =
 		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
-	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
 	u32 reg;
 
-	reg = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER);
+	reg = msm_dp_read_aux(aux, REG_DP_DP_HPD_REFTIMER);
 	reg &= ~DP_DP_HPD_REFTIMER_ENABLE;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER, reg);
+	msm_dp_write_aux(aux, REG_DP_DP_HPD_REFTIMER, reg);
 
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_CTRL, 0);
+	msm_dp_write_aux(aux, REG_DP_DP_HPD_CTRL, 0);
 }
 
 void msm_dp_aux_hpd_intr_enable(struct drm_dp_aux *msm_dp_aux)
 {
 	struct msm_dp_aux_private *aux =
 		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
-	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
 	u32 reg;
 
-	reg = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK);
+	reg = msm_dp_read_aux(aux, REG_DP_DP_HPD_INT_MASK);
 	reg |= DP_DP_HPD_INT_MASK;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK,
+	msm_dp_write_aux(aux, REG_DP_DP_HPD_INT_MASK,
 		     reg & DP_DP_HPD_INT_MASK);
 }
 
@@ -631,12 +637,11 @@ void msm_dp_aux_hpd_intr_disable(struct drm_dp_aux *msm_dp_aux)
 {
 	struct msm_dp_aux_private *aux =
 		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
-	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
 	u32 reg;
 
-	reg = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK);
+	reg = msm_dp_read_aux(aux, REG_DP_DP_HPD_INT_MASK);
 	reg &= ~DP_DP_HPD_INT_MASK;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK,
+	msm_dp_write_aux(aux, REG_DP_DP_HPD_INT_MASK,
 		     reg & DP_DP_HPD_INT_MASK);
 }
 
@@ -644,13 +649,12 @@ u32 msm_dp_aux_get_hpd_intr_status(struct drm_dp_aux *msm_dp_aux)
 {
 	struct msm_dp_aux_private *aux =
 		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
-	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
 	int isr, mask;
 
-	isr = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_STATUS);
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_ACK,
+	isr = msm_dp_read_aux(aux, REG_DP_DP_HPD_INT_STATUS);
+	msm_dp_write_aux(aux, REG_DP_DP_HPD_INT_ACK,
 				 (isr & DP_DP_HPD_INT_MASK));
-	mask = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK);
+	mask = msm_dp_read_aux(aux, REG_DP_DP_HPD_INT_MASK);
 
 	/*
 	 * We only want to return interrupts that are unmasked to the caller.
@@ -666,27 +670,22 @@ u32 msm_dp_aux_is_link_connected(struct drm_dp_aux *msm_dp_aux)
 {
 	struct msm_dp_aux_private *aux =
 		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
-	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
 	u32 status;
 
-	status = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_STATUS);
+	status = msm_dp_read_aux(aux, REG_DP_DP_HPD_INT_STATUS);
 	status >>= DP_DP_HPD_STATE_STATUS_BITS_SHIFT;
 	status &= DP_DP_HPD_STATE_STATUS_BITS_MASK;
 
 	return status;
 }
 
-struct drm_dp_aux *msm_dp_aux_get(struct device *dev, struct msm_dp_catalog *catalog,
+struct drm_dp_aux *msm_dp_aux_get(struct device *dev,
 			      struct phy *phy,
-			      bool is_edp)
+			      bool is_edp,
+			      void __iomem *aux_base)
 {
 	struct msm_dp_aux_private *aux;
 
-	if (!catalog) {
-		DRM_ERROR("invalid input\n");
-		return ERR_PTR(-ENODEV);
-	}
-
 	aux = devm_kzalloc(dev, sizeof(*aux), GFP_KERNEL);
 	if (!aux)
 		return ERR_PTR(-ENOMEM);
@@ -697,9 +696,9 @@ struct drm_dp_aux *msm_dp_aux_get(struct device *dev, struct msm_dp_catalog *cat
 	mutex_init(&aux->mutex);
 
 	aux->dev = dev;
-	aux->catalog = catalog;
 	aux->phy = phy;
 	aux->retry_cnt = 0;
+	aux->aux_base = aux_base;
 
 	/*
 	 * Use the drm_dp_aux_init() to use the aux adapter
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index 83908c93b6a1baa6c4eb83a346b4498704008ca5..4be02e8b4d0baec8e8c14e5325c44f446204f4f5 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -6,7 +6,6 @@
 #ifndef _DP_AUX_H_
 #define _DP_AUX_H_
 
-#include "dp_catalog.h"
 #include <drm/display/drm_dp_helper.h>
 
 int msm_dp_aux_register(struct drm_dp_aux *msm_dp_aux);
@@ -25,9 +24,10 @@ u32 msm_dp_aux_get_hpd_intr_status(struct drm_dp_aux *msm_dp_aux);
 u32 msm_dp_aux_is_link_connected(struct drm_dp_aux *msm_dp_aux);
 
 struct phy;
-struct drm_dp_aux *msm_dp_aux_get(struct device *dev, struct msm_dp_catalog *catalog,
+struct drm_dp_aux *msm_dp_aux_get(struct device *dev,
 			      struct phy *phy,
-			      bool is_edp);
+			      bool is_edp,
+			      void __iomem *aux_base);
 void msm_dp_aux_put(struct drm_dp_aux *aux);
 
 #endif /*__DP_AUX_H_*/
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
deleted file mode 100644
index 84adf3a38e4cf0619b15850c31416f1e67049a42..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ /dev/null
@@ -1,126 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
- */
-
-#define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
-
-#include <linux/delay.h>
-#include <linux/iopoll.h>
-#include <linux/platform_device.h>
-#include <linux/rational.h>
-#include <drm/display/drm_dp_helper.h>
-#include <drm/drm_print.h>
-
-#include "dp_catalog.h"
-#include "dp_reg.h"
-
-#define DP_DEFAULT_AHB_OFFSET	0x0000
-#define DP_DEFAULT_AHB_SIZE	0x0200
-#define DP_DEFAULT_AUX_OFFSET	0x0200
-#define DP_DEFAULT_AUX_SIZE	0x0200
-#define DP_DEFAULT_LINK_OFFSET	0x0400
-#define DP_DEFAULT_LINK_SIZE	0x0C00
-#define DP_DEFAULT_P0_OFFSET	0x1000
-#define DP_DEFAULT_P0_SIZE	0x0400
-
-struct msm_dp_catalog_private {
-	struct device *dev;
-	struct drm_device *drm_dev;
-	struct msm_dp_catalog msm_dp_catalog;
-};
-
-void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state)
-{
-	msm_disp_snapshot_add_block(disp_state,
-				    msm_dp_catalog->ahb_len, msm_dp_catalog->ahb_base, "dp_ahb");
-	msm_disp_snapshot_add_block(disp_state,
-				    msm_dp_catalog->aux_len, msm_dp_catalog->aux_base, "dp_aux");
-	msm_disp_snapshot_add_block(disp_state,
-				    msm_dp_catalog->link_len, msm_dp_catalog->link_base, "dp_link");
-	msm_disp_snapshot_add_block(disp_state,
-				    msm_dp_catalog->p0_len, msm_dp_catalog->p0_base, "dp_p0");
-}
-
-static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
-{
-	struct resource *res;
-	void __iomem *base;
-
-	base = devm_platform_get_and_ioremap_resource(pdev, idx, &res);
-	if (!IS_ERR(base))
-		*len = resource_size(res);
-
-	return base;
-}
-
-static int msm_dp_catalog_get_io(struct msm_dp_catalog_private *catalog)
-{
-	struct msm_dp_catalog *msm_dp_catalog = &catalog->msm_dp_catalog;
-	struct platform_device *pdev = to_platform_device(catalog->dev);
-
-	msm_dp_catalog->ahb_base = msm_dp_ioremap(pdev, 0, &msm_dp_catalog->ahb_len);
-	if (IS_ERR(msm_dp_catalog->ahb_base))
-		return PTR_ERR(msm_dp_catalog->ahb_base);
-
-	msm_dp_catalog->aux_base = msm_dp_ioremap(pdev, 1, &msm_dp_catalog->aux_len);
-	if (IS_ERR(msm_dp_catalog->aux_base)) {
-		/*
-		 * The initial binding had a single reg, but in order to
-		 * support variation in the sub-region sizes this was split.
-		 * msm_dp_ioremap() will fail with -EINVAL here if only a single
-		 * reg is specified, so fill in the sub-region offsets and
-		 * lengths based on this single region.
-		 */
-		if (PTR_ERR(msm_dp_catalog->aux_base) == -EINVAL) {
-			if (msm_dp_catalog->ahb_len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
-				DRM_ERROR("legacy memory region not large enough\n");
-				return -EINVAL;
-			}
-
-			msm_dp_catalog->ahb_len = DP_DEFAULT_AHB_SIZE;
-			msm_dp_catalog->aux_base = msm_dp_catalog->ahb_base + DP_DEFAULT_AUX_OFFSET;
-			msm_dp_catalog->aux_len = DP_DEFAULT_AUX_SIZE;
-			msm_dp_catalog->link_base = msm_dp_catalog->ahb_base +
-				DP_DEFAULT_LINK_OFFSET;
-			msm_dp_catalog->link_len = DP_DEFAULT_LINK_SIZE;
-			msm_dp_catalog->p0_base = msm_dp_catalog->ahb_base + DP_DEFAULT_P0_OFFSET;
-			msm_dp_catalog->p0_len = DP_DEFAULT_P0_SIZE;
-		} else {
-			DRM_ERROR("unable to remap aux region: %pe\n", msm_dp_catalog->aux_base);
-			return PTR_ERR(msm_dp_catalog->aux_base);
-		}
-	} else {
-		msm_dp_catalog->link_base = msm_dp_ioremap(pdev, 2, &msm_dp_catalog->link_len);
-		if (IS_ERR(msm_dp_catalog->link_base)) {
-			DRM_ERROR("unable to remap link region: %pe\n", msm_dp_catalog->link_base);
-			return PTR_ERR(msm_dp_catalog->link_base);
-		}
-
-		msm_dp_catalog->p0_base = msm_dp_ioremap(pdev, 3, &msm_dp_catalog->p0_len);
-		if (IS_ERR(msm_dp_catalog->p0_base)) {
-			DRM_ERROR("unable to remap p0 region: %pe\n", msm_dp_catalog->p0_base);
-			return PTR_ERR(msm_dp_catalog->p0_base);
-		}
-	}
-
-	return 0;
-}
-
-struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev)
-{
-	struct msm_dp_catalog_private *catalog;
-	int ret;
-
-	catalog  = devm_kzalloc(dev, sizeof(*catalog), GFP_KERNEL);
-	if (!catalog)
-		return ERR_PTR(-ENOMEM);
-
-	catalog->dev = dev;
-
-	ret = msm_dp_catalog_get_io(catalog);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return &catalog->msm_dp_catalog;
-}
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
deleted file mode 100644
index ddbae0fcf5fc428b2d37cd1eab1d5860a2f11a50..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ /dev/null
@@ -1,100 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
- */
-
-#ifndef _DP_CATALOG_H_
-#define _DP_CATALOG_H_
-
-#include <drm/drm_modes.h>
-
-#include "dp_utils.h"
-#include "disp/msm_disp_snapshot.h"
-
-#define DP_HW_VERSION_1_0	0x10000000
-#define DP_HW_VERSION_1_2	0x10020000
-
-struct msm_dp_catalog {
-	bool wide_bus_en;
-
-	void __iomem *ahb_base;
-	size_t ahb_len;
-
-	void __iomem *aux_base;
-	size_t aux_len;
-
-	void __iomem *link_base;
-	size_t link_len;
-
-	void __iomem *p0_base;
-	size_t p0_len;
-};
-
-/* IO */
-static inline u32 msm_dp_read_aux(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->aux_base + offset);
-}
-
-static inline void msm_dp_write_aux(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure aux reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->aux_base + offset);
-}
-
-static inline u32 msm_dp_read_ahb(const struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->ahb_base + offset);
-}
-
-static inline void msm_dp_write_ahb(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure phy reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->ahb_base + offset);
-}
-
-static inline void msm_dp_write_p0(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure interface reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->p0_base + offset);
-}
-
-static inline u32 msm_dp_read_p0(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->p0_base + offset);
-}
-
-static inline u32 msm_dp_read_link(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->link_base + offset);
-}
-
-static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure link reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->link_base + offset);
-}
-
-/* Debug module */
-void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state);
-
-struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
-
-#endif /* _DP_CATALOG_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 60dbf7eab3fd184bc12035d267abb3758cce9f89..11bdff35ac8a2185c472aa234d5c507322bb7846 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -6,6 +6,7 @@
 #define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
 
 #include <linux/types.h>
+#include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/iopoll.h>
@@ -15,6 +16,7 @@
 #include <linux/rational.h>
 
 #include <drm/display/drm_dp_helper.h>
+#include <drm/drm_device.h>
 #include <drm/drm_fixed.h>
 #include <drm/drm_print.h>
 
@@ -113,7 +115,8 @@ struct msm_dp_ctrl_private {
 	struct drm_dp_aux *aux;
 	struct msm_dp_panel *panel;
 	struct msm_dp_link *link;
-	struct msm_dp_catalog *catalog;
+	void __iomem *ahb_base;
+	void __iomem *link_base;
 
 	struct phy *phy;
 
@@ -138,6 +141,36 @@ struct msm_dp_ctrl_private {
 	bool stream_clks_on;
 };
 
+static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
+{
+	return readl_relaxed(ctrl->ahb_base + offset);
+}
+
+static inline void msm_dp_write_ahb(struct msm_dp_ctrl_private *ctrl,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure phy reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, ctrl->ahb_base + offset);
+}
+
+static inline u32 msm_dp_read_link(struct msm_dp_ctrl_private *ctrl, u32 offset)
+{
+	return readl_relaxed(ctrl->link_base + offset);
+}
+
+static inline void msm_dp_write_link(struct msm_dp_ctrl_private *ctrl,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure link reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, ctrl->link_base + offset);
+}
+
 static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 					struct msm_dp_link_info *link)
 {
@@ -164,34 +197,32 @@ void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl =
 		container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 sw_reset;
 
-	sw_reset = msm_dp_read_ahb(msm_dp_catalog, REG_DP_SW_RESET);
+	sw_reset = msm_dp_read_ahb(ctrl, REG_DP_SW_RESET);
 
 	sw_reset |= DP_SW_RESET;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_SW_RESET, sw_reset);
+	msm_dp_write_ahb(ctrl, REG_DP_SW_RESET, sw_reset);
 	usleep_range(1000, 1100); /* h/w recommended delay */
 
 	sw_reset &= ~DP_SW_RESET;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_SW_RESET, sw_reset);
+	msm_dp_write_ahb(ctrl, REG_DP_SW_RESET, sw_reset);
 
 	if (!ctrl->hw_revision) {
-		ctrl->hw_revision = msm_dp_read_ahb(msm_dp_catalog, REG_DP_HW_VERSION);
+		ctrl->hw_revision = msm_dp_read_ahb(ctrl, REG_DP_HW_VERSION);
 		ctrl->panel->hw_revision = ctrl->hw_revision;
 	}
 }
 
 static u32 msm_dp_ctrl_get_aux_interrupt(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 intr, intr_ack;
 
-	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS);
+	intr = msm_dp_read_ahb(ctrl, REG_DP_INTR_STATUS);
 	intr &= ~DP_INTERRUPT_STATUS1_MASK;
 	intr_ack = (intr & DP_INTERRUPT_STATUS1)
 			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS,
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS,
 		     intr_ack | DP_INTERRUPT_STATUS1_MASK);
 
 	return intr;
@@ -200,14 +231,13 @@ static u32 msm_dp_ctrl_get_aux_interrupt(struct msm_dp_ctrl_private *ctrl)
 
 static u32 msm_dp_ctrl_get_interrupt(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 intr, intr_ack;
 
-	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2);
+	intr = msm_dp_read_ahb(ctrl, REG_DP_INTR_STATUS2);
 	intr &= ~DP_INTERRUPT_STATUS2_MASK;
 	intr_ack = (intr & DP_INTERRUPT_STATUS2)
 			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2,
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2,
 		     intr_ack | DP_INTERRUPT_STATUS2_MASK);
 
 	return intr;
@@ -217,11 +247,10 @@ void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl =
 		container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS,
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS,
 			DP_INTERRUPT_STATUS1_MASK);
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2,
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2,
 			DP_INTERRUPT_STATUS2_MASK);
 }
 
@@ -229,111 +258,101 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl =
 		container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS, 0x00);
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2, 0x00);
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS, 0x00);
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2, 0x00);
 }
 
 static u32 msm_dp_ctrl_get_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 intr, intr_ack;
 
-	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS4);
+	intr = msm_dp_read_ahb(ctrl, REG_DP_INTR_STATUS4);
 	intr_ack = (intr & DP_INTERRUPT_STATUS4)
 			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS4, intr_ack);
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS4, intr_ack);
 
 	return intr;
 }
 
 static void msm_dp_ctrl_config_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
-
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
 }
 
 static void msm_dp_ctrl_psr_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 val;
 
-	val = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+	val = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
 	val |= DP_MAINLINK_CTRL_ENABLE;
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, val);
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, val);
 }
 
 static void msm_dp_ctrl_psr_mainlink_disable(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 val;
 
-	val = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+	val = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
 	val &= ~DP_MAINLINK_CTRL_ENABLE;
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, val);
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, val);
 }
 
 static void msm_dp_ctrl_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 mainlink_ctrl;
 
 	drm_dbg_dp(ctrl->drm_dev, "enable\n");
 
-	mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+	mainlink_ctrl = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
 
 	mainlink_ctrl &= ~(DP_MAINLINK_CTRL_RESET |
 					DP_MAINLINK_CTRL_ENABLE);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 
 	mainlink_ctrl |= DP_MAINLINK_CTRL_RESET;
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 
 	mainlink_ctrl &= ~DP_MAINLINK_CTRL_RESET;
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 
 	mainlink_ctrl |= (DP_MAINLINK_CTRL_ENABLE |
 				DP_MAINLINK_FB_BOUNDARY_SEL);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 }
 
 static void msm_dp_ctrl_mainlink_disable(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 mainlink_ctrl;
 
 	drm_dbg_dp(ctrl->drm_dev, "disable\n");
 
-	mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+	mainlink_ctrl = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
 	mainlink_ctrl &= ~DP_MAINLINK_CTRL_ENABLE;
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 }
 
 static void msm_dp_setup_peripheral_flush(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 mainlink_ctrl;
 
-	mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+	mainlink_ctrl = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
 
 	if (ctrl->hw_revision >= DP_HW_VERSION_1_2)
 		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
 	else
 		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
 
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 }
 
 static bool msm_dp_ctrl_mainlink_ready(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 data;
 	int ret;
 
 	/* Poll for mainlink ready status */
-	ret = readl_poll_timeout(msm_dp_catalog->link_base + REG_DP_MAINLINK_READY,
+	ret = readl_poll_timeout(ctrl->link_base + REG_DP_MAINLINK_READY,
 				data, data & DP_MAINLINK_READY_FOR_VIDEO,
 				POLLING_SLEEP_US, POLLING_TIMEOUT_US);
 	if (ret < 0) {
@@ -351,7 +370,7 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
 	reinit_completion(&ctrl->idle_comp);
-	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, DP_STATE_CTRL_PUSH_IDLE);
+	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_PUSH_IDLE);
 
 	if (!wait_for_completion_timeout(&ctrl->idle_comp,
 			IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
@@ -398,12 +417,11 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", config);
 
-	msm_dp_write_link(ctrl->catalog, REG_DP_CONFIGURATION_CTRL, config);
+	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
 }
 
 static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 ln_0 = 0, ln_1 = 1, ln_2 = 2, ln_3 = 3; /* One-to-One mapping */
 	u32 ln_mapping;
 
@@ -412,7 +430,7 @@ static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
 	ln_mapping |= ln_2 << LANE2_MAPPING_SHIFT;
 	ln_mapping |= ln_3 << LANE3_MAPPING_SHIFT;
 
-	msm_dp_write_link(msm_dp_catalog, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
+	msm_dp_write_link(ctrl, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
 			ln_mapping);
 }
 
@@ -428,7 +446,7 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
 	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
 
-	misc_val = msm_dp_read_link(ctrl->catalog, REG_DP_MISC1_MISC0);
+	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
 
 	/* clear bpp bits */
 	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
@@ -438,9 +456,9 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
 
 	drm_dbg_dp(ctrl->drm_dev, "misc settings = 0x%x\n", misc_val);
-	msm_dp_write_link(ctrl->catalog, REG_DP_MISC1_MISC0, misc_val);
+	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
 
-	msm_dp_panel_timing_cfg(ctrl->panel);
+	msm_dp_panel_timing_cfg(ctrl->panel, ctrl->msm_dp_ctrl.wide_bus_en);
 }
 
 /*
@@ -1256,9 +1274,9 @@ static void msm_dp_ctrl_setup_tr_unit(struct msm_dp_ctrl_private *ctrl)
 	pr_debug("dp_tu=0x%x, valid_boundary=0x%x, valid_boundary2=0x%x\n",
 			msm_dp_tu, valid_boundary, valid_boundary2);
 
-	msm_dp_write_link(ctrl->catalog, REG_DP_VALID_BOUNDARY, valid_boundary);
-	msm_dp_write_link(ctrl->catalog, REG_DP_TU, msm_dp_tu);
-	msm_dp_write_link(ctrl->catalog, REG_DP_VALID_BOUNDARY_2, valid_boundary2);
+	msm_dp_write_link(ctrl, REG_DP_VALID_BOUNDARY, valid_boundary);
+	msm_dp_write_link(ctrl, REG_DP_TU, msm_dp_tu);
+	msm_dp_write_link(ctrl, REG_DP_VALID_BOUNDARY_2, valid_boundary2);
 }
 
 static int msm_dp_ctrl_wait4video_ready(struct msm_dp_ctrl_private *ctrl)
@@ -1376,12 +1394,12 @@ static int msm_dp_ctrl_set_pattern_state_bit(struct msm_dp_ctrl_private *ctrl,
 
 	bit = BIT(state_bit - 1);
 	drm_dbg_dp(ctrl->drm_dev, "hw: bit=%d train=%d\n", bit, state_bit);
-	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, bit);
+	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, bit);
 
 	bit = BIT(state_bit - 1) << DP_MAINLINK_READY_LINK_TRAINING_SHIFT;
 
 	/* Poll for mainlink ready status */
-	ret = readx_poll_timeout(readl, ctrl->catalog->link_base + REG_DP_MAINLINK_READY,
+	ret = readx_poll_timeout(readl, ctrl->link_base + REG_DP_MAINLINK_READY,
 				 data, data & bit,
 				 POLLING_SLEEP_US, POLLING_TIMEOUT_US);
 	if (ret < 0) {
@@ -1399,7 +1417,7 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	int const maximum_retries = 4;
 
-	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, 0);
+	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
 
 	*training_step = DP_TRAINING_1;
 
@@ -1506,7 +1524,7 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 	int const maximum_retries = 5;
 	u8 link_status[DP_LINK_STATUS_SIZE];
 
-	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, 0);
+	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
 
 	*training_step = DP_TRAINING_2;
 
@@ -1599,7 +1617,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 	drm_dbg_dp(ctrl->drm_dev, "link training #2 successful\n");
 
 end:
-	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, 0);
+	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
 
 	return ret;
 }
@@ -1744,55 +1762,50 @@ static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl)
 
 static void msm_dp_ctrl_enable_sdp(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
-
 	/* trigger sdp */
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, UPDATE_SDP);
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, 0x0);
+	msm_dp_write_link(ctrl, MMSS_DP_SDP_CFG3, UPDATE_SDP);
+	msm_dp_write_link(ctrl, MMSS_DP_SDP_CFG3, 0x0);
 }
 
 static void msm_dp_ctrl_psr_enter(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 cmd;
 
-	cmd = msm_dp_read_link(msm_dp_catalog, REG_PSR_CMD);
+	cmd = msm_dp_read_link(ctrl, REG_PSR_CMD);
 
 	cmd &= ~(PSR_ENTER | PSR_EXIT);
 	cmd |= PSR_ENTER;
 
 	msm_dp_ctrl_enable_sdp(ctrl);
-	msm_dp_write_link(msm_dp_catalog, REG_PSR_CMD, cmd);
+	msm_dp_write_link(ctrl, REG_PSR_CMD, cmd);
 }
 
 static void msm_dp_ctrl_psr_exit(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 cmd;
 
-	cmd = msm_dp_read_link(msm_dp_catalog, REG_PSR_CMD);
+	cmd = msm_dp_read_link(ctrl, REG_PSR_CMD);
 
 	cmd &= ~(PSR_ENTER | PSR_EXIT);
 	cmd |= PSR_EXIT;
 
 	msm_dp_ctrl_enable_sdp(ctrl);
-	msm_dp_write_link(msm_dp_catalog, REG_PSR_CMD, cmd);
+	msm_dp_write_link(ctrl, REG_PSR_CMD, cmd);
 }
 
 void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl = container_of(msm_dp_ctrl,
 			struct msm_dp_ctrl_private, msm_dp_ctrl);
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 cfg;
 
 	if (!ctrl->panel->psr_cap.version)
 		return;
 
 	/* enable PSR1 function */
-	cfg = msm_dp_read_link(msm_dp_catalog, REG_PSR_CONFIG);
+	cfg = msm_dp_read_link(ctrl, REG_PSR_CONFIG);
 	cfg |= PSR1_SUPPORTED;
-	msm_dp_write_link(msm_dp_catalog, REG_PSR_CONFIG, cfg);
+	msm_dp_write_link(ctrl, REG_PSR_CONFIG, cfg);
 
 	msm_dp_ctrl_config_psr_interrupt(ctrl);
 	msm_dp_ctrl_enable_sdp(ctrl);
@@ -1831,25 +1844,25 @@ void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl, bool enter)
 		}
 
 		msm_dp_ctrl_push_idle(msm_dp_ctrl);
-		msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, 0);
+		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
 
 		msm_dp_ctrl_psr_mainlink_disable(ctrl);
 	} else {
 		msm_dp_ctrl_psr_mainlink_enable(ctrl);
 
 		msm_dp_ctrl_psr_exit(ctrl);
-		msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
+		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 		msm_dp_ctrl_wait4video_ready(ctrl);
-		msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, 0);
+		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
 	}
 }
 
 static void msm_dp_ctrl_phy_reset(struct msm_dp_ctrl_private *ctrl)
 {
-	msm_dp_write_ahb(ctrl->catalog, REG_DP_PHY_CTRL,
+	msm_dp_write_ahb(ctrl, REG_DP_PHY_CTRL,
 			DP_PHY_CTRL_SW_RESET | DP_PHY_CTRL_SW_RESET_PLL);
 	usleep_range(1000, 1100); /* h/w recommended delay */
-	msm_dp_write_ahb(ctrl->catalog, REG_DP_PHY_CTRL, 0x0);
+	msm_dp_write_ahb(ctrl, REG_DP_PHY_CTRL, 0x0);
 }
 
 void msm_dp_ctrl_phy_init(struct msm_dp_ctrl *msm_dp_ctrl)
@@ -1951,7 +1964,7 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
 
 	msm_dp_ctrl_clear_training_pattern(ctrl);
 
-	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
+	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 end:
@@ -1963,75 +1976,74 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
 static void msm_dp_ctrl_send_phy_pattern(struct msm_dp_ctrl_private *ctrl,
 				     u32 pattern)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 value = 0x0;
 
 	/* Make sure to clear the current pattern before starting a new one */
-	msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL, 0x0);
+	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0x0);
 
 	drm_dbg_dp(ctrl->drm_dev, "pattern: %#x\n", pattern);
 	switch (pattern) {
 	case DP_PHY_TEST_PATTERN_D10_2:
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
 			      DP_STATE_CTRL_LINK_TRAINING_PATTERN1);
 		break;
 
 	case DP_PHY_TEST_PATTERN_ERROR_COUNT:
 		value &= ~(1 << 16);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+		msm_dp_write_link(ctrl, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
 			      value);
 		value |= SCRAMBLER_RESET_COUNT_VALUE;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+		msm_dp_write_link(ctrl, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
 			      value);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS,
+		msm_dp_write_link(ctrl, REG_DP_MAINLINK_LEVELS,
 			      DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
 			      DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
 		break;
 
 	case DP_PHY_TEST_PATTERN_PRBS7:
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
 			      DP_STATE_CTRL_LINK_PRBS7);
 		break;
 
 	case DP_PHY_TEST_PATTERN_80BIT_CUSTOM:
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
 			      DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN);
 		/* 00111110000011111000001111100000 */
-		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG0,
+		msm_dp_write_link(ctrl, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG0,
 			      0x3E0F83E0);
 		/* 00001111100000111110000011111000 */
-		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG1,
+		msm_dp_write_link(ctrl, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG1,
 			      0x0F83E0F8);
 		/* 1111100000111110 */
-		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2,
+		msm_dp_write_link(ctrl, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2,
 			      0x0000F83E);
 		break;
 
 	case DP_PHY_TEST_PATTERN_CP2520:
-		value = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+		value = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
 		value &= ~DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, value);
+		msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, value);
 
 		value = DP_HBR2_ERM_PATTERN;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+		msm_dp_write_link(ctrl, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
 			      value);
 		value |= SCRAMBLER_RESET_COUNT_VALUE;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+		msm_dp_write_link(ctrl, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
 			      value);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS,
+		msm_dp_write_link(ctrl, REG_DP_MAINLINK_LEVELS,
 			      DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
 			      DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
-		value = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+		value = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
 		value |= DP_MAINLINK_CTRL_ENABLE;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, value);
+		msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, value);
 		break;
 
 	case DP_PHY_TEST_PATTERN_SEL_MASK:
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL,
+		msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL,
 			      DP_MAINLINK_CTRL_ENABLE);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
 			      DP_STATE_CTRL_LINK_TRAINING_PATTERN4);
 		break;
 
@@ -2060,7 +2072,7 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
 	msm_dp_ctrl_update_vx_px(ctrl);
 	msm_dp_link_send_test_response(ctrl->link);
 
-	pattern_sent = msm_dp_read_link(ctrl->catalog, REG_DP_MAINLINK_READY);
+	pattern_sent = msm_dp_read_link(ctrl, REG_DP_MAINLINK_READY);
 
 	switch (pattern_sent) {
 	case MR_LINK_TRAINING1:
@@ -2391,8 +2403,8 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 		nvid *= 3;
 
 	drm_dbg_dp(ctrl->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
-	msm_dp_write_link(ctrl->catalog, REG_DP_SOFTWARE_MVID, mvid);
-	msm_dp_write_link(ctrl->catalog, REG_DP_SOFTWARE_NVID, nvid);
+	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID, mvid);
+	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
 }
 
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
@@ -2469,7 +2481,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 
 	msm_dp_ctrl_setup_tr_unit(ctrl);
 
-	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
+	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 	if (ret)
@@ -2666,14 +2678,14 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
 
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
 			struct msm_dp_panel *panel,	struct drm_dp_aux *aux,
-			struct msm_dp_catalog *catalog,
-			struct phy *phy)
+			struct phy *phy,
+			void __iomem *ahb_base,
+			void __iomem *link_base)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	int ret;
 
-	if (!dev || !panel || !aux ||
-	    !link || !catalog) {
+	if (!dev || !panel || !aux || !link) {
 		DRM_ERROR("invalid input\n");
 		return ERR_PTR(-EINVAL);
 	}
@@ -2704,9 +2716,10 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	ctrl->panel    = panel;
 	ctrl->aux      = aux;
 	ctrl->link     = link;
-	ctrl->catalog  = catalog;
 	ctrl->dev      = dev;
 	ctrl->phy      = phy;
+	ctrl->ahb_base = ahb_base;
+	ctrl->link_base = link_base;
 
 	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 10a4b7cf0335a584b4db67baca882620d7bab74c..124b9b21bb7f2d8616afcebb2cfaf3a2e7b482d1 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -9,7 +9,6 @@
 #include "dp_aux.h"
 #include "dp_panel.h"
 #include "dp_link.h"
-#include "dp_catalog.h"
 
 struct msm_dp_ctrl {
 	bool wide_bus_en;
@@ -25,10 +24,13 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl);
-struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
-			struct msm_dp_panel *panel,	struct drm_dp_aux *aux,
-			struct msm_dp_catalog *catalog,
-			struct phy *phy);
+struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev,
+				    struct msm_dp_link *link,
+				    struct msm_dp_panel *panel,
+				    struct drm_dp_aux *aux,
+				    struct phy *phy,
+				    void __iomem *ahb_base,
+				    void __iomem *link_base);
 
 void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_phy_init(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 22fd946ee201397b72b43c8499714139deb7ba82..b65b358e98381488ecd0ecb8648dbe76dd6ff310 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -9,7 +9,6 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_file.h>
 
-#include "dp_catalog.h"
 #include "dp_aux.h"
 #include "dp_ctrl.h"
 #include "dp_debug.h"
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ee925eca88669602f8e45e79242f6a4c104f2f07..9bcab4d3315c2d61cd13b5f6930ae324fe53231c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -17,7 +17,6 @@
 #include "msm_drv.h"
 #include "msm_kms.h"
 #include "dp_ctrl.h"
-#include "dp_catalog.h"
 #include "dp_aux.h"
 #include "dp_reg.h"
 #include "dp_link.h"
@@ -85,7 +84,6 @@ struct msm_dp_display_private {
 
 	struct drm_device *drm_dev;
 
-	struct msm_dp_catalog *catalog;
 	struct drm_dp_aux *aux;
 	struct msm_dp_link    *link;
 	struct msm_dp_panel   *panel;
@@ -110,6 +108,18 @@ struct msm_dp_display_private {
 	bool wide_bus_supported;
 
 	struct msm_dp_audio *audio;
+
+	void __iomem *ahb_base;
+	size_t ahb_len;
+
+	void __iomem *aux_base;
+	size_t aux_len;
+
+	void __iomem *link_base;
+	size_t link_len;
+
+	void __iomem *p0_base;
+	size_t p0_len;
 };
 
 struct msm_dp_desc {
@@ -734,21 +744,10 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 			      dp->msm_dp_display.is_edp ? PHY_SUBMODE_EDP : PHY_SUBMODE_DP);
 	if (rc) {
 		DRM_ERROR("failed to set phy submode, rc = %d\n", rc);
-		dp->catalog = NULL;
-		goto error;
-	}
-
-	dp->catalog = msm_dp_catalog_get(dev);
-	if (IS_ERR(dp->catalog)) {
-		rc = PTR_ERR(dp->catalog);
-		DRM_ERROR("failed to initialize catalog, rc = %d\n", rc);
-		dp->catalog = NULL;
 		goto error;
 	}
 
-	dp->aux = msm_dp_aux_get(dev, dp->catalog,
-			     phy,
-			     dp->msm_dp_display.is_edp);
+	dp->aux = msm_dp_aux_get(dev, phy, dp->msm_dp_display.is_edp, dp->aux_base);
 	if (IS_ERR(dp->aux)) {
 		rc = PTR_ERR(dp->aux);
 		DRM_ERROR("failed to initialize aux, rc = %d\n", rc);
@@ -764,7 +763,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		goto error_link;
 	}
 
-	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->catalog);
+	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->p0_base);
 	if (IS_ERR(dp->panel)) {
 		rc = PTR_ERR(dp->panel);
 		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
@@ -773,8 +772,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 	}
 
 	dp->ctrl = msm_dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
-			       dp->catalog,
-			       phy);
+			       phy, dp->ahb_base, dp->link_base);
 	if (IS_ERR(dp->ctrl)) {
 		rc = PTR_ERR(dp->ctrl);
 		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
@@ -782,7 +780,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		goto error_ctrl;
 	}
 
-	dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp->catalog);
+	dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp->link_base);
 	if (IS_ERR(dp->audio)) {
 		rc = PTR_ERR(dp->audio);
 		pr_err("failed to initialize audio, rc = %d\n", rc);
@@ -1017,7 +1015,14 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 		return;
 	}
 
-	msm_dp_catalog_snapshot(msm_dp_display->catalog, disp_state);
+	msm_disp_snapshot_add_block(disp_state, msm_dp_display->ahb_len,
+				    msm_dp_display->ahb_base, "dp_ahb");
+	msm_disp_snapshot_add_block(disp_state, msm_dp_display->aux_len,
+				    msm_dp_display->aux_base, "dp_aux");
+	msm_disp_snapshot_add_block(disp_state, msm_dp_display->link_len,
+				    msm_dp_display->link_base, "dp_link");
+	msm_disp_snapshot_add_block(disp_state, msm_dp_display->p0_len,
+				    msm_dp_display->p0_base, "dp_p0");
 
 	mutex_unlock(&msm_dp_display->event_mutex);
 }
@@ -1264,6 +1269,80 @@ static int msm_dp_display_get_connector_type(struct platform_device *pdev,
 	return connector_type;
 }
 
+static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
+{
+	struct resource *res;
+	void __iomem *base;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, idx, &res);
+	if (!IS_ERR(base))
+		*len = resource_size(res);
+
+	return base;
+}
+
+#define DP_DEFAULT_AHB_OFFSET	0x0000
+#define DP_DEFAULT_AHB_SIZE	0x0200
+#define DP_DEFAULT_AUX_OFFSET	0x0200
+#define DP_DEFAULT_AUX_SIZE	0x0200
+#define DP_DEFAULT_LINK_OFFSET	0x0400
+#define DP_DEFAULT_LINK_SIZE	0x0C00
+#define DP_DEFAULT_P0_OFFSET	0x1000
+#define DP_DEFAULT_P0_SIZE	0x0400
+
+static int msm_dp_display_get_io(struct msm_dp_display_private *display)
+{
+	struct platform_device *pdev = display->msm_dp_display.pdev;
+
+	display->ahb_base = msm_dp_ioremap(pdev, 0, &display->ahb_len);
+	if (IS_ERR(display->ahb_base))
+		return PTR_ERR(display->ahb_base);
+
+	display->aux_base = msm_dp_ioremap(pdev, 1, &display->aux_len);
+	if (IS_ERR(display->aux_base)) {
+		if (display->aux_base != ERR_PTR(-EINVAL)) {
+			DRM_ERROR("unable to remap aux region: %pe\n", display->aux_base);
+			return PTR_ERR(display->aux_base);
+		}
+
+		/*
+		 * The initial binding had a single reg, but in order to
+		 * support variation in the sub-region sizes this was split.
+		 * msm_dp_ioremap() will fail with -EINVAL here if only a single
+		 * reg is specified, so fill in the sub-region offsets and
+		 * lengths based on this single region.
+		 */
+		if (display->ahb_len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
+			DRM_ERROR("legacy memory region not large enough\n");
+			return -EINVAL;
+		}
+
+		display->ahb_len = DP_DEFAULT_AHB_SIZE;
+		display->aux_base = display->ahb_base + DP_DEFAULT_AUX_OFFSET;
+		display->aux_len = DP_DEFAULT_AUX_SIZE;
+		display->link_base = display->ahb_base + DP_DEFAULT_LINK_OFFSET;
+		display->link_len = DP_DEFAULT_LINK_SIZE;
+		display->p0_base = display->ahb_base + DP_DEFAULT_P0_OFFSET;
+		display->p0_len = DP_DEFAULT_P0_SIZE;
+
+		return 0;
+	}
+
+	display->link_base = msm_dp_ioremap(pdev, 2, &display->link_len);
+	if (IS_ERR(display->link_base)) {
+		DRM_ERROR("unable to remap link region: %pe\n", display->link_base);
+		return PTR_ERR(display->link_base);
+	}
+
+	display->p0_base = msm_dp_ioremap(pdev, 3, &display->p0_len);
+	if (IS_ERR(display->p0_base)) {
+		DRM_ERROR("unable to remap p0 region: %pe\n", display->p0_base);
+		return PTR_ERR(display->p0_base);
+	}
+
+	return 0;
+}
+
 static int msm_dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
@@ -1290,6 +1369,10 @@ static int msm_dp_display_probe(struct platform_device *pdev)
 	dp->msm_dp_display.is_edp =
 		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
 
+	rc = msm_dp_display_get_io(dp);
+	if (rc)
+		return rc;
+
 	rc = msm_dp_init_sub_modules(dp);
 	if (rc) {
 		DRM_ERROR("init sub module failed\n");
@@ -1635,8 +1718,6 @@ void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 	/* populate wide_bus_support to different layers */
 	msm_dp_display->ctrl->wide_bus_en =
 		msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
-	msm_dp_display->catalog->wide_bus_en =
-		msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
 }
 
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 1a1fbb2d7d4f2afcaace85d97b744d03017d37ce..48fc248c7a114139e153262f404c80743c189718 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -5,6 +5,7 @@
 
 #define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
 
+#include <drm/drm_device.h>
 #include <drm/drm_print.h>
 
 #include "dp_reg.h"
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 969d618c909876fd7a13aeb6e6c9e117071bc682..8a4bc6f44e9b14ebeeb1c84ecde2673d13ac7f88 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -23,10 +23,46 @@ struct msm_dp_panel_private {
 	struct msm_dp_panel msm_dp_panel;
 	struct drm_dp_aux *aux;
 	struct msm_dp_link *link;
-	struct msm_dp_catalog *catalog;
+	void __iomem *link_base;
+	void __iomem *p0_base;
 	bool panel_on;
 };
 
+static inline u32 msm_dp_read_link(struct msm_dp_panel_private *panel, u32 offset)
+{
+	return readl_relaxed(panel->link_base + offset);
+}
+
+static inline void msm_dp_write_link(struct msm_dp_panel_private *panel,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure link reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, panel->link_base + offset);
+}
+
+static inline void msm_dp_write_p0(struct msm_dp_panel_private *panel,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure interface reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, panel->p0_base + offset);
+}
+
+static inline u32 msm_dp_read_p0(struct msm_dp_panel_private *panel,
+			       u32 offset)
+{
+	/*
+	 * To make sure interface reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	return readl_relaxed(panel->p0_base + offset);
+}
+
 static void msm_dp_panel_read_psr_cap(struct msm_dp_panel_private *panel)
 {
 	ssize_t rlen;
@@ -250,7 +286,6 @@ static void msm_dp_panel_tpg_enable(struct msm_dp_panel *msm_dp_panel,
 {
 	struct msm_dp_panel_private *panel =
 		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
-	struct msm_dp_catalog *catalog = panel->catalog;
 	u32 hsync_period, vsync_period;
 	u32 display_v_start, display_v_end;
 	u32 hsync_start_x, hsync_end_x;
@@ -282,33 +317,33 @@ static void msm_dp_panel_tpg_enable(struct msm_dp_panel *msm_dp_panel,
 	display_hctl = (hsync_end_x << 16) | hsync_start_x;
 
 
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
+	msm_dp_write_p0(panel, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
 			hsync_period);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
+	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
 			hsync_period);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_HCTL, 0);
-	msm_dp_write_p0(catalog, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
-	msm_dp_write_p0(catalog, MMSS_INTF_DISPLAY_V_START_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_POLARITY_CTL, 0);
-
-	msm_dp_write_p0(catalog, MMSS_DP_TPG_MAIN_CONTROL,
+	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_HCTL, 0);
+	msm_dp_write_p0(panel, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
+	msm_dp_write_p0(panel, MMSS_INTF_DISPLAY_V_START_F1, 0);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_POLARITY_CTL, 0);
+
+	msm_dp_write_p0(panel, MMSS_DP_TPG_MAIN_CONTROL,
 				DP_TPG_CHECKERED_RECT_PATTERN);
-	msm_dp_write_p0(catalog, MMSS_DP_TPG_VIDEO_CONFIG,
+	msm_dp_write_p0(panel, MMSS_DP_TPG_VIDEO_CONFIG,
 				DP_TPG_VIDEO_CONFIG_BPP_8BIT |
 				DP_TPG_VIDEO_CONFIG_RGB);
-	msm_dp_write_p0(catalog, MMSS_DP_BIST_ENABLE,
+	msm_dp_write_p0(panel, MMSS_DP_BIST_ENABLE,
 				DP_BIST_ENABLE_DPBIST_EN);
-	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN,
+	msm_dp_write_p0(panel, MMSS_DP_TIMING_ENGINE_EN,
 				DP_TIMING_ENGINE_EN_EN);
 	drm_dbg_dp(panel->drm_dev, "%s: enabled tpg\n", __func__);
 }
@@ -317,11 +352,10 @@ static void msm_dp_panel_tpg_disable(struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_panel_private *panel =
 		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
-	struct msm_dp_catalog *catalog = panel->catalog;
 
-	msm_dp_write_p0(catalog, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
-	msm_dp_write_p0(catalog, MMSS_DP_BIST_ENABLE, 0x0);
-	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
+	msm_dp_write_p0(panel, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
+	msm_dp_write_p0(panel, MMSS_DP_BIST_ENABLE, 0x0);
+	msm_dp_write_p0(panel, MMSS_DP_TIMING_ENGINE_EN, 0x0);
 }
 
 void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable)
@@ -354,27 +388,25 @@ void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_panel_private *panel =
 		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
-	struct msm_dp_catalog *catalog = panel->catalog;
 
-	msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
+	msm_dp_write_p0(panel, MMSS_DP_DSC_DTO, 0x0);
 }
 
 static void msm_dp_panel_send_vsc_sdp(struct msm_dp_panel_private *panel, struct dp_sdp *vsc_sdp)
 {
-	struct msm_dp_catalog *msm_dp_catalog = panel->catalog;
 	u32 header[2];
 	u32 val;
 	int i;
 
 	msm_dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
 
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_0, header[0]);
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_1, header[1]);
+	msm_dp_write_link(panel, MMSS_DP_GENERIC0_0, header[0]);
+	msm_dp_write_link(panel, MMSS_DP_GENERIC0_1, header[1]);
 
 	for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
 		val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
 		       (vsc_sdp->db[i + 3] << 24));
-		msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_2 + i, val);
+		msm_dp_write_link(panel, MMSS_DP_GENERIC0_2 + i, val);
 	}
 }
 
@@ -384,8 +416,8 @@ static void msm_dp_panel_update_sdp(struct msm_dp_panel_private *panel)
 
 	if (hw_revision >= DP_HW_VERSION_1_0 &&
 	    hw_revision < DP_HW_VERSION_1_2) {
-		msm_dp_write_link(panel->catalog, MMSS_DP_SDP_CFG3, UPDATE_SDP);
-		msm_dp_write_link(panel->catalog, MMSS_DP_SDP_CFG3, 0x0);
+		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3, UPDATE_SDP);
+		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3, 0x0);
 	}
 }
 
@@ -393,18 +425,17 @@ void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sd
 {
 	struct msm_dp_panel_private *panel =
 		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
-	struct msm_dp_catalog *msm_dp_catalog = panel->catalog;
 	u32 cfg, cfg2, misc;
 
-	cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
-	cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
-	misc = msm_dp_read_link(msm_dp_catalog, REG_DP_MISC1_MISC0);
+	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG);
+	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2);
+	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0);
 
 	cfg |= GEN0_SDP_EN;
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, cfg);
+	msm_dp_write_link(panel, MMSS_DP_SDP_CFG, cfg);
 
 	cfg2 |= GENERIC0_SDPSIZE_VALID;
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, cfg2);
+	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2, cfg2);
 
 	msm_dp_panel_send_vsc_sdp(panel, vsc_sdp);
 
@@ -414,7 +445,7 @@ void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sd
 	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=1\n");
 
 	pr_debug("misc settings = 0x%x\n", misc);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MISC1_MISC0, misc);
+	msm_dp_write_link(panel, REG_DP_MISC1_MISC0, misc);
 
 	msm_dp_panel_update_sdp(panel);
 }
@@ -423,18 +454,17 @@ void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_panel_private *panel =
 		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
-	struct msm_dp_catalog *msm_dp_catalog = panel->catalog;
 	u32 cfg, cfg2, misc;
 
-	cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
-	cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
-	misc = msm_dp_read_link(msm_dp_catalog, REG_DP_MISC1_MISC0);
+	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG);
+	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2);
+	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0);
 
 	cfg &= ~GEN0_SDP_EN;
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, cfg);
+	msm_dp_write_link(panel, MMSS_DP_SDP_CFG, cfg);
 
 	cfg2 &= ~GENERIC0_SDPSIZE_VALID;
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, cfg2);
+	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2, cfg2);
 
 	/* switch back to MSA */
 	misc &= ~DP_MISC1_VSC_SDP;
@@ -442,7 +472,7 @@ void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel)
 	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=0\n");
 
 	pr_debug("misc settings = 0x%x\n", misc);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MISC1_MISC0, misc);
+	msm_dp_write_link(panel, REG_DP_MISC1_MISC0, misc);
 
 	msm_dp_panel_update_sdp(panel);
 }
@@ -490,10 +520,9 @@ static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
 	return 0;
 }
 
-int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel)
+int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 {
 	u32 data, total_ver, total_hor;
-	struct msm_dp_catalog *catalog;
 	struct msm_dp_panel_private *panel;
 	struct drm_display_mode *drm_mode;
 	u32 width_blanking;
@@ -503,7 +532,6 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel)
 	u32 reg;
 
 	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
-	catalog = panel->catalog;
 	drm_mode = &panel->msm_dp_panel.msm_dp_mode.drm_mode;
 
 	drm_dbg_dp(panel->drm_dev, "width=%d hporch= %d %d %d\n",
@@ -546,20 +574,20 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel)
 
 	msm_dp_active = data;
 
-	msm_dp_write_link(catalog, REG_DP_TOTAL_HOR_VER, total);
-	msm_dp_write_link(catalog, REG_DP_START_HOR_VER_FROM_SYNC, sync_start);
-	msm_dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
-	msm_dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
+	msm_dp_write_link(panel, REG_DP_TOTAL_HOR_VER, total);
+	msm_dp_write_link(panel, REG_DP_START_HOR_VER_FROM_SYNC, sync_start);
+	msm_dp_write_link(panel, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
+	msm_dp_write_link(panel, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
 
-	reg = msm_dp_read_p0(catalog, MMSS_DP_INTF_CONFIG);
-	if (catalog->wide_bus_en)
+	reg = msm_dp_read_p0(panel, MMSS_DP_INTF_CONFIG);
+	if (wide_bus_en)
 		reg |= DP_INTF_CONFIG_DATABUS_WIDEN;
 	else
 		reg &= ~DP_INTF_CONFIG_DATABUS_WIDEN;
 
-	drm_dbg_dp(panel->drm_dev, "wide_bus_en=%d reg=%#x\n", catalog->wide_bus_en, reg);
+	drm_dbg_dp(panel->drm_dev, "wide_bus_en=%d reg=%#x\n", wide_bus_en, reg);
 
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, reg);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_CONFIG, reg);
 
 	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
 		msm_dp_panel_setup_vsc_sdp_yuv_420(msm_dp_panel);
@@ -663,13 +691,15 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
 }
 
 struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
-			      struct msm_dp_link *link, struct msm_dp_catalog *catalog)
+			      struct msm_dp_link *link,
+			      void __iomem *link_base,
+			      void __iomem *p0_base)
 {
 	struct msm_dp_panel_private *panel;
 	struct msm_dp_panel *msm_dp_panel;
 	int ret;
 
-	if (!dev || !catalog || !aux || !link) {
+	if (!dev || !aux || !link) {
 		DRM_ERROR("invalid input\n");
 		return ERR_PTR(-EINVAL);
 	}
@@ -680,8 +710,9 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 
 	panel->dev = dev;
 	panel->aux = aux;
-	panel->catalog = catalog;
 	panel->link = link;
+	panel->link_base = link_base;
+	panel->p0_base = p0_base;
 
 	msm_dp_panel = &panel->msm_dp_panel;
 	msm_dp_panel->max_bw_code = DP_LINK_BW_8_1;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index c348417bb07f33efdf1402a73c27ff99e394e5a3..d2cf401506dcbaf553192d5e18c87207337664ab 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -6,6 +6,7 @@
 #ifndef _DP_PANEL_H_
 #define _DP_PANEL_H_
 
+#include <drm/drm_modes.h>
 #include <drm/msm_drm.h>
 
 #include "dp_aux.h"
@@ -48,7 +49,7 @@ struct msm_dp_panel {
 
 int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_deinit(struct msm_dp_panel *msm_dp_panel);
-int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel);
+int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en);
 int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 		struct drm_connector *connector);
 u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bpp,
@@ -91,6 +92,8 @@ static inline bool is_lane_count_valid(u32 lane_count)
 }
 
 struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
-			      struct msm_dp_link *link, struct msm_dp_catalog *catalog);
+			      struct msm_dp_link *link,
+			      void __iomem *link_base,
+			      void __iomem *p0_base);
 void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel);
 #endif /* _DP_PANEL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index d17e077ded73251624b5fb1bfbd8f213b4a86d65..7c44d4e2cf13960b5ab3277b1581ebbd539d4f65 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -11,6 +11,8 @@
 
 /* DP_TX Registers */
 #define REG_DP_HW_VERSION			(0x00000000)
+#define DP_HW_VERSION_1_0	0x10000000
+#define DP_HW_VERSION_1_2	0x10020000
 
 #define REG_DP_SW_RESET				(0x00000010)
 #define DP_SW_RESET				(0x00000001)

-- 
2.39.5

