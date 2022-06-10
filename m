Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B948D54597B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 03:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A9C10FB2E;
	Fri, 10 Jun 2022 01:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8115D10F899
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 01:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654823648; x=1686359648;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UVP53kaNbvxJzSd7CqEzwJGC7f1g+YOsg4Hk+3kl62c=;
 b=ZdG3xi3aFSoeD/6eNpZuAETDs3JZFI1lOWHjSIhWJFdqYIAtQ/fXiL0C
 TxSydnngFxW/td9a7iQZo9oJWeXth1+O2UMr3aHpbspRimOqZabk6VxC4
 SKjDM9GHeFZZHffsuEE+8uSL/Cn+Zh3v1RQtCMWJf9wDWMMtIXkw7Cg+i
 4pEI4SmZJgPgSuPeL3xdGE1Q9YUarTDvrtOWx6mWW77pF4QOhwaQqQrYz
 CL9shOoFZFsKU1wJd717nWodyBzvDjzyuwOCBPsivk/LMcaX0JVSScVsY
 gWLfIpaGMRcBUlhbSXcwyvUsJwQMhxlQ5bMg3eavr3wALmNht75ODl0f2 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278615754"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="278615754"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 18:13:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="556156033"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 09 Jun 2022 18:13:55 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nzTDm-000GYR-MG;
 Fri, 10 Jun 2022 01:13:54 +0000
Date: Fri, 10 Jun 2022 09:13:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] dma-buf: Add an API for exporting sync files (v14)
Message-ID: <202206100914.FWjiKmaa-lkp@intel.com>
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

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tegra-drm/drm/tegra/for-next]
[cannot apply to drm-tip/drm-tip linus/master v5.19-rc1 next-20220609]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Ekstrand/dma-buf-Add-an-API-for-exporting-sync-files-v15/20220608-232447
base:   git://anongit.freedesktop.org/tegra/linux.git drm/tegra/for-next
config: i386-randconfig-a014 (https://download.01.org/0day-ci/archive/20220610/202206100914.FWjiKmaa-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/d9d427e1ab310adae7e076f2531d00862d74a120
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jason-Ekstrand/dma-buf-Add-an-API-for-exporting-sync-files-v15/20220608-232447
        git checkout d9d427e1ab310adae7e076f2531d00862d74a120
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/dma-buf/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/dma-buf/dma-buf.c: In function 'dma_buf_export_sync_file':
   drivers/dma-buf/dma-buf.c:337:29: error: storage size of 'usage' isn't known
     337 |         enum dma_resv_usage usage;
         |                             ^~~~~
   drivers/dma-buf/dma-buf.c:355:17: error: implicit declaration of function 'dma_resv_usage_rw' [-Werror=implicit-function-declaration]
     355 |         usage = dma_resv_usage_rw(arg.flags & DMA_BUF_SYNC_WRITE);
         |                 ^~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-buf.c:356:15: error: implicit declaration of function 'dma_resv_get_singleton'; did you mean 'dma_resv_test_signaled'? [-Werror=implicit-function-declaration]
     356 |         ret = dma_resv_get_singleton(dmabuf->resv, usage, &fence);
         |               ^~~~~~~~~~~~~~~~~~~~~~
         |               dma_resv_test_signaled
>> drivers/dma-buf/dma-buf.c:337:29: warning: unused variable 'usage' [-Wunused-variable]
     337 |         enum dma_resv_usage usage;
         |                             ^~~~~
   cc1: some warnings being treated as errors


vim +/usage +337 drivers/dma-buf/dma-buf.c

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
   355		usage = dma_resv_usage_rw(arg.flags & DMA_BUF_SYNC_WRITE);
   356		ret = dma_resv_get_singleton(dmabuf->resv, usage, &fence);
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
