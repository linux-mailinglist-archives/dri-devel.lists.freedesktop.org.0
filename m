Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 691B89F26A6
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 23:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D3510E3D0;
	Sun, 15 Dec 2024 22:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uTnikvT9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9A310E187
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 22:44:17 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-30167f4c1deso30804011fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 14:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734302656; x=1734907456; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9FcosjnZ+EYpYsxWV3fspnFWPldQB9eLk6Pr9Uyc9VE=;
 b=uTnikvT9Vd6u8fnoEEwEGxN/kKu2xoP9RM4Yg90/Im23v7SmIHhhpUwKTaxyGyGmdW
 hQSeqFFyQHJlvC+D1NoQlhkWuwldB1CCygzNTp+MZtUSjcLZNZNNGqmO8BoA7Y8We8sO
 5g6nKX4Qkv2cw/zM9evBnBUrg3ER2s8i/+wdLPgsrI7MHx4TKEM1jX1GOfOupj3ZpCZE
 q1pUuzj8vPVKHxKej8PgQSa53L5VCVDmilW3KyA9VVQRNbuYOqYdD+IwFGJy/kWBXuOo
 e3yGp9sdUKqz/1/aL2fYDExLLZEDcXh7Ou8KS/97TeR6VvdjOr8rsjdKNCyFjGG980AW
 /rpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734302656; x=1734907456;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9FcosjnZ+EYpYsxWV3fspnFWPldQB9eLk6Pr9Uyc9VE=;
 b=YiXPdRQD04+eMGeKvDFGjt/fsCeHFaIeYcdqV/qixrzj81t6/fEzoMPA9imvHH5Kit
 19lY0TjEnAZf+9oe6mq01LMVq18Uuo126EYAlUjb+La3y8GLRpZ5wVe4ZBnBYBqhM5yb
 NK9Q11nc8l/iWJpTM+UaAeXFVfwCtUUEJGabF66oeHQ1llYVc1g3IxjZHKxl42ybmI/s
 h15ZUVKkRrtRjumVVNEa54ps3v8tWbPh9Ojw/24VHkC+6Nc1Pjb8X3X6Mn/siUlWb2Z3
 0kftI3TiWAJdtQjhADOV+u1aQK3xzUBrZentweL5PfTFWlcMYdFw9uDsRYjIsaVSc3bt
 pH2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRBDT+1Y4sPH3jH7G4GHyMC4TLP+9c0CVeg5MskNsSVwE3l0OToBuBCoLiqmAwALFRO0KNzX3LlpE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYSXWHzGmYMy2PcNy9iCXCp0FrJqp7kvJdwGygfFPZCAgU8Prp
 rkxOaaXiAYcvKkw9TZp10cXh73bPD6OtKIfxrZpJMWBuDIKk/tPlOehqvzop53I=
X-Gm-Gg: ASbGncuhM/scrGPIcBsZfHTOrzAcxH7yU5C95ebQjQjXBd/yuVXEvBifqnJHCvbllxg
 mOZXgf9g+XzLKn3dBpMqDL1ALMTZ4fK4F7voWJW2lr3Xg7+tVeqlwhjQoZOKwvMeItv2PoHiWVK
 XEwQrVC1eRXSSpRMV832tTmivfmkduaYWEPLpTlESN7/FMXEMsnYxpshv7BE0Al7CkRfGlFiceR
 q/O++wQKA5ipcJnfKSnfpQxb20DI7gsp8HrETemye5RIVPP4FsHK+q4XT3k+GNg
X-Google-Smtp-Source: AGHT+IG4DJ33Gm3rCir+qxsYYs+bqP1BaR2ZkVqSJ7/w4zdDpw5jPtuvekFuixkKeoThBzLK1i3U6w==
X-Received: by 2002:a05:651c:555:b0:2ff:ae6e:446e with SMTP id
 38308e7fff4ca-302544e33a5mr32874111fa.40.1734302655625; 
 Sun, 15 Dec 2024 14:44:15 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441a41d1sm7201701fa.100.2024.12.15.14.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 14:44:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 00:44:06 +0200
Subject: [PATCH v4 01/16] drm/msm/dp: drop msm_dp_panel_dump_regs() and
 msm_dp_catalog_dump_regs()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fd-dp-audio-fixup-v4-1-f8d1961cf22f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4735;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=odEAnKN06Sybslt+wjHIuBH83/5gGKUyqyRktEqGDq4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX1u4upBx874D1UMzYvwmvGy6lDnwOLEjzDpdr
 ZAmXI1cvP+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ19buAAKCRCLPIo+Aiko
 1WlOB/9WTcrueWc2ad6tuALzD/Y3g3rZKNBrv3wbbv1toKN6cEVe0lfE5iLLX8G3ykDYQKk0bTx
 w0qa/zZgKK/h1MrikedGs8XZpGoPmMT6IFCe8IsHUfjoQosSewObHrPblMraEbj3N6guc9kJRsO
 yte3RRvewIHoPk6vUzzIdwIcjEmcfpTuoiWTGhu2PfuZ+2OansjNFFQyztqZD80NtmhxcekzWoU
 o7Vts5p/k1kP+MPficCgzTsJub5yLpqgbGPXY0rtucrtRnS0LP01Gb7tDrcLlnRzLCeY+wrcrur
 q0V2BvuJR8/DnxNMZhwJ7aGwsy92ZdSg01rD6eS7c02Mcott
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
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 37 -------------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  1 -
 drivers/gpu/drm/msm/dp/dp_panel.c   | 11 -----------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  1 -
 4 files changed, 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 2a755a06ac4905f0ffa55a6df64ae4d948a78c0d..6a30996200bc7fbaacd0502f096e787f754752de 100644
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

