Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 739F6770F6D
	for <lists+dri-devel@lfdr.de>; Sat,  5 Aug 2023 13:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F7F10E180;
	Sat,  5 Aug 2023 11:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EED210E180
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Aug 2023 11:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691234372; x=1722770372;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=edJFgUYPS5vQd5+oDlPu23nwC0cXqwIrOUu8lSZi3w0=;
 b=dTbwmblN9ymTXIphpsuwkHZiaHXamo379N20zPpZe6J/ObIrYiDx7BEv
 I+HCrVs16DJ7L7dOBC6tmEh/pvQFs+1XKavo6SR56CePn4VH070Zi+9hg
 9/Qo/wYAClJ+2CQUPYtjeIQMdBmN4lsX7ufQ+bS815dvnMmv5oQAOJYMi
 9VRNkfcKdfPGde9DmNMRNeXrpLkEY3Oh4rHmzEvGOC0I/pH9or4M8+V+m
 PS2gbJTlWDIVcAOpz21jxjgxq3q7hAzE4wZOBxZiYqGuB5lvH7PCpwMRQ
 uCdGArSshcWeQyx9QiDRer2yhkVUP26iIFogyCujFp+zCQW4l5OeCEDDo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="349899465"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; d="scan'208";a="349899465"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2023 04:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="844419967"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; d="scan'208";a="844419967"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 05 Aug 2023 04:19:29 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qSFJh-0003Ti-07;
 Sat, 05 Aug 2023 11:19:29 +0000
Date: Sat, 5 Aug 2023 19:19:11 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: [drm-misc:for-linux-next 11/12]
 drivers/gpu/drm/nouveau/nouveau_exec.c:299:19: sparse: sparse: dereference
 of noderef expression
Message-ID: <202308051951.bErKWZ2A-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   82d750e9d2f5d0594c8f7057ce59127e701af781
commit: b88baab828713ce0b49b185444b2ee83bed373a8 [11/12] drm/nouveau: implement new VM_BIND uAPI
config: s390-randconfig-r071-20230730 (https://download.01.org/0day-ci/archive/20230805/202308051951.bErKWZ2A-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308051951.bErKWZ2A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308051951.bErKWZ2A-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nouveau_exec.c:299:19: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_exec.c:300:19: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_exec.c:301:20: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_exec.c:302:20: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_exec.c:303:21: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_exec.c:304:21: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_exec.c:374:43: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_exec.c:389:13: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_exec.c:390:17: sparse: sparse: dereference of noderef expression
--
   drivers/gpu/drm/nouveau/nouveau_drm.c:401:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_drm.c:401:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_drm.c:402:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_drm.c:402:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_drm.c:402:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_drm.c:402:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_drm.c:406:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_drm.c:406:33: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_drm.c:1214:9: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( [usertype] *func )( ... ) @@     got int ( * )( ... ) @@
   drivers/gpu/drm/nouveau/nouveau_drm.c:1214:9: sparse:     expected int ( [usertype] *func )( ... )
   drivers/gpu/drm/nouveau/nouveau_drm.c:1214:9: sparse:     got int ( * )( ... )
   drivers/gpu/drm/nouveau/nouveau_drm.c:1215:9: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( [usertype] *func )( ... ) @@     got int ( * )( ... ) @@
   drivers/gpu/drm/nouveau/nouveau_drm.c:1215:9: sparse:     expected int ( [usertype] *func )( ... )
   drivers/gpu/drm/nouveau/nouveau_drm.c:1215:9: sparse:     got int ( * )( ... )
   drivers/gpu/drm/nouveau/nouveau_drm.c:1216:9: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( [usertype] *func )( ... ) @@     got int ( * )( ... ) @@
   drivers/gpu/drm/nouveau/nouveau_drm.c:1216:9: sparse:     expected int ( [usertype] *func )( ... )
   drivers/gpu/drm/nouveau/nouveau_drm.c:1216:9: sparse:     got int ( * )( ... )
--
   drivers/gpu/drm/nouveau/nouveau_uvmm.c:1656:1: sparse: sparse: symbol 'nouveau_uvmm_ioctl_vm_init' redeclared with different type (incompatible argument 2 (different address spaces)):
>> drivers/gpu/drm/nouveau/nouveau_uvmm.c:1656:1: sparse:    int extern [addressable] [signed] [toplevel] nouveau_uvmm_ioctl_vm_init( ... )
   drivers/gpu/drm/nouveau/nouveau_uvmm.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
   drivers/gpu/drm/nouveau/nouveau_uvmm.h:92:5: sparse: note: previously declared as:
>> drivers/gpu/drm/nouveau/nouveau_uvmm.h:92:5: sparse:    int extern [addressable] [signed] [toplevel] nouveau_uvmm_ioctl_vm_init( ... )
   drivers/gpu/drm/nouveau/nouveau_uvmm.c:283:17: sparse: sparse: context imbalance in '__nouveau_uvma_region_insert' - unexpected unlock
>> drivers/gpu/drm/nouveau/nouveau_uvmm.c:1693:19: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_uvmm.c:1694:19: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_uvmm.c:1695:20: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_uvmm.c:1696:20: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_uvmm.c:1697:19: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_uvmm.c:1698:19: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/nouveau/nouveau_uvmm.c:1701:23: sparse: sparse: dereference of noderef expression

vim +299 drivers/gpu/drm/nouveau/nouveau_exec.c

   293	
   294	static int
   295	nouveau_exec_ucopy(struct nouveau_exec_job_args *args,
   296			   struct drm_nouveau_exec __user *req)
   297	{
   298		struct drm_nouveau_sync **s;
 > 299		u32 inc = req->wait_count;
   300		u64 ins = req->wait_ptr;
   301		u32 outc = req->sig_count;
   302		u64 outs = req->sig_ptr;
   303		u32 pushc = req->push_count;
   304		u64 pushs = req->push_ptr;
   305		int ret;
   306	
   307		if (pushc) {
   308			args->push.count = pushc;
   309			args->push.s = u_memcpya(pushs, pushc, sizeof(*args->push.s));
   310			if (IS_ERR(args->push.s))
   311				return PTR_ERR(args->push.s);
   312		}
   313	
   314		if (inc) {
   315			s = &args->in_sync.s;
   316	
   317			args->in_sync.count = inc;
   318			*s = u_memcpya(ins, inc, sizeof(**s));
   319			if (IS_ERR(*s)) {
   320				ret = PTR_ERR(*s);
   321				goto err_free_pushs;
   322			}
   323		}
   324	
   325		if (outc) {
   326			s = &args->out_sync.s;
   327	
   328			args->out_sync.count = outc;
   329			*s = u_memcpya(outs, outc, sizeof(**s));
   330			if (IS_ERR(*s)) {
   331				ret = PTR_ERR(*s);
   332				goto err_free_ins;
   333			}
   334		}
   335	
   336		return 0;
   337	
   338	err_free_pushs:
   339		u_free(args->push.s);
   340	err_free_ins:
   341		u_free(args->in_sync.s);
   342		return ret;
   343	}
   344	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
