Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D109FA7F2
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 21:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9341D10E1E9;
	Sun, 22 Dec 2024 20:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EMIfRPZ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06D110E110
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 20:14:15 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-3043e84c687so30898981fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 12:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734898454; x=1735503254; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=B5tbBwnpZQbD0yfgDnGnJ8OogrrRF+xt8+ZXSEBMtmg=;
 b=EMIfRPZ12IkZN5KYHLdUjl1hu4YQbNgMw7hNoHl1nfYJ0rLtgeNDEc5XzPJ+XEbJpP
 SdG213xGZnhTYvSD813DvtrYV97LwUBKTUFmT2Lc4bj2jnSpczKa0wSC/huptBn0Q3q1
 miNYxzOaniNBhAy4+2KUymGiz40Me+dQNgQAwcpBMUlRrK8tihqgjlnyJljIH66w0LAb
 iRZELAkhhNj3hqZGypC3x/ndbuaeSjlPqlVNJZn7/0V/RuptWk/CVbhvP8PrnHWXxOu8
 /Sjtu+cAWTGD0ydMvJ6RhE1d4k7QsW+/Zf6lTy5Zub/QhV3ftiwOp22aLVQpYGYTYB0d
 eN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734898454; x=1735503254;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B5tbBwnpZQbD0yfgDnGnJ8OogrrRF+xt8+ZXSEBMtmg=;
 b=d/syaUUH57ZYzicUxWmbseXDQjN7G+6zXEpW/nvfiO0bNjOyUKLtG6l87SU7IYj1VY
 xfGKqIJvrZH4NGBfOVbMUjJYKgAZiLexeo9AvmmosGbrM1wukz5CgsXPy96m2OM6KZ0G
 6Ij+dGwl1lrb9+f28a25vVyEk03HaiF2vSb/lo6o4AViQqVw6M3ubgBIuwjVZ+1DpcnE
 FZ9oTNagTRW3nCqfMC4Qy8TC2sIUEt/HYzZjY/vdCPWAYaSJahFrVZkA0ElYnrBz57X5
 hV9wtizfDPhZmu8VlVQ1m1aHUBInNYx9O2P6vAvhka8bBIYzHfS2pfvHW3xBxoWT2dhf
 o+vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMwir+4DbODAurQuCeakoxydpcxe+d7xch24I6pR5slvAQ8A/0iCuyDX24WwzhquxTSjwBWP0a/F0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLV9SZ8GkgYi73HJQJ72PEcZP0DqFkpn0D6COpyCwDtK3jb+hB
 nbqmJVe+8AxinQzWwxmP2ymw5AYOWng40SmJ8Bbhz1pM8Nj+l0Mlnw9JdrtxWsU=
X-Gm-Gg: ASbGncsezLS4xTLRZGYIuifKPGycEiEg7AKwJTOIHr3hiewM+uaOiTwNysn8cUaHFzj
 arGbGm7spUeHfFW+/Cb58UairGnRUDH07A55xFtUZ8DKkFq6YKmx5nrz68RKZz36aq8O2xvx9PN
 v1T9ngPh+zjK5KYitBefGTkMsuRv6xv++uMkdCfA2XU72uSn8NXUDed0EmjYD+d7IdoDj6djUmI
 Tc7GFCbjD3QiA1ZYLWZssAPBz0MIHZnjkKgZ9hb5PQY5idLcGCT5C9svd4Q+KQI
X-Google-Smtp-Source: AGHT+IH2Ic5ZdSEegl4EaJ4Q3EhXIU4z8X7lRiyvx+Sp/ZxjxS25B473GBusBgE3FZdXHSzCT0dYlA==
X-Received: by 2002:a05:6512:1055:b0:540:269d:3017 with SMTP id
 2adb3069b0e04-54229533dbcmr3578999e87.18.1734898454265; 
 Sun, 22 Dec 2024 12:14:14 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f7765sm1034331e87.13.2024.12.22.12.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2024 12:14:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 22:14:05 +0200
Subject: [PATCH v5 02/11] drm/msm/dp: read hw revision only once
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-fd-dp-audio-fixup-v5-2-370f09492cf6@linaro.org>
References: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
In-Reply-To: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4182;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZQK3De9spKq2bOT0Hl1HvbbvggyGKbTI3+3PIdSsFLY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaHMN64yI3FonnpxfQhjZ/o9sM5NujZ5qSSL8K
 l2ZABxBqVOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2hzDQAKCRCLPIo+Aiko
 1bwRB/9ZnCYL7Vg7RlwIqjQ2vzjSxspFT7p9mRiAqtYAz/4CsH/oX15+mFkWFAdKfLFybiqtTc9
 QDx39d/QmAb4GH5bq73+Iq73gNQPO7LG5bXvgeF6Kipx3/PAi/kwj02fr2ElA0CZ/EIfRDhd3gU
 YwDn28J8pfBBryxNy4crlFebxSZqpJ3MjMWcwW44czxBEi66vNl/uVZS3T0gqqBlD/JG8Wol6r7
 lyhPa9+88jCt6j8Rtqmj2R+1R8xZLSVCdIf7rX8e/hjhlf2+7R9S3n3LF+pSbGWEZJNz2LJu7r4
 8IxLVDfULxJ4WO033BQTMg3WYqeBGKVrCbW81OZRX8toH6RB
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

There is little point in rereading DP controller revision over and over
again. Read it once, after the first software reset.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 29 ++++++++---------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
 2 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 4f80eceb6ae19f542110d7379007f57c2ac16a8a..23f9fcb75123a58b3a4b69d3dad0598135108eec 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -414,14 +414,13 @@ void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog,
 
 void msm_dp_catalog_setup_peripheral_flush(struct msm_dp_catalog *msm_dp_catalog)
 {
-	u32 mainlink_ctrl, hw_revision;
+	u32 mainlink_ctrl;
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
 				struct msm_dp_catalog_private, msm_dp_catalog);
 
 	mainlink_ctrl = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
 
-	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
-	if (hw_revision >= DP_HW_VERSION_1_2)
+	if (msm_dp_catalog->hw_revision >= DP_HW_VERSION_1_2)
 		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
 	else
 		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
@@ -514,22 +513,6 @@ int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_cata
 	return 0;
 }
 
-/**
- * msm_dp_catalog_hw_revision() - retrieve DP hw revision
- *
- * @msm_dp_catalog: DP catalog structure
- *
- * Return: DP controller hw revision
- *
- */
-u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog)
-{
-	const struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	return msm_dp_read_ahb(catalog, REG_DP_HW_VERSION);
-}
-
 /**
  * msm_dp_catalog_ctrl_reset() - reset DP controller
  *
@@ -556,6 +539,9 @@ void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog)
 
 	sw_reset &= ~DP_SW_RESET;
 	msm_dp_write_ahb(catalog, REG_DP_SW_RESET, sw_reset);
+
+	if (!msm_dp_catalog->hw_revision)
+		msm_dp_catalog->hw_revision = msm_dp_read_ahb(catalog, REG_DP_HW_VERSION);
 }
 
 bool msm_dp_catalog_ctrl_mainlink_ready(struct msm_dp_catalog *msm_dp_catalog)
@@ -895,9 +881,10 @@ static void msm_dp_catalog_panel_update_sdp(struct msm_dp_catalog *msm_dp_catalo
 	u32 hw_revision;
 
 	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
+	hw_revision = msm_dp_catalog->hw_revision;
 
-	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
-	if (hw_revision < DP_HW_VERSION_1_2 && hw_revision >= DP_HW_VERSION_1_0) {
+	if (hw_revision < DP_HW_VERSION_1_2 &&
+	    hw_revision >= DP_HW_VERSION_1_0) {
 		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x01);
 		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x00);
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 08bb42e91b779633875dbeb4130bc55a6571cfb1..379fa4fef9ceb63b20c4aec2fca1e09003dc738b 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -33,6 +33,7 @@
 
 struct msm_dp_catalog {
 	bool wide_bus_en;
+	u32 hw_revision;
 };
 
 /* Debug module */
@@ -61,7 +62,6 @@ void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog, u32
 void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog, u32 rate,
 				u32 stream_rate_khz, bool is_ycbcr_420);
 int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_catalog, u32 pattern);
-u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog);
 bool msm_dp_catalog_ctrl_mainlink_ready(struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog, bool enable);

-- 
2.39.5

