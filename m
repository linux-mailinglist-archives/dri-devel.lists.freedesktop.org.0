Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C04DDA75439
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 05:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE8410E0B1;
	Sat, 29 Mar 2025 04:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TEdQ9NRu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D5910E0B1
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 04:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743224360; x=1774760360;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2Yne1QbhxA+8CZWwW8yAQd6QasSrkff6bi9RqIVQxpI=;
 b=TEdQ9NRu0LFXPuSRSLroRu4EVg5zH02MyEnnFF3xbjSAmrxRif3kH4in
 kpO9d8g19Ara3KmQg01iRu4AQeTts1hbiY8T7sskGxm/RScq6RLcCHFm2
 Nj6tUGNdUEha2sR9ii4xCH7UBFKF8cSe8A6xpYVDs7X9tC8SNenOzy67p
 u3nkARKzVc6LXpUhPGz26mXr5lJEGVkYg9ncLwWrukpUT46XMU2oibj/A
 wPmppALNcR2XgZJoVurxZIZPHh3xjGxz4dvSNI7ntR9YTDVhaEF09d+Pd
 lHkXVT4d9MbpRAjjHYwaCHu1B9UgKbLjuF8M2W/y1/Tn/jXBS42CZ0R9x g==;
X-CSE-ConnectionGUID: UWclz+SbQwORD+DWPmOwAA==
X-CSE-MsgGUID: DZBphZfMQ+OhvFzdponasA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44718744"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; d="scan'208";a="44718744"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 21:59:20 -0700
X-CSE-ConnectionGUID: IhXeNcEpQXmA46pvyVZ4WQ==
X-CSE-MsgGUID: 52fOeOn6QNehvEx91wWYZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; d="scan'208";a="162869118"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 28 Mar 2025 21:59:15 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tyOHo-0007uc-2j;
 Sat, 29 Mar 2025 04:59:12 +0000
Date: Sat, 29 Mar 2025 12:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: Re: [PATCH v3 03/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
Message-ID: <202503291204.imMRd3l7-lkp@intel.com>
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-3-7f457073282d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-3-7f457073282d@oss.qualcomm.com>
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

Hi Amirreza,

kernel test robot noticed the following build warnings:

[auto build test WARNING on db8da9da41bced445077925f8a886c776a47440c]

url:    https://github.com/intel-lab-lkp/linux/commits/Amirreza-Zarrabi/tee-allow-a-driver-to-allocate-a-tee_device-without-a-pool/20250328-104950
base:   db8da9da41bced445077925f8a886c776a47440c
patch link:    https://lore.kernel.org/r/20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-3-7f457073282d%40oss.qualcomm.com
patch subject: [PATCH v3 03/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
config: x86_64-randconfig-122-20250329 (https://download.01.org/0day-ci/archive/20250329/202503291204.imMRd3l7-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503291204.imMRd3l7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503291204.imMRd3l7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tee/tee_core.c:410:48: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] uaddr @@     got void [noderef] __user * @@
   drivers/tee/tee_core.c:410:48: sparse:     expected void *[noderef] uaddr
   drivers/tee/tee_core.c:410:48: sparse:     got void [noderef] __user *
>> drivers/tee/tee_core.c:413:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *ptr @@     got void *[noderef] uaddr @@
   drivers/tee/tee_core.c:413:30: sparse:     expected void const [noderef] __user *ptr
   drivers/tee/tee_core.c:413:30: sparse:     got void *[noderef] uaddr
   drivers/tee/tee_core.c:802:41: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] uaddr @@     got void [noderef] __user * @@
   drivers/tee/tee_core.c:802:41: sparse:     expected void *[noderef] uaddr
   drivers/tee/tee_core.c:802:41: sparse:     got void [noderef] __user *
   drivers/tee/tee_core.c:805:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *ptr @@     got void *[noderef] uaddr @@
   drivers/tee/tee_core.c:805:30: sparse:     expected void const [noderef] __user *ptr
   drivers/tee/tee_core.c:805:30: sparse:     got void *[noderef] uaddr
>> drivers/tee/tee_core.c:413:30: sparse: sparse: dereference of noderef expression
>> drivers/tee/tee_core.c:413:30: sparse: sparse: dereference of noderef expression
   drivers/tee/tee_core.c:694:37: sparse: sparse: dereference of noderef expression
   drivers/tee/tee_core.c:805:30: sparse: sparse: dereference of noderef expression
   drivers/tee/tee_core.c:805:30: sparse: sparse: dereference of noderef expression

vim +410 drivers/tee/tee_core.c

   378	
   379	static int params_from_user(struct tee_context *ctx, struct tee_param *params,
   380				    size_t num_params,
   381				    struct tee_ioctl_param __user *uparams)
   382	{
   383		size_t n;
   384	
   385		for (n = 0; n < num_params; n++) {
   386			struct tee_shm *shm;
   387			struct tee_ioctl_param ip;
   388	
   389			if (copy_from_user(&ip, uparams + n, sizeof(ip)))
   390				return -EFAULT;
   391	
   392			/* All unused attribute bits has to be zero */
   393			if (ip.attr & ~TEE_IOCTL_PARAM_ATTR_MASK)
   394				return -EINVAL;
   395	
   396			params[n].attr = ip.attr;
   397			switch (ip.attr & TEE_IOCTL_PARAM_ATTR_TYPE_MASK) {
   398			case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
   399			case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
   400				break;
   401			case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
   402			case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
   403				params[n].u.value.a = ip.a;
   404				params[n].u.value.b = ip.b;
   405				params[n].u.value.c = ip.c;
   406				break;
   407			case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
   408			case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
   409			case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
 > 410				params[n].u.ubuf.uaddr = u64_to_user_ptr(ip.a);
   411				params[n].u.ubuf.size = ip.b;
   412	
 > 413				if (!access_ok(params[n].u.ubuf.uaddr,
   414					       params[n].u.ubuf.size))
   415					return -EFAULT;
   416	
   417				break;
   418			case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
   419			case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
   420			case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
   421				/*
   422				 * If a NULL pointer is passed to a TA in the TEE,
   423				 * the ip.c IOCTL parameters is set to TEE_MEMREF_NULL
   424				 * indicating a NULL memory reference.
   425				 */
   426				if (ip.c != TEE_MEMREF_NULL) {
   427					/*
   428					 * If we fail to get a pointer to a shared
   429					 * memory object (and increase the ref count)
   430					 * from an identifier we return an error. All
   431					 * pointers that has been added in params have
   432					 * an increased ref count. It's the callers
   433					 * responibility to do tee_shm_put() on all
   434					 * resolved pointers.
   435					 */
   436					shm = tee_shm_get_from_id(ctx, ip.c);
   437					if (IS_ERR(shm))
   438						return PTR_ERR(shm);
   439	
   440					/*
   441					 * Ensure offset + size does not overflow
   442					 * offset and does not overflow the size of
   443					 * the referred shared memory object.
   444					 */
   445					if ((ip.a + ip.b) < ip.a ||
   446					    (ip.a + ip.b) > shm->size) {
   447						tee_shm_put(shm);
   448						return -EINVAL;
   449					}
   450				} else if (ctx->cap_memref_null) {
   451					/* Pass NULL pointer to OP-TEE */
   452					shm = NULL;
   453				} else {
   454					return -EINVAL;
   455				}
   456	
   457				params[n].u.memref.shm_offs = ip.a;
   458				params[n].u.memref.size = ip.b;
   459				params[n].u.memref.shm = shm;
   460				break;
   461			default:
   462				/* Unknown attribute */
   463				return -EINVAL;
   464			}
   465		}
   466		return 0;
   467	}
   468	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
