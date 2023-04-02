Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DA96D3818
	for <lists+dri-devel@lfdr.de>; Sun,  2 Apr 2023 15:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242D610E033;
	Sun,  2 Apr 2023 13:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AFC10E010;
 Sun,  2 Apr 2023 13:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680442083; x=1711978083;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=gyLCwp1IcrTr0vfIdlSvIdhNokyLOMV8UHxyo8m3sSU=;
 b=OeBcc8s+ZUn1adwGHrxYXMjqAjzjSRYShiu0aUKztp+VXUIF+c23/HDi
 1H9XgEA6Co2IO4ISZg6KTDdMPEOJi8LbAuedqH8e2Sb/CziLxobe9dgmO
 jgbTh+hmksYybS3bfmR034aGtWqK9EoBHdkL/Ex9TveOsu6NCvEyGOOh/
 OjMJh5Q+CsoKXTw2M+6vbyCxKXh/rRzFrIeetkEP1lbc52hiAeQPJ7xIO
 5EqjSW4zSAIRmGzrvXUGHIZ6zVCeMOkC1dvsJwHg/pFWvdOfeWxkrC3xC
 fOLCQBWQTvLET7B3IXVxk45OVMc5xqhlwndxrH2miuzfBeCnHczcemLa5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="322125706"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; d="scan'208";a="322125706"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2023 06:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="688229111"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; d="scan'208";a="688229111"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 02 Apr 2023 06:28:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pixkW-000NPt-37;
 Sun, 02 Apr 2023 13:28:00 +0000
Date: Sun, 2 Apr 2023 21:27:13 +0800
From: kernel test robot <lkp@intel.com>
To: Qiang Yu <yuq825@gmail.com>
Subject: [drm-tip:drm-tip 3/7] drivers/gpu/drm/lima/lima_ctx.c:53:45: error:
 'struct drm_sched_entity' has no member named 'elapsed_ns'
Message-ID: <202304022108.kFqa3PUI-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
head:   25abf2df726cac2701780b068df74a9c36d60655
commit: 6e744f4032e55f6ea113d5b10906aebbd626e5b7 [3/7] Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip
config: arm64-buildonly-randconfig-r001-20230402 (https://download.01.org/0day-ci/archive/20230402/202304022108.kFqa3PUI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-tip git://anongit.freedesktop.org/drm/drm-tip
        git fetch --no-tags drm-tip drm-tip
        git checkout 6e744f4032e55f6ea113d5b10906aebbd626e5b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/lima/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304022108.kFqa3PUI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/lima/lima_ctx.c: In function 'lima_ctx_do_release':
>> drivers/gpu/drm/lima/lima_ctx.c:53:45: error: 'struct drm_sched_entity' has no member named 'elapsed_ns'
      53 |                 mgr->elapsed_ns[i] += entity->elapsed_ns;
         |                                             ^~
   drivers/gpu/drm/lima/lima_ctx.c: In function 'lima_ctx_mgr_usage':
   drivers/gpu/drm/lima/lima_ctx.c:125:43: error: 'struct drm_sched_entity' has no member named 'elapsed_ns'
     125 |                         usage[i] += entity->elapsed_ns;
         |                                           ^~


vim +53 drivers/gpu/drm/lima/lima_ctx.c

a1d2a6339961ef Qiang Yu    2019-03-09  42  
a1d2a6339961ef Qiang Yu    2019-03-09  43  static void lima_ctx_do_release(struct kref *ref)
a1d2a6339961ef Qiang Yu    2019-03-09  44  {
a1d2a6339961ef Qiang Yu    2019-03-09  45  	struct lima_ctx *ctx = container_of(ref, struct lima_ctx, refcnt);
bccafec957a5c4 Erico Nunes 2023-03-13  46  	struct lima_ctx_mgr *mgr = ctx->mgr;
a1d2a6339961ef Qiang Yu    2019-03-09  47  	int i;
a1d2a6339961ef Qiang Yu    2019-03-09  48  
bccafec957a5c4 Erico Nunes 2023-03-13  49  	for (i = 0; i < lima_pipe_num; i++) {
bccafec957a5c4 Erico Nunes 2023-03-13  50  		struct lima_sched_context *context = &ctx->context[i];
bccafec957a5c4 Erico Nunes 2023-03-13  51  		struct drm_sched_entity *entity = &context->base;
bccafec957a5c4 Erico Nunes 2023-03-13  52  
bccafec957a5c4 Erico Nunes 2023-03-13 @53  		mgr->elapsed_ns[i] += entity->elapsed_ns;
bccafec957a5c4 Erico Nunes 2023-03-13  54  
a1d2a6339961ef Qiang Yu    2019-03-09  55  		lima_sched_context_fini(ctx->dev->pipe + i, ctx->context + i);
bccafec957a5c4 Erico Nunes 2023-03-13  56  	}
a1d2a6339961ef Qiang Yu    2019-03-09  57  	kfree(ctx);
a1d2a6339961ef Qiang Yu    2019-03-09  58  }
a1d2a6339961ef Qiang Yu    2019-03-09  59  

:::::: The code at line 53 was first introduced by commit
:::::: bccafec957a5c4b22ac29e53a39e82d0a0008348 drm/lima: add usage counting method to ctx_mgr

:::::: TO: Erico Nunes <nunes.erico@gmail.com>
:::::: CC: Qiang Yu <yuq825@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
