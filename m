Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB77CAD75FC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 17:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2569B10E4D7;
	Thu, 12 Jun 2025 15:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+SVCPMV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2075010E4D7;
 Thu, 12 Jun 2025 15:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749742089; x=1781278089;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7t4X7O0r9uQJ8NGgD6KQHZJGALnrok/RrYVUwFzRLag=;
 b=j+SVCPMV0wT+QyY6cTE4Sh0lCBSobokwHqSOMcXImjYVne/wRFs7JbCS
 RlHZ6Zh2FAzR45PlcXhAQKBLl/6ZsoDq8pIlDu9/l6AVMmmdzsgRAew6V
 xiJgFif8HEP4awp2tuasFZBGXbHkZ1DCLrMWy7amns3nA9evznNC8AeqP
 gmHI1s+ms+DP2RC2rwVPniYRLztr15idi8o5stwDc0mPvhqJhqHaBv/Rv
 yLTi9DJYbAxJ9wCE5HYk0FY/LjXqj1Pz/59OoJYYuIvXaA/iObxt2IYVB
 32sNnEZNSpgg2nZPteBZthAJfP8Zt6T42yjb5lFV+BGrgK1qFIZCAlFjk Q==;
X-CSE-ConnectionGUID: NQbz4bjuQ7+U4Gc3AtUSzQ==
X-CSE-MsgGUID: TX1Ou5JCT/WYGu5Si8OLTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="63337932"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="63337932"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 08:28:07 -0700
X-CSE-ConnectionGUID: qxtqFeTcS5CysZWBbQRDpw==
X-CSE-MsgGUID: 7Lpdmqc9TFWJMiIEmaulCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="178525817"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.242])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 08:28:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH] drm/nouveau/gsp: fix kernel-doc directive after file rename
Date: Thu, 12 Jun 2025 18:27:58 +0300
Message-Id: <20250612152758.659750-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Fix the kernel-doc directive after the rename
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/{r535,rm/r535/gsp}.c leading to
erros:

ERROR: Cannot find file ../drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
WARNING: No kernel-doc for file ../drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

Fixes: c472d828348c ("drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm/r535/")
Cc: Ben Skeggs <bskeggs@nvidia.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 Documentation/gpu/nouveau.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/nouveau.rst b/Documentation/gpu/nouveau.rst
index b8c801e0068c..878fb1ade31e 100644
--- a/Documentation/gpu/nouveau.rst
+++ b/Documentation/gpu/nouveau.rst
@@ -25,7 +25,7 @@ providing a consistent API to upper layers of the driver stack.
 GSP Support
 ------------------------
 
-.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
    :doc: GSP message queue element
 
 .. kernel-doc:: drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
-- 
2.39.5

