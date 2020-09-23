Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D373274F00
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 04:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86EBB89B97;
	Wed, 23 Sep 2020 02:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFBC89B69
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 02:29:12 +0000 (UTC)
IronPort-SDR: HwQ7KMvemjGohI4sDFjioGK+pCf1W5fqUEmcEiKhlhXhN8m0pOCvckgrXZtQGRTcwPnOHL2uev
 XrPakfeVzS7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="245594228"
X-IronPort-AV: E=Sophos;i="5.77,292,1596524400"; d="scan'208";a="245594228"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 19:29:12 -0700
IronPort-SDR: Ab0WJOAcJM0Ok4pA3ol8weVrH+JKgOs+lpUik2T3y9kt4R6D/TFHzkPBmF/caNbwcn0fPMKC0p
 VWCpgQf4T7ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,292,1596524400"; d="scan'208";a="510814702"
Received: from lkp-server01.sh.intel.com (HELO 928d8e596b58) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 22 Sep 2020 19:29:10 -0700
Received: from kbuild by 928d8e596b58 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kKuWs-0000jy-Cs; Wed, 23 Sep 2020 02:29:10 +0000
Date: Wed, 23 Sep 2020 10:28:28 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>
Subject: [RFC PATCH radeon-alex] drm/amdgpu: kfd_initialized can be static
Message-ID: <20200923022828.GA49981@6c0fda7302fc>
References: <202009231033.xsCmjah5%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202009231033.xsCmjah5%lkp@intel.com>
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
Cc: kbuild-all@lists.01.org, Kent Russell <kent.russell@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Fixes: 0b54e1e30e9f ("drm/amdgpu: Fix handling of KFD initialization failures")
Signed-off-by: kernel test robot <lkp@intel.com>
---
 amdgpu_amdkfd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 7f14461f7f402..01780bb8727f6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -36,7 +36,7 @@
  */
 uint64_t amdgpu_amdkfd_total_mem_size;
 
-bool kfd_initialized;
+static bool kfd_initialized;
 
 int amdgpu_amdkfd_init(void)
 {
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
