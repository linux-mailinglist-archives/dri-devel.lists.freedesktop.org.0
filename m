Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE83E4C4607
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 14:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6371210E4D1;
	Fri, 25 Feb 2022 13:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FB210E49B;
 Fri, 25 Feb 2022 13:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645795339; x=1677331339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u7de/2uDQ0rSpjXkThZe1c+21klQY/7JlRU9yeUG78U=;
 b=bLLSV8kgElh1EtfCuTdMsDEgo8QfuGXT2xEilZ/RI+3RRSCbSK2nrmG5
 q1VYDcucYc9XR4m8/PILndJRfUy7L5zB3RHcCp4XZSyV1wWFucEQ2ifll
 Pj4Xst99920bkis8Ol8GMfN3oKjjA4Jdb6FoCnl3/jCfFJNFVa5QCSS69
 1fGfhFnUmcnAPiJGnwiwteVE6g26k7bFrEjjWPqXJp3z2KyZfBVVekLP/
 C/C/hK9Nh7hdcohSX4Pu7wWlmwB0uS32tl1pcPmzu4jwPqD3xbwSi+j4f
 Ei1Ps/nh4wgjbf5mqBkAbqlxkwKul6BzesBDoww51nHzVbcmf/badMxdM Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="236000583"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="236000583"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 05:22:19 -0800
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="544050488"
Received: from asaechnx-mobl2.ccr.corp.intel.com (HELO
 hades.ger.corp.intel.com) ([10.252.49.63])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 05:22:18 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/prime: Update docs
Date: Fri, 25 Feb 2022 15:22:13 +0200
Message-Id: <20220225132213.1435026-3-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220225132213.1435026-1-gwan-gyeong.mun@intel.com>
References: <20220225132213.1435026-1-gwan-gyeong.mun@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It updates the name of the structure with the target function callback is
incorrect
 : drm_gem_object_funcs.gem_prime_import_sg_table to drm_driver.gem_prime_import_sg_table
And it updates the part where the description and the function callback
name are different.
 : drm_gem_object_funcs.pin to drm_gem_object_funcs.unpin

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/drm_prime.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index e3f09f18110c..87595f5871f9 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -588,7 +588,7 @@ EXPORT_SYMBOL(drm_gem_map_attach);
  * @dma_buf: buffer to detach from
  * @attach: attachment to be detached
  *
- * Calls &drm_gem_object_funcs.pin for device specific handling.  Cleans up
+ * Calls &drm_gem_object_funcs.unpin for device specific handling.  Cleans up
  * &dma_buf_attachment from drm_gem_map_attach(). This can be used as the
  * &dma_buf_ops.detach callback.
  */
@@ -842,7 +842,7 @@ EXPORT_SYMBOL(drm_prime_pages_to_sg);
  * of the the buffer described by the provided sg_table.
  *
  * This is useful for implementing
- * &drm_gem_object_funcs.gem_prime_import_sg_table.
+ * &drm_driver.gem_prime_import_sg_table.
  */
 unsigned long drm_prime_get_contiguous_size(struct sg_table *sgt)
 {
-- 
2.34.1

