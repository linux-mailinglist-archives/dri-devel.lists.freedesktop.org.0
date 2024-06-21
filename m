Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E108B912976
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA6C10F207;
	Fri, 21 Jun 2024 15:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="IS4ynG08";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f97.google.com (mail-ed1-f97.google.com
 [209.85.208.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BA510F1F1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:41 +0000 (UTC)
Received: by mail-ed1-f97.google.com with SMTP id
 4fb4d7f45d1cf-57d07673185so2075465a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983300; x=1719588100;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pEEdjkbUEP9x84L7t8jjmfoxTlpqzfUwq6lCCT/6uqI=;
 b=IS4ynG08H79jFb8Pq1vYRceqgsgcsl7mExcpeNqa8x7NFTlGTsMwoMs2ajDPeQawel
 gAF0tKlQabKyAIdQNzPcw8rjsIuUr/p3C/Esc33dbG+aAPbXVo2V6tCO7Df9RELvTV5l
 u3Q3rSdqzBAZedhv4eWi5J+wMuellvdevWJqEMUWSjJmG/csFAr1B2aNmTLcNNGGif1Y
 eNPuHGvGonZQq4DJ5j2uOFKOzI7jL2qSYK2LO2bTwOu0fLQyQbukc6jKEf1z1N64ob3L
 +Z1iwvW/IOWmup/FWHjfmknE3EpN4H1PJKo61Txy1Dg5TFJlhvoKom+QHbA53RtyWqrr
 q6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983300; x=1719588100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pEEdjkbUEP9x84L7t8jjmfoxTlpqzfUwq6lCCT/6uqI=;
 b=cdnu0Mbc1AMq6ZgxBPwpzKpYFc0c6OUawW5e4PqtWXpBztES1kjoy5twoiYfHfDt2O
 5hNm/JlpNXGQ1Nez3dG8A25DUkQazCzPhvLQjCgOZe3ysOX5jzLGquHmXOE8NmssQ593
 fD9UqhQcW3ZmJ+bxSOKuowoClr4WNXNLWOwuJtW0xZCVpEtSs8widuvzv6kdl0+oMgPx
 yuIKpQuc31Xyl4zWLh1NfBcX1dvun+2p4IrMU23U/WB7To7SvWBF3gZEIpQCD6+prPqc
 yHNXgQ2oUEWmAtI9l48emUil/0HR9bxlLCyj1m1PP8SGBL1+Q0SQdDy72SzgSEz9HoBt
 Gsnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1FX7pXnk+3j/43YpALJuiiunjBZzQ6GbYtAT2RjIfFngK3m3ZBYB0LwvUmS7g5S4+nq4rDSVwhB5waDtwerohm1KMBi8VPQV97SW21Lhz
X-Gm-Message-State: AOJu0Yy8Jza//KMHX7oi34FG9uei5v39Vga85HHUUG8NFUVbmURl1n0T
 6zg0aADBj09C8WgzQQdhr0L0rog9VK8gz/ifqF3fiYp+7V36XRNcbAeNG530am2d7vpAaF1rrGF
 TXeAq4jciHEj6n5MtZJrwrYAJCm8Dd88j
X-Google-Smtp-Source: AGHT+IF6qKMdgCp6mVewkWBiLBLgDxqfgg5DToqxsn7t3xlFuN/D9ZDv92xMTgvf5ZYFK5ovq72hs9CvsSKn
X-Received: by 2002:a17:906:eb48:b0:a6f:535e:77f0 with SMTP id
 a640c23a62f3a-a6fab77885cmr552475166b.55.1718983300472; 
 Fri, 21 Jun 2024 08:21:40 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6fcf427b54sm5319466b.36.2024.06.21.08.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:40 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 17/31] drm/vc4: hvs: Fix dlist debug not resetting the next
 entry pointer
Date: Fri, 21 Jun 2024 16:20:41 +0100
Message-Id: <20240621152055.4180873-18-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
References: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
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

The debug function to display the dlists didn't reset next_entry_start
when starting each display, so resulting in not stopping the
list at the correct place.

Fixes: c6dac00340fc ("drm/vc4: hvs: Add debugfs node that dumps the current display lists")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 5d4a76215a2e..5dbc48d690e8 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -110,7 +110,7 @@ static int vc4_hvs_debugfs_dlist(struct seq_file *m, void *data)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hvs *hvs = vc4->hvs;
 	struct drm_printer p = drm_seq_file_printer(m);
-	unsigned int next_entry_start = 0;
+	unsigned int next_entry_start;
 	unsigned int i, j;
 	u32 dlist_word, dispstat;
 
@@ -124,6 +124,7 @@ static int vc4_hvs_debugfs_dlist(struct seq_file *m, void *data)
 		}
 
 		drm_printf(&p, "HVS chan %u:\n", i);
+		next_entry_start = 0;
 
 		for (j = HVS_READ(SCALER_DISPLISTX(i)); j < 256; j++) {
 			dlist_word = readl((u32 __iomem *)vc4->hvs->dlist + j);
-- 
2.34.1

