Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EADC0676A4F
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 00:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B65E10E07E;
	Sat, 21 Jan 2023 23:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F05C10E07E
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 23:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674343192; x=1705879192;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Tl4GLLg2pR9Ullfx+oNBNfH7suL+KxUNqsSZitlY8Lw=;
 b=Pu0hHsv47x/vIWnhyHPfGdt5qZ3p+tTzGtETpSsxhg/OV4BIVy/9P6mu
 FrGFd2GwrxWnsyd24Xv9RITZCU3dNoGTJNCn3zTHClMBQ9g4PurXwxBnd
 6dLlffNFj7fGllv11MMPhwfdgEBzuTFLfmL3xu9YiSM4ui/fTwe8WUwGZ
 ohCIpjihDDkeuRRDy91ouaEXATj8ZcKNNlw8OYe0SeD9WP7Wszl8eLm2f
 JTYwNkeUkGCpYD8M7zPFZ9d0oOiwkLeFfAUFRwpNnouKU7Knwf+GNiSmV
 XzTL4YcX3eT4qC2Yz3Pgu7QW6ObdinURPoK2v93lDF/SstZfIsgu+5N4m A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="324532027"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; d="scan'208";a="324532027"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2023 15:19:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="906364193"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; d="scan'208";a="906364193"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 21 Jan 2023 15:19:49 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pJN9I-0004ZC-24;
 Sat, 21 Jan 2023 23:19:48 +0000
Date: Sun, 22 Jan 2023 07:19:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 16/86] drm/drm_print: Minimize include footprint
Message-ID: <202301220750.HzZm1ZHu-lkp@intel.com>
References: <20230113-drm-include-v1-v1-16-c5cf72d8a5a2@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113-drm-include-v1-v1-16-c5cf72d8a5a2@ravnborg.org>
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
Cc: llvm@lists.linux.dev, Sam Ravnborg <sam@ravnborg.org>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

I love your patch! Yet something to improve:

[auto build test ERROR on 2e337a8d14bd4b04913d52ccf076be29d846acd7]

url:    https://github.com/intel-lab-lkp/linux/commits/Sam-Ravnborg-via-B4-Submission-Endpoint/drm-komeda-Direct-include-headers-from-drm_print/20230122-041306
base:   2e337a8d14bd4b04913d52ccf076be29d846acd7
patch link:    https://lore.kernel.org/r/20230113-drm-include-v1-v1-16-c5cf72d8a5a2%40ravnborg.org
patch subject: [PATCH 16/86] drm/drm_print: Minimize include footprint
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20230122/202301220750.HzZm1ZHu-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/530d852970d1a75527031a4f23689f89f0a85804
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sam-Ravnborg-via-B4-Submission-Endpoint/drm-komeda-Direct-include-headers-from-drm_print/20230122-041306
        git checkout 530d852970d1a75527031a4f23689f89f0a85804
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_mode_object.c:195:3: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   DRM_DEBUG("OBJ ID: %d (%d)\n", obj->id, kref_read(&obj->refcount));
                   ^
   include/drm/drm_print.h:565:2: note: expanded from macro 'DRM_DEBUG'
           __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:526:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/drm_mode_object.c:212:3: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   DRM_DEBUG("OBJ ID: %d (%d)\n", obj->id, kref_read(&obj->refcount));
                   ^
   include/drm/drm_print.h:565:2: note: expanded from macro 'DRM_DEBUG'
           __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:526:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   2 errors generated.
--
>> drivers/gpu/drm/drm_plane.c:278:3: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   DRM_DEBUG_KMS("out of memory when allocating plane\n");
                   ^
   include/drm/drm_print.h:573:2: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:526:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/drm_plane.c:305:3: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   DRM_DEBUG_KMS("out of memory when allocating plane\n");
                   ^
   include/drm/drm_print.h:573:2: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:526:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/drm_plane.c:789:3: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   DRM_DEBUG_KMS("Invalid crtc for plane\n");
                   ^
   include/drm/drm_print.h:573:2: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:526:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/drm_plane.c:797:3: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   DRM_DEBUG_KMS("Invalid pixel format %p4cc, modifier 0x%llx\n",
                   ^
   include/drm/drm_print.h:573:2: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:526:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/drm_plane.c:807:3: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   DRM_DEBUG_KMS("Invalid CRTC coordinates %ux%u+%d+%d\n",
                   ^
   include/drm/drm_print.h:573:2: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:526:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/drm_plane.c:985:3: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   DRM_DEBUG_KMS("Unknown plane ID %d\n",
                   ^
   include/drm/drm_print.h:573:2: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:526:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/drm_plane.c:993:4: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           DRM_DEBUG_KMS("Unknown framebuffer ID %d\n",
                           ^
   include/drm/drm_print.h:573:2: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:526:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/drm_plane.c:1001:4: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           DRM_DEBUG_KMS("Unknown crtc ID %d\n",
                           ^
   include/drm/drm_print.h:573:2: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:526:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/drm_plane.c:1051:5: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                                   DRM_DEBUG_KMS("failed to wrap cursor buffer in drm framebuffer\n");
                                   ^
   include/drm/drm_print.h:573:2: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:526:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/drm_plane.c:1122:3: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   DRM_DEBUG_KMS("Unknown CRTC ID %d\n", req->crtc_id);
                   ^
   include/drm/drm_print.h:573:2: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:526:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/drm_plane.c:1263:5: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                                   DRM_DEBUG("Invalid absolute flip target %u, "
                                   ^
   include/drm/drm_print.h:565:2: note: expanded from macro 'DRM_DEBUG'
           __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:526:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/drm_plane.c:1272:5: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                                   DRM_DEBUG("Invalid relative flip target %u, "
--
>> drivers/gpu/drm/drm_syncobj.c:301:3: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   DRM_DEBUG("You are adding an unorder point to timeline!\n");
                   ^
   include/drm/drm_print.h:565:2: note: expanded from macro 'DRM_DEBUG'
           __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:526:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   1 error generated.
--
>> drivers/gpu/drm/drm_vblank.c:318:3: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   drm_dbg_vbl(dev, "crtc %u: Calculating number of vblanks."
                   ^
   include/drm/drm_print.h:499:2: note: expanded from macro 'drm_dbg_vbl'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:412:2: note: expanded from macro 'drm_dev_dbg'
           _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
           ^
   drivers/gpu/drm/drm_vblank.c:342:3: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   drm_dbg_vbl(dev,
                   ^
   include/drm/drm_print.h:499:2: note: expanded from macro 'drm_dbg_vbl'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:412:2: note: expanded from macro 'drm_dev_dbg'
           _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
           ^
   drivers/gpu/drm/drm_vblank.c:348:2: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           drm_dbg_vbl(dev, "updating vblank count on crtc %u:"
           ^
   include/drm/drm_print.h:499:2: note: expanded from macro 'drm_dbg_vbl'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:412:2: note: expanded from macro 'drm_dev_dbg'
           _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
           ^
   drivers/gpu/drm/drm_vblank.c:494:3: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   drm_dbg_core(dev, "disabling vblank on crtc %u\n", pipe);
                   ^
   include/drm/drm_print.h:489:2: note: expanded from macro 'drm_dbg_core'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:412:2: note: expanded from macro 'drm_dev_dbg'
           _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
           ^
   drivers/gpu/drm/drm_vblank.c:649:2: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           drm_dbg_core(dev,
           ^
   include/drm/drm_print.h:489:2: note: expanded from macro 'drm_dbg_core'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:412:2: note: expanded from macro 'drm_dev_dbg'
           _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
           ^
   drivers/gpu/drm/drm_vblank.c:726:3: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   drm_dbg_core(dev, "crtc %u: Noop due to uninitialized mode.\n",
                   ^
   include/drm/drm_print.h:489:2: note: expanded from macro 'drm_dbg_core'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:412:2: note: expanded from macro 'drm_dev_dbg'
           _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
           ^
   drivers/gpu/drm/drm_vblank.c:751:4: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           drm_dbg_core(dev,
                           ^
   include/drm/drm_print.h:489:2: note: expanded from macro 'drm_dbg_core'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:412:2: note: expanded from macro 'drm_dev_dbg'
           _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
           ^
   drivers/gpu/drm/drm_vblank.c:767:3: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   drm_dbg_core(dev,
                   ^
   include/drm/drm_print.h:489:2: note: expanded from macro 'drm_dbg_core'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:412:2: note: expanded from macro 'drm_dev_dbg'
           _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
           ^
   drivers/gpu/drm/drm_vblank.c:793:2: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           drm_dbg_vbl(dev,
           ^
   include/drm/drm_print.h:499:2: note: expanded from macro 'drm_dbg_vbl'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:412:2: note: expanded from macro 'drm_dev_dbg'
           _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
           ^
   drivers/gpu/drm/drm_vblank.c:1140:3: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   drm_dbg_core(dev, "enabling vblank on crtc %u, ret: %d\n",
                   ^
   include/drm/drm_print.h:489:2: note: expanded from macro 'drm_dbg_core'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:412:2: note: expanded from macro 'drm_dev_dbg'
           _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
           ^
   drivers/gpu/drm/drm_vblank.c:1319:2: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
           ^
   include/drm/drm_print.h:499:2: note: expanded from macro 'drm_dbg_vbl'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:412:2: note: expanded from macro 'drm_dev_dbg'
           _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
           ^
   drivers/gpu/drm/drm_vblank.c:1452:2: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
--
>> drivers/gpu/drm/drm_vblank_work.c:141:3: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   drm_dbg_core(dev,
                   ^
   include/drm/drm_print.h:489:2: note: expanded from macro 'drm_dbg_core'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:412:2: note: expanded from macro 'drm_dev_dbg'
           _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
           ^
   1 error generated.
--
>> drivers/gpu/drm/drm_ioctl.c:443:2: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           drm_dbg_core(dev, "\n");
           ^
   include/drm/drm_print.h:489:2: note: expanded from macro 'drm_dbg_core'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:412:2: note: expanded from macro 'drm_dev_dbg'
           _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
           ^
   drivers/gpu/drm/drm_ioctl.c:859:2: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           drm_dbg_core(dev, "comm=\"%s\" pid=%d, dev=0x%lx, auth=%d, %s\n",
           ^
   include/drm/drm_print.h:489:2: note: expanded from macro 'drm_dbg_core'
           drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:412:2: note: expanded from macro 'drm_dev_dbg'
           _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
           ^
   2 errors generated.
--
>> drivers/gpu/drm/drm_bufs.c:174:2: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           DRM_DEBUG("offset = 0x%08llx, size = 0x%08lx, type = %d\n",
           ^
   include/drm/drm_print.h:565:2: note: expanded from macro 'DRM_DEBUG'
           __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:526:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/drm_bufs.c:911:2: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           DRM_DEBUG("count=%d, size=%d (%d), order=%d\n",
           ^
   include/drm/drm_print.h:565:2: note: expanded from macro 'DRM_DEBUG'
           __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:526:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/drm_bufs.c:1139:2: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           DRM_DEBUG("count:      %d\n", count);
           ^
   include/drm/drm_print.h:565:2: note: expanded from macro 'DRM_DEBUG'
           __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:526:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/drm_bufs.c:1343:2: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           DRM_DEBUG("count = %d\n", count);
           ^
   include/drm/drm_print.h:565:2: note: expanded from macro 'DRM_DEBUG'
           __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:526:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/drm_bufs.c:1420:2: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           DRM_DEBUG("%d, %d, %d\n",
           ^
   include/drm/drm_print.h:565:2: note: expanded from macro 'DRM_DEBUG'
           __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:526:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/drm_bufs.c:1468:2: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           DRM_DEBUG("%d\n", request->count);
           ^
   include/drm/drm_print.h:565:2: note: expanded from macro 'DRM_DEBUG'
           __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:526:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   drivers/gpu/drm/drm_bufs.c:1568:2: error: implicit declaration of function '_dynamic_func_call_cls' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           DRM_DEBUG("%d buffers, retcode = %d\n", *p, retcode);
           ^
   include/drm/drm_print.h:565:2: note: expanded from macro 'DRM_DEBUG'
           __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:526:2: note: expanded from macro '__drm_dbg'
           _dynamic_func_call_cls(cat, fmt, ___drm_dbg,                    \
           ^
   7 errors generated.
..


vim +/_dynamic_func_call_cls +195 drivers/gpu/drm/drm_mode_object.c

949619f32eee37 Daniel Vetter  2016-08-29  183  
949619f32eee37 Daniel Vetter  2016-08-29  184  /**
020a218f95bd3c Thierry Reding 2017-02-28  185   * drm_mode_object_put - release a mode object reference
020a218f95bd3c Thierry Reding 2017-02-28  186   * @obj: DRM mode object
949619f32eee37 Daniel Vetter  2016-08-29  187   *
a2511a557eb868 Daniel Vetter  2016-08-29  188   * This function decrements the object's refcount if it is a refcounted modeset
949619f32eee37 Daniel Vetter  2016-08-29  189   * object. It is a no-op on any other object. This is used to drop references
020a218f95bd3c Thierry Reding 2017-02-28  190   * acquired with drm_mode_object_get().
949619f32eee37 Daniel Vetter  2016-08-29  191   */
020a218f95bd3c Thierry Reding 2017-02-28  192  void drm_mode_object_put(struct drm_mode_object *obj)
949619f32eee37 Daniel Vetter  2016-08-29  193  {
949619f32eee37 Daniel Vetter  2016-08-29  194  	if (obj->free_cb) {
2c935bc57221cc Peter Zijlstra 2016-11-14 @195  		DRM_DEBUG("OBJ ID: %d (%d)\n", obj->id, kref_read(&obj->refcount));
949619f32eee37 Daniel Vetter  2016-08-29  196  		kref_put(&obj->refcount, obj->free_cb);
949619f32eee37 Daniel Vetter  2016-08-29  197  	}
949619f32eee37 Daniel Vetter  2016-08-29  198  }
020a218f95bd3c Thierry Reding 2017-02-28  199  EXPORT_SYMBOL(drm_mode_object_put);
949619f32eee37 Daniel Vetter  2016-08-29  200  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
