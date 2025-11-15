Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 379CBC60C21
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 23:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4527810E062;
	Sat, 15 Nov 2025 22:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="FMQG6ZcW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B172210E062
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 22:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=VREPTJsa0f6sZJNhWeUyyc42lmUOFLGXWKmgIEOzWVU=; b=FMQG6ZcWq6uA9XOYpy0loX04o7
 OtC6x5Vhhrhc0fgQCh4xwG8UW0GAmBOkmmFA6z1u39s6Ch7OkKdwhRFhIuz4bdbPh+oQVVWil77kE
 fuFVDZJqhjn8liat+ZEROumjBYY78Qqc2bMXjj3fu0xXVd0quyuWOSWKIfyI1Htxzm6lHSPOHGMK3
 v7BE1fJs37TLGMWnGRLMQrkxr9/nLfCZDr7WSni9Rm5bfCTg+VlzYZxpmNlimeGd2harLlS3MOyPb
 t7KT01Om4/TsCMBI0vnlJb7Dypq+lnv3BDsu9dC7drmDZvfY8yryxea73W63DvtAESOsw6NIWgiNK
 oBeG9+kA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vKP15-0000000EARZ-1Iih; Sat, 15 Nov 2025 22:45:11 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/gpusvm: correct kernel-doc for
 drm_gpusvm_pages_valid_unlocked()
Date: Sat, 15 Nov 2025 14:45:10 -0800
Message-ID: <20251115224510.3829644-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.51.1
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

Use the correct function name and parameter description to avoid these
warnings:

WARNING: drivers/gpu/drm/drm_gpusvm.c:1229 function parameter 'svm_pages'
 not described in 'drm_gpusvm_pages_valid_unlocked'
WARNING: drivers/gpu/drm/drm_gpusvm.c:1229 expecting prototype for
 drm_gpusvm_range_pages_valid_unlocked(). Prototype was for
 drm_gpusvm_pages_valid_unlocked() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gpusvm.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20251114.orig/drivers/gpu/drm/drm_gpusvm.c
+++ linux-next-20251114/drivers/gpu/drm/drm_gpusvm.c
@@ -1216,9 +1216,9 @@ bool drm_gpusvm_range_pages_valid(struct
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
 
 /**
- * drm_gpusvm_range_pages_valid_unlocked() - GPU SVM range pages valid unlocked
+ * drm_gpusvm_pages_valid_unlocked() - GPU SVM range pages valid unlocked
  * @gpusvm: Pointer to the GPU SVM structure
- * @range: Pointer to the GPU SVM range structure
+ * @svm_pages: Pointer to the GPU SVM pages structure
  *
  * This function determines if a GPU SVM range pages are valid. Expected be
  * called without holding gpusvm->notifier_lock.
