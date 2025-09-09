Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD81BB4A39B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 09:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A7210E63C;
	Tue,  9 Sep 2025 07:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H8FIIGfh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E4E10E644
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 07:33:58 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-3381df3b950so36407131fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 00:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757403237; x=1758008037; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DQrz/QPYOHYsP4Cfl9B2GTYZm08Xl/E70LbUu7rauuk=;
 b=H8FIIGfha1nbhOg40N1pHkhnX4lDQDQQrfel6MaBGMhcOmt/K2n/GIZgQbmXgMd7KS
 QXeBSVIMIOYZE879JAFwTMm3BRLVqWydnWyKcueQ71APD13iUGtcFw+rOfIRX4ODwzaN
 LmL2/C9mJh2HnZaM8JQnk1kKuY/s5FVrv40pB3q/j9fuY+ZuZsVrzcO/jgPiqaXMLPgE
 /1wpj2TM2KdJyeA0rTWx/HLOXrA2zDqZjPZTnKStC0GoKBdwk4MxL5Y/f5bufo6MbvAL
 pk44M+aTTUkX6pFtXBQbQJULMqpjst2JbkxZOtgHFi54JZGUZjHNzJVo3zENnzcTer+6
 Uayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757403237; x=1758008037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DQrz/QPYOHYsP4Cfl9B2GTYZm08Xl/E70LbUu7rauuk=;
 b=dYdp2wa1U75cPI6cWM3cq3jJsg5woPIbN5MAQzUzuM6GOWLgqdy9raCyaPpV14H5TO
 qM/bOSnlQa4gEHADS0E3L85E59aKm7OsKmcfF0KrwAgBuyqf2Qb0KK1RkDvxzCmD6Mxa
 GH9TgrpsXDm83v23a125PU5uhZF0YgO3yFVDe4pU3io/zMBfi+nK8s/42ILEvBt7wDdR
 7F8Y+pu++lr0pcqGXwodbmsLQJ5tIDxEF7ivUDNDaGKxRx6S9X3vGyuzXqdr3dO7QYlj
 G0rVUMU/WTbtOvBKzQSc5O/eGurojO/XvdCo9WoHYXa0q03sVDD/1s5c8rM7ig/BGHNU
 3Gng==
X-Gm-Message-State: AOJu0YwRJb4Z849EuKE/sfJ9HJ30M0w36ReEO21/ukDNoWXlgU4IC6ZQ
 VLLJ1lYbkxgzKw52n6WvXFSWZImU79dnHBzM+LLRgr9Buzaz9+do17lQ
X-Gm-Gg: ASbGnctmttf4LmVAmzf6/GVs3ekl8+WX4p6xBwNqvYGG//SPyn2laYZdMqu64PWd7/K
 1GCUw6FJrZqe4bR3OHx3ENKVrAJZMmjurbIopf7ehp64K1h/RQs7Yk3XI+CxNBsJmV721IUdnJu
 JsFLs+LDo7/xtspXKJDO6oGGHVXC4G74Tbvn/tIu8un4RgnsCzR7yDPPngsTWxn0erF9/LIsl47
 IMRM4iPQFO8V3n2kfYwPPct/74kaJGw63dHYOOUHLo6CQEL2gx5jmpTG3Ck5uLzfLJV922eBN58
 fU6PjYOnYCJql5K+VfExzJUABPFRevLpud0pLMlKG+dMiIoLKAAv4sueVT6bCU2PIrKzrzb9D3e
 bRyABWc++vmM9aIZRMU7kBEDA
X-Google-Smtp-Source: AGHT+IG7b409ZZaz9WYBpWBHJXflu4ExPWhaJ6oRz2uN0iqNOX7r4BIF3k+etTXLQ89f4RpIzZD6Hw==
X-Received: by 2002:a05:651c:3254:20b0:336:8369:d028 with SMTP id
 38308e7fff4ca-33b553ae52dmr25007991fa.43.1757403236352; 
 Tue, 09 Sep 2025 00:33:56 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c91a6bsm37542721fa.21.2025.09.09.00.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 00:33:55 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] gpu/drm: tegra: dsi: make SOL delay calculation mode
 independent
Date: Tue,  9 Sep 2025 10:33:34 +0300
Message-ID: <20250909073335.91531-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250909073335.91531-1-clamor95@gmail.com>
References: <20250909073335.91531-1-clamor95@gmail.com>
MIME-Version: 1.0
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

Move SOL delay calculation outside of video mode conditions.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c | 41 +++++++++++++++----------------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 924611061cfa..aab555a2eb68 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -560,11 +560,6 @@ static void tegra_dsi_configure(struct tegra_dsi *dsi, unsigned int pipe,
 		tegra_dsi_writel(dsi, hact << 16 | hbp, DSI_PKT_LEN_2_3);
 		tegra_dsi_writel(dsi, hfp, DSI_PKT_LEN_4_5);
 		tegra_dsi_writel(dsi, 0x0f0f << 16, DSI_PKT_LEN_6_7);
-
-		/* set SOL delay (for non-burst mode only) */
-		tegra_dsi_writel(dsi, 8 * mul / div, DSI_SOL_DELAY);
-
-		/* TODO: implement ganged mode */
 	} else {
 		u16 bytes;
 
@@ -586,28 +581,26 @@ static void tegra_dsi_configure(struct tegra_dsi *dsi, unsigned int pipe,
 		value = MIPI_DCS_WRITE_MEMORY_START << 8 |
 			MIPI_DCS_WRITE_MEMORY_CONTINUE;
 		tegra_dsi_writel(dsi, value, DSI_DCS_CMDS);
+	}
 
-		/* set SOL delay */
-		if (dsi->master || dsi->slave) {
-			unsigned long delay, bclk, bclk_ganged;
-			unsigned int lanes = state->lanes;
-
-			/* SOL to valid, valid to FIFO and FIFO write delay */
-			delay = 4 + 4 + 2;
-			delay = DIV_ROUND_UP(delay * mul, div * lanes);
-			/* FIFO read delay */
-			delay = delay + 6;
-
-			bclk = DIV_ROUND_UP(mode->htotal * mul, div * lanes);
-			bclk_ganged = DIV_ROUND_UP(bclk * lanes / 2, lanes);
-			value = bclk - bclk_ganged + delay + 20;
-		} else {
-			/* TODO: revisit for non-ganged mode */
-			value = 8 * mul / div;
-		}
+	/* set SOL delay */
+	if (dsi->master || dsi->slave) {
+		unsigned long delay, bclk, bclk_ganged;
+		unsigned int lanes = state->lanes;
 
-		tegra_dsi_writel(dsi, value, DSI_SOL_DELAY);
+		/* SOL to valid, valid to FIFO and FIFO write delay */
+		delay = 4 + 4 + 2;
+		delay = DIV_ROUND_UP(delay * mul, div * lanes);
+		/* FIFO read delay */
+		delay = delay + 6;
+
+		bclk = DIV_ROUND_UP(mode->htotal * mul, div * lanes);
+		bclk_ganged = DIV_ROUND_UP(bclk * lanes / 2, lanes);
+		value = bclk - bclk_ganged + delay + 20;
+	} else {
+		value = 8 * mul / div;
 	}
+	tegra_dsi_writel(dsi, value, DSI_SOL_DELAY);
 
 	if (dsi->slave) {
 		tegra_dsi_configure(dsi->slave, pipe, mode);
-- 
2.48.1

