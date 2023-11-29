Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEB27FD636
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 13:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291A410E4E2;
	Wed, 29 Nov 2023 12:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8004410E4DE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 12:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701259379; x=1732795379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AF3Phcs87E/af1puNJkXN+vuma8kLPjiA/JGfox20lQ=;
 b=KfgGPGNdat9Rk6UqVHGcnDX+Mg9kntnmAsFDoG0/N2UKpkyFOcxVDQLc
 mTfwPPCCVri+JjMhUCtaNh1vDUhqzKtMkzbrL2HvhlowvtTzsuZsyExyj
 LmTBHi8chqtgxuYrbcnUnDg/KB2dXhxP3OGjFcuhNREq2Kzu1l3UTMq0b
 Jk4hUz5y0nAIkd94rzhgDja+mJDuwe6agxoORHckFf0le6AXRpMb2yRbi
 ttogBhVCfwmOkretQrjFN9Eb+ajfXA9VWE4P1ojdHe/0faOWxoVWqqYg1
 K3hM9cPDTTRoiw4laXpsnNYrMwK7hpPQAKz4wCvACe5VizYmTBDw1NALe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="479350830"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="479350830"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:02:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="772662501"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="772662501"
Received: from jszeliga-mobl.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.213.0.25])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:02:57 -0800
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 4/8] drm/ttm/tests: Fix argument in ttm_tt_kunit_init()
Date: Wed, 29 Nov 2023 13:02:30 +0100
Message-Id: <1e044d8682294908add0eb80c61624041b905b8e.1701257386.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701257386.git.karolina.stolarek@intel.com>
References: <cover.1701257386.git.karolina.stolarek@intel.com>
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
Cc: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove a leftover definition of page order and pass an empty flag value
in ttm_pool_pre_populated().

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Tested-by: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>
Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Acked-by: Christian König <christian.koenig@amd.com>
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
2.34.1

