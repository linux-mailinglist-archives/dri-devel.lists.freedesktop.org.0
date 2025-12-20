Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65263CD3386
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 17:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9244410E067;
	Sat, 20 Dec 2025 16:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQrNnzQR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC4610E067
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 16:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766248288; x=1797784288;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Owar0Ub1+5wSojHfAm4Q7mGt1p28BiLqFHuPtkMYS64=;
 b=KQrNnzQRHkkMoPDNM5fcnRgZGCgFZzZ9/BIWcmctTsQP3Aa9XvQMQarg
 9eJ2v2++KlR+x70WSlmDA+qsVa53XdSow2gkdhSL6ZfGgfdmHqPQW4z+Q
 S7cnalMAEf7AfV2l9cGi65STQgRw76OxHpit83lf/f5s41QNOQUCG0gEg
 8xBvQFk7e1KCTM64Sl6ttdYYZccISZoW6xAnqwZesO6U0grdf5ueMaQL3
 YIg4YLTQ+NNQbLU7O8gOdzrsZY4zkTuyiKv+/emA8aMXCbgYsQWK0QNUR
 OT2yaiR6DB2UVabYPPjJ7hSqOQYjG+2r7lm37tb+JA3Z+fxt/GJAuQDsT A==;
X-CSE-ConnectionGUID: kFXmX4uIRSGGlvxbH786FQ==
X-CSE-MsgGUID: sGL3KfwMSCm4wCJ1SNKSLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="67375598"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; d="scan'208";a="67375598"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2025 08:31:27 -0800
X-CSE-ConnectionGUID: BSwMQfwqTxW7b62CvC0Vsw==
X-CSE-MsgGUID: FfnAArOGRd+WqMDsBwIdkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; d="scan'208";a="222605830"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 20 Dec 2025 08:31:25 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vWzrX-000000004sb-0feN;
 Sat, 20 Dec 2025 16:31:23 +0000
Date: Sun, 21 Dec 2025 00:31:07 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Dave Airlie <airlied@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH V4] drm/ast: Swap framebuffer writes on big-endian machines
Message-ID: <202512210011.dKKTJkNT-lkp@intel.com>
References: <20251212.210504.1355099120650239629.rene@exactco.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251212.210504.1355099120650239629.rene@exactco.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi René,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v6.19-rc1 next-20251219]
[cannot apply to daeinki-drm-exynos/exynos-drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ren-Rebe/drm-ast-Swap-framebuffer-writes-on-big-endian-machines/20251213-040713
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20251212.210504.1355099120650239629.rene%40exactco.de
patch subject: [PATCH V4] drm/ast: Swap framebuffer writes on big-endian machines
config: openrisc-randconfig-r122-20251217 (https://download.01.org/0day-ci/archive/20251221/202512210011.dKKTJkNT-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210011.dKKTJkNT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210011.dKKTJkNT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/ast/ast_cursor.c:103:24: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __be16 const [usertype] @@
   drivers/gpu/drm/ast/ast_cursor.c:103:24: sparse:     expected unsigned short [usertype] val
   drivers/gpu/drm/ast/ast_cursor.c:103:24: sparse:     got restricted __be16 const [usertype]
>> drivers/gpu/drm/ast/ast_cursor.c:103:24: sparse: sparse: cast from restricted __be16
>> drivers/gpu/drm/ast/ast_cursor.c:103:24: sparse: sparse: cast from restricted __be16

vim +103 drivers/gpu/drm/ast/ast_cursor.c

    91	
    92	static void ast_set_cursor_image(struct ast_device *ast, const u8 *src,
    93					 unsigned int width, unsigned int height)
    94	{
    95		u8 __iomem *dst = ast_plane_vaddr(&ast->cursor_plane.base);
    96		u32 csum = ast_cursor_calculate_checksum(src, width, height);
    97	
    98		/* write pixel data */
    99	#if defined(__BIG_ENDIAN)
   100		unsigned int i;
   101	
   102		for (i = 0; i < AST_HWC_SIZE; i += 2)
 > 103			writew(swab16(*(const __be16 *)&src[i]), &dst[i]);
   104	#else
   105		memcpy_toio(dst, src, AST_HWC_SIZE);
   106	#endif
   107	
   108		/* write checksum + signature */
   109		dst += AST_HWC_SIZE;
   110		writel(csum, dst);
   111		writel(width, dst + AST_HWC_SIGNATURE_SizeX);
   112		writel(height, dst + AST_HWC_SIGNATURE_SizeY);
   113		writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTX);
   114		writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTY);
   115	}
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
