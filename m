Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C91474989
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 18:34:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E012410E273;
	Tue, 14 Dec 2021 17:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6688F89D77;
 Tue, 14 Dec 2021 17:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639503258; x=1671039258;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=h7NmkOeXP+EgPvcnXUzU1fiOTvJLA9yEcsDhPz0HhPo=;
 b=KpSEWZD2d6SKliliDH1+j5+0LuU0DdDzY4y13LjmhKZWhMcG8LNrsITh
 cnZczoyYyhIlgiBvyzRU5f2eYYg7ogPD2esb2Zn1LDRPLM8ghyjYA+IrV
 D/FIO5D8LsBkwEA+PrH1DEmz/R/DaCX4Ee2BHyzVcV2PFuIqAcFBQJuu3
 abQCMoajCC1nwSQIHoa2FzzszmufJuvJbagjlGdB1nBPwyE05ssyr0aLQ
 EJa6BlVovplwDA6qLu7Pct4elqFlEgv3IyMR0D/yRMcQrFKklOVxCUqK7
 hOI3M2cfauzT2QHTeH2ZiV4aLfwt1NHGG9K7h/9YfOzghQ/zjPOzIy942 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="236568675"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="236568675"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 09:34:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="682143613"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 14 Dec 2021 09:34:15 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mxBgs-0000ZC-E1; Tue, 14 Dec 2021 17:34:14 +0000
Date: Wed, 15 Dec 2021 01:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: Qing Wang <wangqing@vivo.com>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: nouveau: lsfw: cleanup coccinelle warning
Message-ID: <202112150140.JBV3kw5P-lkp@intel.com>
References: <1639484284-75779-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1639484284-75779-1-git-send-email-wangqing@vivo.com>
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
Cc: Wang Qing <wangqing@vivo.com>, kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Qing,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on v5.16-rc5 next-20211213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Qing-Wang/drm-nouveau-lsfw-cleanup-coccinelle-warning/20211214-202245
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20211215/202112150140.JBV3kw5P-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/3a85ab7f09d9dc599e9910c320115b93f0274272
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Qing-Wang/drm-nouveau-lsfw-cleanup-coccinelle-warning/20211214-202245
        git checkout 3a85ab7f09d9dc599e9910c320115b93f0274272
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c: In function 'nvkm_acr_lsfw_load_bl_inst_data_sig':
>> drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:195:25: error: expected ')' before 'return'
     195 |         if (IS_ERR(lsfw)
         |            ~            ^
         |                         )
     196 |                 return PTR_ERR(lsfw);
         |                 ~~~~~~   
>> drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:254:1: error: expected expression before '}' token
     254 | }
         | ^
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:192:13: warning: unused variable 'ret' [-Wunused-variable]
     192 |         int ret;
         |             ^~~
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:191:14: warning: unused variable 'bldata' [-Wunused-variable]
     191 |         u32 *bldata;
         |              ^~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:190:36: warning: unused variable 'desc' [-Wunused-variable]
     190 |         const struct nvfw_bl_desc *desc;
         |                                    ^~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:189:36: warning: unused variable 'hdr' [-Wunused-variable]
     189 |         const struct nvfw_bin_hdr *hdr;
         |                                    ^~~
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:188:58: warning: unused variable 'data' [-Wunused-variable]
     188 |         const struct firmware *bl = NULL, *inst = NULL, *data = NULL;
         |                                                          ^~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:188:44: warning: unused variable 'inst' [-Wunused-variable]
     188 |         const struct firmware *bl = NULL, *inst = NULL, *data = NULL;
         |                                            ^~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:188:32: warning: unused variable 'bl' [-Wunused-variable]
     188 |         const struct firmware *bl = NULL, *inst = NULL, *data = NULL;
         |                                ^~
   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:254:1: error: control reaches end of non-void function [-Werror=return-type]
     254 | }
         | ^
   cc1: some warnings being treated as errors


vim +195 drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c

   178	
   179	int
   180	nvkm_acr_lsfw_load_bl_inst_data_sig(struct nvkm_subdev *subdev,
   181					    struct nvkm_falcon *falcon,
   182					    enum nvkm_acr_lsf_id id,
   183					    const char *path, int ver,
   184					    const struct nvkm_acr_lsf_func *func)
   185	{
   186		struct nvkm_acr *acr = subdev->device->acr;
   187		struct nvkm_acr_lsfw *lsfw;
   188		const struct firmware *bl = NULL, *inst = NULL, *data = NULL;
   189		const struct nvfw_bin_hdr *hdr;
   190		const struct nvfw_bl_desc *desc;
   191		u32 *bldata;
   192		int ret;
   193	
   194		lsfw = nvkm_acr_lsfw_add(func, acr, falcon, id);
 > 195		if (IS_ERR(lsfw)
   196			return PTR_ERR(lsfw);
   197	
   198		ret = nvkm_firmware_load_name(subdev, path, "bl", ver, &bl);
   199		if (ret)
   200			goto done;
   201	
   202		hdr = nvfw_bin_hdr(subdev, bl->data);
   203		desc = nvfw_bl_desc(subdev, bl->data + hdr->header_offset);
   204		bldata = (void *)(bl->data + hdr->data_offset);
   205	
   206		ret = nvkm_firmware_load_name(subdev, path, "inst", ver, &inst);
   207		if (ret)
   208			goto done;
   209	
   210		ret = nvkm_firmware_load_name(subdev, path, "data", ver, &data);
   211		if (ret)
   212			goto done;
   213	
   214		ret = nvkm_firmware_load_name(subdev, path, "sig", ver, &lsfw->sig);
   215		if (ret)
   216			goto done;
   217	
   218		lsfw->bootloader_size = ALIGN(desc->code_size, 256);
   219		lsfw->bootloader_imem_offset = desc->start_tag << 8;
   220	
   221		lsfw->app_start_offset = lsfw->bootloader_size;
   222		lsfw->app_imem_entry = 0;
   223		lsfw->app_resident_code_offset = 0;
   224		lsfw->app_resident_code_size = ALIGN(inst->size, 256);
   225		lsfw->app_resident_data_offset = lsfw->app_resident_code_size;
   226		lsfw->app_resident_data_size = ALIGN(data->size, 256);
   227		lsfw->app_size = lsfw->app_resident_code_size +
   228				 lsfw->app_resident_data_size;
   229	
   230		lsfw->img.size = lsfw->bootloader_size + lsfw->app_size;
   231		if (!(lsfw->img.data = kzalloc(lsfw->img.size, GFP_KERNEL))) {
   232			ret = -ENOMEM;
   233			goto done;
   234		}
   235	
   236		memcpy(lsfw->img.data, bldata, lsfw->bootloader_size);
   237		memcpy(lsfw->img.data + lsfw->app_start_offset +
   238		       lsfw->app_resident_code_offset, inst->data, inst->size);
   239		memcpy(lsfw->img.data + lsfw->app_start_offset +
   240		       lsfw->app_resident_data_offset, data->data, data->size);
   241	
   242		lsfw->ucode_size = ALIGN(lsfw->app_resident_data_offset, 256) +
   243				   lsfw->bootloader_size;
   244		lsfw->data_size = lsfw->app_size + lsfw->bootloader_size -
   245				  lsfw->ucode_size;
   246	
   247	done:
   248		if (ret)
   249			nvkm_acr_lsfw_del(lsfw);
   250		nvkm_firmware_put(data);
   251		nvkm_firmware_put(inst);
   252		nvkm_firmware_put(bl);
   253		return ret;
 > 254	}

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
