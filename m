Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 487654B9951
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 07:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B7810E8F8;
	Thu, 17 Feb 2022 06:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7897810E8F8;
 Thu, 17 Feb 2022 06:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645079787; x=1676615787;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jGCPnNhPH+YegAPSMgRBd6jdjRJZA4MmgAk4a72HVkk=;
 b=XGEI2rhQSNT+kgXHkBoIW4K+4DGSqbslvRTWfN8tR/sYG+P8w3ai/14S
 9a669cifmEeQOkny3bKTmjrI3JiXdpp8p9t9n1dr8z37Gk5fS/RbOsRy8
 whd1z7Iw2hhMXS58VttmB9iam8lSXN4Mzf6h9QmDtpHXiHRqYelWQqsA7
 ALJy8AXUX76hptfu7rkVLa/T6e/aA5nMm8oqho849OvhUtY+A7kbYQ6YB
 gLYWuSXWV3nnAy/k36I7S6u3niBhflFK0MB5Q1I2AXMEQiSBpDkEewcVy
 MLLoN7Oi5OiC7qUhX/0pcV57daOWrAvzfHX7PWSNSsexFDDK2ggiBQm63 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="249642380"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="249642380"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 22:36:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="774444079"
Received: from zcmahone-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.252.137.102])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 22:36:26 -0800
Date: Wed, 16 Feb 2022 22:36:25 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [drm-tip:drm-tip 4/8]
 drivers/gpu/drm/solomon/ssd130x.c:451:18: error: incomplete definition of
 type 'struct dma_buf_map'
Message-ID: <20220217063625.sm5ua5xf4jo2ekku@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <202202171455.bclm1YBC-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <202202171455.bclm1YBC-lkp@intel.com>
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
Cc: kbuild-all@lists.01.org, intel-gfx@lists.freedesktop.org,
 llvm@lists.linux.dev, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, javierm@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Javier


On Thu, Feb 17, 2022 at 02:25:08PM +0800, kernel test robot wrote:
>tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
>head:   e141e36b2871c529379f7ec7d5d6ebae3137a51b
>commit: 7ca6504c36709f35c4cc38ae6acc1c9c3d72136f [4/8] Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip
>config: mips-buildonly-randconfig-r002-20220217 (https://download.01.org/0day-ci/archive/20220217/202202171455.bclm1YBC-lkp@intel.com/config)
>compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0bad7cb56526f2572c74449fcf97c1fcda42b41d)
>reproduce (this is a W=1 build):
>        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>        chmod +x ~/bin/make.cross
>        # install mips cross compiling tool for clang build
>        # apt-get install binutils-mips-linux-gnu
>        git remote add drm-tip git://anongit.freedesktop.org/drm/drm-tip
>        git fetch --no-tags drm-tip drm-tip
>        git checkout 7ca6504c36709f35c4cc38ae6acc1c9c3d72136f
>        # save the config file to linux build tree
>        mkdir build_dir
>        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/solomon/
>
>If you fix the issue, kindly add following tag as appropriate
>Reported-by: kernel test robot <lkp@intel.com>
>
>All error/warnings (new ones prefixed by >>):
>
>>> drivers/gpu/drm/solomon/ssd130x.c:447:74: warning: declaration of 'struct dma_buf_map' will not be visible outside of this function [-Wvisibility]
>   static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_map *map,
>                                                                            ^

this is now called iosys_map in drm-intel... drm-tip will need a fixup
for the merge.

>>> drivers/gpu/drm/solomon/ssd130x.c:451:18: error: incomplete definition of type 'struct dma_buf_map'
>           void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
>                        ~~~^

this shouldn't really be done.

Lucas De Marchi
