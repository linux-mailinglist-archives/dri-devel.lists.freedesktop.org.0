Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D267F4949
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 15:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C3310E653;
	Wed, 22 Nov 2023 14:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C802210E653;
 Wed, 22 Nov 2023 14:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700664546; x=1732200546;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/Ls0NLKTI6uklGgcRnnGSn4U4lHrlsphyjSjjVmva0U=;
 b=fr9SJunxg5aswZv9hhXjW4HH3s/Spz2cN9yqZZ8DSCJmuiL/FPrk3Ybf
 j5/HDLKW/t99PEKEW6430qpx926WE7pKQhdWA/PEbKZ0IjciXQn19VppE
 ulGB+Anj0mSZsblM24G9Ki0lY1YNUVUV07H4YOxLr7GPeSthOeTJl05ps
 azG3GIuxTyydHfGWTOHbL3mN/Y9Y9QocEG+vHARQHVnaoX1rkfM+VZndU
 svbLFmP/jO2mB/bGwqOCRBAwqI5vwhHGb2jSMFa/GuwWAie6jQQcWbzK0
 1lJcgpE2ManoJoe9ZRMRANUyS2SGZBvWd57Ngght8sSOh7sj1FgkU9GkJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="478269625"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="478269625"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:49:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="15284538"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 22 Nov 2023 06:49:04 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r5oXG-0000ZO-0H;
 Wed, 22 Nov 2023 14:49:02 +0000
Date: Wed, 22 Nov 2023 22:48:46 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 2/4] drm/prime: Helper to export dmabuf without fd
Message-ID: <202311221810.IJ6ELH6c-lkp@intel.com>
References: <20231121231114.703478-2-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121231114.703478-2-Felix.Kuehling@amd.com>
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
Cc: christian.koenig@amd.com, Thomas Zimmermann <tzimmermann@suse.de>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Felix,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.7-rc2 next-20231122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Felix-Kuehling/drm-prime-Helper-to-export-dmabuf-without-fd/20231122-071410
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231121231114.703478-2-Felix.Kuehling%40amd.com
patch subject: [PATCH v2 2/4] drm/prime: Helper to export dmabuf without fd
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231122/202311221810.IJ6ELH6c-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311221810.IJ6ELH6c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311221810.IJ6ELH6c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_prime.c:428: warning: Excess function parameter 'dma_buf' description in 'drm_gem_prime_handle_to_dmabuf'


vim +428 drivers/gpu/drm/drm_prime.c

319c933c71f3db Daniel Vetter     2013-08-15  411  
d3977ac8e10a0b Felix Kuehling    2023-11-21  412  /**
f3facd92ee25e0 Felix Kuehling    2023-11-21  413   * drm_gem_prime_handle_to_dmabuf - PRIME export function for GEM drivers
39cc344acd414e Daniel Vetter     2014-01-22  414   * @dev: dev to export the buffer from
39cc344acd414e Daniel Vetter     2014-01-22  415   * @file_priv: drm file-private structure
39cc344acd414e Daniel Vetter     2014-01-22  416   * @handle: buffer handle to export
39cc344acd414e Daniel Vetter     2014-01-22  417   * @flags: flags like DRM_CLOEXEC
f3facd92ee25e0 Felix Kuehling    2023-11-21  418   * @dma_buf: pointer to storage for the dma-buf reference
39cc344acd414e Daniel Vetter     2014-01-22  419   *
39cc344acd414e Daniel Vetter     2014-01-22  420   * This is the PRIME export function which must be used mandatorily by GEM
39cc344acd414e Daniel Vetter     2014-01-22  421   * drivers to ensure correct lifetime management of the underlying GEM object.
39cc344acd414e Daniel Vetter     2014-01-22  422   * The actual exporting from GEM object to a dma-buf is done through the
d693def4fd1c23 Thomas Zimmermann 2020-09-23  423   * &drm_gem_object_funcs.export callback.
39cc344acd414e Daniel Vetter     2014-01-22  424   */
f3facd92ee25e0 Felix Kuehling    2023-11-21  425  struct dma_buf *drm_gem_prime_handle_to_dmabuf(struct drm_device *dev,
f3facd92ee25e0 Felix Kuehling    2023-11-21  426  					       struct drm_file *file_priv,
f3facd92ee25e0 Felix Kuehling    2023-11-21  427  					       uint32_t handle, uint32_t flags)
3248877ea17969 Dave Airlie       2011-11-25 @428  {
3248877ea17969 Dave Airlie       2011-11-25  429  	struct drm_gem_object *obj;
219b47339ced80 Dave Airlie       2013-04-22  430  	int ret = 0;
f3facd92ee25e0 Felix Kuehling    2023-11-21  431  	struct dma_buf *dmabuf = NULL;
3248877ea17969 Dave Airlie       2011-11-25  432  
d0b2c5334f41bd Daniel Vetter     2013-08-15  433  	mutex_lock(&file_priv->prime.lock);
a8ad0bd84f9860 Chris Wilson      2016-05-09  434  	obj = drm_gem_object_lookup(file_priv, handle);
d0b2c5334f41bd Daniel Vetter     2013-08-15  435  	if (!obj)  {
d0b2c5334f41bd Daniel Vetter     2013-08-15  436  		ret = -ENOENT;
d0b2c5334f41bd Daniel Vetter     2013-08-15  437  		goto out_unlock;
d0b2c5334f41bd Daniel Vetter     2013-08-15  438  	}
d0b2c5334f41bd Daniel Vetter     2013-08-15  439  
d0b2c5334f41bd Daniel Vetter     2013-08-15  440  	dmabuf = drm_prime_lookup_buf_by_handle(&file_priv->prime, handle);
d0b2c5334f41bd Daniel Vetter     2013-08-15  441  	if (dmabuf) {
d0b2c5334f41bd Daniel Vetter     2013-08-15  442  		get_dma_buf(dmabuf);
f3facd92ee25e0 Felix Kuehling    2023-11-21  443  		goto out;
d0b2c5334f41bd Daniel Vetter     2013-08-15  444  	}
3248877ea17969 Dave Airlie       2011-11-25  445  
d0b2c5334f41bd Daniel Vetter     2013-08-15  446  	mutex_lock(&dev->object_name_lock);
3248877ea17969 Dave Airlie       2011-11-25  447  	/* re-export the original imported object */
3248877ea17969 Dave Airlie       2011-11-25  448  	if (obj->import_attach) {
219b47339ced80 Dave Airlie       2013-04-22  449  		dmabuf = obj->import_attach->dmabuf;
319c933c71f3db Daniel Vetter     2013-08-15  450  		get_dma_buf(dmabuf);
219b47339ced80 Dave Airlie       2013-04-22  451  		goto out_have_obj;
3248877ea17969 Dave Airlie       2011-11-25  452  	}
3248877ea17969 Dave Airlie       2011-11-25  453  
319c933c71f3db Daniel Vetter     2013-08-15  454  	if (obj->dma_buf) {
319c933c71f3db Daniel Vetter     2013-08-15  455  		get_dma_buf(obj->dma_buf);
319c933c71f3db Daniel Vetter     2013-08-15  456  		dmabuf = obj->dma_buf;
219b47339ced80 Dave Airlie       2013-04-22  457  		goto out_have_obj;
219b47339ced80 Dave Airlie       2013-04-22  458  	}
219b47339ced80 Dave Airlie       2013-04-22  459  
319c933c71f3db Daniel Vetter     2013-08-15  460  	dmabuf = export_and_register_object(dev, obj, flags);
4332bf438bbbc3 Daniel Vetter     2013-08-15  461  	if (IS_ERR(dmabuf)) {
3248877ea17969 Dave Airlie       2011-11-25  462  		/* normally the created dma-buf takes ownership of the ref,
3248877ea17969 Dave Airlie       2011-11-25  463  		 * but if that fails then drop the ref
3248877ea17969 Dave Airlie       2011-11-25  464  		 */
4332bf438bbbc3 Daniel Vetter     2013-08-15  465  		ret = PTR_ERR(dmabuf);
d0b2c5334f41bd Daniel Vetter     2013-08-15  466  		mutex_unlock(&dev->object_name_lock);
219b47339ced80 Dave Airlie       2013-04-22  467  		goto out;
3248877ea17969 Dave Airlie       2011-11-25  468  	}
219b47339ced80 Dave Airlie       2013-04-22  469  
d0b2c5334f41bd Daniel Vetter     2013-08-15  470  out_have_obj:
d0b2c5334f41bd Daniel Vetter     2013-08-15  471  	/*
d0b2c5334f41bd Daniel Vetter     2013-08-15  472  	 * If we've exported this buffer then cheat and add it to the import list
d0b2c5334f41bd Daniel Vetter     2013-08-15  473  	 * so we get the correct handle back. We must do this under the
d0b2c5334f41bd Daniel Vetter     2013-08-15  474  	 * protection of dev->object_name_lock to ensure that a racing gem close
d0b2c5334f41bd Daniel Vetter     2013-08-15  475  	 * ioctl doesn't miss to remove this buffer handle from the cache.
0ff926c7d4f06f Dave Airlie       2012-05-20  476  	 */
219b47339ced80 Dave Airlie       2013-04-22  477  	ret = drm_prime_add_buf_handle(&file_priv->prime,
319c933c71f3db Daniel Vetter     2013-08-15  478  				       dmabuf, handle);
d0b2c5334f41bd Daniel Vetter     2013-08-15  479  	mutex_unlock(&dev->object_name_lock);
219b47339ced80 Dave Airlie       2013-04-22  480  	if (ret)
4332bf438bbbc3 Daniel Vetter     2013-08-15  481  		dma_buf_put(dmabuf);
219b47339ced80 Dave Airlie       2013-04-22  482  out:
be6ee102341bc4 Emil Velikov      2020-05-15  483  	drm_gem_object_put(obj);
d0b2c5334f41bd Daniel Vetter     2013-08-15  484  out_unlock:
d0b2c5334f41bd Daniel Vetter     2013-08-15  485  	mutex_unlock(&file_priv->prime.lock);
d0b2c5334f41bd Daniel Vetter     2013-08-15  486  
f3facd92ee25e0 Felix Kuehling    2023-11-21  487  	return ret ? ERR_PTR(ret) : dmabuf;
b283e92a2315f9 Daniel Vetter     2019-06-18  488  }
f3facd92ee25e0 Felix Kuehling    2023-11-21  489  EXPORT_SYMBOL(drm_gem_prime_handle_to_dmabuf);
b283e92a2315f9 Daniel Vetter     2019-06-18  490  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
