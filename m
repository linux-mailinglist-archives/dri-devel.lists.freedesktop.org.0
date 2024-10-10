Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D62D699866A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 14:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD72C10E8F2;
	Thu, 10 Oct 2024 12:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kuG0LmgP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A789E10E8E1;
 Thu, 10 Oct 2024 12:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728564380; x=1760100380;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sP9GNrSRwPDBt1snhmFN73pN7SrkBxUtBVajhe/Yi6E=;
 b=kuG0LmgPeFUlA/XQGIM0oB+AWsPaNqToEAfj9iBhX+0X9MjSLVOXXGBw
 dr733r790EbplFyqaRONVqO7NEVNA7JnXbdLVi/xft459PK9WAbTTilQI
 4UxEsZEyyeepHTGXtprnWOzd/rP2FFYFcghwV38yqfBa5rntGnm3nOIqR
 eDmICfrYwXDAq3PS2fRAA+JlS5ijVBvmgGBb/2ptdGuTl2Nh2w7212ShJ
 GZS81BW2OOCKLljCl2R/y9XvZgY5Wl9apMtP19Oef9PIXgqa3FdWd2hqG
 oBcpqrE5RDPwHA58bcYuGSt51HJf/HNU7DCGYFwtMHeEoJosDAxii4hsp w==;
X-CSE-ConnectionGUID: qu7rPH7xQWO9/5cTrTb2bg==
X-CSE-MsgGUID: gPVnYCenRn2cdOqS5Fl1DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="39308929"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="39308929"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 05:46:20 -0700
X-CSE-ConnectionGUID: K8h8heRJQzaO7bhB/AEYAw==
X-CSE-MsgGUID: 3+YFvUi5QqKlVYRaqyJWRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="76487049"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.227])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 05:46:17 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] drm/ttm: Fix incorrect use of kernel-doc format
Date: Thu, 10 Oct 2024 14:45:45 +0200
Message-ID: <20241010124545.82023-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
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

Add a missing colon.

Cc: dri-devel@lists.freedesktop.org
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20241010160942.192caf60@canb.auug.org.au/
Fixes: fc5d96670eb2 ("drm/ttm: Move swapped objects off the manager's LRU list")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/drm/ttm/ttm_device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 438358f72716..39b8636b1845 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -252,7 +252,7 @@ struct ttm_device {
 	spinlock_t lru_lock;
 
 	/**
-	 * @unevictable Buffer objects which are pinned or swapped and as such
+	 * @unevictable: Buffer objects which are pinned or swapped and as such
 	 * not on an LRU list.
 	 */
 	struct list_head unevictable;
-- 
2.46.0

