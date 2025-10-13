Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4D9BD392A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 16:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB7710E486;
	Mon, 13 Oct 2025 14:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RVBUAbNG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB9710E47B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 14:35:15 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-636535e4b1aso8450574a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 07:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760366114; x=1760970914; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Is8QZraj0UZR9B5lS7sUfkvx3WgTUsZAN2+odc02EU=;
 b=RVBUAbNGcVm4d3tHGZ09+m5xA2qh+3BWoj1IUfeHBOLD+0HMss14isH6SHxkJk6KqX
 Is6sV6wOkj1FE6bCWEhS9dZGy1omsj+6njMDIbOamcG2AsUheqV7YHqLWoIYyh5iEDYA
 5v/uVTNe7duX6SsWe+vnSiUTD8trWth5Wkmt8/MLGixDLLOTwZSPneJG3dK2NzU39xp+
 a23TIVRCOFnMl329WOb6BSDdQ0v26pcqWyYmL11KpXQsN7mXjp0rdo+7+gBTdSKzIlPc
 vfcANxaFZhfJyR/GLxbrI6GPVGsMCvyCMfrTvUPlT9aJtarmferBejD2qt2MQ+xec+Fk
 awng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760366114; x=1760970914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Is8QZraj0UZR9B5lS7sUfkvx3WgTUsZAN2+odc02EU=;
 b=ISnNZuC1GNGB6ySRS3zME4Da3XTEd/TCU/1/PLHA+AE16CDXYJWi7QF1i6ffKMGtp7
 6gHMbOUYp8W4HdyAHeyfE+7ByVo51wt6AyLsjwZejzOhlMPgudRNOVX3QrmBXGVmQ0gM
 W0zKjcaOArpROEHq6OvwMLfbxER4hx0kmRfWPuE+ddtcbH+riq8Vc7rwlf1L/tS4ejD1
 s5ogPwTMO0Jsm7ftsBGfPktlZyECLU2OaNWoV/zZM9HPSpkxFVqjsJKvJFVjNGzNQ/nA
 e0+CB5TEU6PT8im0rjHtnPWm3DW5kSJliT46ShQ1l2ZCd5BxNP3T8QgkbWWpwGMm2iy0
 s+Ig==
X-Gm-Message-State: AOJu0YwiVBDbk8FbbmyuE/RzLHVabjgDoifKhOkyPJ2aqN6u+34FN371
 3R96Abbb0HScz8NjmT7agx2cuSShrmqXBLK1TioIxrsB6MvvgOa+OVnaZpKREw==
X-Gm-Gg: ASbGncswFUCeMb9C67LtfYBE7o/M2Ch51ZaUiLNiq4KPX3Fl+jIE3rI+3kYtzCbvexZ
 PFosqZEibqtH05RFy9PV3BIfTz0dnOsKoNp/BNSEHj0DqXngJlfzPWjEApGGR8jDOVd+ZELPBaD
 t1yqvF0UJpoLcyj2ZwGqQ3SCuUYlX/oqDqjT2537tOndD86U9DgElLDV4luqxgpiV8luZvkP+Ob
 qmoiSsQU/9TlntbdiyLxjIdLx1cXNlyst5Uis1xbx5zdzOxLs8WXU48H13XHjxhFS7Xvs6SnENO
 rQL9Xq9K3NuQ7MCDeapZAO/t/JjVQjzz/QyWFRzAS7Ymm1kiqv+Hn4IfnEhg9EUio8S9ONMGU+0
 J/wxRKf/QF5pOqe7ckGrucc1n2SEkDP3tPTOPtB+wXmplX5UTcF4SHk1OxPj/lBSsgw==
X-Google-Smtp-Source: AGHT+IEHkjewj8JA1w5ONaRwGzsRRsO2qleReikOPcD9Iw8BZ1OG14hM7qC5770R/LT9jH/Mbzod6g==
X-Received: by 2002:a05:6402:202f:b0:634:bff4:524c with SMTP id
 4fb4d7f45d1cf-639bb134f57mr17333324a12.9.1760366114086; 
 Mon, 13 Oct 2025 07:35:14 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:151b:dc00:15d1:ebc5:76e6:730f])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5c321453sm8942037a12.39.2025.10.13.07.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 07:35:13 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 13/15] drm/amdgpu: independence for the amdgpu_vm_tlb_fence!
Date: Mon, 13 Oct 2025 15:48:40 +0200
Message-ID: <20251013143502.1655-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013143502.1655-1-christian.koenig@amd.com>
References: <20251013143502.1655-1-christian.koenig@amd.com>
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

This should allow amdgpu_vm_tlb_fences to outlive the amdgpu module.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
index 5d26797356a3..27bf1f569830 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
@@ -33,7 +33,6 @@ struct amdgpu_tlb_fence {
 	struct amdgpu_device	*adev;
 	struct dma_fence	*dependency;
 	struct work_struct	work;
-	spinlock_t		lock;
 	uint16_t		pasid;
 
 };
@@ -98,9 +97,8 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_device *adev, struct amdgpu_vm *vm
 	f->dependency = *fence;
 	f->pasid = vm->pasid;
 	INIT_WORK(&f->work, amdgpu_tlb_fence_work);
-	spin_lock_init(&f->lock);
 
-	dma_fence_init64(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
+	dma_fence_init64(&f->base, &amdgpu_tlb_fence_ops, NULL,
 			 vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
 
 	/* TODO: We probably need a separate wq here */
-- 
2.43.0

