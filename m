Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC52B23DA46
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 14:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2BD86E161;
	Thu,  6 Aug 2020 12:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497296E8B4;
 Thu,  6 Aug 2020 12:22:40 +0000 (UTC)
IronPort-SDR: W24M0ByA8iJdnTpgdUtlZtqudJDEquC9xEV8fZ0Z/PqrCWMFvxzAYPwktAJllb0ceU/a90vdNG
 OmQTKIKL3ueA==
X-IronPort-AV: E=McAfee;i="6000,8403,9704"; a="132868937"
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; 
 d="gz'50?scan'50,208,50";a="132868937"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2020 05:22:39 -0700
IronPort-SDR: 3ubOpo1ans08TXW/DYCr31n0FNW+UHX1u0QjxhjJ0Y7cnX5ytUcw3llbVTgZsfHsPaevmzM7J6
 e34HsE+7qPbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; 
 d="gz'50?scan'50,208,50";a="397229663"
Received: from lkp-server02.sh.intel.com (HELO 37a337f97289) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 06 Aug 2020 05:22:36 -0700
Received: from kbuild by 37a337f97289 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k3euq-0001Hu-2Y; Thu, 06 Aug 2020 12:22:36 +0000
Date: Thu, 6 Aug 2020 20:22:05 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Subject: [drm-tip:drm-tip 6/10] drivers/gpu/drm/nouveau/nouveau_bo.c:750:25:
 error: incompatible function pointer types initializing 'int nouveau_channel
 struct ttm_buffer_object struct ttm_resource struct ttm_resource with an
 expression of type 'int (struct nouv...
Message-ID: <202008062002.TPshMtEG%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Jani Nikula <jani.nikula@intel.com>, clang-built-linux@googlegroups.com,
 intel-gfx@lists.freedesktop.org, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
head:   f39035176cb854c6d620af7614a60a485ee26818
commit: ad11f45fae37631b0482ebf6543bdd013d3f9336 [6/10] Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip
config: x86_64-randconfig-a015-20200806 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 076b120bebfd727b502208601012a44ab2e1028e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        git checkout ad11f45fae37631b0482ebf6543bdd013d3f9336
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/nouveau/nouveau_drm.c:52:
   In file included from drivers/gpu/drm/nouveau/nouveau_dma.h:30:
>> drivers/gpu/drm/nouveau/nouveau_bo.h:142:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:146:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:149:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:152:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:156:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:159:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:163:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   7 warnings generated.
--
   In file included from drivers/gpu/drm/nouveau/nouveau_bo.c:37:
>> drivers/gpu/drm/nouveau/nouveau_bo.h:142:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:146:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:149:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:152:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:156:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:159:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:163:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
>> drivers/gpu/drm/nouveau/nouveau_bo.c:750:25: error: incompatible function pointer types initializing 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' with an expression of type 'int (struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror,-Wincompatible-function-pointer-types]
                   {  "COPY", 4, 0xc5b5, nve0_bo_move_copy, nve0_bo_move_init },
                                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:751:25: error: incompatible function pointer types initializing 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' with an expression of type 'int (struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror,-Wincompatible-function-pointer-types]
                   {  "GRCE", 0, 0xc5b5, nve0_bo_move_copy, nvc0_bo_move_init },
                                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:752:25: error: incompatible function pointer types initializing 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' with an expression of type 'int (struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror,-Wincompatible-function-pointer-types]
                   {  "COPY", 4, 0xc3b5, nve0_bo_move_copy, nve0_bo_move_init },
                                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:753:25: error: incompatible function pointer types initializing 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' with an expression of type 'int (struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror,-Wincompatible-function-pointer-types]
                   {  "GRCE", 0, 0xc3b5, nve0_bo_move_copy, nvc0_bo_move_init },
                                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:754:25: error: incompatible function pointer types initializing 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' with an expression of type 'int (struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror,-Wincompatible-function-pointer-types]
                   {  "COPY", 4, 0xc1b5, nve0_bo_move_copy, nve0_bo_move_init },
                                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:755:25: error: incompatible function pointer types initializing 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' with an expression of type 'int (struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror,-Wincompatible-function-pointer-types]
                   {  "GRCE", 0, 0xc1b5, nve0_bo_move_copy, nvc0_bo_move_init },
                                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:756:25: error: incompatible function pointer types initializing 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' with an expression of type 'int (struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror,-Wincompatible-function-pointer-types]
                   {  "COPY", 4, 0xc0b5, nve0_bo_move_copy, nve0_bo_move_init },
                                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:757:25: error: incompatible function pointer types initializing 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' with an expression of type 'int (struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror,-Wincompatible-function-pointer-types]
                   {  "GRCE", 0, 0xc0b5, nve0_bo_move_copy, nvc0_bo_move_init },
                                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:758:25: error: incompatible function pointer types initializing 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' with an expression of type 'int (struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror,-Wincompatible-function-pointer-types]
                   {  "COPY", 4, 0xb0b5, nve0_bo_move_copy, nve0_bo_move_init },
                                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:759:25: error: incompatible function pointer types initializing 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' with an expression of type 'int (struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror,-Wincompatible-function-pointer-types]
                   {  "GRCE", 0, 0xb0b5, nve0_bo_move_copy, nvc0_bo_move_init },
                                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:760:25: error: incompatible function pointer types initializing 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' with an expression of type 'int (struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror,-Wincompatible-function-pointer-types]
                   {  "COPY", 4, 0xa0b5, nve0_bo_move_copy, nve0_bo_move_init },
                                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:761:25: error: incompatible function pointer types initializing 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' with an expression of type 'int (struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror,-Wincompatible-function-pointer-types]
                   {  "GRCE", 0, 0xa0b5, nve0_bo_move_copy, nvc0_bo_move_init },
                                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:762:25: error: incompatible function pointer types initializing 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' with an expression of type 'int (struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror,-Wincompatible-function-pointer-types]
                   { "COPY1", 5, 0x90b8, nvc0_bo_move_copy, nvc0_bo_move_init },
                                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:763:25: error: incompatible function pointer types initializing 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' with an expression of type 'int (struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror,-Wincompatible-function-pointer-types]
                   { "COPY0", 4, 0x90b5, nvc0_bo_move_copy, nvc0_bo_move_init },
                                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:764:25: error: incompatible function pointer types initializing 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' with an expression of type 'int (struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror,-Wincompatible-function-pointer-types]
                   {  "COPY", 0, 0x85b5, nva3_bo_move_copy, nv50_bo_move_init },
                                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:765:25: error: incompatible function pointer types initializing 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' with an expression of type 'int (struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror,-Wincompatible-function-pointer-types]
                   { "CRYPT", 0, 0x74c1, nv84_bo_move_exec, nv50_bo_move_init },
                                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:766:25: error: incompatible function pointer types initializing 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' with an expression of type 'int (struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror,-Wincompatible-function-pointer-types]
                   {  "M2MF", 0, 0x9039, nvc0_bo_move_m2mf, nvc0_bo_move_init },
                                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:767:25: error: incompatible function pointer types initializing 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' with an expression of type 'int (struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror,-Wincompatible-function-pointer-types]
                   {  "M2MF", 0, 0x5039, nv50_bo_move_m2mf, nv50_bo_move_init },
                                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:768:25: error: incompatible function pointer types initializing 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' with an expression of type 'int (struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror,-Wincompatible-function-pointer-types]
                   {  "M2MF", 0, 0x0039, nv04_bo_move_m2mf, nv04_bo_move_init },
                                         ^~~~~~~~~~~~~~~~~
   7 warnings and 19 errors generated.
--
   In file included from drivers/gpu/drm/nouveau/nouveau_bo0039.c:29:
>> drivers/gpu/drm/nouveau/nouveau_bo.h:142:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:146:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:149:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:152:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:156:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:159:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:163:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
>> drivers/gpu/drm/nouveau/nouveau_bo0039.c:39:46: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct nouveau_channel *chan, struct ttm_mem_reg *reg)
                                                              ^
>> drivers/gpu/drm/nouveau/nouveau_bo0039.c:41:9: error: incomplete definition of type 'struct ttm_mem_reg'
           if (reg->mem_type == TTM_PL_TT)
               ~~~^
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:39:46: note: forward declaration of 'struct ttm_mem_reg'
                         struct nouveau_channel *chan, struct ttm_mem_reg *reg)
                                                              ^
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:48:12: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                     struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
                            ^
>> drivers/gpu/drm/nouveau/nouveau_bo0039.c:47:1: error: conflicting types for 'nv04_bo_move_m2mf'
   nv04_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
   ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:141:5: note: previous declaration is here
   int nv04_bo_move_m2mf(struct nouveau_channel *, struct ttm_buffer_object *,
       ^
>> drivers/gpu/drm/nouveau/nouveau_bo0039.c:51:51: error: incompatible pointer types passing 'struct ttm_mem_reg *' to parameter of type 'struct ttm_mem_reg *' [-Werror,-Wincompatible-pointer-types]
           u32 src_ctxdma = nouveau_bo_mem_ctxdma(bo, chan, old_reg);
                                                            ^~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:39:59: note: passing argument to parameter 'reg' here
                         struct nouveau_channel *chan, struct ttm_mem_reg *reg)
                                                                           ^
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:52:26: error: incomplete definition of type 'struct ttm_mem_reg'
           u32 src_offset = old_reg->start << PAGE_SHIFT;
                            ~~~~~~~^
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:48:12: note: forward declaration of 'struct ttm_mem_reg'
                     struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
                            ^
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:53:51: error: incompatible pointer types passing 'struct ttm_mem_reg *' to parameter of type 'struct ttm_mem_reg *' [-Werror,-Wincompatible-pointer-types]
           u32 dst_ctxdma = nouveau_bo_mem_ctxdma(bo, chan, new_reg);
                                                            ^~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:39:59: note: passing argument to parameter 'reg' here
                         struct nouveau_channel *chan, struct ttm_mem_reg *reg)
                                                                           ^
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:54:26: error: incomplete definition of type 'struct ttm_mem_reg'
           u32 dst_offset = new_reg->start << PAGE_SHIFT;
                            ~~~~~~~^
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:48:12: note: forward declaration of 'struct ttm_mem_reg'
                     struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
                            ^
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:55:26: error: incomplete definition of type 'struct ttm_mem_reg'
           u32 page_count = new_reg->num_pages;
                            ~~~~~~~^
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:48:12: note: forward declaration of 'struct ttm_mem_reg'
                     struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
                            ^
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:65:22: error: incomplete definition of type 'struct ttm_mem_reg'
           page_count = new_reg->num_pages;
                        ~~~~~~~^
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:48:12: note: forward declaration of 'struct ttm_mem_reg'
                     struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
                            ^
   9 warnings and 8 errors generated.
--
   In file included from drivers/gpu/drm/nouveau/nouveau_bo5039.c:29:
>> drivers/gpu/drm/nouveau/nouveau_bo.h:142:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:146:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:149:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:152:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:156:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:159:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:163:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
>> drivers/gpu/drm/nouveau/nouveau_bo5039.c:40:12: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                     struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
                            ^
>> drivers/gpu/drm/nouveau/nouveau_bo5039.c:39:1: error: conflicting types for 'nv50_bo_move_m2mf'
   nv50_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
   ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:145:5: note: previous declaration is here
   int nv50_bo_move_m2mf(struct nouveau_channel *, struct ttm_buffer_object *,
       ^
>> drivers/gpu/drm/nouveau/nouveau_bo5039.c:42:40: error: incompatible pointer types passing 'struct ttm_mem_reg *' to parameter of type 'struct ttm_resource *' [-Werror,-Wincompatible-pointer-types]
           struct nouveau_mem *mem = nouveau_mem(old_reg);
                                                 ^~~~~~~
   drivers/gpu/drm/nouveau/nouveau_mem.h:10:34: note: passing argument to parameter 'reg' here
   nouveau_mem(struct ttm_resource *reg)
                                    ^
>> drivers/gpu/drm/nouveau/nouveau_bo5039.c:44:23: error: incomplete definition of type 'struct ttm_mem_reg'
           u64 length = (new_reg->num_pages << PAGE_SHIFT);
                         ~~~~~~~^
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:40:12: note: forward declaration of 'struct ttm_mem_reg'
                     struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
                            ^
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:48:32: error: incompatible pointer types passing 'struct ttm_mem_reg *' to parameter of type 'struct ttm_resource *' [-Werror,-Wincompatible-pointer-types]
           int dst_tiled = !!nouveau_mem(new_reg)->kind;
                                         ^~~~~~~
   drivers/gpu/drm/nouveau/nouveau_mem.h:10:34: note: passing argument to parameter 'reg' here
   nouveau_mem(struct ttm_resource *reg)
                                    ^
   8 warnings and 4 errors generated.
--
   In file included from drivers/gpu/drm/nouveau/nouveau_bo74c1.c:29:
>> drivers/gpu/drm/nouveau/nouveau_bo.h:142:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:146:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:149:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:152:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:156:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:159:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:163:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
>> drivers/gpu/drm/nouveau/nouveau_bo74c1.c:37:12: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                     struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
                            ^
>> drivers/gpu/drm/nouveau/nouveau_bo74c1.c:36:1: error: conflicting types for 'nv84_bo_move_exec'
   nv84_bo_move_exec(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
   ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:148:5: note: previous declaration is here
   int nv84_bo_move_exec(struct nouveau_channel *, struct ttm_buffer_object *,
       ^
>> drivers/gpu/drm/nouveau/nouveau_bo74c1.c:39:40: error: incompatible pointer types passing 'struct ttm_mem_reg *' to parameter of type 'struct ttm_resource *' [-Werror,-Wincompatible-pointer-types]
           struct nouveau_mem *mem = nouveau_mem(old_reg);
                                                 ^~~~~~~
   drivers/gpu/drm/nouveau/nouveau_mem.h:10:34: note: passing argument to parameter 'reg' here
   nouveau_mem(struct ttm_resource *reg)
                                    ^
>> drivers/gpu/drm/nouveau/nouveau_bo74c1.c:47:41: error: incomplete definition of type 'struct ttm_mem_reg'
           PUSH_NVSQ(push, NV74C1, 0x0304, new_reg->num_pages << PAGE_SHIFT,
                                           ~~~~~~~^
   drivers/gpu/drm/nouveau/include/nvif/push.h:272:38: note: expanded from macro 'PUSH_NVSQ'
   #define PUSH_NVSQ(A...) PUSH(MTHD, ##A)
                                        ^
   drivers/gpu/drm/nouveau/include/nvif/push.h:262:31: note: expanded from macro 'PUSH'
                               PUSH_1P , PUSH_1D)(, ##A)
                                                      ^
   drivers/gpu/drm/nouveau/include/nvif/push.h:202:19: note: expanded from macro 'PUSH_6D'
                                                X##mA, (dA))
                                                        ^~
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/gpu/drm/nouveau/include/nvif/push.h:128:33: note: expanded from macro 'PUSH_1'
           PUSH_##f(X, (p), X##mA, 1, o, (dA), ds, "");                   \
                                          ^~
   drivers/gpu/drm/nouveau/include/nvif/push.h:91:62: note: expanded from macro 'PUSH_DATA_'
   #define PUSH_DATA_(X,p,m,i0,i1,d,s,f,a...) PUSH_DATA__((p), (d), "-> "#m f, ##a)
                                                                ^
   drivers/gpu/drm/nouveau/include/nvif/push.h:84:12: note: expanded from macro 'PUSH_DATA__'
           u32 _d = (d);                                      \
                     ^
   drivers/gpu/drm/nouveau/nouveau_bo74c1.c:37:12: note: forward declaration of 'struct ttm_mem_reg'
                     struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
                            ^
   8 warnings and 3 errors generated.
--
   In file included from drivers/gpu/drm/nouveau/nouveau_bo85b5.c:29:
>> drivers/gpu/drm/nouveau/nouveau_bo.h:142:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:146:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:149:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:152:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:156:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:159:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:163:16: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                         struct ttm_mem_reg *, struct ttm_mem_reg *);
                                ^
>> drivers/gpu/drm/nouveau/nouveau_bo85b5.c:41:12: warning: declaration of 'struct ttm_mem_reg' will not be visible outside of this function [-Wvisibility]
                     struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
                            ^
>> drivers/gpu/drm/nouveau/nouveau_bo85b5.c:40:1: error: conflicting types for 'nva3_bo_move_copy'
   nva3_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
   ^
   drivers/gpu/drm/nouveau/nouveau_bo.h:151:5: note: previous declaration is here
   int nva3_bo_move_copy(struct nouveau_channel *, struct ttm_buffer_object *,
       ^
>> drivers/gpu/drm/nouveau/nouveau_bo85b5.c:43:40: error: incompatible pointer types passing 'struct ttm_mem_reg *' to parameter of type 'struct ttm_resource *' [-Werror,-Wincompatible-pointer-types]
           struct nouveau_mem *mem = nouveau_mem(old_reg);
                                                 ^~~~~~~
   drivers/gpu/drm/nouveau/nouveau_mem.h:10:34: note: passing argument to parameter 'reg' here
   nouveau_mem(struct ttm_resource *reg)
                                    ^
>> drivers/gpu/drm/nouveau/nouveau_bo85b5.c:47:26: error: incomplete definition of type 'struct ttm_mem_reg'
           u32 page_count = new_reg->num_pages;
                            ~~~~~~~^
   drivers/gpu/drm/nouveau/nouveau_bo85b5.c:41:12: note: forward declaration of 'struct ttm_mem_reg'
                     struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
                            ^
   drivers/gpu/drm/nouveau/nouveau_bo85b5.c:50:22: error: incomplete definition of type 'struct ttm_mem_reg'
           page_count = new_reg->num_pages;
                        ~~~~~~~^
   drivers/gpu/drm/nouveau/nouveau_bo85b5.c:41:12: note: forward declaration of 'struct ttm_mem_reg'
                     struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
                            ^
   8 warnings and 4 errors generated.
..

vim +750 drivers/gpu/drm/nouveau/nouveau_bo.c

6ee738610f41b5 Ben Skeggs  2009-12-11  737  
d1b167e168bdac Ben Skeggs  2012-05-04  738  void
49981046e3dc2f Ben Skeggs  2012-08-06  739  nouveau_bo_move_init(struct nouveau_drm *drm)
d1b167e168bdac Ben Skeggs  2012-05-04  740  {
72ecb0a6ce89dd James Jones 2019-12-16  741  	static const struct _method_table {
d1b167e168bdac Ben Skeggs  2012-05-04  742  		const char *name;
1a46098e910b96 Ben Skeggs  2012-05-04  743  		int engine;
315a8b2edf5171 Ben Skeggs  2015-08-20  744  		s32 oclass;
d1b167e168bdac Ben Skeggs  2012-05-04  745  		int (*exec)(struct nouveau_channel *,
d1b167e168bdac Ben Skeggs  2012-05-04  746  			    struct ttm_buffer_object *,
2966141ad2dda2 Dave Airlie 2020-08-04  747  			    struct ttm_resource *, struct ttm_resource *);
d1b167e168bdac Ben Skeggs  2012-05-04  748  		int (*init)(struct nouveau_channel *, u32 handle);
d1b167e168bdac Ben Skeggs  2012-05-04  749  	} _methods[] = {
c36322d23d5d84 Ben Skeggs  2018-12-11 @750  		{  "COPY", 4, 0xc5b5, nve0_bo_move_copy, nve0_bo_move_init },
c36322d23d5d84 Ben Skeggs  2018-12-11  751  		{  "GRCE", 0, 0xc5b5, nve0_bo_move_copy, nvc0_bo_move_init },
6e1f34e33c17f6 Ben Skeggs  2018-05-08  752  		{  "COPY", 4, 0xc3b5, nve0_bo_move_copy, nve0_bo_move_init },
6e1f34e33c17f6 Ben Skeggs  2018-05-08  753  		{  "GRCE", 0, 0xc3b5, nve0_bo_move_copy, nvc0_bo_move_init },
146cfe2476ce37 Ben Skeggs  2016-07-09  754  		{  "COPY", 4, 0xc1b5, nve0_bo_move_copy, nve0_bo_move_init },
146cfe2476ce37 Ben Skeggs  2016-07-09  755  		{  "GRCE", 0, 0xc1b5, nve0_bo_move_copy, nvc0_bo_move_init },
8e7e1586c58a5e Ben Skeggs  2016-07-09  756  		{  "COPY", 4, 0xc0b5, nve0_bo_move_copy, nve0_bo_move_init },
8e7e1586c58a5e Ben Skeggs  2016-07-09  757  		{  "GRCE", 0, 0xc0b5, nve0_bo_move_copy, nvc0_bo_move_init },
990b4547042a94 Ben Skeggs  2015-04-14  758  		{  "COPY", 4, 0xb0b5, nve0_bo_move_copy, nve0_bo_move_init },
990b4547042a94 Ben Skeggs  2015-04-14  759  		{  "GRCE", 0, 0xb0b5, nve0_bo_move_copy, nvc0_bo_move_init },
00fc6f6f731efb Ben Skeggs  2013-07-09  760  		{  "COPY", 4, 0xa0b5, nve0_bo_move_copy, nve0_bo_move_init },
49981046e3dc2f Ben Skeggs  2012-08-06  761  		{  "GRCE", 0, 0xa0b5, nve0_bo_move_copy, nvc0_bo_move_init },
1a46098e910b96 Ben Skeggs  2012-05-04  762  		{ "COPY1", 5, 0x90b8, nvc0_bo_move_copy, nvc0_bo_move_init },
1a46098e910b96 Ben Skeggs  2012-05-04  763  		{ "COPY0", 4, 0x90b5, nvc0_bo_move_copy, nvc0_bo_move_init },
1a46098e910b96 Ben Skeggs  2012-05-04  764  		{  "COPY", 0, 0x85b5, nva3_bo_move_copy, nv50_bo_move_init },
1a46098e910b96 Ben Skeggs  2012-05-04  765  		{ "CRYPT", 0, 0x74c1, nv84_bo_move_exec, nv50_bo_move_init },
1a46098e910b96 Ben Skeggs  2012-05-04  766  		{  "M2MF", 0, 0x9039, nvc0_bo_move_m2mf, nvc0_bo_move_init },
1a46098e910b96 Ben Skeggs  2012-05-04  767  		{  "M2MF", 0, 0x5039, nv50_bo_move_m2mf, nv50_bo_move_init },
1a46098e910b96 Ben Skeggs  2012-05-04  768  		{  "M2MF", 0, 0x0039, nv04_bo_move_m2mf, nv04_bo_move_init },
5490e5dfb9e9d6 Ben Skeggs  2012-05-04  769  		{},
72ecb0a6ce89dd James Jones 2019-12-16  770  	};
72ecb0a6ce89dd James Jones 2019-12-16  771  	const struct _method_table *mthd = _methods;
d1b167e168bdac Ben Skeggs  2012-05-04  772  	const char *name = "CPU";
d1b167e168bdac Ben Skeggs  2012-05-04  773  	int ret;
d1b167e168bdac Ben Skeggs  2012-05-04  774  
d1b167e168bdac Ben Skeggs  2012-05-04  775  	do {
49981046e3dc2f Ben Skeggs  2012-08-06  776  		struct nouveau_channel *chan;
ebb945a94bba2c Ben Skeggs  2012-07-20  777  
00fc6f6f731efb Ben Skeggs  2013-07-09  778  		if (mthd->engine)
49981046e3dc2f Ben Skeggs  2012-08-06  779  			chan = drm->cechan;
49981046e3dc2f Ben Skeggs  2012-08-06  780  		else
49981046e3dc2f Ben Skeggs  2012-08-06  781  			chan = drm->channel;
49981046e3dc2f Ben Skeggs  2012-08-06  782  		if (chan == NULL)
49981046e3dc2f Ben Skeggs  2012-08-06  783  			continue;
49981046e3dc2f Ben Skeggs  2012-08-06  784  
9ac596a4e875e2 Ben Skeggs  2020-03-30  785  		ret = nvif_object_ctor(&chan->user, "ttmBoMove",
0ad72863ea426d Ben Skeggs  2014-08-10  786  				       mthd->oclass | (mthd->engine << 16),
0ad72863ea426d Ben Skeggs  2014-08-10  787  				       mthd->oclass, NULL, 0,
0ad72863ea426d Ben Skeggs  2014-08-10  788  				       &drm->ttm.copy);
d1b167e168bdac Ben Skeggs  2012-05-04  789  		if (ret == 0) {
0ad72863ea426d Ben Skeggs  2014-08-10  790  			ret = mthd->init(chan, drm->ttm.copy.handle);
ebb945a94bba2c Ben Skeggs  2012-07-20  791  			if (ret) {
9ac596a4e875e2 Ben Skeggs  2020-03-30  792  				nvif_object_dtor(&drm->ttm.copy);
ebb945a94bba2c Ben Skeggs  2012-07-20  793  				continue;
ebb945a94bba2c Ben Skeggs  2012-07-20  794  			}
ebb945a94bba2c Ben Skeggs  2012-07-20  795  
ebb945a94bba2c Ben Skeggs  2012-07-20  796  			drm->ttm.move = mthd->exec;
1bb3f6a252c92c Ben Skeggs  2013-07-08  797  			drm->ttm.chan = chan;
d1b167e168bdac Ben Skeggs  2012-05-04  798  			name = mthd->name;
d1b167e168bdac Ben Skeggs  2012-05-04  799  			break;
d1b167e168bdac Ben Skeggs  2012-05-04  800  		}
d1b167e168bdac Ben Skeggs  2012-05-04  801  	} while ((++mthd)->exec);
d1b167e168bdac Ben Skeggs  2012-05-04  802  
ebb945a94bba2c Ben Skeggs  2012-07-20  803  	NV_INFO(drm, "MM: using %s for buffer copies\n", name);
d1b167e168bdac Ben Skeggs  2012-05-04  804  }
d1b167e168bdac Ben Skeggs  2012-05-04  805  

:::::: The code at line 750 was first introduced by commit
:::::: c36322d23d5d84cbe03c93beaa5dd6c705d48122 drm/nouveau/ce/tu104: initial support

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--ibTvN161/egqYuK8
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
o4+WV0qj5apUEaWjYT+q/wNu4sK2Zg4CAA==

--ibTvN161/egqYuK8
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--ibTvN161/egqYuK8--
