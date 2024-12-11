Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 639A29EDBE6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 00:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D2710EC78;
	Wed, 11 Dec 2024 23:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HbSGbsjA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C2110EC78
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 23:41:57 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53e399e3310so13918e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 15:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733960515; x=1734565315; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Y+0oWOHvpCFQk9kwPId3uMAsxICA55PC09FLWk/2MSQ=;
 b=HbSGbsjA6D08Rh3yksfBm4xIia30BaiIybW4Pzow9/PMW3twL5dQ9Nm6OF8A3ntjJq
 vTU+4NpSFmYgq61FwOJy6Evh/9qsuA/a0MWyx+sJ120XeJJjkB+seUc6eXxftd+/YY1t
 8lpt06yf4vFIxGaxRC3QTaNavdMJwbtgb9LjjaQxaE/E0ed0XEKlXUMdqRdl6uRxKK6e
 SfVbQ7pH3scP4q0JhJBj2CKyr2xQRq7CkN0mcbC56wcneQRG08eGgQle95RckUfLvs3Y
 g67QdA652/V8zpwZMH36j2iQj1Nm3qk+OWgaTQZrnBeQbVTGFMIgMKhdqpxHGyVkltck
 asog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733960515; x=1734565315;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y+0oWOHvpCFQk9kwPId3uMAsxICA55PC09FLWk/2MSQ=;
 b=ef6tFkghlJpYap+vSrixRAMuf/Q0zEJoL6TGG76GYW00IcebwzF7HqQPjO3bW0Veoj
 eW3mm16RaQbDeGFUdhSdosBDhSIVXQ6a0443wEmbJ6HyQRGm0Cg0Bs0C7J5pCb0mR19U
 L50bhi/3KR4YIabh3CY7eUtScit298rmGCZIoKr7i7NkMgaXs7PL/R9hVMVPnvZbfDSk
 oE6VR+gcxjmz+pw6IodGAOQ0AIAHMPl3Bz8glWRN//XCAy8pkkQiEYMN342ChslApIAf
 wuPZAI8vZu5/NMeTwk5Lp/00EmmhQj51G1hVB178w/7kSSEbXq/qIXCea9IXXGKZH6gw
 lhFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHUNHQVlxHasTRIygCTliWsHqRg9CQ50l8BTppe4xHuuIOcKWYP1jjz2HYgLDsZ1Sk+oW61+O5N8s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz803tuAFcVEhJDv7NadaNkE3zKkZgnIePqxjhCZCiWtpiyu4dq
 neKDPSynhBaIg8cxKMT8kw05mYL2tQbysuEnqSuSZQNe+l6NKD0fI0508WwbGgY=
X-Gm-Gg: ASbGncvp4cYmgpCLnEL6MqR4hhHYdQCW+/wowiJto52aUhYDQLrvnz1NBykGGRDzE0W
 rAZafV6+seLOeWoaGuTui32f5cQ4w9hNrWPRMUzZPFXibXUcwjJZsTsy3cvgR5byeUR8CsDjk3w
 sMD4wVUKU5/jdpyApEy6Ta5DaU/pZoq9kABehHMqQLL/Bi8bYF6jvTwhZMOPgJ94M8aXkRJ23jA
 quS2vs6N+dnDlrFqGMCTEiqksbffDHFKePn2BsdRVkxdfhyxpiHckLyQvIENA==
X-Google-Smtp-Source: AGHT+IGrZeWmmO/IV0DqjFEM05Da+kuQ3jbU7GsJzicVYzn+08EtfA7Mt9CNqojY6VnOlEIXauQu0g==
X-Received: by 2002:a05:6512:e86:b0:540:1d58:da7d with SMTP id
 2adb3069b0e04-5402f04cf43mr407667e87.53.1733960515383; 
 Wed, 11 Dec 2024 15:41:55 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401cc76909sm1222207e87.58.2024.12.11.15.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 15:41:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 01:41:38 +0200
Subject: [PATCH v3 03/14] drm/msm/dp: drop msm_dp_panel_dump_regs() and
 msm_dp_catalog_dump_regs()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-fd-dp-audio-fixup-v3-3-0b1c65e7dba3@linaro.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4615;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FVES12zsEtXLuC6xJIos7OOXAkyUs36V3qwdQ7KOf4M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnWiM3OqXSBoZIQNL87XVEdEM2hVVVhYq/3wp2p
 hU6BN0VlB6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1ojNwAKCRCLPIo+Aiko
 1X4uB/4+fJmgL1PY3+NpmwLJ7bradwADla6mL4Vx5Ixqw/2mGWXQPCP+Go+qgmUtmt08hue2jeN
 brqyl3hVGbAVIXF7uS1N0B40kF5k/8Ar3RcAQkZEG/0Z1yInkcsk3rhtxhzrVJK5W/wlPQxfbHG
 GdboDsLAwBgPXzHFtVtX1MSEK0ff0u+1KB7b0+63CzISuDsspCMsH601+W0ld2oquQBQ3IaNwpr
 fQ7dOc9aekIffC20I9/Nj98yOzwz0IvfUDK3sM5uDWSvGtHLft4QdcFyFl2b8LDTRPIqtkq+0gt
 AFFuC5dw9CLuCKaV1reI+kjUrT2/AXh7jeUjXCTthLVW1uHN
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

The msm_dp_panel_dump_regs() and msm_dp_catalog_dump_regs() are not
called anywhere. If there is a necessity to dump registers, the
snapshotting should be used instead. Drop these two functions.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 37 -------------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  1 -
 drivers/gpu/drm/msm/dp/dp_panel.c   | 11 -----------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  1 -
 4 files changed, 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index b4c8856fb25d01dd1b30c5ec33ce821aafa9551d..0357dec1acd5773f25707e7ebdfca4b1d2b1bb4e 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -276,43 +276,6 @@ int msm_dp_catalog_aux_wait_for_hpd_connect_state(struct msm_dp_catalog *msm_dp_
 				min(wait_us, 2000), wait_us);
 }
 
-static void dump_regs(void __iomem *base, int len)
-{
-	int i;
-	u32 x0, x4, x8, xc;
-	u32 addr_off = 0;
-
-	len = DIV_ROUND_UP(len, 16);
-	for (i = 0; i < len; i++) {
-		x0 = readl_relaxed(base + addr_off);
-		x4 = readl_relaxed(base + addr_off + 0x04);
-		x8 = readl_relaxed(base + addr_off + 0x08);
-		xc = readl_relaxed(base + addr_off + 0x0c);
-
-		pr_info("%08x: %08x %08x %08x %08x", addr_off, x0, x4, x8, xc);
-		addr_off += 16;
-	}
-}
-
-void msm_dp_catalog_dump_regs(struct msm_dp_catalog *msm_dp_catalog)
-{
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-	struct dss_io_data *io = &catalog->io;
-
-	pr_info("AHB regs\n");
-	dump_regs(io->ahb.base, io->ahb.len);
-
-	pr_info("AUXCLK regs\n");
-	dump_regs(io->aux.base, io->aux.len);
-
-	pr_info("LCLK regs\n");
-	dump_regs(io->link.base, io->link.len);
-
-	pr_info("P0CLK regs\n");
-	dump_regs(io->p0.base, io->p0.len);
-}
-
 u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog)
 {
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index e932b17eecbf514070cd8cd0b98ca0fefbe81ab7..62a401d8f75a6af06445a42af657d65e3fe542c5 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -104,7 +104,6 @@ int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 t
 				u32 sync_start, u32 width_blanking, u32 msm_dp_active);
 void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog, struct dp_sdp *vsc_sdp);
 void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_dump_regs(struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
 				struct drm_display_mode *drm_mode);
 void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 5d7eaa31bf3176566f40f01ff636bee64e81c64f..7d122496723a32fd591d094269397a9fdd51fe44 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -317,17 +317,6 @@ static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
 	return 0;
 }
 
-void msm_dp_panel_dump_regs(struct msm_dp_panel *msm_dp_panel)
-{
-	struct msm_dp_catalog *catalog;
-	struct msm_dp_panel_private *panel;
-
-	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
-	catalog = panel->catalog;
-
-	msm_dp_catalog_dump_regs(catalog);
-}
-
 int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel)
 {
 	u32 data, total_ver, total_hor;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 0e944db3adf2f187f313664fe80cf540ec7a19f2..47c1d349be470b60596b64a7bc8c7c39d2e8fdd1 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -55,7 +55,6 @@ struct msm_dp_panel {
 int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_deinit(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel);
-void msm_dp_panel_dump_regs(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 		struct drm_connector *connector);
 u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bpp,

-- 
2.39.5

