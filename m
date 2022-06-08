Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A93DF543FE3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 01:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BBD10E4C9;
	Wed,  8 Jun 2022 23:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0302510E4C9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 23:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654731249; x=1686267249;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tPLGsaLkW8G7F36aMfRilVnnmTW+C/PCwAh04FJnJqY=;
 b=BgtonDPUyBEjwFh7aJciHvDbD0oIA/1E6QlJLqID3ZOiaAkoiONN0KYN
 yWAVlS0B9MbWxQmlwP5Ta41rUwPCIdbewcEmrlSqFXDJzTJaITtJdPRDJ
 iwmOsVUg1ZX7F99jskziFhuSmHyYWMBycshvrXAzFpSzSqE9Kc3DC/Cvp
 ZyrdNWYUNlFEqoaZK4Qg2uElo/iHC1Ox1r783Wcv6Ct6PL7bfX30zNF/u
 UWZdh+c75hSl8aQvyjOb3m8O1ARaesBe/pDDKjZDpCkJyAxBsjb3Yq210
 tvwgTyArRM9eYNKd8KvbQrEikdIdYIbnUmNMH0TNeFsM+kImbcwfcP7IM w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="338860066"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="338860066"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 16:34:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="566131274"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 08 Jun 2022 16:34:07 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nz5Be-000FET-PZ;
 Wed, 08 Jun 2022 23:34:06 +0000
Date: Thu, 9 Jun 2022 07:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] dma-buf: Add an API for exporting sync files (v14)
Message-ID: <202206090724.2BjpdEjC-lkp@intel.com>
References: <20220608152142.14495-2-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608152142.14495-2-jason@jlekstrand.net>
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
Cc: Jason Ekstrand <jason.ekstrand@collabora.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 kbuild-all@lists.01.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tegra-drm/drm/tegra/for-next]
[cannot apply to drm-tip/drm-tip linus/master v5.19-rc1 next-20220608]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Ekstrand/dma-buf-Add-an-API-for-exporting-sync-files-v15/20220608-232447
base:   git://anongit.freedesktop.org/tegra/linux.git drm/tegra/for-next
config: arc-randconfig-r043-20220608 (https://download.01.org/0day-ci/archive/20220609/202206090724.2BjpdEjC-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d9d427e1ab310adae7e076f2531d00862d74a120
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jason-Ekstrand/dma-buf-Add-an-API-for-exporting-sync-files-v15/20220608-232447
        git checkout d9d427e1ab310adae7e076f2531d00862d74a120
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/dma-buf/dma-buf.c: In function 'dma_buf_export_sync_file':
>> drivers/dma-buf/dma-buf.c:337:29: error: storage size of 'usage' isn't known
     337 |         enum dma_resv_usage usage;
         |                             ^~~~~
>> drivers/dma-buf/dma-buf.c:355:17: error: implicit declaration of function 'dma_resv_usage_rw' [-Werror=implicit-function-declaration]
     355 |         usage = dma_resv_usage_rw(arg.flags & DMA_BUF_SYNC_WRITE);
         |                 ^~~~~~~~~~~~~~~~~
>> drivers/dma-buf/dma-buf.c:356:15: error: implicit declaration of function 'dma_resv_get_singleton'; did you mean 'dma_resv_test_signaled'? [-Werror=implicit-function-declaration]
     356 |         ret = dma_resv_get_singleton(dmabuf->resv, usage, &fence);
         |               ^~~~~~~~~~~~~~~~~~~~~~
         |               dma_resv_test_signaled
   drivers/dma-buf/dma-buf.c:337:29: warning: unused variable 'usage' [-Wunused-variable]
     337 |         enum dma_resv_usage usage;
         |                             ^~~~~
   cc1: some warnings being treated as errors


vim +337 drivers/dma-buf/dma-buf.c

   331	
   332	#if IS_ENABLED(CONFIG_SYNC_FILE)
   333	static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
   334					     void __user *user_data)
   335	{
   336		struct dma_buf_export_sync_file arg;
 > 337		enum dma_resv_usage usage;
   338		struct dma_fence *fence = NULL;
   339		struct sync_file *sync_file;
   340		int fd, ret;
   341	
   342		if (copy_from_user(&arg, user_data, sizeof(arg)))
   343			return -EFAULT;
   344	
   345		if (arg.flags & ~DMA_BUF_SYNC_RW)
   346			return -EINVAL;
   347	
   348		if ((arg.flags & DMA_BUF_SYNC_RW) == 0)
   349			return -EINVAL;
   350	
   351		fd = get_unused_fd_flags(O_CLOEXEC);
   352		if (fd < 0)
   353			return fd;
   354	
 > 355		usage = dma_resv_usage_rw(arg.flags & DMA_BUF_SYNC_WRITE);
 > 356		ret = dma_resv_get_singleton(dmabuf->resv, usage, &fence);
   357		if (ret)
   358			goto err_put_fd;
   359	
   360		if (!fence)
   361			fence = dma_fence_get_stub();
   362	
   363		sync_file = sync_file_create(fence);
   364	
   365		dma_fence_put(fence);
   366	
   367		if (!sync_file) {
   368			ret = -ENOMEM;
   369			goto err_put_fd;
   370		}
   371	
   372		arg.fd = fd;
   373		if (copy_to_user(user_data, &arg, sizeof(arg))) {
   374			ret = -EFAULT;
   375			goto err_put_file;
   376		}
   377	
   378		fd_install(fd, sync_file->file);
   379	
   380		return 0;
   381	
   382	err_put_file:
   383		fput(sync_file->file);
   384	err_put_fd:
   385		put_unused_fd(fd);
   386		return ret;
   387	}
   388	#endif
   389	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
