Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C8CBA206B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 02:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB27E10E099;
	Fri, 26 Sep 2025 00:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e+L05NGy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A1610E099
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 00:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758845385; x=1790381385;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rCHV2gEQn70XE/Sefd9OpykTQf7v/OKrHzYHCAgvBrM=;
 b=e+L05NGyjcUErloXJOz0nEPThh+aa8kyP4q7vuM6krY5MGiKmPwYgFtE
 bdXEc0ZuxVoLBbW56/5jQlQSdel8MRya0/GWoE0AvxQtDk4lyFu838IGR
 nrbk1sylaWSQIo0Q7MyPvqS6ebo1Ue/HbWRIElxACwg0QOA+PKo7rrJU1
 6KJB/S5bGLGiQqL0l71z3jTW5OvvBL3FhKAYAA19yZV6CsExXMT1G6rVK
 e+NS7fI+iWt5mtQDK37SlQzrBcZmLpVgX2D5a/mXP+Bc0SZfhMxBs5eJv
 JvDjEy/BH49+Uzy6NA2wY4TenpIdysWhBpIfC0oSE59gSfrni/V42FRjx A==;
X-CSE-ConnectionGUID: 2qCIH+fdQAuVhURy/Vt7FQ==
X-CSE-MsgGUID: B0QUfR56SeKg4D59XyDe0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78610959"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="78610959"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 17:09:44 -0700
X-CSE-ConnectionGUID: /XXu750FRjWG6kXmsGY3fw==
X-CSE-MsgGUID: ThZddzr1QGm/G/5mxTbx7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="177304580"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
 by orviesa007.jf.intel.com with ESMTP; 25 Sep 2025 17:09:41 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v1w1p-0005k1-2w;
 Fri, 26 Sep 2025 00:09:37 +0000
Date: Fri, 26 Sep 2025 08:08:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] misc: fastrpc: Add support for new DSP IOVA formatting
Message-ID: <202509260727.MrXkGDmN-lkp@intel.com>
References: <20250924-knp-fastrpc-v1-1-4b40f8bfce1d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-fastrpc-v1-1-4b40f8bfce1d@oss.qualcomm.com>
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

Hi Jingyi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ae2d20002576d2893ecaff25db3d7ef9190ac0b6]

url:    https://github.com/intel-lab-lkp/linux/commits/Jingyi-Wang/misc-fastrpc-Add-support-for-new-DSP-IOVA-formatting/20250925-074855
base:   ae2d20002576d2893ecaff25db3d7ef9190ac0b6
patch link:    https://lore.kernel.org/r/20250924-knp-fastrpc-v1-1-4b40f8bfce1d%40oss.qualcomm.com
patch subject: [PATCH 1/2] misc: fastrpc: Add support for new DSP IOVA formatting
config: x86_64-buildonly-randconfig-005-20250926 (https://download.01.org/0day-ci/archive/20250926/202509260727.MrXkGDmN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509260727.MrXkGDmN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509260727.MrXkGDmN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/fastrpc.c:2296:34: warning: 'qcom_soc_match_table' defined but not used [-Wunused-const-variable=]
    2296 | static const struct of_device_id qcom_soc_match_table[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~


vim +/qcom_soc_match_table +2296 drivers/misc/fastrpc.c

  2295	
> 2296	static const struct of_device_id qcom_soc_match_table[] = {
  2297		{ .compatible = "qcom,kaanapali", .data = &kaanapali_soc_data },
  2298		{},
  2299	};
  2300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
