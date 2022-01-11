Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D74C48A470
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 01:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BFBD10E360;
	Tue, 11 Jan 2022 00:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76F510E360
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 00:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641861148; x=1673397148;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oSiWUBicNRo0rW4tEcZUH2twEKB2d7F2DW3dIkWW8kg=;
 b=JCoHMPGWtWbY6y57nBF8+c7PnlryHYhgy2Dy9C18kawM0qDNoln4RQtj
 uUEfqtVkulOGOwDyhSF4F6Gb8NOrSPxHPsQDx/dXxYjoRx8lCgtGZ9/u7
 xf7ZqmuGi2/xi35oOyLGEdwLwJ28vsz7KzKow9xizcZKJNO/DhV5VFHc5
 IXY4n1nGti9s4Fyyr9sh4pm9FgcBh1fx68OfwMwKbnPmYLo7Bv3m+FIs2
 EbE5a0lWEKuOGPPz3iTD+MnktAA/HeInIfe89SbhPuJn+Kh/lTOPFuOdb
 EQDmAa5lSq05bXTGkzOMMmo3C1c7HljvzROUfbEIsPqSBJxaLhgWp9H+h A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="267700746"
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; d="scan'208";a="267700746"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 16:32:28 -0800
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; d="scan'208";a="514885876"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 16:32:28 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf-map: Fix dot vs comma in example
Date: Mon, 10 Jan 2022 16:33:05 -0800
Message-Id: <20220111003305.1214667-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix typo: separate arguments with comma rather than dot.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/linux/dma-buf-map.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
index 278d489e4bdd..19fa0b5ae5ec 100644
--- a/include/linux/dma-buf-map.h
+++ b/include/linux/dma-buf-map.h
@@ -52,13 +52,13 @@
  *
  *	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(0xdeadbeaf);
  *
- *	dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
+ *	dma_buf_map_set_vaddr(&map, 0xdeadbeaf);
  *
  * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem().
  *
  * .. code-block:: c
  *
- *	dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
+ *	dma_buf_map_set_vaddr_iomem(&map, 0xdeadbeaf);
  *
  * Instances of struct dma_buf_map do not have to be cleaned up, but
  * can be cleared to NULL with dma_buf_map_clear(). Cleared mappings
-- 
2.34.1

