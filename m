Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5268E9C12F7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 01:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B7E10E904;
	Fri,  8 Nov 2024 00:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="y1brTP9L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59F710E903
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 00:21:45 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2fb4ec17f5cso13443091fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2024 16:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731025304; x=1731630104; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VKmZ4meMm9nE0dI/BvNTGi28DshZDKFMZdPFX/d5o80=;
 b=y1brTP9LRXmpH6oAIPiW6SrcKtvE3JBlBF9f2xUvF93CULoXDWw/2CSei2+ccMMqwE
 xesMNYYI9yXXBr/eAEz2x8snwRXXZiI5XUGQqivBDbufJVv00xkEJlNLTih7ZaHleeaC
 KENPzO3sfp5anNv+RA7Yr9prF6M7zZLcLQdMfSQ4sm2H4BPlSkvKpxxKFK8JU5zbUwds
 1mygSGdaqmfqE6kPt7mW1SYRcDF8+d2FBTj7yLkxPpIQSFdvOT7nB9Vwy1/Ii0eR6aS+
 VaifBS1mvJORbQ4f3ORmUsBa7ONMKcEWLzFi0qgptnE7svgEOMw9Oc0UVd4PML5DtaQw
 rHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731025304; x=1731630104;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VKmZ4meMm9nE0dI/BvNTGi28DshZDKFMZdPFX/d5o80=;
 b=p1WT4G8ZBpP1d34kSJDJI/rbg0enN3TsCTaC6ETsabK84ovdo6eH1E8cQWBzJ2zo0F
 QspZzaJS4xnVyiRS42/2jAEqERM9+RxZmNtApeo9tQ7/qABuLSHauHJR8W860RsfQ8lr
 vUB5x5WqBhbLxJdhY4zfAY+w0n5Qd5RMSYbouTZEOFFgsyTsExC+itI8vnrL1Pa950lv
 xbIy3oiQVbBvWaSyhUMus0ya8bedwGRxaueO/2QgVb5ng0+AZCjRx7s6Yfg2N/lo6UyN
 aDLZ7LPjju2tVAwp16W6dnRMgC5wD1/w6A7gadMarDLeSz8qUFmbSS6a5w2ud2OYMHRw
 N/OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVRWPB14rUFRgDISpJoQlMY8WMAso1tvB5U1IG6a47VB9sEzK0c/iNeuvdlxs4RoYfUgOjF1Kz35E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzenOQDim+Embh7mTNSeTNeEY7ZfI+GFyqZT98Lb1RHQ4lBId6O
 nCzUDNWpfxs9H81LaBpGAlmoavAkvkXSEbR+5O3zi9W9uio+zZxAoSOFjzGO3VA=
X-Google-Smtp-Source: AGHT+IGOBd1C2/u1sDhdEsw4b6WynLug8IcEk/4yg0nbhikVEpWeMtzi6UwH0Mu9GqYs0elB/cDwkw==
X-Received: by 2002:a05:651c:158f:b0:2fb:54d7:71b5 with SMTP id
 38308e7fff4ca-2ff20280ab0mr3598621fa.22.1731025303838; 
 Thu, 07 Nov 2024 16:21:43 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff17900a63sm4195191fa.47.2024.11.07.16.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 16:21:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 08 Nov 2024 02:21:33 +0200
Subject: [PATCH 02/14] drm/msm/dp: drop msm_dp_panel_dump_regs() and
 msm_dp_catalog_dump_regs()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-fd-dp-audio-fixup-v1-2-40c8eeb60cf5@linaro.org>
References: <20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org>
In-Reply-To: <20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnLVmOYKBgfvb+d+khmE2/qFL9b8EIYfJneeqrr
 jL0XRP1qqiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy1ZjgAKCRCLPIo+Aiko
 1UqCB/9UqsIYfGSTs8f23lHRsCMhL86Oo4W2rAeToZsOGj4vggqbsrTchD5BS0MY37Y1/hS+J5O
 GCsz81GpFHoHZQJtdaLtEZVLTOSrE553BDARSYVosWT6W1jTafsxubFHe6I8z+GzWUUkJf4yIHK
 Ov0GcWbCGLTWvC0hHhqZDASPwv3Tj19Y9Xt6m2W5OxMZy803VmL55RTOboq9vEu3NHXil6bYyG0
 iNWgF/MeU52rpM68MheZAKRvbVC4AI74HhVBxC8beI7vHzf0kDmH9m1gWVNvr2W7amU/7kMRXWO
 mXPjOXDTAW/11X3Ay/sbgkwiTc4m8G7z2fLFwrjHW/jfBhMB
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

