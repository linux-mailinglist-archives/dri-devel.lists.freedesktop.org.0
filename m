Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C21E894768
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 00:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575DE10F62E;
	Mon,  1 Apr 2024 22:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LfjpU+Tv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CB510F628;
 Mon,  1 Apr 2024 22:43:39 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a4e61accceaso233332966b.2; 
 Mon, 01 Apr 2024 15:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712011418; x=1712616218; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x6wOlanwnyuahzpz0MfNPGNkl1E4bit5o3/S2j1nuGQ=;
 b=LfjpU+TvYgi0IS1bTV9Bcd/ev8kST2zkbg97vk3Us9QTVsfO9T9/qfgqMB4XkczAsH
 T8/yFh9Ph/YF7/uUWW5oh+4KNBVPXIB4YkC6vg5UaKi3aVxELWLQOHJdBdgCl2gOMzW9
 pBU5FUjRZEQUzWkg8UiwT/XvoJQPKfILvzmP3GdxnWVXwKBdKRMRYDPdwP6Uvq6H2nxF
 FLCvkEn7WXzdadLdcmjRgQ+Iqlzh7r0JTgSETqYCD64DTDDNY5oKOF95sa+Ff7ASLOEw
 eTuWxFplXkGadRnonYmLVHN5tIRylDNItoo/2O+TLXFovvKlQal4id9fC0pfLja5vZ5o
 iJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712011418; x=1712616218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x6wOlanwnyuahzpz0MfNPGNkl1E4bit5o3/S2j1nuGQ=;
 b=QzUdAha6rysBZ37QBB5Pg2OzVvA7vSOd9j+QLeTfhkAxJgUMnO/xNKQOk0ILtM5DfY
 5pjjKBCIZNAUD8+UH36Q19ioZEsuZf+HSY8ObkzTT/7NHHe49h6uljm8/HKXC5OfHyg3
 ArU9MstwcVLJzCAiIUJqX/2ZEgbDJpwrsz7luqUC+1xtJGhb5Jh+2GRnWAXgD3FJNdk7
 L9oPnwkliCnWRbWKC3TiM6LxjY+V/EHccf68QgY9bqLqN2hKPl+yL2mC1E8gIiJkzNlm
 hhbgRGtJ6w5vmMDgMLwlKM/v2yy48fPTnxpfzfS1JrtSWUChajuYQVpZwkaZKMvD+qvF
 pcuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoF/OWg5ikvPonD0QqCi505rGzTzcKk4LPBdBwzQ29l2XytoH0pGTzB/kfxQSxrnQ7PwenH0696dAAoH4LUVv7fs20JfsTPEhvTXJUPdo4NQN23IFl3qJK0pgeQk7XFMaCyt4nV9tycHgy+A==
X-Gm-Message-State: AOJu0YxySKGjn0yswb4wOOXYS0KPxw+t8BSuHf8aT37ebIVkPHra8/NT
 DJjAXxhTTdypPhbg96rLeXu9+OGJR/znVsyD8ZzNMFCUq9YX1YPh
X-Google-Smtp-Source: AGHT+IHHemzLxeLUMG8/nYzOVnRQOJhwt+KswDgE2bL/9MkeZyGspToRNzYF/9xt03CRuCgLz0TmVw==
X-Received: by 2002:a17:906:494e:b0:a4e:69b5:9835 with SMTP id
 f14-20020a170906494e00b00a4e69b59835mr2677589ejt.6.1712011417805; 
 Mon, 01 Apr 2024 15:43:37 -0700 (PDT)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 c3-20020a170906340300b00a4739efd7cesm5796808ejb.60.2024.04.01.15.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 15:43:37 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, anarsoul@gmail.com,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 Erico Nunes <nunes.erico@gmail.com>
Subject: [PATCH 1/2] drm/lima: fix shared irq handling on driver remove
Date: Tue,  2 Apr 2024 00:43:28 +0200
Message-ID: <20240401224329.1228468-2-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240401224329.1228468-1-nunes.erico@gmail.com>
References: <20240401224329.1228468-1-nunes.erico@gmail.com>
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

lima uses a shared interrupt, so the interrupt handlers must be prepared
to be called at any time. At driver removal time, the clocks are
disabled early and the interrupts stay registered until the very end of
the remove process due to the devm usage.
This is potentially a bug as the interrupts access device registers
which assumes clocks are enabled. A crash can be triggered by removing
the driver in a kernel with CONFIG_DEBUG_SHIRQ enabled.
This patch frees the interrupts at each lima device finishing callback
so that the handlers are already unregistered by the time we fully
disable clocks.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 drivers/gpu/drm/lima/lima_gp.c  | 2 ++
 drivers/gpu/drm/lima/lima_mmu.c | 5 +++++
 drivers/gpu/drm/lima/lima_pp.c  | 4 ++++
 3 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_gp.c b/drivers/gpu/drm/lima/lima_gp.c
index 6b354e2fb61d..14c39be8da90 100644
--- a/drivers/gpu/drm/lima/lima_gp.c
+++ b/drivers/gpu/drm/lima/lima_gp.c
@@ -338,7 +338,9 @@ int lima_gp_init(struct lima_ip *ip)
 
 void lima_gp_fini(struct lima_ip *ip)
 {
+	struct lima_device *dev = ip->dev;
 
+	devm_free_irq(dev->dev, ip->irq, ip);
 }
 
 int lima_gp_pipe_init(struct lima_device *dev)
diff --git a/drivers/gpu/drm/lima/lima_mmu.c b/drivers/gpu/drm/lima/lima_mmu.c
index e18317c5ca8c..6611e2836bf0 100644
--- a/drivers/gpu/drm/lima/lima_mmu.c
+++ b/drivers/gpu/drm/lima/lima_mmu.c
@@ -118,7 +118,12 @@ int lima_mmu_init(struct lima_ip *ip)
 
 void lima_mmu_fini(struct lima_ip *ip)
 {
+	struct lima_device *dev = ip->dev;
+
+	if (ip->id == lima_ip_ppmmu_bcast)
+		return;
 
+	devm_free_irq(dev->dev, ip->irq, ip);
 }
 
 void lima_mmu_flush_tlb(struct lima_ip *ip)
diff --git a/drivers/gpu/drm/lima/lima_pp.c b/drivers/gpu/drm/lima/lima_pp.c
index d0d2db0ef1ce..84bec163c9ed 100644
--- a/drivers/gpu/drm/lima/lima_pp.c
+++ b/drivers/gpu/drm/lima/lima_pp.c
@@ -286,7 +286,9 @@ int lima_pp_init(struct lima_ip *ip)
 
 void lima_pp_fini(struct lima_ip *ip)
 {
+	struct lima_device *dev = ip->dev;
 
+	devm_free_irq(dev->dev, ip->irq, ip);
 }
 
 int lima_pp_bcast_resume(struct lima_ip *ip)
@@ -319,7 +321,9 @@ int lima_pp_bcast_init(struct lima_ip *ip)
 
 void lima_pp_bcast_fini(struct lima_ip *ip)
 {
+	struct lima_device *dev = ip->dev;
 
+	devm_free_irq(dev->dev, ip->irq, ip);
 }
 
 static int lima_pp_task_validate(struct lima_sched_pipe *pipe,
-- 
2.44.0

