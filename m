Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF42F9567B2
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 11:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE6810E23F;
	Mon, 19 Aug 2024 09:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="TZ+U3ai0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6320410E240
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:58:20 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5bec78c3f85so3169450a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 02:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1724061499; x=1724666299;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z/WM/vbPfsLB9+Ywm21579BeaRCehpr1hL+f09TjRp8=;
 b=TZ+U3ai0DwTUh0SgpiRFQMeGhgraNzA0Ci4g+4Src0W4D3Y6mZgnwYm7seY6cRW2Z6
 VCRX2dbBfOj9HQ1sN+5d9z7MFufLjcaM2O/FFCAIFfR3Fmgc3Ji+e+XRdAhIhQusuNCi
 dalVzERw+oqMymok7Ax+Z4LmTqGLUQHoluwL5zKJ/eTx3sfPJDxIOcas9guSXRCPB1jt
 20g3q2E96QBE4JROxysY5D7we6jT38y6Pkq8EzBpmtd5nWltkDkylZBY3vmbazDhKBVu
 omZ5EfohkdjkuCPFr1byErSio7sMrd+e56JqcHldbyD7BJpu9Dg9vLFC9iT+8PeIFC3O
 ds+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724061499; x=1724666299;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z/WM/vbPfsLB9+Ywm21579BeaRCehpr1hL+f09TjRp8=;
 b=XVZJR4j+RpNHPlt5De0lHKKjqBou7ebOvXS+weJD08vxwfBJy6129DP4idXJDGYS6U
 QBGjUgVXQpakZdsINtqPaVkzezJ65D0MyQTU1lcWT4xOL0x0XcGdIubSLdNdoNTUmNs+
 6U0BXkPbfo9StXBQAo6JZuyfx3RrjjnwWjaXxbkyGG7pSZOGar7RWJB6gsEHihtjlgV5
 PEHXQCPMAMfvwcJZpwrrGPyqt/Z+uJ1uz1wfUa6tBX+SBemB37SccCEH5IoUCp3bqyMY
 BKhHZJ4YPvp6Tl+MalYjwbPiGJk9JV6tSu3d+jkUXYkmLeG9GYekal/CfhcQQBx2FovD
 hihg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN2uPhFPK6HI4Gt4zVSBj/AarOvq/Xt5yf63cBPMyyugTo4dGqBw9sXXiajlXSGvff092VfI0MpYYuvFbw7mTrjFsv85e1M7kON7Op3OSa
X-Gm-Message-State: AOJu0Yywvf4ML4ZKPKeocaVAhjSfDEzL+KvDdYGHKUJo69nB2PmVczJH
 7sCzmJvvah0clxCs4eFDUOluaFCFHEFTmLO0ckugZDhPu5awT73YxgP5TPTqxKQ=
X-Google-Smtp-Source: AGHT+IE8dujqtNt2QB+POwilgZUwLTFuKQfMnKJC0wL4+RUjvO0qyeyj2M6q5xsQmP85IflYGSB+eQ==
X-Received: by 2002:a17:907:e61d:b0:a7a:a892:8e05 with SMTP id
 a640c23a62f3a-a83929534d8mr738035366b.33.1724061498556; 
 Mon, 19 Aug 2024 02:58:18 -0700 (PDT)
Received: from fedora.fritz.box (aftr-62-216-208-163.dynamic.mnet-online.de.
 [62.216.208.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83839472f4sm612225466b.184.2024.08.19.02.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 02:58:18 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thorsten Blum <thorsten.blum@toblux.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [RESEND PATCH] drm/xe/oa: Use vma_pages() helper function in
 xe_oa_mmap()
Date: Mon, 19 Aug 2024 11:57:52 +0200
Message-ID: <20240819095751.539645-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.46.0
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

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
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
2.46.0

