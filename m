Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02285BFF124
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 06:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE21510E872;
	Thu, 23 Oct 2025 04:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ewh+coeh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FFA710E863;
 Thu, 23 Oct 2025 04:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761192487; x=1792728487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RzlSix5U7cqr5sfhOpvHMow72ZIMMD1wJfU49juUbRM=;
 b=ewh+coehk6ZMs5NVYyZmy946Ibcetlhz/tE96OvT8jmCJ3JMQJY/o2bt
 anQlqm+nvSrvQzL77ci0CsnlTVazkCY5ESlXpuATV2oLVX9YQx2gw96rw
 jni7y7Ux/7GiL9qY7wZIN9DDQ48Cpmqy3hUBR2VjBqRQFRRpA5eS7eqV1
 9v9j7JF3H5LMGHRayU1b/y/Zj/49l25Td2h1o8RCtglrFoX/Y8bdTkDVG
 K0soNiqQYLZK2Q0voe428nLwOzkrpwiPJmxtfo6DpUnBA8F0P8Tz4kbdh
 69h6vd5ggeLgi6T/CnwrL9jqjby8K6U5rJEN/7geI9P9m1HKxJUgxaVwJ A==;
X-CSE-ConnectionGUID: llZl+yp3Sj+9ckpuHG+Ftw==
X-CSE-MsgGUID: LfqklAeES1O82NyF5kKfyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63391286"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="63391286"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:08:05 -0700
X-CSE-ConnectionGUID: 7CY2gwZvQwSKkrkLp/w/XA==
X-CSE-MsgGUID: rMGINYbkR5mna45JTZkwUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="189175758"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:08:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com
Subject: [RFC PATCH 10/14] dma-fence: Fix selftest
Date: Wed, 22 Oct 2025 21:07:56 -0700
Message-Id: <20251023040800.970283-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023040800.970283-1-matthew.brost@intel.com>
References: <20251023040800.970283-1-matthew.brost@intel.com>
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

Fix compile error.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/dma-buf/st-dma-fence.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index 27a36045410b..bf82981f4259 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -451,8 +451,8 @@ struct race_thread {
 
 static void __wait_for_callbacks(struct dma_fence *f)
 {
-	spin_lock_irq(f->lock);
-	spin_unlock_irq(f->lock);
+	spin_lock_irq(f->extern_lock);
+	spin_unlock_irq(f->extern_lock);
 }
 
 static int thread_signal_callback(void *arg)
-- 
2.34.1

