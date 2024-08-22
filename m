Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A38B895ACCD
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 07:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9940C10E719;
	Thu, 22 Aug 2024 05:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kVJ0VfNp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B7910E716
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 05:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724304167; x=1755840167;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u+ntMwNM4N+Pew9uRxv+peyqvNukvJVY9Zvttn3kqzI=;
 b=kVJ0VfNpzdK7YhNl+34mQVLILXu+T8iCEI3Fdc5NlCZB9FyyRkV0rZFJ
 mfNko5U24mFS6zj8xmmgfZVjdvsWj6M8/TGEDW7h78rUPtW2Y9ACqJr0e
 DE5iwc7BDYOIZ0d62FkqSzkjh+N/uPpx+iY3ixNP0aeJFoZeng1lG5Moj
 HZAfUNiMs9lLnLnJqoXAtpA3HCqEhTqfPFgvwc2LdBukm/qt19wtBl+Lz
 hjzpAXuycQk9/PZnlUimD63sPFkWmBwDPwcWh3Uq8KNFq0YCRYvh+FLZ9
 e6R8DH9hD02KBTH9rPTfiPLtTslkYOcUeck6P+jBITcFyGbqiW4bps0Tz g==;
X-CSE-ConnectionGUID: 9VMg5CUjQsqvYbpiPW7CEw==
X-CSE-MsgGUID: HkjokT41S6eim48aydA6AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33849855"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="33849855"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 22:22:47 -0700
X-CSE-ConnectionGUID: nywswPGrTw2bauC7v5k5Sg==
X-CSE-MsgGUID: aAazWljeRAKtipaW50DxVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="65673644"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 22:22:47 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH] MAINTAINERS: udmabuf: Add myself as co-maintainer for udmabuf
 driver
Date: Wed, 21 Aug 2024 21:58:06 -0700
Message-ID: <20240822045806.3563883-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
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

I would like to help maintain the udmabuf driver, in light of the
recent changes that converted the driver to use folios instead
of pages. Furthermore, I also contribute to Qemu's virtio-gpu
module (and UI modules), that are primary users of udmabuf driver.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa4cab9492a2..af29a75b4a31 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23875,6 +23875,7 @@ F:	lib/iov_iter.c
 
 USERSPACE DMA BUFFER DRIVER
 M:	Gerd Hoffmann <kraxel@redhat.com>
+M:	Vivek Kasireddy <vivek.kasireddy@intel.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-- 
2.45.1

