Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B198428E969
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 02:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD6B6EB9C;
	Thu, 15 Oct 2020 00:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABDC6EB9A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 00:13:38 +0000 (UTC)
IronPort-SDR: IlVjC1vAd6u+OdkrklpO28fNmgLDpJrDEQHpwyv/vQZO4OAmW+0RhD7VMx8KxynL6bBamfcI7c
 80V/XScxk+mQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9774"; a="166284012"
X-IronPort-AV: E=Sophos;i="5.77,376,1596524400"; 
 d="gz'50?scan'50,208,50";a="166284012"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2020 17:13:37 -0700
IronPort-SDR: 8GWInOoONFUMn9BadV3NlA5CKFgXCNi6KGvhvGLXbgxiqsTIcrQt4zcOeimN0CFkJk+WDRXU4/
 q2idaRLG1+0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,376,1596524400"; 
 d="gz'50?scan'50,208,50";a="421006096"
Received: from lkp-server01.sh.intel.com (HELO 77f7a688d8fd) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2020 17:13:33 -0700
Received: from kbuild by 77f7a688d8fd with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kSqth-0000Mz-AT; Thu, 15 Oct 2020 00:13:33 +0000
Date: Thu, 15 Oct 2020 08:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jianxin Xiong <jianxin.xiong@intel.com>, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 1/5] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <202010150805.29wT1gPK-lkp@intel.com>
References: <1602692116-106937-1-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline
In-Reply-To: <1602692116-106937-1-git-send-email-jianxin.xiong@intel.com>
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
Cc: kbuild-all@lists.01.org, Leon Romanovsky <leon@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Christian Koenig <christian.koenig@amd.com>,
 clang-built-linux@googlegroups.com, Doug Ledford <dledford@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jianxin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on rdma/for-next]
[also build test WARNING on tegra-drm/drm/tegra/for-next v5.9 next-20201013]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jianxin-Xiong/RDMA-Add-dma-buf-support/20201015-000352
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
config: powerpc-randconfig-r006-20201014 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project e7fe3c6dfede8d5781bd000741c3dea7088307a4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/0day-ci/linux/commit/2990dd070526adeeccee2db6d465b8e1ca33a967
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jianxin-Xiong/RDMA-Add-dma-buf-support/20201015-000352
        git checkout 2990dd070526adeeccee2db6d465b8e1ca33a967
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:43:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insb, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:36:1: note: expanded from here
   __do_insb
   ^
   arch/powerpc/include/asm/io.h:541:56: note: expanded from macro '__do_insb'
   #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/infiniband/core/umem_dmabuf.c:6:
   In file included from include/linux/dma-buf.h:18:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:41:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:542:56: note: expanded from macro '__do_insw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/infiniband/core/umem_dmabuf.c:6:
   In file included from include/linux/dma-buf.h:18:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:46:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:543:56: note: expanded from macro '__do_insl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/infiniband/core/umem_dmabuf.c:6:
   In file included from include/linux/dma-buf.h:18:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:51:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:544:58: note: expanded from macro '__do_outsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/infiniband/core/umem_dmabuf.c:6:
   In file included from include/linux/dma-buf.h:18:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:56:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:545:58: note: expanded from macro '__do_outsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/infiniband/core/umem_dmabuf.c:6:
   In file included from include/linux/dma-buf.h:18:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:61:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:546:58: note: expanded from macro '__do_outsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   drivers/infiniband/core/umem_dmabuf.c:26:5: warning: no previous prototype for function 'ib_umem_dmabuf_map_pages' [-Wmissing-prototypes]
   int ib_umem_dmabuf_map_pages(struct ib_umem *umem, bool first)
       ^
   drivers/infiniband/core/umem_dmabuf.c:26:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int ib_umem_dmabuf_map_pages(struct ib_umem *umem, bool first)
   ^
   static 
>> drivers/infiniband/core/umem_dmabuf.c:138:6: warning: comparison of distinct pointer types ('typeof (addr) *' (aka 'unsigned long *') and 'typeof (size) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
           if (check_add_overflow(addr, size, &end))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:60:15: note: expanded from macro 'check_add_overflow'
           (void) (&__a == &__b);                  \
                   ~~~~ ^  ~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> drivers/infiniband/core/umem_dmabuf.c:138:6: warning: comparison of distinct pointer types ('typeof (addr) *' (aka 'unsigned long *') and 'typeof (size) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
           if (check_add_overflow(addr, size, &end))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:60:15: note: expanded from macro 'check_add_overflow'
           (void) (&__a == &__b);                  \
                   ~~~~ ^  ~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:61: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                               ^~~~
>> drivers/infiniband/core/umem_dmabuf.c:138:6: warning: comparison of distinct pointer types ('typeof (addr) *' (aka 'unsigned long *') and 'typeof (size) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
           if (check_add_overflow(addr, size, &end))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:60:15: note: expanded from macro 'check_add_overflow'
           (void) (&__a == &__b);                  \
                   ~~~~ ^  ~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   drivers/infiniband/core/umem_dmabuf.c:188:6: warning: no previous prototype for function 'ib_umem_dmabuf_release' [-Wmissing-prototypes]
   void ib_umem_dmabuf_release(struct ib_umem *umem)
        ^
   drivers/infiniband/core/umem_dmabuf.c:188:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void ib_umem_dmabuf_release(struct ib_umem *umem)
   ^
   static 
   11 warnings generated.

vim +138 drivers/infiniband/core/umem_dmabuf.c

   126	
   127	struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
   128					   unsigned long addr, size_t size,
   129					   int dmabuf_fd, int access,
   130					   const struct ib_umem_dmabuf_ops *ops)
   131	{
   132		struct dma_buf *dmabuf;
   133		struct ib_umem_dmabuf *umem_dmabuf;
   134		struct ib_umem *umem;
   135		unsigned long end;
   136		long ret;
   137	
 > 138		if (check_add_overflow(addr, size, &end))
   139			return ERR_PTR(-EINVAL);
   140	
   141		if (unlikely(PAGE_ALIGN(end) < PAGE_SIZE))
   142			return ERR_PTR(-EINVAL);
   143	
   144		if (unlikely(!ops || !ops->invalidate || !ops->update))
   145			return ERR_PTR(-EINVAL);
   146	
   147		umem_dmabuf = kzalloc(sizeof(*umem_dmabuf), GFP_KERNEL);
   148		if (!umem_dmabuf)
   149			return ERR_PTR(-ENOMEM);
   150	
   151		umem_dmabuf->ops = ops;
   152		INIT_WORK(&umem_dmabuf->work, ib_umem_dmabuf_work);
   153	
   154		umem = &umem_dmabuf->umem;
   155		umem->ibdev = device;
   156		umem->length = size;
   157		umem->address = addr;
   158		umem->writable = ib_access_writable(access);
   159		umem->is_dmabuf = 1;
   160	
   161		dmabuf = dma_buf_get(dmabuf_fd);
   162		if (IS_ERR(dmabuf)) {
   163			ret = PTR_ERR(dmabuf);
   164			goto out_free_umem;
   165		}
   166	
   167		umem_dmabuf->attach = dma_buf_dynamic_attach(
   168						dmabuf,
   169						device->dma_device,
   170						&ib_umem_dmabuf_attach_ops,
   171						umem_dmabuf);
   172		if (IS_ERR(umem_dmabuf->attach)) {
   173			ret = PTR_ERR(umem_dmabuf->attach);
   174			goto out_release_dmabuf;
   175		}
   176	
   177		return umem;
   178	
   179	out_release_dmabuf:
   180		dma_buf_put(dmabuf);
   181	
   182	out_free_umem:
   183		kfree(umem_dmabuf);
   184		return ERR_PTR(ret);
   185	}
   186	EXPORT_SYMBOL(ib_umem_dmabuf_get);
   187	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--W/nzBZO5zC0uMSeA
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
d5R3Y0uezvwfyUQbozHDAQA=

--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--W/nzBZO5zC0uMSeA--
