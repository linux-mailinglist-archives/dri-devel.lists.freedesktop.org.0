Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56551481D2F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 15:40:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F6110EBDC;
	Thu, 30 Dec 2021 14:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B617F10EBDC
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 14:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640875209; x=1672411209;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jE8oktcI98BKSfCi8l/nVuRfrYM3QUTfhPiQURuFMZs=;
 b=MfZc17RcrBSdbh0s4UNlp3gHqlPE3jwLAtiLirI3whj4IZkOdhWI9iux
 js72n3ANz3c/orJ/Osu4dCuyKQ7GY8XT7MjyCTcvVVi48G8xtqhru4doT
 L3CLojcEkT+/WeZ1K3+lX7UT5aaJTRDEWoIU500ZnShh5l5S0EvcC5cx1
 TdOR7LHo3B34PjMjHYcotM9A7lGS6gLIbOJfhy521IVTyIXGZ4ZvXqvhP
 Nv0Aa0SrToeRTUWy4L8xRqpOSPCmOnYiYoGcYSGHN5l7emk7BGrFMjcIB
 6/MApSDwyTVCYTJ5FaazW9HInfcTCY6fgYQZPGPaAPO0G9aUdkV5i5/8H Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10212"; a="239229078"
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600"; d="scan'208";a="239229078"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 06:32:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600"; d="scan'208";a="470674625"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 30 Dec 2021 06:32:06 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n2wTN-000AGM-Bd; Thu, 30 Dec 2021 14:32:05 +0000
Date: Thu, 30 Dec 2021 22:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: Claudio Suarez <cssk@net-c.es>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: get rid of DRM_DEBUG_* log calls in drm core, files
 drm_{b,c}*.c
Message-ID: <202112302236.ikd2ET5w-lkp@intel.com>
References: <Yc2Pd/DhQ7EpD+hD@gineta.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yc2Pd/DhQ7EpD+hD@gineta.localdomain>
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
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Claudio,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip v5.16-rc7 next-20211224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Claudio-Suarez/drm-get-rid-of-DRM_DEBUG_-log-calls-in-drm-core-files-drm_-b-c-c/20211230-185446
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: hexagon-randconfig-r041-20211230 (https://download.01.org/0day-ci/archive/20211230/202112302236.ikd2ET5w-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project cd284b7ac0615afc6e0f1a30da2777e361de27a3)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/9cfa12f89e858cd6d2eb5eb17c6db7ab689343e3
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Claudio-Suarez/drm-get-rid-of-DRM_DEBUG_-log-calls-in-drm-core-files-drm_-b-c-c/20211230-185446
        git checkout 9cfa12f89e858cd6d2eb5eb17c6db7ab689343e3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_bufs.c:174:14: error: incompatible pointer types passing 'struct drm_device *' to parameter of type 'const struct device *' [-Werror,-Wincompatible-pointer-types]
           drm_dev_dbg(dev, "offset = 0x%08llx, size = 0x%08lx, type = %d\n",
                       ^~~
   include/drm/drm_print.h:337:39: note: passing argument to parameter 'dev' here
   void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
                                         ^
>> drivers/gpu/drm/drm_bufs.c:174:19: warning: incompatible pointer to integer conversion passing 'char[46]' to parameter of type 'enum drm_debug_category' [-Wint-conversion]
           drm_dev_dbg(dev, "offset = 0x%08llx, size = 0x%08lx, type = %d\n",
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:337:68: note: passing argument to parameter 'category' here
   void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
                                                                      ^
>> drivers/gpu/drm/drm_bufs.c:175:7: warning: incompatible integer to pointer conversion passing 'unsigned long long' to parameter of type 'const char *' [-Wint-conversion]
                       (unsigned long long)map->offset, map->size, map->type);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:338:16: note: passing argument to parameter 'format' here
                    const char *format, ...);
                                ^
   drivers/gpu/drm/drm_bufs.c:208:17: error: incompatible pointer types passing 'struct drm_device *' to parameter of type 'const struct device *' [-Werror,-Wincompatible-pointer-types]
                                   drm_dev_dbg(dev,
                                               ^~~
   include/drm/drm_print.h:337:39: note: passing argument to parameter 'dev' here
   void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
                                         ^
   drivers/gpu/drm/drm_bufs.c:209:10: warning: incompatible pointer to integer conversion passing 'char[62]' to parameter of type 'enum drm_debug_category' [-Wint-conversion]
                                               "Matching maps of type %d with mismatched sizes, (%ld vs %ld)\n",
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:337:68: note: passing argument to parameter 'category' here
   void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
                                                                      ^
>> drivers/gpu/drm/drm_bufs.c:210:10: warning: incompatible integer to pointer conversion passing 'enum drm_map_type' to parameter of type 'const char *' [-Wint-conversion]
                                               map->type, map->size, list->map->size);
                                               ^~~~~~~~~
   include/drm/drm_print.h:338:16: note: passing argument to parameter 'format' here
                    const char *format, ...);
                                ^
   drivers/gpu/drm/drm_bufs.c:241:17: error: incompatible pointer types passing 'struct drm_device *' to parameter of type 'const struct device *' [-Werror,-Wincompatible-pointer-types]
                                   drm_dev_dbg(dev,
                                               ^~~
   include/drm/drm_print.h:337:39: note: passing argument to parameter 'dev' here
   void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
                                         ^
   drivers/gpu/drm/drm_bufs.c:242:10: warning: incompatible pointer to integer conversion passing 'char[62]' to parameter of type 'enum drm_debug_category' [-Wint-conversion]
                                               "Matching maps of type %d with mismatched sizes, (%ld vs %ld)\n",
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:337:68: note: passing argument to parameter 'category' here
   void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
                                                                      ^
   drivers/gpu/drm/drm_bufs.c:243:10: warning: incompatible integer to pointer conversion passing 'enum drm_map_type' to parameter of type 'const char *' [-Wint-conversion]
                                               map->type, map->size, list->map->size);
                                               ^~~~~~~~~
   include/drm/drm_print.h:338:16: note: passing argument to parameter 'format' here
                    const char *format, ...);
                                ^
   drivers/gpu/drm/drm_bufs.c:252:15: error: incompatible pointer types passing 'struct drm_device *' to parameter of type 'const struct device *' [-Werror,-Wincompatible-pointer-types]
                   drm_dev_dbg(dev, "%lu %d %p\n",
                               ^~~
   include/drm/drm_print.h:337:39: note: passing argument to parameter 'dev' here
   void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
                                         ^
   drivers/gpu/drm/drm_bufs.c:252:20: warning: incompatible pointer to integer conversion passing 'char[11]' to parameter of type 'enum drm_debug_category' [-Wint-conversion]
                   drm_dev_dbg(dev, "%lu %d %p\n",
                                    ^~~~~~~~~~~~~
   include/drm/drm_print.h:337:68: note: passing argument to parameter 'category' here
   void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
                                                                      ^
>> drivers/gpu/drm/drm_bufs.c:253:6: warning: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const char *' [-Wint-conversion]
                             map->size, order_base_2(map->size), map->handle);
                             ^~~~~~~~~
   include/drm/drm_print.h:338:16: note: passing argument to parameter 'format' here
                    const char *format, ...);
                                ^
   drivers/gpu/drm/drm_bufs.c:310:15: error: incompatible pointer types passing 'struct drm_device *' to parameter of type 'const struct device *' [-Werror,-Wincompatible-pointer-types]
                   drm_dev_dbg(dev, "AGP offset = 0x%08llx, size = 0x%08lx\n",
                               ^~~
   include/drm/drm_print.h:337:39: note: passing argument to parameter 'dev' here
   void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
                                         ^
   drivers/gpu/drm/drm_bufs.c:310:20: warning: incompatible pointer to integer conversion passing 'char[39]' to parameter of type 'enum drm_debug_category' [-Wint-conversion]
                   drm_dev_dbg(dev, "AGP offset = 0x%08llx, size = 0x%08lx\n",
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:337:68: note: passing argument to parameter 'category' here
   void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
                                                                      ^
   drivers/gpu/drm/drm_bufs.c:311:6: warning: incompatible integer to pointer conversion passing 'unsigned long long' to parameter of type 'const char *' [-Wint-conversion]
                             (unsigned long long)map->offset, map->size);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:338:16: note: passing argument to parameter 'format' here
                    const char *format, ...);
                                ^
   drivers/gpu/drm/drm_bufs.c:914:14: error: incompatible pointer types passing 'struct drm_device *' to parameter of type 'const struct device *' [-Werror,-Wincompatible-pointer-types]
           drm_dev_dbg(dev, "count=%d, size=%d (%d), order=%d\n",
                       ^~~
   include/drm/drm_print.h:337:39: note: passing argument to parameter 'dev' here
   void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
                                         ^
   drivers/gpu/drm/drm_bufs.c:914:19: warning: incompatible pointer to integer conversion passing 'char[34]' to parameter of type 'enum drm_debug_category' [-Wint-conversion]
           drm_dev_dbg(dev, "count=%d, size=%d (%d), order=%d\n",
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:337:68: note: passing argument to parameter 'category' here
   void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
                                                                      ^
>> drivers/gpu/drm/drm_bufs.c:915:7: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'const char *' [-Wint-conversion]
                       request->count, request->size, size, order);
                       ^~~~~~~~~~~~~~
   include/drm/drm_print.h:338:16: note: passing argument to parameter 'format' here
                    const char *format, ...);
                                ^
   drivers/gpu/drm/drm_bufs.c:977:14: error: incompatible pointer types passing 'struct drm_device *' to parameter of type 'const struct device *' [-Werror,-Wincompatible-pointer-types]
           drm_dev_dbg(dev, "pagelist: %d entries\n",
                       ^~~
   include/drm/drm_print.h:337:39: note: passing argument to parameter 'dev' here
   void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
                                         ^
   drivers/gpu/drm/drm_bufs.c:977:19: warning: incompatible pointer to integer conversion passing 'char[22]' to parameter of type 'enum drm_debug_category' [-Wint-conversion]
           drm_dev_dbg(dev, "pagelist: %d entries\n",
                            ^~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:337:68: note: passing argument to parameter 'category' here
   void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
                                                                      ^
   drivers/gpu/drm/drm_bufs.c:978:7: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'const char *' [-Wint-conversion]
                       dma->page_count + (count << page_order));
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:338:16: note: passing argument to parameter 'format' here
                    const char *format, ...);
                                ^
   drivers/gpu/drm/drm_bufs.c:1017:16: error: incompatible pointer types passing 'struct drm_device *' to parameter of type 'const struct device *' [-Werror,-Wincompatible-pointer-types]
                           drm_dev_dbg(dev, "page %d @ 0x%08lx\n",
                                       ^~~
   include/drm/drm_print.h:337:39: note: passing argument to parameter 'dev' here
   void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
                                         ^
   drivers/gpu/drm/drm_bufs.c:1017:21: warning: incompatible pointer to integer conversion passing 'char[19]' to parameter of type 'enum drm_debug_category' [-Wint-conversion]
                           drm_dev_dbg(dev, "page %d @ 0x%08lx\n",
                                            ^~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:337:68: note: passing argument to parameter 'category' here
   void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
                                                                      ^
   drivers/gpu/drm/drm_bufs.c:1018:9: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'const char *' [-Wint-conversion]
                                       dma->page_count + page_count,
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:338:16: note: passing argument to parameter 'format' here
                    const char *format, ...);
                                ^
   drivers/gpu/drm/drm_bufs.c:1053:16: error: incompatible pointer types passing 'struct drm_device *' to parameter of type 'const struct device *' [-Werror,-Wincompatible-pointer-types]
                           drm_dev_dbg(dev, "buffer %d @ %p\n",
                                       ^~~
   include/drm/drm_print.h:337:39: note: passing argument to parameter 'dev' here
   void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
                                         ^
   drivers/gpu/drm/drm_bufs.c:1053:21: warning: incompatible pointer to integer conversion passing 'char[16]' to parameter of type 'enum drm_debug_category' [-Wint-conversion]
                           drm_dev_dbg(dev, "buffer %d @ %p\n",
                                            ^~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:337:68: note: passing argument to parameter 'category' here
   void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
                                                                      ^
   drivers/gpu/drm/drm_bufs.c:1054:9: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'const char *' [-Wint-conversion]
                                       entry->buf_count, buf->address);
                                       ^~~~~~~~~~~~~~~~
   include/drm/drm_print.h:338:16: note: passing argument to parameter 'format' here
                    const char *format, ...);
                                ^
   drivers/gpu/drm/drm_bufs.c:1142:14: error: incompatible pointer types passing 'struct drm_device *' to parameter of type 'const struct device *' [-Werror,-Wincompatible-pointer-types]
           drm_dev_dbg(dev, "count:      %d\n", count);
                       ^~~
   include/drm/drm_print.h:337:39: note: passing argument to parameter 'dev' here
   void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
                                         ^
   drivers/gpu/drm/drm_bufs.c:1142:19: warning: incompatible pointer to integer conversion passing 'char[16]' to parameter of type 'enum drm_debug_category' [-Wint-conversion]
           drm_dev_dbg(dev, "count:      %d\n", count);
                            ^~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:337:68: note: passing argument to parameter 'category' here
   void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
                                                                      ^
   drivers/gpu/drm/drm_bufs.c:1142:39: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'const char *' [-Wint-conversion]
           drm_dev_dbg(dev, "count:      %d\n", count);
                                                ^~~~~
   include/drm/drm_print.h:338:16: note: passing argument to parameter 'format' here
                    const char *format, ...);
                                ^
   drivers/gpu/drm/drm_bufs.c:1143:14: error: incompatible pointer types passing 'struct drm_device *' to parameter of type 'const struct device *' [-Werror,-Wincompatible-pointer-types]
           drm_dev_dbg(dev, "order:      %d\n", order);
                       ^~~
   include/drm/drm_print.h:337:39: note: passing argument to parameter 'dev' here
   void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
                                         ^
   drivers/gpu/drm/drm_bufs.c:1143:19: warning: incompatible pointer to integer conversion passing 'char[16]' to parameter of type 'enum drm_debug_category' [-Wint-conversion]
           drm_dev_dbg(dev, "order:      %d\n", order);
                            ^~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:337:68: note: passing argument to parameter 'category' here
   void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
                                                                      ^
   drivers/gpu/drm/drm_bufs.c:1143:39: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'const char *' [-Wint-conversion]
           drm_dev_dbg(dev, "order:      %d\n", order);
                                                ^~~~~
   include/drm/drm_print.h:338:16: note: passing argument to parameter 'format' here
                    const char *format, ...);
                                ^
   drivers/gpu/drm/drm_bufs.c:1144:14: error: incompatible pointer types passing 'struct drm_device *' to parameter of type 'const struct device *' [-Werror,-Wincompatible-pointer-types]
           drm_dev_dbg(dev, "size:       %d\n", size);
                       ^~~
   include/drm/drm_print.h:337:39: note: passing argument to parameter 'dev' here
   void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,


vim +174 drivers/gpu/drm/drm_bufs.c

   138	
   139	/*
   140	 * Core function to create a range of memory available for mapping by a
   141	 * non-root process.
   142	 *
   143	 * Adjusts the memory offset to its absolute value according to the mapping
   144	 * type.  Adds the map to the map list drm_device::maplist. Adds MTRR's where
   145	 * applicable and if supported by the kernel.
   146	 */
   147	static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
   148				   unsigned int size, enum drm_map_type type,
   149				   enum drm_map_flags flags,
   150				   struct drm_map_list **maplist)
   151	{
   152		struct drm_local_map *map;
   153		struct drm_map_list *list;
   154		unsigned long user_token;
   155		int ret;
   156	
   157		map = kmalloc(sizeof(*map), GFP_KERNEL);
   158		if (!map)
   159			return -ENOMEM;
   160	
   161		map->offset = offset;
   162		map->size = size;
   163		map->flags = flags;
   164		map->type = type;
   165	
   166		/* Only allow shared memory to be removable since we only keep enough
   167		 * book keeping information about shared memory to allow for removal
   168		 * when processes fork.
   169		 */
   170		if ((map->flags & _DRM_REMOVABLE) && map->type != _DRM_SHM) {
   171			kfree(map);
   172			return -EINVAL;
   173		}
 > 174		drm_dev_dbg(dev, "offset = 0x%08llx, size = 0x%08lx, type = %d\n",
 > 175			    (unsigned long long)map->offset, map->size, map->type);
   176	
   177		/* page-align _DRM_SHM maps. They are allocated here so there is no security
   178		 * hole created by that and it works around various broken drivers that use
   179		 * a non-aligned quantity to map the SAREA. --BenH
   180		 */
   181		if (map->type == _DRM_SHM)
   182			map->size = PAGE_ALIGN(map->size);
   183	
   184		if ((map->offset & (~(resource_size_t)PAGE_MASK)) || (map->size & (~PAGE_MASK))) {
   185			kfree(map);
   186			return -EINVAL;
   187		}
   188		map->mtrr = -1;
   189		map->handle = NULL;
   190	
   191		switch (map->type) {
   192		case _DRM_REGISTERS:
   193		case _DRM_FRAME_BUFFER:
   194	#if !defined(__sparc__) && !defined(__alpha__) && !defined(__ia64__) && !defined(__powerpc64__) && !defined(__x86_64__) && !defined(__arm__)
   195			if (map->offset + (map->size-1) < map->offset ||
   196			    map->offset < virt_to_phys(high_memory)) {
   197				kfree(map);
   198				return -EINVAL;
   199			}
   200	#endif
   201			/* Some drivers preinitialize some maps, without the X Server
   202			 * needing to be aware of it.  Therefore, we just return success
   203			 * when the server tries to create a duplicate map.
   204			 */
   205			list = drm_find_matching_map(dev, map);
   206			if (list != NULL) {
   207				if (list->map->size != map->size) {
   208					drm_dev_dbg(dev,
   209						    "Matching maps of type %d with mismatched sizes, (%ld vs %ld)\n",
 > 210						    map->type, map->size, list->map->size);
   211					list->map->size = map->size;
   212				}
   213	
   214				kfree(map);
   215				*maplist = list;
   216				return 0;
   217			}
   218	
   219			if (map->type == _DRM_FRAME_BUFFER ||
   220			    (map->flags & _DRM_WRITE_COMBINING)) {
   221				map->mtrr =
   222					arch_phys_wc_add(map->offset, map->size);
   223			}
   224			if (map->type == _DRM_REGISTERS) {
   225				if (map->flags & _DRM_WRITE_COMBINING)
   226					map->handle = ioremap_wc(map->offset,
   227								 map->size);
   228				else
   229					map->handle = ioremap(map->offset, map->size);
   230				if (!map->handle) {
   231					kfree(map);
   232					return -ENOMEM;
   233				}
   234			}
   235	
   236			break;
   237		case _DRM_SHM:
   238			list = drm_find_matching_map(dev, map);
   239			if (list != NULL) {
   240				if (list->map->size != map->size) {
   241					drm_dev_dbg(dev,
   242						    "Matching maps of type %d with mismatched sizes, (%ld vs %ld)\n",
   243						    map->type, map->size, list->map->size);
   244					list->map->size = map->size;
   245				}
   246	
   247				kfree(map);
   248				*maplist = list;
   249				return 0;
   250			}
   251			map->handle = vmalloc_user(map->size);
   252			drm_dev_dbg(dev, "%lu %d %p\n",
 > 253				  map->size, order_base_2(map->size), map->handle);
   254			if (!map->handle) {
   255				kfree(map);
   256				return -ENOMEM;
   257			}
   258			map->offset = (unsigned long)map->handle;
   259			if (map->flags & _DRM_CONTAINS_LOCK) {
   260				/* Prevent a 2nd X Server from creating a 2nd lock */
   261				if (dev->master->lock.hw_lock != NULL) {
   262					vfree(map->handle);
   263					kfree(map);
   264					return -EBUSY;
   265				}
   266				dev->sigdata.lock = dev->master->lock.hw_lock = map->handle;	/* Pointer to lock */
   267			}
   268			break;
   269		case _DRM_AGP: {
   270			struct drm_agp_mem *entry;
   271			int valid = 0;
   272	
   273			if (!dev->agp) {
   274				kfree(map);
   275				return -EINVAL;
   276			}
   277	#ifdef __alpha__
   278			map->offset += dev->hose->mem_space->start;
   279	#endif
   280			/* In some cases (i810 driver), user space may have already
   281			 * added the AGP base itself, because dev->agp->base previously
   282			 * only got set during AGP enable.  So, only add the base
   283			 * address if the map's offset isn't already within the
   284			 * aperture.
   285			 */
   286			if (map->offset < dev->agp->base ||
   287			    map->offset > dev->agp->base +
   288			    dev->agp->agp_info.aper_size * 1024 * 1024 - 1) {
   289				map->offset += dev->agp->base;
   290			}
   291			map->mtrr = dev->agp->agp_mtrr;	/* for getmap */
   292	
   293			/* This assumes the DRM is in total control of AGP space.
   294			 * It's not always the case as AGP can be in the control
   295			 * of user space (i.e. i810 driver). So this loop will get
   296			 * skipped and we double check that dev->agp->memory is
   297			 * actually set as well as being invalid before EPERM'ing
   298			 */
   299			list_for_each_entry(entry, &dev->agp->memory, head) {
   300				if ((map->offset >= entry->bound) &&
   301				    (map->offset + map->size <= entry->bound + entry->pages * PAGE_SIZE)) {
   302					valid = 1;
   303					break;
   304				}
   305			}
   306			if (!list_empty(&dev->agp->memory) && !valid) {
   307				kfree(map);
   308				return -EPERM;
   309			}
   310			drm_dev_dbg(dev, "AGP offset = 0x%08llx, size = 0x%08lx\n",
   311				  (unsigned long long)map->offset, map->size);
   312	
   313			break;
   314		}
   315		case _DRM_SCATTER_GATHER:
   316			if (!dev->sg) {
   317				kfree(map);
   318				return -EINVAL;
   319			}
   320			map->offset += (unsigned long)dev->sg->virtual;
   321			break;
   322		case _DRM_CONSISTENT:
   323			/* dma_addr_t is 64bit on i386 with CONFIG_HIGHMEM64G,
   324			 * As we're limiting the address to 2^32-1 (or less),
   325			 * casting it down to 32 bits is no problem, but we
   326			 * need to point to a 64bit variable first.
   327			 */
   328			map->handle = dma_alloc_coherent(dev->dev,
   329							 map->size,
   330							 &map->offset,
   331							 GFP_KERNEL);
   332			if (!map->handle) {
   333				kfree(map);
   334				return -ENOMEM;
   335			}
   336			break;
   337		default:
   338			kfree(map);
   339			return -EINVAL;
   340		}
   341	
   342		list = kzalloc(sizeof(*list), GFP_KERNEL);
   343		if (!list) {
   344			if (map->type == _DRM_REGISTERS)
   345				iounmap(map->handle);
   346			kfree(map);
   347			return -EINVAL;
   348		}
   349		list->map = map;
   350	
   351		mutex_lock(&dev->struct_mutex);
   352		list_add(&list->head, &dev->maplist);
   353	
   354		/* Assign a 32-bit handle */
   355		/* We do it here so that dev->struct_mutex protects the increment */
   356		user_token = (map->type == _DRM_SHM) ? (unsigned long)map->handle :
   357			map->offset;
   358		ret = drm_map_handle(dev, &list->hash, user_token, 0,
   359				     (map->type == _DRM_SHM));
   360		if (ret) {
   361			if (map->type == _DRM_REGISTERS)
   362				iounmap(map->handle);
   363			kfree(map);
   364			kfree(list);
   365			mutex_unlock(&dev->struct_mutex);
   366			return ret;
   367		}
   368	
   369		list->user_token = list->hash.key << PAGE_SHIFT;
   370		mutex_unlock(&dev->struct_mutex);
   371	
   372		if (!(map->flags & _DRM_DRIVER))
   373			list->master = dev->master;
   374		*maplist = list;
   375		return 0;
   376	}
   377	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
