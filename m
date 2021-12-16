Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BA7476F78
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 12:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F63B10E2E9;
	Thu, 16 Dec 2021 11:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F22210E3D8;
 Thu, 16 Dec 2021 11:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639652820; x=1671188820;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KSqgalUZuAZqpR9LI1cmkKziU7byLNg2YmOQ6Dt/XVo=;
 b=jRZN2vxTaBLNPE2b4HNztd8MXkZxT1NjMhjgbGVixdw3ir2B46WgVAIC
 tn6Ybdr3BeJIq7a1Hb9bInSjQop5cBYboxf0IxsirH2F6pgvYcqi0FoOM
 QcIiJ4FQ0W0/kyhYXehTwMajiE5B+0Xk0EfBEBLwDXQvd2jeTp0DUUyew
 f9WuHBsinlI4Vb6soHHYL8agkbs8vFl/oljkxh50Q2YTs5/QEoE/vf5Zm
 k795stzRTzeNZdAqmGe2KcbwXd7QginA2zGsxZqsrINWNSvinBE5T86DW
 O99bOhZ2JYPrGyL/HxNMbigLCpDbN/V54OXFDt/pZHOEkA4we6yZA3Gv9 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="263624076"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="263624076"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 03:06:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="466005008"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 16 Dec 2021 03:06:57 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mxobB-000338-1X; Thu, 16 Dec 2021 11:06:57 +0000
Date: Thu, 16 Dec 2021 19:06:32 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] drm/i915: prev_deps() can be static
Message-ID: <20211216110632.GA39683@7c79fadf3f6c>
References: <20211215103611.777665-2-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215103611.777665-2-thomas.hellstrom@linux.intel.com>
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 kbuild-all@lists.01.org, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c:634:5: warning: symbol 'prev_deps' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 i915_gem_ttm_move.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 09463874ef24e7..e2f679be4e4517 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -631,8 +631,8 @@ __i915_ttm_move(struct ttm_buffer_object *bo,
 	return fence;
 }
 
-int prev_deps(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
-	      struct i915_deps *deps)
+static int prev_deps(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
+		     struct i915_deps *deps)
 {
 	int ret;
 
