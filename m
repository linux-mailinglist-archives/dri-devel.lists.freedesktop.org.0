Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1B581C10D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 23:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CF610E72E;
	Thu, 21 Dec 2023 22:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D0410E722;
 Thu, 21 Dec 2023 22:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703197695; x=1734733695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3sFxOzignG7QJ8LUvSkwRZ0eN/kd+CsuzD/vIyAotPY=;
 b=lYOXOEuqH48D3jbxOdCVBP0iC3bvCrLm0mmfjEuun/AafRJg/23C59R/
 EDyHWWMpnhDOzkgOzYmZRJRW0KzojhO09XRbz9TZl8vo0BIMtIcByB2G1
 K9sq9zDQTIZtzZJX1GrJD56mK2Nni34aXljgGBUXp8fqi42+QCQZpnRPJ
 lA9Hk3gkaHfKTT6FSwnU04DAMXHQ5lfHSc0uyj8H0eCxUcZTJ3FJgdD4j
 CE7U61+FGn8f0fd1zFEBURWpS1nYlJMPs4KUFPP1OhVk6PA1AtSvtuLer
 2G66m3bSqsWA9wYBWRWCY9RETcGBeu9L5/HuhP4w7b3Cot0uqShMx5lRk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="2876535"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="2876535"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 14:28:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="920458225"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="920458225"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 14:28:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 6/6] drm/xe: Enable 32bits build
Date: Thu, 21 Dec 2023 14:28:09 -0800
Message-Id: <20231221222809.4123220-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231221222809.4123220-1-lucas.demarchi@intel.com>
References: <20231221222809.4123220-1-lucas.demarchi@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, daniel.vetter@ffwll.ch,
 ogabbay@kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 airlied@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that all the issues with 32bits are fixed, enable it again.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index a53b0fdc15a7..5b3da06e7ba3 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_XE
 	tristate "Intel Xe Graphics"
-	depends on DRM && PCI && MMU && (m || (y && KUNIT=y)) && 64BIT
+	depends on DRM && PCI && MMU && (m || (y && KUNIT=y))
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
 	# the shmem_readpage() which depends upon tmpfs
-- 
2.40.1

