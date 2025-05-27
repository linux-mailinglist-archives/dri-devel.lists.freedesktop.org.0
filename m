Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9B6AC5C33
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 23:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E4110E560;
	Tue, 27 May 2025 21:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HSldrSXH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D060A10E55B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 21:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748381325; x=1779917325;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pvfxwe5X86PEZiMzFXgJ3ebwhN+gbHIPHFzJHUdFvdU=;
 b=HSldrSXHeOIlY/af5PdNpFCskc4aZ7u+6X92QcsmeJ+kkNsUe5Fw1vHi
 ZcieUnnNmk3ImYIpekFJRi+LjMbBtP7GX4mtCdwKhyxd8fTxKI2ZwqQ7j
 UhQkKF4Za1xyiKkk0CYKdoS9JwV6X5U0+McUSy6jAni3Q0xfp4y26+bmP
 2Y1Z+66GSLx9/WgI2+xE7r3SjVBbWdVs4zbCUcEuvJbyErex4oAdJnzfz
 DLvpMXD2UboHjGejXkF9rDV37HUF1wEC9e+C3RlCsxNhMfhekYSOTx+ne
 i6tZzrERAPlVIKtzwibCY8kYVxQCvXrHF+mPedLVtpnwm5RZ+ucPHa6u3 A==;
X-CSE-ConnectionGUID: VLno73f8RlmNz4ZaR/EMXw==
X-CSE-MsgGUID: fkQtakPETJmWMYWKxKtatw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50390367"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="50390367"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 14:28:39 -0700
X-CSE-ConnectionGUID: hfdT22DnS6m7rAqHRMUh6Q==
X-CSE-MsgGUID: dv0lT3O0QW2I1eH/5eXZTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="143953217"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 27 May 2025 14:28:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uK1qZ-000V1c-1Y;
 Tue, 27 May 2025 21:28:31 +0000
Date: Wed, 28 May 2025 05:28:14 +0800
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
Subject: Re: [PATCH v5 09/12] tee: add Qualcomm TEE driver
Message-ID: <202505280538.DVSrdWK7-lkp@intel.com>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-9-024e3221b0b9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-9-024e3221b0b9@oss.qualcomm.com>
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

[auto build test WARNING on 3be1a7a31fbda82f3604b6c31e4f390110de1b46]

url:    https://github.com/intel-lab-lkp/linux/commits/Amirreza-Zarrabi/tee-allow-a-driver-to-allocate-a-tee_device-without-a-pool/20250527-151020
base:   3be1a7a31fbda82f3604b6c31e4f390110de1b46
patch link:    https://lore.kernel.org/r/20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-9-024e3221b0b9%40oss.qualcomm.com
patch subject: [PATCH v5 09/12] tee: add Qualcomm TEE driver
config: i386-randconfig-062-20250528 (https://download.01.org/0day-ci/archive/20250528/202505280538.DVSrdWK7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280538.DVSrdWK7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280538.DVSrdWK7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tee/qcomtee/call.c:227:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *uaddr @@     got void *[noderef] uaddr @@
   drivers/tee/qcomtee/call.c:227:38: sparse:     expected void [noderef] __user *uaddr
   drivers/tee/qcomtee/call.c:227:38: sparse:     got void *[noderef] uaddr

vim +227 drivers/tee/qcomtee/call.c

   203	
   204	/**
   205	 * qcomtee_params_to_args() - Convert TEE parameters to QTEE arguments.
   206	 * @u: QTEE arguments.
   207	 * @params: TEE parameters.
   208	 * @num_params: number of elements in the parameter array.
   209	 * @ctx: context in which the conversion should happen.
   210	 *
   211	 * It assumes @u has at least @num_params + 1 entries and has been initialized
   212	 * with %QCOMTEE_ARG_TYPE_INV as &struct qcomtee_arg.type.
   213	 *
   214	 * Return: On success, returns 0; on failure, returns < 0.
   215	 */
   216	static int qcomtee_params_to_args(struct qcomtee_arg *u,
   217					  struct tee_param *params, int num_params,
   218					  struct tee_context *ctx)
   219	{
   220		int i;
   221	
   222		for (i = 0; i < num_params; i++) {
   223			switch (params[i].attr) {
   224			case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
   225			case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
   226				u[i].flags = QCOMTEE_ARG_FLAGS_UADDR;
 > 227				u[i].b.uaddr = params[i].u.ubuf.uaddr;
   228				u[i].b.size = params[i].u.ubuf.size;
   229	
   230				if (params[i].attr ==
   231				    TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT)
   232					u[i].type = QCOMTEE_ARG_TYPE_IB;
   233				else /* TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT */
   234					u[i].type = QCOMTEE_ARG_TYPE_OB;
   235	
   236				break;
   237			case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
   238				u[i].type = QCOMTEE_ARG_TYPE_IO;
   239				if (qcomtee_objref_to_arg(&u[i], &params[i], ctx))
   240					goto out_failed;
   241	
   242				break;
   243			case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
   244				u[i].type = QCOMTEE_ARG_TYPE_OO;
   245				u[i].o = NULL_QCOMTEE_OBJECT;
   246				break;
   247			default:
   248				goto out_failed;
   249			}
   250		}
   251	
   252		return 0;
   253	
   254	out_failed:
   255		/* Undo qcomtee_objref_to_arg(). */
   256		for (i--; i >= 0; i--) {
   257			if (u[i].type != QCOMTEE_ARG_TYPE_IO)
   258				continue;
   259	
   260			qcomtee_user_object_set_notify(u[i].o, false);
   261			if (typeof_qcomtee_object(u[i].o) == QCOMTEE_OBJECT_TYPE_CB)
   262				qcomtee_object_put(u[i].o);
   263	
   264			qcomtee_object_put(u[i].o);
   265		}
   266	
   267		return -EINVAL;
   268	}
   269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
