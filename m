Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F1A827FB3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 08:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EBF10E37A;
	Tue,  9 Jan 2024 07:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72EA10E36C;
 Tue,  9 Jan 2024 07:47:34 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a28d25253d2so276197966b.0; 
 Mon, 08 Jan 2024 23:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704786453; x=1705391253; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=h4w+0x70mgkLQitmS+OaqeWAjfYnpd9craFOHpq1mow=;
 b=g0eCqHxMRnXkHoopowWkqCakFKT7m/7so4YE1vJlor9inCvoa13+boYB3lXNtCq6Y/
 bAA2pCMg35RowXRl7U+xhE9JzJpraybexfRrcjby+4cCodr5bl9GVgyMpLhlpLmZ+bLy
 +8oCrW2YkeeXRxwU4sI68aOzgCYPxKvDHFTesYvGR5cQY3aKMXj4ZESfeF5aCdR6t3i5
 RkYb4f8utSK43iHPPstENHK7aytW2+CzVek1cnKKDPMJu4hs6+qmntp9cp6H+Db/rBEt
 44pVQrOqjzBqj88yeHc0vb1bZ6d46OmM3eTMzTgBinOYMO6E1mfGIL3LN2cm46MED6om
 gulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704786453; x=1705391253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h4w+0x70mgkLQitmS+OaqeWAjfYnpd9craFOHpq1mow=;
 b=slHoXOZZdHU+jMjSnhw+oCSINUXV2XPzAMINWhXTxclKDr+iuBJW13hjVd7F5wT6j3
 QeIlbmOPrn8maS2QXJ2BIIPB+9UwT2tDy6/ER95BY48RVogdH6/SyCku/Gci63yJGHbz
 JV41rH1vXbzZNm4AkaSpJCfX6cxUo+uS1JMSg2gY7Fdh/tpYFy75lfCjyQnk7UrGcIZv
 3W2nmC0+TOZ+Ra7wm7/lprjtRqyNl1b6ObG/bbHVIoRWjaDlW0MjtfKntxkvAqrkEs0H
 Z9BLwLY3+mp30mULjDt3B+qjIWhTDdr9Z+ikYWBu669yWgrS3ns8etPWQV8Chbiv4Zc0
 QE3w==
X-Gm-Message-State: AOJu0YzWGARByNMMyH7cNSnqttawKawY9IXrcT/AFodLkCW2Hh8cAOd/
 6ZQLVvbxXzR76huNlIkfxWYp8HLtwF4=
X-Google-Smtp-Source: AGHT+IGBXeIYac03udo/UMx7RP+jG/mHvukfCAakys4pYTHUOmMk+M7pagd532A62RThvFx/YpzzlA==
X-Received: by 2002:a17:906:494c:b0:a2b:55a:9e15 with SMTP id
 f12-20020a170906494c00b00a2b055a9e15mr296706ejt.7.1704786453002; 
 Mon, 08 Jan 2024 23:47:33 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15f1:d900:3a74:b44a:2376:22bd])
 by smtp.gmail.com with ESMTPSA id
 bm3-20020a170906c04300b00a2a4efe7d3dsm731563ejb.79.2024.01.08.23.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 23:47:32 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: zack.rusin@broadcom.com, thomas.hellstrom@linux.intel.com,
 lyude@redhat.com, kherbst@redhat.com, jani.nikula@linux.intel.com,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/vmwgfx: remove vmw_vram_gmr_placement
Date: Tue,  9 Jan 2024 08:47:25 +0100
Message-Id: <20240109074729.3646-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109074729.3646-1-christian.koenig@amd.com>
References: <20240109074729.3646-1-christian.koenig@amd.com>
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

Seems to be unused.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 28 ----------------------
 2 files changed, 29 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 3cd5090dedfc..12efecc17df6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -942,7 +942,6 @@ vmw_is_cursor_bypass3_enabled(const struct vmw_private *dev_priv)
 
 extern const size_t vmw_tt_size;
 extern struct ttm_placement vmw_vram_placement;
-extern struct ttm_placement vmw_vram_gmr_placement;
 extern struct ttm_placement vmw_sys_placement;
 extern struct ttm_device_funcs vmw_bo_driver;
 extern const struct vmw_sg_table *
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index af8562c95cc3..a84fffcef8e1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -43,13 +43,6 @@ static const struct ttm_place sys_placement_flags = {
 	.flags = 0
 };
 
-static const struct ttm_place gmr_placement_flags = {
-	.fpfn = 0,
-	.lpfn = 0,
-	.mem_type = VMW_PL_GMR,
-	.flags = 0
-};
-
 struct ttm_placement vmw_vram_placement = {
 	.num_placement = 1,
 	.placement = &vram_placement_flags,
@@ -57,27 +50,6 @@ struct ttm_placement vmw_vram_placement = {
 	.busy_placement = &vram_placement_flags
 };
 
-static const struct ttm_place vram_gmr_placement_flags[] = {
-	{
-		.fpfn = 0,
-		.lpfn = 0,
-		.mem_type = TTM_PL_VRAM,
-		.flags = 0
-	}, {
-		.fpfn = 0,
-		.lpfn = 0,
-		.mem_type = VMW_PL_GMR,
-		.flags = 0
-	}
-};
-
-struct ttm_placement vmw_vram_gmr_placement = {
-	.num_placement = 2,
-	.placement = vram_gmr_placement_flags,
-	.num_busy_placement = 1,
-	.busy_placement = &gmr_placement_flags
-};
-
 struct ttm_placement vmw_sys_placement = {
 	.num_placement = 1,
 	.placement = &sys_placement_flags,
-- 
2.34.1

