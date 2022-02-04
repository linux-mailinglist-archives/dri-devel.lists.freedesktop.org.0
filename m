Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ACF4A9204
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 02:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222AD10E1BA;
	Fri,  4 Feb 2022 01:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D6A10EA05;
 Fri,  4 Feb 2022 01:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643938247; x=1675474247;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6UyYeCLGlYNexQxAtpUi4eVnNE/HWxlw3jTpuJtu3pQ=;
 b=dJi+gNDwYtn3GqjT68CMomieM0cxt+ljVbnJtc9Cdl8+kLMjA49VXcnS
 8WIp9ndIDqzvBfYRB+Z+NF+enFmMl/jvU6d0BB7iozpiaLeH8gsoD5UGf
 q3HQIN/FK6l6wRsig+iQF58fOuU6jLgr6D8kwv50TY2VW2tqQ5TC/3BWf
 zk4L8k2M5vMyTVg21QHJOKVSXoGr/hwhtkZCoeA4ynzUyhIGhE8k5FA5l
 2OTeqhr1kbTLfTTTeb4rYbHjwrq2kJF2NU8uWryXK5MwN4VRIr2w3GgH7
 QljLOB0mpPs9rQpq99TA7P2ITCCIefFt++pxIbIun3wdQLixbyagKIikM g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="231859893"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="231859893"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 17:30:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="699529534"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 03 Feb 2022 17:30:45 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nFnQy-000Wuy-N1; Fri, 04 Feb 2022 01:30:44 +0000
Date: Fri, 4 Feb 2022 09:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Add fallback inside memcpy_from_wc
 functions
Message-ID: <202202040609.oSW2rFIL-lkp@intel.com>
References: <20220203162703.352447-1-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203162703.352447-1-balasubramani.vivekanandan@intel.com>
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Balasubramani,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip drm-exynos/exynos-drm-next drm/drm-next tegra-drm/drm/tegra/for-next v5.17-rc2 next-20220203]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Balasubramani-Vivekanandan/drm-i915-Add-fallback-inside-memcpy_from_wc-functions/20220204-002704
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20220204/202202040609.oSW2rFIL-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/66de634b392157effc065df388510df67de59f2b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Balasubramani-Vivekanandan/drm-i915-Add-fallback-inside-memcpy_from_wc-functions/20220204-002704
        git checkout 66de634b392157effc065df388510df67de59f2b
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/ net/ipv6/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/i915_memcpy.c:189:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *src @@     got void const [noderef] __iomem *src @@
   drivers/gpu/drm/i915/i915_memcpy.c:189:42: sparse:     expected void const *src
   drivers/gpu/drm/i915/i915_memcpy.c:189:42: sparse:     got void const [noderef] __iomem *src
>> drivers/gpu/drm/i915/i915_memcpy.c:191:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *[assigned] src @@     got void const [noderef] __iomem *src @@
   drivers/gpu/drm/i915/i915_memcpy.c:191:45: sparse:     expected void const *[assigned] src
   drivers/gpu/drm/i915/i915_memcpy.c:191:45: sparse:     got void const [noderef] __iomem *src
   drivers/gpu/drm/i915/i915_memcpy.c:187:6: sparse: sparse: symbol 'i915_io_memcpy_from_wc' redeclared with different type (incompatible argument 2 (different address spaces)):
>> drivers/gpu/drm/i915/i915_memcpy.c:187:6: sparse:    void extern [addressable] [toplevel] i915_io_memcpy_from_wc( ... )
   drivers/gpu/drm/i915/i915_memcpy.c: note: in included file:
   drivers/gpu/drm/i915/i915_memcpy.h:17:6: sparse: note: previously declared as:
>> drivers/gpu/drm/i915/i915_memcpy.h:17:6: sparse:    void extern [addressable] [toplevel] i915_io_memcpy_from_wc( ... )
--
>> drivers/gpu/drm/i915/gem/i915_gem_object.c:449:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *src @@     got void [noderef] __iomem *[assigned] src_ptr @@
   drivers/gpu/drm/i915/gem/i915_gem_object.c:449:37: sparse:     expected void const *src
   drivers/gpu/drm/i915/gem/i915_gem_object.c:449:37: sparse:     got void [noderef] __iomem *[assigned] src_ptr

vim +189 drivers/gpu/drm/i915/i915_memcpy.c

   175	
   176	/**
   177	 * i915_io_memcpy_from_wc: perform an accelerated *aligned* read from WC
   178	 * @dst: destination pointer
   179	 * @src: source pointer
   180	 * @len: how many bytes to copy
   181	 *
   182	 * To be used when the when copying from io memory.
   183	 *
   184	 * memcpy_fromio() is used as fallback otherewise no difference to
   185	 * i915_memcpy_from_wc()
   186	 */
 > 187	void i915_io_memcpy_from_wc(void *dst, const void __iomem *src, unsigned long len)
   188	{
 > 189		if (i915_can_memcpy_from_wc(dst, src, len)) {
   190			if (likely(len))
 > 191				__memcpy_ntdqa(dst, src, len >> 4);
   192			return;
   193		}
   194	
   195		/* Fallback */
   196		memcpy_fromio(dst, src, len);
   197	}
   198	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
