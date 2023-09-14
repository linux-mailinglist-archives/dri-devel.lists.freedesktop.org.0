Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC8E7A017F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 12:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56A110E0B7;
	Thu, 14 Sep 2023 10:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF0B10E0B7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 10:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694686743; x=1726222743;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=O1LLvMPKGNc5ZFEUOpVx7SNJUHBbUo3ACKo6XHAjDn8=;
 b=YhtEHe0H9Am871U0BLW6PIkwxC9RaTUKojP2lhFvOhoP1uN+cf3iRhG6
 Mlm3KGiqbVAaWcE1yptiwN82CKY3Ut3l0TagzZdKDiCTzHpnoBxIilbOr
 Q/oCU8JsUOMBGXGUBvGT4wcqbZNLY7ip+4opBPP7YemJiZ9onuSzTjsEm
 X0ahhgwZEokZWN838NFXbnKRWxWzIDEIXSC9obI4zWnJjvSGnv55H6yco
 vUSI/eChs1zZ6FpG+9XUdaIkeK++2psoh2gPfu+5FeDPTYhpIvhFmJtq1
 eO3SZMCF6fLCtiLhQK3cGoxUCDOP6LzYgWT5vs47300cs63L/BOgVapLp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="363949206"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="363949206"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 03:18:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="773840738"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="773840738"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 14 Sep 2023 03:18:44 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qgjQo-0001Tp-0F;
 Thu, 14 Sep 2023 10:18:42 +0000
Date: Thu, 14 Sep 2023 18:18:03 +0800
From: kernel test robot <lkp@intel.com>
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 6/9] dma-buf: heaps: mtk_sec_heap: Add tee service call
 for buffer allocating/freeing
Message-ID: <202309141707.zdT0yuMT-lkp@intel.com>
References: <20230911023038.30649-7-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911023038.30649-7-yong.wu@mediatek.com>
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
Cc: Anan Sun <anan.sun@mediatek.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 John Stultz <jstultz@google.com>, linux-arm-kernel@lists.infradead.org,
 oe-kbuild-all@lists.linux.dev, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, tjmercier@google.com,
 jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yong,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on robh/for-next linus/master v6.6-rc1 next-20230914]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yong-Wu/dma-buf-heaps-Deduplicate-docs-and-adopt-common-format/20230911-103308
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230911023038.30649-7-yong.wu%40mediatek.com
patch subject: [PATCH 6/9] dma-buf: heaps: mtk_sec_heap: Add tee service call for buffer allocating/freeing
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230914/202309141707.zdT0yuMT-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309141707.zdT0yuMT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309141707.zdT0yuMT-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/dma-buf/heaps/mtk_secure_heap.o: in function `mtk_kree_secure_session_init':
   mtk_secure_heap.c:(.text+0x130): undefined reference to `tee_client_open_context'
   loongarch64-linux-ld: drivers/dma-buf/heaps/mtk_secure_heap.o: in function `.L10':
   mtk_secure_heap.c:(.text+0x19c): undefined reference to `tee_client_open_session'
   loongarch64-linux-ld: drivers/dma-buf/heaps/mtk_secure_heap.o: in function `.L12':
   mtk_secure_heap.c:(.text+0x1dc): undefined reference to `tee_client_close_context'
   loongarch64-linux-ld: drivers/dma-buf/heaps/mtk_secure_heap.o: in function `mtk_sec_mem_tee_service_call.constprop.0':
>> mtk_secure_heap.c:(.text+0x274): undefined reference to `tee_client_invoke_func'
   loongarch64-linux-ld: drivers/dma-buf/heaps/mtk_secure_heap.o: in function `mtk_sec_mem_release.isra.0':
   mtk_secure_heap.c:(.text+0x464): undefined reference to `tee_client_invoke_func'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
