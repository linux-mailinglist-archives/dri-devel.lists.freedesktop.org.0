Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2CE7E5837
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 14:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D9A10E766;
	Wed,  8 Nov 2023 13:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B8810E75E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 13:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699451837; x=1730987837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4lFt16e/xTze3Thvd2HzaGtvx3fXpwZ3T+ri0v2khVE=;
 b=lpDO2oPjg78cS6K1Zy4UeoKbTw6HUWWVaVG4LtuvkohM/BhQAohvIBMi
 zVOIzU9mBuRmQHqvqht93cQMjoTawQ8zWmHfdZZjAAk0PDb9f2sUCCB11
 B6f0n8+FYL5BcuKiFXMNre7bEbZu4bJEdiDFijJRWWu1zhlKrASEUa8Zw
 jHjYSpINYsRBzrCdhpV9HYBUhqpCdM6UTgqMVQ1dRbshvJRyIGm0C6eYd
 BGh1vTfzGeuHKVqbYZjX2nskW4N8ACJ2i8Z0rTgvPYBP7eQojhBOMsucx
 8NPsher7RmMCAGNqO5Ui+IH8iT+4OFklsN3J0hJQm8OVdkCAeBu+YTApH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="475993618"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="475993618"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 05:57:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="880212974"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="880212974"
Received: from asawoscx-mobl.ger.corp.intel.com (HELO kdrobnik-desk.intel.com)
 ([10.213.23.233])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 05:57:03 -0800
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 4/8] drm/ttm/tests: Fix argument in ttm_tt_kunit_init()
Date: Wed,  8 Nov 2023 14:56:26 +0100
Message-Id: <31ecc40394a43f777dc87cc8a4d38a12411c9304.1699445194.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1699445194.git.karolina.stolarek@intel.com>
References: <cover.1699445194.git.karolina.stolarek@intel.com>
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
Cc: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove a leftover definition of page order and pass an empty flag value
in ttm_pool_pre_populated().

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Tested-by: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
index 2d9cae8cd984..b97f7b6daf5b 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
@@ -78,10 +78,9 @@ static struct ttm_pool *ttm_pool_pre_populated(struct kunit *test,
 	struct ttm_test_devices *devs = priv->devs;
 	struct ttm_pool *pool;
 	struct ttm_tt *tt;
-	unsigned long order = __fls(size / PAGE_SIZE);
 	int err;
 
-	tt = ttm_tt_kunit_init(test, order, caching, size);
+	tt = ttm_tt_kunit_init(test, 0, caching, size);
 	KUNIT_ASSERT_NOT_NULL(test, tt);
 
 	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
-- 
2.25.1

