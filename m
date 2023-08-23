Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E47785806
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 14:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E3410E41B;
	Wed, 23 Aug 2023 12:48:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CAB10E41B;
 Wed, 23 Aug 2023 12:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692794886; x=1724330886;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CbXqawBEj7B2MEs7M6/kZuQALHKhJDp66dmB2oKp/CY=;
 b=DoEye+2qicHxD2xkLBrqVh8Cwz7prDddRCoN0gUNrYM6oajPZFJnGLe1
 Bs8YZQmMuhfK5pY6S52Hrh4mVAikGCOZYgCn4nB/vV1gwRJ0SasjK8oIp
 l7Dr+keRi+0rZpAAVSLniDViwx8sMYspFGBxOArzQgFeU0yjQ0o8OTPya
 XD6yJXBpP7WtIScEmQmkEkSq6DGGtpg2VpKhgnBnYh9oMiqqz/F53NF07
 ADeecG5zk0CWt2KkJDgtvizTp1M5cPZD3zw0RKt2A2Cj7BjA375DL/4VK
 gxzgYYcDj3swxj2LzDnux8Z3UDriQguWn4jJotcRCaJMF2+sLvMxkEfVw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="376875974"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="376875974"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 05:47:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="771707188"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="771707188"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 23 Aug 2023 05:47:04 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qYnGJ-0001Cl-36;
 Wed, 23 Aug 2023 12:47:03 +0000
Date: Wed, 23 Aug 2023 20:46:05 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 faith.ekstrand@collabora.com
Subject: Re: [PATCH drm-misc-next] drm/nouveau: uapi: don't pass NO_PREFETCH
 flag implicitly
Message-ID: <202308232030.0r1irPMu-lkp@intel.com>
References: <20230822234139.11185-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822234139.11185-1-dakr@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ad1367f831f8743746a1f49705c28e36a7c95525]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-nouveau-uapi-don-t-pass-NO_PREFETCH-flag-implicitly/20230823-074237
base:   ad1367f831f8743746a1f49705c28e36a7c95525
patch link:    https://lore.kernel.org/r/20230822234139.11185-1-dakr%40redhat.com
patch subject: [PATCH drm-misc-next] drm/nouveau: uapi: don't pass NO_PREFETCH flag implicitly
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308232030.0r1irPMu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308232030.0r1irPMu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/uapi/drm/nouveau_drm.h:344: warning: Incorrect use of kernel-doc format:          * flags: the flags for this push buffer mapping
>> ./include/uapi/drm/nouveau_drm.h:348: warning: Function parameter or member 'flags' not described in 'drm_nouveau_exec_push'

vim +344 ./include/uapi/drm/nouveau_drm.h

   327	
   328	/**
   329	 * struct drm_nouveau_exec_push - EXEC push operation
   330	 *
   331	 * This structure represents a single EXEC push operation. UMDs should pass an
   332	 * array of this structure via struct drm_nouveau_exec's &push_ptr field.
   333	 */
   334	struct drm_nouveau_exec_push {
   335		/**
   336		 * @va: the virtual address of the push buffer mapping
   337		 */
   338		__u64 va;
   339		/**
   340		 * @va_len: the length of the push buffer mapping
   341		 */
   342		__u32 va_len;
   343		/**
 > 344		 * flags: the flags for this push buffer mapping
   345		 */
   346		__u32 flags;
   347	#define DRM_NOUVEAU_EXEC_PUSH_NO_PREFETCH 0x1
 > 348	};
   349	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
