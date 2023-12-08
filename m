Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB9F80A813
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 17:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A64F10E2C8;
	Fri,  8 Dec 2023 16:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BC010E2C8
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 16:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702051386; x=1733587386;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=C19RbT0mHCppC4S0KT3rye9ymMmBfM2p8ZzqvKfQjpY=;
 b=d9A6iOXrIzHMGNXJxAqm3QbNwomTO2hXjiso+3/EEoGm3wcyPVRz/MFg
 /BSiluV4IVbujQ/4dqiT0AhdJ2/kXxR/Jw0KQ6ofGSSDOVqsQOZBDYsQV
 s+ZEhfpRD38+ZRGFebrPVkUbdllNNRujHNZuiGHgmQ+NFXtofF1USPkHE
 Maw5Yu4PRo8Pk2UBl/AZa4uWA+7gJSHm5V4OrRXnprjNO2TIbTMtjlYuV
 bnHQ7kEdwiuAyv/0zcbJxPvZm0UAuObERaqSusvJTIP7Qm+LvgDOeZv4J
 XS2kyd96EOsUxmAxASGmWWACyB+LMNKqmzpdSVW5ffR6JwcS2Turnz01D Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="480618626"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="480618626"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 08:03:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="890167082"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="890167082"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 08 Dec 2023 08:02:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rBdJZ-000Dx2-0n;
 Fri, 08 Dec 2023 16:02:57 +0000
Date: Sat, 9 Dec 2023 00:02:21 +0800
From: kernel test robot <lkp@intel.com>
To: Mina Almasry <almasrymina@google.com>,
 Shailend Chand <shailend@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [net-next v1 06/16] netdev: support binding dma-buf to netdevice
Message-ID: <202312082305.DMh51QVo-lkp@intel.com>
References: <20231208005250.2910004-7-almasrymina@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208005250.2910004-7-almasrymina@google.com>
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
Cc: Mina Almasry <almasrymina@google.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, David Ahern <dsahern@kernel.org>,
 Kaiyuan Zhang <kaiyuanz@google.com>, Eric Dumazet <edumazet@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jakub Kicinski <kuba@kernel.org>, Yunsheng Lin <linyunsheng@huawei.com>,
 Shakeel Butt <shakeelb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, oe-kbuild-all@lists.linux.dev,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Paolo Abeni <pabeni@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mina,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Mina-Almasry/net-page_pool-factor-out-releasing-DMA-from-releasing-the-page/20231208-085531
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231208005250.2910004-7-almasrymina%40google.com
patch subject: [net-next v1 06/16] netdev: support binding dma-buf to netdevice
config: i386-randconfig-141-20231208 (https://download.01.org/0day-ci/archive/20231208/202312082305.DMh51QVo-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231208/202312082305.DMh51QVo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312082305.DMh51QVo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/dev.c:2072:5: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                     size, avail))
                     ^~~~
   include/asm-generic/bug.h:134:29: note: expanded from macro 'WARN'
                   __WARN_printf(TAINT_WARN, format);                      \
                                             ^~~~~~
   include/asm-generic/bug.h:106:17: note: expanded from macro '__WARN_printf'
                   __warn_printk(arg);                                     \
                                 ^~~
   net/core/dev.c:2072:11: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                     size, avail))
                           ^~~~~
   include/asm-generic/bug.h:134:29: note: expanded from macro 'WARN'
                   __WARN_printf(TAINT_WARN, format);                      \
                                             ^~~~~~
   include/asm-generic/bug.h:106:17: note: expanded from macro '__WARN_printf'
                   __warn_printk(arg);                                     \
                                 ^~~
   net/core/dev.c:4356:1: warning: unused function 'sch_handle_ingress' [-Wunused-function]
   sch_handle_ingress(struct sk_buff *skb, struct packet_type **pt_prev, int *ret,
   ^
   net/core/dev.c:4363:1: warning: unused function 'sch_handle_egress' [-Wunused-function]
   sch_handle_egress(struct sk_buff *skb, int *ret, struct net_device *dev)
   ^
   net/core/dev.c:5573:19: warning: unused function 'nf_ingress' [-Wunused-function]
   static inline int nf_ingress(struct sk_buff *skb, struct packet_type **pt_prev,
                     ^
   5 warnings generated.


vim +2072 net/core/dev.c

  2060	
  2061	void __netdev_dmabuf_binding_free(struct netdev_dmabuf_binding *binding)
  2062	{
  2063		size_t size, avail;
  2064	
  2065		gen_pool_for_each_chunk(binding->chunk_pool,
  2066					netdev_dmabuf_free_chunk_owner, NULL);
  2067	
  2068		size = gen_pool_size(binding->chunk_pool);
  2069		avail = gen_pool_avail(binding->chunk_pool);
  2070	
  2071		if (!WARN(size != avail, "can't destroy genpool. size=%lu, avail=%lu",
> 2072			  size, avail))
  2073			gen_pool_destroy(binding->chunk_pool);
  2074	
  2075		dma_buf_unmap_attachment(binding->attachment, binding->sgt,
  2076					 DMA_BIDIRECTIONAL);
  2077		dma_buf_detach(binding->dmabuf, binding->attachment);
  2078		dma_buf_put(binding->dmabuf);
  2079		xa_destroy(&binding->bound_rxq_list);
  2080		kfree(binding);
  2081	}
  2082	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
