Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC9393B682
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 20:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5796310E78B;
	Wed, 24 Jul 2024 18:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="cWXfczfG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF3E10E78B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 18:19:02 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5a10bb7bcd0so174663a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 11:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1721845141; x=1722449941;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u/dAQiFueQuhjl+MjEIf3d+/e2gf4wNWZn6jJ/xAWzw=;
 b=cWXfczfGApeo0kVPeEKKdMn/c2ThwaC/Dmzc2mWJ8wvcejUTU6fEMuRodfFJHMf6CL
 GApMwWVDAUZHtguq/NjDNdMlv12c82rV3obY+qCSqCoVQcl5636Qjay09XgY4Rtz3mQ1
 HR05KkXiT4k+kqdrTuxXjShwrLBBtYdJDhfEJhlTlOzjO6Gc2/RhF/hBeIgyT1wo8ITQ
 HOTxi+ONxvtUw6FykJk1el7J3XuFDYY4mQxa5xddyCeFLFbESvdXXp5liwv7Y4YNnyNM
 6Bp5eNVxQcKRKxZw5lSJQEmJaN7uEL1XTrCuTN+f/WRE4OC6BFcRI6e6B4t0oQGH80yV
 k4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721845141; x=1722449941;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u/dAQiFueQuhjl+MjEIf3d+/e2gf4wNWZn6jJ/xAWzw=;
 b=xIOM1wPVpanwf5fbumv9xilMWrLJOvwEXQPEe1yBTo4dhsKgJmnue4qL2mIrH1Xd4R
 EhKpMvapfiqb5njHy4QGR5VADWUgN6xqJ9jD1ES8kGJnXAramGzfRaZVeHLXX6FUA6R2
 qlPQkHK04JEEzvpTzRXgSoyRIG7zGrgTdAO59QMCXjhrwpGwbbuNKlugGjXK8c8wZy5t
 NVElW6ys/7eRji+yZUImtJFKIAhBUwcmF1tCwHnGcOpVsNa+arH5OD5IFFWHkG4SFctl
 DbfwG7kp85y20hYNapRcgQtvplHAiXuyRjl4D5wyHSg2PpbGvTDRdzd+ipLlgiUt3Wgt
 EeIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvrEYKZJS6CQwA91DK7ElgUZ7YfWoqbJNIAqccHrdx0P1OzAMsTeM5Ll6uGslkXezaA5+NVD3JuJE4Xi7vUQhgGQLUkWPyEhkWYptl3J9S
X-Gm-Message-State: AOJu0Yx+IGK3TRh/iy9w/gh++H279aVo55JvwbPfpxOAVeth1/z1lsie
 AOR0TuoA3lC4mermtPovum8B7vQ24NgtO/Te9/DIGQ70TB3FsvMR1C6DQdVxLpE=
X-Google-Smtp-Source: AGHT+IEcoUjg/H7Tny99gyfAD8CirkS4HB9FW7AtPMpVNqZyQxrRGb//+nTTNOgXurdHH0YDNc7dgw==
X-Received: by 2002:a50:ccd5:0:b0:5a3:8c9:3c1d with SMTP id
 4fb4d7f45d1cf-5ac2a6c2b15mr172141a12.14.1721845140713; 
 Wed, 24 Jul 2024 11:19:00 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-26.dynamic.mnet-online.de.
 [82.135.80.26]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30aaa30b9sm9101646a12.28.2024.07.24.11.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 11:19:00 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] drm/xe/oa: Use vma_pages() helper function in xe_oa_mmap()
Date: Wed, 24 Jul 2024 20:18:27 +0200
Message-ID: <20240724181826.3163-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.2
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

Use the vma_pages() helper function and remove the following
Coccinelle/coccicheck warning reported by vma_pages.cocci:

  WARNING: Consider using vma_pages helper on vma

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 6d69f751bf78..133292a9d687 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1244,8 +1244,7 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
 	vm_flags_mod(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY,
 		     VM_MAYWRITE | VM_MAYEXEC);
 
-	xe_assert(stream->oa->xe, bo->ttm.ttm->num_pages ==
-		  (vma->vm_end - vma->vm_start) >> PAGE_SHIFT);
+	xe_assert(stream->oa->xe, bo->ttm.ttm->num_pages == vma_pages(vma));
 	for (i = 0; i < bo->ttm.ttm->num_pages; i++) {
 		ret = remap_pfn_range(vma, start, page_to_pfn(bo->ttm.ttm->pages[i]),
 				      PAGE_SIZE, vma->vm_page_prot);
-- 
2.45.2

