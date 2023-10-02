Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D31017B4B83
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 08:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC0010E1A2;
	Mon,  2 Oct 2023 06:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2363410E122;
 Mon,  2 Oct 2023 06:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696228475; x=1727764475;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ohMoN0O13vl59/T1Y4daJDp+6LTZG589rbJO6FTJaDA=;
 b=JiFrxD+p/fQnQoAwocTEp53E8IY/om3ErfRtkJhwZ1kcBQq/SQbErDfa
 C3gxSOEGZLPlFWpylJC4qbv4aBrOJ9LYuq42yt2gWoLn4OuLaSPBoTREd
 7cohv6b12rBom+F6H69KSfhm9KheVlonF2iYeXTTJiegTbYLrp+eMvMOd
 I+0swh17rvT1CEVwjOitmuvHgnpLAZLeinF2Hwopt8mdqlPhRqa0C3Otd
 aE86Bimvr6bI2d4XFxxMAm4S4pW2AvKKWr0rMagyLw8uM2lkUC1ViV4hV
 Aa4NWFceSUxooi6XTeDPONFUbgkBf5T7q7ah1gM/c+MWyU+kAzK1R5YzV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="468868675"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; d="scan'208";a="468868675"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2023 23:34:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="840902494"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; d="scan'208";a="840902494"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 01 Oct 2023 23:34:30 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qnCVg-0005p5-24;
 Mon, 02 Oct 2023 06:34:28 +0000
Date: Mon, 2 Oct 2023 14:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith@gfxstrand.net
Subject: Re: [PATCH drm-misc-next v5 3/6] drm/gpuvm: add an abstraction for a
 VM / BO combination
Message-ID: <202310021416.3jqeZtQG-lkp@intel.com>
References: <20230928191624.13703-4-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928191624.13703-4-dakr@redhat.com>
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

[auto build test WARNING on a4ead6e37e3290cff399e2598d75e98777b69b37]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-gpuvm-add-common-dma-resv-per-struct-drm_gpuvm/20230929-031831
base:   a4ead6e37e3290cff399e2598d75e98777b69b37
patch link:    https://lore.kernel.org/r/20230928191624.13703-4-dakr%40redhat.com
patch subject: [PATCH drm-misc-next v5 3/6] drm/gpuvm: add an abstraction for a VM / BO combination
reproduce: (https://download.01.org/0day-ci/archive/20231002/202310021416.3jqeZtQG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310021416.3jqeZtQG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/drm/drm_gpuvm.h:464: warning: Function parameter or member 'vm' not described in 'drm_gpuvm_bo'

vim +464 ./include/drm/drm_gpuvm.h

   427	
   428		/**
   429		 * @gpuvm: The &drm_gpuvm the @obj is mapped in.
   430		 */
   431		struct drm_gpuvm *vm;
   432	
   433		/**
   434		 * @obj: The &drm_gem_object being mapped in the @gpuvm.
   435		 */
   436		struct drm_gem_object *obj;
   437	
   438		/**
   439		 * @kref: The reference count for this &drm_gpuvm_bo.
   440		 */
   441		struct kref kref;
   442	
   443		/**
   444		 * @list: Structure containing all &list_heads.
   445		 */
   446		struct {
   447			/**
   448			 * @gpuva: The list of linked &drm_gpuvas.
   449			 */
   450			struct list_head gpuva;
   451	
   452			/**
   453			 * @entry: Structure containing all &list_heads serving as
   454			 * entry.
   455			 */
   456			struct {
   457				/**
   458				 * @gem: List entry to attach to the &drm_gem_objects
   459				 * gpuva list.
   460				 */
   461				struct list_head gem;
   462			} entry;
   463		} list;
 > 464	};
   465	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
