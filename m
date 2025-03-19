Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA43A6913E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:55:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5162110E51C;
	Wed, 19 Mar 2025 14:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DvcUDx3Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3F910E512;
 Wed, 19 Mar 2025 14:54:52 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-22401f4d35aso133080305ad.2; 
 Wed, 19 Mar 2025 07:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396091; x=1743000891; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aYQYwB4Q+56fcPRL5nHTiaN7xyPn+dVSiWbH+JLh+2I=;
 b=DvcUDx3YPcWULtabyfjpuMY2hPpFnYwss/hU0W2WqwZXdKeRQythUluh5x0FdjYYeN
 AhdN8o08xVFHOrhTSfQWEhcnxHevxsaxq8IaAfzP18soccP49/XuIkYNvBf3QofgmpX6
 rVQisbrEJQyGP2Un2hZg8bqpLulWM9kaIZIpBJf8G8pwlWRFRKvJYbAYBgAaha2J1bvs
 V2kNs/MyJ0CSjDqG8HhQp/6fY+yErE3zGfZRR5YDaoV7eV0CpzHpvNoIolRs2/6B+JEd
 xgCpbCiay4vWA+ceXfrzFbx/CCI/13lNXq1i/AECtACddmTYS+DtZ+IUWEMkXTWAaR3A
 KypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396091; x=1743000891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aYQYwB4Q+56fcPRL5nHTiaN7xyPn+dVSiWbH+JLh+2I=;
 b=p4VkXGU7EJqyN2xIVK4UEyX6ZVGiNehz/LLmie7Q9lzOt7nuor+/CWqbUkS5DOLu9s
 z+SKBUkNwBj9x6g0l5XU46c7KOaQgFO0C072EM0+5KOYlNlaAL224DDFSebowvQ++L0b
 E9vCEdUgnK3akFU6Edsw3wGq+y8gSAIZChTAz1Pz+Ps3sU+n5DK+SkAS18g39kjz4cHz
 xN+0/rr2I53jTxgVdqoA3BAnvjj6TxQEQ6oBlL4d13uK7oFQuk19ZiHJ8uAXfD72EHgz
 6os0V75pagjI4h+z3brQDrauFRYJQGs19VthfucNH8zpHwrMc7jGeGveJiLFMSItWRlk
 UebA==
X-Gm-Message-State: AOJu0YwTLWZLv6LNU1PiXvIPAi5QOyL4Zg2UeVeQxF+Sx8zUvYnI/LKU
 SJ6twk+J5scPnbx3FPW5ciPxI1TKsL+Rc++apIKAztDxXr68WmWeCyvDaw==
X-Gm-Gg: ASbGncscN02MXp/flju510qsnJitcK1D8fffyd/yQ3uzsMix/3lKpOFgi0RJXkKH4HL
 iBFjqArcsjzA0ALWwaqOfmhOWb1t+J2mwYxGXuWRuSEfw2eWju5Eh+hyAqyJCTclx1oqEeJlzlW
 WT+hF6kJ6PyRDAnXKk7BW1H8CvN/+FXr3TisMBMYQD4F99zwG6x6JgkEn1TpXThekG2kT18XJxK
 jkdi6M6eI+iqdqp20nz5QZU3GO2zYzJlFp2sSriGemj14cGUQdD3bJOjiEtPE+1CWlFpv9qUbs4
 kAfcDC64vI87hA9J57hTZvUlBtaQ424ijSHSufJzhb8awmP3JqLRoKbZiPPuH1XjoMYMgsmIB6J
 HwTd7KnUHdZ3+t5O/+d0=
X-Google-Smtp-Source: AGHT+IE+lJUACMy/jDtMWHtB7qfzX6V/KZu/qqIx8l4Z/A67DfiqQ7vwjT+eCEkpsRZkdL/7NBCcXQ==
X-Received: by 2002:a17:902:ea07:b0:224:e2a:9ff5 with SMTP id
 d9443c01a7336-22649800955mr49641495ad.9.1742396091394; 
 Wed, 19 Mar 2025 07:54:51 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-301bf63589dsm1681568a91.41.2025.03.19.07.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:54:50 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 02/34] drm/gpuvm: Remove bogus lock assert
Date: Wed, 19 Mar 2025 07:52:14 -0700
Message-ID: <20250319145425.51935-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319145425.51935-1-robdclark@gmail.com>
References: <20250319145425.51935-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

If the driver is using an external mutex to synchronize vm access, it
doesn't need to hold vm->r_obj->resv.  And if the driver is already
holding obj->resv, then needing to pointlessly grab vm->r_obj->resv will
be seen by lockdep as nested locking.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gpuvm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 1e89a98caad4..c9bf18119a86 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1505,9 +1505,6 @@ drm_gpuvm_bo_destroy(struct kref *kref)
 	struct drm_gem_object *obj = vm_bo->obj;
 	bool lock = !drm_gpuvm_resv_protected(gpuvm);
 
-	if (!lock)
-		drm_gpuvm_resv_assert_held(gpuvm);
-
 	drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
 	drm_gpuvm_bo_list_del(vm_bo, evict, lock);
 
-- 
2.48.1

