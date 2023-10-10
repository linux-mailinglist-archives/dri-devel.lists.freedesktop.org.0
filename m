Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5756A7BFF36
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 16:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA4610E16F;
	Tue, 10 Oct 2023 14:27:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EEA10E16F;
 Tue, 10 Oct 2023 14:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696948066; x=1728484066;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5WdwfPpssWHEumsq9mc7e5KRo9vNp83NwtHC1MesJUc=;
 b=nnsJAtqHofhb3Qc6nw6Vt+wjEAfe7iRvYh61rVMFuVDqjUifX5Rq8Ka/
 3BclbTALMl9EFil542YCD60ab0HRUP0BZKj31wslTkS2fxckOfmH1chWY
 YF6noSJ51WkusAFi6Y6I56/8zT8zFSzvjHdLRBb/QIlZf6l+fUAHmE7ne
 SvUdSsSqBUBo+pvO021cTH0FzTcnr8ABwn+Yh8DDD+N7A44xlH7g+QGND
 nkHRj3CHQ7jwjBT6JzG9aIZYzqXSu+Kl6CIE/Blel8T0hqOIVguYZn11/
 L/Y0xVy94DCrO40ApJHL7ruNv36pY4hDZJRb5MS6W29hNbHsx/nurI+fH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="448598107"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="448598107"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 07:27:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="869713704"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="869713704"
Received: from agargas-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.164])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 07:27:43 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/gpuvm: Dual-licence the drm_gpuvm code GPL-2.0 OR MIT
Date: Tue, 10 Oct 2023 16:27:24 +0200
Message-ID: <20231010142725.8920-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dual-licence in order to make it possible for other non-GPL os'es
to re-implement the code. The use of EXPORT_SYMBOL_GPL() is intentionally
left untouched to prevent use of drm_gpuvm as a proxy for non-GPL drivers
to access GPL-only kernel symbols.

Much of the ideas and algorithms used in the drm_gpuvm code is already
present in one way or another in MIT-licensed code.

Cc: Danilo Krummrich <dakr@redhat.com>
Cc: airlied@gmail.com
Cc: daniel@ffwll.ch
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 2 +-
 include/drm/drm_gpuvm.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 02ce6baacdad..08c088319652 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0-only
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright (c) 2022 Red Hat.
  *
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 361fea5cb849..21bbf11415b3 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
 
 #ifndef __DRM_GPUVM_H__
 #define __DRM_GPUVM_H__
-- 
2.41.0

