Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AACC8A83B1
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 15:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2E011237D;
	Wed, 17 Apr 2024 13:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wh6jPTLl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603F910F608
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 13:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713359033; x=1744895033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ppCYQnhySlM9tC0XzYP2ebYb5PiZuQhruOP7hzOYql8=;
 b=Wh6jPTLl6zmi8dhHU15JQ5M4DSHu5pb4abWBvU+yu6YA35x3QHQzspTn
 oeGfrS4qDvzxXbhwWP+7SSUIW+vKArHnToQcN4vbToETvjZcRcMhZGb7z
 q9BuMfyPbK2NENVcJ/mbLvx4eiNNLbem68eq8Uc2SqSlYFswDYGFNigTy
 sWLYbv+6sUC6UqfAWIwyv1lyw+zcK4jon2en4FODWCUsSC8VyINjQY5uX
 qVLRkE/QVEXDRpcdwrt4FChwvWTCHBSwqBhx3S95SkSQUpfe+mOqe6shQ
 +ZjBrSaYU0bj3WN7GYHsXt4vMSv8B7Cfq0X1n2rObd0otBQ4yvGYNDIbu g==;
X-CSE-ConnectionGUID: ckFl5nKSS62Y4k+SqfcQRg==
X-CSE-MsgGUID: qonvtdgZQdSRio6ODZRQSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20268284"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="20268284"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 06:03:43 -0700
X-CSE-ConnectionGUID: fgumgzidREi00rsUwboNNg==
X-CSE-MsgGUID: IISX1CixRDm99IRa6XfFRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="53568982"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.244.75])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 06:03:41 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v11 02/10] drm/ttm/tests: Delete unnecessary config option
Date: Wed, 17 Apr 2024 15:03:15 +0200
Message-Id: <aeca47beb2a59ff7f170941bdf9bd50055fe8dd5.1713357042.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713357042.git.karolina.stolarek@intel.com>
References: <cover.1713357042.git.karolina.stolarek@intel.com>
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

DRM KUnit helpers are selected automatically when TTM tests are enabled,
so there's no need to do it directly in the .kunitconfig file.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 drivers/gpu/drm/ttm/tests/.kunitconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/tests/.kunitconfig b/drivers/gpu/drm/ttm/tests/.kunitconfig
index 75fdce0cd98e..1ae1ffabd51e 100644
--- a/drivers/gpu/drm/ttm/tests/.kunitconfig
+++ b/drivers/gpu/drm/ttm/tests/.kunitconfig
@@ -1,4 +1,3 @@
 CONFIG_KUNIT=y
 CONFIG_DRM=y
-CONFIG_DRM_KUNIT_TEST_HELPERS=y
 CONFIG_DRM_TTM_KUNIT_TEST=y
-- 
2.34.1

