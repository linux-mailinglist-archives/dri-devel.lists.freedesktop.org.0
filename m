Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA58B03939
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 10:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3621A10E043;
	Mon, 14 Jul 2025 08:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GA9ew2ME";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2B410E043
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 08:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752481353; x=1784017353;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9FsRu860H4W8OcEf2wpkIXNWWM6nplf11dSrJZDLgQo=;
 b=GA9ew2MEHpMjmhO4xz7yYL3hefsbIhIdxLD8faYaRAQElH8UfSqzNBe/
 pE/LT+9ZvFTH2rS4805im55eqnxDvxzqRxdLszgNMbKIUnsCVHLK4U+au
 B//qpzpstjxvGM5VMD15ZyIQqPuiX0XojuSBij73G+7BZw6shjRCQecdW
 2U7TwhvTulHRlGYbbKfcfjazMEzOmFWP6CMiNEn0JVIv2kiBoy16VlXjs
 v0CZWR5aL8/pQoGIeiXCA06cCrmP8mFR+gmLhcTD0Jjc37chRl/hJAXdu
 uSM+dAt0Kmr662vrByBpeP/vCRwjyZ9AGbBDImqmLstLOmzVfsR0yO1s1 Q==;
X-CSE-ConnectionGUID: bHVYOiCVSNOoldI1zF5xww==
X-CSE-MsgGUID: L0GpnCduTjq6Ww5CytcXgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54602479"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="54602479"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 01:22:32 -0700
X-CSE-ConnectionGUID: FhSDe/JRREeFxD2jxZltkg==
X-CSE-MsgGUID: 5L5J8xCsTwSdnL9D+kQEwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="162544044"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 14 Jul 2025 01:22:27 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ubES8-0008gJ-1W;
 Mon, 14 Jul 2025 08:22:24 +0000
Date: Mon, 14 Jul 2025 16:22:15 +0800
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
Subject: Re: [PATCH v6 08/12] firmware: qcom: tzmem: export shm_bridge
 create/delete
Message-ID: <202507141458.kBLqFFYk-lkp@intel.com>
References: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-8-697fb7d41c36@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-8-697fb7d41c36@oss.qualcomm.com>
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

[auto build test WARNING on 835244aba90de290b4b0b1fa92b6734f3ee7b3d9]

url:    https://github.com/intel-lab-lkp/linux/commits/Amirreza-Zarrabi/tee-allow-a-driver-to-allocate-a-tee_device-without-a-pool/20250714-085215
base:   835244aba90de290b4b0b1fa92b6734f3ee7b3d9
patch link:    https://lore.kernel.org/r/20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-8-697fb7d41c36%40oss.qualcomm.com
patch subject: [PATCH v6 08/12] firmware: qcom: tzmem: export shm_bridge create/delete
config: arc-randconfig-001-20250714 (https://download.01.org/0day-ci/archive/20250714/202507141458.kBLqFFYk-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250714/202507141458.kBLqFFYk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507141458.kBLqFFYk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:5,
                    from drivers/firmware/qcom/qcom_tzmem.c:10:
   drivers/firmware/qcom/qcom_tzmem.c: In function 'qcom_tzmem_shm_bridge_create':
>> drivers/firmware/qcom/qcom_tzmem.c:139:27: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
      dev_err(qcom_tzmem_dev, "SHM Bridge failed: ret %d paddr 0x%llx, size%zu\n",
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:16: note: in definition of macro 'dev_printk_index_wrap'
      _p_func(dev, fmt, ##__VA_ARGS__);   \
                   ^~~
   include/linux/dev_printk.h:154:49: note: in expansion of macro 'dev_fmt'
     dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                    ^~~~~~~
   drivers/firmware/qcom/qcom_tzmem.c:139:3: note: in expansion of macro 'dev_err'
      dev_err(qcom_tzmem_dev, "SHM Bridge failed: ret %d paddr 0x%llx, size%zu\n",
      ^~~~~~~


vim +139 drivers/firmware/qcom/qcom_tzmem.c

   110	
   111	/**
   112	 * qcom_tzmem_shm_bridge_create() - Create a SHM bridge.
   113	 * @paddr: Physical address of the memory to share.
   114	 * @size: Size of the memory to share.
   115	 * @handle: Handle to the SHM bridge.
   116	 *
   117	 * On platforms that support SHM bridge, this function creates a SHM bridge
   118	 * for the given memory region with QTEE. The handle returned by this function
   119	 * must be passed to qcom_tzmem_shm_bridge_delete() to free the SHM bridge.
   120	 *
   121	 * Return: On success, returns 0; on failure, returns < 0.
   122	 */
   123	int qcom_tzmem_shm_bridge_create(phys_addr_t paddr, size_t size, u64 *handle)
   124	{
   125		u64 pfn_and_ns_perm, ipfn_and_s_perm, size_and_flags;
   126		int ret;
   127	
   128		if (!qcom_tzmem_using_shm_bridge)
   129			return 0;
   130	
   131		pfn_and_ns_perm = paddr | QCOM_SCM_PERM_RW;
   132		ipfn_and_s_perm = paddr | QCOM_SCM_PERM_RW;
   133		size_and_flags = size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
   134	
   135		ret = qcom_scm_shm_bridge_create(pfn_and_ns_perm, ipfn_and_s_perm,
   136						 size_and_flags, QCOM_SCM_VMID_HLOS,
   137						 handle);
   138		if (ret) {
 > 139			dev_err(qcom_tzmem_dev, "SHM Bridge failed: ret %d paddr 0x%llx, size%zu\n",
   140				ret, paddr, size);
   141	
   142			return ret;
   143		}
   144	
   145		return 0;
   146	}
   147	EXPORT_SYMBOL_GPL(qcom_tzmem_shm_bridge_create);
   148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
