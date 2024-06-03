Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133008D8411
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 15:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389DB10E213;
	Mon,  3 Jun 2024 13:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G46GZjQQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FFF10E3C3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 13:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717421794; x=1748957794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VQW4Atj1viChCixtCGTfM3oiRFm6x+ROZyWXCogOUr0=;
 b=G46GZjQQ4ouXtHHdQhKBpC+dAwWTTua97XqWUFsXMfgAJ5NgRFXjC5w8
 89QGtSg4ssjR+8m2i4V6pr7hpXbn7o3kHzwKrSrqyzXJVQJ4vqZ72h6AS
 uoSxgI3WbaD9P+jf3mGPQ8RVpQJ4sTZjIvNqlGEE4CacATLfcNWM+aOHU
 n9bwKPexz6gJCPuOyr8ZvcxF8MNMW9jCChLixAYOf8CXu44XXIHwj/MWS
 rcfoHZjENQ51enLk+YRsYiJJ62k9BP1coe0WKH6hhcLNnX0ciOuQ57zyp
 Bs7uTxURw8Mnk7dykaVZwY8q9PjdpQMnXWkGK3bukypnhPgucOhWGWLm9 A==;
X-CSE-ConnectionGUID: xZ7f4XR2T8OM71YpulkWHQ==
X-CSE-MsgGUID: x1MRw4h0SOuqRUz7s45Iew==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="17752518"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="17752518"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 06:36:34 -0700
X-CSE-ConnectionGUID: NXw2lDtBQGmIi56h/w050A==
X-CSE-MsgGUID: h8Ni71/RQoO/xeBfPusgQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="36959999"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.245.157])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 06:36:31 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v13 02/12] drm/ttm/tests: Delete unnecessary config option
Date: Mon,  3 Jun 2024 15:36:05 +0200
Message-Id: <d33fa8881dd0a2e91b5728dccbf8b3b743ecca27.1717420597.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717420597.git.karolina.stolarek@intel.com>
References: <cover.1717420597.git.karolina.stolarek@intel.com>
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
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
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

