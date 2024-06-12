Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BE09051F1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 14:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C0C10E03C;
	Wed, 12 Jun 2024 12:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nR5GXJ63";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E428310E03C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 12:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718193808; x=1749729808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VQW4Atj1viChCixtCGTfM3oiRFm6x+ROZyWXCogOUr0=;
 b=nR5GXJ63GixqY7QJDhXcRGtM0fWOTmSmsSHvSKrTW5oLA7qEJmA06Rag
 YnjdEPNGny1D5i/3hLmIFIP8o61MSssvwgGyKjFeSheCjHPnsVpGOigbh
 dQiWRVg6ERDjEPZcqCVnYfpb46byBJ1u4B2fAjjG3n8ZAzo7RV1TxAZpq
 hpW1IpigmrO5sYVmjF+Lfz5e928vK1VVIocYK289yli+SKX86yRoMY+Mc
 Oj/Wb9nxP7IKPfkxXPlhMmfB8ViL+QbPgLrLUcDBfWecf+xTmz8diGEeB
 zIgUpxBJmkylGgnMH/a7OuonR7d0stQHmXNy14OktYj3akhBHVnpfT2gt A==;
X-CSE-ConnectionGUID: HvsgWMoQSH+edYTPRE2q/A==
X-CSE-MsgGUID: 9BOn7rTNSqqaQAncvzPCSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11100"; a="15077591"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="15077591"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:03:28 -0700
X-CSE-ConnectionGUID: pZ3x1RafRMOoXOfgC3+Krw==
X-CSE-MsgGUID: tCFOXrXuSGG88Zr+pewj1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="70574027"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.245.214])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:03:26 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v14 02/12] drm/ttm/tests: Delete unnecessary config option
Date: Wed, 12 Jun 2024 14:02:56 +0200
Message-Id: <1f6f03ac5c6ba7d4b021c2a31638a0ae086486e8.1718192625.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718192625.git.karolina.stolarek@intel.com>
References: <cover.1718192625.git.karolina.stolarek@intel.com>
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

