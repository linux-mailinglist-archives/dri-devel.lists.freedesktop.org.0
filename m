Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3283D7E8BC2
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 17:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D2210E292;
	Sat, 11 Nov 2023 16:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC5310E292
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 16:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699721769; x=1731257769;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=X1K4nrfzoAfrPqvT537HLIANMJRwbCdUtldsJzklx6Y=;
 b=koRisca/nzJeV8jVMqkhADeHB7S5bHp6MC/s5RZgCqC0yXnJlJMMFx0y
 p4M0x4jrrI8TuXbjvAUigy+L5aQYWfjt3DrN9WfNe7Jxc5Cgo0eiLv0fQ
 wN51nmfTu+DIOh1Zg2RHD7kKDucFpg9kqsPE0ZHqkKWHbhQP0azqqAepH
 oR/XOojsKeRzbgTDr6XSZoMf+CeJGa3GmfUvb2QTAgf3Lp82eVYPnund+
 c4ktb/uYNc2acMtnallMiTjkuSMhjoDy+ZtUOrTyEL8/Kenjln+0u7oo4
 hp9XjbEfCVIXsGNwllf0EFL1BweZeTdsPnvYL9Q/ILz2JXtzDzVU98b2h g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="380674569"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; d="scan'208";a="380674569"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2023 08:56:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="5091496"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 11 Nov 2023 08:56:01 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r1rH5-000Ad0-0U;
 Sat, 11 Nov 2023 16:55:59 +0000
Date: Sun, 12 Nov 2023 00:55:03 +0800
From: kernel test robot <lkp@intel.com>
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 3/8] dma-buf: heaps: secure_heap: Initialize tee session
Message-ID: <202311120053.qXNIYBzk-lkp@intel.com>
References: <20231111111559.8218-4-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231111111559.8218-4-yong.wu@mediatek.com>
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
Cc: dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Yong Wu <yong.wu@mediatek.com>, jianjiao.zeng@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, ckoenig.leichtzumerken@gmail.com,
 linaro-mm-sig@lists.linaro.org, linux-mediatek@lists.infradead.org,
 oe-kbuild-all@lists.linux.dev, Joakim Bech <joakim.bech@linaro.org>,
 tjmercier@google.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yong,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on robh/for-next drm-tip/drm-tip linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yong-Wu/dma-buf-heaps-Initialize-a-secure-heap/20231111-192115
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231111111559.8218-4-yong.wu%40mediatek.com
patch subject: [PATCH v2 3/8] dma-buf: heaps: secure_heap: Initialize tee session
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20231112/202311120053.qXNIYBzk-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311120053.qXNIYBzk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311120053.qXNIYBzk-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/dma-buf/heaps/secure_heap.o: in function `secure_heap_tee_session_init':
   secure_heap.c:(.text+0xc0): undefined reference to `tee_client_open_context'
>> m68k-linux-ld: secure_heap.c:(.text+0x134): undefined reference to `tee_client_open_session'
>> m68k-linux-ld: secure_heap.c:(.text+0x180): undefined reference to `tee_client_close_context'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
