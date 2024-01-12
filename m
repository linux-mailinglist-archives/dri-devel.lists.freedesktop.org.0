Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ADD82C018
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 13:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8E910EB6E;
	Fri, 12 Jan 2024 12:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA1510E114;
 Fri, 12 Jan 2024 12:52:04 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5585fe04266so3143870a12.1; 
 Fri, 12 Jan 2024 04:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705063923; x=1705668723; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=h4w+0x70mgkLQitmS+OaqeWAjfYnpd9craFOHpq1mow=;
 b=Ze1/X5Ur4Y9NH8Vhgth3hL5ojY0wkqcWAMT3bbGwrQPjSijK+au/Te0ag57e1aK7Gc
 p/2LC6zvoOsh4tI9TMbRngwu0VFl+gE4OtyiEq/OQMnE3D/xGg1sDtjjYHcZoebgHz3e
 0NhfAAn97SeGw3AHfXn4RNOLcU7huv9kthL3Xe5C1yP05Yp2mNmm4TYmIBRtIyXtfV3D
 UZifxrfMljXiyEWf+oWaT8DewK5OAkKsNJK21FORUxfhPrlBGDHvUzbpexm59NhiiiVA
 IV0SezgdHZhdv5g0wLHR8y7DXrSfwWBt+QiLo6cOAJsryPHP14FNAMH6RDBOtv42ypzt
 qTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705063923; x=1705668723;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h4w+0x70mgkLQitmS+OaqeWAjfYnpd9craFOHpq1mow=;
 b=D699AtiYsHQdqgz71J3KOxRarYaltJWEPCDxd+O7nhFKTY3uk+Yxfj60puMpvtvET5
 WY1BZ95s2+GNVD6YIohSC1od9fS9MLCHjBwRM815jv88OKPqC/Awj+tsCbcxxYCSP1bs
 1y1Vys1z4sOZkuP2yqlQCTo1I1b6MW7pxf0BVGIFYRSW4vYdyniv24NxJRmkHk33Rj5u
 N2Sn8Lwh9GW7/so50lci6zaDrAZ0ApDZ3k4SDwmjvFVeSOWMO0QMuQ/sYtQzcv/MDDzc
 Y9TjJ0cGqGsTVbPkYrIuciJQZD4LavbnPt4PNXmP3qmOZCqoGqE54QcVX7cnISFHl7Ma
 hr6A==
X-Gm-Message-State: AOJu0YziAtZxyinSil9irGSKR/dxYwfSqSOKuWA5GLD8S1IMBneDvJYB
 FBBJ+wC3Y7v3+X1C5AL17n7dLUOELvEoAA==
X-Google-Smtp-Source: AGHT+IEc/yfUxS28/ong5jDqZUKma3NaA9hjPved5FhsmNAqxngrGixs73/RnQ1Zqd7NU46L6RG0vQ==
X-Received: by 2002:aa7:c60e:0:b0:556:c94a:7ca2 with SMTP id
 h14-20020aa7c60e000000b00556c94a7ca2mr660568edq.58.1705063922970; 
 Fri, 12 Jan 2024 04:52:02 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:5d00:a6e1:95b5:7596:5333])
 by smtp.gmail.com with ESMTPSA id
 y10-20020aa7ccca000000b005572a1159b9sm1752427edt.22.2024.01.12.04.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 04:52:02 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 thomas.hellstrom@linux.intel.com, nouveau@lists.freedesktop.org,
 jani.nikula@linux.intel.com, kherbst@redhat.com, lyude@redhat.com,
 zackr@vmware.com, michel.daenzer@mailbox.org
Subject: [PATCH 1/5] drm/vmwgfx: remove vmw_vram_gmr_placement
Date: Fri, 12 Jan 2024 13:51:54 +0100
Message-Id: <20240112125158.2748-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112125158.2748-1-christian.koenig@amd.com>
References: <20240112125158.2748-1-christian.koenig@amd.com>
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

