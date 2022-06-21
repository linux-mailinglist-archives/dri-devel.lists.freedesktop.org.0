Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29632552C2C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 09:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B12311244C;
	Tue, 21 Jun 2022 07:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0423511244C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 07:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655797091; x=1687333091;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FgU26SCL1f3P/2iJJL8VP95qp5dhxxdGWAbnrjurC3Y=;
 b=fSYtpyydDaYZL6+KaDHOb1KsCqHW+9WJ0eU31hThJSVm3dwRcqGFVDXD
 kVoBX0nCOEhu8pazqGzXf+QHKEz6XpG7CAEWfk8wSBUPR3kXG/Jl9pXRp
 pd7R0T4/IYalKElpEtNsxB8DxxvHcTDOpIXO1D+rsZg509ZtUEs6eEbpq
 Xol35f6dvgBd54eTxxbDdIr3qcyu404u7/TNdZ6MCyK6ci00ulUHvKLdt
 UujO+AeXhWBOP1KT8YmkHJfBWmVJdy7X5v9WYd7B5VVH1sCsFDASM8fLE
 c5W1IDNbMfxgaRKddNtudOl5HTo0B4nEYXqZWgfmPTOs5F9bzxPiseJ6C g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="277601796"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="277601796"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 00:38:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="676882291"
Received: from lkp-server01.sh.intel.com (HELO e0735e231192) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Jun 2022 00:38:08 -0700
Received: from kbuild by e0735e231192 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o3YSd-00002H-PU;
 Tue, 21 Jun 2022 07:38:07 +0000
Date: Tue, 21 Jun 2022 15:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/1] drm/panfrost: Add support for devcoredump
Message-ID: <202206211507.zzo0qSdL-lkp@intel.com>
References: <20220621023204.94179-2-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220621023204.94179-2-adrian.larumbe@collabora.com>
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

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on linus/master v5.19-rc3 next-20220620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Adri-n-Larumbe/devcoredump-support-for-Panfrost-GPU-driver/20220621-103431
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: s390-buildonly-randconfig-r006-20220620 (https://download.01.org/0day-ci/archive/20220621/202206211507.zzo0qSdL-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/297bd4948ab1f4eeb78389d57adc1edc819cb6f2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Adri-n-Larumbe/devcoredump-support-for-Panfrost-GPU-driver/20220621-103431
        git checkout 297bd4948ab1f4eeb78389d57adc1edc819cb6f2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/gpu/drm/panfrost/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

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
>> drivers/gpu/drm/panfrost/panfrost_dump.c:115:15: error: no member named 'file_priv' in 'struct panfrost_job'
           as_nr = job->file_priv->mmu->as;
                   ~~~  ^
>> drivers/gpu/drm/panfrost/panfrost_dump.c:225:27: warning: implicit conversion from '__le64' (aka 'unsigned long long') to '__le32' (aka 'unsigned int') changes value from 72057594037927936 to 0 [-Wconstant-conversion]
                   iter.hdr->bomap.valid = cpu_to_le64(1);
                                         ~ ^~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:86:21: note: expanded from macro 'cpu_to_le64'
   #define cpu_to_le64 __cpu_to_le64
                       ^
   include/uapi/linux/byteorder/big_endian.h:32:27: note: expanded from macro '__cpu_to_le64'
   #define __cpu_to_le64(x) ((__force __le64)__swab64((x)))
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   13 warnings and 1 error generated.


vim +115 drivers/gpu/drm/panfrost/panfrost_dump.c

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
 > 115		as_nr = job->file_priv->mmu->as;
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
   132			dbo = job->bos[i];
   133			file_size += dbo->size;
   134			n_bomap_pages += dbo->size >> PAGE_SHIFT;
   135			n_obj++;
   136		}
   137	
   138		/* If we have any buffer objects, add a bomap object */
   139		if (n_bomap_pages) {
   140			file_size += n_bomap_pages * sizeof(*bomap);
   141			n_obj++;
   142		}
   143	
   144		/* Add the size of the headers */
   145		file_size += sizeof(*iter.hdr) * n_obj;
   146	
   147		/* Allocate the file in vmalloc memory, it's likely to be big */
   148		iter.start = __vmalloc(file_size, GFP_KERNEL | __GFP_NOWARN |
   149				__GFP_NORETRY);
   150		if (!iter.start) {
   151			dev_warn(pfdev->dev, "failed to allocate devcoredump file\n");
   152			return;
   153		}
   154	
   155		/* Point the data member after the headers */
   156		iter.hdr = iter.start;
   157		iter.data = &iter.hdr[n_obj];
   158	
   159		memset(iter.hdr, 0, iter.data - iter.start);
   160	
   161		/*
   162		 * For now, we write the job identifier in the register dump header,
   163		 * so that we can decode the entire dump later with pandecode
   164		 */
   165		iter.hdr->reghdr.jc = cpu_to_le64(job->jc);
   166		iter.hdr->reghdr.version = cpu_to_le32(PANFROSTDUMP_VERSION_1);
   167		iter.hdr->reghdr.gpu_id = cpu_to_le32(pfdev->features.id);
   168		iter.hdr->reghdr.nbos = cpu_to_le64(job->bo_count);
   169	
   170		panfrost_core_dump_registers(&iter, pfdev, as_nr, slot);
   171	
   172		/* Reserve space for the bomap */
   173		if (job->bo_count) {
   174			bomap_start = bomap = iter.data;
   175			memset(bomap, 0, sizeof(*bomap) * n_bomap_pages);
   176			panfrost_core_dump_header(&iter, PANFROSTDUMP_BUF_BOMAP,
   177						  bomap + n_bomap_pages);
   178		}
   179	
   180		for (i = 0; i < job->bo_count; i++) {
   181			struct iosys_map map;
   182			struct panfrost_gem_mapping *mapping;
   183			struct panfrost_gem_object *bo;
   184			struct sg_page_iter page_iter;
   185			void *vaddr;
   186	
   187			bo = to_panfrost_bo(job->bos[i]);
   188			mapping = job->mappings[i];
   189	
   190			if (!bo->base.sgt) {
   191				dev_err(pfdev->dev, "Panfrost Dump: BO has no sgt, cannot dump\n");
   192				iter.hdr->bomap.valid = 0;
   193				goto dump_header;
   194			}
   195	
   196			ret = drm_gem_shmem_vmap(&bo->base, &map);
   197			if (ret) {
   198				dev_err(pfdev->dev, "Panfrost Dump: couldn't map Buffer Object\n");
   199				iter.hdr->bomap.valid = 0;
   200				goto dump_header;
   201			}
   202	
   203			WARN_ON(!mapping->active);
   204	
   205			iter.hdr->bomap.data[0] = cpu_to_le32((bomap - bomap_start));
   206	
   207			for_each_sgtable_page(bo->base.sgt, &page_iter, 0) {
   208				struct page *page = sg_page_iter_page(&page_iter);
   209	
   210				if (!IS_ERR(page))
   211					*bomap++ = cpu_to_le64(page_to_phys(page));
   212				else {
   213					dev_err(pfdev->dev, "Panfrost Dump: wrong page\n");
   214					*bomap++ = ~cpu_to_le64(0);
   215				}
   216			}
   217	
   218			iter.hdr->bomap.iova = cpu_to_le64(mapping->mmnode.start << PAGE_SHIFT);
   219	
   220			vaddr = map.vaddr;
   221			memcpy(iter.data, vaddr, bo->base.base.size);
   222	
   223			drm_gem_shmem_vunmap(&bo->base, &map);
   224	
 > 225			iter.hdr->bomap.valid = cpu_to_le64(1);
   226	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
