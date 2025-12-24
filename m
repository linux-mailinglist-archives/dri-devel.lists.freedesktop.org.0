Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07354CDC8FF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 15:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2806D10F91A;
	Wed, 24 Dec 2025 14:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="LIkoEetf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA2D10F918
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 14:47:19 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-42fb4eeb482so3073352f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 06:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766587638; x=1767192438; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EusSFmSFHvXdK2TABmwbfVXk8QB5nq86ggI4VdbsACk=;
 b=LIkoEetf3TxOI1IAnlQDE05cQAQjZ2qh1QE2nExcYTWLuct8BECzqdFnzDs52poU83
 fCifuRHFBuSupG+f0XdQec5oMBN3Fk8EIHL9YA4LlM93p890e/I1Xx/taGhihmupYlUz
 lKSM7Eub73NpHZEAB7AQuvQiZfOzgypP2M/x7g6B4zJT66ZY3FpZf4hWjg0tWce1FOEg
 lbJeiaoN5iSCOe0PtVlKDNn2GWqxtSsJsj4CeNHcNRJFEM1IWGveHqOUYHtNQ997m+m2
 En8T5DRH7x+VkdiSPYKxNG7X/PJpgd3EiJOgQwTkn+1Hf4jHEGaRiPcL2EQwetsrgkfJ
 ipSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766587638; x=1767192438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EusSFmSFHvXdK2TABmwbfVXk8QB5nq86ggI4VdbsACk=;
 b=qgTNxALgPG0JTg9mVqSUC+s82TJEsGsqH4FHunVcE346yxbN64i3yfrvb9hr5A3ywv
 6Gmq2RNQG8IpPrfGGEANpuvF7ExJLEaQA44xAkbqFR6/p5OnlwRCD18LvWCESkJKlq0e
 DSk6Nmqk0/Z7tqeHqJ6JDxRY2vJarzwTWteF0DyaTfqeT5dQH1/RjHyyWU1IV8jOfRjW
 KBKS/trUHeyqJcO3bK7ywazJ9CN3mJ6dNn3Iz0vl5QztPJe5wmVqi914sul9/kF5KZFC
 v4U0Xy8LEGAK8yufxWpmKl802GDbCeb6owCPNKOQQwn2G9FAFEDXuPiGvvvzS9++Gu0y
 TTew==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3NJM+isgcbV/s8G1AFiiCEOO2E2tkjwfDGrqc+MyiIScJX1l1LjGJZzSHdTGYC7y+wpQ4lNwRzUo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEt5ipmLYbwSvSUSUEbX/qBRPq5uxxtAWWf+r/J5/aqFv3IXzc
 zwJe/4RW+t4U+CQvWsjd5xDCcAlRppZ5hQ5ILaERT9hHaUBk8igpRBIbeSvxs+ynMak=
X-Gm-Gg: AY/fxX6E5KmKahWVDqhobe0gEEfwdeMJ45glBGm2eG40bwTRzQKbCWRmrUwrHaw1Jhi
 CRVqKlsL8uv9dA9RUWkXmp+edGE6whyT/eRN0rAW4kv2nBLD4p9cUacSJkIuGwQkYlxXKN3BIWK
 ZTCJ1+b/NsVqpkXvYlt5A1h+4X0WBLygaH9TlDIbNcUWsKqi3p8z770uQdLOQ5spAxbDt7MzZfz
 qLW84ZR6RGGT4h1TTiiqjkB/B2DjyhNKDQzQ+QpfTHNR/73rKN3Cx1lSxexaG0OBgzW83o5bNHN
 bCijVezlvNXI9Q60AIMMikWHVulYCo5W7AzGKkdW5rlDeLV8lcc2ofO04bC2s9HpzsBZudrH/3c
 RoC+BmTZxkxE/Eb+AaU0TMUtOY9MDjfjgVAQL0XjYifuMBwr330pT9NsDNqtJzxq51dD1ZrV5aU
 JdjTj/u8p2q4T2NELG24PwOpu5CQTZ1SoUGbU=
X-Google-Smtp-Source: AGHT+IGJt/mwYM0l80VTHl5jzogHkpHFpfjU/vUbSjbHEQ65UEFCA++BEt+L9cJZpI26+VHKaAJNzg==
X-Received: by 2002:a05:6000:220c:b0:42f:b65c:1e4f with SMTP id
 ffacd0b85a97d-4324e4c97ccmr18106758f8f.17.1766587638414; 
 Wed, 24 Dec 2025 06:47:18 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43277b82a58sm1041109f8f.6.2025.12.24.06.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 06:47:18 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philip Yang <yangp@amd.com>
Subject: [PATCH v3 4/4] drm/radeon: add WQ_PERCPU to alloc_workqueue users
Date: Wed, 24 Dec 2025 15:47:08 +0100
Message-ID: <20251224144708.61167-5-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224144708.61167-1-marco.crivellari@suse.com>
References: <20251224144708.61167-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
   commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The refactoring is going to alter the default behavior of
alloc_workqueue() to be unbound by default.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU. For more details see the Link tag below.

In order to keep alloc_workqueue() behavior identical, explicitly request
WQ_PERCPU.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/radeon/radeon_display.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 35fb99bcd9a7..99a3e4c480c1 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -685,7 +685,8 @@ static void radeon_crtc_init(struct drm_device *dev, int index)
 	if (radeon_crtc == NULL)
 		return;
 
-	radeon_crtc->flip_queue = alloc_workqueue("radeon-crtc", WQ_HIGHPRI, 0);
+	radeon_crtc->flip_queue = alloc_workqueue("radeon-crtc",
+						  WQ_HIGHPRI | WQ_PERCPU, 0);
 	if (!radeon_crtc->flip_queue) {
 		kfree(radeon_crtc);
 		return;
-- 
2.52.0

