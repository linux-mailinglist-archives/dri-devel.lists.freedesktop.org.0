Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F38107E8D89
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 00:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DEB10E2EA;
	Sat, 11 Nov 2023 23:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3865110E2EA
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 23:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699745304; x=1731281304;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yLMN9BN0x0GJyChe1fur9BIfuNV27m8XBnDpqqzLe8E=;
 b=eJOiaEHIAzoZuYA3YvFK8lNicOZPQET3AU8GUJmMSu1cWyPJ3noKGAOg
 W9SqF7SWdayOqlZoCAOBICc6JnqXbJkc6LsLDBe1y9FXFi63Pi+Yc476r
 B9H4jh7aW8xQ9/735qnd4O2WX2GPX3OUcuzCcP5xVffz94a/2PnBRmXDr
 MKu5lVYynmh+ax8nnzxZq4R/vcEbcjjgxpJpGWwBkhqhOwTtjHrMRz2aK
 FE/b1hxd3mGZ8B7DpCy82G/hAXKlinJCk7IiOtB+jX1/gww4icWb9HOre
 Ajcmw0rsMXGlOPyfXmf2rFV34wrLJMN+hjvVsdVJlg4jJvb1GsKVbDHgK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="3316458"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="3316458"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2023 15:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="764026399"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; d="scan'208";a="764026399"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 11 Nov 2023 15:28:15 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r1xOf-000AoU-1f;
 Sat, 11 Nov 2023 23:28:13 +0000
Date: Sun, 12 Nov 2023 07:28:00 +0800
From: kernel test robot <lkp@intel.com>
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 4/8] dma-buf: heaps: secure_heap: Add tee memory
 service call
Message-ID: <202311120707.FDrzrRME-lkp@intel.com>
References: <20231111111559.8218-5-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231111111559.8218-5-yong.wu@mediatek.com>
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
patch link:    https://lore.kernel.org/r/20231111111559.8218-5-yong.wu%40mediatek.com
patch subject: [PATCH v2 4/8] dma-buf: heaps: secure_heap: Add tee memory service call
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231112/202311120707.FDrzrRME-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311120707.FDrzrRME-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311120707.FDrzrRME-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `tee_client_open_session'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/dma-buf/heaps/secure_heap.o: in function `secure_heap_tee_session_init':
   secure_heap.c:(.text.secure_heap_tee_session_init+0xd0): undefined reference to `tee_client_open_context'
   powerpc64-linux-ld: secure_heap.c:(.text.secure_heap_tee_session_init+0x2b4): undefined reference to `tee_client_open_session'
   powerpc64-linux-ld: secure_heap.c:(.text.secure_heap_tee_session_init+0x458): undefined reference to `tee_client_close_context'
   powerpc64-linux-ld: drivers/dma-buf/heaps/secure_heap.o: in function `secure_heap_tee_service_call.constprop.0':
>> secure_heap.c:(.text.secure_heap_tee_service_call.constprop.0+0xbc): undefined reference to `tee_client_invoke_func'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
