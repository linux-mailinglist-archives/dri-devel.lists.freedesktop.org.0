Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E02B305AA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF8F10E044;
	Thu, 21 Aug 2025 20:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A3azVchS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C5D10E044
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755808463; x=1787344463;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=U0Zv9xWVRHMVUW3bwnQ1taT/AfB91xGbJzGBFeVtNdY=;
 b=A3azVchSVNTBaHx7M1LC48U5SOHhrUX+Nj1iITEwo1cErh5nQwwBvFR+
 GsQxj/rekXL5D+mvlnSLSHENEgTzDEL9Frila76l4esknQOuOH/wJ14jI
 Nvyz/+GZyYW03FyTpM88FuDL4Kgj+8PhzcjDU9juF7/qxJxynpV1FbqET
 cKIka9O2nGFSPxwe5F3j6YpVZNxAPN9NMIvDli+Jqk/ZUfDGQ7YrS/oYM
 mjmcTBh+UeP9vT8noTX545XlyCoybspuYBC5QIdbjIrnIOFcnaZUjn3ze
 /hZU9PcbDINsyUKLRD04rSyzGVbrEDqPJLIOERlu4JdTrxfFNK8pzvYL2 Q==;
X-CSE-ConnectionGUID: /XWdf/8USSiiD4HBkRFXJQ==
X-CSE-MsgGUID: DWwD6Ml5TGqdWGwPzwk24g==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58060800"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="58060800"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 13:34:23 -0700
X-CSE-ConnectionGUID: 5Zh/bL79Q4qiEpcW6oo8Qw==
X-CSE-MsgGUID: vVhSmUzmS+WslFhCOD7wpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="169323007"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by fmviesa010.fm.intel.com with ESMTP; 21 Aug 2025 13:34:17 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1upBzC-000Kdt-2j;
 Thu, 21 Aug 2025 20:34:14 +0000
Date: Fri, 22 Aug 2025 04:34:03 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, Harshal Dev <quic_hdev@quicinc.com>,
 linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org,
 Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v8 03/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
Message-ID: <202508220436.qjXO4p8r-lkp@intel.com>
References: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-3-7066680f138a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-3-7066680f138a@oss.qualcomm.com>
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

[auto build test WARNING on 5303936d609e09665deda94eaedf26a0e5c3a087]

url:    https://github.com/intel-lab-lkp/linux/commits/Amirreza-Zarrabi/tee-allow-a-driver-to-allocate-a-tee_device-without-a-pool/20250821-074358
base:   5303936d609e09665deda94eaedf26a0e5c3a087
patch link:    https://lore.kernel.org/r/20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-3-7066680f138a%40oss.qualcomm.com
patch subject: [PATCH v8 03/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
config: arm-randconfig-r133-20250821 (https://download.01.org/0day-ci/archive/20250822/202508220436.qjXO4p8r-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
reproduce: (https://download.01.org/0day-ci/archive/20250822/202508220436.qjXO4p8r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508220436.qjXO4p8r-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tee/tee_core.c:640:33: sparse: sparse: cast removes address space '__user' of expression

vim +/__user +640 drivers/tee/tee_core.c

   618	
   619	static int params_to_supp(struct tee_context *ctx,
   620				  struct tee_ioctl_param __user *uparams,
   621				  size_t num_params, struct tee_param *params)
   622	{
   623		size_t n;
   624	
   625		for (n = 0; n < num_params; n++) {
   626			struct tee_ioctl_param ip;
   627			struct tee_param *p = params + n;
   628	
   629			ip.attr = p->attr;
   630			switch (p->attr & TEE_IOCTL_PARAM_ATTR_TYPE_MASK) {
   631			case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
   632			case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
   633				ip.a = p->u.value.a;
   634				ip.b = p->u.value.b;
   635				ip.c = p->u.value.c;
   636				break;
   637			case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
   638			case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
   639			case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
 > 640				ip.a = (u64)p->u.ubuf.uaddr;
   641				ip.b = p->u.ubuf.size;
   642				ip.c = 0;
   643				break;
   644			case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
   645			case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
   646			case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
   647				ip.b = p->u.memref.size;
   648				if (!p->u.memref.shm) {
   649					ip.a = 0;
   650					ip.c = (u64)-1; /* invalid shm id */
   651					break;
   652				}
   653				ip.a = p->u.memref.shm_offs;
   654				ip.c = p->u.memref.shm->id;
   655				break;
   656			default:
   657				ip.a = 0;
   658				ip.b = 0;
   659				ip.c = 0;
   660				break;
   661			}
   662	
   663			if (copy_to_user(uparams + n, &ip, sizeof(ip)))
   664				return -EFAULT;
   665		}
   666	
   667		return 0;
   668	}
   669	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
