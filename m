Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1959E8C6599
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 13:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656F710E729;
	Wed, 15 May 2024 11:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XkgOFzIi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA73610E729
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 11:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715772294; x=1747308294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VQW4Atj1viChCixtCGTfM3oiRFm6x+ROZyWXCogOUr0=;
 b=XkgOFzIinfmIt1SdxHpjO8n2+U9bwPhKJL2r8exUb3NboQNbjbk1bZub
 htHgY7Ri+zIt5L72iCgGgdKmzoZtGZWPSPKb0H/QBo/fxGydMyGJscobd
 7FL89Tg90te3e1k72Ixy++lbttnC/j3M3BzM7k0JOXBJuxXgW3PRDu6qA
 9qoOpEIZvmugrAlvNXR9XUHNWlvtAILOLjTXleV78epG10KDGxs0FWO8f
 aH+2CP8c3BzLyya1nczbRnx8kUneMFFPGoIYgsquaC0Pj3BVvdGbJMv7g
 yC8hqnBzRRDdKN3nlYh0a/fQcvXd9ULqdY1BKjUBDxoRoJuCfz7mRKRYm g==;
X-CSE-ConnectionGUID: K8Dw3JOdSwW//uXiRb4ydw==
X-CSE-MsgGUID: Q1pPR6diRVqljBqgTs2YAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="22955375"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="22955375"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 04:24:54 -0700
X-CSE-ConnectionGUID: 8j/o/HEdQROv0cbozeIKhQ==
X-CSE-MsgGUID: ADrg1lJuRKm/Mydz1PsltA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="30955225"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.245.149])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 04:24:51 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v12 02/10] drm/ttm/tests: Delete unnecessary config option
Date: Wed, 15 May 2024 13:24:25 +0200
Message-Id: <4c2122595eec0ccdbc7524954154904ea74db107.1715767062.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715767062.git.karolina.stolarek@intel.com>
References: <cover.1715767062.git.karolina.stolarek@intel.com>
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

