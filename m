Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F4F554A05
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 14:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE808113350;
	Wed, 22 Jun 2022 12:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD09113350
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 12:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655901049; x=1687437049;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=U0GHTG1wygWsndSDZ6EiTgSxO7v50b9808TbFEW0jf4=;
 b=d0V5EQ5bV410IS9nNEBCY7zcBSRZm/gcgpSRCYPOYCVf5h8IDlhanwEL
 ll281ejYfXtmkzoiZSEwvtUjTjsqBJMGkRngp/j6Kw+xocHqbEohOi0Cs
 TyFvjPQg53R091eePMe3dH0Mivj/QTIsPRwSi35P/VcZNPbtlXvtKmzc4
 Fx5le0JTux1bR97kwhJIAccwmcG1D0LMhLD9xoolbZRXrxJc4royF/0Pd
 scTLTigPP84fM55KPdx43FaDF4IiOUgb9MOk9aHUZRkAEa4oGfq0Ova0v
 z+/f8Ll4d1DrLPkHvdnov1h7uoaLnFu5eqPh7UQDLnzDnm0DqW4in7zBA Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="281132985"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="281132985"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 05:30:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="620893634"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 22 Jun 2022 05:30:46 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o3zVO-0001GN-6Q;
 Wed, 22 Jun 2022 12:30:46 +0000
Date: Wed, 22 Jun 2022 20:29:48 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/1] drm/panfrost: Add support for devcoredump
Message-ID: <202206222000.JafXnPo9-lkp@intel.com>
References: <20220622015420.1130814-2-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220622015420.1130814-2-adrian.larumbe@collabora.com>
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
Cc: adrian.larumbe@collabora.com, llvm@lists.linux.dev, kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi "Adrián,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on linus/master v5.19-rc3 next-20220622]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Adri-n-Larumbe/devcoredump-support-for-Panfrost-GPU-driver/20220622-095645
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: s390-buildonly-randconfig-r004-20220622 (https://download.01.org/0day-ci/archive/20220622/202206222000.JafXnPo9-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8b8d126598ce7bd5243da7f94f69fa1104288bee)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/966f660f30dc5a9ff854e61d189b81e92f3453fa
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Adri-n-Larumbe/devcoredump-support-for-Panfrost-GPU-driver/20220622-095645
        git checkout 966f660f30dc5a9ff854e61d189b81e92f3453fa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/gpu/drm/amd/display/dc/ drivers/gpu/drm/panfrost/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/panfrost/panfrost_dump.c:6:
   In file included from include/linux/devcoredump.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/gpu/drm/panfrost/panfrost_dump.c:6:
   In file included from include/linux/devcoredump.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/gpu/drm/panfrost/panfrost_dump.c:6:
   In file included from include/linux/devcoredump.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/gpu/drm/panfrost/panfrost_dump.c:235:27: warning: implicit conversion from '__le64' (aka 'unsigned long long') to '__le32' (aka 'unsigned int') changes value from 72057594037927936 to 0 [-Wconstant-conversion]
                   iter.hdr->bomap.valid = cpu_to_le64(1);
                                         ~ ^~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:86:21: note: expanded from macro 'cpu_to_le64'
   #define cpu_to_le64 __cpu_to_le64
                       ^
   include/uapi/linux/byteorder/big_endian.h:32:27: note: expanded from macro '__cpu_to_le64'
   #define __cpu_to_le64(x) ((__force __le64)__swab64((x)))
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   13 warnings generated.


vim +235 drivers/gpu/drm/panfrost/panfrost_dump.c

   102	
   103	void panfrost_core_dump(struct panfrost_job *job)
   104	{
   105		struct panfrost_device *pfdev = job->pfdev;
   106		struct panfrost_dump_iterator iter;
   107		struct drm_gem_object *dbo;
   108		unsigned int n_obj, n_bomap_pages;
   109		__le64 *bomap, *bomap_start;
   110		size_t file_size;
   111		u32 as_nr;
   112		int slot;
   113		int ret, i;
   114	
   115		as_nr = job->mmu->as;
   116		slot = panfrost_job_get_slot(job);
   117		slot = slot ? slot : 0;
   118	
   119		/* Only catch the first event, or when manually re-armed */
   120		if (!panfrost_dump_core)
   121			return;
   122		panfrost_dump_core = false;
   123	
   124		/* At least, we dump registers and end marker */
   125		n_obj = 2;
   126		n_bomap_pages = 0;
   127		file_size = ARRAY_SIZE(panfrost_dump_registers) *
   128				sizeof(struct panfrost_dump_registers);
   129	
   130		/* Add in the active buffer objects */
   131		for (i = 0; i < job->bo_count; i++) {
   132			/*
   133			 * Even though the CPU could be configured to use 16K or 64K pages, this
   134			 * is a very unusual situation for most kernel setups on SoCs that have
   135			 * a Panfrost device. Also many places across the driver make the somewhat
   136			 * arbitrary assumption that Panfrost's MMU page size is the same as the CPU's,
   137			 * so let's have a sanity check to ensure that's always the case
   138			 */
   139			WARN_ON(!IS_ALIGNED(dbo->size, PAGE_SIZE));
   140	
   141			dbo = job->bos[i];
   142			file_size += dbo->size;
   143			n_bomap_pages += dbo->size >> PAGE_SHIFT;
   144			n_obj++;
   145		}
   146	
   147		/* If we have any buffer objects, add a bomap object */
   148		if (n_bomap_pages) {
   149			file_size += n_bomap_pages * sizeof(*bomap);
   150			n_obj++;
   151		}
   152	
   153		/* Add the size of the headers */
   154		file_size += sizeof(*iter.hdr) * n_obj;
   155	
   156		/* Allocate the file in vmalloc memory, it's likely to be big */
   157		iter.start = __vmalloc(file_size, GFP_KERNEL | __GFP_NOWARN |
   158				__GFP_NORETRY);
   159		if (!iter.start) {
   160			dev_warn(pfdev->dev, "failed to allocate devcoredump file\n");
   161			return;
   162		}
   163	
   164		/* Point the data member after the headers */
   165		iter.hdr = iter.start;
   166		iter.data = &iter.hdr[n_obj];
   167	
   168		memset(iter.hdr, 0, iter.data - iter.start);
   169	
   170		/*
   171		 * For now, we write the job identifier in the register dump header,
   172		 * so that we can decode the entire dump later with pandecode
   173		 */
   174		iter.hdr->reghdr.jc = cpu_to_le64(job->jc);
   175		iter.hdr->reghdr.major = cpu_to_le32(PANFROSTDUMP_MAJOR);
   176		iter.hdr->reghdr.minor = cpu_to_le32(PANFROSTDUMP_MINOR);
   177		iter.hdr->reghdr.gpu_id = cpu_to_le32(pfdev->features.id);
   178		iter.hdr->reghdr.nbos = cpu_to_le64(job->bo_count);
   179	
   180		panfrost_core_dump_registers(&iter, pfdev, as_nr, slot);
   181	
   182		/* Reserve space for the bomap */
   183		if (job->bo_count) {
   184			bomap_start = bomap = iter.data;
   185			memset(bomap, 0, sizeof(*bomap) * n_bomap_pages);
   186			panfrost_core_dump_header(&iter, PANFROSTDUMP_BUF_BOMAP,
   187						  bomap + n_bomap_pages);
   188		}
   189	
   190		for (i = 0; i < job->bo_count; i++) {
   191			struct iosys_map map;
   192			struct panfrost_gem_mapping *mapping;
   193			struct panfrost_gem_object *bo;
   194			struct sg_page_iter page_iter;
   195			void *vaddr;
   196	
   197			bo = to_panfrost_bo(job->bos[i]);
   198			mapping = job->mappings[i];
   199	
   200			if (!bo->base.sgt) {
   201				dev_err(pfdev->dev, "Panfrost Dump: BO has no sgt, cannot dump\n");
   202				iter.hdr->bomap.valid = 0;
   203				goto dump_header;
   204			}
   205	
   206			ret = drm_gem_shmem_vmap(&bo->base, &map);
   207			if (ret) {
   208				dev_err(pfdev->dev, "Panfrost Dump: couldn't map Buffer Object\n");
   209				iter.hdr->bomap.valid = 0;
   210				goto dump_header;
   211			}
   212	
   213			WARN_ON(!mapping->active);
   214	
   215			iter.hdr->bomap.data[0] = cpu_to_le32((bomap - bomap_start));
   216	
   217			for_each_sgtable_page(bo->base.sgt, &page_iter, 0) {
   218				struct page *page = sg_page_iter_page(&page_iter);
   219	
   220				if (!IS_ERR(page))
   221					*bomap++ = cpu_to_le64(page_to_phys(page));
   222				else {
   223					dev_err(pfdev->dev, "Panfrost Dump: wrong page\n");
   224					*bomap++ = ~cpu_to_le64(0);
   225				}
   226			}
   227	
   228			iter.hdr->bomap.iova = cpu_to_le64(mapping->mmnode.start << PAGE_SHIFT);
   229	
   230			vaddr = map.vaddr;
   231			memcpy(iter.data, vaddr, bo->base.base.size);
   232	
   233			drm_gem_shmem_vunmap(&bo->base, &map);
   234	
 > 235			iter.hdr->bomap.valid = cpu_to_le64(1);
   236	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
