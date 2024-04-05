Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFF389A137
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 17:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC03113C66;
	Fri,  5 Apr 2024 15:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HpkYKsI/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A971113C63;
 Fri,  5 Apr 2024 15:31:27 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-516c403c2e4so2224130e87.0; 
 Fri, 05 Apr 2024 08:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712331086; x=1712935886; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GLmSQbomn7jjoFYvGpaYKKjdNIRUVaXuPm21MTZkhWI=;
 b=HpkYKsI/FnyySF5LmyobVbDnPcZx5cKeOThqnnahc0iZa05EEVslhFqbug0gLAN/I1
 dIt4OG5skT4zokJdu/l7GGDu6nWHcRa8q/2i/X62/Xm2TaMA6r/+d7HOHSB9aS04fyjX
 oDI50ays/uOybj+lO3T1I6BbMsn84raEldalGIiKeFT/o2/IRGzqmEWczeA8zrYmcTei
 vMDFtBPBoAKlx7NOp738BI9Q9dJpdJ41WiDCdlfhh4jwKslYN02uzlfpJROhJiviCFxD
 7C/o5UbpIi2zwhI4w/lNReU4Hxl3ToFMdazvs5GsqkfV683fsqnB0W8sQHZvCrghjuRD
 cd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712331086; x=1712935886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GLmSQbomn7jjoFYvGpaYKKjdNIRUVaXuPm21MTZkhWI=;
 b=vCu6Cl9TCtZ5VWkztU73zNGzxS23BxQOjZN41yIf2gP6Aep7NWKxEA0W63/UIa8ioR
 zXURXIY0h+hiu2R8QZF9MxYkmgkRFwgLeH2Bu+3PXlXxOQf/cFCQjJkmRuhyJ8RWJ2S2
 a9UIrvnoRMXEhX1elEe63kOO9+VOEB2E9HWCpH7T+lPMQGu+1pOoKbgLOGKLobFvwtnW
 dkEK4ijrxeM5v/WVhWvaerNCwEBZ3RN1FxmOnlCpAVCVTBEY8Z+JzJvJNEybbM+eIPc1
 y2gg7+Sq7JcKk7qBm8Sq8zpauy0ufRDNjrzorZxYpJoDtqku4sqv3It0QwahJV2oZWmc
 1LVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI5j6YNzN7T0pK2pwBultgm0ZbX+UTslrX+qSmq9hWj1FHS1TXnOv4Vylq3ddaC+94o3j/bXhwyCnjr1tXf+2TOi9Z0HbuBfKXODXe4cLxbP8WR1QUh3ZnZlbhTzI39zyQ+A+r69nFATuUDw==
X-Gm-Message-State: AOJu0YzOquVI0VOREQN2uKOCN+sPuckAEWlIe/ccz21dOgnixheYI/Vb
 QNRNE7uEAXbMdUR+Ft/kAT781ReuDyIFCbwDXMgTf3A9sKmrdPt+S87CcL1X35I=
X-Google-Smtp-Source: AGHT+IE7RgZin2OZ+qw13032XMFBtJshqJC/13QOVSjiQyPWaNMLxo/xWtEHTWGKxvCq6iMC0ubYRQ==
X-Received: by 2002:a05:6402:3716:b0:56d:c757:9379 with SMTP id
 ek22-20020a056402371600b0056dc7579379mr3103612edb.15.1712331064035; 
 Fri, 05 Apr 2024 08:31:04 -0700 (PDT)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 ca19-20020aa7cd73000000b0056dfda8eef3sm906752edb.54.2024.04.05.08.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 08:31:03 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, anarsoul@gmail.com,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, christian.koenig@amd.com, megi@xff.cz,
 linux-kernel@vger.kernel.org, Erico Nunes <nunes.erico@gmail.com>
Subject: [PATCH v2 1/3] drm/lima: add mask irq callback to gp and pp
Date: Fri,  5 Apr 2024 17:29:49 +0200
Message-ID: <20240405152951.1531555-2-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240405152951.1531555-1-nunes.erico@gmail.com>
References: <20240405152951.1531555-1-nunes.erico@gmail.com>
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

This is needed because we want to reset those devices in device-agnostic
code such as lima_sched.
In particular, masking irqs will be useful before a hard reset to
prevent race conditions.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 drivers/gpu/drm/lima/lima_bcast.c | 12 ++++++++++++
 drivers/gpu/drm/lima/lima_bcast.h |  3 +++
 drivers/gpu/drm/lima/lima_gp.c    |  8 ++++++++
 drivers/gpu/drm/lima/lima_pp.c    | 18 ++++++++++++++++++
 drivers/gpu/drm/lima/lima_sched.h |  1 +
 5 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_bcast.c b/drivers/gpu/drm/lima/lima_bcast.c
index fbc43f243c54..6d000504e1a4 100644
--- a/drivers/gpu/drm/lima/lima_bcast.c
+++ b/drivers/gpu/drm/lima/lima_bcast.c
@@ -43,6 +43,18 @@ void lima_bcast_suspend(struct lima_ip *ip)
 
 }
 
+int lima_bcast_mask_irq(struct lima_ip *ip)
+{
+	bcast_write(LIMA_BCAST_BROADCAST_MASK, 0);
+	bcast_write(LIMA_BCAST_INTERRUPT_MASK, 0);
+	return 0;
+}
+
+int lima_bcast_reset(struct lima_ip *ip)
+{
+	return lima_bcast_hw_init(ip);
+}
+
 int lima_bcast_init(struct lima_ip *ip)
 {
 	int i;
diff --git a/drivers/gpu/drm/lima/lima_bcast.h b/drivers/gpu/drm/lima/lima_bcast.h
index 465ee587bceb..cd08841e4787 100644
--- a/drivers/gpu/drm/lima/lima_bcast.h
+++ b/drivers/gpu/drm/lima/lima_bcast.h
@@ -13,4 +13,7 @@ void lima_bcast_fini(struct lima_ip *ip);
 
 void lima_bcast_enable(struct lima_device *dev, int num_pp);
 
+int lima_bcast_mask_irq(struct lima_ip *ip);
+int lima_bcast_reset(struct lima_ip *ip);
+
 #endif
diff --git a/drivers/gpu/drm/lima/lima_gp.c b/drivers/gpu/drm/lima/lima_gp.c
index 6b354e2fb61d..e15295071533 100644
--- a/drivers/gpu/drm/lima/lima_gp.c
+++ b/drivers/gpu/drm/lima/lima_gp.c
@@ -233,6 +233,13 @@ static void lima_gp_task_mmu_error(struct lima_sched_pipe *pipe)
 	lima_sched_pipe_task_done(pipe);
 }
 
+static void lima_gp_task_mask_irq(struct lima_sched_pipe *pipe)
+{
+	struct lima_ip *ip = pipe->processor[0];
+
+	gp_write(LIMA_GP_INT_MASK, 0);
+}
+
 static int lima_gp_task_recover(struct lima_sched_pipe *pipe)
 {
 	struct lima_ip *ip = pipe->processor[0];
@@ -365,6 +372,7 @@ int lima_gp_pipe_init(struct lima_device *dev)
 	pipe->task_error = lima_gp_task_error;
 	pipe->task_mmu_error = lima_gp_task_mmu_error;
 	pipe->task_recover = lima_gp_task_recover;
+	pipe->task_mask_irq = lima_gp_task_mask_irq;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/lima/lima_pp.c b/drivers/gpu/drm/lima/lima_pp.c
index d0d2db0ef1ce..a4a2ffe6527c 100644
--- a/drivers/gpu/drm/lima/lima_pp.c
+++ b/drivers/gpu/drm/lima/lima_pp.c
@@ -429,6 +429,9 @@ static void lima_pp_task_error(struct lima_sched_pipe *pipe)
 
 		lima_pp_hard_reset(ip);
 	}
+
+	if (pipe->bcast_processor)
+		lima_bcast_reset(pipe->bcast_processor);
 }
 
 static void lima_pp_task_mmu_error(struct lima_sched_pipe *pipe)
@@ -437,6 +440,20 @@ static void lima_pp_task_mmu_error(struct lima_sched_pipe *pipe)
 		lima_sched_pipe_task_done(pipe);
 }
 
+static void lima_pp_task_mask_irq(struct lima_sched_pipe *pipe)
+{
+	int i;
+
+	for (i = 0; i < pipe->num_processor; i++) {
+		struct lima_ip *ip = pipe->processor[i];
+
+		pp_write(LIMA_PP_INT_MASK, 0);
+	}
+
+	if (pipe->bcast_processor)
+		lima_bcast_mask_irq(pipe->bcast_processor);
+}
+
 static struct kmem_cache *lima_pp_task_slab;
 static int lima_pp_task_slab_refcnt;
 
@@ -468,6 +485,7 @@ int lima_pp_pipe_init(struct lima_device *dev)
 	pipe->task_fini = lima_pp_task_fini;
 	pipe->task_error = lima_pp_task_error;
 	pipe->task_mmu_error = lima_pp_task_mmu_error;
+	pipe->task_mask_irq = lima_pp_task_mask_irq;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
index 6bd4f3b70109..85b23ba901d5 100644
--- a/drivers/gpu/drm/lima/lima_sched.h
+++ b/drivers/gpu/drm/lima/lima_sched.h
@@ -80,6 +80,7 @@ struct lima_sched_pipe {
 	void (*task_error)(struct lima_sched_pipe *pipe);
 	void (*task_mmu_error)(struct lima_sched_pipe *pipe);
 	int (*task_recover)(struct lima_sched_pipe *pipe);
+	void (*task_mask_irq)(struct lima_sched_pipe *pipe);
 
 	struct work_struct recover_work;
 };
-- 
2.44.0

