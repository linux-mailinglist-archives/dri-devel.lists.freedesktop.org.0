Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C14189DFE20
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 11:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C6D10E6AE;
	Mon,  2 Dec 2024 10:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bCJ1F21U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5727A10E6A5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 10:06:49 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53df7f6a133so4240147e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 02:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733134007; x=1733738807; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VKmZ4meMm9nE0dI/BvNTGi28DshZDKFMZdPFX/d5o80=;
 b=bCJ1F21UCNRrEJno65Luz+lBnpTIHC43Ht0m53bfW3FuqwYE50WdfiuWdpT7EhfLHE
 jRl7rR9XgDAf7JFChC7A7kH8EnqIKL1Vk5QxCLb/6kpgW111na8zDQFOIUxGKeMuzZgd
 xub7HbFw1G+F3K58ZLK54fLXA3rNH2DQho9znkiss/SgZOvls3ZdoM4HY9xX7CyYs3ss
 Ee6wOrylrEVBazxG4uHmz3R69hF9dXlInZnWrIHdXPc4PNEjTB+qcSedKpZJMZ6Se2al
 f4w1O7MqRq7WptXvepyvJB48ykUAk1haNpUgIhCPOMSGpYcBGjRJMqoDYBuHYey4XHGO
 ESTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733134007; x=1733738807;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VKmZ4meMm9nE0dI/BvNTGi28DshZDKFMZdPFX/d5o80=;
 b=QRQkiacR7E4WmbxKa4BvXlXJg3BmfmmoyVxx9Bk6kf/obKQEn401auOkWbKAmxCq/I
 V6LfeTuQwJYbO/0RpnMJHXiWqr+bAkSeRtY8EJmXOLXWlygeEeGK8LNqDQucyhrsJ3CS
 aOpS5AAlgTj/FKfaqYHcEcjMYgH6DNPmkYXHGPmso7YslW/aC2fEs7I7sLt/hRYf7Zjy
 qCmWyHUsHqR3Kcsm8TMfOaX/+W1Rncv61eDZVS0Ks5lMCXpJQf+jjPCXxos4aYQk7Awg
 NklsYB1IILh8TRiywsohfUSsUdbKzzat5tRZT7HuKVZ+DBbh8Vq3Yi7s3f9Nehuxfwf3
 9Wdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCA9ITj2oj/odeEFwdgCFgyn99rzi4N/Jqb61J3YHJPVQ44nq1mw7o1lA/0KoTzbzsOhbUqQNnkFI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcPKvIpgbH7Xj3LTR5i268YuqjoH/kdfjYU34OmPoqgmTsW4Ig
 G4zh6mAiRibpAOf2fzmW1T/cZhJ1zXIfbTRvpBc9WyOi9wHY/9iYBk4dEFOK5J0=
X-Gm-Gg: ASbGnctrK+NhQ44+nRWGKpOOfqIqdpAFlHpsy7ZL2eyalwG/M1oK2mcvfYCy+Ko4384
 CJ2FuywvKk4sp2W/0swY+OaO4VHTmEJfDgdTHwSynJL83Y5GEGmFXJU9v8anOFgrv+3vE6VX50Y
 AUcC+UW0XA7pN9UTQbJBg5lg77UqpUsT4KwCJzECU43Qf6ajdKdQ3JHsdbWeU+kC9sro5s0Zg2/
 GR45+Pt9rDdRmEjjo0q/hwWyp5C0HNLSbIymRjOB5vMKHf4diZJMnWDjg==
X-Google-Smtp-Source: AGHT+IFdz74bhOiErirLg1uVa/kS6L6ABLXhjVEgRvnq7b4eLRGlp15VVcv/hGaB6m/2IrwrF6cJWQ==
X-Received: by 2002:a05:6512:2355:b0:53d:dbec:9f51 with SMTP id
 2adb3069b0e04-53df00d9e17mr9650818e87.29.1733134007450; 
 Mon, 02 Dec 2024 02:06:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df646f191sm1418314e87.136.2024.12.02.02.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 02:06:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 02 Dec 2024 12:06:33 +0200
Subject: [PATCH v2 03/14] drm/msm/dp: drop msm_dp_panel_dump_regs() and
 msm_dp_catalog_dump_regs()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-fd-dp-audio-fixup-v2-3-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4566;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AR2ot2ScldeaKrjr/qeTAbSFGVp+4LY+MmiRX3d+ewg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnTYasvLhVXT1PoULbzt8jxFufYyZm5wLqC0S3i
 etxsT7zaN6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ02GrAAKCRCLPIo+Aiko
 1QTMB/0QU5l53Y8AaEI4u3qBcu1vjCe+gJ6SbK+ZINkaHnJfgj9KnI09BOlWj3maNvD3H0x9nWs
 5JChhscj/5Z1F6zUok+rqKwnW/XiJa/9i+ILWKi71GsHrw0m5PH4m09Lze8FNxo7EyaciEwy+VA
 Xy0tK2MmQuxbVzXdHflNyEmAg7qu8YyPIe1onCJcMBpUbdgRrKTGqaTQIv/3/7dBuy90Y17KxkY
 OiLnpserbAP/YdHO4bhgoxdp4kcU9qNwe+dtTDjKTh5Mo0nDk/plPbzzghPa5Rhow3yMlimnjbD
 R3Egc6UEfeJOW/QGiBnig7ehonUgcdHkBfjLn2pGhIWVlids
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

