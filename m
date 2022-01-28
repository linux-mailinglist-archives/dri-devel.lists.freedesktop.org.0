Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D851D49F2B7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 06:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F1A10F2CA;
	Fri, 28 Jan 2022 05:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BFF10F2CA;
 Fri, 28 Jan 2022 05:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643346118; x=1674882118;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RO9ZZxmjqCuKF+rRhN0z+oMjHUed1ETrae8AqmGHMHw=;
 b=n3qIbAeABicvEIAyKluOA/YE79RNqku9liLx9vOkYS/nP3ZlJGbZY5jl
 Qo/V54qZYoSXMkOludFp7zWZUun+3neajGjz/IWgYrR2UOQ7ZdQIrQE+v
 fhVpkl4zZYpDbBoyZuk/y0HR2yuY4yL/NpNZSy9z++zouJON9d94yahOt
 wNblf0+5M8nUr/imA94bAXTfSE29V95bUk0PS8e4nMd8LKB20btDuDDuH
 7diz5SzBrQCcxme8fwpcV/zf2ouQGj+Dt5fH+Ci1OzlYbuEMF1Bvx8ClY
 ChriSsEf0/bG2AN1hmFoQ4GFEjNws3pMJxqKzvbUyH7Jcf6VJ+ltQDXLR A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="230623852"
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; d="scan'208";a="230623852"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 21:01:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; d="scan'208";a="628984302"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 27 Jan 2022 21:01:54 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nDJOU-000NUt-82; Fri, 28 Jan 2022 05:01:54 +0000
Date: Fri, 28 Jan 2022 13:01:11 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>, hch@lst.de, jgg@nvidia.com,
 jani.nikula@linux.intel.com
Subject: [RFC PATCH] i915/gvt: intel_gvt_match_device() can be static
Message-ID: <20220128050111.GA69282@e2c1dfe2c692>
References: <20220127120508.11330-1-zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220127120508.11330-1-zhi.a.wang@intel.com>
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
Cc: kbuild-all@lists.01.org, Zhi Wang <zhi.wang.linux@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/gpu/drm/i915/gvt/handlers.c:45:6: warning: symbol 'intel_gvt_match_device' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 handlers.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index dad31ad074a03..459f0d902f64f 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -42,7 +42,7 @@
 #include "display/intel_display_types.h"
 #include "display/intel_fbc.h"
 
-bool intel_gvt_match_device(struct intel_gvt *gvt,
+static bool intel_gvt_match_device(struct intel_gvt *gvt,
 		unsigned long device)
 {
 	return intel_gvt_get_device_type(gvt->gt->i915) & device;
