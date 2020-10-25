Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 146CE298347
	for <lists+dri-devel@lfdr.de>; Sun, 25 Oct 2020 20:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503B66E092;
	Sun, 25 Oct 2020 19:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B296A6E092
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 19:02:09 +0000 (UTC)
IronPort-SDR: BHlL1oiBdLxbAmN/WJa0a+Ksfcy47JyhjjF5bf30jSZlinx2yUUrQOpPocxcBiE74Ctb8+p3QA
 XoviPTw0p7BA==
X-IronPort-AV: E=McAfee;i="6000,8403,9785"; a="147704334"
X-IronPort-AV: E=Sophos;i="5.77,416,1596524400"; d="scan'208";a="147704334"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2020 12:02:08 -0700
IronPort-SDR: ZGcz3/ENZDuArUPjCAGCHcmp3RC35n5L3RtT+8axxuspkqdxpLTPO28KhpPoqmdzDyxvvg919J
 D5p3Sm4ZjxqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,416,1596524400"; d="scan'208";a="423916610"
Received: from lkp-server01.sh.intel.com (HELO cda15bb6d7bd) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 25 Oct 2020 12:02:07 -0700
Received: from kbuild by cda15bb6d7bd with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kWlHJ-000126-K0; Sun, 25 Oct 2020 19:02:05 +0000
Date: Mon, 26 Oct 2020 03:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Madhav.Chauhan@amd.com, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] drm/ttm: ttm_pool_apply_caching() can be static
Message-ID: <20201025190124.GA72848@3000059d93ee>
References: <20201025154100.16400-6-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025154100.16400-6-christian.koenig@amd.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Ray.Huang@amd.com, kbuild-all@lists.01.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Signed-off-by: kernel test robot <lkp@intel.com>
---
 ttm_pool.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 86bd173d93a52..a7818b3cd7c6e 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -151,8 +151,8 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
 }
 
 /* Apply a new caching to an array of pages */
-int ttm_pool_apply_caching(struct page **first, struct page **last,
-			   enum ttm_caching caching)
+static int ttm_pool_apply_caching(struct page **first, struct page **last,
+				  enum ttm_caching caching)
 {
 #ifdef CONFIG_X86
 	unsigned int num_pages = last - first;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
