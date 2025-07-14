Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FBFB04780
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 20:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938AD10E340;
	Mon, 14 Jul 2025 18:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/5Wi5XG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345DC10E34D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 18:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752519000; x=1784055000;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=g/hdVwW4OrDEpaJ2jeOYNUGdpDfpOP3FpqeHfrFX5Q4=;
 b=Q/5Wi5XG/r3ORiK1NWOXokARlcxVTpci73W9MXqRjFYhC7rW6ox/H5x5
 xfg03zuhHfu/zjGFMANRASIbpPcR7eoS3vysSLmsINcGWS5xZyZceSJnF
 bNRNZ7qf8/o+SH0gVlQDe+IvLB2DmUz5p5jJhJr6MRfyzSxFvZRGcCa4v
 JDGZuB3251+cOVD5D7p7rpPz1YasG6mftsj+3/0GPZpdldi9Vp73y1EBQ
 /90PEsHuNAV2nGCwkWR32a3Zw9BDIZkpi4XGpn38CvVwkEmTZOcwWpAUE
 QD6unEDOVzKSWeFylEgEkSeoM34PRxnSSocAoEP6/arqWXO0CbPDH7oTl Q==;
X-CSE-ConnectionGUID: bAX9sIaaSPGDYUCthL6G0g==
X-CSE-MsgGUID: AaeBNqwMRtOimEzSjRSDdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="66171356"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="66171356"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 11:50:00 -0700
X-CSE-ConnectionGUID: n6iP6M2LTgWMCXmgik1TTw==
X-CSE-MsgGUID: LOJAA0uFQLidXjoFjsHfaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="156651276"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 14 Jul 2025 11:49:54 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ubOFM-0009EJ-1n;
 Mon, 14 Jul 2025 18:49:52 +0000
Date: Tue, 15 Jul 2025 02:49:15 +0800
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
Subject: Re: [PATCH v6 09/12] tee: add Qualcomm TEE driver
Message-ID: <202507150221.oWiaX1I9-lkp@intel.com>
References: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-9-697fb7d41c36@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-9-697fb7d41c36@oss.qualcomm.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 835244aba90de290b4b0b1fa92b6734f3ee7b3d9]

url:    https://github.com/intel-lab-lkp/linux/commits/Amirreza-Zarrabi/tee-allow-a-driver-to-allocate-a-tee_device-without-a-pool/20250714-085215
base:   835244aba90de290b4b0b1fa92b6734f3ee7b3d9
patch link:    https://lore.kernel.org/r/20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-9-697fb7d41c36%40oss.qualcomm.com
patch subject: [PATCH v6 09/12] tee: add Qualcomm TEE driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250715/202507150221.oWiaX1I9-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507150221.oWiaX1I9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507150221.oWiaX1I9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/tee/qcomtee/qcomtee.h:12,
                    from drivers/tee/qcomtee/async.c:8:
   drivers/tee/qcomtee/qcomtee_msg.h: In function 'qcomtee_msg_num_ib':
>> drivers/tee/qcomtee/qcomtee_msg.h:172:16: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     172 |         return FIELD_GET(QCOMTEE_MASK_IB, counts);
         |                ^~~~~~~~~
--
   In file included from drivers/tee/qcomtee/qcomtee.h:12,
                    from drivers/tee/qcomtee/core.c:14:
   drivers/tee/qcomtee/qcomtee_msg.h: In function 'qcomtee_msg_num_ib':
>> drivers/tee/qcomtee/qcomtee_msg.h:172:16: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     172 |         return FIELD_GET(QCOMTEE_MASK_IB, counts);
         |                ^~~~~~~~~
   drivers/tee/qcomtee/core.c: In function 'qcomtee_object_user_init':
   drivers/tee/qcomtee/core.c:303:17: warning: function 'qcomtee_object_user_init' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     303 |                 object->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
         |                 ^~~~~~
   drivers/tee/qcomtee/core.c: In function 'qcomtee_prepare_msg':
   drivers/tee/qcomtee/core.c:417:26: error: implicit declaration of function 'copy_from_user' [-Wimplicit-function-declaration]
     417 |                 else if (copy_from_user(ptr, u[i].b.uaddr, u[i].b.size))
         |                          ^~~~~~~~~~~~~~
   drivers/tee/qcomtee/core.c: In function 'qcomtee_update_args':
   drivers/tee/qcomtee/core.c:496:26: error: implicit declaration of function 'copy_to_user' [-Wimplicit-function-declaration]
     496 |                 else if (copy_to_user(u[i].b.uaddr, ptr, u[i].b.size))
         |                          ^~~~~~~~~~~~
--
   In file included from drivers/tee/qcomtee/qcomtee.h:12,
                    from drivers/tee/qcomtee/user_obj.c:10:
   drivers/tee/qcomtee/qcomtee_msg.h: In function 'qcomtee_msg_num_ib':
>> drivers/tee/qcomtee/qcomtee_msg.h:172:16: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     172 |         return FIELD_GET(QCOMTEE_MASK_IB, counts);
         |                ^~~~~~~~~
   drivers/tee/qcomtee/user_obj.c: In function 'qcomtee_cb_params_from_args':
   drivers/tee/qcomtee/user_obj.c:449:29: error: implicit declaration of function 'copy_to_user' [-Wimplicit-function-declaration]
     449 |                         if (copy_to_user(params[i].u.ubuf.uaddr, u[i].b.addr,
         |                             ^~~~~~~~~~~~
   drivers/tee/qcomtee/user_obj.c: In function 'qcomtee_cb_params_to_args':
   drivers/tee/qcomtee/user_obj.c:526:29: error: implicit declaration of function 'copy_from_user' [-Wimplicit-function-declaration]
     526 |                         if (copy_from_user(u[i].b.addr, params[i].u.ubuf.uaddr,
         |                             ^~~~~~~~~~~~~~


vim +/FIELD_GET +172 drivers/tee/qcomtee/qcomtee_msg.h

   169	
   170	static inline unsigned int qcomtee_msg_num_ib(u32 counts)
   171	{
 > 172		return FIELD_GET(QCOMTEE_MASK_IB, counts);
   173	}
   174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
